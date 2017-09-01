<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Subscores extends CI_Controller {

	/**
	 * This is TonalTest page controller.
	 * Develope on 21th July'2016 by Hemanth Kumar
	 */
	public function index()
	{
		if(isset($this->session->userdata['EmployeeID']))
		{
			$this->load->model('adminmodel');

			$arrData['sub_scores'] = $this->adminmodel->fetch_subscores();

			$this->load->view('sub_scores', $arrData);
			
		}
		else
		{
			redirect('/admin', 'refresh');
		}

	}
	
	// Delete a row in certile scores table
	/*function edit_subscores()
	{
		$this->load->model('adminmodel');

		$result = $this->adminmodel->update_subscores();

		echo json_encode($result);
	}*/
	function edit_subscores()
	{
		$this->load->model('adminmodel');

		$result = $this->adminmodel->update_subscores();

		echo json_encode($result);
		
	}
	
	// Update the subscores status active or inactive for application functionality
	function inactive_subscores()
	{
		$this->load->model('adminmodel');

		$result = $this->adminmodel->update_subscores_status();

		if($result)
		{
			redirect('/subscores', 'refresh');
		}
	}
	function delete_row()
	{
		$this->load->model('adminmodel');

		$result = $this->adminmodel->delete_certile_score_row();

		if($result)
		{
			echo "success";
		}
		else
		{
			echo "fail";
		}
	}
}
