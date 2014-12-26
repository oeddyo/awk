#!/usr/bin/awk -f
{
    if(NR==1)
    {
        nFirstLineField = NF
        printf("FIRST LINE FIELD  = %d", nFirstLineField)
    }
}
{
    if(NF!=nFirstLineField){
        printf("Line %d has different field with the first line\n", NR)
    }else {
        for(i=1; i<=NF; i++){
            if(isnum($i)){
                sum[i] += $i
            }else{
                isNum[i] += 1
            }
        }
    }
}

END{
    printf("Col: ")
    for(i=1; i<=nFirstLineField; i++){
        if(isNum[i]<=0)printf("%d\t", i)
        }
        printf("\n")
    for(i=1; i<=nFirstLineField; i++){
        if(isNum[i]<=0){
            printf("%d\t", sum[i])
        }
    }
}

function isnum(n) {return n ~ /^[0-9]*$/}
