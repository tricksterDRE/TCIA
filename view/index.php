<?php

/* @var \core\Site $site site module. */
/* @var array $landlordList list of landlords. */

$site->RenderHeader();
$site->StartContent();

/* Flashes */
if (true === $site->HasFlashes()) {
    $site->GetFlash();
}

/* Content */

$site->RenderLabel('Car owners.', [
    'class' => 'data-table',
    'style' => 'font-size: 32px;',
]);

$columnNames = [
    'Surname',
    'Name',
    'Patronymic',
    'Phone Number',
    'VIN',
    'Series of passport',
    'Number of passport',
];


$site->RenderTable($columnNames, $landlordList, [
    'class' => 'data-table',
    'style' => 'background-color: lightgreen;',
]);

$site->EndContent();
$site->RenderFooter();
