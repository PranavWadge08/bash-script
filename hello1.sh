dir="$1"

if [[ -z "$dir" ]]; then
  echo "Directory argument is missing."
  exit 1
fi

if [[ ! -d "$dir" ]]; then
  echo "Directory '$dir' does not exist."
  exit 1
fi

echo "The size of directory '$dir' is:"
du -sh "$dir"

read -p "Do you want to create a tar archive? (yes/no): " choice

if [[ "$choice" == "yes" ]]; then
  archive_file="$dir.tar"
  tar -cvf "$archive_file" "$dir"
  if [[ $? -eq 0 ]]; then
    echo "Archived as $archive_file."
    du -sh "$archive_file"
  else
    echo "Archive failed."
    exit 1
  fi
elif [[ "$choice" != "no" ]]; then
  echo "Invalid choice."
  exit 1
fi

exit 0
