package com.music.dao.impl;

import com.music.dao.BaseDAO;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

@Repository("baseDAO")
@SuppressWarnings("all")
public class BaseDAOImpl<T> implements BaseDAO<T> {

    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public Serializable save(T entity) {
        return this.getCurrentSession().save(entity);
    }

    @Override
    public void delete(T entity) {
        this.getCurrentSession().delete(entity);
    }

    @Override
    public void update(T entity) {
        this.getCurrentSession().update(entity);
    }

    @Override
    public void saveOrUpdate(T entity) {
        this.getCurrentSession().saveOrUpdate(entity);
    }

    @Override
    public List<T> find(String hql) {
        return this.getCurrentSession().createQuery(hql).list();
    }

    @Override
    public List<T> find(String hql, Object[] param) {

        Query q = this.getCurrentSession().createQuery(hql);
        if (param != null && param.length > 0) {
            for (int i = 0; i < param.length; i++) {
                q.setParameter(i, param[i]);
            }
        }
        return q.list();
    }

    @Override
    public List<T> find(String hql, List<Object> param) {

        Query q = this.getCurrentSession().createQuery(hql);
        if (param != null && param.size() > 0) {
            for (int i = 0; i < param.size(); i++) {
                q.setParameter(i, param.get(i));
            }
        }
        return q.list();
    }

    @Override
    public List<T> find(String hql, Object[] param, Integer page, Integer rows) {

        if (page == null || page < 1) {
            page = 1;
        }
        if (rows == null || rows < 1) {
            rows = 10;
        }

        Query q = this.getCurrentSession().createQuery(hql);
        if (param != null && param.length > 0) {
            for (int i = 0; i < param.length; i++) {
                q.setParameter(i, param[i]);
            }
        }
        return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
    }

    @Override
    public List<T> find(String hql, List<Object> param, Integer page, Integer rows) {

        if (page == null || page < 1) {
            page = 1;
        }
        if (rows == null || rows < 1) {
            rows = 10;
        }

        Query q = this.getCurrentSession().createQuery(hql);
        if (param != null && param.size() > 0) {
            for (int i = 0; i < param.size(); i++) {
                q.setParameter(i, param.get(i));
            }
        }
        return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
    }

    @Override
    public T get(Class<T> c, Serializable id) {
        return (T) this.getCurrentSession().get(c, id);
    }

    @Override
    public T get(String hql, Object[] param) {

        List<T> l = this.find(hql, param);
        if (l != null && l.size() > 0) {
            return l.get(0);
        } else {
            return null;
        }
    }

    public T get(String hql, List<Object> param) {

        List<T> l = this.find(hql, param);
        if (l != null && l.size() > 0) {
            return l.get(0);
        } else {
            return null;
        }
    }

    @Override
    public Long count(String hql) {
        return (Long) this.getCurrentSession().createQuery(hql).uniqueResult();
    }

    @Override
    public Long count(String hql, Object[] param) {

        Query q = this.getCurrentSession().createQuery(hql);
        if (param != null && param.length > 0) {
            for (int i = 0; i < param.length; i++) {
                q.setParameter(i, param[i]);
            }
        }
        return (Long) q.uniqueResult();
    }

    @Override
    public Long count(String hql, List<Object> param) {

        Query q = this.getCurrentSession().createQuery(hql);
        if (param != null && param.size() > 0) {
            for (int i = 0; i < param.size(); i++) {
                q.setParameter(i, param.get(i));
            }
        }
        return (Long) q.uniqueResult();
    }

    @Override
    public Integer executeHql(String hql) {
        return this.getCurrentSession().createQuery(hql).executeUpdate();
    }

    @Override
    public Integer executeHql(String hql, Object[] param) {

        Query q = this.getCurrentSession().createQuery(hql);
        if (param != null && param.length > 0) {
            for (int i = 0; i < param.length; i++) {
                q.setParameter(i, param[i]);
            }
        }
        return q.executeUpdate();
    }

    @Override
    public Integer executeHql(String hql, List<Object> param) {

        Query q = this.getCurrentSession().createQuery(hql);
        if (param != null && param.size() > 0) {
            for (int i = 0; i < param.size(); i++) {
                q.setParameter(i, param.get(i));
            }
        }
        return q.executeUpdate();
    }

    @Override
    public T getByTitle(String title) {
        /*String hql = "from Thing as thing where thing.title=?";
        Query query = this.getCurrentSession().createQuery(hql).setString(0, title);*/
        String hql = "from Thing as thing where thing.title=:title";
        Query query = this.getCurrentSession().createQuery(hql).setParameter("title", title);
        return (T) query.uniqueResult();
    }
}
