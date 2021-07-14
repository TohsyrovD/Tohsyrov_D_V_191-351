#include <webappcontroller.h>
#include <QNetworkReply>
#include <QDebug>

WebAppController::WebAppController(QObject *parent) : QObject(parent) {
    connect(&manager, &QNetworkAccessManager::finished, this, &WebAppController::onPageInfo);
}

void WebAppController::getPageInfo() {
    qDebug() << "getPageInfo";
    manager.get(QNetworkRequest(QUrl("http://cbr.ru/currency_base/daily/")));
}

void WebAppController::onPageInfo(QNetworkReply* reply) {
    reply->deleteLater();
    QString html = reply->readAll();
        qDebug() << html;
        emit mysignal(html);
    }

