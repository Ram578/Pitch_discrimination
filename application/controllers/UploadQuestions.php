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

		if($result)
		{
			redirect('/uploadquestions', 'refresh');
		}else
		{
			$this->session->set_flashdata('Errors', array('Unable to upload question. Please try again later.'));

			redirect('/uploadquestions', 'refresh');
		}
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
}
