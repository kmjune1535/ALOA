package com.aloa.reservation;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ReservationRestController {

	@RequestMapping(value="/reservation/{id}", method=RequestMethod.GET)
	public ResponseEntity reservation(){
		
		return null;
	}
}