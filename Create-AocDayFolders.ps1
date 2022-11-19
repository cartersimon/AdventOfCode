## Script to create daily folders for whole event

# Create folders 01a/b -> 09a/b
for ( $i = 1 ; $i -le 25 ; $i++ ) { 
    mkdir .\"day$($i)a"
    mkdir .\"day$($i)b"
}