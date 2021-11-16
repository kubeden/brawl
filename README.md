# Brawl
## A simple bash-written crawler

This is a simple crawler taking a wordlist as a source of input.

# How it works:

It takes every line of a text file as input and creates an HTTP request with curl to the website/file_line. It then outputs to the terminal what it has found.

Don't forget to `| grep <status_code>` if you want to filter specific status codes.