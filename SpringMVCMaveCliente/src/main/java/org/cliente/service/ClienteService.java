package org.cliente.service;

import java.util.List;

import org.cliente.modelo.Cliente;

public interface ClienteService {

	public void addCliente(Cliente client);
	public List<Cliente> listCliente();
	public Cliente getClienteById(Integer id);
	public void deleteCliente(Integer id);
}
