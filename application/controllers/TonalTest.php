<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class TonalTest extends CI_Controller {
	
	/**
	 * This is TonalTest page controller.
	 * Develope on 21th July'2016 by Hemanth Kumar
	 */
	public function index()
	{
		if(isset($this->session->userdata['UserID']))
		{
			$this->load->model('frontendmodel');

			$arrData['Title'] = 'AIMS - Test';

			$Header = $this->load->view('header', $arrData,true);

			$arrData['Header'] = $Header;

			$arrData['Footer'] = $this->load->view('footer', $arrData,true);
				
			$questions_result = $this->frontendmodel->FetchQuestions();
			
			if(isset($questions_result['order'])) {
				
				//To display the sorted order in display order page for test questions
				$test_order = $questions_result['order']['test'];
				$test_order_count = count($test_order);
				$test = array();
				
				for($i=0; $i<$test_order_count; $i++) 
				{
					$id = $test_order[$i];
					
					foreach($questions_result['test'] as $row)
					{
						if($row['id'] == $id) 
						{
							array_push($test, $row);
						}
					}
				}
				
				//Replace the sorted data for displaying in page				
				// $questions_result['test'] = $test;		
				$arrData['Questions'] = $test;
			} else
			{
				$arrData['Questions'] = $questions_result['test'];
			}
			
			$this->load->view('tonal_test', $arrData);
		}else
		{
			redirect('/', 'refresh');
		}
	}

	function saveuseranswer()
	{
		$this->load->model('frontendmodel');

		$this->frontendmodel->SaveUserAnswer();
	}
}
