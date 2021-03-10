package grocerystore;

import java.sql.*;
import java.math.*;

public class Database {
	String usr;
	String pwd;
	final String url = "jdbc:postgresql://localhost/grocerystore";

	public Database() {
		usr = "Teleportal";
		pwd = "encrypted";
	}
	
	public Database(String user, String pwd) {
		this.usr = user;
		this.pwd = pwd;
	}
	
	public String viewProducts(String state) { //option 2.1
		String output = "";
		String request = "SELECT product_id, name, description FROM Product NATURAL JOIN Price WHERE state = " + state;
		try (Connection conn = DriverManager.getConnection(url, usr, pwd);
				Statement stmt = conn.createStatement();
				ResultSet rset = stmt.executeQuery(request);) {
			output = "ID  NAME                Description\n";
			output += "-                                  -";
			while (rset.next()) {
				output += rset.getString("product_id") + " ";
				output += rset.getString("name") + " ";
				output += rset.getString("description") + " ";
				output += "\n";
			}
			
		}catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		if (output == "") {
			return "There was an error in the process.";
		} else {
			return output;
		}
	}
	
	public String viewProductsByType(String type) { //option 2.2
		String output = "";
		try (Connection conn = DriverManager.getConnection(url, usr, pwd);
				PreparedStatement pstmt = conn.prepareStatement("SELECT product_id, name, description FROM Product WHERE type = ?");) {
			pstmt.setString(1, type);
			ResultSet rset = pstmt.executeQuery();
			output = "ID  NAME                Description\n";
			output += "-                                  -";
			while (rset.next()) {
				output += rset.getString("product_id") + " ";
				output += rset.getString("name") + " ";
				output += rset.getString("description") + " ";
				output += "\n";
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		if (output == "") {
			return "There was an error in the process.";
		} else {
			return output;
		}
	}
	
	public void placeOrder(String[] shoppingCart) { //option 2.6
		try (Connection conn = DriverManager.getConnection(url, usr, pwd);
				PreparedStatement pstmt = conn.prepareStatement("insert into order (customer_id, order_date, status, card_number, price) values (?,?,?,?,?)");
				PreparedStatement orderstmt = conn.prepareStatement("insert into order_product (order_id, product_id, amount) values (?,?,?)")) {
			
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		System.out.println("");
	}
	
	public void addAddress(int user_id, String streetNum, String streetName, String unit, String city, String state, String zip, String type) { //option 2.7
		try (Connection conn = DriverManager.getConnection(url, usr, pwd);
				PreparedStatement pstmt = conn.prepareStatement("insert into address (street_number, street_name, unit_number, city, state, zip) values (?,?,?,?,?,?)");
				PreparedStatement pstmt2 = conn.prepareStatement("insert into customer_address (customer_id, address_id, type) values (?,?,?)");
				PreparedStatement retrieval = conn.prepareStatement("SELECT address_id FROM address WHERE street_number = ? and street_name = ? and city = ? and state = ?");) {
			pstmt.setString(1, streetNum);
			pstmt.setString(2, streetName);
			pstmt.setString(3, unit);
			pstmt.setString(4, city);
			pstmt.setString(5, state);
			pstmt.setString(6, zip);
			pstmt.executeUpdate();
			
			retrieval.setString(1, streetNum);
			retrieval.setString(2, streetName);
			retrieval.setString(3, city);
			retrieval.setString(4, state);
			
			ResultSet rset = retrieval.executeQuery();
			rset.next();
			int address_id = rset.getInt("address_id");
			
			pstmt2.setInt(1, user_id);
			pstmt2.setInt(2, address_id);
			pstmt2.setString(3, type);
			pstmt2.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		System.out.println("");
	}
	
	public void changeAddress(int address_id, int user_id, String streetNum, String streetName, String unit, String city, String state, String zip, String type) { //option 2.8
		try (Connection conn = DriverManager.getConnection(url, usr, pwd);
				PreparedStatement pstmt = conn.prepareStatement("update address set street_number = ?, street_name = ?, unit_number = ?, city = ?, state = ?, zip = ? where address_id = ?");
				PreparedStatement pstmt2 = conn.prepareStatement("update customer_address set type = ? where customer_id = ? and address_id = ?");) {
			pstmt.setString(1, streetNum);
			pstmt.setString(2, streetName);
			pstmt.setString(3, unit);
			pstmt.setString(4, city);
			pstmt.setString(5, state);
			pstmt.setString(6, zip);
			pstmt.setInt(7, address_id);
			pstmt.executeUpdate();
			
			pstmt2.setString(1, type);
			pstmt2.setInt(2, user_id);
			pstmt2.setInt(3, address_id);
			pstmt2.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		System.out.println("");
	}
	
	public void deleteAddress(int address_id) { //option 2.9
		try (Connection conn = DriverManager.getConnection(url, usr, pwd);
				PreparedStatement pstmt = conn.prepareStatement("delete from address where address_id = ?");) {
			pstmt.setInt(1, address_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		System.out.println("");
	}
	
	public void addCreditCard(int user_id, String card_number, int address_id) { //option 2.10
		try (Connection conn = DriverManager.getConnection(url, usr, pwd);
				PreparedStatement pstmt = conn.prepareStatement("insert into credit_card values (?,?,?)");) {
			pstmt.setString(1, card_number);
			pstmt.setInt(2, user_id);
			pstmt.setInt(3, address_id);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		System.out.println("");
	}
	
	public void changeCreditCard(int user_id, String card_number, int address_id) { //option 2.11
		try (Connection conn = DriverManager.getConnection(url, usr, pwd);
				PreparedStatement pstmt = conn.prepareStatement("update credit_card set card_number = ? where user_id = ? and addres_id = ?");) {
			pstmt.setString(1, card_number);
			pstmt.setInt(2, user_id);
			pstmt.setInt(3, address_id);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		System.out.println("");
	}
	
	public void deleteCreditCard(String card_number) { //option 2.12
		try (Connection conn = DriverManager.getConnection(url, usr, pwd);
				PreparedStatement pstmt = conn.prepareStatement("delete from credit_card where card_number = ?");) {
			pstmt.setString(1, card_number);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		System.out.println("");
	}
	
	public void addProduct(String name, String type, BigDecimal size, String description) { //option 1.1
		try (Connection conn = DriverManager.getConnection(url, usr, pwd);
			PreparedStatement pstmt = conn.prepareStatement("insert into product (name, type, size, description) values (?,?,?,?)");) {
				pstmt.setString(1, name);
				pstmt.setString(2, type);
				pstmt.setBigDecimal(3, size);
				pstmt.setString(4, description);
				pstmt.executeUpdate();
			
		}catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		System.out.println("Your product has been added");
	}
	
	public void deleteProduct(int product_id) { //option 1.2
		try (Connection conn = DriverManager.getConnection(url, usr, pwd);
				PreparedStatement pstmt = conn.prepareStatement("Delete from product where product_id =?");) {
					pstmt.setInt(1, product_id);
					pstmt.executeUpdate();
				
			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		System.out.println("Your product has been deleted");
	}
	
	public void changeProduct(int product_id, String name, String type, BigDecimal size, String description) { //option 1.3
		try (Connection conn = DriverManager.getConnection(url, usr, pwd);
				PreparedStatement pstmt = conn.prepareStatement("update product set name = ?, type = ?, size = ?, description = ? where product_id = ?");) {
			pstmt.setString(1, name);
			pstmt.setString(2, type);
			pstmt.setBigDecimal(3, size);
			pstmt.setString(4, description);
			pstmt.setInt(5, product_id);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		System.out.println("");
	}
	
	public void changeProductPrice(int product_id, String state, BigDecimal price) { //option 1.4
		try (Connection conn = DriverManager.getConnection(url, usr, pwd);
				PreparedStatement pstmt = conn.prepareStatement("update price set amount = ? WHERE product_id = ? AND state = ?");) {
			pstmt.setBigDecimal(1, price);
			pstmt.setInt(2, product_id);
			pstmt.setString(3, state);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		System.out.println("");
	}
	

	public void addStock(int warehouse_id, int product_id, int num) { // option 1.5
		try (Connection conn = DriverManager.getConnection(url, usr, pwd);
				PreparedStatement pstmt = conn.prepareStatement("insert into stock (warehouse_id, product_id, num) values (?,?,?)");) {
					pstmt.setInt(1, warehouse_id);
					pstmt.setInt(2, product_id);
					pstmt.setInt(3, num);
					pstmt.executeUpdate();
				
			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		System.out.println("Stock has been added");
	}
}
