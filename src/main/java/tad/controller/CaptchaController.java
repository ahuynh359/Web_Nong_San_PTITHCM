package tad.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import tad.utility.CaptchaGenerator;

@Controller
public class CaptchaController {
	@RequestMapping("/captcha-image")
	private void RegenerateCaptcha(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int width = 200;
		int height = 50;

		// Create a random captcha string
		String captcha = CaptchaGenerator.generateCaptchaString();

		HttpSession session = request.getSession();
		session.setAttribute("captcha", captcha);

		// Generate captcha image
		BufferedImage image = CaptchaGenerator.generateCaptchaImage(width, height, captcha);

		// Set response headers
		response.setContentType("image/png");
		response.setHeader("Cache-Control", "no-cache");

		// Write image to response stream
		ImageIO.write(image, "png", response.getOutputStream());
	}
}
