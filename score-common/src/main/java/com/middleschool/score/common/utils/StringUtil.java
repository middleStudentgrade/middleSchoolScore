package com.middleschool.score.common.utils;

/**
 * Created by jay on 16-3-4.
 */
public class StringUtil {

    public static String firstCharUpperCase(String fieldName) {
        return fieldName.substring(0, 1).toUpperCase()+ fieldName.substring(1);
    }
}
