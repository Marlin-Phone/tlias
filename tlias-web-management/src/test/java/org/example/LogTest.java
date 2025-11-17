package org.example;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogTest{

    private static final Logger log = LoggerFactory.getLogger(LogTest.class);

    @Test
    public void testLog(){
        int a = 10;
        int b = 0;
        int c = a + b;
//        log.debug("testLog");
//        log.info("info log {}", c);
        log.trace("trace log");
        log.debug("debug log");
        log.info("info log {}",c);
        log.warn("warn log");
        log.error("error log");
    }
}