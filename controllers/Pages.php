<?php
namespace App\Controllers;

class Pages extends BaseController {
    public function error_404() :void {
        $data = [
            'title' => '404 - Page not found'
        ];

        $this->view->render('templates/header', $data)
                   ->render('errors/404', $data)
                   ->render('templates/footer');
    }
}