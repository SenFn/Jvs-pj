/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.dao;

//import com.mycompany.entity.ChiTietHoaDon;
import com.mycompany.entity.GiaoHang;
import com.mycompany.entity.GioHang;
import com.mycompany.entity.HoaDon;
import com.mycompany.entity.KhachHang;
import java.math.BigDecimal;
import java.util.List;
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
public class HoaDonDaoImpl implements HoaDonDao {

    @Autowired
    private SessionFactory sessionFactory;

 
    @Override
    public List<HoaDon> getHoaDons(int khachhangId) {
        // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        // get the current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();
        Query<HoaDon> theQuery
                = currentSession.createQuery("from HoaDon  where makh =" + khachhangId, HoaDon.class);
        // execute query and get result list
        List<HoaDon> hoaDon = theQuery.getResultList();
        return hoaDon;
    }

    @Override
    public int NextIdHD() {
        BigDecimal maHd;
        int NextMaHD;
        Session currentSession = sessionFactory.getCurrentSession();
        Query query = currentSession.createSQLQuery("SELECT IDENT_CURRENT('hoa_don')+1");
        maHd = (BigDecimal) query.uniqueResult();
        NextMaHD = Integer.parseInt(String.valueOf(maHd));
        return NextMaHD;
    }

    @Override
    public HoaDon getHoaDon(int theId) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Session currentSession = sessionFactory.getCurrentSession();
        // now retrieve/read from database using the primary key
        HoaDon hoaDon = currentSession.get(HoaDon.class, theId);
        return hoaDon;
    }
@Override
    public void updateGioHangCuaHoaDon(int hoadonId, int giohangId) {
        String giohangidString = String.valueOf(giohangId);
        String hoadonidString = String.valueOf(hoadonId);
        Session currentSession = sessionFactory.getCurrentSession();
        Query query = currentSession.createSQLQuery("update gio_hang set gio_hang.mahd=:hoadonId where gio_hang.maghh=:giohangId");
        //query.setParameter("giohangId", "'"+giohangId +"'");
        query.setString("giohangId", giohangidString);
        query.setString("hoadonId", hoadonidString);
        query.executeUpdate();
    }

    @Override
    public void saveHoaDon(HoaDon hoaDon, int khachHangid) {
        Session currentSession = sessionFactory.getCurrentSession();
        KhachHang khachHang = currentSession.get(KhachHang.class, khachHangid);
        khachHang.addhoaDon(hoaDon); 
        currentSession.saveOrUpdate(hoaDon);
    }

    @Override
    public void deleteHoaDon(int theId) {
        //    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Session currentSession = sessionFactory.getCurrentSession();
        HoaDon hoaDon = currentSession.get(HoaDon.class, theId);
        currentSession.delete(hoaDon);
    }

    @Override
    public List<HoaDon> searchHoaDon(String theSearchName) {
        Session currentSession = sessionFactory.getCurrentSession();

        Query theQuery = null;
        if (theSearchName != null && theSearchName.trim().length() > 0) {

            theQuery = currentSession.createQuery("from Hoa_don where lower(ten_khach_hang) like :theName", HoaDon.class);

            theQuery.setParameter("theName", "%" + theSearchName.toLowerCase() + "%");
        } else {
            // theSearchName is empty ... so just get all customers
            theQuery = currentSession.createQuery("from Hoa_don", HoaDon.class);
        }

        // execute query and get result list
        List<HoaDon> hoaDon = theQuery.getResultList();

        // return the results        
        return hoaDon;
    }

//    @Override
//    public GiaoHang getGiaohang(int Id) {
//        HoaDon hoaDon = getHoaDon(Id);
//        GiaoHang giaoHang = hoaDon.getGiaoHangs();
//        return giaoHang;
//    }
//    
    @Override
    public GiaoHang getGiaohang(int theId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
