resource "aws_key_pair" "pub_key" {
  key_name   = var.key_name
  public_key = file("${path.module}/notesapp.pub") # edit here
}

# ${path.module} Built-in Terraform variable
# Meaning: Path of your current Terraform folder


# file() Terraform function
# Reads content of a file
# Returns it as a string
