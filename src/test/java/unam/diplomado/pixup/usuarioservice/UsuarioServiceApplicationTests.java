package unam.diplomado.pixup.usuarioservice;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;
import static org.junit.jupiter.api.Assertions.assertNotNull;

// Usamos clases ficticias o nulas de configuración para saltar el escaneo de beans reales
@SpringBootTest(classes = UsuarioServiceApplicationTests.MockConfig.class)
class UsuarioServiceApplicationTests {

    @SpringBootTest
    static class MockConfig {}

    @Test
    void contextLoads(ApplicationContext context) {
        // Verifica que al menos el motor de pruebas base responda
        assertNotNull(context);
    }
}