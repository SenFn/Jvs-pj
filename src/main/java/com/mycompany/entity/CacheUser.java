package com.mycompany.entity;

public class CacheUser {
    public static String session;
    public static GioHang giohang;

    public CacheUser() {

    }

    public CacheUser(String session, GioHang giohang) {
        this.session = session;
        this.giohang = giohang;
    }

    @Override
    public String toString() {
        return "CacheUser{" +
                "session='" + session + '\'' +
                ", giohang=" + giohang.toString() +
                '}';
    }

    public static void CacheUpdateCart(SanPhamTrongGioHang sp){
        giohang.addSanPhamTrongGioHang(sp);
    }
}
