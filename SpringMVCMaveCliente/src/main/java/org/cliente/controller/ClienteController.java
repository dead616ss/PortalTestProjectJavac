package org.cliente.controller;

import java.util.Map;

import org.cliente.modelo.Cliente;
import org.cliente.service.ClienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ClienteController {

	@Autowired
	private ClienteService service;
	
	@RequestMapping(value="/index")
	public String listCliente(Map<String, Object> map){
		map.put("cliente", new Cliente());
		map.put("listCliente", service.listCliente());
		return "clienteForm";
	}
	
	@RequestMapping(value="/cliente/add", method=RequestMethod.POST)
	public String addCliente(@ModelAttribute("contact") Cliente client, 
			BindingResult result){
		service.addCliente(client);
		return "redirect:/index";
	}
	
	@RequestMapping(value="/delete/{id}")
	public String deleteCliente(@PathVariable("id") Integer id){
		service.deleteCliente(id);
		return "redirect:/index";
	}
	@RequestMapping(value="/edit/{id}")
	public String editCliente(@PathVariable("id") int id, Model model){
		model.addAttribute("cliente", service.getClienteById(id));
		model.addAttribute("listCliente", service.listCliente());
		return "clienteForm";
	}
}
