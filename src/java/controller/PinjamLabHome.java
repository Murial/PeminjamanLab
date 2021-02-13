/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.mysql.jdbc.Connection;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
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
                tempPinjamLab.setCek_in(rs.getTimestamp("cek_in"));
                tempPinjamLab.setCek_out(rs.getTimestamp("cek_out"));
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

    public static String getLastId() {

        String ids = "";

        try {
            String Host = "jdbc:mysql://localhost:3306/lab_db";
            Connection connection = null;
            Statement statement = null;
            ResultSet rs = null;
            Class.forName("com.mysql.jdbc.Driver");
            connection = (Connection) DriverManager.getConnection(Host, "root", "");
            statement = connection.createStatement();
            String Data = "SELECT id_peminjaman_r FROM `peminjaman_r` ORDER BY id_peminjaman_r DESC LIMIT 1";

            rs = statement.executeQuery(Data);
            int idsum = 0;
            if (rs.first()) {
                ids = rs.getString("id_peminjaman_r");
            }
            idsum = Integer.parseInt(ids.substring(6));
            idsum += 1;
            ids = "pem_r_" + Integer.toString(idsum);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return ids;
    }

    public static int save(PinjamLab pl) throws SQLException, ParseException {
        int status = 0;

        try {
            Connection con = getConnection();

            java.util.Date In_date = pl.getCek_in();
            Timestamp cek_in = new Timestamp(In_date.getTime());
            java.util.Date Out_date = pl.getCek_in();
            Timestamp cek_out = new Timestamp(Out_date.getTime());

            String s_cek_in = cek_in.toString();
            String s_cek_out = cek_out.toString();

//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"),
//                    sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//            java.util.Date in = sdf2.parse(s_cek_in.replace("T", " "));
//            java.util.Date out = sdf2.parse(s_cek_out.replace("T", " "));
//            String Cek_in = sdf2.format(in);
//            String Cek_out = sdf2.format(out);
//
//            Timestamp ts1 = Timestamp.valueOf(Cek_in);  
//            Timestamp ts2 = Timestamp.valueOf(Cek_out);  
//            System.out.println("Timestamp : "+ts1+ " - " + ts2);  
//          //returns a string object in JDBC timestamp escape format .
//            String stIn =ts1.toString();  
//            String stOut =ts2.toString();  
//            System.out.println("New Timespan : "+stIn + " - " + stOut);  
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm");
            java.util.Date date = formatter.parse(s_cek_in);

            PreparedStatement ps = con.prepareStatement("INSERT INTO peminjaman_r(id_peminjaman_r, id_user,id_ruangan, cek_in, cek_out, keperluan) values(?,?,?,?,?,?)");
//            ps.setString(1, pl.getId_peminjaman_r());
//            ps.setString(2, pl.getId_user());
            ps.setString(1, getLastId());
            ps.setString(2, "user_002");
            ps.setString(3, pl.getId_ruangan());
            ps.setString(4, s_cek_in);
            ps.setString(5, s_cek_out);
            ps.setString(6, pl.getKeperluan());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }
}
