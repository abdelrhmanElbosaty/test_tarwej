const registerMutation = """
mutation register(\$registerInput: RegisterInput!) {
  register(input: \$registerInput) {
    code
    success
    message
  }
}
""";