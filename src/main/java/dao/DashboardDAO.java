package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Util.DBUtil;

public class DashboardDAO {

    public int getRowCount() {
        int rowCount = 0;
        Connection con = null;

        try {
            con = DBUtil.getConnection();
            try (PreparedStatement preparedStatement = con.prepareStatement("SELECT COUNT(*) as total FROM generalwardbed");
                 ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    rowCount = resultSet.getInt("total");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return rowCount;
    }
    
    
    public int vacantcount() {
        int vacantCount = 0;
        Connection con = null;

        try {
            con = DBUtil.getConnection();
            try (PreparedStatement preparedStatement = con.prepareStatement("SELECT COUNT(*) as vac FROM generalwardbed WHERE patientid IS NULL AND nod IS NULL");
                 ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    vacantCount = resultSet.getInt("vac");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return vacantCount;
    }
    
    public int Bookedcount() {
        int BookedCount = 0;
        Connection con = null;

        try {
            con = DBUtil.getConnection();
            try (PreparedStatement preparedStatement = con.prepareStatement("SELECT COUNT(*) as book FROM generalwardbed WHERE patientid IS NOT NULL ");
                 ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    BookedCount = resultSet.getInt("book");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return BookedCount;
    }

    public int BookedAcCount() {
        int BookedCount = 0;
        Connection con = null;

        try {
            con = DBUtil.getConnection();
            try (PreparedStatement preparedStatement = con.prepareStatement("SELECT COUNT(*) as bookac FROM generalwardbed WHERE type = 'ac' AND patientid IS NOT NULL ");
                 ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    BookedCount = resultSet.getInt("bookac");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return BookedCount;
    }
    

    public int acvacant() {
        int BookedCount = 0;
        Connection con = null;

        try {
            con = DBUtil.getConnection();
            try (PreparedStatement preparedStatement = con.prepareStatement("SELECT COUNT(*) as acvacant FROM generalwardbed WHERE type = 'ac' AND patientid IS NULL ");
                 ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    BookedCount = resultSet.getInt("acvacant");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return BookedCount;
    }

    public int nonacbooked() {
        int BookedCount = 0;
        Connection con = null;

        try {
            con = DBUtil.getConnection();
            try (PreparedStatement preparedStatement = con.prepareStatement("SELECT COUNT(*) as nonacbooked FROM generalwardbed WHERE type = 'Non-ac' AND patientid IS NOT NULL ");
                 ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    BookedCount = resultSet.getInt("nonacbooked");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return BookedCount;
    }
    
    public int nonacvacant() {
        int BookedCount = 0;
        Connection con = null;

        try {
            con = DBUtil.getConnection();
            try (PreparedStatement preparedStatement = con.prepareStatement("SELECT COUNT(*) as nonacvacant FROM generalwardbed WHERE type = 'Non-ac' AND patientid IS NULL ");
                 ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    BookedCount = resultSet.getInt("nonacvacant");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return BookedCount;
    }


}
