<?php

return array(
    'acl' => array(
        'roles' => array(
            'invitado' => null,
            'docente' => null,
            'admin' => null
        ),
        'resources' => array(
            'allow' => array(
                
                Admin\Controller\IndexController::class=> array(
                    'index' => array(
                        'admin'
                    )
                ),
                
                Admin\Controller\AdminController::class=> array(
                    'index' => array(
                        'admin'
                    ),
                    'listar-usuarios' => array(
                        'admin'
                    ),
                    'listar-cursos' => array(
                        'admin'
                    ),
                    'listar-pedidos' => array(
                        'admin'
                    )
                ),
                
                Users\Controller\AuthController::class => array(
                    'index' => 'invitado',
                    'salir' => array(
                        'docente',
                        'admin'
                    )
                ),
                
                Users\Controller\PerfilController::class => array(
                    'index' => array(
                        'docente',
                        'admin'
                    ),
                    'editar-perfil' => array(
                        'docente',
                        'admin'
                    ),
                    'cambiar-clave' => array(
                        'docente',
                        'admin'
                    ),
                    'subir-imagen' => array(
                        'docente',
                        'admin'
                    )
                ),
                
                Users\Controller\ReestablecerClaveController::class => array(
                    'index' => 'invitado',
                    'confirmar-cambio-clave' => 'invitado'
                ),
                // agregado para ver pdf
                Users\Controller\RegistroController::class => array(
                    'index' => array(
                        'docente',
                        'admin'
                    ),
                    'pdf' => array(
                        'docente',
                        'admin'
                    )
                ),             
  
                Registro\Controller\IndexController::class => array(
                    'index' => array(
                        'docente'
                    ),
                    'ver-cursos' => array(
                        'docente'
                    ),
                    'ver-pedidos' => array(
                        'docente'
                    ),
                    
                    'nuevo-pedido' => array(
                        'docente'
                    ),                    
                    'guardar-pedidos-ajax' => array(
                        'docente'
                    ),
                    'obtener-escuelas-ajax' => array(
                        'docente'
                    ),
                    'obtener-departamentos-ajax' => array(
                        'docente'
                    ),
                    'obtener-quimicos-ajax' => array(
                        'docente'
                    ),
                    'obtener-cursos-ajax' => array(
                        'docente'
                    ),
                    'editar-pedido' => array(
                        'docente'
                    ),
                    'agregar-pedido-ajax' => array(
                        'docente'
                    ),
                    'actualizar-pedido-ajax' => array(
                        'docente'
                    ),
                    'remover-pedido-ajax' => array(
                        'docente'
                    ),
                ),
                
                Reporte\Controller\IndexController::class => [
                    
                    'primer-reporte-pdf' => [
                        'admin'
                    ],
                    
                    'segundo-reporte-pdf' => [
                        'docente',
                        'admin'
                    ]
                ]
            
            ),
            
            /*'deny' => array(
                
                'Users\Controller\Auth' => array(
                    'index' => array(
                        'docente',
                        'admin'
                    ),
                    'salir' => 'invitado'
                ),
                
                'Users\Controller\Perfil' => array(
                    'index' => 'invitado',
                    'editar-perfil' => 'invitado',
                    'cambiar-clave' => 'invitado',
                    'subir-imagen' => 'invitado'
                )
            
            )*/
        )
    )
);