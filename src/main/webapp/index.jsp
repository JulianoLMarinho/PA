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
                            <button class="btn btn-default col-md-6 col-xs-6" type="submit" value="EditarCasa" name="botaoSubmit" style="float: left"><span class="glyphicon glyphicon-edit"></span>  Editar</button>
                            <div class="btn btn-default col-md-6 .col-xs-6" value="DetalhesCasa" data-toggle="modal" data-target="#myModal" style="float: right"><span class="glyphicon glyphicon-list-alt "></span>  Detalhes</div>
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
                            <button class="btn btn-default col-md-4 .col-xs-4" style="float: left"><span class="glyphicon glyphicon-plus"></span>  Adicionar Ambiente</button>
                            <div class="btn btn-default col-md-6 .col-xs-6" value="DetalhesAmbiente" data-toggle="modal" data-target="#myModalk" style="float: right" ${sessionScope.disableAmbDet}><span class="glyphicon glyphicon-list-alt "></span>  Detalhes</div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="dispositivoAmbiente" style="font-size: 2.3em">Dispositivos</label>
                            <select class="form-control" id="dispositivoAmbiente" ${sessionScope.disableDesp}>
                                <option>Selecione o Dispositivo</option>
                                <option>Lâmpada</option>
                                <option>Ventilador</option>
                                <option>Ar Condicionado</option>
                                <option>Televisão</option>
                            </select>
                        </div>
                        <div class="row" style="margin: 0">
                            <button class="btn btn-default col-md-4 .col-xs-6" style="float: left" ${sessionScope.disableDesp}><span class="glyphicon glyphicon-plus"></span>  Adicionar Dispositivo</button>
                            <button type="submit" class="btn btn-default col-md-4 .col-xs-6" style="float: right" disabled><span class="glyphicon glyphicon-list-alt"></span>  Detalhes</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>  
        <!-- Modal -->
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header" style="text-align: center">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">${casaDao.casa.nome}</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="rua">Rua:</label>
                                <div class="col-sm-4">
                                    <p class="form-control-static">${casaDao.casa.rua}</p>
                                </div>     


                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="numero">Número:</label>
                                <div class="col-sm-10">
                                    <p class="form-control-static">${casaDao.casa.numero}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="complemento">Complemento:</label>
                                <div class="col-sm-10">
                                    <p class="form-control-static">${casaDao.casa.complemento}</p>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>

        <!-- Modal para Adicionar Ambiente-->
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header" style="text-align: center">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">${casaDao.casa.nome}</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="rua">Rua:</label>
                                <div class="col-sm-4">
                                    <p class="form-control-static">${casaDao.casa.rua}</p>
                                </div>     


                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="numero">Número:</label>
                                <div class="col-sm-10">
                                    <p class="form-control-static">${casaDao.casa.numero}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="complemento">Complemento:</label>
                                <div class="col-sm-10">
                                    <p class="form-control-static">${casaDao.casa.complemento}</p>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="js/functions.js"></script>
    </body>
</html>
