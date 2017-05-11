/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function ambienteSubmit(n){     
     $('<input />').attr('type', 'hidden')
              .attr('name', 'botaoSubmitAmbienteId')
              .attr('value', n)
              .appendTo('#formPrincipal');
$('#formPrincipal').submit();
}


