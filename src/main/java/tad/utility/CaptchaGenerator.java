package tad.utility;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.Random;

public class CaptchaGenerator {
	public static String generateCaptchaString() {
		// Generate a random captcha string
		String allowedChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		int length = 6;
		Random random = new Random();
		StringBuilder captcha = new StringBuilder();
		for (int i = 0; i < length; i++) {
			captcha.append(allowedChars.charAt(random.nextInt(allowedChars.length())));
		}
		return captcha.toString();
	}

	public static BufferedImage generateCaptchaImage(int width, int height, String captcha) {
		// Create a buffered image with the given dimensions
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g = image.createGraphics();

		// Set background color
		g.setColor(Color.WHITE);
		g.fillRect(0, 0, width, height);

		// Set text color
		g.setColor(Color.BLACK);

		// Draw captcha string on the image
		Font font = new Font("Arial", Font.BOLD, 30);
		g.setFont(font);
		g.drawString(captcha, 20, 35);

		// Add noise to the image (optional)
		Random random = new Random();
		for (int i = 0; i < 150; i++) {
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int rgb = random.nextInt(256);
			image.setRGB(x, y, rgb);
		}

		g.dispose();
		return image;
	}
}
