package org.cliente.service;

import java.util.List;

import org.cliente.dao.ClienteDao;
import org.cliente.modelo.Cliente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ClienteServiceImpl implements ClienteService {

	@Autowired
	private ClienteDao dao;
	
	@Transactional
	public void addCliente(Cliente client) {
		dao.addCliente(client);
		
	}

	@Transactional
	public List<Cliente> listCliente() {
		return dao.listCliente();
	}

	@Transactional
	public Cliente getClienteById(Integer id) {
		return dao.getClienteById(id);
	}

	@Transactional
	public void deleteCliente(Integer id) {
		dao.deleteCliente(id);
		
	}

	
}
