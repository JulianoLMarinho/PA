package com.juliano.automacaoresidencial.Core;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class IniciadorDeSessao implements HttpSessionListener {
    
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        se.getSession().setAttribute("disableAmbDet", "disabled");
        se.getSession().setAttribute("disableDispDet", "disabled");
        se.getSession().setAttribute("disableDisp", "disabled");
        se.getSession().setAttribute("selecAmb", "Selecione o Ambiente");
        se.getSession().setAttribute("selecDisp", "Selecione o Dispositivo");
        se.getSession().setAttribute("idSelecAmb", "0");
        se.getSession().setAttribute("selecIdDisp", 0);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        se.getSession().invalidate();
    }
}
