package com.shopfinity.dao;

public class ProductDAOFactory {
    private static ProductDAOFactory instance;
    private final CreateProductDAO createDAO;
    private final ReadProductDAO readDAO;
    private final UpdateProductDAO updateDAO;
    private final DeleteProductDAO deleteDAO;
    
    private ProductDAOFactory() {
        createDAO = new CreateProductDAO();
        readDAO = new ReadProductDAO();
        updateDAO = new UpdateProductDAO();
        deleteDAO = new DeleteProductDAO();
    }
    
    public static synchronized ProductDAOFactory getInstance() {
        if (instance == null) {
            instance = new ProductDAOFactory();
        }
        return instance;
    }
    
    public CreateProductDAO getCreateDAO() {
        return createDAO;
    }
    
    public ReadProductDAO getReadDAO() {
        return readDAO;
    }
    
    public UpdateProductDAO getUpdateDAO() {
        return updateDAO;
    }
    
    public DeleteProductDAO getDeleteDAO() {
        return deleteDAO;
    }
} 