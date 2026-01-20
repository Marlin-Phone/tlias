CREATE TABLE clazz (
    id int UNSIGNED auto_increment comment 'ID,主键' PRIMARY KEY,
    name varchar(30) NOT NULL comment '班级名称',
    room varchar(20) NULL comment '班级教室',
    begin_date DATE NOT NULL comment '开课时间',
    end_date DATE NOT NULL comment '结课时间',
    master_id int UNSIGNED NULL comment '班主任ID, 关联员工表ID',
    subject tinyint UNSIGNED NOT NULL comment '学科, 1:java, 2:前端, 3:大数据, 4:Python, 5:Go, 6: 嵌入式',
    create_time datetime NULL comment '创建时间',
    update_time datetime NULL comment '修改时间',
    CONSTRAINT name UNIQUE (name)
) comment '班级表' engine = InnoDB;

CREATE TABLE dept (
    id int auto_increment comment 'ID, 主键' PRIMARY KEY,
    name varchar(10) NOT NULL comment '部门名称',
    create_time datetime NULL comment '创建时间',
    update_time datetime NULL comment '修改时间'
) comment '部门表' engine = InnoDB;

CREATE TABLE emp (
    id int UNSIGNED auto_increment comment 'ID,主键' PRIMARY KEY,
    username varchar(20) NOT NULL comment '用户名',
    password varchar(50) DEFAULT '123456' NULL comment '密码',
    name varchar(10) NOT NULL comment '姓名',
    gender tinyint UNSIGNED NOT NULL comment '性别, 1:男, 2:女',
    phone char(11) NOT NULL comment '手机号',
    job tinyint UNSIGNED NULL comment '职位, 1 班主任, 2 讲师 , 3 学工主管, 4 教研主管, 5 咨询师',
    salary int UNSIGNED NULL comment '薪资',
    image varchar(300) NULL comment '头像',
    entry_date DATE NULL comment '入职日期',
    dept_id int UNSIGNED NULL comment '部门ID',
    create_time datetime NULL comment '创建时间',
    update_time datetime NULL comment '修改时间',
    CONSTRAINT phone UNIQUE (phone),
    CONSTRAINT username UNIQUE (username)
) comment '员工表' engine = InnoDB;

CREATE TABLE emp_expr (
    id int UNSIGNED auto_increment comment 'ID, 主键' PRIMARY KEY,
    emp_id int UNSIGNED NULL comment '员工ID',
    begin DATE NULL comment '开始时间',
    END DATE NULL comment '结束时间',
    company varchar(50) NULL comment '公司名称',
    job varchar(50) NULL comment '职位'
) comment '工作经历' engine = InnoDB;

CREATE TABLE emp_log (
    id int UNSIGNED auto_increment comment 'ID, 主键' PRIMARY KEY,
    operate_time datetime NULL comment '操作时间',
    info varchar(1024) NULL comment '日志信息'
) comment '员工日志表' engine = InnoDB;

CREATE TABLE operate_log (
    id int UNSIGNED auto_increment comment 'ID' PRIMARY KEY,
    operate_emp_id int UNSIGNED NULL comment '操作人ID',
    operate_time datetime NULL comment '操作时间',
    class_name varchar(100) NULL comment '操作的类名',
    method_name varchar(100) NULL comment '操作的方法名',
    method_params varchar(1000) NULL comment '方法参数',
    return_value varchar(2000) NULL comment '返回值, 存储json格式',
    cost_time int NULL comment '方法执行耗时, 单位:ms'
) comment '操作日志表' engine = InnoDB;

CREATE TABLE student (
    id int UNSIGNED auto_increment comment 'ID,主键' PRIMARY KEY,
    name varchar(20) NOT NULL comment '姓名',
    no char(20) NOT NULL comment '学号',
    gender tinyint UNSIGNED NOT NULL comment '性别, 1: 男, 2: 女',
    phone varchar(11) NOT NULL comment '手机号',
    id_card char(18) NOT NULL comment '身份证号',
    is_college tinyint UNSIGNED NOT NULL comment '是否来自于院校, 1:是, 0:否',
    address varchar(100) NULL comment '联系地址',
    degree tinyint UNSIGNED NULL comment '最高学历, 1:初中, 2:高中, 3:大专, 4:本科, 5:硕士, 6:博士',
    graduation_date DATE NULL comment '毕业时间',
    clazz_id int UNSIGNED NOT NULL comment '班级ID, 关联班级表ID',
    violation_count tinyint UNSIGNED DEFAULT '0' NOT NULL comment '违纪次数',
    violation_score tinyint UNSIGNED DEFAULT '0' NOT NULL comment '违纪扣分',
    create_time datetime NULL comment '创建时间',
    update_time datetime NULL comment '修改时间',
    CONSTRAINT id_card UNIQUE (id_card),
    CONSTRAINT no UNIQUE (no),
    CONSTRAINT phone UNIQUE (phone)
) comment '学员表' engine = InnoDB;

INSERT INTO
    clazz (
        id,
        name,
        room,
        begin_date,
        end_date,
        master_id,
        subject,
        create_time,
        update_time
    )
VALUES (
        1,
        '前端就业90期11111',
        '210',
        '2024-07-10',
        '2024-01-20',
        3,
        2,
        '2024-06-01 17:45:12',
        '2025-12-30 19:55:00'
    ),
    (
        3,
        'JavaEE就业165期',
        '108',
        '2024-06-15',
        '2024-12-25',
        6,
        1,
        '2024-06-01 17:45:40',
        '2025-12-30 21:38:13'
    ),
    (
        4,
        'JavaEE就业166期',
        '105',
        '2024-07-20',
        '2024-02-20',
        20,
        1,
        '2024-06-01 17:46:10',
        '2025-12-30 18:32:57'
    ),
    (
        5,
        '大数据就业58期',
        '209',
        '2026-08-01',
        '2027-02-15',
        7,
        3,
        '2024-06-01 17:51:21',
        '2025-12-30 18:32:59'
    ),
    (
        6,
        'JavaEE就业167期',
        '325',
        '2024-11-20',
        '2026-05-10',
        36,
        1,
        '2024-11-15 11:35:46',
        '2025-12-30 18:33:01'
    ),
    (
        8,
        '测试班级',
        '110',
        '2025-10-28',
        '2025-12-05',
        6,
        2,
        NULL,
        '2025-11-29 03:47:54'
    );

INSERT INTO
    dept (
        id,
        name,
        create_time,
        update_time
    )
VALUES (
        1,
        'test',
        '2024-09-25 09:47:40',
        '2025-12-31 09:51:50'
    ),
    (
        2,
        '教研部',
        '2024-09-25 09:47:40',
        '2025-12-30 17:26:59'
    ),
    (
        3,
        '咨询部',
        '2024-09-25 09:47:40',
        '2025-12-29 15:51:56'
    ),
    (
        4,
        '就业部',
        '2024-09-25 09:47:40',
        '2025-12-29 15:52:00'
    ),
    (
        7,
        '教研部',
        '2025-11-17 12:33:45',
        '2025-11-17 12:33:45'
    ),
    (
        8,
        '财务部',
        '2025-11-17 12:35:07',
        '2025-11-17 12:35:07'
    );

INSERT INTO
    emp_expr (
        id,
        emp_id,
        begin,
        END,
        company,
        job
    )
