package core;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;

import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.options.UiAutomator2Options;
import io.appium.java_client.service.local.AppiumDriverLocalService;
import io.appium.java_client.service.local.AppiumServiceBuilder;

public class DriverManager {

    protected static final int PORT = 4723;
    protected static AndroidDriver driver;
    private static AppiumDriverLocalService service;

    @BeforeAll
    public static void setUp() {
        service = new AppiumServiceBuilder()
                .withIPAddress("127.0.0.1")
                .usingPort(PORT)
                .build();
        service.start();

        UiAutomator2Options options = new UiAutomator2Options()
                .setDeviceName("emulator-5554")
                .setApp("src/main/resources/ApiDemos-debug.apk")
                .setAppPackage("io.appium.android.apis")
                .setAppActivity("io.appium.android.apis.ApiDemos")
                .fullReset()
                .autoGrantPermissions()
                .eventTimings();
        driver = new AndroidDriver(service.getUrl(), options);
    }

    @AfterAll
    public static void tearDown() {
        if (driver != null) {
            driver.quit();
        }
        if (service != null) {
            service.stop();
        }
    }
}
