package br.csi.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.csi.model.Usuario;
import br.csi.model.util.ConectaBDPostgres;

public class UsuarioDao {
		
			public boolean autenticado(Usuario u) throws SQLException{
				boolean autenticado = false;
				
				Connection c = ConectaBDPostgres.getConexao();
				//Statement stmt = c.createStatement();
				
				//String sql = "select * from usuario "
				//+ "where login = '"+u.getLogin()+"'"
				//		+ " and senha = '"+u.getSenha()+"';";
				
				String sql = "select * from usuario where "
						+ "login =? and senha =?";
				PreparedStatement stmtPre = c.prepareStatement(sql);
				stmtPre.setString(1, u.getLogin());
				stmtPre.setString(2, u.getSenha());			
				//ResultSet rs = stmt.executeQuery(sql);
				ResultSet rs = stmtPre.executeQuery();
				
				
				
				while(rs.next()){
					long id = rs.getLong("id");
					String login = rs.getString("login");
					String senha = rs.getString("senha");
					autenticado = true;
				}
				
				return autenticado;
			}
			
			public List<Usuario> getUsuarios(){
				ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
				System.out.println("dentro do getUsuarios()");
				try{
						
					PreparedStatement stmt =  
							ConectaBDPostgres.getConexao().prepareStatement("select * from USUARIO");
					
					ResultSet rs = stmt.executeQuery();
					while(rs.next()){
						Usuario t = new Usuario();
						t.setId(rs.getLong("id"));
						t.setLogin(rs.getString("login"));
						t.setSenha(rs.getString("senha"));
						System.out.println("usuário: "+t.getLogin());
						usuarios.add(t);
					}
					
				}catch(Exception e){
					e.printStackTrace();
				}
				
				return usuarios;
			}
			
			public boolean adiciona(Usuario t){
				
				Connection c = null;
				PreparedStatement stmt = null;
				boolean retorno = false;
				try {

					c = ConectaBDPostgres.getConexao();
					String sql = "";
					
					if(t.getId()<= 0){
						System.out.println("......... vai adicionar .............");
						
						sql = "INSERT INTO USUARIO (LOGIN, SENHA) "
								+ " values (?,?)";
						stmt = c.prepareStatement(sql);	
						stmt.setString(1, t.getLogin());
						stmt.setString(2, t.getSenha());
						
						
					}else{
						System.out.println("......... vai alterar .............");
						sql = "UPDATE USUARIO SET LOGIN =?, SENHA=?  "
								+ " WHERE id =?";
						stmt = c.prepareStatement(sql);								
						stmt.setString(1, t.getLogin());
						stmt.setString(2, t.getSenha());
						stmt.setLong(3, t.getId());
						
					}
					
							
										
					stmt.execute();			
					stmt.close();
					retorno = true;
					
				} catch (Exception e) {
					e.printStackTrace();
					return retorno;
					
				}	
				return retorno;
			}
			
			public Usuario getUsuario(Long id){
				Usuario u = new Usuario();
				
				try{
					
					PreparedStatement stmt =  
							ConectaBDPostgres
								.getConexao()
									.prepareStatement("select * from USUARIO where id = ?");
					stmt.setLong(1, id);
					ResultSet rs = stmt.executeQuery();
					while(rs.next()){				
						u.setId(rs.getLong("id"));
						u.setLogin(rs.getString("login"));
						u.setSenha(rs.getString("senha"));
						System.out.println("usuário: "+u.getLogin());
						
					}
					
				}catch(Exception e){
					e.printStackTrace();
				}
				
				
				return u;
			}
			public boolean remover(Long id){
				boolean retorno = false;
				
				String sql = "delete from USUARIO where id = ?";
				Connection c = ConectaBDPostgres
						.getConexao();
				PreparedStatement stmt = null;
				
				try {
					stmt = c.prepareStatement(sql);
					stmt.setLong(1, id);
					stmt.execute();
					retorno = true;
				} catch (SQLException e) {
					throw new RuntimeException(e);
				}
				
				return retorno;
			}
}
