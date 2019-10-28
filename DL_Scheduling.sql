-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-10-03 14:40:04.674

-- tables
-- Table: SP_DLCLASSES

DROP TABLE IF EXISTS DLCLASSES, LEAVE_REQUEST, STUDENT_UNAVAILABILITY, USER;

CREATE TABLE DLCLASSES (
    DL_CLASS_ID int NOT NULL AUTO_INCREMENT,
    DL_COURSE_ID varchar(10) NOT NULL,
    DL_START_TIME Time  NOT NULL,
    DL_END_TIME Time NOT NULL,
    DL_CLASS_LOCATION varchar(15) NOT NULL,
    DL_CLASS_DAY varchar(10) NOT NULL,
    ASSIGNED_USER_ID int NULL ,
    IS_ASSIGNED boolean NOT NULL DEFAULT 0,
    CONSTRAINT DLCLASSES_pk PRIMARY KEY (DL_CLASS_ID)
);

-- Table: SP_LEAVE_REQUEST
CREATE TABLE LEAVE_REQUEST (
    LR_ID int NOT NULL AUTO_INCREMENT,
    LR_USER_ID int NOT NULL,
    LR_START_TIME time NOT NULL,
    LR_END_TIME time NOT NULL,
    LR_DATE date NOT NULL,
    LR_IS_ACCEPTED boolean NULL DEFAULT 0,
    CONSTRAINT LEAVE_REQUEST_pk PRIMARY KEY (LR_ID)
);

-- Table: SP_STUDENT_UNAVAILABILITY
CREATE TABLE STUDENT_UNAVAILABILITY (
    STD_UNAVAILABILITY_ID int NOT NULL AUTO_INCREMENT,
    STD_USER_ID int NULL,
    STD_IS_CLASS boolean Not NULL,
    STD_COURSEID varchar(10) NULL,
    STD_START_TIME Time NOT NULL,
    STD_END_TIME Time NOT NULL,
    STD_CLASS_LOCATION varchar(15) NULL,
    STD_DAY varchar(10) NOT NULL, 
    CONSTRAINT STUDENT_UNAVAILABILITY_pk PRIMARY KEY (STD_UNAVAILABILITY_ID)
);

-- Table: SP_USER
CREATE TABLE USER (
    USER_ID int NOT NULL,
    FIRST_NAME varchar(20) NOT NULL,
    LAST_NAME varchar(20) NOT NULL,
    EMAIL varchar(25) NOT NULL,
	PASSWORD varchar(60) NULL,
    IS_ADMIN BOOLEAN NOT NULL DEFAULT 0,
    CONSTRAINT USER_pk PRIMARY KEY (USER_ID)
);

-- foreign keys
-- Reference: fk1 (table: SP_STUDENT_UNAVAILABILITY)
ALTER TABLE STUDENT_UNAVAILABILITY ADD CONSTRAINT fk1 FOREIGN KEY fk1 (STD_USER_ID)
    REFERENCES USER (USER_ID);

-- Reference: fk2 (table: SP_DLCLASSES)
ALTER TABLE DLCLASSES ADD CONSTRAINT fk2 FOREIGN KEY fk2 (ASSIGNED_USER_ID)
    REFERENCES USER (USER_ID);

-- Reference: fk3 (table: SP_LEAVE_REQUEST)
ALTER TABLE LEAVE_REQUEST ADD CONSTRAINT fk3 FOREIGN KEY fk3 (LR_USER_ID)
    REFERENCES USER (USER_ID);

-- End of file.
