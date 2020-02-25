<?php

namespace Reporte\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use DOMPDFModule\View\Model\PdfModel;
use Interop\Container\ContainerInterface;
use Admin\Model\UsuarioTable;
use Admin\Model\CursoTable;
use Admin\Model\QuimicoTable;
use Admin\Model\RequerimientoTable;
use Admin\Model\Miscellanea;
use Admin\Entity\Curso;
use Admin\Model\EscuelaTable;
use Admin\Model\DepartamentoTable;
use Admin\Entity\Escuela;
use Admin\Entity\Departamento;


class IndexController extends AbstractActionController
{
    private $container;
    private $usuarioTable;
    private $escuelaTable;
    private $departamentoTable;
    private $cursoTable;
    private $quimicoTable;
    private $requerimientoTable;
    
    public function __construct(ContainerInterface $container,
        UsuarioTable $usuarioTable,
        EscuelaTable $escuelaTable,
        DepartamentoTable $departamentoTable,
        CursoTable $cursoTable,
        QuimicoTable $quimicoTable,
        RequerimientoTable $requerimientoTable)
    {
        $this->container            = $container;
        $this->usuarioTable         = $usuarioTable;
        $this->escuelaTable         = $escuelaTable;
        $this->departamentoTable    = $departamentoTable;
        $this->cursoTable           = $cursoTable;
        $this->quimicoTable         = $quimicoTable;
        $this->requerimientoTable   = $requerimientoTable;
    }
    
	public function primerReportePdfAction()
	{
		if($this->identity())
		{
		    $pedidos = $this->requerimientoTable->obtenerSumaPedidos(null, array('codQuimico', 'semestre'), Miscellanea::SEMESTRE);
			
			//Recibimos los parámetros por url
			$imprimirpdf = $this->params()->fromRoute('imprimirpdf');			
			
			//\Zend\Debug\Debug::dump($pedidos); return;
			
			if($imprimirpdf == 'si')
			{
				$pdf = new PdfModel();
				$pdf->setTerminal(true);
				$pdf->setTemplate('reporte/index/primer-reporte-pdf.phtml');
				$pdf->setOption('filename', 'Listado_general_de_requerimientos'); // Esta opcion fuerza la descarga del PDF.
				//$pdf->setOption('display', PdfModel::DISPLAY_ATTACHMENT);
				// La extension ".pdf" se agrega automaticamente
				$pdf->setOption('paperSize', 'a4'); // Tamaño del papel
				$pdf->setOption('paperOrientation', 'portrait'); // Defaults to "portrait"
					
				// Pasamos variables a la vista
				$pdf->setVariables(array(
				    'pedidos' => $pedidos,
				));
			
				return $pdf;
			}
			
		}	
		return $this->redirect()->toRoute('ingresar');
	}
	
	public function segundoReportePdfAction()
	{
	    if($this->identity())
	    {
	        $codUsuario        = (int) $this->params()->fromRoute('codusuario', 0);
	        $semestre          = (String) $this->params()->fromRoute('semestre', '');
	        $codEscuela        = (int) $this->params()->fromRoute('codescuela', 0);
	        $codCurso          = (int) $this->params()->fromRoute('codcurso', 0);
	        
	        $usuario = $this->usuarioTable->obtenerUsuario($codUsuario);
	        
	        if($codEscuela != 0){
	            $escuela = $this->escuelaTable->obtenerEscuela($codEscuela);
	        }else{
	            $escuela = new Escuela();
	            $escuela->nombreEscuela = "-";
	        }	        
	        
	        if($codCurso != 0){
	            $curso = $this->cursoTable->obtenerCurso($codCurso);
	        }else{
	            $curso = new Curso();
	            $curso->nombreCurso = "Se listan los pedidos de todos los cursos";
	        }
	        
	        //obtenerRequerimientosByCodigos($semestre = null, $codUsuario = null, $codEscuela = null, $codDepartamento = null, $codCurso = null, $codQuimico = null, $orderBy = array('codUsuario' => 'ASC'))
	        $pedidos = $this->requerimientoTable->obtenerRequerimientosByCodigosAndSemestre($semestre, $codUsuario, $escuela->codEscuela, $curso->codCurso, null, ['semestre', 'tipo' => 'ASC']);
	        
	        //Recibimos los parámetros por url
	        $imprimirpdf = $this->params()->fromRoute('imprimirpdf');
	        
	        //\Zend\Debug\Debug::dump($pedidos); return;
	        
            $docente = $usuario->nombres . "_" . $usuario->primerApellido;
	        
	        if($imprimirpdf == 'si')
	        {
	            $pdf = new PdfModel();
	            $pdf->setTerminal(true);
	            $pdf->setTemplate('reporte/index/segundo-reporte-pdf.phtml');
	            $pdf->setOption('filename', str_replace(" ", "_", $docente)); // Esta opcion fuerza la descarga del PDF.
	            //$pdf->setOption('display', PdfModel::DISPLAY_ATTACHMENT);
	            // La extension ".pdf" se agrega automaticamente
	            $pdf->setOption('paperSize', 'a4'); // Tamaño del papel
	            $pdf->setOption('paperOrientation', 'portrait'); // Defaults to "portrait"
	            
	            // Pasamos variables a la vista
	            $pdf->setVariables([
	                'usuario'          => $usuario,
	                'semestre'         => $semestre,
	                'codEscuela'       => $codEscuela,
	                'escuela'          => $escuela,
	                'codCurso'         => $codCurso,
	                'curso'            => $curso,
	                'pedidos'          => $pedidos
	            ]);
	            
	            return $pdf;
	        }
	        
	    }
	    return $this->redirect()->toRoute('ingresar');
	}
	
	
}









