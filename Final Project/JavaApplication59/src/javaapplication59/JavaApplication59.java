package javaapplication59;

import java.sql.*;
import java.util.Scanner;

public class JavaApplication59 {


     public static void main(String[] args) {
      try {
	          Class.forName("com.mysql.jdbc.Driver");
		   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/company?zeroDateTimeBehavior=convertToNull", "root", "");
		   Statement stmt = con.createStatement();
           System.out.println("Enter price");
           Scanner x=new Scanner(System.in);
          int p=x.nextInt();
		   ResultSet rs = stmt.executeQuery("SELECT *  from apartements  WHERE price <= "+p);
                 
                 System.out.println("------------------");
                 System.out.println("apartement_id\t Building_id\t area\t floor\t price\t description\t\t deminsions_rooms\t no_rooms\t no_bathrooms\t sold_date");
		   while (rs.next())
				System.out.println(rs.getInt(1) + "\t   " + rs.getString(2) + "\t  " + rs.getString(3)+ "\t  " + rs.getString(4) + "\t  " + rs.getString(5)+ "\t  " + rs.getString(6)+ "\t  " + rs.getString(7) + "\t\t  " + rs.getString(8)+ "\t  " + rs.getString(9) + "\t  " + rs.getString(10));
            System.out.println();
           ResultSet rs1 = stmt.executeQuery("SELECT * FROM apartements where apartement_id not in (SELECT apartement_id FROM customers)");
             System.out.println("------------------");
		while (rs1.next())
		          System.out.println(rs1.getString(1) + "\t   " + rs1.getString(2) + "\t  " + rs1.getString(3)+ "\t  " + rs1.getString(4) + "\t  " + rs1.getString(5)+ "\t  " + rs1.getString(6)+ "\t  " + rs1.getString(7) + "\t\t  " + rs1.getString(8)+ "\t  " + rs1.getString(9) + "\t  " + rs1.getString(10));
        System.out.println();
           ResultSet rs2 = stmt.executeQuery("SELECT installment_id,c.customer_id,age,phone,first_name , last_name FROM installments i join customers c on i.customer_id=c.customer_id");
             System.out.println("------------------");
             System.out.println("installment_id\t customer_id\t age\t phone\t first_name\t last_name");
		while (rs2.next())
		          System.out.println(rs2.getInt(1) + "\t  " + rs2.getString(2) + "\t  " + rs2.getString(3)+ "\t  " + rs2.getString(4) + "\t  " + rs2.getString(5)+ "\t  " + rs2.getString(6));
        System.out.println();
           ResultSet rs3 = stmt.executeQuery("SELECT apartement_id from apartements WHERE sold_date > '2021/12/3'");
             System.out.println("apartements that were sold this month");
             System.out.println("------------------");
		while (rs3.next())
		          System.out.println(rs3.getInt(1));
        System.out.println();
           ResultSet rs4 = stmt.executeQuery("select apartement_id FROM  installments where amount>=60000 GROUP by apartement_id having COUNT(*)>5");
             System.out.println("apartements have installment > 60000 and installment is greater than 5");
             System.out.println("--------------------------------");
             System.out.println("installment_id");
		while (rs4.next())
		          System.out.println(rs4.getInt(1) );
        
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
     }
     
}
