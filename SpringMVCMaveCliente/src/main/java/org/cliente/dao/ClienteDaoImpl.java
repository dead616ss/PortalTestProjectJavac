package org.cliente.dao;

import java.util.List;

import org.cliente.modelo.Cliente;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClienteDaoImpl implements ClienteDao {

	
	@Autowired
	private SessionFactory  sessionFactory;
	
	
	@Override
	public void addCliente(Cliente client) {
		sessionFactory.getCurrentSession().saveOrUpdate(client);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Cliente> listCliente() {
		List<Cliente> clientes = null;
		clientes = (List<Cliente>) sessionFactory.getCurrentSession().createQuery("from Cliente").list();
		return clientes;
	}

	@Override
	public Cliente getClienteById(Integer id) {
		Cliente client = (Cliente) sessionFactory.getCurrentSession().get(Cliente.class, id);
		return client;
	}

	@Override
	public void deleteCliente(Integer id) {
		Cliente client = (Cliente) sessionFactory.getCurrentSession().load(
				Cliente.class, id);
		if (client != null) {
			sessionFactory.getCurrentSession().delete(client);
		}
		
	}

	
	
}
