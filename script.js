  function formatarCPF(cpf){
    cpf = cpf.replace(/\D/g,"");
    cpf = cpf.replace(/(\d{3})(\d)/,"$1.$2");
    cpf = cpf.replace(/(\d{3})(\d)/,"$1.$2");
    cpf = cpf.replace(/(\d{3})(\d{1,2})$/,"$1-$2");
    return cpf;
}

function formatarTelefone(telefone){
    telefone = telefone.replace(/\D/g,"");
    telefone = telefone.replace(/^(\d)/,"($1");
    telefone = telefone.replace(/^(\(\d{2})(\d)/,"$1) $2");
    if(telefone.length == 10){
        telefone = telefone.replace(/(\d{4})(\d)/,"$1-$2");
    } else {
        telefone = telefone.replace(/(\d{5})(\d)/,"$1-$2");
    }
    return telefone;
}

function formatarCEP(cep){
    cep = cep.replace(/\D/g,"");
    cep = cep.replace(/^(\d{5})(\d)/,"$1-$2");
    return cep;
}

function toggleNumeroResidencia() {
    var checkbox = document.getElementById("sem_numero");
    var numeroResidenciaInput = document.getElementById("numero_residencia");

    if (checkbox.checked) {
        numeroResidenciaInput.value = "(S/N)"; 
        numeroResidenciaInput.required = false; 
        numeroResidenciaInput.disabled = true; 
    } else {
        numeroResidenciaInput.required = true;
        numeroResidenciaInput.disabled = false; 
    }
}


//ROLAGEM DINAMICA//
document.addEventListener("DOMContentLoaded", function() {
    const navLinks = document.querySelectorAll('.nav-links li a');

    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            if (!link.href.includes('assine.html')) { // Adicionando uma exceção para o link "assine"
                e.preventDefault();

                const targetId = this.getAttribute('href').substring(1);
                const targetSection = document.getElementById(targetId);

                if (targetSection) {
                    const offsetTop = targetSection.offsetTop;

                    window.scrollTo({
                        top: offsetTop,
                        behavior: 'smooth'
                    });
                }
            }
        });
    });
});

document.addEventListener("DOMContentLoaded", function() {
    const saibaMaisButton = document.querySelector('.featured-section .btn');

    saibaMaisButton.addEventListener('click', function(e) {
        e.preventDefault();

        const targetSection = document.getElementById('como-funciona');

        if (targetSection) {
            const offsetTop = targetSection.offsetTop;

            window.scrollTo({
                top: offsetTop,
                behavior: 'smooth'
            });
        }
    });
});

window.onscroll = function() {myFunction()};
    
    var header = document.getElementById("Barra");
    var sticky = header.offsetTop;
    
    function myFunction() {
      if (window.pageYOffset > sticky) {
        header.classList.add("sticky");
      } else {
        header.classList.remove("sticky");
      }
    }

//Verifica se as senhas coincidem

function validarSenha() {
    var senha = document.getElementById("senha").value;
    var confirmarSenha = document.getElementById("confirmar_senha").value;

    if (senha != confirmarSenha) {
        alert("As senhas não coincidem!");
        return false;
    }
    return true;
}

// Adicionando evento de escuta para o envio do formulário
document.getElementById("formulario").addEventListener("submit", function(event) {
    if (!validarSenha()) {
        event.preventDefault(); // Impede o envio do formulário se as senhas não coincidirem
    } 
});
