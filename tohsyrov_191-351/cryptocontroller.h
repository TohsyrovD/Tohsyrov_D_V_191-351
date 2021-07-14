#ifndef CRYPTOCONTROLLER_H
#define CRYPTOCONTROLLER_H
#include <QString>
#include <QObject>

class cryptoController : public QObject
{
    Q_OBJECT

public:
    explicit cryptoController();
    ~cryptoController() {};
    QString sourсefile; // choosen file

public slots:
    int encryptFile(const QString & key, const QString &in_file);
    int decryptFile(const QString & key, const QString &in_file);

signals:
    // Сигнал для передачи данных в qml-интерфейс
    void sendToQml(QString decrypted_text);


private:
    unsigned char * iv = (unsigned char *)("77411230141456889873614547987324");
    QString pseudo_key;

//protected:
//    QObject * showInfo;
};

#endif
