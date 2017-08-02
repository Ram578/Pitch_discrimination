<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class UploadQuestions extends CI_Controller {

	/**
	 * This is NewExampleInfo page controller.
	 * Develope on 19th July'2016 by Hemanth Kumar
	 */
	public function index()
	{
		if(isset($this->session->userdata['EmployeeID']))
		{
			$this->load->model('adminmodel');

			$arrQuestions = $this->adminmodel->FetchQuestions();

			$arrData = array
			(
				'Questions' => $arrQuestions,
			);
			$this->load->view('upload_qtns', $arrData);
		}else
		{
			redirect('/admin', 'refresh');
		}
	}

	public function uploadquestion()
	{
		$this->load->model('adminmodel');

		$result = $this->adminmodel->UploadQuestion();
		
		echo json_encode($result);
	}

	function delete_question()
	{
		$this->load->model('adminmodel');

		$result = $this->adminmodel->delete_question_row();

		if($result)
		{
			echo "success";
		}
		else
		{
			echo "fail";
		}
	}
	
	// Change the active status in aims_qusetions table
	function deletequestion()
	{
		$this->load->model('adminmodel');

		$result = $this->adminmodel->DeleteQuestion();

		if($result)
		{
			redirect('/uploadquestions', 'refresh');
		}else
		{
			$this->session->set_flashdata('Errors', array('Unable to upload question. Please try again later.'));

			redirect('/uploadquestions', 'refresh');
		}
	}

	function includeinscore()
	{
		$this->load->model('adminmodel');

		$result = $this->adminmodel->UpdateIncludeInScore();

		if($result)
		{
			redirect('/uploadquestions', 'refresh');
		}else
		{
			$this->session->set_flashdata('Errors', array('Unable to update question. Please try again later.'));

			redirect('/uploadquestions', 'refresh');
		}
	}
	
	function display_questions_order()
	{
		
		$this->load->model('adminmodel');
		
		$arrData['practice_questions'] = $this->adminmodel->fetch_practice_questions();
		
		$arrData['test_questions'] = $this->adminmodel->fetch_test_questions();
		
		$this->load->view('display_questions_order', $arrData);
	}
}
