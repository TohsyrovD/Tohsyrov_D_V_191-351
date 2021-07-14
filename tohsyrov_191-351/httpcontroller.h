//#ifndef QHTTPCONTROLLER_H
//#define QHTTPCONTROLLER_H

//#include <QObject>
//#include <QNetworkAccessManager>
//#include <QJsonObject>
//#include "Modelsql.h"
//#include <QJsonArray>

//class HttpController : public QObject
//{
//    Q_OBJECT
//public:
//    QString JWT_token;
//    QString token;
//    model GroupModel;
//    explicit HttpController(QObject *parent = nullptr);
//    QNetworkAccessManager * nam;//класс http клиента - ответственен за открытие сокета/настройка сокета(  в общем настройка сокета)
//    //работа с зпголовками ( с первой стартовой строкой) на ожидание по таймауту
//private:
//    double less_users;
//    double more_users;
//    double between;
//    QJsonArray itemsArray;

//public slots:
//    void GetNetworkValue();
//    void writeDB();
//    void readDB();
//    QByteArray SlotGetHttps(QString url);
//    void restRequest();
//    QString getSomeValueFromCPP(QString index) {
//        if (index.contains("https://oauth.vk.com/blank.html", Qt::CaseInsensitive) == false) {
//            return "";
//        }

//        else {
//            int st = index.indexOf("access_token") + sizeof("access_token");
//            int end = index.indexOf("&expires_in=");

//            int size = end - st;
//            index = index.mid(st, size);
//            token = index;
//            emit toQML3(token);
//            qDebug() << index;
//            restRequest();
//            return index;
//        }
//    }

//    void loginMe(QString login, QString password);
//    void getProtected();

//signals:
//    void signalSendToQML(QString reply, QString number);
//    void toQML3(QString str2);
//    void signalStatisticToQML(double less_users,double between, double more_users);
//    void signalLab6();

//    void sendToQml(QUrl url);
//    void tokenToQml(QString token);
//    void dataToQML(QString pageContent);
//};


//#endif // QHTTPCONTROLLER_H
