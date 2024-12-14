package vn.nhom18.shoppingclothes.controller.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.nhom18.shoppingclothes.service.CartService;
import vn.nhom18.shoppingclothes.domain.User;
import vn.nhom18.shoppingclothes.domain.Cart;
import vn.nhom18.shoppingclothes.domain.CartDetail;

@Controller
public class CartController {
    private final CartService cartService;

    public CartController(CartService cartService) {
        this.cartService = cartService;
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.cartService.fetchByUser(currentUser);
        List<CartDetail> cartDetail = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        double totalDetail = 0;
        for (CartDetail cd : cartDetail) {
            totalDetail += cd.getPrice() * cd.getQuantity();
        }
        model.addAttribute("cartDetails", cartDetail);
        model.addAttribute("totalPrice", totalDetail);
        model.addAttribute("cart", cart);
        return "user/cart";
    }

    @PostMapping("/add-to-cart")
    public String addToCart(
            @RequestParam("id") Long productId,
            @RequestParam("size") Long sizeId,
            @RequestParam("color") Long colorId,
            @RequestParam("quantity") Long quantity1,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes) {

        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");

        try {
            this.cartService.handleAddProductToCart(email, productId, session, quantity1, colorId, sizeId);

            redirectAttributes.addFlashAttribute("message", "Đã thêm sản phẩm vào giỏ hàng thành công!");
            redirectAttributes.addFlashAttribute("alertType", "success");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Không thể thêm sản phẩm vào giỏ hàng. Vui lòng thử lại!");
            redirectAttributes.addFlashAttribute("alertType", "error");
        }

        return "redirect:/";
    }

    @GetMapping("/checkout")
    public String getCheckOutPage(Model model, HttpServletRequest request) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.cartService.fetchByUser(currentUser);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        return "user/checkout";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.cartService.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrder(
            HttpServletRequest request,
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone, RedirectAttributes redirectAttributes) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        this.cartService.handlePlaceOrder(currentUser, session, receiverName, receiverAddress, receiverPhone);
        redirectAttributes.addFlashAttribute("message", "Cảm ơn bạn đã mua hàng!");
        redirectAttributes.addFlashAttribute("alertType", "thank");
        return "redirect:/";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteProductToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long cartDetailId = id;
        this.cartService.handleRemoveCartDetail(cartDetailId, session);
        return "redirect:/cart";
    }
}
