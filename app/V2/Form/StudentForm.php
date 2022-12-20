<?php

namespace App\V2\Form;

use App\Lib\BaseForm;
use App\V2\Model\AgeRangeTable;
use App\V2\Model\MaritalStatusTable;
use App\V2\Model\RegistrationFieldTable;
use Laminas\Form\Element\File;
use Laminas\Form\Form;
use App\AcademicSession;
use App\Semester;

class StudentForm extends BaseForm {
    public function __construct($name = null,$serviceLocator,$activeOnly=false)
    {
        $this->setServiceLocator($serviceLocator);
    	// we want to ignore the name passed
    	parent::__construct('user');
    	$this->setAttribute('method', 'post');
        $this->addCSRF();
        $this->translate = false;


    	$this->add(array(
    		'name'=>'name',
    	    'attributes' => array(
    	    'type'=>'text',
    	    		'class'=>'form-control ',
    	    		'required'=>'required',
    	        ),
    	    'options'=>array('label'=>__lang('First name')),
    	));

    	$this->add(array(
    			'name'=>'last_name',
    	    'attributes' => array(
    			'type'=>'text',
    	    		'class'=>'form-control ',
    	    		'required'=>'required',
    	        ),
    			'options'=>array('label'=>__lang('Last name')),
    	));





    	$this->add(array(
    			'name'=>'mobile_number',
    			'attributes' => array(
    					'type'=>'text',
    					'class'=>'form-control ',
    			),
    			'options'=>array('label'=>__lang('Mobile Number')),
    	));



    	$this->add(array(
    		'name'=>'email',
    	    'attributes' => array(
    	    'type'=>'email',
    	    'class'=>'form-control ',
    	    		'required'=>'required',
    	        ),
    	    'options'=>array('label'=>__lang('Email')),
    	));

        $this->createSelect('status','Status',['1'=>__lang('Active'),'0'=>__lang('Inactive')],true,false);

        $rowset2 = AcademicSession::all()->where('enabled', 1);
        $options2 = [];
        foreach($rowset2 as $row){
            $options2[$row->id]= $row->session_name;
        }

        $this->createSelect('academic_session_id','Academic Session',$options2,false);
        $this->get('academic_session_id'); //->setAttribute('multiple','multiple');
        $this->get('academic_session_id')->setAttribute('class','form-control select2');

        $rowset1 = Semester::all()->where('enabled', 1);
        $options1 = [];
        foreach($rowset1 as $row1){
            $options1[$row1->id]= $row1->semester_name;
        }

        $this->createSelect('semester_id','Semester',$options1,false);
        $this->get('semester_id'); //->setAttribute('multiple','multiple');
        $this->get('semester_id')->setAttribute('class','form-control select2');


//create new form
$registrationFieldsTable = new \App\V2\Model\RegistrationFieldTable($serviceLocator);
if($activeOnly)
{
    $rowset= $registrationFieldsTable->getActiveFields();
}
else{
    $rowset = $registrationFieldsTable->getAllFields();
}

foreach($rowset as $row){

            switch($row->type){

                case 'checkbox':
                    $this->createCheckbox('custom_'.$row->id,$row->name,1);
                    break;
                case 'radio':
                    $vals = nl2br($row->options);
                    $options = explode('<br />',$vals);

                    $selectOptions =[];
                    foreach($options as $value){
                        $selectOptions[$value]=$value;
                    }

                    $this->add(array(
                        'type' => 'Zend\Form\Element\Radio',
                        'name' => 'custom_'.$row->id,
                        'options' => array(
                            'label' => $row->name,
                            'value_options' => $selectOptions,
                        )
                    ));
                    break;
                case 'text':
                    $this->createText('custom_'.$row->id,$row->name,!empty($row->required),null,null,$row->placeholder);
                    break;
                case 'textarea':
                    $this->createTextArea('custom_'.$row->id,$row->name,!empty($row->required),null,$row->placeholder);
                    break;
                case 'select':
                    $vals = nl2br($row->options);
                    $options = explode('<br />',$vals);

                    $selectOptions =[];
                    foreach($options as $value){
                        $selectOptions[$value]=$value;
                    }
                    $this->createSelect('custom_'.$row->id,$row->name,$selectOptions,!empty($row->required));
                    break;
                case 'file':
                    $file = new File('custom_'.$row->id);
                    $file->setLabel($row->name)
                        ->setAttribute('id','custom_'.$row->id);
                    $this->add($file);


            }

        }


        $file = new File('picture');
        $file->setLabel(__lang('passport-photograph'))
            ->setAttribute('id','picture');
        $this->add($file);

        $file1 = new File('olevel_result');
        $file1->setLabel(__lang('olevel_result'))
            ->setAttribute('id','olevel_result');
        $this->add($file1);

    }

    public function addPasswordField(){

        $this->createPassword('password','Password',true);
    }

}

?>
