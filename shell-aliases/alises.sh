local aliases_dir="$HOME/.config/shell-aliases/"

# Get all the .sh files in the current directory
files=$(find "$aliases_dir" -type f -name "*.alias.sh")

for file in $files; do
    source "$file"
done
