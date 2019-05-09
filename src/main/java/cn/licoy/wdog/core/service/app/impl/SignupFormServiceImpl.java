package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.core.service.app.SignupFormService;
import cn.licoy.wdog.core.service.system.SysUserService;
import com.mongodb.*;
import com.mongodb.util.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class SignupFormServiceImpl implements SignupFormService {

    @Autowired
    private SysUserService userService;

    /**
     * 添加报名数据
     * @param data
     * @param actiId
     * @param id
     */
    @Override
    public void add(String data,String actiId,String id) {
//        String data = "{" +
//                "'name' : 'chiu'," +
//                "'phone': '13704535628'" +
//                "}";
//        String actiId = "124458890878654";
//        String id = "0000000000000";
        Mongo mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("SCAM");
        DBCollection collection = db.getCollection(actiId);

        DBObject bson = (DBObject)JSON.parse(data);

        System.out.println(bson.toString());
        bson.put("_id",id);
        bson.put("uid",userService.getCurrentUser().getId());
        bson.put("actiId",actiId);
        System.out.println(bson.toString());
        collection.insert(bson);
        mongo.close();

    }

    /**
     * 活动报名数据列表
     * @param actiId
     * @return
     */
    @Override
    public List<String> list(String actiId){

        Mongo mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("SCAM");
        DBCollection collection = db.getCollection(actiId);
        List<String> result = new ArrayList<>();
        //DBCursor结果集
        DBCursor cursor = collection.find();

        if (cursor == null){
            return result;
        }
        while(cursor.hasNext()){
            DBObject object = cursor.next();
            result.add(object.toString());
        }
        System.out.println("====>> " + result);
        mongo.close();
        return result;
    }

    /**
     * 查询单条记录
     * @param actiId
     * @param id
     * @return
     */
    @Override
    public String selectOne(String actiId,String id){
        //建立连接
        Mongo mongo = new Mongo("localhost",27017);
        //获取指定的数据库
        DB db = mongo.getDB("SCAM");
        //获取指定的集合
        DBCollection dbCollection = db.getCollection(actiId);

        BasicDBObject query = new BasicDBObject("_id",id);
        BasicDBObject object = (BasicDBObject)dbCollection.findOne(query);

        if (object == null){
            return null;
        }
        return object.toString();
    }

    /**
     * 更新记录
     * @param actiId
     * @param updateData
     */
    @Override
    public void updateById(String actiId,String updateData){

        //建立连接
        Mongo mongo = new Mongo("localhost",27017);
        //获取指定的数据库
        DB db = mongo.getDB("SCAM");
        //获取指定的集合
        DBCollection dbCollection = db.getCollection(actiId);

        BasicDBObject udata = (BasicDBObject)JSON.parse(updateData);
        BasicDBObject query = new BasicDBObject("_id",udata.get("_id"));
        System.out.println("query====>>" + query.toString());
//        BasicDBObject object = (BasicDBObject)dbCollection.findOne(query);
//        if(object != null){
//            System.out.println("object====>>" + object.toString());
//            object.replace("name","cing");
//            object.replace("phone","13794539410");
//        }

        dbCollection.update(query, udata);
        mongo.close();


    }

    /**
     * 清空集合
     */
    @Override
    public void deleteAll(String actiId){
        //建立连接
        Mongo mongo = new Mongo("localhost",27017);
        //获取指定的数据库
        DB db = mongo.getDB("SCAM");
        //获取指定的集合
        DBCollection dbCollection = db.getCollection(actiId);

        DBObject dbObject = new BasicDBObject();
        dbCollection.remove(dbObject);
        mongo.close();

    }

    /**
     * 删除单条记录
     * @param actiId
     * @param id
     */
    @Override
    public void deleteOne(String actiId, String id){

        //建立连接
        Mongo mongo = new Mongo("localhost",27017);
        //获取指定的数据库
        DB db = mongo.getDB("SCAM");
        //获取指定的集合
        DBCollection dbCollection = db.getCollection(actiId);

        BasicDBObject query = new BasicDBObject("_id",id);
        BasicDBObject object = (BasicDBObject)dbCollection.findOne(query);

        dbCollection.remove(object);
        mongo.close();

    }

}