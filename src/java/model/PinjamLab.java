/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.*;

/**
 *
 * @author ASUS
 */
public class PinjamLab {
    String id_peminjaman_r;
    String id_user;
    String id_ruangan;
    String keperluan; 
    String cek_in;
    String cek_out;

    public void setId_peminjaman_r(String id_peminjaman_r) {
        this.id_peminjaman_r = id_peminjaman_r;
    }

    public void setId_user(String id_user) {
        this.id_user = id_user;
    }

    public void setId_ruangan(String id_ruangan) {
        this.id_ruangan = id_ruangan;
    }

    public void setCek_in(String cek_in) {
        this.cek_in = cek_in;
    }

    public void setCek_out(String cek_out) {
        this.cek_out = cek_out;
    }

    public void setKeperluan(String keperluan) {
        this.keperluan = keperluan;
    }

    
   
    public String getId_peminjaman_r() {
        return id_peminjaman_r;
    }

    public String getId_user() {
        return id_user;
    }

    public String getId_ruangan() {
        return id_ruangan;
    }

    public String getCek_in() {
        return cek_in;
    }

    public String getCek_out() {
        return cek_out;
    }


    public String getKeperluan() {
        return keperluan;
    }
}


