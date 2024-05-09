package dao;

import model.Patient;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Util.DBUtil;

public class AllPatientDAO {

    public List<Patient> getPatientswithGW() {
        List<Patient> patients = new ArrayList<>();

        try (Connection con = DBUtil.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement("SELECT patient.* FROM patient INNER JOIN generalwardbed ON patient.patientid = generalwardbed.patientid");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Patient patient = new Patient();

                patient.setPatientid(resultSet.getLong("patientid"));
                patient.setPatientname(resultSet.getString("patientname"));
                patient.setPatientage(resultSet.getInt("patientage"));
                patient.setGender(resultSet.getString("gender"));
                patient.setPatientphonenumber(resultSet.getString("patientphonenumber"));
                patient.setRelativephonenumber(resultSet.getString("relativephonenumber"));
                patient.setDateofadmit(resultSet.getString("dateofadmit"));

                patients.add(patient);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return patients;
    }
    public List<Patient> getPatientswithGC() {
        List<Patient> patients = new ArrayList<>();

        try (Connection con = DBUtil.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement("SELECT patient.* FROM patient INNER JOIN  cardiologyward ON patient.patientid =  cardiologyward.patientid");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Patient patient = new Patient();

                patient.setPatientid(resultSet.getLong("patientid"));
                patient.setPatientname(resultSet.getString("patientname"));
                patient.setPatientage(resultSet.getInt("patientage"));
                patient.setGender(resultSet.getString("gender"));
                patient.setPatientphonenumber(resultSet.getString("patientphonenumber"));
                patient.setRelativephonenumber(resultSet.getString("relativephonenumber"));
                patient.setDateofadmit(resultSet.getString("dateofadmit"));

                patients.add(patient);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return patients;
    }
    public List<Patient> getPatientswithGN() {
        List<Patient> patients = new ArrayList<>();

        try (Connection con = DBUtil.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement("SELECT patient.* FROM patient INNER JOIN  gynocologyward ON patient.patientid =  gynocologyward.patientid");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Patient patient = new Patient();

                patient.setPatientid(resultSet.getLong("patientid"));
                patient.setPatientname(resultSet.getString("patientname"));
                patient.setPatientage(resultSet.getInt("patientage"));
                patient.setGender(resultSet.getString("gender"));
                patient.setPatientphonenumber(resultSet.getString("patientphonenumber"));
                patient.setRelativephonenumber(resultSet.getString("relativephonenumber"));
                patient.setDateofadmit(resultSet.getString("dateofadmit"));

                patients.add(patient);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return patients;
    }
    
    public List<Patient> getPatientswithOP() {
        List<Patient> patients = new ArrayList<>();

        try (Connection con = DBUtil.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement("SELECT patient.* FROM patient INNER JOIN orthopedicward ON patient.patientid =  orthopedicward.patientid");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Patient patient = new Patient();

                patient.setPatientid(resultSet.getLong("patientid"));
                patient.setPatientname(resultSet.getString("patientname"));
                patient.setPatientage(resultSet.getInt("patientage"));
                patient.setGender(resultSet.getString("gender"));
                patient.setPatientphonenumber(resultSet.getString("patientphonenumber"));
                patient.setRelativephonenumber(resultSet.getString("relativephonenumber"));
                patient.setDateofadmit(resultSet.getString("dateofadmit"));

                patients.add(patient);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return patients;
    }
    
    public List<Patient> getPatientswithICU() {
        List<Patient> patients = new ArrayList<>();

        try (Connection con = DBUtil.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement("SELECT patient.* FROM patient INNER JOIN icuward ON patient.patientid =  icuward.patientid");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Patient patient = new Patient();

                patient.setPatientid(resultSet.getLong("patientid"));
                patient.setPatientname(resultSet.getString("patientname"));
                patient.setPatientage(resultSet.getInt("patientage"));
                patient.setGender(resultSet.getString("gender"));
                patient.setPatientphonenumber(resultSet.getString("patientphonenumber"));
                patient.setRelativephonenumber(resultSet.getString("relativephonenumber"));
                patient.setDateofadmit(resultSet.getString("dateofadmit"));

                patients.add(patient);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return patients;
    }
    
}
