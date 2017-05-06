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
                    <form style="margin-bottom: 20px;" method="GET" action="controller">
                        <input type="hidden"
                                name="nomePageHandle"
                                value="com.juliano.automacaoresidencial.PageHandlers.IndexHandle" />
                        <div class="form-group">
                            <label for="nomeCasa" style="font-size: 2.3em">Minha Casa</label>
                            <input type="text" class="form-control" id="nomeCasa">
                        </div>
                        <div class="row" style="margin: 0">
                            <button class="btn btn-default col-md-4 .col-xs-6" type="submit" value="EditarCasa" name="botaoSubmit" style="float: left"><span class="glyphicon glyphicon-edit"></span>  Editar</button>
                            <div class="btn btn-default col-md-4 .col-xs-6" onclick="test()" value="DetalhesCasa" style="float: right"><span class="glyphicon glyphicon-list-alt "></span>  Detalhes</div>
                        </div>
                        <br>
                        <div class="form-group">
                            <jsp:useBean id="dao" class="com.juliano.automacaoresidencial.DAO.Teste"/>
                            
                            <label for="ambienteCasa" style="font-size: 2.3em">Ambiente</label>
                            <select class="form-control" id="ambienteCasa">
                                <c:forEach var="test" items="${dao.list}">
                                    <option>${test}</option>
                                </c:forEach>
                                <option>Selecione o Ambiente</option>
                                <option>Sala</option>
                                <option>Quarto</option>
                                <option>Banheiro</option>
                                <option>Cozinha</option>
                            </select>
                        </div>
                        <div class="row" style="margin: 0">
                            <button class="btn btn-default col-md-4 .col-xs-6" style="float: left"><span class="glyphicon glyphicon-plus"></span>  Adicionar Ambiente</button>
                            <button type="submit" class="btn btn-default col-md-4 .col-xs-6" style="float: right"><span class="glyphicon glyphicon-list-alt"></span>  Detalhes</button>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="dispositivoAmbiente" style="font-size: 2.3em">Dispositivos</label>
                            <select class="form-control" id="dispositivoAmbiente">
                                <option>Selecione o Dispositivo</option>
                                <option>Lâmpada</option>
                                <option>Ventilador</option>
                                <option>Ar Condicionado</option>
                                <option>Televisão</option>
                            </select>
                        </div>
                        <div class="row" style="margin: 0">
                            <button class="btn btn-default col-md-4 .col-xs-6" style="float: left"><span class="glyphicon glyphicon-plus"></span>  Adicionar Dispositivo</button>
                            <button type="submit" class="btn btn-default col-md-4 .col-xs-6" style="float: right"><span class="glyphicon glyphicon-list-alt"></span>  Detalhes</button>
                        </div>
                    </form>
                    
                </div>
            </div>
        </div>        
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="js/functions.js"></script>
    </body>
</html>
