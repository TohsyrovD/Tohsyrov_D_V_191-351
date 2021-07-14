//#include"Modelsql.h"
//#include "httpcontroller.h"
//#include <QNetworkRequest>
//#include <QNetworkReply>
//#include <QEventLoop>
//#include <QDebug>
//#include <QBitArray>
//#include <QTextDocument>
//#include <QJsonDocument>
//#include <QJsonArray>
//#include <QtSql/QSqlDatabase>
//#include <QtSql/QSqlQuery>
//#include <QtSql/QSqlTableModel>

//HttpController::HttpController(QObject *parent) : QObject(parent)
//{
//    nam = new QNetworkAccessManager;
//}

//QByteArray HttpController::SlotGetHttps(QString url) {
//    QNetworkRequest requerst;
//    requerst.setUrl(QUrl(url));
//    QNetworkReply * reply;
//    QEventLoop evtLoop;
//    connect(nam, // связываем loop  с нашим менеджером
//            &QNetworkAccessManager::finished,
//            &evtLoop, &QEventLoop::quit);

//    reply = nam->get(requerst);
//    evtLoop.exec();

//    QByteArray replyString  = reply->readAll();
//    return replyString;
//}

//void HttpController::GetNetworkValue()
//{
//    QNetworkRequest request;
//    request.setUrl(QUrl("https://ru.investing.com/currencies/usd-rub"));
//    QNetworkReply * reply;
//    QEventLoop evtloop;
//    connect(nam, &QNetworkAccessManager::finished,
//            &evtloop, &QEventLoop::quit);
//    if(connect(nam, &QNetworkAccessManager::finished,
//               &evtloop, &QEventLoop::quit))
//    {qDebug() << "QNetworkAccessManager::finished success";}

//    reply=nam->get(request);
//    evtloop.exec(); //запуск цикла ожидания идет обработка остальных запросов
//    QString replystr = reply->readAll();
//    QString tmp = replystr.left(1000);

//    int j;
//    QString usdnumber;
//    j=replystr.indexOf("id=\"last_last\"");
//    j+=24;
//    for (int i = 0; i < 30; i++){
//        if ((replystr[j+i]<="9" && replystr[j+i]>="0") || (replystr[j+i] == ",")){
//            usdnumber[i] = replystr[j+i];
//        }
//    }
//    emit signalSendToQML(QString(tmp),usdnumber);

//}


//void HttpController::restRequest(){

//    double less_users = 0;
//    double between=0;
//    double more_users = 0;

//    QByteArray replyString = SlotGetHttps("https://api.vk.com/method/groups.get?v=5.110&extended=1&fields=members_count,description&access_token=" + token);

//    QJsonDocument jsonDoc = QJsonDocument::fromJson(replyString);


//    qDebug() << jsonDoc;


//    QJsonObject rootObject = jsonDoc.object();

//    if (rootObject.contains("response") && rootObject["response"].isObject())
//    {

//        QJsonValue responseValue = rootObject.value("response");
//        QJsonObject responseObj = responseValue.toObject();

//        if (responseObj.contains("count") && responseObj["count"].isDouble()) {

//            QJsonValue count = responseObj.value("count");
//            qDebug() << " COUNT " << count.toDouble();

//        }

//        if (responseObj.contains("items") && responseObj["items"].isArray()) {
//            QJsonValue items = responseObj.value("items");

//            QJsonArray itemsArray = items.toArray();

//            for (const QJsonValue & item: itemsArray) {
//                QJsonObject itemObj = item.toObject();
//            }

//               for (const QJsonValue & item: itemsArray) {
//                QString name;
//                QString description;
//                int is_closed = 0;
//                QString type;
//                QString photo;
//                int id = 0;
//                QString screen_name;
//                int members_count = 0;

//                QJsonObject itemObj = item.toObject();


//                if (itemObj.contains("name") && itemObj["name"].isString()) {

//                    QJsonValue nameVal = itemObj.value("name");

//                    name = nameVal.toString();

//                }

//                if (itemObj.contains("description") && itemObj["description"].isString()) {

//                    QJsonValue descriptionVal = itemObj.value("description");

//                    description = descriptionVal.toString();
//                }
//                qDebug()<<"description:"<<description;

