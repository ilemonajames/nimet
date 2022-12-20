<?php


namespace App\V2\Model;

use App\AcademicSession;
use App\Lib\BaseTable;
use Laminas\Db\Sql\Select;

class AcademicSessionTable extends BaseTable {

    private $categoryList = [];
    private $parentList = [];
    private $childList = [];

    protected $tableName='academic_sessions';
    //protected $primary='course_category_id';

    public function getAllCategories(){
        $this->getCategoriesForParent(0);
        return $this->categoryList;
    }

    public function getAcademicSessionRecords($id){
        $select = new Select($this->tableName);
        $select->where(['id'=>$id]);
        //$select->join($this->getPrefix().'admins',$this->tableName.'.admin_id='.$this->getPrefix().'admins.id',['about']);
        //$select->join($this->getPrefix().'users',$this->getPrefix().'admins.user_id='.$this->getPrefix().'users.id',['name','email','user_picture'=>'picture','last_name']);
        return $this->tableGateway->selectWith($select);
    }

    public function getCategoryParent($id){
        $category = AcademicSession::find($id);
        if (!empty($category->parent_id)){
            $this->parentList[] = $category->parent_id;
            $this->getCategoryParent($category->parent_id);
        }
    }


    public function getAllParents($id){
        $this->getCategoryParent($id);
        return $this->parentList;
    }

    public function getChildren($id){
        $categories = AcademicSession::where('parent_id',$id)->orderBy('sort_order')->where('enabled',1)->get();
        foreach ($categories as $category){
            $this->childList[$category->id] = $category->id;
            $this->getChildren($category->id);
        }
    }

    public function getAllChildren($id){
        $this->getChildren($id);
        return $this->childList;
    }

    public function getCategoriesForParent($parentId,$level=0,$exId=null){

        if(empty($parentId)){
            $categories = AcademicSession::whereNull('parent_id')->orderBy('sort_order')->get();
        }
        else{
            $categories = AcademicSession::where('parent_id',$parentId)->orderBy('sort_order')->get();
        }


        $repeater = '  |__  ';

        foreach($categories as $row)
        {

            if (isset($exId) && $exId==$row->id) {
                continue;
            }

            $this->categoryList[$row->id] = $row;
            $this->getCategoriesForParent($row->id, $level+1,$exId);
        }

    }
}
