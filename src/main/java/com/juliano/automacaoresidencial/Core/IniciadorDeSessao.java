package com.juliano.automacaoresidencial.Core;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class IniciadorDeSessao implements HttpSessionListener {
    
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        se.getSession().setAttribute("disableAmbDet", "disabled");
        se.getSession().setAttribute("disableDispDet", "disabled");
        se.getSession().setAttribute("disableDesp", "disabled");
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {

    }
}
