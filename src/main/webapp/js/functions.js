/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function ambienteSubmit(n) {
    console.log("uiuiuiu");
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


