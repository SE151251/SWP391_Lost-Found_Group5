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
public class Comment implements Serializable{
    private Article article;
    private Member member;
    private String commentContent;
    private LocalDateTime commentTime;
    private int status;

    public Comment() {
        article=null;
        member=null;
        commentContent="";
        commentTime=null;
        status=0;
    }

    public Comment(Article article, Member member, String commentContent, LocalDateTime commentTime, int status) {
        this.article = article;
        this.member = member;
        this.commentContent = commentContent;
        this.commentTime = commentTime;
        this.status = status;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member memberID) {
        this.member = memberID;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public LocalDateTime getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(LocalDateTime commentTime) {
        this.commentTime = commentTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
    
    
}
