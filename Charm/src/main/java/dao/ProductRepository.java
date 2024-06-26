package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import dto.Product;
import mvc.database.DBConnection;

public class ProductRepository{
   
   private ArrayList<Product> listOfProducts = new ArrayList<Product>();
   private static ProductRepository instance = new ProductRepository();
   
   public static ProductRepository getInstance() {
      return instance;
   }
   
   public ProductRepository() {
      
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      String sql = "select * from product";
      
      try {
         conn = DBConnection.getConnection();
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            

            Product fn  = new Product();
            
            fn.setProductId(rs.getString("p_id"));
            fn.setPname(rs.getString("p_name"));
            fn.setUnitPrice(rs.getInt("p_unitPrice"));
            fn.setDescription(rs.getString("p_description"));
            fn.setCategory(rs.getString("p_category"));
            fn.setUnitsInStock(rs.getString("p_unitsInStock"));
            fn.setFilename(rs.getString("p_fileName"));
      
            listOfProducts.add(fn);
         }
      }catch(Exception ex) {
         System.out.println("getListCount() 에러 : " + ex);
      }finally {
         try {
            if(rs != null)
               rs.close();
            if(pstmt != null)
               pstmt.close();
            if(conn != null)
               conn.close();
         }catch(Exception ex){
            throw new RuntimeException(ex.getMessage());
         }
      }
      
   
   }
   
   public ArrayList<Product> getAllProducts(){
      return listOfProducts;
   }
   
   public Product getProductById(String productId) {
      Product productById = null;
      
      for(int i = 0; i < listOfProducts.size(); i++) {
         Product product = listOfProducts.get(i);
         
         if(product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
            productById = product;
            break;
         }
      }
      
      return productById;
   }
   
   public void addProduct(Product product) {
      listOfProducts.add(product);
   }
   
}