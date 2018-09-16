package com.coding.ProdCat.Controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.coding.ProdCat.Models.Category;
import com.coding.ProdCat.Models.Product;
import com.coding.ProdCat.Services.MainService;

@Controller
public class MainController {
	private final MainService mainService;
	public MainController(MainService mainService) {
		this.mainService = mainService;
	}
	@RequestMapping(value= {"/","/categories","/products"})
	public String index(Model model) {
		model.addAttribute("categories",mainService.allCategorys());
		model.addAttribute("products",mainService.allProducts());
		return"index";
	}
	@RequestMapping("/products/{id}")
	public String showproduct(@PathVariable("id") Long id, Model model) {
		if(mainService.checkProduct(id)==false) {return "redirect:/";}
		List<Category> x = mainService.findProduct(id).getCategories();
		List<Category> categories = mainService.allCategorys();
			categories.removeAll(x);
			model.addAttribute("product",mainService.findProduct(id));
			model.addAttribute("categories", categories);
		return"showproduct";
	}
	@RequestMapping("/categories/{id}")
	public String showcategory(@PathVariable("id") Long id,  Model model) {
		if(mainService.checkCategory(id)==false) {return "redirect:/";}
		List<Product> x = mainService.findCategory(id).getProducts();
		List<Product> products = mainService.allProducts();
			products.removeAll(x);
			model.addAttribute("category",mainService.findCategory(id));
			model.addAttribute("products", products);
		return"showcategory";
	}
	@RequestMapping("/products/new")
	public String newproduct(@ModelAttribute("product")Product product) {
		return"newproduct";
	}
	@RequestMapping("/categories/new")
	public String newcategory(@ModelAttribute("category")Category category) {
		return"newcategory";
	}
// ~~~~~~~Operations~~~~~~~ //

// create
@RequestMapping(value="/categories/new", method=RequestMethod.POST)
public String newCategory(@Valid @ModelAttribute("category")Category category, BindingResult result) {
	if(result.hasErrors()){
		return "newcategory";
	}
	mainService.createCategory(category);
	return"redirect:/categories/"+category.getId();
	}
@RequestMapping(value="/products/new", method=RequestMethod.POST)
public String newProduct(@Valid @ModelAttribute("product")Product product, BindingResult result) {
	if(result.hasErrors()){
		return "newproduct";
	}	
	mainService.createProduct(product);
	return"redirect:/products/"+product.getId();
	}
// add
@RequestMapping(value="/categories/{id}" ,method=RequestMethod.PUT)
public String addProduct(@PathVariable("id")Long id, @Valid @ModelAttribute("category") Category category,BindingResult result){
	Category updatable = mainService.findCategory(category.getId());
			System.out.println(":::: updating "+ updatable.getName());
			System.out.println("list of (current) products: "+ updatable.getProducts());
	List<Product> temp = category.getProducts();
	if(temp.isEmpty()==false) {
			System.out.println("size of products selected: "+ temp.size());
		for(int i = 0 ; i < temp.size(); i ++) {
			updatable.getProducts().add(temp.get(i));
				System.out.println("added : "+i+" "+ temp.get(i).getName());			
		}
		mainService.createCategory(updatable);
			System.out.println("new list of products: "+ updatable.getProducts());
	}
	else {System.out.println("no product selected");}
	return "redirect:/categories/{id}";
	}
@RequestMapping(value="/products/{id}" ,method=RequestMethod.PUT)
public String addProduct(@PathVariable("id")Long id, @Valid @ModelAttribute("product") Product product,BindingResult result){
	System.out.println("hit route correctly");
	Product updatable = mainService.findProduct(product.getId());
			System.out.println(":::: updating "+ updatable.getName());
			System.out.println("list of (current) categories: "+ updatable.getCategories());
	List<Category> temp = product.getCategories();
	if(temp.isEmpty()==false) {
			System.out.println("size of categories selected: "+ temp.size());
		for(int i = 0 ; i < temp.size(); i ++) {
			updatable.getCategories().add(temp.get(i));
				System.out.println("added : "+i+" "+ temp.get(i).getName());			
		}
		mainService.createProduct(updatable);
			System.out.println("new list of categories: "+ updatable.getCategories());
	}
	else {System.out.println("no categories selected");}
	return "redirect:/products/{id}";
	}
}
