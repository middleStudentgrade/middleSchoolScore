package com.middleschool.score.common.utils;


import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by jay on 15-12-21.
 */
public class WebConf {

    private static Properties props = new Properties();

    static {
        try {
            InputStream in = WebConf.class.getResourceAsStream("/properties/resource.properties");
            props.load(in);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getValue(String key) {
        try {
            String value = props.getProperty(key);
            return value;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
