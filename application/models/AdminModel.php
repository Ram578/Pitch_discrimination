<?php
/**
* This class is used to handle the customer related info.
* Develope on 19th July'2016 by Hemanth Kumar
*/
class AdminModel extends CI_Model
{
	function AdminModel() 
  	{
    	parent::__construct();
  	}
	
	function Login()
	{
		if(sizeof($_POST) > 0)
		{
			$strUserName = $_POST['userame'];

			$strPassword = md5($_POST['password']);

			$strQuery = 'SELECT * FROM pitch_employees WHERE username LIKE "'.$strUserName.'"';

			$objQuery = $this->db->query($strQuery);

			if($objQuery->num_rows() > 0)
			{
				$arrResult = $objQuery->result_array();

				$arrEmployee = $arrResult[0];

				if($arrEmployee['passwd'] == $strPassword && $arrEmployee['active'] == 1)
				{
					$this->session->set_userdata('EmployeeID', $arrEmployee['id']);

					$this->session->set_userdata('EmployeeFName', $arrEmployee['firstname']);

					$this->session->set_userdata('EmployeeLName', $arrEmployee['lastname']);
					
					$this->session->set_userdata('EmployeeRole', $arrEmployee['role']);

					return 1;
				}elseif($arrEmployee['passwd'] != $strPassword)
				{
					$this->session->set_flashdata('Errors', 'Password is not matching with the records.');
					return 0;
				}elseif($arrEmployee['active'] !== 1)
				{
					$this->session->set_flashdata('Errors', 'User is not active.');
					return 0;
				}
			}else
			{
				$this->session->set_flashdata('Errors', 'User is not registered with us. Please check username entered.');
				return 0;
			}

		}
	}

	function FetchQuestions()
	{
		$strQuery = 'SELECT * FROM aims_questions';

		$objQuery = $this->db->query($strQuery);

		if($objQuery->num_rows())
		{
			return $objQuery->result_array();
		}else
		{
			return array();
		}
	}

	function UploadQuestion()
	{
		if(sizeof($_POST))
		{
			$strQuestionCode = $_POST['questioncode'];

			$target_file1 = false;

			$strNewFileName = false;

			if($strQuestionCode)
			{
				$fileName = '';

				if($_FILES && $_POST['id'] == -1)
				{
					$target_dir = "uploads/";

			        $path = $target_dir.date('Ymd');
			        
			        if(!file_exists($path)) 
			        {
			        	$oldmask = umask(0);
			        	mkdir($path, 0777);
			        	umask($oldmask);
			        }

			        $fileInfo = pathinfo($_FILES["audioname"]["name"]);
			        
			        $strNewFileName = date('YmdHis').'.'.$fileInfo['extension'];
					
					$target_file = $path ."/". basename($_FILES["audioname"]["name"]);
				
			        $target_file1 = $path."/".$strNewFileName;
				
					if(!move_uploaded_file($_FILES["audioname"]["tmp_name"], $target_file1))
			        {
			    		return 0;
			        }
				}

				if($_POST['id'] == -1)
				{
					$arrData = array(
						'questioncode'  => $strQuestionCode, 
						'questiontype'  => 'test', 
						'addeddate'	    => date('Y-m-d H:m:s'),
						'audiopath'		=> $target_file1,
						'audiofilename' => $strNewFileName,
						'answer' 		=> $_POST['answer']
					);
				}else
				{
					$arrData = array(
						'questioncode'  => $strQuestionCode, 
						'answer' 		=> $_POST['answer']
					);
				}

				if($_POST['id'] == -1)
				{
					$result = $this->db->insert('aims_questions', $arrData);
					
					if($this->db->affected_rows()) {
						$success = array(
							"success" => "success",
							"status" => "insert",
							"message" => "Inserted successfully."
						);
					}
					else {
						$success = array(
							"success" => "failed",
							"status" => "insert",
							"message" => "Something went wrong."
						);
					}
				}
				else
				{
					$this->db->where('id', $_POST['id']);

					$result = $this->db->update('aims_questions', $arrData);
					
					if($this->db->affected_rows()) {
						$success = array(
							"success" => "success",
							"status" => "update",
							"message" => "Updated successfully."
						);
					}
					else {
						$success = array(
							"success" => "failed",
							"status" => "update",
							"message" => "Something went wrong."
						);
					}
				}
				
				return $success;
			}
		}
	}

	function FetchUsers()
	{
		$strQuery = 'SELECT * FROM aims_users ORDER BY id DESC';

		$objQuery = $this->db->query($strQuery);

		return $objQuery->result_array();
	}

	function FetchUserResult($id_user)
	{
		$arrTemp = $this->_userResults($id_user);

		$intCounter = 0;

		foreach ($arrTemp as $key => $value) {
			if($value['includeinscoring'] && ($value['optionid'] == $value['answer']))
			{
				$intCounter = $intCounter + 1;
			}
		}

		return $intCounter;
	}

	function FetchCertile()
	{
		$strQuery = 'SELECT * FROM aims_certile ORDER BY id DESC';

		$objQuery = $this->db->query($strQuery);

		return $objQuery->result_array();
	}
	
	//Get the certile score based on user age, gender and score from pitch_certile_scores table in db
	function FetchCertileWRT($p_intScore, $age , $gender)
	{
		$strQuery = 'SELECT age,score,certile FROM pitch_certile_scores WHERE gender = "'.$gender.'"';

		$objQuery = $this->db->query($strQuery);

		$temp = 0;
		
		if($objQuery->num_rows())
		{
			//Get the certile score based on user age, gender and score
			foreach($objQuery->result_array() as $row) 
			{
				//Explode the certile age and score for checking in between the user age and score. 
				$certile_age = explode("-",$row['age']);
				$certile_score = explode("-",$row['score']);
				
				if($age == $certile_age['0'] || $age >= $certile_age['0'] && $age <= $certile_age['1']) 
				{
					if($p_intScore == $certile_score['0'] || $p_intScore >= $certile_score['0'] && $p_intScore <= $certile_score['1']) 
					{
						$temp = $row['certile'];
						break;
					} 
				}
			}
		}
		return $temp;
	} 