VALUES (
        3,
        NULL,
        '1983-10-18',
        '1998-04-14',
        'nulla',
        'commodo Ex'
    ),
    (
        4,
        NULL,
        '2019-03-20',
        '1972-12-26',
        'commodo qui deserunt',
        'in'
    ),
    (
        5,
        NULL,
        '2009-03-30',
        '1961-09-26',
        'fugiat culpa voluptate exercitation nostrud',
        'exercitation ma'
    ),
    (
        8,
        NULL,
        '2022-11-07',
        '2022-12-31',
        '滴滴',
        '前台'
    ),
    (
        9,
        NULL,
        '2025-11-10',
        '2025-11-24',
        '抖音',
        '客服'
    ),
    (
        14,
        NULL,
        '2025-11-06',
        '2025-12-30',
        'afd',
        'afds'
    ),
    (
        15,
        NULL,
        '2025-11-07',
        '2025-11-21',
        'fasdf',
        'ff'
    ),
    (
        16,
        NULL,
        '2025-11-11',
        '2025-11-21',
        'fasd',
        'gaffa'
    ),
    (
        17,
        NULL,
        '2025-11-20',
        '2025-11-29',
        'afsad',
        'fds'
    ),
    (
        18,
        4,
        '2020-01-01',
        '2021-01-01',
        '百度',
        'java开发'
    ),
    (
        19,
        4,
        '2021-01-01',
        '2023-01-01',
        '阿里巴巴',
        '高级java开发'
    ),
    (
        20,
        NULL,
        '2020-09-01',
        '2023-07-01',
        '浐灞二中',
        '课代表'
    ),
    (
        21,
        NULL,
        '2017-09-01',
        '2020-07-01',
        '爱知中学',
        '学生'
    ),
    (
        22,
        NULL,
        '1956-04-27',
        '1982-10-18',
        'aliquip laborum sed qui consequat',
        'commodo ex sint'
    ),
    (
        23,
        NULL,
        '1956-04-27',
        '1982-10-18',
        'aliquip laborum sed qui consequat',
        'commodo ex sint'
    ),
    (
        24,
        NULL,
        '1956-04-27',
        '1982-10-18',
        'aliquip laborum sed qui consequat',
        'commodo ex sint'
    ),
    (
        25,
        NULL,
        '1956-04-27',
        '1982-10-18',
        'aliquip laborum sed qui consequat',
        'commodo ex sint'
    ),
    (
        26,
        NULL,
        '1956-04-27',
        '1982-10-18',
        'aliquip laborum sed qui consequat',
        'commodo ex sint'
    ),
    (
        27,
        NULL,
        '1956-04-27',
        '1982-10-18',
        'aliquip laborum sed qui consequat',
        'commodo ex sint'
    ),
    (
        28,
        NULL,
        '1956-04-27',
        '1982-10-18',
        'aliquip laborum sed qui consequat',
        'commodo ex sint'
    ),
    (
        29,
        NULL,
        '1956-04-27',
        '1982-10-18',
        'aliquip laborum sed qui consequat',
        'commodo ex sint'
    ),
    (
        30,
        NULL,
        '1956-04-27',
        '1982-10-18',
        'aliquip laborum sed qui consequat',
        'commodo ex sint'
    ),
    (
        31,
        NULL,
        '1956-04-27',
        '1982-10-18',
        'aliquip laborum sed qui consequat',
        'commodo ex sint'
    ),
    (
        32,
        NULL,
        '1956-04-27',
        '1982-10-18',
        'aliquip laborum sed qui consequat',
        'commodo ex sint'
    ),
    (
        33,
        NULL,
        '1956-04-27',
        '1982-10-18',
        'aliquip laborum sed qui consequat',
        'commodo ex sint'
    ),
    (
        34,
        NULL,
        '1956-04-27',
        '1982-10-18',
        'aliquip laborum sed qui consequat',
        'commodo ex sint'
    ),
    (
        35,
        NULL,
        '1956-04-27',
        '1982-10-18',
        'aliquip laborum sed qui consequat',
        'commodo ex sint'
    ),
    (
        36,
        NULL,
        '1956-04-27',
        '1982-10-18',
        'aliquip laborum sed qui consequat',
        'commodo ex sint'
    ),
    (
        37,
        NULL,
        '1956-04-27',
        '1982-10-18',
        'aliquip laborum sed qui consequat',
        'commodo ex sint'
    ),
    (
        38,
        NULL,
        '1956-04-27',
        '1982-10-18',
        'aliquip laborum sed qui consequat',
        'commodo ex sint'
    ),
    (
        39,
        NULL,
        '1956-04-27',
        '1982-10-18',
        'aliquip laborum sed qui consequat',
        'commodo ex sint'
    ),
    (
        54,
        57,
        '2020-06-01',
        '2023-07-19',
        '浐灞二中',
        '学生'
    ),
    (
        55,
        57,
        '2023-11-11',
        '2027-11-11',
        '陕西科技大学',
        '学生'
    );

INSERT INTO
    emp_log (id, operate_time, info)
