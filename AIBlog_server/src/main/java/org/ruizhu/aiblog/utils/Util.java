package org.ruizhu.aiblog.utils;

import org.ruizhu.aiblog.model.User;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * Created by Rui Zhu
 */
public class Util {
    public static User getCurrentUser() {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return user;
    }
}
