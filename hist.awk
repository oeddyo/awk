#!/usr/bin/awk

BEGIN{}
{
    cnt[$1%10] += 1
}
END{
    for(i=0; i<=9; i++){
        printf("%d-%d:", i*10, (i+1)*10-1)
        printSingleLine(cnt[i])
    }
}

function printSingleLine(n) {
    for(j=1; j<=n; j++)
        printf("* ")

    printf("\n")
}