	function _userResults($id_user)
	{
		
		$strQuery = 'SELECT ua.`questionid`, ua.`optionid`, q.`answer`, q.includeinscoring FROM aims_user_answers ua INNER JOIN aims_questions q ON q.id = ua.`questionid` WHERE userid = '.$id_user;

		$objQuery = $this->db->query($strQuery);

		if($objQuery->num_rows() > 0)
		{
			return $objQuery->result_array();
		}else
		{
			return array();
		}
	}

	function FetchTestResult()
	{
		$arrUsers = $this->FetchUsers();
		foreach ($arrUsers as $key => &$value) {
			$value['test_result'] = $this->_userResults($value['id']);
		}
		
		return $arrUsers;
	}

	function delete_question_row()
	{
		$id = $_POST['id'];

		if($id)
		{
			$this->db->where('questionid', $id);
			$this->db->delete('aims_user_answers');
			
			$this->db->where('id', $id);
			$this->db->delete('aims_questions');
			
			if($this->db->affected_rows()) {
				return true;
			} else {
				return false;
			}
		}
		else
		{
			return false;
		}
	}

	function UpdateIncludeInScore()
	{
		$id = $_POST['questionid'];

		$status = $_POST['includeinscore'];

		if($id)
		{
			$arrData = array(
                'includeinscoring' => $status
            );

	 		$this->db->where('id', $id);

			$this->db->update('aims_questions', $arrData);
		}else
		{
			return false;
		}
	}
	
	function fetch_certile_scores()
	{
		$strQuery = 'SELECT * FROM pitch_certile_scores ORDER BY id DESC';

		$objQuery = $this->db->query($strQuery);

		return $objQuery->result_array();
	}
	
	function edit_or_add_certilescores()
	{
		$id = $_POST['id'];
		$age = $_POST['age'];
		$gender = $_POST['gender'];
		$score = $_POST['score'];
		$certile = $_POST['certile'];
		
		$arrData = array(
                'age' => $age,
                'gender' => $gender,
                'score' => $score,
                'certile' => $certile
            );

		if($id == "")
		{
			//insert row
			$this->db->insert('pitch_certile_scores', $arrData);
			
			if($this->db->affected_rows()) {
				$success = array(
					"success" => "success",
					"status" => "insert",
					"message" => "Inserted successfully."
				);
			}
			else {
				$success = array(
					"success" => "failed",
					"status" => "insert",
					"message" => "Something went wrong."
				);
			}
		}
		else
		{	
			//update the row
	 		$this->db->where('id', $id);

			$this->db->update('pitch_certile_scores', $arrData);
			
			if($this->db->affected_rows()) {
				$success = array(
					"success" => "success",
					"status" => "update",
					"message" => "Updated successfully."
				);
			}
			else {
				$success = array(
					"success" => "failed",
					"status" => "update",
					"message" => "Something went wrong."
				);
			}
		}
		return $success;
	}
	
	function delete_certile_score_row()
	{
		$id = $_POST['id'];

		if($id)
		{
			$this->db->where('id', $id);
			$this->db->delete('pitch_certile_scores');
			
			if($this->db->affected_rows()) {
				return true;
			} else {
				return false;
			}
		}
		else
		{
			return false;
		}
	}
	
	// Change the active status in aims_questions table.
	function DeleteQuestion()
	{
		$id = $_POST['questionid'];

		$status = $_POST['active'];

		if($id)
		{
			$arrData = array(
                'active' => $status
            );

	 		$this->db->where('id', $id);

			$this->db->update('aims_questions', $arrData);
		}else
		{
			return false;
		}
	}
	
	// Get the practice and test questions from aims_questions table in db.
	function fetch_questions() {
		
		$sql = 'SELECT * FROM pitch_questions_order WHERE type="questions"';

		$result = $this->db->query($sql);
		
		// Check the pitch_questions_order table have sorted questions or not.
		if($result->num_rows() > 0) {
			
			$row = $result->row();
			
			$obj = unserialize(base64_decode($row->question_order));
			
			$array['order'] = $obj;
			
		}
			
		$strQuery = 'SELECT id,questioncode,audiofilename FROM aims_questions WHERE questiontype="practice"';

		$practiceQuery = $this->db->query($strQuery);
		
		$array['practice'] = $practiceQuery->result_array();
		
		$query = 'SELECT id,questioncode,audiofilename FROM aims_questions WHERE questiontype="test"';

		$testQuery = $this->db->query($query);
		
		$array['test'] = $testQuery->result_array();
		
		return $array;	
	}
	
	
	// save the questions order in pitch_questions_order table in db.
	function save_questions_order() {
		
		$question_order = base64_encode(serialize($_POST['question_order']));

		if($question_order)
		{	
			$sql = "SELECT * FROM pitch_questions_order";
			$result = $this->db->query($sql);
			
			if($result->num_rows() > 0) {
				$arrData = array(
						'question_order' => $question_order
						);
				
				$this->db->where('type', 'questions');

				$this->db->update('pitch_questions_order', $arrData);
				
			} else {
				$arrData = array(
							'type' => 'questions',
							'question_order' => $question_order,
							);
				
				$this->db->insert('pitch_questions_order', $arrData);
			}
			
			if($this->db->affected_rows()) {
				return "success";
			} else {
				return "fail";
			}
		}
	}
	
}

?>
