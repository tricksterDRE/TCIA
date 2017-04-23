<?php

namespace model;

use core;

/**
 * Class Registration.
 * Registers user in the site.
 */
class Registration
{
    /**
     * User identity.
     *
     * @var Identity $identity user identity.
     */
    public $identity;

    /**
     * PDO database specimen.
     *
     * @var PDO $db PDO database specimen.
     */
    public $db;

    /**
     * Registers user in the system.
     *
     * @return bool true if user registered successfully;
     * false in other case.
     */
    public function Register()
    {
        if (null === $this->db) {
            \core\Logger::CatchError(get_class() . '::Register: Attempt to use \$db on null');
            return false;
        }
        if (null === $this->identity) {
            core\Logger::CatchError(get_class() . '::Register: Attempt to use \$identity on null');
            return false;
        }

        if (false === $this->InsertInRealtor()) {
            return false;
        }

        if (false === $this->InsertInUser($this->db->lastInsertId())) {
            return false;
        }

        return true;
    }

    /**
     * Inserts identity values in 'realtor' table.
     *
     * @throws PDOException in case of PDO error.
     *
     * @return bool true if insert was successful;
     * false in case of PDO error.
     */
    private function InsertInRealtor()
    {
        $sql = $this->db->prepare('INSERT INTO realtor(name, surname, patronymic, salary, phone_number) VALUES(:name, :surname, :patronymic, :salary, :phone_number)');
        $sql->bindParam(':name', $this->identity->name);
        $sql->bindParam(':surname', $this->identity->surname);
        $sql->bindParam(':patronymic', $this->identity->patronymic);
        $sql->bindParam(':phone_number', $this->identity->phone_number);
        
        try {
            $sql->execute();
        } catch (\PDOException $e) {
            $errorMessage = get_class() . "Registration::InsertInRealtor: PDOException was throwed during DB insertion. Information about error: {$e->errorInfo()[2]}";

            core\Logger::CatchError($erorMessage);
            return false;
        }

        return true;
    }

    /**
     * Inserts identity values in 'user' table.
     *
     * @param integer $id_realtor ID of realtor.
     *
     * @throws PDOException in case of PDO error.
     *
     * @return bool true if insert was successful;
     * false in case of PDO error.
     */
    private function InsertInUser($id_realtor)
    {
        $sql = $this->db->prepare('INSERT INTO user(email, password, id_realtor) VALUES(:email, :password, :id_realtor)');
        $sql->bindParam(':email', $this->identity->email);
        $sql->bindParam(':password', $this->identity->password);
        $sql->bindParam(':id_realtor', $id_realtor);
        
        try {
            $sql->execute();
        } catch (PDOException $e) {
            core\Logger::CatchError(get_class() ."::InsertInUser: PDOException was throwed during DB insertion. Information about error: {$e->errorInfo()[2]}");
            return false;
        }

        return true;
    }

    /**
     * Hash password of user.
     *
	 * @param string $password Password.
     *
	 * @return string Hashed password.
	 */
	private function HashPassword(string $password)
	{
		/* Create a random salt */
		$salt = strtr(base64_encode(mcrypt_create_iv(16, MCRYPT_DEV_URANDOM)), '+', '.');
		
		/*	"$2a$" means the Blowfish algorithm,
		 *	the following two digits are the cost parameter.
		 */
		$salt = sprintf("$2a$%02d$", 10) . $salt;
		
		return crypt($password, $salt);
	}
}
