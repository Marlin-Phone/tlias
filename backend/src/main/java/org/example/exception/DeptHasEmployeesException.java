package org.example.exception;

/**
 * 自定义业务异常：删除部门时，如果部门下有员工则抛出该异常
 */
public class DeptHasEmployeesException extends RuntimeException {
    public DeptHasEmployeesException(String message) {
        super(message);
    }

    public DeptHasEmployeesException(String message, Throwable cause) {
        super(message, cause);
    }
}

