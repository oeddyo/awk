#!/usr/bin/awk

{
    "date" | getline date
    printf(date)
}
