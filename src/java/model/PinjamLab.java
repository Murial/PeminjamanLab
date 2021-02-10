/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author ASUS
 */
public class PinjamLab {
    String id_peminjaman_r;
    String id_user;
    String id_ruangan;
    Date cek_in_tanggal;
    Date cek_out_tanggal;
    Time cek_in_jam;
    Time cek_out_jam;
    String keperluan;
    

    public void setId_peminjaman_r(String id_peminjaman_r) {
        this.id_peminjaman_r = id_peminjaman_r;
    }

    public void setId_user(String id_user) {
        this.id_user = id_user;
    }

    public void setId_ruangan(String id_ruangan) {
        this.id_ruangan = id_ruangan;
    }

    public void setCek_in_tanggal(Date cek_in_tanggal) {
        this.cek_in_tanggal = cek_in_tanggal;
    }

    public void setCek_out_tanggal(Date cek_out_tanggal) {
        this.cek_out_tanggal = cek_out_tanggal;
    }

    public void setCek_in_jam(Time cek_in_jam) {
        this.cek_in_jam = cek_in_jam;
    }

    public void setCek_out_jam(Time cek_out_jam) {
        this.cek_out_jam = cek_out_jam;
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

    public Date getCek_in_tanggal() {
        return cek_in_tanggal;
    }

    public Date getCek_out_tanggal() {
        return cek_out_tanggal;
    }

    public Time getCek_in_jam() {
        return cek_in_jam;
    }

    public Time getCek_out_jam() {
        return cek_out_jam;
    }

    

    public String getKeperluan() {
        return keperluan;
    }
}


