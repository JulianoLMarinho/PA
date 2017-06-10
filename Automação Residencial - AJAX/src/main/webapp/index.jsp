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
    </head>
    <body>        
        <div class="container">
            <div class="row">                
                <div class="topo col-md-6 col-md-offset-3" style="border-radius: 4px 4px 0 0">
                    <h1 style="color: #FFFFFF"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></h1>
                </div>
                <div class="col-md-6 col-md-offset-3" style="text-align: center; border: 1px solid #ccc; border-radius: 0 0 4px 4px;">
                    <div style="margin-bottom: 20px;" id="formPrincipal">
                        <input type="hidden"
                               name="nomePageHandle"
                               value="com.juliano.automacaoresidencial.PageHandlers.IndexHandle" />
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
                            <div class="dropdown">
                                <button class="btn btn-default col-xs-12 col-sm-12 col-md-12 dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="margin: 0 0 15px 0">
                                    Selecione o Ambiente
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu col-xs-12 col-sm-12 col-md-12" aria-labelledby="dropdownAmbiente">
                                    <li><a href="#" onclick="ambienteSubmit('sAmbiente')">Selecione o Ambiente</a></li>
                                        <li><a href="#" onclick="ambienteSubmit('2')">Quarto</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="row" style="margin: 0">
                            <div class="btn btn-default col-md-6 .col-xs-6" data-toggle="modal" data-target="#ModalAdcAmbiente" style="float: left"><span class="glyphicon glyphicon-plus"></span>  Adicionar Ambiente</div>
                            <div class="btn btn-default col-md-6 .col-xs-6" value="DetalhesAmbiente" data-toggle="modal" data-target="#ModalDetAmbiente" style="float: right" ${sessionScope.disableAmbDet}><span class="glyphicon glyphicon-list-alt "></span>  Detalhes</div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="dispositivoAmbiente" style="font-size: 2.3em">Dispositivos</label>
                            <div class="dropdown" >
                                <button class="btn btn-default col-xs-12 col-sm-12 col-md-12 dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="margin: 0 0 15px 0" ${sessionScope.disableDisp}>
                                    Selecione o Dispositivo
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu col-xs-12 col-sm-12 col-md-12" aria-labelledby="dropdownDispositivo">
                                    <li><a href="#" onclick="dispositivoSubmit('sDispositivo')">Selecione o Dispositivo</a></li>
                                        <li><a href="#" onclick="dispositivoSubmit('8')">TV/a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="row" style="margin: 0">
                            <div class="btn btn-default col-md-6 .col-xs-6" data-toggle="modal" data-target="#ModalAdcDispositivo" style="float: left"><span class="glyphicon glyphicon-plus"></span>  Adicionar Dispositivo</div>
                            <div class="btn btn-default col-md-6 .col-xs-6" data-toggle="modal" data-target="#ModalDetDispositivo" ${sessionScope.disableDispDet}><span class="glyphicon glyphicon-list-alt"></span>  Detalhes</div>
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
                                <input type="text" style="text-align: center" class="form-control" id="nomeCasa" value="Casa" disabled>
                            </div>
                            <div class="form-group">
                                <label for="ruaCasa" style="font-size: 1.5em">Rua:</label>
                                <input type="text" style="text-align: center" class="form-control" id="ruaCasa" value="AX" disabled>
                            </div>

                            <div class="form-group">
                                <label for="numeroCasa" style="font-size: 1.5em">Número:</label>
                                <input type="text" style="text-align: center" class="form-control" id="numeroCasa" value="9" disabled>                                   
                            </div>

                            <div class="form-group">
                                <label for="complementoCasa" style="font-size: 1.5em">Complemento:</label>
                                <input type="text" style="text-align: center" class="form-control" id="complementooCasa" value="SEM" disabled>
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
                        <form class="form-horizontal" id="formEditCasa" method="POST" action="controller">
                            <input type="hidden"
                                   name="nomePageHandle"
                                   value="com.juliano.automacaoresidencial.PageHandlers.IndexHandle" />

                            <input type="hidden" name="nomeIdCasa" value="5"/>

                            <div class="form-group">
                                <label for="nomeCasa" style="font-size: 1.5em">Nome:</label>                                                
                                <input type="text" style="text-align: center" class="form-control" id="nomeCasa" name="nomeCasa" value="Casa" required="true"/>
                            </div>
                            <div class="form-group">
                                <label for="ruaCasa" style="font-size: 1.5em">Rua:</label>
                                <input type="text" style="text-align: center" class="form-control" id="ruaCasa" name="nomeRua" value="AX">
                            </div>

                            <div class="form-group">
                                <label for="numeroCasa" style="font-size: 1.5em">Número:</label>
                                <input type="text" style="text-align: center" class="form-control" id="numeroCasa" name="nomeNumero" value="9">                                   
                            </div>

                            <div class="form-group">
                                <label for="complementoCasa" style="font-size: 1.5em">Complemento:</label>
                                <input type="text" style="text-align: center" class="form-control" id="complementoCasa" name="nomeComplemento" value="">
                            </div>
                        </form>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" style="float: left">Cancelar</button>
                            <button type="submit" class="btn btn-default" form="formEditCasa" name="submitModal" value="EditarCasa">Salvar</button>
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
                        <form class="form-horizontal" id="formAdicAmb" method="POST" action="controller">
                            <input type="hidden"
                                   name="nomePageHandle"
                                   value="com.juliano.automacaoresidencial.PageHandlers.IndexHandle" />

                            <input type="hidden" name="nomeIdCasa" value=""/>

                            <div class="form-group">
                                <label for="nomeAmbiente" style="font-size: 1.5em">Nome:</label>                                                
                                <input type="text" style="text-align: center" class="form-control" id="nomeAmbiente" name="nomeAmbiente" required="true">
                            </div>
                            <div class="form-group">
                                <label for="nomeDetAmb" style="font-size: 1.5em">Detalhes:</label>
                                <input type="text" style="text-align: center" class="form-control" id="nomeDetAmb" name="nomeDetAmb">
                            </div>
                        </form>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" style="float: left">Cancelar</button>
                            <button class="btn btn-default" name="submitModal" form="formAdicAmb" value="AdicionarAmbiente">Salvar</button>
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
                        <form class="form-horizontal" id="formDetAmb" method="POST" action="controller">
                            <input type="hidden"
                                   name="nomePageHandle"
                                   value="com.juliano.automacaoresidencial.PageHandlers.IndexHandle" />

                            <input type="hidden" name="nomeIdAmbiente" value=""/>

                            <div class="form-group">
                                <label for="nomeAmbiente" style="font-size: 1.5em">Nome:</label>                                                
                                <input type="text" style="text-align: center" class="form-control" id="nomeAmbiente" name="nomeAmbiente" value="" required="true" disabled>
                            </div>
                            <div class="form-group">
                                <label for="nomeDetAmb" style="font-size: 1.5em">Detalhes:</label>
                                <input type="text" style="text-align: center" class="form-control" id="nomeDetAmb" name="nomeDetAmb" value="" disabled>
                            </div>
                        </form>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-default" name="submitModal" form="formDetAmb" value="ExcluirAmbiente" style="float: left">Excluir</button>
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
                        <form class="form-horizontal" id="formAdicDisp" method="POST" action="controller">
                            <input type="hidden"
                                   name="nomePageHandle"
                                   value="com.juliano.automacaoresidencial.PageHandlers.IndexHandle" />

                            <input type="hidden" name="nomeIdAmbiente" value=""/>

                            <div class="form-group">
                                <label for="nomeDispositivo" style="font-size: 1.5em">Nome:</label>                                                
                                <input type="text" style="text-align: center" class="form-control" id="nomeDispositivo" name="nomeDispositivo" required="true">
                            </div>
                        </form>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" style="float: left">Cancelar</button>
                            <button class="btn btn-default" onclick="test()" value="AdicionarDispositivo">Salvar</button>
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
                        <form class="form-horizontal" id="formDetDisp" method="POST" action="controller">
                            <input type="hidden"
                                   name="nomePageHandle"
                                   value="com.juliano.automacaoresidencial.PageHandlers.IndexHandle" />

                            <input type="hidden" name="nomeIdDisp" value=""/>

                            <div class="form-group">
                                <label for="nomeDispositivo" style="font-size: 1.5em">Nome:</label>                                                
                                <input type="text" style="text-align: center" class="form-control" id="nomeDispositivo" name="nomeDispositivo" value="" required="true" disabled>
                            </div>
                        </form>
                        <div class="modal-footer">
                            <button class="btn btn-default" name="submitModal" form="formDetDisp" value="ExcluirDispositivo" style="float: left">Excluir</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal" >Fechar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>


    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/functions.js"></script>
</body>
</html>