//                if (itemObj.contains("is_closed") && itemObj["is_closed"].isDouble()) {

//                    QJsonValue is_closedVal = itemObj.value("is_closed");

//                    qDebug() << itemObj.value("is_closed").toInt();

//                    is_closed = is_closedVal.toInt();

//                }


//                if (itemObj.contains("type") && itemObj["type"].isString()) {

//                    QJsonValue typeVal = itemObj.value("type");

//                    type = typeVal.toString();
//                }
//                if (itemObj.contains("photo_100") && itemObj["photo_100"].isString()) {
//                    QJsonValue photoVal = itemObj.value("photo_100");
//                    photo = photoVal.toString();

//                }
//                qDebug()<<"photo_100:"<<photo;


//                if (itemObj.contains("id") && itemObj["id"].isDouble()) {

//                    QJsonValue idVal = itemObj.value("id");

//                    qDebug() << itemObj.value("id").toInt();

//                    id = idVal.toInt();

//                }
//                qDebug()<<"id:"<<id;


//                if (itemObj.contains("screen_name") && itemObj["screen_name"].isString()) {
//                    QJsonValue screen_nameVal = itemObj.value("screen_name");
//                    screen_name = screen_nameVal.toString();

//                }
//                qDebug()<<"screen_name:"<<screen_name;

//                if (itemObj.contains("members_count") && itemObj["members_count"].isDouble()) {

//                    QJsonValue members_countVal = itemObj.value("members_count");
//                    if ((members_countVal.toDouble() <= 100000)) {
//                        less_users += 1;
//                    }
//                    if ((members_countVal.toDouble() > 100000) &(members_countVal.toDouble() <= 1000000)) {
//                        between += 1;
//                    }
//                    if ((members_countVal.toDouble() > 1000000)) {
//                        more_users += 1;
//                    }

//                    qDebug() << itemObj.value("members_count").toInt();

//                    members_count = members_countVal.toInt();

//                }


//                GroupModel.addItem(GroupObject(name,
//                                               description,
//                                               is_closed,
//                                               type,
//                                               photo,
//                                               id,
//                                               screen_name,
//                                               members_count));
//            }
//            emit signalStatisticToQML(less_users,more_users,between);
//        }

//    }

//}
//void HttpController::writeDB() {
//    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
//    db.setHostName("groups");
//    db.setDatabaseName("C:/Users/egork/Desktop/groups.db");
//    db.open();
//    QSqlQuery query;
//    query.exec("DROP TABLE groups");
//    query.exec("CREATE TABLE groups ("
//               "id int,"
//               "name varchar(255),"
//               "screen_name varchar(255),"
//               "photo varchar(255),"
//               "type varchar(255),"
//               "is_closed int,"
//               "members_count int)");

//    for (const QJsonValue & item: itemsArray) {
//        QString name;
//        QString description;
//        int is_closed = 0;
//        QString type;
//        QString photo;
//        int id = 0;
//        int members_count = 0;
//        QString screen_name;

//        QJsonObject itemObj = item.toObject();

//        if (itemObj.contains("name") && itemObj["name"].isString()) {

//            QJsonValue nameVal = itemObj.value("name");

//            name = nameVal.toString();

//        }


//        if (itemObj.contains("description") && itemObj["description"].isString()) {

//            QJsonValue descriptionVal = itemObj.value("description");

//            description = descriptionVal.toString();
//        }
//        qDebug()<<"description:"<<description;


//        if (itemObj.contains("is_closed") && itemObj["is_closed"].isDouble()) {

//            QJsonValue is_closedVal = itemObj.value("is_closed");

//            qDebug() << itemObj.value("is_closed").toInt();

//            is_closed = is_closedVal.toInt();

//        }
//        qDebug()<<"is_closed:"<<is_closed;


//        if (itemObj.contains("type") && itemObj["type"].isString()) {

//            QJsonValue typeVal = itemObj.value("type");

//            type = typeVal.toString();
//        }
//        qDebug()<<"type:"<<type;

//        if (itemObj.contains("photo_100") && itemObj["photo_100"].isString()) {
//            QJsonValue photoVal = itemObj.value("photo_100");
//            photo = photoVal.toString();

