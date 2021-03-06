select  distinct R.recname,R.FIELDNUM,c.FIELDNAME,  
DECODE (C.FIELDTYPE,0 , 'C',1 , 'T',2 , 'N',3 , 'N',4 , 'F',5 , 'H',6 , 'FH',8 , 'I') TIPO,  
C.LENGTH , DECODE(NVL(K.INDEXID,' '),'_','PK',' ')  KEY , R.EDITTABLE , L.LONGNAME, L.SHORTNAME
FROM PSPROJECTITEM P ,
    PSRECFIELD R ,
    PSDBFIELD C ,
    PSKEYDEFN K ,
    PSDBFLDLABL L , 
    PSDBFLDLABLLANG LE
WHERE P.PROJECTNAME='CK_CS_4499FACELE_GRAL' AND P.OBJECTTYPE = 0  
    AND P.OBJECTVALUE1 = R.RECNAME 
    AND R.FIELDNAME = C.FIELDNAME 
    AND R.FIELDNAME = L.FIELDNAME 
    AND R.FIELDNAME = L.LABEL_ID 
    AND L.LABEL_ID = LE.LABEL_ID
    and LE.LANGUAGE_CD = 'ESP' 
    AND R.RECNAME = k.RECNAME (+)
    AND R.FIELDNAME = k.FIELDNAME (+)
    AND K.INDEXID(+) = '_'
ORDER BY R.recname, R.FIELDNUM ;

-- PROEGRAMA PARA EXTRAER ESTRUCTURA DE LOS OBJETOS TIPO RECORD DE UN PROYECTO PEOPLE SOFT. 

DECLARE  
    CURSOR vCursor is select  distinct R.recname,R.FIELDNUM,c.FIELDNAME,  
            DECODE (C.FIELDTYPE,0 , 'C',1 , 'T',2 , 'N',3 , 'N',4 , 'F',5 , 'H',6 , 'FH',8 , 'I') TIPO,  
            C.LENGTH , DECODE(NVL(K.INDEXID,' '),'_','PK',' ')  KEY , R.EDITTABLE , L.LONGNAME, L.SHORTNAME
            FROM PSPROJECTITEM P ,
             PSRECFIELD R ,
             PSDBFIELD C ,
             PSKEYDEFN K ,
             PSDBFLDLABL L , 
             PSDBFLDLABLLANG LE
            WHERE P.PROJECTNAME='CK_CS_4499FACELE_GRAL' AND P.OBJECTTYPE = 0  
            AND P.OBJECTVALUE1 = R.RECNAME 
            AND R.FIELDNAME = C.FIELDNAME 
            AND R.FIELDNAME = L.FIELDNAME 
            AND R.FIELDNAME = L.LABEL_ID 
            AND L.LABEL_ID = LE.LABEL_ID
            and LE.LANGUAGE_CD = 'ESP' 
            AND R.RECNAME = k.RECNAME (+)
            AND R.FIELDNAME = k.FIELDNAME (+)
            AND K.INDEXID(+) = '_'
--             AND R.RECNAME = 'BI_HDR' 
            ORDER BY R.recname, R.FIELDNUM ;
    recCursor vCursor%ROWTYPE;
BEGIN
    OPEN vCursor  ;
    LOOP
        FETCH vCursor INTO recCursor  ;
        EXIT WHEN vCursor%NOTFOUND;
        -- recname, FIELDNUM, FIELDNAME, TIPO,  LENGTH , KEY , EDITTABLE , LONGNAME, SHORTNAME
        DBMS_OUTPUT.PUT_LINE(recCursor.recname ||'-'||recCursor.FIELDNUM ||'-'|| recCursor.FIELDNAME );
    END LOOP;
    CLOSE vCursor;
END;
 

