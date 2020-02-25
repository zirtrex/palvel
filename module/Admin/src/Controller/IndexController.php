<?php

namespace Admin\Controller;

use RuntimeException;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Interop\Container\ContainerInterface;
use Zend\Json\Json;
use Admin\Entity\Usuario;
use Admin\Model\Miscellanea;
use Admin\Model\UsuarioTable;
use Admin\Model\CursoTable;
use Admin\Model\QuimicoTable;
use Admin\Model\RequerimientoTable;
use Admin\Form\PagoForm;
use Admin\Form\Filter\PagoFilter;
use Admin\Form\TerrenoForm;
use Admin\Form\Filter\TerrenoFilter;

class IndexController extends AbstractActionController 
{
    private $container;
    private $usuarioTable;
    private $cursoTable;
    private $quimicoTable;
    private $requerimientoTable;
    
    
    public function __construct(ContainerInterface $container,
        UsuarioTable $usuarioTable,
        CursoTable $cursoTable,
        QuimicoTable $quimicoTable,
        RequerimientoTable $requerimientoTable)
    {
        $this->container    = $container;
        $this->usuarioTable = $usuarioTable;
        $this->cursoTable   = $cursoTable;
        $this->quimicoTable = $quimicoTable;
        $this->requerimientoTable   = $requerimientoTable;
    }
    
    public function indexAction()
    {
        $pedidos = $this->requerimientoTable->obtenerSumaPedidos(null, array('codQuimico', 'semestre'), Miscellanea::SEMESTRE);
        
        return new ViewModel([
            'pedidos' => $pedidos,
            //'pedidos' => Json::encode($terrenos, Json::TYPE_ARRAY),
            //'messages' => $this->flashmessenger()->getMessages(),
            //'errorMessages' => $this->flashmessenger()->getErrorMessages()
        ]);
    }
    
    /*
    public function listarUsuariosAction()
    {
       
        $docentes = $this->requerimientoTable->obtenerUsuariosConRequerimientos();        
        
        return new ViewModel([
            'docentes' => $docentes,
            'messages' => $this->flashmessenger()->getMessages(),
            'errorMessages' => $this->flashmessenger()->getErrorMessages()
        ]);
    }
    
    
    
    public function listarPedidosAction()
    {
        
        $codUsuario = (int) $this->params()->fromRoute('codusuario', 0);
        $codCurso = (int) $this->params()->fromRoute('codcurso', 0);
        
        $requerimientos = $this->requerimientoTable->obtenerRequerimientosByCodigos($codUsuario, null, null, ['tipo' => 'ASC']);        
        
        return new ViewModel([
            'codUsuario' => $codUsuario,
            'requerimientos' => $requerimientos,
            'messages' => $this->flashmessenger()->getMessages(),
            'errorMessages' => $this->flashmessenger()->getErrorMessages()
        ]);
    }*/
    
    
}
