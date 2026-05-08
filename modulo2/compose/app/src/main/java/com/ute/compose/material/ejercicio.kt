// ── Demo 2: formulario con validación completa ───────────────────────────────
@Composable
private fun DemoFormularioContacto() {
    var nombre     by remember { mutableStateOf("") }
    var email      by remember { mutableStateOf("") }
    var telefono   by remember { mutableStateOf("") }
    var contrasena by remember { mutableStateOf("") }
    var verPass    by remember { mutableStateOf(false) }

    // Validaciones derivadas del estado — se recalculan en cada recomposición
    val nombreValido   = nombre.trim().length >= 2
    val emailValido    = email.contains("@") && email.contains(".")
    val telefonoValido = telefono.length >= 7 && telefono.all { it.isDigit() || it == '+' || it == ' ' }
    val passValida     = contrasena.length >= 8

    val formularioValido = nombreValido && emailValido && telefonoValido && passValida

    Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
        Text("Formulario nuevo contacto",
            style = MaterialTheme.typography.labelLarge,
            color = MaterialTheme.colorScheme.primary)

        // Nombre — validación básica de longitud
        OutlinedTextField(
            value           = nombre,
            onValueChange   = { nombre = it },
            label           = { Text("Nombre completo") },
            leadingIcon     = { Icon(Icons.Default.Person, contentDescription = null) },
            isError         = nombre.isNotEmpty() && !nombreValido,
            supportingText  = {
                when {
                    nombre.isNotEmpty() && !nombreValido ->
                        Text("Mínimo 2 caracteres", color = MaterialTheme.colorScheme.error)
                    nombreValido ->
                        Text("✓ Nombre válido", color = MaterialTheme.colorScheme.primary)
                    else -> Text("Requerido")
                }
            },
            // keyboardOptions configura el teclado del sistema operativo
            keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next),
            singleLine      = true,
            modifier        = Modifier.fillMaxWidth()
        )
