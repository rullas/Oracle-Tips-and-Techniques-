BEGIN
   DECLARE
      CURSOR c1
      IS
         SELECT *
           FROM TABLE_NAME
          WHERE NESTED_COLUMN IS NOT EMPTY;
   BEGIN
      FOR c2 IN c1
      LOOP
         DELETE TABLE (
                   SELECT A.NESTED_COLUMN 
                     FROM TABLE_NAME A
                    WHERE     COLUMN = C2.COLUMN
                          AND NESTED_COLUMN IS NOT EMPTY) Z
          WHERE Z.NESTED_COLUMN  IS NOT NULL;
      END LOOP;

      COMMIT;
   END;
END;

