<?php

$sep = DIRECTORY_SEPARATOR;
include_once(dirname(__FILE__) . "{$sep}bootstrap.php");

$landlordList = GetLandlordList($db);

/**
 * Gets landlord list.
 *
 * @throws \PDOException in case of PDO error.
 *
 * @return array landlords list.
 */
function GetLandlordList(PDO $db)
{
    $sql = $db->prepare('SELECT surname, name, patronymic, phone_number, number_title_document, series_passport, passport_number FROM carowners');
    try {
        $sql->execute();
    } catch (\PDOException $e) {
        \core\Logger::CatchError("index error. Info about error: {$e->errorInfo[2]}");
    }

    return $sql->fetchAll();
}

include_once(VIEW_PATH . 'index.php');
