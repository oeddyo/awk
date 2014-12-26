#!/usr/bin/awk -f
{
    if(NR==1){
        nField = NF
        for(i=1; i<=NF; i++){
            isColNum[i] = isNum($i)
        }
    }
    if(NF!=nField){
        printf("Line %d has %d field, but line 1 has %d fields\n", NR, NF, nField)
    }else{
        for(i=1; i<=NF; i++){
            if(isColNum[i]){
                sum[i] += $i
            }
        }
        data[NR] = $0
    }
}
END{
    printf("Total column\n")
    for(i=1; i<=nField; i++){
        if(isColNum[i]){
            printf("%d\t", i)
        }
    }
    printf("\n")
    for(i=1; i<=nField; i++){
        if(isColNum[i]){
            printf("%f\t", sum[i]) 
        }
    }
    for(i=1; i<=NR; i++){
        print data[i] | "sort -k1"
    }
}


function isNum(n) {return n ~ /^[0-9]+\.[0-9]*$/}
