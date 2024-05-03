document.addEventListener("DOMContentLoaded", function() {
    const addToCartButtons = document.querySelectorAll(".add-to-cart-btn");
    const cartItems = document.getElementById("cart-items");
    const cartTotal = document.getElementById("cart-total");
    let total = 0;

    addToCartButtons.forEach(button => {
        button.addEventListener("click", function() {
            const product = this.parentElement;
            const productId = product.getAttribute("data-id");
            const productName = product.getAttribute("data-name");
            let productPrice = parseFloat(product.getAttribute("data-price"));

            // Adjust price for Audi R8 if its ID is 2
            if (productId === "2") {
                productPrice = 130000;
            }

            total += productPrice;
            cartTotal.textContent = `$${total.toFixed(2)}`;

            const cartItem = document.createElement("li");
            cartItem.classList.add("cart-item");
            
            const cartItemImage = document.createElement("img");
            cartItemImage.src = product.querySelector("img").src;
            cartItemImage.alt = productName;
            cartItemImage.classList.add("cart-item-image");
            
            const cartItemInfo = document.createElement("div");
            cartItemInfo.classList.add("cart-item-info");
            const cartItemName = document.createElement("p");
            cartItemName.textContent = productName;
            const cartItemPrice = document.createElement("p");
            cartItemPrice.textContent = `$${productPrice.toFixed(2)}`;

            const removeItemBtn = document.createElement("button");
            removeItemBtn.classList.add("remove-item-btn");
            removeItemBtn.textContent = "Remove";
            removeItemBtn.addEventListener("click", function() {
                total -= productPrice;
                cartTotal.textContent = `$${total.toFixed(2)}`;
                cartItems.removeChild(cartItem);
            });

            cartItemInfo.appendChild(cartItemName);
            cartItemInfo.appendChild(cartItemPrice);
            cartItemInfo.appendChild(removeItemBtn);

            cartItem.appendChild(cartItemImage);
            cartItem.appendChild(cartItemInfo);
            
            cartItems.appendChild(cartItem);
        });
    });

    const checkoutButton = document.getElementById("checkout-btn");
    checkoutButton.addEventListener("click", function() {
        alert("Proceeding to checkout...");
    });
});
