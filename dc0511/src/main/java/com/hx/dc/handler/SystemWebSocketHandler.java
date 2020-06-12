package com.hx.dc.handler;


import org.springframework.web.socket.*;

import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

public class SystemWebSocketHandler implements WebSocketHandler {
    public SystemWebSocketHandler(){}

    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象，可以用来替换ArrayList
     private static CopyOnWriteArraySet<WebSocketSession> users=new CopyOnWriteArraySet<WebSocketSession>();
    //private static final ArrayList<WebSocketSession> users = new ArrayList<WebSocketSession>();//Vector

    //ConcurrentHashMap线程安全的map,实现服务端与单一客户端通信，其中Key为用户标识,可以替换下边的Hashtable
     private static ConcurrentHashMap<String,WebSocketSession> webSoketMap=new ConcurrentHashMap<String, WebSocketSession>();
    // private  static  final Hashtable<String,WebSocketSession> table=new Hashtable<String, WebSocketSession>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        System.out.println("......连接之后After......"+"ConnectionEstablished");
        System.out.println("getId:" + session.getId());
        System.out.println("getLocalAddress:" + session.getLocalAddress().toString());
        System.out.println("getUri:" + session.getUri().toString());
        System.out.println("getPrincipal:" + session.getPrincipal());
        //连接进来的用户添加到用户集合中方便以后发送消息
        String url=session.getUri().toString();//host+ "/websocket.mvc?id=a001
        //String id[] = url.split("=");
        //users.add(session);
        // map.put(id[1],session);
        //table.put(id[1], session);
        users.add(session);
       // webSoketMap.put("a001",session);

        session.sendMessage(new TextMessage("你好:  webSocket connect 成功！！！"));
    }

    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        System.out.println("发送信息" + message.toString()+" .session. "+session.getId());
        //session.sendMessage(new TextMessage(message.getPayload()+"---"));
        //sendMessageToUsers(session,new TextMessage(message.getPayload()+"---"));
        //sendMessageToUserese(new TextMessage(message.getPayload()+"---"));
        session.sendMessage(message);

    }
    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        if(session.isOpen()){
            users.remove(session);
            session.close();
        }

        //移除session
       /* for(Map.Entry<String, WebSocketSession> entry: table.entrySet()){
        	System.out.println("key---------"+entry.getKey());
        	System.out.println("value--------"+entry.getValue());
        	if(entry.getValue()==session){
        		table.remove(entry.getKey());
        		break;
        	}
        }*/

        System.out.println("异常出现handleTransportError" + exception.getMessage());
    }
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
        users.remove(session);
        //移除session
        /*for(Map.Entry<String, WebSocketSession> entry: table.entrySet()){
        	if(entry.getValue()==session){
        		table.remove(entry.getKey());
        		break;
        	}
        }
*/        System.out.println("关闭afterConnectionClosed" + closeStatus.getReason());
    }
    @Override
    public boolean supportsPartialMessages() {
        return false;
    }


    //给所有在线用户发消息
    public static void sendMessageToUserese(String message){
        WebSocketMessage<String> message2 = new TextMessage(message);
        //
        //webSoketMap.get("fdsfdsa");
        for (WebSocketSession user : users) {
            try {
                if (user.isOpen()) {
                    user.sendMessage(message2);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


   /* public static void sendMessageToUserese(TextMessage message) {
        //for (WebSocketSession user : map.values()) {
    	for (WebSocketSession user : table.values()) {
            try {
                if (user.isOpen()) {
                    user.sendMessage(message);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    */

    //给指定用户发消息
    /*public static void sendMessageTo(String id,TextMessage message) {
    	 for(Map.Entry<String, WebSocketSession> entry: table.entrySet()){
         	System.out.println("key---------"+entry.getKey());
         	System.out.println("value--------"+entry.getValue());
         	 try {
         		 if(entry.getKey().equals(id)){
         			 WebSocketSession session = entry.getValue();
         			 if(session.isOpen()){
         				 session.sendMessage(message);
         			 }
 					break;
 				}
 			} catch (IOException e) {
 				// TODO Auto-generated catch block
 				e.printStackTrace();
 			}

         }
        }*/

  /*  public static Hashtable<String,WebSocketSession> getWebSocketSessionMap(){
        return  table;
  }*/
}
