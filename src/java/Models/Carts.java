/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tanng
 */
public class Carts {
    private List<Item> items;

    public Carts() {
        items=new ArrayList<>();
    }
    
    public Carts(List<Item> items){
        this.items=items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
    
    
    
    public Item getItemById(int id){
        for(Item i:items){
            if(i.getProduct().getProductID()==id){
                return i;
            }
        }
        return null;
    }
    
    public int getQuantityById(int id){
        return getItemById(id).getQuantity();
    }
    
    public void addItem(Item t){
        if(getItemById(t.getProduct().getProductID())!=null){
            Item i=getItemById(t.getProduct().getProductID());
            i.setQuantity(i.getQuantity()+t.getQuantity());
        }else{
            items.add(t);
        }
    }
    
    public void removeItem(int id){
        if(getItemById(id)!=null){
            items.remove(getItemById(id));
        }
    }
    
    public float totalMoney(){
        float t=0;
        for(Item i:items){
            t=t+i.getQuantity()*i.getPrice();
        }
        return t;
    }
    
}
