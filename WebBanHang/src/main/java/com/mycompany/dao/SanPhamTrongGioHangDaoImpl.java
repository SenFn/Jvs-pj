/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.dao;

import com.mycompany.entity.GiaoHang;
import com.mycompany.entity.GioHang;
import com.mycompany.entity.HoaDon;
import com.mycompany.entity.SanPhamTrongGioHang;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 *
 * @author MPH
 */
@Repository
@EnableTransactionManagement
public class SanPhamTrongGioHangDaoImpl implements SanPhamTrongGioHangDao{
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public void updateSanPhamTrongGioHang(SanPhamTrongGioHang SanPhamTrongGioHangss, int gioHangId) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
         Session currentSession = sessionFactory.getCurrentSession();
          GioHang gioHang = currentSession.get(GioHang.class, gioHangId);
          SanPhamTrongGioHang sanPhamTrongGioHang = gioHang.getSanPhamTrongGioHang(SanPhamTrongGioHangss.getMaspgh());
          setValue(sanPhamTrongGioHang, SanPhamTrongGioHangss);
         currentSession.saveOrUpdate(SanPhamTrongGioHangss);
    }
   private void setValue(SanPhamTrongGioHang the, SanPhamTrongGioHang temp)
    {
        the.setSoLuong(temp.getSoLuong());
        the.setGiaSanPham(temp.getGiaSanPham());      
    }
    @Override
    public SanPhamTrongGioHang getSanPhamTrongGioHang(int id) {
         Session currentSession = sessionFactory.getCurrentSession();
         SanPhamTrongGioHang sanPhamTrongGioHang = currentSession.get(SanPhamTrongGioHang.class, id);
         return  sanPhamTrongGioHang;
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void saveSanPhamTrongGioHang(SanPhamTrongGioHang sanPhamTrongGioHang, int id) {
        Session currentSession = sessionFactory.getCurrentSession();
            GioHang gioHang = currentSession.get(GioHang.class, id);
            gioHang.addSanPhamTrongGioHang(sanPhamTrongGioHang);
            currentSession.saveOrUpdate(sanPhamTrongGioHang);
    }

    @Override
    public void deleteSanPhamTrongGioHang(int theId) {
         Session currentSession = sessionFactory.getCurrentSession();
           SanPhamTrongGioHang sanPhamTrongGioHang = currentSession.get(SanPhamTrongGioHang.class, theId);
           currentSession.delete(sanPhamTrongGioHang);
      //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    @Override
    public int countGioHang(int giohangId){
        int soluongsanpham = 0;
           String giohangidString = String.valueOf(giohangId);
          Session currentSession = sessionFactory.getCurrentSession();
          Query query = currentSession.createSQLQuery("select count(*) from san_pham_trong_gio_hang where san_pham_trong_gio_hang.maghh=:giohangId");
          //query.setParameter("giohangId", "'"+giohangId +"'");
          query.setString("giohangId", giohangidString);
          soluongsanpham = (int) query.uniqueResult();
          //  query.setString("email", "something");
          return soluongsanpham;
          
    }
    //select Sum(so_luong * gia_san_pham) from san_pham_trong_gio_hang where maghh = 1
     @Override
    public double TongGiaGioHang(int giohangId){
         double TongGia = 0;
          String giohangidString = String.valueOf(giohangId);
          Session currentSession = sessionFactory.getCurrentSession();
          Query query = currentSession.createSQLQuery("select Sum(so_luong * gia_san_pham) from san_pham_trong_gio_hang where san_pham_trong_gio_hang.maghh=:giohangId");
          //query.setParameter("giohangId", "'"+giohangId +"'");
          query.setString("giohangId", giohangidString);
          TongGia = (double) query.uniqueResult();
         return TongGia;
     }

}
