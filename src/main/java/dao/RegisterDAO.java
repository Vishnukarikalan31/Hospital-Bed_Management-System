package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.SQLException;

import Util.DBUtil;
import model.User;

public class RegisterDAO {
	
	public boolean register( User user ) {
		Connection con=null;
		boolean res=true;
		
		try {
			con=DBUtil.getConnection();
			
			String sql="insert into login( firstname, lastname, role, email, contact, password, ward) values(?,?,'nurse',?,?,?,?)";
			
			try(PreparedStatement ps=con.prepareStatement(sql)){
				ps.setString(1, user.getFirstname());
				ps.setString(2, user.getLastname());
				ps.setString(3, user.getEmail());
				ps.setString(4, user.getContact());
				ps.setString(5, user.getPassword());
				ps.setString(6, user.getWard());
			
				ps.executeUpdate();
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
			res=false;
		}
		return res;
		
	}
	
	
	
}