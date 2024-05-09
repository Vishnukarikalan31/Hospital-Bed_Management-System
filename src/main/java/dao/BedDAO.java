package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Util.DBUtil;
import model.Bed;

public class BedDAO {
	
	public Boolean addGW(Bed bed) {
		Connection con=null;
		boolean res=true;
		
		try {
			con=DBUtil.getConnection();
			String sql="insert into generalwardbed(bedno, Rent, type) values(?,?,?)";
			
			try(PreparedStatement ps=con.prepareStatement(sql)){
				ps.setString(1, bed.getBedno());
				ps.setString(2, bed.getRent());
				ps.setString(3, bed.getType());
				ps.executeUpdate();
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
			res=false;
		}
		return res;
	
	}
	
	public Boolean addCW(Bed bed) {
		Connection con=null;
		Boolean res=true;
		
		try {
			con=DBUtil.getConnection();
			String sql="insert into cardiologyward(bedno, Rent, type) values(?,?,?)";
			
			try(PreparedStatement ps=con.prepareStatement(sql)){
				ps.setString(1, bed.getBedno());
				ps.setString(2, bed.getRent());
				ps.setString(3, bed.getType());
				ps.executeUpdate();
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
			res=false;
		}
		return res;
	
	}
	
	public Boolean addgc(Bed bed) {
		Connection con=null;
		Boolean res=true;
		
		try {
			con=DBUtil.getConnection();
			String sql="insert into gynocologyward(bedno, Rent, type) values(?,?,?)";
			
			try(PreparedStatement ps=con.prepareStatement(sql)){
				ps.setString(1, bed.getBedno());
				ps.setString(2, bed.getRent());
				ps.setString(3, bed.getType());
				ps.executeUpdate();
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
			res=false;
		}
		return res;
	
	}
	
	public Boolean addOP(Bed bed) {
		Connection con=null;
		Boolean res=true;
		
		try {
			con=DBUtil.getConnection();
			String sql="insert into orthopedicward(bedno, Rent, type) values(?,?,?)";
			
			try(PreparedStatement ps=con.prepareStatement(sql)){
				ps.setString(1, bed.getBedno());
				ps.setString(2, bed.getRent());
				ps.setString(3, bed.getType());
				ps.executeUpdate();
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
			res=false;
		}
		return res;
	
	}
	
	public Boolean addICU(Bed bed) {
		Connection con=null;
		Boolean res=true;
		
		try {
			con=DBUtil.getConnection();
			String sql="insert into icuward(bedno, Rent, type) values(?,?,?)";
			
			try(PreparedStatement ps=con.prepareStatement(sql)){
				ps.setString(1, bed.getBedno());
				ps.setString(2, bed.getRent());
				ps.setString(3, bed.getType());
				ps.executeUpdate();
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
			res=false;
		}
		return res;
	
	}
	
	
	
}