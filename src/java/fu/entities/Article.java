/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.entities;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 *
 * @author Admin
 */
public class Article implements Serializable {

    private String articleID;
    private String title;
    private String articleContent;
    private String imgUrl;
    private String postTime;
    private int ArticleStatus;
    private Item item;
    private Member member;
    private ArticleType type;

    public Article() {
        articleID = "";
        title="";
        articleContent = "";
        imgUrl = "";
        postTime = null;
        ArticleStatus = 1;
        item = null;
        member = null;
        type = null;
    }

    public Article(String articleID, String title, String articleContent, String imgUrl, String postTime, int ArticleStatus, Item item, Member member, ArticleType type) {
        this.articleID = articleID;
        this.title = title;
        this.articleContent = articleContent;
        this.imgUrl = imgUrl;
        this.postTime = postTime;
        this.ArticleStatus = ArticleStatus;
        this.item = item;
        this.member = member;
        this.type = type;
    }

    public String getArticleID() {
        return articleID;
    }

    public void setArticleID(String articleID) {
        this.articleID = articleID;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getPostTime() {
        return postTime;
    }

    public void setPostTime(String postTime) {
        this.postTime = postTime;
    }

    public int getArticleStatus() {
        return ArticleStatus;
    }

    public void setArticleStatus(int ArticleStatus) {
        this.ArticleStatus = ArticleStatus;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public ArticleType getType() {
        return type;
    }

    public void setType(ArticleType type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
    
}
