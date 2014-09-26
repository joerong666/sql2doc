#!/bin/awk -f

BEGIN{
    printf("var tbset = [");
    first_tb = 0;
    first_field = 0;
    tb_s = 0; 
    tb_e = 0; 
    hit_key = 0; 
} { 
    
    if($0 ~ /CREATE TABLE/i) {
        tb_s = 1;
        hit_key = 0;

        printf("\n");
        if(first_tb != 1) {
            first_tb = 1;
            first_field = 0;
        } else {
            printf(",");
        }

        printf("{\"tbname\":\"%s\", \"fields\":[", $3);
        next;
    }

    if(tb_s != 1 || $0 ~ /^\(/) next;

    if($0 ~ /^)/) {
        tb_e = 1;
        first_field = 0;
        print "\n}";
        next;
    }

    if(hit_key == 1) next;

    if($0 ~ /PRIMARY KEY/i) {
        split($0, arr, /\(|)/);
        key = arr[2];

        hit_key = 1;
        printf("\n],\n\"key\":\"%s\"", key);
        next;
    }

    printf("\n");
    if(first_field != 1) {
        first_field = 1;
    } else {
        printf(",");
    } 

    printf("{");
    printf("\"name\":\"%s\",\"type\":\"%s\",", $1, $2) ;

    if($0 ~ /NOT NULL/i) {
        printf("\"allow_null\":\"NO\",");
    } else {
        printf("\"allow_null\":\"\",");
    }

    if($0 ~ /COMMENT/i) {
        split($0, arr, / COMMENT /);
        comment = arr[2];
        
        gsub("'", "\"", comment);
        sub(/,$/, "", comment);
        printf("\"comment\":%s", comment);
    } else {
        printf("\"comment\":\"\"");
    }

    printf("}");

} END {
    printf "];";
}
