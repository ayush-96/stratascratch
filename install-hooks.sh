#!/bin/bash

cd .git/hooks
if [ ! -f pre-commit ]; then
    cat << 'EOF' > pre-commit
#!/bin/sh

# Run your shell script
/bin/bash ./pre-commit.sh

EOF

chmod +x pre-commit
fi