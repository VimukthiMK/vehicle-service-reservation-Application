import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.oidc.user.DefaultOidcUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home(@AuthenticationPrincipal DefaultOidcUser user, Model model) {
        model.addAttribute("user", user);
        return "home";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }
}