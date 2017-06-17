/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

window.onload = main;

function main() {
    loadCasa();
    $('#buttonDetAmb').prop('disabled', true);
    $('#buttonAddDisp').prop('disabled', true);
    $('#buttonDetDisp').prop('disabled', true);
    $('#buttonContDisp').prop('disabled', true);
    $('#listDispositivos').prop('disabled', true);
    $('#listAmbientes').change(function () {
        var val = $("#listAmbientes option:selected")[0].value;
        selecionaAmbiente(val);
    });
    
    $('#listDispositivos').change(function () {
        var val = $("#listDispositivos option:selected")[0].value;
        selecionaDispositivo(val);
    });     
}

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

function setCasa(casa){
    for (var i =0; i<document.getElementsByName("nomeCasa").length; i++){
        document.getElementsByName("nomeCasa")[i].value = casa.nome;
    }
    for (var i=0; i<document.getElementsByName("ruaCasa").length; i++){
        document.getElementsByName("ruaCasa")[i].value = casa.rua;
    }
    for (var i=0; i<document.getElementsByName("numeroCasa").length; i++){
        document.getElementsByName("numeroCasa")[i].value = casa.numero;
    }
    for (var i=0; i<document.getElementsByName("complementoCasa").length; i++){
        document.getElementsByName("complementoCasa")[i].value = casa.complemento;
    }
    loadAmbientes(casa.id);
}

function setListAmbientes(ambientes) {
    repopulateAmbiente();
    selecionaAmbiente(0);
    var select = document.getElementById("listAmbientes");
    for (var i = 0; i < ambientes.length; i++) {
        var option = document.createElement("option");
        option.setAttribute("value", ambientes[i].id);
        option.appendChild(document.createTextNode(ambientes[i].nome));
        select.appendChild(option);
    }
}

function repopulateAmbiente() {
    document.getElementById("nomeAddAmbiente").value = "";
    document.getElementById("nomeAddDetAmb").value = "";
    $('#buttonDetAmb').prop('disabled', true);
    $('#buttonDetAmb').addClass('disabled');
    $('#listAmbientes').empty();
    var select = document.getElementById("listAmbientes");
    var option = document.createElement("option");
    option.setAttribute("value", 0);
    option.appendChild(document.createTextNode("Selecione o Ambiente"));
    select.appendChild(option);
}

function repopulateDispositivo() {
    $('#buttonDetDisp').prop('disabled', true);
    $('#buttonContDisp').prop('disabled', true);
    $('#buttonDetDisp').addClass('disabled');
    $('#buttonContDisp').addClass('disabled');
    $('#listDispositivos').empty();
    document.getElementById("nomeAddDisp").value = "";
    var select = document.getElementById('listDispositivos');
    var option = document.createElement("option");
    option.setAttribute("value", 0);
    option.appendChild(document.createTextNode("Selecione o Dispositivo"));
    select.appendChild(option);
}

function setListDispositivos(dispositivos) {
    repopulateDispositivo();
    var select = document.getElementById("listDispositivos");
    for (var i = 0; i < dispositivos.length; i++) {
        var option = document.createElement("option");
        option.setAttribute("value", dispositivos[i].id);
        option.appendChild(document.createTextNode(dispositivos[i].nome));
        select.appendChild(option);
    }
}

function selecionaDispositivo(dispositivo){
    if(dispositivo == 0){
        $('#buttonDetDisp').prop('disabled', true);
        $('#buttonDetDisp').addClass('disabled');
        $('#buttonContDisp').prop('disabled', true);
        $('#buttonContDisp').addClass('disabled');
    } else {
        dispositivoSelecionado(dispositivo);
        $('#buttonDetDisp').removeClass('disabled');
        $('#buttonDetDisp').prop('disabled', false);
        $('#buttonContDisp').removeClass('disabled');
        $('#buttonContDisp').prop('disabled', false);
    }      
}

function selecionaAmbiente(ambiente) {
    if (ambiente == 0) {
        $('#buttonDetAmb').prop('disabled', true);
        $('#buttonDetAmb').addClass('disabled');
        $('#buttonAddDisp').prop('disabled', true);
        $('#buttonAddDisp').addClass('disabled');
        $('#listDispositivos').prop('disabled', true);
        repopulateDispositivo();
    } else {
        loadDispositivos(ambiente);
        ambienteSelecionado(ambiente);
        $('#buttonDetAmb').prop('disabled', false);
        $('#buttonDetAmb').removeClass('disabled');
        $('#listDispositivos').prop('disabled', false);
        $('#buttonAddDisp').prop('disabled', false);
        $('#buttonAddDisp').removeClass('disabled');
    }
}

