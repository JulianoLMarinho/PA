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
            <jsp:useBean id="casaDao" class="com.juliano.automacaoresidencial.DTO.CasaDTO"/>
            <jsp:useBean id="ambienteDTO" class="com.juliano.automacaoresidencial.DTO.AmbienteDTO"/>
            <jsp:useBean id="test" class="com.juliano.automacaoresidencial.PageHandlers.IndexHandle"/>
            <jsp:useBean id="dispositivoDTO" class="com.juliano.automacaoresidencial.DTO.DispositivoDTO"/>
            <div class="row">                
                <div class="topo col-md-6 col-md-offset-3" style="border-radius: 4px 4px 0 0">
                    <h1 style="color: #FFFFFF"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></h1>
                </div>
                <div class="col-md-6 col-md-offset-3" style="text-align: center; border: 1px solid #ccc; border-radius: 0 0 4px 4px;">
                    <form style="margin-bottom: 20px;" id="formPrincipal" method="GET" action="controller">
                        <input type="hidden"
                               name="nomePageHandle"
                               value="com.juliano.automacaoresidencial.PageHandlers.IndexHandle" />
                        <div class="form-group">
                            <label for="nomeCasa" style="font-size: 2.3em">Minha Casa</label>
                            <input type="text" style="text-align: center" class="form-control" id="nomeCasa" value="${casaDao.casa.nome}" disabled>
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
                                    ${sessionScope.selecAmb}
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu col-xs-12 col-sm-12 col-md-12" aria-labelledby="dropdownAmbiente">
                                    <li><a href="#" onclick="ambienteSubmit('sAmbiente')">Selecione o Ambiente</a></li>
                                        <c:forEach var="ambiente" items="${ambienteDTO.getListaAmbiente(casaDao.casa.id)}">
                                        <li><a href="#" onclick="ambienteSubmit('${ambiente.id}')">${ambiente.nome}</a></li>
                                        </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div class="row" style="margin: 0">
                            <button class="btn btn-default col-md-6 .col-xs-6" style="float: left"><span class="glyphicon glyphicon-plus"></span>  Adicionar Ambiente</button>
                            <div class="btn btn-default col-md-6 .col-xs-6" value="DetalhesAmbiente" data-toggle="modal" data-target="#myModalk" style="float: right" ${sessionScope.disableAmbDet}><span class="glyphicon glyphicon-list-alt "></span>  Detalhes</div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="dispositivoAmbiente" style="font-size: 2.3em">Dispositivos</label>
                            <div class="dropdown" >
                                <button class="btn btn-default col-xs-12 col-sm-12 col-md-12 dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="margin: 0 0 15px 0" ${sessionScope.disableDisp}>
                                    ${sessionScope.selecDisp}
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu col-xs-12 col-sm-12 col-md-12" aria-labelledby="dropdownDispositivo">
                                    <li><a href="#" onclick="dispositivoSubmit('sDispositivo')">Selecione o Ambiente</a></li>
                                        <c:forEach var="dispositivo" items="${dispositivoDTO.getListaDispositivo(sessionScope.idSelecAmb)}">
                                        <li><a href="#" onclick="dispositivoSubmit('${dispositivo.id}')">${dispositivo.nome}</a></li>
                                        </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div class="row" style="margin: 0">
                            <button class="btn btn-default col-md-6 .col-xs-6" style="float: left" ${sessionScope.disableDisp}><span class="glyphicon glyphicon-plus"></span>  Adicionar Dispositivo</button>
                            <button type="submit" class="btn btn-default col-md-6 .col-xs-6" style="float: right" ${sessionScope.disableDispDet}><span class="glyphicon glyphicon-list-alt"></span>  Detalhes</button>
                        </div>
                        
                        <!-- Modal Para Editar a Casa-->
                        <div id="ModalEditCasa" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content col-md-6">
                                    <div class="modal-header" style="text-align: center">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">${casaDao.casa.nome}</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal">
                                            <div class="form-group">
                                                <input type="hidden" class="form-control" nome="nomeIdCasa" value="${casaDao.casa.id}"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="nomeCasa" style="font-size: 1.5em">Nome:</label>                                                
                                                <input type="text" style="text-align: center" class="form-control" id="nomeCasa" name="nomeCasa" value="${casaDao.casa.nome}" required="true"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="ruaCasa" style="font-size: 1.5em">Rua:</label>
                                                <input type="text" style="text-align: center" class="form-control" id="ruaCasa" name="nomeRua" value="${casaDao.casa.rua}">
                                            </div>

                                            <div class="form-group">
                                                <label for="numeroCasa" style="font-size: 1.5em">Número:</label>
                                                <input type="text" style="text-align: center" class="form-control" id="numeroCasa" name="nomeNumero" value="${casaDao.casa.numero}">                                   
                                            </div>

                                            <div class="form-group">
                                                <label for="complementoCasa" style="font-size: 1.5em">Complemento:</label>
                                                <input type="text" style="text-align: center" class="form-control" id="complementoCasa" name="nomeComplemento" value="${casaDao.casa.complemento}">
                                            </div>
                                        </form>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal" style="float: left">Cancelar</button>
                                            <button type="submit" class="btn btn-default" name="botaoEditarCasa" value="EditarCasa">Salvar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>  
        <!-- Modal Detalhes da Casa-->
        <div id="ModalDetCasa" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content col-md-6">
                    <div class="modal-header" style="text-align: center">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">${casaDao.casa.nome}</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label for="nomeCasa" style="font-size: 1.5em">Nome:</label>
                                <input type="text" style="text-align: center" class="form-control" id="nomeCasa" value="${casaDao.casa.nome}" disabled>
                            </div>
                            <div class="form-group">
                                <label for="ruaCasa" style="font-size: 1.5em">Rua:</label>
                                <input type="text" style="text-align: center" class="form-control" id="ruaCasa" value="${casaDao.casa.rua}" disabled>
                            </div>

                            <div class="form-group">
                                <label for="numeroCasa" style="font-size: 1.5em">Número:</label>
                                <input type="text" style="text-align: center" class="form-control" id="numeroCasa" value="${casaDao.casa.numero}" disabled>                                   
                            </div>

                            <div class="form-group">
                                <label for="complementoCasa" style="font-size: 1.5em">Complemento:</label>
                                <input type="text" style="text-align: center" class="form-control" id="complementooCasa" value="${casaDao.casa.complemento}" disabled>
                            </div>
                        </form>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
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
