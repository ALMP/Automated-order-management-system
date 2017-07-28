package com.hellokoding.account.Models;

import java.io.Serializable;

/**
 * Created by Max on 21.11.2016.
*/
public class Reg implements Serializable {
    private String login;
    public String getLogin() {
        return this.login;
    }
    public void setLogin(String login) {
        this.login = login;
    }

    private String password;
    public String getPassword() {
        return this.password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

}