//        }
//        qDebug()<<"photo_100:"<<photo;


//        if (itemObj.contains("id") && itemObj["id"].isDouble()) {

//            QJsonValue idVal = itemObj.value("id");

//            qDebug() << itemObj.value("id").toInt();

//            id = idVal.toInt();

//        }
//        qDebug()<<"id:"<<id;

//        if (itemObj.contains("members_count") && itemObj["members_count"].isDouble()) {
//            QJsonValue members_countVal = itemObj.value("members_count");
//            qDebug() << itemObj.value("members_count").toInt();
//            members_count = members_countVal.toInt();

//        }
//        qDebug()<<"members_count:"<<members_count;


//        if (itemObj.contains("screen_name") && itemObj["screen_name"].isString()) {
//            QJsonValue screen_nameVal = itemObj.value("screen_name");
//            screen_name = screen_nameVal.toString();

//        }
//        qDebug()<<"screen_name:"<<screen_name;


//        query.prepare("INSERT INTO groups (id, name, screen_name, photo, description, type, is_closed, members_count)"
//                      "VALUES (:id, :name, :screen_name, :photo, :description, :type, :is_closed, :members_count)");
//        query.bindValue(":id", id);
//        query.bindValue(":name", name);
//        query.bindValue(":screen_name", screen_name);
//        query.bindValue(":photo", photo);
//        query.bindValue(":description", description);
//        query.bindValue(":type", type);
//        query.bindValue(":is_closed", is_closed);
//        query.bindValue(":members_count", members_count);
//        query.exec();
//    }
//    db.close();
//    QSqlDatabase::removeDatabase("QSQLITE");
//}

//void HttpController::readDB()
//{
//    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
//    db.setHostName("groups");
//    db.setDatabaseName("C:/Users/egork/Desktop/groups.db");
//    db.open();

//    QSqlQuery query;
//    if (query.exec("SELECT * FROM groups") == true ){
//        query.exec("SELECT * FROM groups");

//        while (query.next()) {
//            QString name = query.value("name").toString();
//            QString screen_name = query.value("screen_name").toString();
//            QString description = query.value("description").toString();
//            QString photo = query.value("photo").toString();
//            QString type = query.value("type").toString();
//            int id = query.value("id").toInt();
//            int members_count = query.value("members_count").toInt();
//            int is_closed = query.value("is_closed").toInt();

//            GroupModel.addItem(GroupObject(name, description, is_closed, type, photo, id, screen_name, members_count));
//         }
//    }

//    db.close();
//}

//void HttpController::loginMe(QString login, QString password){
//    QNetworkRequest request(QUrl("https://lab8.xyz/api/auth/login"));

//    QByteArray body = "email=test@example.ru&password=test";

//    request.setRawHeader("Content-Type","application/x-www-form-urlencoded");
//    request.setRawHeader("Accept","application/json");

//    if (login == "test@example.ru" && password == "test"){
//        QEventLoop loop;

//        nam = new QNetworkAccessManager();

//        QObject::connect(nam, SIGNAL(finished(QNetworkReply*)), &loop, SLOT(quit()));

//        QNetworkReply *reply = nam->post(request, body);
//        loop.exec();
//        auto reply_body = reply->readAll();

//        QJsonDocument document = QJsonDocument::fromJson(reply_body);
//        QJsonObject root = document.object();
//        QJsonValue itog = root.value("access_token");

//        QString token = itog.toString();
//        JWT_token = token;

//        emit tokenToQml(token);
//    }

//    getProtected();
//    JWT_token = "";
//}

//void HttpController::getProtected(){
//    if (JWT_token.length() > 0){
//        QNetworkRequest request;
//        request.setUrl(QUrl("https://lab8.xyz/protected"));
//        QNetworkReply * reply;
//        QEventLoop evntLoop;
//        connect(nam, &QNetworkAccessManager::finished, &evntLoop, &QEventLoop::quit);
//        reply = nam->get(request);
//        evntLoop.exec();
//        QString replyString = reply->readAll();
//        dataToQML(replyString);
//    }
//    else{
//        QString replyString = "<h1 style = 'text-align: center'> Введите корректные данные </h1>";
//        dataToQML(replyString);
//    }
//}