VALUES (
        1,
        '2025-11-24 23:34:11',
        '新增员工Emp(id=null, username=aa, password=null, name=AA, gender=1, phone=12345678909, job=5, salary=2332, image=, entryDate=2025-11-17, deptId=8, createTime=2025-11-24T23:34:10.330330400, updateTime=2025-11-24T23:34:10.330330400, deptName=null, exprList=[EmpExpr(id=null, empId=null, begin=2025-11-06, end=2025-12-30, company=afd, job=afds)])'
    ),
    (
        4,
        '2025-11-24 23:46:41',
        '新增员工Emp(id=null, username=abc, password=null, name=ajf, gender=1, phone=12345677707, job=5, salary=2323, image=, entryDate=2025-11-24, deptId=7, createTime=2025-11-24T23:46:40.712086200, updateTime=2025-11-24T23:46:40.712086200, deptName=null, exprList=[EmpExpr(id=null, empId=null, begin=2025-11-07, end=2025-11-21, company=fasdf, job=ff)])'
    ),
    (
        5,
        '2025-11-24 23:58:18',
        '新增员工Emp(id=null, username=abc, password=null, name=ajf, gender=1, phone=12345677707, job=5, salary=2323, image=, entryDate=2025-11-24, deptId=7, createTime=2025-11-24T23:58:17.536067500, updateTime=2025-11-24T23:58:17.536067500, deptName=null, exprList=[EmpExpr(id=null, empId=null, begin=2025-11-07, end=2025-11-21, company=fasdf, job=ff)])'
    ),
    (
        6,
        '2025-11-25 23:36:49',
        '新增员工Emp(id=null, username=123, password=null, name=111, gender=1, phone=12312312342, job=1, salary=12345, image=[Ljava.lang.String;@aaccf45//java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/11/10e10f69-f287-47c0-b67a-a9e94a3acde5.jpg, entryDate=2025-11-01, deptId=8, createTime=2025-11-25T23:36:48.896710400, updateTime=2025-11-25T23:36:48.896710400, deptName=null, exprList=[EmpExpr(id=null, empId=null, begin=2025-11-11, end=2025-11-21, company=fasd, job=gaffa)])'
    ),
    (
        7,
        '2025-11-25 23:56:17',
        '新增员工Emp(id=null, username=ad, password=null, name=hafds, gender=1, phone=12323453454, job=1, salary=12312, image=https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/11/cf273d4e-ea86-4799-b0e6-1014f894c2c6.jpg, entryDate=2025-11-05, deptId=7, createTime=2025-11-25T23:56:16.756531300, updateTime=2025-11-25T23:56:16.756531300, deptName=null, exprList=[EmpExpr(id=null, empId=null, begin=2025-11-20, end=2025-11-29, company=afsad, job=fds)])'
    ),
    (
        8,
        '2025-11-26 17:30:02',
        '删除员工ID列表[55]'
    ),
    (
        9,
        '2025-11-26 17:30:27',
        '删除员工ID列表[55]'
    ),
    (
        10,
        '2025-11-26 17:33:08',
        '删除员工ID列表[55]'
    ),
    (
        11,
        '2025-11-26 17:33:24',
        '删除员工ID列表[54, 50]'
    ),
    (
        12,
        '2025-11-26 17:36:00',
        '删除员工ID列表[45, 37]'
    ),
    (
        13,
        '2025-11-26 23:32:37',
        '新增员工Emp(id=null, username=marlin, password=null, name=Marlin, gender=1, phone=15398090382, job=3, salary=10000000, image=https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/11/c6a19110-2720-4b21-a252-95b07475682a.jpg, entryDate=2023-09-01, deptId=8, createTime=2025-11-26T23:32:37.314623100, updateTime=2025-11-26T23:32:37.314623100, deptName=null, exprList=[EmpExpr(id=null, empId=null, begin=2020-09-01, end=2023-07-01, company=浐灞二中, job=课代表), EmpExpr(id=null, empId=null, begin=2017-09-01, end=2020-07-01, company=爱知中学, job=学生)])'
    ),
    (
        14,
        '2025-11-26 23:44:21',
        '新增员工Emp(id=null, username=宿建华, password=null, name=韶斌, gender=73, phone=, job=12, salary=99, image=https://loremflickr.com/400/400?lock=6399464570984230, entryDate=2025-06-07, deptId=2, createTime=2025-11-26T23:44:19.915204400, updateTime=2025-11-26T23:44:19.915204400, deptName=null, exprList=[EmpExpr(id=null, empId=null, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint), EmpExpr(id=null, empId=null, begin=1965-11-04, end=1987-01-06, company=Ut sit, job=dolore exercitati)])'
    ),
    (
        15,
        '2025-11-26 23:44:38',
        '新增员工Emp(id=null, username=宿建华, password=null, name=韶斌, gender=73, phone=, job=12, salary=99, image=https://loremflickr.com/400/400?lock=6399464570984230, entryDate=2025-06-07, deptId=2, createTime=2025-11-26T23:44:38.050828700, updateTime=2025-11-26T23:44:38.050828700, deptName=null, exprList=[EmpExpr(id=null, empId=null, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint), EmpExpr(id=null, empId=null, begin=1965-11-04, end=1987-01-06, company=Ut sit, job=dolore exercitati)])'
    ),
    (
        16,
        '2025-11-26 23:47:38',
        '新增员工Emp(id=null, username=宿建华, password=null, name=韶斌, gender=1, phone=15398090987, job=12, salary=99, image=https://loremflickr.com/400/400?lock=6399464570984230, entryDate=2025-06-07, deptId=2, createTime=2025-11-26T23:47:38.320020700, updateTime=2025-11-26T23:47:38.320020700, deptName=null, exprList=[EmpExpr(id=null, empId=null, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint), EmpExpr(id=null, empId=null, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint)])'
    ),
    (
        17,
        '2025-11-26 23:48:33',
        '删除员工ID列表[60]'
    ),
    (
        18,
        '2025-11-26 23:48:37',
        '新增员工Emp(id=null, username=宿建华, password=null, name=韶斌, gender=1, phone=15398090987, job=12, salary=99, image=https://loremflickr.com/400/400?lock=6399464570984230, entryDate=2025-06-07, deptId=2, createTime=2025-11-26T23:48:36.541126700, updateTime=2025-11-26T23:48:36.541126700, deptName=null, exprList=[EmpExpr(id=null, empId=null, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint), EmpExpr(id=null, empId=null, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint)])'
    ),
    (
        19,
        '2025-11-26 23:48:52',
        '删除员工ID列表[61]'
    ),
    (
        20,
        '2025-11-26 23:48:58',
        '新增员工Emp(id=null, username=宿建华, password=null, name=韶斌, gender=1, phone=15398090987, job=12, salary=99, image=https://loremflickr.com/400/400?lock=6399464570984230, entryDate=2025-06-07, deptId=2, createTime=2025-11-26T23:48:57.733756, updateTime=2025-11-26T23:48:57.733756, deptName=null, exprList=[EmpExpr(id=null, empId=null, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint), EmpExpr(id=null, empId=null, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint)])'
    ),
    (
        21,
        '2025-11-26 23:50:39',
        '删除员工ID列表[62]'
    ),
    (
        22,
        '2025-11-26 23:50:50',
        '新增员工Emp(id=null, username=宿建华, password=null, name=韶斌, gender=1, phone=15398090987, job=1, salary=11119, image=https://loremflickr.com/400/400?lock=6399464570984230, entryDate=2025-06-07, deptId=2, createTime=2025-11-26T23:50:50.257304, updateTime=2025-11-26T23:50:50.257304, deptName=null, exprList=[EmpExpr(id=null, empId=null, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint), EmpExpr(id=null, empId=null, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint)])'
    ),
    (
        23,
        '2025-11-27 00:06:07',
        '删除员工ID列表[63]'
    ),
    (
        24,
        '2025-11-27 00:06:24',
        '新增员工Emp(id=null, username=宿建华, password=null, name=韶斌, gender=1, phone=15398090987, job=1, salary=11119, image=https://loremflickr.com/400/400?lock=6399464570984230, entryDate=2025-06-07, deptId=2, createTime=2025-11-27T00:06:24.152616300, updateTime=2025-11-27T00:06:24.152616300, deptName=null, exprList=[EmpExpr(id=null, empId=null, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint), EmpExpr(id=null, empId=null, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint)])'
    ),
    (
        25,
        '2025-11-27 00:21:45',
        '删除员工ID列表[64]'
    ),
    (
        26,
        '2025-11-27 00:21:48',
        '新增员工Emp(id=null, username=宿建华, password=null, name=韶斌, gender=1, phone=15398090987, job=1, salary=11119, image=https://loremflickr.com/400/400?lock=6399464570984230, entryDate=2025-06-07, deptId=2, createTime=2025-11-27T00:21:48.026591400, updateTime=2025-11-27T00:21:48.026591400, deptName=null, exprList=[EmpExpr(id=null, empId=null, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint), EmpExpr(id=null, empId=null, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint)])'
    ),
    (
        27,
        '2025-11-27 00:22:15',
        '删除员工ID列表[65]'
    ),
    (
        28,
        '2025-11-27 00:22:23',
        '新增员工Emp(id=null, username=宿建华, password=null, name=韶斌, gender=1, phone=15398090987, job=1, salary=11119, image=https://loremflickr.com/400/400?lock=6399464570984230, entryDate=2025-06-07, deptId=2, createTime=2025-11-27T00:22:23.187826400, updateTime=2025-11-27T00:22:23.187826400, deptName=null, exprList=[EmpExpr(id=null, empId=null, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint), EmpExpr(id=null, empId=null, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint)])'
    ),
    (
        29,
        '2025-11-27 00:23:02',
        '删除员工ID列表[66]'
    ),
    (
        30,
        '2025-11-27 00:23:49',
        '新增员工Emp(id=null, username=宿建华, password=null, name=韶斌, gender=1, phone=15398090987, job=1, salary=11119, image=https://loremflickr.com/400/400?lock=6399464570984230, entryDate=2025-06-07, deptId=2, createTime=2025-11-27T00:23:09.888516700, updateTime=2025-11-27T00:23:09.888516700, deptName=null, exprList=[EmpExpr(id=null, empId=null, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint), EmpExpr(id=null, empId=null, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint)])'
    ),
    (
        31,
        '2025-11-27 00:24:04',
        '删除员工ID列表[67]'
    ),
    (
        32,
        '2025-11-27 00:30:04',
        '新增员工Emp(id=null, username=宿建华, password=null, name=韶斌, gender=1, phone=15398090987, job=1, salary=11119, image=https://loremflickr.com/400/400?lock=6399464570984230, entryDate=2025-06-07, deptId=2, createTime=2025-11-27T00:25:37.879580500, updateTime=2025-11-27T00:25:37.879580500, deptName=null, exprList=[EmpExpr(id=null, empId=null, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint), EmpExpr(id=null, empId=null, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint)])'
    ),
    (
        33,
        '2025-11-27 00:30:28',
        '删除员工ID列表[68]'
    ),
    (
        34,
        '2025-11-27 00:31:04',
        '新增员工Emp(id=69, username=宿建华, password=null, name=韶斌, gender=1, phone=15398090987, job=1, salary=11119, image=https://loremflickr.com/400/400?lock=6399464570984230, entryDate=2025-06-07, deptId=2, createTime=2025-11-27T00:30:31.252781100, updateTime=2025-11-27T00:30:31.252781100, deptName=null, exprList=[EmpExpr(id=null, empId=69, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint), EmpExpr(id=null, empId=69, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint)])'
    ),
    (
        35,
        '2025-11-27 00:31:15',
        '删除员工ID列表[69]'
    ),
    (
        36,
        '2025-11-27 00:31:19',
        '新增员工Emp(id=70, username=宿建华, password=null, name=韶斌, gender=1, phone=15398090987, job=1, salary=11119, image=https://loremflickr.com/400/400?lock=6399464570984230, entryDate=2025-06-07, deptId=2, createTime=2025-11-27T00:31:18.977591, updateTime=2025-11-27T00:31:18.977591, deptName=null, exprList=[EmpExpr(id=null, empId=70, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint), EmpExpr(id=null, empId=70, begin=1956-04-27, end=1982-10-18, company=aliquip laborum sed qui consequat, job=commodo ex sint)])'
    ),
    (
        37,
        '2025-12-09 21:07:41',
        '删除员工ID列表[70, 11]'
    ),
    (
        38,
        '2025-12-30 17:32:08',
        '删除员工ID列表[30]'
    ),
    (
        39,
        '2025-12-31 10:08:59',
        '新增员工Emp(id=71, username=12312312, password=null, name=4123, gender=1, phone=15390876437, job=2, salary=123123, image=https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/237919ec-7530-48c4-a7f6-f85737ac094a.png, entryDate=2025-12-01, deptId=1, createTime=2025-12-31T10:08:58.568348, updateTime=2025-12-31T10:08:58.568348, deptName=null, exprList=[])'
    );

