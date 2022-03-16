/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.entity;

import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.GenericGenerator;

/**
 *
 * @author s3n
 */
@Entity
@Table(name = "giao_hang")
public class GiaoHang {

    @Id
    @Column(name = "magh")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int magh;
    @Column(name = "cong_ty_ship")
    private String congTyShip;
    @Column(name = "dia_chi_giao_hang")
    private String diaChiGiaoHang;

    public GiaoHang() {

    }

    public GiaoHang(int magh, String congTyShip, String diaChiGiaoHang) {
        this.magh = magh;
        this.congTyShip = congTyShip;
       
        this.diaChiGiaoHang = diaChiGiaoHang;
    }

    public GiaoHang(String congTyShip, String diaChiGiaoHang) {
        this.congTyShip = congTyShip;
      
        this.diaChiGiaoHang = diaChiGiaoHang;
    }

    public int getMagh() {
        return magh;
    }

    public void setMagh(int magh) {
        this.magh = magh;
    }

    public String getCongTyShip() {
        return congTyShip;
    }

    public void setCongTyShip(String congTyShip) {
        this.congTyShip = congTyShip;
    }

 

    public String getDiaChiGiaoHang() {
        return diaChiGiaoHang;
    }

    public void setDiaChiGiaoHang(String diaChiGiaoHang) {
        this.diaChiGiaoHang = diaChiGiaoHang;
    }

    

}
