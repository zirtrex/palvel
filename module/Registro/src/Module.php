<?php
namespace Registro;

use Zend\ModuleManager\Feature\ConfigProviderInterface;
use Admin\Model\UsuarioTable;
use Admin\Model\CursoTable;
use Admin\Model\QuimicoTable;
use Admin\Model\RequerimientoTable;
use Admin\Model\EscuelaTable;
use Admin\Model\DepartamentoTable;


class Module implements ConfigProviderInterface
{

    public function getConfig()
    {
        return include __DIR__ . '/../config/module.config.php';
    }

    public function getAutoloaderConfig()
    {
        return array(
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__
                )
            )
        );
    }

    public function getControllerConfig()
    {
        return [
            'factories' => [
                Controller\IndexController::class => function ($container) {
                    return new Controller\IndexController(
                        $container,
                        $container->get(UsuarioTable::class),
                        $container->get(EscuelaTable::class),
                        $container->get(DepartamentoTable::class),
                        $container->get(CursoTable::class),
                        $container->get(QuimicoTable::class),
                        $container->get(RequerimientoTable::class)
                     );
                }
            ]
        ];
    }
}
















