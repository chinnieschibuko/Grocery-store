package grocerystore;

import java.util.*;
import java.math.*;
//import java.sql.*;

public class Main {

	public static void main(String[] args) {
		
		boolean running = true;
		String user;
		String pwd;
		String homeState = "";
		boolean choice = false;
		Scanner scanny = new Scanner(System.in);
		
		System.out.println("Welcome to the Grocery Store Database System");
		System.out.println();
		System.out.println("Log in:");
		user = scanny.next("Username: ");
		pwd = scanny.next("Password: ");
		System.out.println();
		if (scanny.next("Are you an employee? (Y/N): ") == "Y") {
			choice = true;
		} else { //didn't have time to hook up the username/password with the customer table to get the delivery address state
			homeState = scanny.next("In that case, please enter your state: ");
		}
		System.out.println();
		
		Database grocerystore = new Database(user, pwd);
		
		while (running) {
			
			if (choice) {
				
				System.out.println("What would you like to do?");
				System.out.println();
				System.out.println("1. Add a product");
				System.out.println("2. Change an existing product");
				System.out.println("3. Delete a product");
				System.out.println("4. Change a product's price");
				System.out.println("5. Add stock to a warehouse");
				System.out.println("0. Exit");
				
			} else {
				
				System.out.println("What would you like to do?");
				System.out.println();
				System.out.println("1. View Available Products");
				System.out.println("2. View Products by Type");
				System.out.println("3. Add product (by product_id) to shopping cart");
				System.out.println("4. Delete product from shopping cart");
				System.out.println("5. Change quantity of product in cart");
				System.out.println("6. Submit Order");
				System.out.println("7. Add a new address");
				System.out.println("8. Edit an existing address");
				System.out.println("9. Delete an address");
				System.out.println("10. Add a new credit card");
				System.out.println("11. Edit an existing credit card");
				System.out.println("12. Delete a credit card");
				System.out.println("0. Exit");
				
			}
			int option = scanny.nextInt();
			
			if (choice) {
				
				if (option == 1) {
					System.out.println("You have chosen to add a product.");
					String name = scanny.next("Product Name: ");
					String type = scanny.next("Product Type (Food/Alcohol/Misc): ");
					System.out.println("Product size: ");
					BigDecimal size = scanny.nextBigDecimal();
					String description = scanny.next("Product description: ");
					
					grocerystore.addProduct(name, type, size, description);
				} else if (option == 2) {
					System.out.println("You have chosen to change a product.");
					System.out.println("Please enter the id of the product to change: ");
					int product_id = scanny.nextInt();
					String name = scanny.next("New Product Name: ");
					String type = scanny.next("New Product Type (Food/Alcohol/Misc): ");
					System.out.println("New Product size: ");
					BigDecimal size = scanny.nextBigDecimal();
					String description = scanny.next("New Product description: ");
					
					grocerystore.changeProduct(product_id, name, type, size, description);
				} else if (option == 3) {
					System.out.println("You have chosen to delete a product.");
					
					System.out.println("Please enter the id of the product to change: ");
					int product_id = scanny.nextInt();
					
					grocerystore.deleteProduct(product_id);
				} else if (option == 4) {
					System.out.println("You have chosen to change a product's price.");
					
					System.out.println("Please enter the id of the product to change: ");
					int product_id = scanny.nextInt();
					String state = scanny.next("Please enter the two letter code of the state where you want to change the price: ");
					System.out.println("And finally enter the new price for this product in that state: ");
					BigDecimal price = scanny.nextBigDecimal();
					
					grocerystore.changeProductPrice(product_id, state, price);
				} else if (option == 5) {
					System.out.println("You have chosen to add stock to a warehouse.");
					
					System.out.println("Please enter the id of the product: ");
					int product_id = scanny.nextInt();
					System.out.println("Please enter the id of the warehouse: ");
					int warehouse_id = scanny.nextInt();
					System.out.println("And please enter the amount to add to the warehouse: ");
					int amount = scanny.nextInt();
					
					grocerystore.addStock(product_id, warehouse_id, amount);
					
				} else {
					System.out.println("Goodbye.");
					running = false;
				}
				
			} else {
				
				if (option == 1) {
					System.out.println("You have chosen to display products in your area.");
					
					grocerystore.viewProducts(homeState);
					
				} else if (option == 2) {
					System.out.println("You have chosen to display products by type.");
					String type = "";
					System.out.println("1. Food");
					System.out.println("2. Alcohol");
					System.out.println("3. Misc");
					int type_choice = scanny.nextInt();
					if (type_choice == 1) {
						type = "Food";
					} else if (type_choice == 2) {
						type = "Alcohol";
					} else {
						type = "Misc";
					}
					
					grocerystore.viewProductsByType(type);
					
				} else if (option == 3) {
					System.out.println("You have chosen to add a product to your shopping cart.");
					
				} else if (option == 4) {
					System.out.println("You have chosen to delete a product from your shopping cart.");
					
				} else if (option == 5) {
					System.out.println("You have chosen to change the quantity of a product in your cart.");
					
				} else if (option == 6) {
					System.out.println("You have chosen to place your order.");
					
				} else if (option == 7) {
					System.out.println("You have chosen to add a new address to your profile.");
					
				} else if (option == 8) {
					System.out.println("You have chosen to change one of your addresses.");
					
				} else if (option == 9) {
					System.out.println("You have chosen to delete an address from your profile.");
					
				} else if (option == 10) {
					System.out.println("You have chosen to add a new credit card.");
					
				} else if (option == 11) {
					System.out.println("You have chosen to change one of your credit cards.");
					
				} else if (option == 12) {
					System.out.println("You have chosen to delete a credit card from your profile.");
					
				} else {
					System.out.println("Thank you, and goodbye.");
					running = false;
				}
				
			}
			
		}
		scanny.close();

	}

}
