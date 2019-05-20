package cn.licoy.wdog.core.mongodb;



import cn.licoy.wdog.core.service.system.SysUserService;
import com.mongodb.*;
import com.mongodb.util.JSON;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MongoTestC {

    @Autowired
    private MongoTestDao mtdao;
    @Autowired
    private SysUserService userService;

    String data = "{" +
            "'name' : 'chiu'," +
            "'phone': '13704535628'" +
            "}";


    @PostMapping(value="/add/{actiId}")
    public void saveTest() throws Exception {
//        String data = "";
        String actiId = "124458890878654";
        String id = "0000000000000";
        Mongo mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("SCAM");
        DBCollection collection = db.getCollection(actiId);

        DBObject bson = (DBObject)JSON.parse(data);

        System.out.println(bson.toString());
        bson.put("_id","0000000000000");
        bson.put("uid",userService.getCurrentUser().getId());
        bson.put("acitId",actiId);
        System.out.println(bson.toString());
        collection.insert(bson);
        mongo.close();

    }

    @GetMapping(value="/select/actiId")
    public String findTestByName(){

        String actiId = "124458890878654";

        Mongo mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("SCAM");
        DBCollection collection = db.getCollection(actiId);

        //DBCursor结果集
        DBCursor cursor = collection.find();

//        StringBuffer buffer = new StringBuffer();
        while(cursor.hasNext()){
            DBObject o = cursor.next();
            System.out.println(o.toString());
        }
        mongo.close();

//        String result =
        return null;
    }

    @GetMapping(value="/update")
    public void updateTest(){
        //建立连接
        Mongo mongo = new Mongo("localhost",27017);

        //获取指定的数据库
        DB db = mongo.getDB("SCAM");

        //获取指定的集合
        DBCollection dbCollection = db.getCollection("person");

        BasicDBObject query = new BasicDBObject("_id",new ObjectId("0000000000000"));
        BasicDBObject object = (BasicDBObject)dbCollection.findOne(query);
        object.put("name", "king");
        int i = dbCollection.update(query, object).getN();
        System.out.println(i);
        mongo.close();


    }

    @GetMapping(value="/delete/{id}")
    public void delete(){
        String id = "0000000000000";
        //建立连接
        Mongo mongo = new Mongo("localhost",27017);

        //获取指定的数据库
        DB db = mongo.getDB("SCAM");

        //获取指定的集合
        DBCollection dbCollection = db.getCollection("person");

        DBObject dbObject = new BasicDBObject();
        dbCollection.remove(dbObject);
        mongo.close();

    }
}