package model;

import java.sql.Date;

public class Blog {

    private int blogID;
    private String title;
    private String thumbnails;
    private String content;
    private int categoryID;
    private Date createdDate;
    private Date publishedDate;
    private int status;
    private int authorID;
    private String authorName;
    private String categoryName;

    public Blog() {
    }

    public Blog(int blogID, String title, String thumbnails, String content, int categoryID, Date createdDate, Date publishedDate, int status, int authorID, String authorName, String categoryName) {
        this.blogID = blogID;
        this.title = title;
        this.thumbnails = thumbnails;
        this.content = content;
        this.categoryID = categoryID;
        this.createdDate = createdDate;
        this.publishedDate = publishedDate;
        this.status = status;
        this.authorID = authorID;
        this.authorName = authorName;
        this.categoryName = categoryName;
    }

    public int getBlogID() {
        return blogID;
    }

    public void setBlogID(int blogID) {
        this.blogID = blogID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getThumbnails() {
        return thumbnails;
    }

    public void setThumbnails(String thumbnails) {
        this.thumbnails = thumbnails;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getPublishedDate() {
        return publishedDate;
    }

    public void setPublishedDate(Date publishedDate) {
        this.publishedDate = publishedDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getAuthorID() {
        return authorID;
    }

    public void setAuthorID(int authorID) {
        this.authorID = authorID;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

}
