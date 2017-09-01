<?php
/**
* This class is used to handle the customer related info.
* Develope on 19th July'2016 by Hemanth Kumar
*/
class Frontendmodel extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
		
		$this->load->helper('date');
	}
	
	function FetchQuestions()
	{	
		$sql = 'SELECT * FROM pitch_questions_order WHERE type="questions"';

		$result = $this->db->query($sql);
		
		// Check the pitch_questions_order table have sorted questions or not.
		if($result->num_rows() > 0) 
		{
			$row = $result->row();
			
			$obj = unserialize($row->question_order);
			
			$array['order'] = $obj;
		}
		
		$query = 'SELECT * FROM pitch_questions WHERE questiontype="test" and active = 1';

		$testQuery = $this->db->query($query);
		
		$array['test'] = $testQuery->result_array();
		
		return $array;	
	}
	
	//Get the subscores data from pitch_subscores table
	function fetch_subscores() 
	{
		$sql = 'SELECT * FROM pitch_subscores';

		$result = $this->db->query($sql);
		
		$rows = $result->result_array();
		$subscores_data = array();
		
		foreach($rows as $row) {
			$score_range = explode("-", $row['score_range']);
		
			$row['min_score'] = $score_range[0];
			$row['max_score'] = isset($score_range[1])? $score_range[1] : "";
			$subscores_data[] = $row;
		}
		// var_dump($subscores_data);
		return $subscores_data;
		
		// $score_array = array();
		// $score_arr = array_push($score_array, $score_data);
		// var_dump($score_arr);
		
		// $row = $result->row_array();
				
		// $score_range = explode("-", $row['score_range']);
		
		// $row['min_score'] = $score_range[0];
		// $row['max_score'] = isset($score_range[1])? $score_range[1] : "";
		
		//return $row;
	}
	
	// Get the practice test questions
	function fetch_practice_questions()
	{	
		/*
		$sql = 'SELECT * FROM pitch_questions_order WHERE type="questions"';

		$result = $this->db->query($sql);
		
		// Check the pitch_questions_order table have sorted questions or not.
		if($result->num_rows() > 0) 
		{
			$row = $result->row();
			
			$obj = unserialize($row->question_order);
			
			$array['order'] = $obj;
		}
		*/
		
		$query = 'SELECT * FROM pitch_questions WHERE questiontype="practice" and active = 1';

		$testQuery = $this->db->query($query);
		
		$array['practice'] = $testQuery->result_array();
		
		return $array;	
	}

	function SaveUserAnswer()
	{
		$intQuestionID = $_POST['questionid'];

		$intSelectedOption = $_POST['selectedoption'];
	
		$timestamp = time();
		$date_format = date("Y-m-d H:i:s", $timestamp);
		
		$arrData = array(
			'userid'  => $this->session->userdata('UserID'), 
			'questionid'  => $intQuestionID,
			'optionid' => $intSelectedOption,
			'addeddate'	    => $date_format
		);

		$result = $this->db->insert('pitch_user_answers', $arrData);

		return $result;
	}

	function FetchResult()
	{
		$strQuery = "SELECT userid,questionid,includeinscoring, optionid, answer, IF(optionid = answer, 1,0) AS result FROM pitch_user_answers ua
			INNER JOIN pitch_questions q ON q.id = ua.`questionid`
			WHERE q.questiontype = 'test' AND userid = ".$this->session->userdata('UserID');
			
		$objQuery = $this->db->query($strQuery);

		if($objQuery->num_rows())
		{
			return $objQuery->result_array();
		}
		else
		{
			return array();
		}
	}
	
	//Save the user status response if the user clicks next or more examples
	function save_user_status()
	{
		$status = strtolower($_POST['user_status']);
		$user_id = $this->session->userdata('UserID');
		
		//Check and save for next -> 0 and for more examples -> 1
		if($status == "next") 
		{
			$status_code = 1;
		} 
		else 
		{
			$status_code = 2;
		}
		
		$this->db->where('id', $user_id);
		$result = $this->db->update('pitch_users', array('status' => $status_code));
		
		return $result;
	}
	
	//Save the user test completed date in pitch_users table after the exam is completed.
	function update_test_completed_date()
	{
		$status = $_POST['test_status'];
		$user_id = $this->session->userdata('UserID');	
		
		//Check and save for next -> 1 and for more examples -> 2
		if($status == "completed") 
		{
			$timestamp = time();
			$date_format = date("Y-m-d H:i:s", $timestamp);
			$this->db->where('id', $user_id);
			$this->db->update('pitch_users', array('completeddate' => $date_format));
		} 
	}
}
?>