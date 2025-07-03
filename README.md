# Karate Framework Demo

Proyecto de demostración para automatización de pruebas API utilizando Karate Framework.

## Descripción

Este proyecto contiene ejemplos de automatización de pruebas API con Karate Framework, incluyendo:
- Pruebas GET y POST
- Manejo de datos externos (CSV, JSON)
- Autenticación
- Llamadas a funciones Java
- Pruebas parametrizadas
- Generación de reportes

## Prerrequisitos

- Java 8 o superior
- Maven 3.6+
- IDE compatible con Maven (Eclipse, IntelliJ IDEA, VS Code)

## Instalación

1. Clonar el repositorio:
```bash
git clone <url-del-repositorio>
cd karateDemo
```

2. Instalar dependencias:
```bash
mvn clean install
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
    │   │   ├── inputData.csv
    │   │   ├── request1.json
    │   │   ├── result.json
    │   │   └── result2.json
    │   └── features/
    │       ├── JavaFunctions.java
    │       ├── TestRunner.java
    │       ├── WriteData.java
    │       ├── callJavaFile.feature
    │       ├── config.feature
    │       ├── dataDrivenTest.feature
    │       ├── dataDrivenTest2.feature
    │       ├── getCall.feature
    │       ├── userDetails.feature
    │       ├── userDetails2.feature
    │       ├── userDetailsAuthentication.feature
    │       ├── userDetailsAuthentication3.feature
    │       ├── userDetailsAuthenticationTest2.feature
    │       ├── userDetailsPostRequest.feature
    │       └── webTesting.feature
    ├── karate-config.js
    └── logback-test.xml
```

## Ejecución de Pruebas

### Ejecutar todas las pruebas
```bash
mvn test
```

### Ejecutar pruebas específicas
```bash
mvn test -Dtest=TestRunner
```

### Ejecutar con diferentes entornos
```bash
mvn test -Dkarate.env=qa
mvn test -Dkarate.env=dev
```

### Ejecutar pruebas en paralelo
```bash
mvn test -Dkarate.options="--threads 5"
```

## Características Principales

### Pruebas API
- **GET Requests**: Ejemplos en `userDetails.feature`
- **POST Requests**: Ejemplos en `userDetailsPostRequest.feature`
- **Autenticación**: Ejemplos en `userDetailsAuthentication*.feature`

### Manejo de Datos
- **Datos externos**: Lectura de archivos CSV y JSON
- **Datos parametrizados**: Uso de Examples en Scenario Outline
- **Funciones JavaScript**: Definición inline de funciones

### Integración con Java
- **Funciones estáticas**: Llamadas desde features
- **Instancias de clases**: Creación y uso de objetos Java
- **Escritura de archivos**: Persistencia de datos

### Configuración
- **Múltiples entornos**: qa, dev, prod
- **URLs dinámicas**: Configuración basada en entorno
- **Logging**: Configuración con logback

## Archivos de Configuración

### karate-config.js
Configuración global que se ejecuta antes de cada scenario:
```javascript
function fn() {
    var config = {
        url : 'https://some-host.in/api/users?page=2'
    }
    
    var env = karate.env
    karate.log("Environment variable value is --> ",env)
    
    if(env == 'qa') {
        config.url = 'https://reqres.in/api/users?page=2';
    }
    else if(env == 'dev'){
        config.url = 'https://dev.in/api/users?page=2';
    } 
    else {
        config.url = 'https://reqres.in/api/users?page=2';
    }
    
    return config;
}
```

### logback-test.xml
Configuración de logging para pruebas con salida a consola y archivo.

## Generación de Reportes

El proyecto incluye generación automática de reportes HTML usando cucumber-reporting:
- Los reportes se generan en `target/cucumber-html-reports/`
- Incluye estadísticas detalladas de ejecución
- Soporte para múltiples formatos de salida

## Funciones Utilitarias

### JavaFunctions.java
Contiene funciones de ejemplo para integración Java-Karate:
- `nonstaticfunctions()`: Función de instancia
- `staticfun()`: Función estática

### WriteData.java
Utilidad para escribir datos a archivos durante la ejecución de pruebas.

## Problemas Conocidos

### Seguridad
- **Log4j**: Versión vulnerable (2.13.3) - Actualizar a 2.17.0+
- **Escritura de archivos**: Falta validación de rutas

### Compatibilidad
- **Karate**: Versión 0.9.5 obsoleta - Actualizar a 1.2.0+
- **Maven**: Plugins desactualizados

### Correcciones Pendientes
- Error tipográfico en `userDetailsAuthentication.feature`
- Manejo de excepciones en `WriteData.java`

## Mejores Prácticas

1. **Organización**: Separar features por funcionalidad
2. **Datos**: Usar archivos externos para datos de prueba
3. **Reutilización**: Crear funciones JavaScript reutilizables
4. **Configuración**: Usar karate-config.js para configuración global
5. **Paralelización**: Ejecutar pruebas en paralelo para mejor rendimiento

## Comandos Útiles

```bash
# Limpiar y compilar
mvn clean compile

# Ejecutar pruebas con tags específicos
mvn test -Dkarate.options="--tags ~@ignore"

# Ejecutar con logging detallado
mvn test -Dkarate.options="--tags ~@ignore" -Dtest.loglevel=DEBUG

# Generar solo reportes
mvn test -Dkarate.options="--tags ~@ignore --dry-run"
```

## Contribución

1. Fork el proyecto
2. Crear una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abrir un Pull Request

## Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo LICENSE.md para detalles.

## Contacto

Para preguntas o soporte, crear un issue en el repositorio.

## Referencias

- [Karate Framework Documentation](https://github.com/intuit/karate)
- [Maven Documentation](https://maven.apache.org/guides/)
- [Cucumber Reporting](https://github.com/damianszczepanik/cucumber-reporting)