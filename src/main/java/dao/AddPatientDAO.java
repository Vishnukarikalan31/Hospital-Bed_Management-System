package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.SQLException;

import Util.DBUtil;
import model.Patient;

public class AddPatientDAO {
	
	public boolean add(Patient patient) {
		Connection con=null;
		boolean res=true;
		
		try {
			con=DBUtil.getConnection();
			
			String sql="insert into patient( patientname, patientage, gender, patientphonenumber, relativephonenumber, dateofadmit, dateofdischarge ) values(?,?,?,?,?,?,?)";
			
			try(PreparedStatement ps=con.prepareStatement(sql)){
				ps.setString(1, patient.getPatientname());
				ps.setInt(2, patient.getPatientage());
				ps.setString(3, patient.getGender());
				ps.setString(4, patient.getPatientphonenumber());
				ps.setString(5, patient.getRelativephonenumber());
				ps.setString(6, patient.getDateofadmit());
				ps.setString(7, null);
				ps.executeUpdate();
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
			res=false;
		}
		return res;
		
	}
	
	
	
}