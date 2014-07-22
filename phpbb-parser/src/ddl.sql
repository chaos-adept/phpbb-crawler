DROP TABLE "PAYLOADS";
DROP TABLE "INTERACTIONS";
DROP TABLE "TOPICS";

CREATE TABLE "TOPICS" 
   (    
    "ID" VARCHAR2(10), 
    "WHEN" TIMESTAMP(6),
    "TITLE" VARCHAR2(1000),
	 CONSTRAINT "TOPICS_PK" PRIMARY KEY ("ID") ENABLE
   );

CREATE TABLE "INTERACTIONS" 
   (    
    "WHEN" TIMESTAMP(6),
    "TOPICID" VARCHAR2(10), 
    "SEQ" INTEGER,
    "QUOTES" INTEGER,
    "FROMUSER" VARCHAR2(50), 
    "TOUSER" VARCHAR2(50), 
    "TXT" VARCHAR2(3000),
	 CONSTRAINT "INTERACTIONS_PK" PRIMARY KEY ("TOPICID", "SEQ") ENABLE,
	 CONSTRAINT "INTERACTIONS_TOPICS" FOREIGN KEY ("TOPICID") REFERENCES "TOPICS" ("ID") ENABLE
   );

CREATE TABLE "PAYLOADS" 
   (    
    "TOPICID" VARCHAR2(10), 
    "SEQ" INTEGER,
    "TYPE" CHAR(1),
    "VALUE" VARCHAR2(100),
    "WHEN" TIMESTAMP(6),
	 CONSTRAINT "PAYLOADS_INTERACTIONS" FOREIGN KEY ("TOPICID", "SEQ") REFERENCES "INTERACTIONS" ("TOPICID", "SEQ") ENABLE
   );