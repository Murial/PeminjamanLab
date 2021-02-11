/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ASUS
 */
public class Ruang {
    String id_ruangan;
    String nama_ruangan;
    String status;
    String id_user;
    String kondisi_ruangan;

    public void setId_ruangan(String id_ruangan) {
        this.id_ruangan = id_ruangan;
    }

    public void setNama_ruangan(String nama_ruangan) {
        this.nama_ruangan = nama_ruangan;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setId_user(String id_user) {
        this.id_user = id_user;
    }

    public void setKondisi_ruangan(String kondisi_ruangan) {
        this.kondisi_ruangan = kondisi_ruangan;
    }

    public String getId_ruangan() {
        return id_ruangan;
    }

    public String getNama_ruangan() {
        return nama_ruangan;
    }

    public String getStatus() {
        return status;
    }

    public String getId_user() {
        return id_user;
    }

    public String getKondisi_ruangan() {
        return kondisi_ruangan;
    }
    
    
}
