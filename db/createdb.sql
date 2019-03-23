.open dar.db
CREATE TABLE dar (
                  UUID             CHAR(36) NOT NULL,
                  STARTPOS         INT      NOT NULL,
                  ENDPOS           INT      NOT NULL,
                  LINENO           INT      NOT NULL,
                  LISTNAME         CHAR(20) NOT NULL
                );

.print "Start importing dar"
.mode csv
.import dar.csv dar
.print "Building index"
CREATE INDEX dar_idx ON dar(UUID);
