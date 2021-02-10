/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.AksesJdbc;
import model.PinjamLab;

/**
 *
 * @author ASUS
 */
public class PinjamLabHome {

    public PinjamLab[] getDaftarPinjamLab() {
        PinjamLab[] daftarPinjamLab = null;
        PinjamLab tempPinjamLab = null;
        ArrayList listPinjamLab = new ArrayList();
        String pwd = "";
        String login = "root";
        Connection con = null;
        ResultSet rs = null;
        AksesJdbc db = new AksesJdbc("lab_db", login, pwd);
        String sql = "SELECT * FROM peminjaman_r";
        try {
            con = db.connect();
            String nim = null;
            rs = db.executeQuery(sql);
            while (rs.next()) {
                tempPinjamLab = new PinjamLab();
                tempPinjamLab.setId_peminjaman_r(rs.getString("id_peminjaman_r"));
                tempPinjamLab.setId_user(rs.getString("id_user"));
                tempPinjamLab.setId_ruangan(rs.getString("id_ruangan"));
                tempPinjamLab.setCek_in_tanggal(rs.getDate("cek_in"));
                tempPinjamLab.setCek_out_tanggal(rs.getDate("cek_out"));
                tempPinjamLab.setCek_in_jam(rs.getTime("cek_in"));
                tempPinjamLab.setCek_out_jam(rs.getTime("cek_out"));
                tempPinjamLab.setKeperluan(rs.getString("keperluan"));
                listPinjamLab.add(tempPinjamLab);
            }
            daftarPinjamLab = new PinjamLab[listPinjamLab.size()];
            listPinjamLab.toArray(daftarPinjamLab);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                db.disconnect();
                return daftarPinjamLab;
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }
        }
    }

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/lab_db", "root", "");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return con;
    }
}