INSERT INTO
    emp (
        id,
        username,
        password,
        name,
        gender,
        phone,
        job,
        salary,
        image,
        entry_date,
        dept_id,
        create_time,
        update_time
    )
VALUES (
        1,
        'shinaian',
        '123456',
        '施耐庵',
        1,
        '13309090001',
        4,
        15000,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/a1ec1649-ab78-4342-9db7-e090c4623b44.png',
        '2000-01-01',
        2,
        '2023-10-20 16:35:33',
        '2025-12-30 21:54:47'
    ),
    (
        2,
        'songjiang',
        '123456',
        '宋江',
        1,
        '13309090002',
        2,
        8600,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2015-01-01',
        2,
        '2025-10-20 16:35:33',
        '2025-10-20 16:36:21'
    ),
    (
        3,
        'lujunyi',
        '123456',
        '卢俊义',
        1,
        '13309090003',
        2,
        8900,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2008-05-01',
        2,
        '2025-10-20 16:35:33',
        '2025-10-20 16:36:21'
    ),
    (
        4,
        'wuyong',
        '123456',
        '吴用',
        1,
        '13309090004',
        2,
        9200,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2007-01-01',
        2,
        '2025-10-20 16:35:33',
        '2025-10-20 16:36:21'
    ),
    (
        5,
        'gongsunsheng',
        '123456',
        '公孙胜',
        1,
        '13309090005',
        2,
        9500,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2012-12-05',
        2,
        '2025-10-20 16:35:33',
        '2025-10-20 16:36:21'
    ),
    (
        6,
        'huosanniang',
        '123456',
        '扈三娘',
        2,
        '13309090006',
        3,
        6500,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2013-09-05',
        1,
        '2025-10-20 16:35:33',
        '2025-10-20 16:36:21'
    ),
    (
        7,
        'chaijin',
        '123456',
        '柴进',
        1,
        '13309090007',
        1,
        4700,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2005-08-01',
        1,
        '2025-10-20 16:35:33',
        '2025-10-20 16:36:21'
    ),
    (
        8,
        'likui',
        '123456',
        '李逵',
        1,
        '13309090008',
        1,
        4800,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2014-11-09',
        1,
        '2025-10-20 16:35:33',
        '2025-10-20 16:36:21'
    ),
    (
        9,
        'wusong',
        '123456',
        '武松',
        1,
        '13309090009',
        1,
        4900,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2011-03-11',
        1,
        '2025-10-20 16:35:33',
        '2025-10-20 16:36:21'
    ),
    (
        10,
        'linchong',
        '123456',
        '林冲',
        1,
        '13309090010',
        1,
        5000,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2013-09-05',
        1,
        '2025-10-20 16:35:33',
        '2025-10-20 16:36:21'
    ),
    (
        12,
        'xiaoliguang',
        '123456',
        '小李广',
        1,
        '13309090012',
        2,
        10000,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2008-08-18',
        2,
        '2025-10-20 16:35:33',
        '2025-10-20 16:36:21'
    ),
    (
        13,
        'yangzhi',
        '123456',
        '杨志',
        1,
        '13309090013',
        1,
        5300,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2012-11-01',
        1,
        '2025-10-20 16:35:33',
        '2025-10-20 16:36:21'
    ),
    (
        14,
        'shijin',
        '123456',
        '史进',
        1,
        '13309090014',
        2,
        10600,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2002-08-01',
        2,
        '2025-10-20 16:35:33',
        '2025-10-20 16:36:21'
    ),
    (
        15,
        'sunerniang',
        '123456',
        '孙二娘',
        2,
        '13309090015',
        2,
        10900,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2011-05-01',
        2,
        '2025-10-20 16:35:33',
        '2025-10-20 16:36:21'
    ),
    (
        16,
        'luzhishen',
        '123456',
        '鲁智深',
        1,
        '13309090016',
        2,
        9600,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2010-01-01',
        2,
        '2023-10-20 16:35:33',
        '2025-12-30 21:53:10'
    ),
    (
        17,
        'liying',
        '12345678',
        '李应',
        1,
        '13309090017',
        1,
        5800,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2015-03-21',
        1,
        '2025-10-20 16:35:33',
        '2025-10-20 16:36:21'
    ),
    (
        18,
        'shiqian',
        '123456',
        '时迁',
        1,
        '13309090018',
        2,
        10200,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2015-01-01',
        2,
        '2025-10-20 16:35:33',
        '2025-10-20 16:36:21'
    ),
    (
        19,
        'gudasao',
        '123456',
        '顾大嫂',
        2,
        '13309090019',
        2,
        10500,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2008-01-01',
        2,
        '2025-10-20 16:35:33',
        '2025-10-20 16:36:21'
    ),
    (
        20,
        'ruanxiaoer',
        '123456',
        '阮小二',
        1,
        '13309090020',
        2,
        10800,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2018-01-01',
        2,
        '2025-10-20 16:35:33',
        '2025-10-20 16:36:21'
    ),
    (
        21,
        'ruanxiaowu',
        '123456',
        '阮小五',
        1,
        '13309090021',
        5,
        5200,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2015-01-01',
        3,
        '2025-10-20 16:35:33',
        '2025-10-20 16:36:21'
    ),
    (
        22,
        'ruanxiaoqi',
        '123456',
        '阮小七',
        1,
        '13309090022',
        5,
        5500,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2016-01-01',
        3,
        '2025-10-20 16:35:33',
        '2025-10-20 16:36:21'
    ),
    (
        23,
        'ruanji',
        '123456',
        '阮籍',
        1,
        '13309090023',
        5,
        5800,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2012-01-01',
        3,
        '2025-10-20 16:35:33',
        '2025-10-20 16:36:21'
    ),
    (
        24,
        'tongwei',
        '123456',
        '童威',
        1,
        '13309090024',
        5,
        5000,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2006-01-01',
        3,
        '2025-10-20 16:35:33',
        '2025-10-20 16:36:21'
    ),
    (
        25,
        'tongmeng',
        '123456',
        '童猛',
        1,
        '13309090025',
        5,
        4800,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/2fa99b63-8911-4be0-a221-8e75f464a1e9.jpg',
        '2002-01-01',
        3,
        '2023-10-20 16:35:33',
        '2025-12-30 21:52:53'
    ),
    (
        26,
        'yanshun',
        '123456',
        '燕顺',
        1,
        '13309090026',
        5,
        5400,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/65c91c69-ba7b-4c1d-a905-b0d0a1229ba9.jpg',
        '2011-01-01',
        3,
        '2023-10-20 16:35:33',
        '2025-12-30 18:13:07'
    ),
    (
        27,
        'lijun',
        '123456',
        '李俊',
        1,
        '13309090027',
        2,
        6600,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/b6d60d4e-7620-40ee-8d41-ed33632f7ea8.jpg',
        '2004-01-01',
        2,
        '2023-10-20 16:35:33',
        '2025-12-30 18:06:22'
    ),
    (
        28,
        'lizhong',
        '123456',
        '李忠',
        1,
        '13309090028',
        5,
        5000,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/bd71bab7-c872-49a4-8aea-9b64222898c9.png',
        '2007-01-01',
        3,
        '2023-10-20 16:35:33',
        '2025-12-30 17:49:25'
    ),
    (
        36,
        'linghuchong',
        '123456',
        '令狐冲',
        1,
        '18809091212',
        2,
        6800,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/70d6ba03-5cac-4173-a867-093dea8b9824.jpg',
        '2023-10-19',
        2,
        '2023-10-20 20:44:54',
        '2025-12-30 18:13:00'
    ),
    (
        39,
        'malrin',
        '123456',
        '马凌峰',
        1,
        '15398090483',
        6,
        100000,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/8e780ff6-fac5-4876-a75f-bc1b95ce4494.jpg',
        '2025-11-22',
        2,
        '2025-11-22 17:18:08',
        '2025-12-30 17:32:59'
    ),
    (
        40,
        'rengyinyin',
        '123456',
        '任莹莹',
        2,
        '15509090482',
        5,
        5000,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg',
        '2025-11-24',
        7,
        '2025-11-24 21:19:26',
        '2025-12-30 17:32:30'
    ),
    (
        56,
        'ad',
        '123456',
        'hafds',
        1,
        '12323453454',
        1,
        12312,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/11/cf273d4e-ea86-4799-b0e6-1014f894c2c6.jpg',
        '2025-11-05',
        7,
        '2025-11-25 23:56:17',
        '2025-11-25 23:56:17'
    ),
    (
        57,
        'marlin',
        '123456',
        'Marlin',
        1,
        '15398090382',
        1,
        10000000,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/11/c6a19110-2720-4b21-a252-95b07475682a.jpg',
        '2023-09-01',
        8,
        '2025-11-26 23:32:37',
        '2025-12-30 11:25:14'
    ),
    (
        71,
        '12312312',
        '123456',
        '4123',
        1,
        '15390876437',
        2,
        123123,
        'https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/237919ec-7530-48c4-a7f6-f85737ac094a.png',
        '2025-12-01',
        1,
        '2025-12-31 10:08:59',
        '2025-12-31 10:08:59'
    );

