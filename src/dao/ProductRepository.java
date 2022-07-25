package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {
	
	private ArrayList<Product> listOfProducts = new ArrayList<>();
	
	//ProductRepository 인스턴스를 하나만 공유하게끔 싱글톤 패턴 이용
	private static ProductRepository instance = new ProductRepository();
	
	//인스턴스를 리턴하는 getter 메소드
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		Product phone = new Product("P1234", "Galaxy S20", 1200000);
		phone.setDescription("5.25-inch, 1334*750 HD display, 16-megaPixel Carmera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("SAMSUNG");
		phone.setUnitsInStock(1000);
		phone.setCondition("NEW");
		phone.setFilename("p1234.jpg");
		
		Product notebook = new Product("P1235", "LG GRAM", 2000000);
		notebook.setDescription("13.3-inch, IPS FULL HD display, Intel Core Processor");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1200);
		notebook.setCondition("Refurbished");
		notebook.setFilename("p1235.jpg");
		
		Product tablet = new Product("P1236", "Galaxy Tab", 900000);
		tablet.setDescription("212.8*125.6*6.6mm, Super AMOLED display, Intel Core Processor");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("SAMSUNG");
		tablet.setUnitsInStock(800);
		tablet.setCondition("Old");
		tablet.setFilename("p1236.jpg");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
		}
	
	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}
	
	//listOfProducts에 저장된 모든 상품 목록을 조회해서 상품 아이디와 일치하는 상품을 리턴해주는 메소드
	public Product getProductById(String productId) {
		Product productById = null;
		for(int i=0; i<listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if(product != null && product.getProductId() != null && 
			   product.getProductId().equals(productId)) {
				productById = product;
				break;		
			}
		}
		return productById;
	}
	
	//상품 추가 메소드
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
}
