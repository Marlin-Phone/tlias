package org.example;

import org.junit.jupiter.api.Test;

public class ThreadLocalTest {
    private static final ThreadLocal<String> local = new ThreadLocal<>();

    public static void main(String[] args) {
        local.set("Main Thread Value");

        // 创建线程

        new Thread(new Runnable(){
            @Override
            public void run() {
                local.set("Thread-1 Value");
                System.out.println(Thread.currentThread().getName() + ": " + local.get());
            }
        }, "Thread-1").start();

        System.out.println(Thread.currentThread().getName() + ": " + local.get());

        local.remove();

        System.out.println(Thread.currentThread().getName() + ": " + local.get());
    }


}
