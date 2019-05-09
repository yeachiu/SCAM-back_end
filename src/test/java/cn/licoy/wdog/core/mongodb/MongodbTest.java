package cn.licoy.wdog.core.mongodb;

 import cn.licoy.wdog.core.service.system.SysUserService;
 import com.mongodb.*;
 import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
 import com.mongodb.util.JSON;
 import org.bson.types.ObjectId;
 import org.junit.Test;
import org.junit.runner.RunWith;
 import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
 import org.springframework.web.bind.annotation.GetMapping;
 import org.springframework.web.bind.annotation.PostMapping;

 import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MongodbTest {


    @Autowired
    private SysUserService userService;



    @Test
//    @PostMapping(value="/add/{actiId}")
    public void saveTest() throws Exception {
        String data = "{" +
                "'name' : 'chiu'," +
                "'phone': '13704535628'" +
                "}";
        String actiId = "124458890878654";
        String id = "0000000000000";
        Mongo mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("SCAM");
        DBCollection collection = db.getCollection(actiId);

        DBObject bson = (DBObject)JSON.parse(data);

        System.out.println(bson.toString());
        bson.put("_id","0000000000000");
        bson.put("uid","999999");
        bson.put("acitId",actiId);
        System.out.println(bson.toString());
        collection.insert(bson);
        mongo.close();

    }

    @Test
//    @GetMapping(value="/select/actiId")
    public void findTestByName(){
        String resp = "";
        String actiId = "124458890878654";

        Mongo mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("SCAM");
        DBCollection collection = db.getCollection(actiId);

        //DBCursor结果集
        DBCursor cursor = collection.find();

//        StringBuffer buffer = new StringBuffer();
        while(cursor.hasNext()){
            DBObject result = cursor.next();
            resp = result.toString();
        }
        System.out.println("====>> " + resp);
        mongo.close();
    }

    @Test
//    @GetMapping(value="/update")
    public void updateTest(){

        String actiId = "124458890878654";

        //建立连接
        Mongo mongo = new Mongo("localhost",27017);

        //获取指定的数据库
        DB db = mongo.getDB("SCAM");

        //获取指定的集合
        DBCollection dbCollection = db.getCollection(actiId);

        BasicDBObject query = new BasicDBObject("_id","0000000000000");
        System.out.println("query====>>" + query.toString());
        BasicDBObject object = (BasicDBObject)dbCollection.findOne(query);
        System.out.println("object====>>" + object.toString());
        if(object != null){
            object.replace("name","cing");
            object.replace("phone","13794539410");
        }

//        object.put("name", "king");
        WriteResult write = dbCollection.update(query, object);
        System.out.println(write.toString());
        mongo.close();


    }

    /**
     * 清空集合
     */
    @Test
//    @GetMapping(value="/delete/{id}")
    public void deleteAll(){
//        String id = "0000000000000";
        String actiId = "124458890878654";
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

    @Test
    public void deleteOne(){
        String id = "0000000000000";
        String actiId = "124458890878654";
        //建立连接
        Mongo mongo = new Mongo("localhost",27017);

        //获取指定的数据库
        DB db = mongo.getDB("SCAM");

        //获取指定的集合
        DBCollection dbCollection = db.getCollection(actiId);

        BasicDBObject query = new BasicDBObject("_id",new ObjectId(id));
        BasicDBObject object = (BasicDBObject)dbCollection.findOne(query);

        dbCollection.remove(object);
        mongo.close();

    }
}