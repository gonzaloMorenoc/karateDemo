# Karate DSL Demo Framework

[![Karate](https://img.shields.io/badge/Karate-1.4.1-blue.svg)](https://github.com/karatelabs/karate)
[![Java](https://img.shields.io/badge/Java-11+-orange.svg)](https://www.oracle.com/java/)
[![Maven](https://img.shields.io/badge/Maven-3.8+-red.svg)](https://maven.apache.org/)
[![JUnit](https://img.shields.io/badge/JUnit-5.10.1-green.svg)](https://junit.org/junit5/)

Proyecto de referencia para automatización de pruebas API utilizando Karate DSL con las mejores prácticas y patrones modernos.

## Características Principales

- **API Testing completo**: GET, POST, PUT, DELETE con validaciones
- **Data-Driven Testing**: Usando CSV y JSON externos
- **Parallel Execution**: Ejecución en paralelo para mejor rendimiento  
- **Environment Management**: Configuración multi-entorno (dev, qa, prod)
- **Java Integration**: Integración con clases Java personalizadas
- **Modern Reporting**: Reportes HTML detallados
- **Schema Validation**: Validación de esquemas JSON
- **Error Handling**: Manejo robusto de errores y excepciones

## Requisitos Previos

- **Java 11** o superior
- **Maven 3.8+**
- IDE compatible (IntelliJ IDEA, Eclipse, VS Code)

## Instalación y Configuración

### Clonar el Repositorio
```bash
git clone <repository-url>
cd karate-demo-framework
```

### Instalar Dependencias
```bash
mvn clean install
```

### Verificar Instalación
```bash
mvn test -Dtest=TestRunner
```

## Estructura del Proyecto

```
src/
├── main/java/
│   └── Karate/Demo/
│       └── App.java
└── test/java/
    ├── Karate/Demo/
    │   ├── data/
    │   │   ├── inputData.csv          # Datos CSV para pruebas
    │   │   ├── request1.json          # Payloads de request
    │   │   ├── result.json            # Respuestas esperadas
    │   │   └── result2.json
    │   └── features/
    │       ├── TestRunner.java        # Runner principal con JUnit 5
    │       ├── JavaFunctions.java     # Funciones Java de utilidad
    │       ├── WriteData.java         # Utilidades de escritura
    │       ├── userDetails.feature    # Tests de usuarios
    │       ├── dataDrivenTest.feature # Tests data-driven
    │       ├── modernApiTests.feature # Patrones modernos de testing
    │       └── callJavaFile.feature   # Integración Java-Karate
    ├── karate-config.js               # Configuración global
    └── logback-test.xml               # Configuración de logging
```

## Ejecución de Pruebas

### Todos los Tests
```bash
mvn test
```

### Tests Específicos
```bash
mvn test -Dtest=TestRunner#testUsers
mvn test -Dtest=TestRunner#testParallel
```

### Por Entorno
```bash
mvn test -Dkarate.env=dev
mvn test -Dkarate.env=qa
mvn test -Dkarate.env=prod
```

### Ejecución Paralela
```bash
mvn test -Dtest=TestRunner#testParallel
```

### Con Tags Específicos
```bash
mvn test -Dkarate.options="--tags @smoke"
mvn test -Dkarate.options="--tags ~@ignore"
```

## Configuración por Entornos

El archivo `karate-config.js` maneja automáticamente diferentes entornos:

```javascript
// Desarrollo
mvn test -Dkarate.env=dev

// QA
mvn test -Dkarate.env=qa

// Producción  
mvn test -Dkarate.env=prod
```

## Patrones de Testing Implementados

### CRUD Completo
```gherkin
Scenario: Complete CRUD operations
    Given path '/users'
    When method GET
    Then status 200
    
    Given request { "name": "John", "job": "Developer" }
    When method POST
    Then status 201
    * def userId = response.id
    
    Given path '/users', userId
    When method DELETE
    Then status 204
```

### Data-Driven con CSV
```gherkin
Scenario Outline: Create user with external data
    Given request { "name": "<n>", "salary": "<salary>" }
    When method POST
    Then status 201
    
    Examples:
    | read('../data/inputData.csv') |
```

### Validación de Esquemas
```gherkin
Scenario: Schema validation
    Given path '/users/2'
    When method GET
    Then status 200
    And match response.data contains { id: 2, email: '#string' }
```

### Integración con Java
```gherkin
Scenario: Java integration
    * def javaHelper = Java.type('Karate.Demo.features.JavaFunctions')
    * def result = javaHelper.staticFunction("test")
    And match result == 'Expected Value'
```

## Reportes y Logging

### Reportes HTML
Los reportes se generan automáticamente en:
```
target/karate-reports/karate-summary.html
```

### Logs Detallados
```
target/karate.log
```

### Configuración de Logging
Editar `src/test/java/logback-test.xml` para ajustar niveles de logging.

## Mejores Prácticas Implementadas

### Organización de Archivos
- Features separados por funcionalidad
- Datos externos en carpeta `data/`
- Funciones Java en el mismo package

### Configuración Centralizada
- `karate-config.js` para configuración global
- Variables de entorno para diferentes ambientes
- Headers comunes centralizados

### Validaciones Robustas
- Validación de status codes
- Validación de esquemas JSON
- Validación de tipos de datos
- Validación de tiempo de respuesta

### Manejo de Errores
- Try-catch en funciones Java
- Validación de respuestas de error
- Logging detallado de fallos

### Paralelización
- Ejecución paralela configurada
- Tests independientes entre sí
- Gestión de recursos compartidos

## Comandos Útiles

### Desarrollo
```bash
# Compilar sin ejecutar tests
mvn clean compile

# Ejecutar solo tests que no están ignorados
mvn test -Dkarate.options="--tags ~@ignore"

# Debug mode con logging detallado
mvn test -Dkarate.options="--tags @debug" -Dlogback.configurationFile=logback-debug.xml

# Dry run para validar sintaxis
mvn test -Dkarate.options="--dry-run"
```

### CI/CD
```bash
# Para pipelines de integración continua
mvn test -Dkarate.env=ci -Dkarate.options="--tags ~@manual"

# Generar reportes en formato JUnit
mvn test -Dkarate.options="--format junit:target/junit-reports"
```

## Troubleshooting

### Problemas Comunes

**Error de Timeout:**
```bash
# Aumentar timeout global
mvn test -Dkarate.options="--timeout 60000"
```

**Problemas de Encoding:**
```bash
# Especificar encoding
mvn test -Dfile.encoding=UTF-8
```

**Fallos de Conexión:**
```bash
# Verificar conectividad
mvn test -Dkarate.env=local -Dkarate.options="--tags @health"
```

## Contribución

### Agregar Nuevos Tests
1. Crear feature file en `src/test/java/Karate/Demo/features/`
2. Agregar datos de prueba en `src/test/java/Karate/Demo/data/`
3. Actualizar `TestRunner.java` si es necesario
4. Ejecutar `mvn test` para validar

### Estándares de Código
- Usar nombres descriptivos en inglés
- Seguir convenciones de Gherkin
- Documentar funciones Java complejas
- Mantener features independientes

### Pull Requests
1. Fork el repositorio
2. Crear branch feature (`git checkout -b feature/nueva-funcionalidad`)
3. Commit cambios (`git commit -m 'Agregar nueva funcionalidad'`)
4. Push al branch (`git push origin feature/nueva-funcionalidad`)
5. Crear Pull Request

## Recursos Adicionales

- [Documentación Oficial de Karate](https://github.com/karatelabs/karate)
- [Karate DSL Examples](https://github.com/karatelabs/karate/tree/master/examples)
- [Maven Surefire Plugin](https://maven.apache.org/surefire/maven-surefire-plugin/)
- [JUnit 5 User Guide](https://junit.org/junit5/docs/current/user-guide/)

## Licencia

Este proyecto está licenciado bajo MIT License - ver [LICENSE.md](LICENSE.md) para detalles.

## Soporte

Para preguntas o problemas:
- Crear un [Issue](../../issues) en GitHub
- Consultar la [documentación oficial](https://github.com/karatelabs/karate)
- Revisar [examples](https://github.com/karatelabs/karate/tree/master/examples) del repositorio oficial