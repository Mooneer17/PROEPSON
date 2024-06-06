document.addEventListener("DOMContentLoaded", function() {
    var categoryButtonsDiv = document.getElementById("category-buttons");
    var productsDiv = document.getElementById("products");

    function fetchProducts(categoriaId) {
        var url = "get_products.php";
        if (categoriaId) {
            url += "?categoria_id=" + encodeURIComponent(categoriaId);
        }
        fetch(url)
            .then(response => response.json())
            .then(productos => {
                displayProducts(productos);
            })
            .catch(error => {
                console.error('Error fetching products:', error);
            });
    }

    function displayProducts(productos) {
        productsDiv.innerHTML = "";
        productos.forEach(function(productos) {
            var productElement = document.createElement("div");
            productElement.textContent = productos.nombre + " - $" + productos.precio;
            productsDiv.appendChild(productElement);
        });
    }

    function fetchCategories() {
        fetch("get_categories.php")
            .then(response => response.json())
            .then(categorias => {
                // Botón "All"
                var allButton = document.createElement("button");
                allButton.classList.add("category-button");
                allButton.textContent = "All";
                allButton.addEventListener("click", function() {
                    fetchProducts();
                });
                categoryButtonsDiv.appendChild(allButton);

                // Botones de categorías
                categorias.forEach(function(category) {
                    var button = document.createElement("button");
                    button.classList.add("category-button");
                    button.textContent = category.nombre;
                    button.dataset.categoryId = category.id;
                    button.addEventListener("click", function() {
                        fetchProducts(category.id);
                    });
                    categoryButtonsDiv.appendChild(button);
                });
            })
            .catch(error => {
                console.error('Error fetching categories:', error);
            });
    }

    // Fetch categories and populate buttons when the page loads
    fetchCategories();

    // Fetch all products when the page loads
    fetchProducts();
});
