package com.mycompany.service;

import com.mycompany.config.AppConfig;
import com.mycompany.entity.CacheUser;
import com.mycompany.entity.GioHang;
import com.mycompany.entity.SanPhamTrongGioHang;
import org.ehcache.Cache;
import org.ehcache.CacheManager;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;

import java.util.*;

public class DumpService {

    public static String getSessionID(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        WebAuthenticationDetails details = (WebAuthenticationDetails) auth.getDetails();
        return details.getSessionId();
    }

    public static boolean isAnony(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if(auth instanceof AnonymousAuthenticationToken){
            return true;
        }
        return false;
    }

    public static String getUserName(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return auth.getName();
    }

    public static CacheUser getCacheBySessionID(String sessionID){
        if(sessionID == null) return null;
        Cache<String, CacheUser> userCache = AppConfig.cacheManager.getCache("userCache", String.class, CacheUser.class);
        CacheUser cache = userCache.get(sessionID);
        if(cache == null){
            cache = new CacheUser(sessionID, new GioHang(new ArrayList<>()));
            AppConfig.userCache.put(sessionID,cache);
        }
        return cache;
    }

    public static void CleanCacheUser(String sessionID){
        if(sessionID == null) return;
        AppConfig.userCache.remove(sessionID);
        AppConfig.userCache.put(sessionID,new CacheUser(sessionID, new GioHang(new ArrayList<>())));
        return;
    }

    public static GioHang CacheUpdateCard(String sessionID,SanPhamTrongGioHang sp){
        if(sessionID == null) return null;
        CacheUser cache =  getCacheBySessionID(sessionID);
//        AppConfig.userCache.remove(sessionID);
        cache.CacheUpdateCart(sp);
        AppConfig.userCache.put(sessionID,new CacheUser(sessionID, cache.giohang));
        return cache.giohang;
    }

    //check if product belong to cart
    public static boolean CacheCardCheckProduct(String sessionID,int id){
        if(sessionID == null) return false;
        CacheUser cache = getCacheBySessionID(sessionID);
        if(cache.giohang.getSanPhamTrongGioHang(id) != null)
            return true;
        return false;
    }
}
