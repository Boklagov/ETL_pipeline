CREATE TABLE IF NOT EXISTS "DS".FT_BALANCE_F (
	ON_DATE DATE NOT NULL,
	ACCOUNT_RK NUMERIC NOT NULL,
	CURRENCY_RK NUMERIC,
	BALANCE_OUT FLOAT,
	CONSTRAINT BALANCE_PKEY PRIMARY KEY (ON_DATE, ACCOUNT_RK)
);

CREATE TABLE IF NOT EXISTS "DS".FT_POSTING_F (
	OPER_DATE DATE NOT NULL,
	CREDIT_ACCOUNT_RK NUMERIC NOT NULL,
	DEBET_ACCOUNT_RK NUMERIC NOT NULL,
	CREDIT_AMOUNT FLOAT,
	DEBET_AMOUNT FLOAT
);

CREATE TABLE IF NOT EXISTS "DS".MD_ACCOUNT_D (
	DATA_ACTUAL_DATE DATE NOT NULL,
	DATA_ACTUAL_END_DATE DATE NOT NULL,
	ACCOUNT_RK NUMERIC NOT NULL,
	ACCOUNT_NUMBER VARCHAR(20) NOT NULL,
	CHAR_TYPE VARCHAR(1) NOT NULL,
	CURRENCY_RK NUMERIC NOT NULL,
	CURRENCY_CODE VARCHAR(3) NOT NULL,
	CONSTRAINT ACCOUNT_PKEY PRIMARY KEY (DATA_ACTUAL_DATE, ACCOUNT_RK)
);

CREATE TABLE IF NOT EXISTS "DS".MD_CURRENCY_D (
	CURRENCY_RK NUMERIC NOT NULL,
	DATA_ACTUAL_DATE DATE NOT NULL,
	DATA_ACTUAL_END_DATE DATE,
	CURRENCY_CODE VARCHAR(3),
	CODE_ISO_CHAR VARCHAR(3),
	CONSTRAINT CURRENCY_PKEY PRIMARY KEY (CURRENCY_RK, DATA_ACTUAL_DATE)
);

CREATE TABLE IF NOT EXISTS "DS".MD_EXCHANGE_RATE_D (
	DATA_ACTUAL_DATE DATE NOT NULL,
	DATA_ACTUAL_END_DATE DATE,
	CURRENCY_RK NUMERIC NOT NULL,
	REDUCED_COURCE FLOAT,
	CODE_ISO_NUM VARCHAR(3),
	CONSTRAINT EXCHANGE_RATE_PKEY PRIMARY KEY (DATA_ACTUAL_DATE, CURRENCY_RK)
);

CREATE TABLE IF NOT EXISTS "DS".MD_LEDGER_ACCOUNT_S (
	CHAPTER CHARACTER(1),
	CHAPTER_NAME VARCHAR(16),
	SECTION_NUMBER INTEGER,
	SECTION_NAME VARCHAR(22),
	SUBSECTION_NAME VARCHAR(21),
	LEDGER1_ACCOUNT INTEGER,
	LEDGER1_ACCOUNT_NAME VARCHAR(47),
	LEDGER_ACCOUNT INTEGER NOT NULL,
	LEDGER_ACCOUNT_NAME VARCHAR(153),
	CHARACTERISTIC CHARACTER(1),
	IS_RESIDENT INTEGER,
	IS_RESERVE INTEGER,
	IS_RESERVED INTEGER,
	IS_LOAN INTEGER,
	IS_RESERVED_ASSETS INTEGER,
	IS_OVERDUE INTEGER,
	IS_INTEREST INTEGER,
	PAIR_ACCOUNT VARCHAR(5),
	START_DATE DATE NOT NULL,
	END_DATE DATE,
	IS_RUB_ONLY INTEGER,
	MIN_TERM VARCHAR(1),
	MIN_TERM_MEASURE VARCHAR(1),
	MAX_TERM VARCHAR(1),
	MAX_TERM_MEASURE VARCHAR(1),
	LEDGER_ACC_FULL_NAME_TRANSLIT VARCHAR(1),
	IS_REVALUATION VARCHAR(1),
	IS_CORRECT VARCHAR(1),
	CONSTRAINT LEDGER_ACCOUNT_PKEY PRIMARY KEY (LEDGER_ACCOUNT, START_DATE)
);

CREATE TABLE IF NOT EXISTS "LOGS".ETL_LOG (
	PROCESS_NAME VARCHAR(60) NOT NULL, -- имя лога
	LOG_DATE DATE NOT NULL DEFAULT CURRENT_DATE, -- дата лога
	START_TIME TIMESTAMP NOT NULL, -- время начала
	END_TIME TIMESTAMP NOT NULL, -- время окончания
	STATUS VARCHAR(20) NOT NULL, -- статус лога (Успех / Провал)
	ROWS_PROCESSED INTEGER DEFAULT 0, -- кол-во обработанных строк
	ERROR_MESSAGE TEXT -- строка ошибки если есть, так же может выводить кол-во невалидных строк
);


CREATE TABLE IF NOT EXISTS "DM".DM_ACCOUNT_TURNOVER_F (
    on_date DATE,
    account_rk INTEGER,
    credit_amount NUMERIC(23,8),
    credit_amount_rub NUMERIC(23,8),
    debet_amount NUMERIC(23,8),
    debet_amount_rub NUMERIC(23,8)
);

CREATE TABLE IF NOT EXISTS "DM".DM_ACCOUNT_BALANCE_F (
    on_date DATE NOT NULL,               
    account_rk NUMERIC NOT NULL,              
    balance_out NUMERIC(23,8),                
    balance_out_rub NUMERIC(23,8)       	   
);

CREATE TABLE IF NOT EXISTS "DM".DM_F101_ROUND_F (
    from_date DATE,
    to_date DATE,
    chapter CHAR(1),
    ledger_account CHAR(5),
    characteristic CHAR(1),
    balance_in_rub NUMERIC(23,8),
    r_balance_in_rub NUMERIC(23,8),
    balance_in_val NUMERIC(23,8),
    r_balance_in_val NUMERIC(23,8),
    balance_in_total NUMERIC(23,8),
    r_balance_in_total NUMERIC(23,8),
    turn_deb_rub NUMERIC(23,8),
    r_turn_deb_rub NUMERIC(23,8),
    turn_deb_val NUMERIC(23,8),
    r_turn_deb_val NUMERIC(23,8),
    turn_deb_total NUMERIC(23,8),
    r_turn_deb_total NUMERIC(23,8),
    turn_cre_rub NUMERIC(23,8),
    r_turn_cre_rub NUMERIC(23,8),
    turn_cre_val NUMERIC(23,8),
    r_turn_cre_val NUMERIC(23,8),
    turn_cre_total NUMERIC(23,8),
    r_turn_cre_total NUMERIC(23,8),
    balance_out_rub NUMERIC(23,8),
    r_balance_out_rub NUMERIC(23,8),
    balance_out_val NUMERIC(23,8),
    r_balance_out_val NUMERIC(23,8),
    balance_out_total NUMERIC(23,8),
    r_balance_out_total NUMERIC(23,8)
);