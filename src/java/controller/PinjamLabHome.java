/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.*;

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

    public Ruang[] getDaftarRuang() {

        Ruang[] daftarRuang = null;
        Ruang tempRuang = null;
        ArrayList listRuang = new ArrayList();
        String pwd = "";
        String login = "root";
        Connection con = null;
        ResultSet rs = null;
        AksesJdbc db = new AksesJdbc("lab_db", login, pwd);
        String sql = "SELECT * FROM ruang";
        try {
            con = db.connect();
            String nim = null;
            rs = db.executeQuery(sql);
            while (rs.next()) {
                tempRuang = new Ruang();
                tempRuang.setId_ruangan(rs.getString("id_ruangan"));
                tempRuang.setNama_ruangan(rs.getString("nama_ruangan"));
                tempRuang.setStatus(rs.getString("status"));
                tempRuang.setId_user(rs.getString("id_user"));
                tempRuang.setKondisi_ruangan(rs.getString("kondisi_ruangan"));
                listRuang.add(tempRuang);
            }
            daftarRuang = new Ruang[listRuang.size()];
            listRuang.toArray(daftarRuang);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                db.disconnect();
                return daftarRuang;
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }
        }
    }

    public static int save(PinjamLab pl) throws SQLException {
        int status = 0;
        
        String cek_in = pl.getCek_in_tanggal() + " " + pl.getCek_in_jam();
        String cek_out = pl.getCek_out_tanggal() + " " + pl.getCek_out_jam();
        
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO peminjaman_r(id_peminjaman_r, id_user,id_ruangan, cek_in, cek_out, keperluan) values(?,?,?,?,?,?)");
//            ps.setString(1, pl.getId_peminjaman_r());
//            ps.setString(2, pl.getId_user());
            ps.setString(1, "pem_r_003");
            ps.setString(2, "user_002");
            ps.setString(3, pl.getId_ruangan());
            ps.setString(4, cek_in);
            ps.setString(5, cek_out);
            ps.setString(6, pl.getKeperluan());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }
}
