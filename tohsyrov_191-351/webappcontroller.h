#ifndef WEBAPPCONTROLLER_H
#define WEBAPPCONTROLLER_H

#include <QObject>
#include <QNetworkAccessManager>

class WebAppController : public QObject {
    Q_OBJECT
    QNetworkAccessManager manager;
public:
    explicit WebAppController(QObject *parent = nullptr);
public slots:
    void getPageInfo();
    void onPageInfo(QNetworkReply* reply);
signals:
    void mysignal(QString data);
};


#endif // WEBAPPCONTROLLER_H
