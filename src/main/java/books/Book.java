package books;

public class Book {
	
	private String IBSN;
	private String Title;
	private String Author;
	private String Publisher;
	private String Publication;
	private String Rating;
	private String Description;
	private String Date;
	private int quantity;
	private double price;
	
		
	public Book(String iBSN, String title, String author, String publisher,String publication,String rating,String description,String date,int quantity, double price) {
		super();
		IBSN = iBSN;
		Title = title;
		Author = author;
		Publisher = publisher;
		Publication = publication;
		Rating = rating;
		Description = description;
		Date = date;
		this.quantity = quantity;
		this.price = price;
	}
	
	/* IBSN */
	
	public String getIBSN() {
		return IBSN;
	}
	
	public void setIBSN(String newIBSN) {
		IBSN = newIBSN;
	}
	
	/* Title */
	
	public String getTitle() {
		return Title;
	}
	
	public void setTitle(String title) {
		Title = title;
	}
	
	/* Author */
	
	public String getAuthor() {
		return Author;
	}
	
	public void setAuthor(String author) {
		Author= author;
	}
	
	/* Publisher */
	
	public String getPublisher() {
		return Publisher;
	}
	
	public void setPublisher(String publisher) {
		Publisher = publisher;
	}
	
	/* Publication */
	
	public String getPublication() {
		return Publication;
	}
	
	public void setPublication(String publication) {
		Publication = publication;
	}
	
	/* Rating */
	
	public String getRating() {
		return Rating;
	}
	
	public void setRating(String rating) {
		Rating = rating;
	}
	
	/* Description */
	
	public String getDescription() {
		return Description;
	}
	
	public void setDescription(String description) {
		Description = description;
	}
	
	/* Date */
	
	public String getDate() {
		return Date;
	}
	
	public void setDate(String date) {
		Description = date;
	}
	
	/* Quantity */
	
	public int getQuantity() {
		return this.quantity;
	}
	
	
	public void setQuantity(int newQuantity) {
		this.quantity = newQuantity;
	}
	
	/* Price */
	
	public double getPrice() {
		return this.price;
	}
	
	public void setPrice(Double newPrice) {
		this.price = newPrice;
	}
}