INSERT INTO
    operate_log (
        id,
        operate_emp_id,
        operate_time,
        class_name,
        method_name,
        method_params,
        return_value,
        cost_time
    )
VALUES (
        1,
        1,
        '2025-12-30 17:26:59',
        'org.example.controller.DeptController',
        'update',
        '[Dept(id=2, name=教研部, createTime=2024-09-25T09:47:40, updateTime=2025-12-30T17:26:59.340196)]',
        'Result(code=1, msg=success, data=null)',
        7
    ),
    (
        2,
        1,
        '2025-12-30 17:32:08',
        'org.example.controller.EmpController',
        'delete',
        '[[30]]',
        'Result(code=1, msg=success, data=null)',
        60
    ),
    (
        3,
        1,
        '2025-12-30 17:32:30',
        'org.example.controller.EmpController',
        'update',
        '[Emp(id=40, username=rengyinyin, password=123456, name=任莹莹, gender=2, phone=15509090482, job=5, salary=5000, image=https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/e2ad663d-639f-497a-87d6-be081a2d4e86.jpg, entryDate=2025-11-24, deptId=7, createTime=2025-11-24T21:19:26, updateTime=2025-12-30T17:32:30.396689900, deptName=null, exprList=[])]',
        'Result(code=1, msg=success, data=null)',
        22
    ),
    (
        4,
        1,
        '2025-12-30 17:32:59',
        'org.example.controller.EmpController',
        'update',
        '[Emp(id=39, username=malrin, password=123456, name=马凌峰, gender=1, phone=15398090483, job=6, salary=100000, image=https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/8e780ff6-fac5-4876-a75f-bc1b95ce4494.jpg, entryDate=2025-11-22, deptId=2, createTime=2025-11-22T17:18:08, updateTime=2025-12-30T17:32:58.992219300, deptName=null, exprList=[])]',
        'Result(code=1, msg=success, data=null)',
        15
    ),
    (
        5,
        1,
        '2025-12-30 17:49:25',
        'org.example.controller.EmpController',
        'update',
        '[Emp(id=28, username=lizhong, password=123456, name=李忠, gender=1, phone=13309090028, job=5, salary=5000, image=https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/bd71bab7-c872-49a4-8aea-9b64222898c9.png, entryDate=2007-01-01, deptId=3, createTime=2023-10-20T16:35:33, updateTime=2025-12-30T17:49:25.431773400, deptName=null, exprList=[])]',
        'Result(code=1, msg=success, data=null)',
        78
    ),
    (
        6,
        57,
        '2025-12-30 18:06:22',
        'org.example.controller.EmpController',
        'update',
        '[Emp(id=27, username=lijun, password=123456, name=李俊, gender=1, phone=13309090027, job=2, salary=6600, image=https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/b6d60d4e-7620-40ee-8d41-ed33632f7ea8.jpg, entryDate=2004-01-01, deptId=2, createTime=2023-10-20T16:35:33, updateTime=2025-12-30T18:06:21.725959800, deptName=null, exprList=[])]',
        'Result(code=1, msg=success, data=null)',
        45
    ),
    (
        7,
        57,
        '2025-12-30 18:12:51',
        'org.example.controller.EmpController',
        'update',
        '[Emp(id=1, username=shinaian, password=123456, name=施耐庵, gender=1, phone=13309090001, job=4, salary=15000, image=https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg, entryDate=2000-01-01, deptId=2, createTime=2023-10-20T16:35:33, updateTime=2025-12-30T18:12:50.476423500, deptName=null, exprList=[])]',
        'Result(code=1, msg=success, data=null)',
        51
    ),
    (
        8,
        57,
        '2025-12-30 18:13:00',
        'org.example.controller.EmpController',
        'update',
        '[Emp(id=36, username=linghuchong, password=123456, name=令狐冲, gender=1, phone=18809091212, job=2, salary=6800, image=https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/70d6ba03-5cac-4173-a867-093dea8b9824.jpg, entryDate=2023-10-19, deptId=2, createTime=2023-10-20T20:44:54, updateTime=2025-12-30T18:12:59.891170400, deptName=null, exprList=[])]',
        'Result(code=1, msg=success, data=null)',
        11
    ),
    (
        9,
        57,
        '2025-12-30 18:13:07',
        'org.example.controller.EmpController',
        'update',
        '[Emp(id=26, username=yanshun, password=123456, name=燕顺, gender=1, phone=13309090026, job=5, salary=5400, image=https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/65c91c69-ba7b-4c1d-a905-b0d0a1229ba9.jpg, entryDate=2011-01-01, deptId=3, createTime=2023-10-20T16:35:33, updateTime=2025-12-30T18:13:07.065132, deptName=null, exprList=[])]',
        'Result(code=1, msg=success, data=null)',
        13
    ),
    (
        10,
        57,
        '2025-12-30 18:13:14',
        'org.example.controller.EmpController',
        'update',
        '[Emp(id=25, username=tongmeng, password=123456, name=童猛, gender=1, phone=13309090025, job=5, salary=4800, image=https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/1f89bf73-4bda-4bd6-873a-07e5f157509f.jpg, entryDate=2002-01-01, deptId=3, createTime=2023-10-20T16:35:33, updateTime=2025-12-30T18:13:14.166583500, deptName=null, exprList=[])]',
        'Result(code=1, msg=success, data=null)',
        11
    ),
    (
        11,
        57,
        '2025-12-30 18:32:52',
        'org.example.controller.ClazzController',
        'update',
        '[Clazz(id=2, name=前端就业90期, room=210, beginDate=2024-07-10, endDate=2024-01-20, masterId=3, subject=2, createTime=2024-06-01T17:45:12, updateTime=2025-12-30T18:32:52.409722300, masterName=null, status=null)]',
        'Result(code=1, msg=success, data=null)',
        22
    ),
    (
        12,
        57,
        '2025-12-30 18:32:55',
        'org.example.controller.ClazzController',
        'update',
        '[Clazz(id=3, name=JavaEE就业165期, room=108, beginDate=2024-06-15, endDate=2024-12-25, masterId=6, subject=1, createTime=2024-06-01T17:45:40, updateTime=2025-12-30T18:32:54.653318300, masterName=null, status=null)]',
        'Result(code=1, msg=success, data=null)',
        10
    ),
    (
        13,
        57,
        '2025-12-30 18:32:57',
        'org.example.controller.ClazzController',
        'update',
        '[Clazz(id=4, name=JavaEE就业166期, room=105, beginDate=2024-07-20, endDate=2024-02-20, masterId=20, subject=1, createTime=2024-06-01T17:46:10, updateTime=2025-12-30T18:32:56.609003900, masterName=null, status=null)]',
        'Result(code=1, msg=success, data=null)',
        8
    ),
    (
        14,
        57,
        '2025-12-30 18:32:59',
        'org.example.controller.ClazzController',
        'update',
        '[Clazz(id=5, name=大数据就业58期, room=209, beginDate=2026-08-01, endDate=2027-02-15, masterId=7, subject=3, createTime=2024-06-01T17:51:21, updateTime=2025-12-30T18:32:58.697169100, masterName=null, status=null)]',
        'Result(code=1, msg=success, data=null)',
        11
    ),
    (
        15,
        57,
        '2025-12-30 18:33:01',
        'org.example.controller.ClazzController',
        'update',
        '[Clazz(id=6, name=JavaEE就业167期, room=325, beginDate=2024-11-20, endDate=2026-05-10, masterId=36, subject=1, createTime=2024-11-15T11:35:46, updateTime=2025-12-30T18:33:01.410664100, masterName=null, status=null)]',
        'Result(code=1, msg=success, data=null)',
        6
    ),
    (
        16,
        57,
        '2025-12-30 18:33:12',
        'org.example.controller.StudentController',
        'update',
        '[Student(id=17, name=王语嫣, no=2022000017, gender=2, phone=18800007601, idCard=110120000300200017, isCollege=1, address=北京市昌平区建材城西路17号, degree=2, graduationDate=2022-07-01, clazzId=4, violationCount=0, violationScore=0, createTime=2024-11-14T21:22:19, updateTime=2025-12-30T18:33:12.019030600, clazzName=JavaEE就业166期)]',
        'Result(code=1, msg=success, data=null)',
        17
    ),
    (
        17,
        57,
        '2025-12-30 18:33:15',
        'org.example.controller.StudentController',
        'update',
        '[Student(id=16, name=李春来, no=2022000016, gender=1, phone=18800008501, idCard=110120000300200016, isCollege=1, address=北京市昌平区建材城西路16号, degree=4, graduationDate=2021-07-01, clazzId=4, violationCount=0, violationScore=0, createTime=2024-11-14T21:22:19, updateTime=2025-12-30T18:33:15.380127400, clazzName=JavaEE就业166期)]',
        'Result(code=1, msg=success, data=null)',
        9
    ),
    (
        18,
        57,
        '2025-12-30 18:33:17',
        'org.example.controller.StudentController',
        'update',
        '[Student(id=15, name=刘竹庄, no=2022000015, gender=1, phone=18800009401, idCard=110120000300200015, isCollege=1, address=北京市昌平区建材城西路15号, degree=3, graduationDate=2020-07-01, clazzId=4, violationCount=0, violationScore=0, createTime=2024-11-14T21:22:19, updateTime=2025-12-30T18:33:17.134238400, clazzName=JavaEE就业166期)]',
        'Result(code=1, msg=success, data=null)',
        8
    ),
    (
        19,
        57,
        '2025-12-30 18:33:19',
        'org.example.controller.StudentController',
        'update',
        '[Student(id=10, name=云中鹤, no=2022000010, gender=1, phone=18800006571, idCard=110120000300200010, isCollege=1, address=北京市昌平区建材城西路10号, degree=2, graduationDate=2020-07-01, clazzId=2, violationCount=0, violationScore=0, createTime=2024-11-14T21:22:19, updateTime=2025-12-30T18:33:19.346189500, clazzName=前端就业90期)]',
        'Result(code=1, msg=success, data=null)',
        10
    ),
    (
        20,
        57,
        '2025-12-30 18:33:21',
        'org.example.controller.StudentController',
        'update',
        '[Student(id=9, name=徐长老, no=2022000009, gender=1, phone=18800000341, idCard=110120000300200009, isCollege=1, address=北京市昌平区建材城西路9号, degree=3, graduationDate=2024-07-01, clazzId=2, violationCount=0, violationScore=0, createTime=2024-11-14T21:22:19, updateTime=2025-12-30T18:33:21.179255700, clazzName=前端就业90期)]',
        'Result(code=1, msg=success, data=null)',
        6
    ),
    (
        21,
        57,
        '2025-12-30 18:33:23',
        'org.example.controller.StudentController',
        'update',
        '[Student(id=8, name=康敏, no=2022000008, gender=2, phone=18800000077, idCard=110120000300200008, isCollege=1, address=北京市昌平区建材城西路8号, degree=5, graduationDate=2024-07-01, clazzId=2, violationCount=0, violationScore=0, createTime=2024-11-14T21:22:19, updateTime=2025-12-30T18:33:23.199818500, clazzName=前端就业90期)]',
        'Result(code=1, msg=success, data=null)',
        11
    ),
    (
        22,
        57,
        '2025-12-30 18:33:25',
        'org.example.controller.StudentController',
        'update',
        '[Student(id=7, name=游坦之, no=2022000007, gender=1, phone=18800000067, idCard=110120000300200007, isCollege=1, address=北京市昌平区建材城西路7号, degree=4, graduationDate=2022-07-01, clazzId=2, violationCount=0, violationScore=0, createTime=2024-11-14T21:22:19, updateTime=2025-12-30T18:33:25.214430100, clazzName=前端就业90期)]',
        'Result(code=1, msg=success, data=null)',
        9
    ),
    (
        23,
        57,
        '2025-12-30 19:55:00',
        'org.example.controller.ClazzController',
        'update',
        '[Clazz(id=2, name=前端就业90期11111, room=210, beginDate=2024-07-10, endDate=2024-01-20, masterId=3, subject=2, createTime=2024-06-01T17:45:12, updateTime=2025-12-30T19:54:59.527699600, masterName=null, status=null)]',
        'Result(code=1, msg=success, data=null)',
        29
    ),
    (
        24,
        57,
        '2025-12-30 19:55:05',
        'org.example.controller.ClazzController',
        'delete',
        '[9]',
        'Result(code=1, msg=success, data=null)',
        19
    ),
    (
        25,
        57,
        '2025-12-30 20:05:46',
        'org.example.controller.StudentController',
        'delete',
        '[[20, 22]]',
        'Result(code=1, msg=success, data=null)',
        24
    ),
    (
        26,
        57,
        '2025-12-30 21:38:13',
        'org.example.controller.ClazzController',
        'update',
        '[Clazz(id=3, name=JavaEE就业165期, room=108, beginDate=2024-06-15, endDate=2024-12-25, masterId=6, subject=1, createTime=2024-06-01T17:45:40, updateTime=2025-12-30T21:38:12.732597500, masterName=null, status=null)]',
        'Result(code=1, msg=success, data=null)',
        13
    ),
    (
        27,
        57,
        '2025-12-30 21:52:16',
        'org.example.controller.EmpController',
        'update',
        '[Emp(id=1, username=shinaian, password=123456, name=施耐庵, gender=1, phone=13309090001, job=4, salary=15000, image=https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg, entryDate=2000-01-01, deptId=2, createTime=2023-10-20T16:35:33, updateTime=2025-12-30T21:52:15.608502500, deptName=null, exprList=[])]',
        'Result(code=1, msg=success, data=null)',
        70
    ),
    (
        28,
        57,
        '2025-12-30 21:52:53',
        'org.example.controller.EmpController',
        'update',
        '[Emp(id=25, username=tongmeng, password=123456, name=童猛, gender=1, phone=13309090025, job=5, salary=4800, image=https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/2fa99b63-8911-4be0-a221-8e75f464a1e9.jpg, entryDate=2002-01-01, deptId=3, createTime=2023-10-20T16:35:33, updateTime=2025-12-30T21:52:53.300083400, deptName=null, exprList=[])]',
        'Result(code=1, msg=success, data=null)',
        39
    ),
    (
        29,
        57,
        '2025-12-30 21:53:10',
        'org.example.controller.EmpController',
        'update',
        '[Emp(id=16, username=luzhishen, password=123456, name=鲁智深, gender=1, phone=13309090016, job=2, salary=9600, image=https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/d23de621-a7d4-4536-a217-409d132319d9.jpg, entryDate=2010-01-01, deptId=2, createTime=2023-10-20T16:35:33, updateTime=2025-12-30T21:53:10.027944800, deptName=null, exprList=[])]',
        'Result(code=1, msg=success, data=null)',
        35
    ),
    (
        30,
        57,
        '2025-12-30 21:54:47',
        'org.example.controller.EmpController',
        'update',
        '[Emp(id=1, username=shinaian, password=123456, name=施耐庵, gender=1, phone=13309090001, job=4, salary=15000, image=https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/a1ec1649-ab78-4342-9db7-e090c4623b44.png, entryDate=2000-01-01, deptId=2, createTime=2023-10-20T16:35:33, updateTime=2025-12-30T21:54:47.237274700, deptName=null, exprList=[])]',
        'Result(code=1, msg=success, data=null)',
        26
    ),
    (
        31,
        57,
        '2025-12-31 09:31:20',
        'org.example.controller.StudentController',
        'update',
        '[Student(id=14, name=天山童姥, no=2022000014, gender=2, phone=18800009201, idCard=110120000300200014, isCollege=1, address=北京市昌平区建材城西路14号, degree=4, graduationDate=2024-07-01, clazzId=2, violationCount=0, violationScore=0, createTime=2024-11-14T21:22:19, updateTime=2025-12-31T09:31:20.106551800, clazzName=null)]',
        'Result(code=1, msg=success, data=null)',
        24
    ),
    (
        32,
        57,
        '2025-12-31 09:31:25',
        'org.example.controller.StudentController',
        'update',
        '[Student(id=11, name=钟万仇, no=2022000011, gender=1, phone=18800000391, idCard=110120000300200011, isCollege=1, address=北京市昌平区建材城西路11号, degree=4, graduationDate=2021-07-01, clazzId=5, violationCount=1, violationScore=100, createTime=2024-11-14T21:22:19, updateTime=2025-12-31T09:31:25.303552, clazzName=null)]',
        'Result(code=1, msg=success, data=null)',
        9
    ),
    (
        33,
        57,
        '2025-12-31 09:45:56',
        'org.example.controller.DeptController',
        'update',
        '[Dept(id=1, name=test1, createTime=2024-09-25T09:47:40, updateTime=2025-12-31T09:45:55.738031300)]',
        'Result(code=1, msg=success, data=null)',
        15
    ),
    (
        34,
        57,
        '2025-12-31 09:51:33',
        'org.example.controller.DeptController',
        'update',
        '[Dept(id=1, name=test11, createTime=2024-09-25T09:47:40, updateTime=2025-12-31T09:51:33.438490700)]',
        'Result(code=1, msg=success, data=null)',
        8
    ),
    (
        35,
        57,
        '2025-12-31 09:51:41',
        'org.example.controller.DeptController',
        'update',
        '[Dept(id=1, name=test11321, createTime=2024-09-25T09:47:40, updateTime=2025-12-31T09:51:41.071383500)]',
        'Result(code=1, msg=success, data=null)',
        8
    ),
    (
        36,
        57,
        '2025-12-31 09:51:46',
        'org.example.controller.DeptController',
        'update',
        '[Dept(id=1, name=te, createTime=2024-09-25T09:47:40, updateTime=2025-12-31T09:51:46.435606700)]',
        'Result(code=1, msg=success, data=null)',
        9
    ),
    (
        37,
        57,
        '2025-12-31 09:51:50',
        'org.example.controller.DeptController',
        'update',
        '[Dept(id=1, name=test, createTime=2024-09-25T09:47:40, updateTime=2025-12-31T09:51:50.155854400)]',
        'Result(code=1, msg=success, data=null)',
        8
    ),
    (
        38,
        57,
        '2025-12-31 10:07:57',
        'org.example.controller.StudentController',
        'add',
        '[Student(id=null, name=111, no=1234567890, gender=1, phone=15389787654, idCard=610622200501238765, isCollege=1, address=12312312, degree=4, graduationDate=2025-12-03, clazzId=8, violationCount=null, violationScore=null, createTime=2025-12-31T10:07:57.247119400, updateTime=2025-12-31T10:07:57.247119400, clazzName=null)]',
        'Result(code=1, msg=success, data=null)',
        21
    ),
    (
        39,
        57,
        '2025-12-31 10:08:59',
        'org.example.controller.EmpController',
        'save',
        '[Emp(id=71, username=12312312, password=null, name=4123, gender=1, phone=15390876437, job=2, salary=123123, image=https://java-ai-test-010.oss-cn-beijing.aliyuncs.com/2025/12/237919ec-7530-48c4-a7f6-f85737ac094a.png, entryDate=2025-12-01, deptId=1, createTime=2025-12-31T10:08:58.568348, updateTime=2025-12-31T10:08:58.568348, deptName=null, exprList=[])]',
        'Result(code=1, msg=success, data=null)',
        66
    ),
    (
        40,
        57,
        '2025-12-31 10:18:11',
        'org.example.controller.StudentController',
        'updateScore',
        '[23, 100]',
        'Result(code=1, msg=success, data=null)',
        17
    );

