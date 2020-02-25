<?php 
namespace Admin\Model;

use RuntimeException;
use Zend\Db\TableGateway\TableGatewayInterface;
use Zend\Db\Sql\Select;
use Zend\Db\ResultSet\ResultSet;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;
use Admin\Entity\Departamento;


class DepartamentoTable
{
    private $tableGateway;

    public function __construct(TableGatewayInterface $tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function obtenerTodo($paginado = false)
    {
        if ($paginado) {
            
            $select = new Select("departamento");

            $resultSetPrototype = new ResultSet();
            $resultSetPrototype->setArrayObjectPrototype(new Departamento());

            $paginatorAdapter = new DbSelect($select, $this->tableGateway->getAdapter(),$resultSetPrototype);
            
            $paginator = new Paginator($paginatorAdapter);
            
            return $paginator;
        }

        $resultSet = $this->tableGateway->select();
        return $resultSet;
    }
    

    public function obtenerDepartamento($codDepartamento)
    {
        $codDepartamento = (int) $codDepartamento;
        $rowset = $this->tableGateway->select(['codDepartamento' => $codDepartamento]);
        $row = $rowset->current();
        
        if (! $row) {
            throw new RuntimeException(sprintf(
                'No se puede encontrar una fila con el identificador %d', $codDepartamento
            ));
        }

        return $row;
    }
}

