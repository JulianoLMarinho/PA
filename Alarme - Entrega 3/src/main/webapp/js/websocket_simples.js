window.onload = main;

function main(){
    conectar();
}

var websocket;
//------------------------------------------------------------------------------
function conectar() {
    var wsUri = "ws://localhost:8084/terceiro_trabalho/input";
    try {
        websocket = new WebSocket(wsUri);
    } catch (erro) {
        $('#idMensagens').html('Erro: ' + erro);
        return;
    }
    websocket.binaryType = "arraybuffer";

    websocket.onopen = function(ev){console.log('=== Conectou');}
    
    websocket.onmessage = function (evt) {
        var json = JSON.parse(evt.data);
        if (typeof evt.data === "string") {
            if(json.alarme==="true"){
                $('#alarmeA').css("display", "block");
                $('#alarmeD').css("display", "none");
            }
            if(json.alarme==="false"){
                $('#alarmeA').css("display", "none");
                $('#alarmeD').css("display", "block");
            }
        } else {
            console.log('Recebeu dados binários! E agora?');
        }
    };
    websocket.onerror = function (evt) {
        $('#idMensagens').html('Erro: ' + evt);
    };
}
//------------------------------------------------------------------------------
function desconectar() {
    websocket.close();
    $('#idMensagens').html('DESCONECTOU!');
}
//------------------------------------------------------------------------------
function fazerPedidoHTTP() {
    $.ajax(
            {
                type: 'GET',
                url: '/terceiro_trabalho/servlet',
                data: "alarme="+true,
                dataType: 'text',
                cache: false,
                async: true,
                success: function (responseData) {
                    
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    $('#idMensagens').html('Erro: ' + thrownError);
                }
            }
    );
}
//------------------------------------------------------------------------------
