<?php
namespace Registro;

use Zend\Router\Http\Segment;


return [
    'router' => [
        'routes' => [
            
            'docente' => [
                'type' => Segment::class,
                'options' => [
                    'route' => '/docente[/:action][/:semestre][/:codescuela][/:codcurso]',
                    'constraints' => [
                        'action'            => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'semestre'          => '[a-zA-Z0-9_-]*',
                        'codescuela'        => '[0-9]+',
                        'codcurso'          => '[0-9]+'
                    ],
                    'defaults' => [
                        'controller'    => Controller\IndexController::class,
                        'action'        => 'index'
                    ]
                ]
            ]       

        ]
    ],
    
    'service_manager' => [],
    
    'controllers' => [
        'factories' => []    
    ],
    
    'view_manager' => array(
        'template_path_stack' => array(
            'registro' => __DIR__ . '/../view'
        )
    )
];
