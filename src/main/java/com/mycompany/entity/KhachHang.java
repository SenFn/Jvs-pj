/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.entity;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import org.hibernate.annotations.GenericGenerator;

/**
 *
 * @author MPH
 */
//makh AS 'kh' + convert(varchar(10),ID) PERSISTED primary key,
//ten_khach_hang nvarchar(50),
//so_dien_thoai_Kh varchar(11),
//email varchar(50),
//dia_chi_giao_hang nvarchar(100),
//ID INT IDENTITY(1,1)
@Entity
@Table(name = "khach_hang")
public class KhachHang {

    @Id
    @Column(name = "makh")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int makh;
    @Column(name = "ten_khach_hang")
    private String tenKhachHang;
    //-----------------------------------Valid Date Email---------------------------------------
    @Column(name = "so_dien_thoai_Kh")
    @NotBlank(message = "Không được để trống")
    @Pattern(regexp="(84|0[3|5|7|8|9])+([0-9]{8})\\b",message="số điện thoại phải 10 số ")
    private String soDienThoaikh;
    
//-----------------------------------Valid Date Email---------------------------------------
    @Column(name = "email")
    @NotBlank(message = "Không được để trống")
    @Email(message = "Vui lòng nhập đúng địa chỉ email")
    private String email;
//@Column(name = "id")
//@GeneratedValue(strategy=GenerationType.IDENTITY)
//private int id;
//fetch = FetchType.LAZY tức là khi bạn find, 
//select đối tượng Company từ database thì nó sẽ không lấy các đối tượng Employee liên quan
//      /////////////  /////////////  /////////////  /////////////  /////////////  /////////////
//fetch = FetchType.EAGER tức là khi bạn find, 
//select đối tượng Company từ database thì tất cả các đối tượng Employee liên quan sẽ được lấy ra và lưu vào listEmployee
//cascade=CascadeType.ALL Khi xóa thực thể Người , thực thể Địa chỉ của chúng tôi cũng sẽ bị xóa.
//1 khach hang co nhieu khach hoa don

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "makh")
    private List<HoaDon> hoaDons;
//    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
//    @JoinColumn(name ="makh")
//    private NguoiDung nguoiDung;
    public KhachHang() {
    }

    public KhachHang(int makh, String tenKhachHang, String soDienThoaikh, String email, List<HoaDon> hoaDons) {
        this.makh = makh;
        this.tenKhachHang = tenKhachHang;
        this.soDienThoaikh = soDienThoaikh;
        this.email = email;
        this.hoaDons = hoaDons;
    }

    public KhachHang(String tenKhachHang, String soDienThoaikh, String email, List<HoaDon> hoaDons) {
        this.tenKhachHang = tenKhachHang;
        this.soDienThoaikh = soDienThoaikh;
        this.email = email;
        this.hoaDons = hoaDons;
    }

    public KhachHang(int makh, String tenKhachHang, String soDienThoaikh, String email) {
        this.makh = makh;
        this.tenKhachHang = tenKhachHang;
        this.soDienThoaikh = soDienThoaikh;
        this.email = email;
    }

    public KhachHang(String tenKhachHang, String soDienThoaikh, String email) {
        this.tenKhachHang = tenKhachHang;
        this.soDienThoaikh = soDienThoaikh;
        this.email = email;
    }

    public int getMakh() {
        return makh;
    }

    public void setMakh(int makh) {
        this.makh = makh;
    }

    public String getTenKhachHang() {
        return tenKhachHang;
    }

    public void setTenKhachHang(String tenKhachHang) {
        this.tenKhachHang = tenKhachHang;
    }

    public String getSoDienThoaikh() {
        return soDienThoaikh;
    }

    public void setSoDienThoaikh(String soDienThoaikh) {
        this.soDienThoaikh = soDienThoaikh;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<HoaDon> getHoaDons() {
        return hoaDons;
    }

    public void setHoaDons(List<HoaDon> hoaDons) {
        this.hoaDons = hoaDons;
    }

    public void addhoaDon(HoaDon hoaDon) {
        if (hoaDons == null) {
            hoaDons = new ArrayList<>();
        }
        hoaDons.add(hoaDon);
    }

//    public NguoiDung getNguoiDung() {
//        return nguoiDung;
//    }
//
//    public void setNguoiDung(NguoiDung nguoiDung) {
//        this.nguoiDung = nguoiDung;
//    }
    
}
