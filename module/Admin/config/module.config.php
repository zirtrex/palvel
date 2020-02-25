<?php
/**
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2016 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Admin;

use Zend\Router\Http\Literal;
use Zend\Router\Http\Segment;
use Zend\ServiceManager\Factory\InvokableFactory;
use Users;
use Zend\Session\SessionManager;
use Admin\Factory\SessionManagerFactory;

return [
    'router' => [
        'routes' => [
            'home' => [
                'type' => Literal::class,
                'options' => [
                    'route'    => '/',
                    'defaults' => [
                        'controller' => Controller\IndexController::class,
                        'action'     => 'index',
                    ],
                ],
            ],
            'admin' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/admin[/:action][/:codusuario][/:semestre][/:codescuela][/:codcurso][/page/:page][/orderby/:orderby][/:order]',
                    'constraints' => [
                        'action'        => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'codusuario'    => '[0-9]+',
                        'semestre'          => '[a-zA-Z0-9_-]*',
                        'codescuela'        => '[0-9]+',
                        'codcurso'      => '[0-9]+',
                        'docente'       => '[a-zA-Z]',
                        'page'          => '[0-9]+',
                        'orderby'       => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'order'         => 'ASC|DESC'
                    ],
                    'defaults' => [
                        'controller' => Controller\AdminController::class,
                        'action'     => 'index',
                    ],
                ]
            ]
           
        ]
    ],
    
    'module_config' => array (
        'upload_location' => __DIR__ . '/../../../public/comprobantes'
    ),
    
    'service_manager' => [
        'factories' => [
            SessionManager::class => SessionManagerFactory::class,
            Users\Storage\AuthStorage::class => \Zend\ServiceManager\Factory\InvokableFactory::class,
            \Zend\Authentication\AuthenticationService::class => Users\Factory\Storage\AuthenticationServiceFactory::class,
            \Admin\Acl\Acl::class => function ($container) {
                $config = include __DIR__ . '/acl.config.php';
                return new \Admin\Acl\Acl ( $config );
            } 
        ],
    ],
    
    'controllers' => [
        'factories' => [
            //Controller\ReporteController::class => InvokableFactory::class,
        ],
    ],
    'view_manager' => [
        'display_not_found_reason' => true,
        'display_exceptions'       => true,
        'doctype'                  => 'HTML5',
        'not_found_template'       => 'error/404',
        'exception_template'       => 'error/index',
        'template_map' => [
            'layout/layout'         => __DIR__ . '/../view/layout/layout.phtml',
            'admin/index/index'     => __DIR__ . '/../view/admin/index/index.phtml',
            'error/404'             => __DIR__ . '/../view/error/404.phtml',
            'error/index'           => __DIR__ . '/../view/error/index.phtml',
        ],
        'template_path_stack' => [
            __DIR__ . '/../view',
        ],
    ],
    
    'navigation' => [
        'default' => array(
            array(
                'label' => 'Inicio',
                'route' => 'home',
            ),
            array(
                'label' => 'Mis Pedidos',
                'route' => 'docente',
                'action' => 'ver-cursos',
            ),
            array(
                'label' => 'Nuevo Pedido',
                'route' => 'docente',
                'action' => 'nuevo-pedido',
            ),
            array(
                'label' => 'Perfil',
                'route' => 'perfil'
            )
        ),
    ],
];
