<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.UserBean"%>
<% if (session.getAttribute("registeredUser") == null) {
        response.sendRedirect("loginPage.jsp");
    }
%>
<jsp:useBean id="registeredUser" class="model.UserBean" scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Geek Factory - Vendita</title>
    <link rel="stylesheet" href="./css/account.css">
    <link rel="icon" href="./img/icon.png">
</head>
<body>
    <div class="header">
        <jsp:include page="header.jsp"/>
    </div>
    
    <div class="test">
    <div class="container" style="height: 540px">
        <div class="title">Inserisci informazioni sul prodotto</div>
        <div class="content">
        <form id="productForm" action="Vendita" enctype="multipart/form-data" method="POST">
            <div class="user-details">
                <div class="input-box">
                    <span class="details">Nome prodotto</span>
                    <input type="text" id="nome" name="nome" maxlength="50" placeholder="Inserire nome prodotto" autofocus required/>
                </div>
                <div class="input-box">
                    <span class="details">Prezzo</span>
                    <input type="number" step="0.01" id="prezzo" name="prezzo" max="9999999" placeholder="Inserire prezzo" required/>
                </div>
                <div class="input-box">
                    <span class="details">Spese di spedizione</span>
                    <input type="number" step="0.01" id="spedizione" name="spedizione" max="999" placeholder="Inserire spese di spedizione" required/>
                </div>
                <div class="input-box">
                    <span class="details">Immagine</span>
                    <input type="file" id="immagine" name="immagine" accept="image/png, image/gif, image/jpeg" required>
                </div>
                <div class="input-box">
                    <span class="details">Tipologia</span>
                    <select id="tipologia" name="tipologia" required>
                        <option value="Action Figures">Action Figures</option>
                        <option value="Gadget">Gadget</option>
                        <option value="Arredamento Casa">Arredamento Casa</option>
                    </select>
                </div>
                <div class="input-box">
                    <span class="details">Tag</span>
                    <select id="tag" name="tag" required>
                        <option value="Manga/Anime">Manga/Anime</option>
                        <option value="Film/Serie TV">Film/Serie TV</option>
                        <option value="Videogiochi">Videogiochi</option>
                        <option value="Originali">Originali</option>
                    </select>
                </div>
                <div class="input-box">
                    <span class="details">Descrizione</span>
                    <textarea id="descrizione" name="descrizione" rows="4" cols="60" style="resize: none; width: 450px; height: 80px" required></textarea>
                </div>
            </div>
            <div class="button">
                <input type="submit" class="vendi" name="vendi" id="vendi" value="Vendi il prodotto" style="margin-bottom: 40px">
            </div>
        </form>
        
    </div>
    </div>
    </div>
    
    <div class="footer">
        <jsp:include page="footer.jsp"/>
    </div>

    <!-- Script per la sanitizzazione del form -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('productForm');

            form.addEventListener('submit', function(event) {
                event.preventDefault(); // Prevent form submission

                // Sanitize input fields
                const nome = sanitizeInput(form.nome.value);
                const prezzo = parseFloat(form.prezzo.value);
                const spedizione = parseFloat(form.spedizione.value);
                const tipologia = sanitizeInput(form.tipologia.value);
                const tag = sanitizeInput(form.tag.value);
                const descrizione = sanitizeInput(form.descrizione.value);

                // Validate sanitized data
                if (validateInputs(nome, prezzo, spedizione, tipologia, tag, descrizione)) {
                    // Set sanitized values back to the form
                    form.nome.value = nome;
                    form.prezzo.value = prezzo;
                    form.spedizione.value = spedizione;
                    form.tipologia.value = tipologia;
                    form.tag.value = tag;
                    form.descrizione.value = descrizione;

                    // If all inputs are valid, submit the form
                    form.submit();
                } else {
                    // If any input is invalid, display error message
                    alert('Please fill out all fields correctly.');
                }
            });

            // Function to sanitize input data
            function sanitizeInput(input) {
                // Perform sanitization here (e.g., remove special characters, trim whitespace)
                // You can use regular expressions or other methods to sanitize input
                return input.trim();
            }

            // Function to validate input data
            function validateInputs(nome, prezzo, spedizione, tipologia, tag, descrizione) {
                // Add your validation logic here
                // For example, check if fields are not empty and meet certain criteria
                if (nome === '' || isNaN(prezzo) || isNaN(spedizione) || tipologia === '' || tag === '' || descrizione === '') {
                    return false;
                }
                return true;
            }
        });
    </script>
</body>
</html>
