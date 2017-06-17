function ArCondicionado(id){
    var versao_driver = 1.0;
    var estado_dispositivo = true;
    this.getVersao = getVersao;
    this.getEstado = getEstado;
    this.setVersao = setVersao;
    this.setEstado = setEstado;
    
    function getVersao(){
        return versao_driver;
    }
    
    function getEstado(){
        //FEITA A COMUNICAÇÃO COM O DISPOSITIVO QUE SERÁ TIPO UM SERVIDOR
        return estado_dispositivo;
    }
    
    function setVersao(_versao){
        versao_driver = _versao;
    }
    
    function setEstado(_estado){
        estado_dispositivo = _estado;
    }
}

function iniciar(dispositivo){
    var arcondicionado = new ArCondicionado(dispositivo);
    console.log('Carregando estado e informações do dispositivo '+dispositivo);
    $('#estadoDispositivo').prop('checked', arcondicionado.getEstado()).change();
}