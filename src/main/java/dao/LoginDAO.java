package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Util.DBUtil;
import model.User;

public class LoginDAO {
	public String validate(User user) {
        Connection con = null;
        String ward = null;

        try {
            con = DBUtil.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT ward FROM login WHERE firstname = ? AND password = ?");
            ps.setString(1, user.getFirstname());
            ps.setString(2, user.getPassword());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                ward = rs.getString("ward");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ward;
    }
}
