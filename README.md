# Brawl

This is a simple bash-written crawler taking a wordlist as a source of input.

# Usage

Clone the repo
```
git clone https://github.com/asciiden/brawl.git
```

Make the script an executable
```
cd brawl
chmod +x brawl.sh
```

Execute it with the correct flags (-t for target; -w for wordlist)
```bash
./brawl.sh -t example.com -w wordlist.txt
```

# How it works

It takes every line of a text file as input and creates an HTTP request with curl to the website/file_line. It then outputs to the terminal what it has found.

Don't forget to `| grep <status_code>` if you want to filter specific status codes.