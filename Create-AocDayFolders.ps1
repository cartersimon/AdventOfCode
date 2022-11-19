## Script to create daily folders for whole event

# Create folders 01a/b -> 09a/b
for ( $i = 1 ; $i -le 9 ; $i++ ) { 
    mkdir .\"day0$($i)a"
    mkdir .\"day0$($i)b"
}
# Create folders 10a/b -> 25a/b
for ( $i = 10 ; $i -le 25 ; $i++ ) { 
    mkdir .\"day$($i)a"
    mkdir .\"day$($i)b"
}