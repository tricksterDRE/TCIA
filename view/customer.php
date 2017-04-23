<?php

/* @var \core\Site $site site module. */
/* @var array $customersList list of customers. */

$site->RenderHeader();
$site->StartContent();

/* Flashes */
if (true === $site->HasFlashes()) {
    $site->GetFlash();
}

/* Content */
$site->RenderLabel('Customers.', [
    'class' => 'data-table',
    'style' => 'font-size: 32px;',
]);

$columnNames = [
    'Surname',
    'Name',
    'Patronymic',
    'Date of birth',
    'Phone Number',
    'Series of passport',
    'Number of passport',
    'Issued',
    'Date of issue',
];

$site->RenderTable($columnNames, $customersList, [
    'class' => 'data-table',
    'style' => 'background-color: yellow;',
]);

$site->EndContent();
$site->RenderFooter();
