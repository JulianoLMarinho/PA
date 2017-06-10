/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function ambienteSubmit(n) {
    $('<input />').attr('type', 'hidden')
            .attr('name', 'botaoSubmitAmbienteId')
            .attr('value', n)
            .appendTo('#formPrincipal');
    $('#formPrincipal').submit();
};

function dispositivoSubmit(n) {
    $('<input />').attr('type', 'hidden')
            .attr('name', 'botaoSubmitDispositivoId')
            .attr('value', n)
            .appendTo('#formPrincipal');
    $('#formPrincipal').submit();
};


function test(){
    var objetoJSON = {
      "teste1":2  
    };
    var stringJSON = JSON.stringify(objetoJSON);
    var objPedidoAJAX = new XMLHttpRequest();
    objPedidoAJAX.open("POST", "controller");
    objPedidoAJAX.setRequestHeader("Content-Type","application/json;charset=UTF-8");
    // Prepara recebimento da resposta: tipo da resposta JSON!
    objPedidoAJAX.responseType = 'json';
    
    objPedidoAJAX.onreadystatechange =
        function() {
            if(objPedidoAJAX.readyState===4 && objPedidoAJAX.status===200){
                // A resposta 'response' já é avaliada para json!
                // Ao contraro da resposta responseText.
                var respJSON = objPedidoAJAX.response;
                console.log(respJSON);
                document.getElementsByName('nomeCasa')[0].value = respJSON.nome;
            };
        };
        
    // Envio do pedido
    objPedidoAJAX.send(stringJSON);
};

