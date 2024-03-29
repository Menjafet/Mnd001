/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.tablasEntity;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Fabian
 */
@Stateless
public class TbArticuloFacade extends AbstractFacade<TbArticulo> {

    @PersistenceContext(unitName = "proyectoPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TbArticuloFacade() {
        super(TbArticulo.class);
    }
    
}
