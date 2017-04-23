<?php

$sep = DIRECTORY_SEPARATOR;
include_once(dirname(__FILE__) . "{$sep}bootstrap.php");

$customersList = GetCustomersList($db);

/**
 * Gets list with notaries info.
 *
 * @throws \PDOException in case of PDO error.
 *
 * @return array list with notaries.
 */
function GetCustomersList(PDO $db)
{
    $sql = $db->prepare('SELECT surname, name, patronymic, date_birth, phone_number, series_passport, passport_number, issued, date_issue FROM customer');
    try {
        $sql->execute();
    } catch (\PDOException $e) {
        \core\Logger::CatchError("index error. Info about error: {$e->errorInfo[2]}");
    }

    return $sql->fetchAll();
}

include_once(VIEW_PATH . 'customer.php');
