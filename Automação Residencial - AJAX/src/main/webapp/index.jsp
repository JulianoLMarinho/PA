<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Minha Casa</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Raleway:400,700" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/style.css" /> 
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" /> 
        <link rel="stylesheet" type="text/css" href="bootstrap-toggle-master/css/bootstrap-toggle.min.css"/>
    </head>
    <body>        
        <div class="container">
            <div class="row">                
                <div class="topo col-md-6 col-md-offset-3" style="border-radius: 4px 4px 0 0">
                    <h1 style="color: #FFFFFF"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></h1>
                </div>
                <div class="col-md-6 col-md-offset-3" style="text-align: center; border: 1px solid #ccc; border-radius: 0 0 4px 4px;">
                    <div style="margin-bottom: 20px;" id="formPrincipal">
                        <div class="form-group">
                            <label for="nomeCasa" style="font-size: 2.3em">Minha Casa</label>
                            <input type="text" style="text-align: center" class="form-control" name="nomeCasa" id="nomeCasa" value="" disabled>
                        </div>
                        <div class="row" style="margin: 0">
                            <div class="btn btn-default col-md-6 .col-xs-6" value="DetalhesCasa" data-toggle="modal" data-target="#ModalEditCasa" style="float: left"><span class="glyphicon glyphicon-list-alt "></span>  Editar</div>
                            <div class="btn btn-default col-md-6 .col-xs-6" value="DetalhesCasa" data-toggle="modal" data-target="#ModalDetCasa" style="float: right"><span class="glyphicon glyphicon-list-alt "></span>  Detalhes</div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="ambienteCasa" style="font-size: 2.3em">Ambiente</label>
                            <select class="form-control" id="listAmbientes" style="text-align: center">
                                <option value="0">Selecione o Ambiente</option>
                            </select>                           
                        </div>
                        <div class="row" style="margin: 0">
                            <div class="btn btn-default col-md-6 .col-xs-6" data-toggle="modal" data-target="#ModalAdcAmbiente" style="float: left"><span class="glyphicon glyphicon-plus"></span>  Adicionar Ambiente</div>
                            <div class="btn btn-default col-md-6 .col-xs-6 disabled" value="DetalhesAmbiente" data-toggle="modal" id="buttonDetAmb" data-target="#ModalDetAmbiente" style="float: right"><span class="glyphicon glyphicon-list-alt "></span> Detalhes</div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="dispositivoAmbiente" style="font-size: 2.3em">Dispositivos</label>
                            <select class="form-control disabled" id="listDispositivos">
                                <option value="0">Selecione o Dispositivo</option>
                            </select>
                        </div>
                        <div class="row" style="margin: 0">
                            <div class="btn btn-default col-md-4 .col-xs-4 disabled disabled" data-toggle="modal" id="buttonAddDisp" data-target="#ModalAdcDispositivo" style="float: left"><span class="glyphicon glyphicon-plus"></span>  Adicionar Dispositivo</div>
                            <div class="btn btn-default col-md-4 .col-xs-4 disabled disabled" data-toggle="modal" id="buttonContDisp" data-target="#ModalContDispositivo"><span class="glyphicon glyphicon-list-alt"></span>  Controlar</div>
                            <div class="btn btn-default col-md-4 .col-xs-4 disabled disabled" data-toggle="modal" id="buttonDetDisp" data-target="#ModalDetDispositivo"><span class="glyphicon glyphicon-list-alt"></span>  Detalhes</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
        <!-- Modal Detalhes da Casa-->
        <div id="ModalDetCasa" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content col-md-6 col-md-offset-3">
                    <div class="modal-header" style="text-align: center">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Casa</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label for="nomeCasa" style="font-size: 1.5em">Nome:</label>
                                <input type="text" style="text-align: center" class="form-control" name="nomeCasa" id="nomeCasa" value="" disabled>
                            </div>
                            <div class="form-group">
                                <label for="ruaCasa" style="font-size: 1.5em">Rua:</label>
                                <input type="text" style="text-align: center" class="form-control" name="ruaCasa" id="ruaCasa" value="" disabled>
                            </div>

                            <div class="form-group">
                                <label for="numeroCasa" style="font-size: 1.5em">Número:</label>
                                <input type="text" style="text-align: center" class="form-control" name="numeroCasa" id="numeroCasa" value="" disabled>                                   
                            </div>

                            <div class="form-group">
                                <label for="complementoCasa" style="font-size: 1.5em">Complemento:</label>
                                <input type="text" style="text-align: center" class="form-control" name="complementoCasa" id="complementoCasa" value="" disabled>
                            </div>
                        </form>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Para Editar a Casa-->
        <div id="ModalEditCasa" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content col-md-6 col-md-offset-3">
                    <div class="modal-header" style="text-align: center">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Editar Casa</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal" id="formEditCasa">          

                            <input type="hidden" name="nomeIdCasa" value="5"/>

                            <div class="form-group">
                                <label for="nomeCasa" style="font-size: 1.5em">Nome:</label>                                                
                                <input type="text" style="text-align: center" class="form-control" id="nomeEditCasa" name="nomeCasa" value="" required="true"/>
                            </div>
                            <div class="form-group">
                                <label for="ruaCasa" style="font-size: 1.5em">Rua:</label>
                                <input type="text" style="text-align: center" class="form-control" id="ruaEditCasa" name="ruaCasa" value="">
                            </div>

                            <div class="form-group">
                                <label for="numeroCasa" style="font-size: 1.5em">Número:</label>
                                <input type="text" style="text-align: center" class="form-control" id="numeroEditCasa" name="numeroCasa" value="">                                   
                            </div>

                            <div class="form-group">
                                <label for="complementoCasa" style="font-size: 1.5em">Complemento:</label>
                                <input type="text" style="text-align: center" class="form-control" id="complementoEditCasa" name="complementoCasa" value="">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" style="float: left">Cancelar</button>
                            <button class="btn btn-default" name="submitModal" data-dismiss="modal" onclick="editCasa()" value="EditarCasa">Salvar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Para Adicionar Ambiente-->
        <div id="ModalAdcAmbiente" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content col-md-6 col-md-offset-3">
                    <div class="modal-header" style="text-align: center">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Adicionar Novo Ambiente</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal" id="formAdicAmb">

                            <input type="hidden" name="nomeIdCasa" value=""/>

                            <div class="form-group">
                                <label for="nomeAmbiente" style="font-size: 1.5em">Nome:</label>                                                
                                <input type="text" style="text-align: center" class="form-control" id="nomeAddAmbiente" name="nomeAmbiente" required="true">
                            </div>
                            <div class="form-group">
                                <label for="nomeDetAmb" style="font-size: 1.5em">Detalhes:</label>
                                <input type="text" style="text-align: center" class="form-control" id="nomeAddDetAmb" name="nomeDetAmb">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" style="float: left">Cancelar</button>
                            <button class="btn btn-default" onclick="adicionarAmbiente(1)" data-dismiss="modal" value="AdicionarAmbiente">Salvar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Detalhe Ambiente-->
        <div id="ModalDetAmbiente" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content col-md-6 col-md-offset-3">
                    <div class="modal-header" style="text-align: center">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Detalhes do Ambiente</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" id="formDetAmb">

                            <div class="form-group">
                                <label for="nomeAmbiente" style="font-size: 1.5em">Nome:</label>                                                
                                <input type="text" style="text-align: center" class="form-control" id="ModalNomeAmbiente" name="nomeAmbiente" value="" required="true" disabled>
                            </div>
                            <div class="form-group">
                                <label for="nomeDetAmb" style="font-size: 1.5em">Detalhes:</label>
                                <input type="text" style="text-align: center" class="form-control" id="ModalDetAmb" name="nomeDetAmb" value="" disabled>
                            </div>
                        </form>
                        <div class="modal-footer">
                            <button class="btn btn-default" data-dismiss="modal" value="ExcluirAmbiente" onclick="deleteAmbiente()" style="float: left">Excluir</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                        </div>
                    </div>
                </div>    
            </div>
        </div>

        <!-- Modal Para Adicionar Dispositivo-->
        <div id="ModalAdcDispositivo" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content col-md-6 col-md-offset-3">
                    <div class="modal-header" style="text-align: center">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Adicionar Novo Dispositivo</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal" id="formAdicDisp">

                            <input type="hidden" name="nomeIdAmbiente" value=""/>

                            <div class="form-group">
                                <label for="nomeDispositivo" style="font-size: 1.5em">Nome:</label>                                                
                                <input type="text" style="text-align: center" class="form-control" id="nomeAddDisp" name="nomeDispositivo" value="" required="true">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" style="float: left">Cancelar</button>
                            <button class="btn btn-default" onclick="adicionarDispositivo()" data-dismiss="modal" value="AdicionarDispositivo">Salvar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Controlar Dispositivo-->
        <div id="ModalContDispositivo" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content col-md-8 col-md-offset-3">
                    <div class="modal-header" style="text-align: center">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Controlar Dispositivo</h4>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group row">
                                <label for="estadoDispositivo" style="font-size: 1.5em">Estado do Dispositivo:</label>                                                
                                <input style="float: right" data-width="100" id="estadoDispositivo" type="checkbox" checked data-toggle="toggle" data-on="Ligado" data-off="Desligado" data-onstyle="success" data-offstyle="danger">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Modal Detalhe Dispositivo-->
        <div id="ModalDetDispositivo" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content col-md-6 col-md-offset-3">
                    <div class="modal-header" style="text-align: center">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Adicionar Novo Dispositivo</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal" id="formDetDisp">

                            <div class="form-group">
                                <label for="nomeDispositivo" style="font-size: 1.5em">Nome:</label>                                                
                                <input type="text" style="text-align: center" class="form-control" id="nomeDetDispositivo" name="nomeDispositivo" value="" required="true" disabled>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-default" name="submitModal" data-dismiss="modal" value="ExcluirDispositivo" onclick="deleteDispositivo()" style="float: left">Excluir</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal" >Fechar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>


    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap-toggle-master/js/bootstrap-toggle.min.js"></script>
    <script src="js/functions.js"></script>
</body>
</html>
