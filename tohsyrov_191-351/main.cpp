#include <QApplication>
#include <QQmlApplicationEngine>
#include <QMediaPlayer>
#include <QProgressBar>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QQmlComponent>
#include "webappcontroller.h"
#include <QDebug>
#include <QtWebView>
#include "cryptocontroller.h"
#include <QQmlContext>
#include "httpcontroller.h"
#include <QQmlContext>

#if defined(__ANDROID__)
#include <QAndroidJniObject>
#include <QAndroidJniEnvironment>
#include <QtAndroid>
#endif  // defined(__ANDROID__)

#include "firebase/analytics.h"
#include "firebase/analytics/event_names.h"
#include "firebase/analytics/parameter_names.h"
#include "firebase/analytics/user_property_names.h"
#include <firebase/app.h>


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QApplication app(argc, argv);                                            // базовый объект, представляющий процесс в ОС, имеющий ПГШ


//    HttpController httpcontroller;
//       model GroupModel;
//       cryptoController cryptoMain;
//       httpcontroller.GetNetworkValue();



    QQmlApplicationEngine engine;


//    QQmlContext *context = engine.rootContext();
//        context->setContextProperty("httpcontroller", &httpcontroller); // поместить с++ объект в область видимости движка qml
//        context->setContextProperty("GroupModel", &httpcontroller.GroupModel);
//        context->setContextProperty("cryptoController", &cryptoMain);
//        httpcontroller.readDB();



    // создание объекта движка/интерпретатора QML
    const QUrl url(QStringLiteral("qrc:/main.qml"));                            // задание файла QML-разметки для стартовой страницы окна приложения
    qDebug() << "*** url = " << url;

    // конструкция ниже задаёт связь между событием "objectCreated" объекта "engine"
    // и коллбеком
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app,
                     [url](QObject *obj, const QUrl &objUrl)                    // коллбек, лямбда выражение, т.к. безымянная функция, объявленная по месту
                     {
                        if (!obj && url == objUrl) QCoreApplication::exit(-1);  // действия на случай ошибки внутри движка
                     }, Qt::QueuedConnection);

    engine.load(url);                                                           // загрузить файл стартовой страницы в движок
    //QQmlComponent component(&engine, url);
    //QObject *object = component.create();

    WebAppController w;
    //w.getPageInfo(engine.findChild<QObject*>("table"));
    cryptoController crp;
    QQmlContext *context = engine.rootContext();
    context->setContextProperty("cryptoController", &crp);


    QObject* rootItem = engine.rootObjects()[0];
    QObject::connect(rootItem, SIGNAL(doFetch()),
                     &w, SLOT(getPageInfo()));
    QObject::connect(&w, SIGNAL(mysignal(QString)),
                     rootItem, SIGNAL(dataReceived(QString)));



//    QObject * mw = engine.rootObjects().first();
//        QObject::connect (mw, SIGNAL(signalMakeRequest()),
//                          &httpcontroller, SLOT(GetNetworkValue()));
//        QObject::connect(engine.rootObjects().first(), SIGNAL(readDB()),
//        &httpcontroller, SLOT(readDB()));

//        QObject::connect(engine.rootObjects().first(), SIGNAL(writeDB()),
//        &httpcontroller, SLOT(writeDB()));




    firebase::App * fb_app = nullptr;
    #if defined(__ANDROID__)
    QAndroidJniEnvironment qjniEnv;
    QAndroidJniObject qactivity = QtAndroid::androidActivity();
    fb_app = firebase::App::Create(firebase::AppOptions(), qjniEnv, qactivity.object());
    #else
    fb_app = firebase::App::Create(firebase::AppOptions());
    #endif  // defined(__ANDROID__)

    // инициализация подсистемы аналитики
    firebase::analytics::Initialize(*fb_app);
    firebase::analytics::SetAnalyticsCollectionEnabled(true);
    firebase::analytics::LogEvent(firebase::analytics::kEventPostScore,
                                  firebase::analytics::kParameterScore, 100500);


//    //TODO привязать по appid к аккаунту с помощью google-services.json
//    //TODO отправить сообещение в БД
//    //TODO просмотреть сообщение

    auto result = app.exec();

//    firebase::analytics::Terminate();
//    delete fb_app;
    return result;


   /* return app.exec();      */                                                  // начало работы приложения, т.е. передача управления
                                                                                // от точки входа коду самого приложения (cpp и qml)


}

/* строение проекта Qt QML:
*.pro - файл настроект системы сборки qmake,
*   - все файлы из дерева проекта
*   перечислены в *.pro, и при удалении из *.pro -файла удаляются из дерева
*   - внешние библиотеки (.lib и .h-файлы) подключаются через *.pro
*   - различие процесса сборки для ОС задаётся в *.pro
*
* main.cpp - точка входа в приложение. А в случае приложения QML в main создаётся
* объект движка-интерпретатора QML-разметки
*
* Как и в любом C++ приложении, в проекте могут быть другие cpp и h файлы
*
* Описание интерфейса приложения и простейших механик его логики содержится в
* файлах QML, которые выполняют роль фронтенда. QML - диалект JS + JSON
*
*
* Структура базовой функции main
*
* .qrc - файл ресурсов, туда помещаются любые некомпилируемые данные:
* изображения, 3D-сетки, аудио и т.д.
**/