function loadCasa(){
    var casa ={
        acao: "obter"       
    };
    
    PedidoAJAX(casa, setCasa, "casacore");
};

function editCasa(){
    var casa = {
        acao: "editar",
        casa: {
            nome:document.getElementById("nomeEditCasa").value,
            rua:document.getElementById("ruaEditCasa").value,
            numero: document.getElementById("numeroEditCasa").value,
            complemento:document.getElementById("complementoEditCasa").value                   
        }
    };
    
    PedidoAJAX(casa, setCasa, "casacore");
}

function loadAmbientes(idCasa){
    var casa = {
        acao: "visualizar",
        casa: idCasa
    };
    
    PedidoAJAX(casa, setListAmbientes, "ambientecore");    
}

function adicionarAmbiente(idCasa){
    var ambiente = {
        acao: "editar",
        ambiente: {
            casa_id: 1,
            nome: document.getElementById("nomeAddAmbiente").value,
            detalhes: document.getElementById("nomeAddDetAmb").value            
        }
    };
    
    PedidoAJAX(ambiente, setListAmbientes, "ambientecore");
}

function ambienteSelecionado(idAmbiente){
    var ambiente = {
        acao: "selecionar",
        idAmbiente: idAmbiente
    };
    
    PedidoAJAX(ambiente, loadModalDetAmb, "ambientecore");
}

function deleteAmbiente(){
    var idAmbiente = $("#listAmbientes option:selected")[0].value;
    var ambiente = {
        acao: "excluir",
        idAmbiente: idAmbiente
    };
    
    PedidoAJAX(ambiente, setListAmbientes, "ambientecore");
}

function deleteDispositivo(){
    var idDispositivo = $('#listDispositivos option:selected')[0].value;
    var dispositivo = {
        acao: "excluir",
        idAmbiente: $("#listAmbientes option:selected")[0].value,
        idDispositivo: idDispositivo
    };
    
    PedidoAJAX(dispositivo, setListDispositivos, "dispositivocore");
}

function loadModalDetAmb(ambiente){
    document.getElementById("ModalNomeAmbiente").value = ambiente.nome;
    document.getElementById("ModalDetAmb").value = ambiente.detalhes;
}

function loadDispositivos(idAmbiente){
    var dispositivo = {
        acao: "visualizar",
        ambiente:idAmbiente
    };
    
    PedidoAJAX(dispositivo, setListDispositivos, "dispositivocore");
}

function dispositivoSelecionado(idDispositivo){
    var dispositivo = {
        acao: "selecionar",
        dispositivo: idDispositivo
    };
    
    PedidoAJAX(dispositivo, loadModalDetDisp, "dispositivocore");
}

function loadModalDetDisp(dispositivo) {
    document.getElementById("nomeDetDispositivo").value = dispositivo.nome;
    console.log(dispositivo);
    $.getScript('js_dispositivos/'+dispositivo.arquivojs, function ()
    {
        iniciar(dispositivo.id);
        
    });
}

function adicionarDispositivo(){
    var dispositivo = {
        acao: "adicionar",        
        dispositivo: {
            nome:document.getElementById("nomeAddDisp").value,
            id_ambiente: $("#listAmbientes option:selected")[0].value
        }      
    };
    
    PedidoAJAX(dispositivo, setListDispositivos, "dispositivocore");
}

function PedidoAJAX(request, metodo, destino){
    var stringJSON = JSON.stringify(request);
    var objPedidoAJAX = new XMLHttpRequest();
    objPedidoAJAX.open("POST", destino);
    objPedidoAJAX.setRequestHeader("Content-Type","application/json;charset=UTF-8");
    // Prepara recebimento da resposta: tipo da resposta JSON!
    objPedidoAJAX.responseType = 'json';    
    objPedidoAJAX.onreadystatechange =
        function() {
            if(objPedidoAJAX.readyState===4 && objPedidoAJAX.status===200){
                // A resposta 'response' já é avaliada para json!
                // Ao contraro da resposta responseText.
                var respJSON = objPedidoAJAX.response;
                    metodo(respJSON);
            };
        };        
    // Envio do pedido
    objPedidoAJAX.send(stringJSON);
}