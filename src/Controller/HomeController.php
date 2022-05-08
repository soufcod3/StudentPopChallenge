<?php

namespace App\Controller;

use DateInterval;
use DateTime;
use ErrorException;
use Exception;

require_once __DIR__ . "/../../config/config.php";

class HomeController extends AbstractController
{

    public function index(): string
    {
        return $this->twig->render('Home/index.html.twig');
    }
}
