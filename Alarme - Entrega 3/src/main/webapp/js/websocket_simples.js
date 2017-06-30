/* global alarmeAtivo */

window.onload = main;

function main(){
    conectar();
}

var websocket;
var alarteAtivo = true;
//------------------------------------------------------------------------------
function conectar() {
    var wsUri = "ws://localhost:8084/terceiro_trabalho/input";
    alarmeAtivo = true;
    $('#ativado').css('display', 'block');
    $('#desativado').css('display', 'none');
    
    
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
            if(json.alarme==="true" && alarmeAtivo){
                $('#ativado').css("display", 'block');
                $('#desativado').css("display", 'none');
                $('#alarmeA').css("display", "block");
                $('#alarmeD').css("display", "none");
            }
            if(json.alarme==="false" && alarmeAtivo){
                $('#ativado').css("display", 'block');
                $('#desativado').css("display", 'none');
                $('#alarmeA').css("display", "none");
                $('#alarmeD').css("display", "block");
            }
            if(!alarmeAtivo){
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

function desativarAlarme(){
    alarmeAtivo = false;
    $('#ativado').css('display', 'none');
    $('#desativado').css('display', 'block');
}

function ativarAlarme(){
    alarmeAtivo = true;
    $('#ativado').css('display', 'block');
    $('#desativado').css('display', 'none');
}

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