INSERT INTO
    student (
        id,
        name,
        no,
        gender,
        phone,
        id_card,
        is_college,
        address,
        degree,
        graduation_date,
        clazz_id,
        violation_count,
        violation_score,
        create_time,
        update_time
    )
VALUES (
        1,
        '段誉',
        '2022000001',
        1,
        '18800000001',
        '110120000300200001',
        1,
        '北京市昌平区建材城西路1号',
        1,
        '2021-07-01',
        2,
        0,
        0,
        '2024-11-14 21:22:19',
        '2025-12-29 15:51:43'
    ),
    (
        6,
        '阿紫',
        '2022000006',
        2,
        '18800000034',
        '110120000300200006',
        1,
        '北京市昌平区建材城西路6号',
        4,
        '2021-07-01',
        2,
        0,
        0,
        '2024-11-14 21:22:19',
        '2025-12-29 15:51:45'
    ),
    (
        7,
        '游坦之',
        '2022000007',
        1,
        '18800000067',
        '110120000300200007',
        1,
        '北京市昌平区建材城西路7号',
        4,
        '2022-07-01',
        2,
        0,
        0,
        '2024-11-14 21:22:19',
        '2025-12-30 18:33:25'
    ),
    (
        8,
        '康敏',
        '2022000008',
        2,
        '18800000077',
        '110120000300200008',
        1,
        '北京市昌平区建材城西路8号',
        5,
        '2024-07-01',
        2,
        0,
        0,
        '2024-11-14 21:22:19',
        '2025-12-30 18:33:23'
    ),
    (
        9,
        '徐长老',
        '2022000009',
        1,
        '18800000341',
        '110120000300200009',
        1,
        '北京市昌平区建材城西路9号',
        3,
        '2024-07-01',
        2,
        0,
        0,
        '2024-11-14 21:22:19',
        '2025-12-30 18:33:21'
    ),
    (
        10,
        '云中鹤',
        '2022000010',
        1,
        '18800006571',
        '110120000300200010',
        1,
        '北京市昌平区建材城西路10号',
        2,
        '2020-07-01',
        2,
        0,
        0,
        '2024-11-14 21:22:19',
        '2025-12-30 18:33:19'
    ),
    (
        11,
        '钟万仇',
        '2022000011',
        1,
        '18800000391',
        '110120000300200011',
        1,
        '北京市昌平区建材城西路11号',
        4,
        '2021-07-01',
        5,
        1,
        100,
        '2024-11-14 21:22:19',
        '2025-12-31 09:31:25'
    ),
    (
        12,
        '崔百泉',
        '2022000012',
        1,
        '18800000781',
        '110120000300200018',
        1,
        '北京市昌平区建材城西路12号',
        4,
        '2022-07-05',
        3,
        7,
        117,
        '2024-11-14 21:22:19',
        '2025-12-06 00:46:38'
    ),
    (
        13,
        '耶律洪基',
        '2022000013',
        1,
        '18800008901',
        '110120000300200013',
        1,
        '北京市昌平区建材城西路13号',
        4,
        '2024-07-01',
        2,
        0,
        0,
        '2024-11-14 21:22:19',
        '2025-12-29 15:51:40'
    ),
    (
        14,
        '天山童姥',
        '2022000014',
        2,
        '18800009201',
        '110120000300200014',
        1,
        '北京市昌平区建材城西路14号',
        4,
        '2024-07-01',
        2,
        0,
        0,
        '2024-11-14 21:22:19',
        '2025-12-31 09:31:20'
    ),
    (
        15,
        '刘竹庄',
        '2022000015',
        1,
        '18800009401',
        '110120000300200015',
        1,
        '北京市昌平区建材城西路15号',
        3,
        '2020-07-01',
        4,
        0,
        0,
        '2024-11-14 21:22:19',
        '2025-12-30 18:33:17'
    ),
    (
        16,
        '李春来',
        '2022000016',
        1,
        '18800008501',
        '110120000300200016',
        1,
        '北京市昌平区建材城西路16号',
        4,
        '2021-07-01',
        4,
        0,
        0,
        '2024-11-14 21:22:19',
        '2025-12-30 18:33:15'
    ),
    (
        17,
        '王语嫣',
        '2022000017',
        2,
        '18800007601',
        '110120000300200017',
        1,
        '北京市昌平区建材城西路17号',
        2,
        '2022-07-01',
        4,
        0,
        0,
        '2024-11-14 21:22:19',
        '2025-12-30 18:33:12'
    ),
    (
        18,
        '郑成功',
        '2024001101',
        1,
        '13309092345',
        '110110110110110110',
        0,
        '北京市昌平区回龙观街道88号',
        5,
        '2021-07-01',
        3,
        2,
        7,
        '2024-11-15 16:26:18',
        '2025-12-29 15:51:36'
    ),
    (
        21,
        '马凌峰',
        '2023070201',
        1,
        '15398090483',
        '610123456789098765',
        1,
        '陕西科技大学',
        4,
        '2027-07-01',
        2,
        2,
        0,
        '2025-12-05 23:27:28',
        '2025-12-29 15:51:49'
    ),
    (
        23,
        '111',
        '1234567890',
        1,
        '15389787654',
        '610622200501238765',
        1,
        '12312312',
        4,
        '2025-12-03',
        8,
        1,
        100,
        '2025-12-31 10:07:57',
        '2025-12-31 10:18:11'
    );