package com.coding.ProdCat.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.coding.ProdCat.Models.Category;
import com.coding.ProdCat.Models.Product;
import com.coding.ProdCat.Repositories.CategoryRepository;
import com.coding.ProdCat.Repositories.ProductRepository;

@Service
public class MainService {
	public final ProductRepository productRepository;
	public final CategoryRepository categoryRepository;
	public MainService(ProductRepository productRepository, CategoryRepository categoryRepository) {
		this.productRepository = productRepository;
		this.categoryRepository = categoryRepository;
	}
// find all
	public List<Product> allProducts() {
		return productRepository.findAll();
	}
	public List<Category> allCategorys(){
		return categoryRepository.findAll();
	}
// find one
	public Product findProduct(Long id){
		Optional<Product> temp = productRepository.findById(id);
		if(temp.isPresent()){
			return temp.get();
		}
		return null;
	}
	public Category findCategory(Long id){
		Optional<Category> temp = categoryRepository.findById(id);
		if(temp.isPresent()){
			return temp.get();
		}
		return null;
	}
// check if exists
	public boolean checkProduct(long id) {
		return productRepository.existsById(id);
	}
	public boolean checkCategory(long id) {
		return categoryRepository.existsById(id);
	}
// create or update
	public void createCategory(Category category){
		categoryRepository.save(category);
	}
	public void createProduct(Product product){
		productRepository.save(product);
	}
	
}