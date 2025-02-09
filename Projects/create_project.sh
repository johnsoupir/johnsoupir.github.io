#!/bin/bash
# create_project.sh - Creates a new project entry structure and template

# Check if a project name was provided as an argument; if not, prompt the user.
if [ -n "$1" ]; then
  project_name="$1"
else
  read -p "Enter project name: " project_name
fi

# Define the base directory for the new project (assume the script is run from the Projects directory)
project_dir="$project_name"

# Check if the project directory already exists.
if [ -d "$project_dir" ]; then
  echo "Error: Directory '$project_dir' already exists. Exiting."
  exit 1
fi

# Create the directory structure:
mkdir -p "$project_dir/Downloads"
mkdir -p "$project_dir/Images"
mkdir -p "$project_dir/Video"

# Create the template Markdown file with YAML front matter and examples.
cat > "$project_dir/index.md" <<EOF
---
layout: project
title: "$project_name"
download: "/Projects/$project_name/Downloads/${project_name}.zip"
image: "/Projects/$project_name/Images/${project_name}.png"
---

## Overview

This is a placeholder overview for the **$project_name** project. Replace this text with a detailed description of your project.

{% include figure.html src=page.image alt="$project_name Image" caption="Figure 1: $project_name in action." %}

## Example Code

Below is an example code block:

|||bash
echo "Hello, World!"
|||

Replace the above with your own code as needed.
EOF

# Print a project card snippet to the terminal.
cat <<EOF

Project Card for $project_name:

{% include project-card.html 
         image="/Projects/$project_name/Images/${project_name}.png" 
         title="$project_name" 
         introText="Placeholder intro for $project_name." 
         link="/Projects/$project_name/" 
%}

EOF

echo "New project structure for '$project_name' created successfully in the '$project_dir' directory."
