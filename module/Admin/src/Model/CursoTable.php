<?php 
namespace Admin\Model;

use RuntimeException;
use Zend\Db\TableGateway\TableGatewayInterface;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Db\ResultSet\ResultSet;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;
use Zend\Db\Sql\Expression;
use Admin\Entity\Curso;


class CursoTable
{
    private $tableGateway;

    public function __construct(TableGatewayInterface $tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function obtenerTodo($paginado = false)
    {
        if ($paginado) {
            
            $select = new Select("curso");

            $resultSetPrototype = new ResultSet();
            $resultSetPrototype->setArrayObjectPrototype(new Curso());

            $paginatorAdapter = new DbSelect($select, $this->tableGateway->getAdapter(),$resultSetPrototype);
            
            $paginator = new Paginator($paginatorAdapter);
            
            return $paginator;
        }

        $resultSet = $this->tableGateway->select();
        return $resultSet;
    }
    

    public function obtenerCurso($codCurso)
    {
        $codCurso = (int) $codCurso;
        $rowset = $this->tableGateway->select(['codCurso' => $codCurso]);
        $row = $rowset->current();
        
        if (! $row) {
            throw new RuntimeException(sprintf(
                'No se puede encontrar una fila con el identificador %d', $codCurso
            ));
        }

        return $row;
    }
    
    public function obtenerCursosPorCodEscuela($codEscuela)
    {
        $codEscuela = (int) $codEscuela;
        
        $resulset = $this->tableGateway->select(['codEscuela' => $codEscuela]);
        
        if (! $resulset) {
            throw new RuntimeException(sprintf(
                'No se puede encontrar una columna con el identificador %d', $codEscuela
                ));
        }
        
        return $resulset;
    }

    public function guardarCurso(Curso $curso)
    {
        $data = [
            'nombreCurso'   => $curso->nombreCurso,
            'semestre'      => $curso->semestre,
            'escuela'       => $curso->escuela
            
        ];

        $codCurso = (int) $curso->codCurso;

        if ($curso === 0) {
            $this->tableGateway->insert($data);
            return $this->tableGateway->lastInsertValue;
        }
        
        if (! $this->obtenerQuimico($codCurso)) {
            throw new RuntimeException(sprintf(
                'No se puede actualizar la fila con el identidicador %d; no existe', $codCurso
                ));
        }
        
        $this->tableGateway->update($data, ['codCurso' => $codCurso]);
        
        return $codCurso;
    }

    public function eliminarCurso($codCurso)
    {
        return $this->tableGateway->delete(['codCurso' => (int) $codCurso]);
    }
}

