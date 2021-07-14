#include "cryptocontroller.h"
#include <QString>
#include <openssl/evp.h>
#include <QFile>
#include <QByteArray>
#include <QIODevice>
#include <QObject>
#include <openssl/conf.h>
#include <QDebug>
#include <QTextCodec>

cryptoController::cryptoController(){}

int cryptoController::encryptFile(const QString & key, const QString & in_file){
    EVP_CIPHER_CTX *ctx;
    if(!(ctx = EVP_CIPHER_CTX_new())){ //EVP_CIPHER_CTX_new() creates a cipher context.
        return 0;
    }

        iv = (unsigned char*) key.data(); //*QString::data() is mostly useful to pass to a function that accepts a const char *.

        if(1 != EVP_EncryptInit_ex(ctx, EVP_aes_256_cfb(), NULL, (unsigned char*) key.data(), iv))
        //EVP_EncryptInit_ex() sets up cipher context "ctx" for encryption with cipher "EVP_aes_256_cfb()"
        //from ENGINE "NULL" (If impl is NULL then the default implementation is used.)
        {
            return 0;
        }

    unsigned char ciphertext[256] = {0};
    unsigned char plaintext[256] = {0};
    int len = 0, plaintext_len = 0;

    sourсefile = in_file.mid(8); // пропускаем "file:///"
    QFile sourсe_file(sourсefile);
    sourсe_file.open(QIODevice::ReadOnly);

    int position = sourсefile.lastIndexOf(".");
    QString file_extension = sourсefile.mid(position);
    QString sourсefile_enc = sourсefile.left(position) + "_crypt" + file_extension; //Для создания нового файла

    QFile file_modificate(sourсefile_enc);
    file_modificate.open(QIODevice::ReadWrite);
    plaintext_len = sourсe_file.read((char *)plaintext, 256); //QIODevice::read(char *data, qint64 maxSize) reads at most maxSize bytes from the device into data, and returns the number of bytes read.

    while(plaintext_len > 0){
        if(1 != EVP_EncryptUpdate(ctx, ciphertext, &len, plaintext, plaintext_len))
            /*
             EVP_EncryptUpdate() encrypts "plaintext_len" bytes from the buffer "plaintext"
                and writes the encrypted version to "ciphertext".
            */
        {
            return 0;
        }

        file_modificate.write((char *)ciphertext, len); //Запись ciphertext в файл шифрованных данных
        plaintext_len = sourсe_file.read((char *)plaintext, 256); //Считывание очередного блока 256 символов
    }

    //textArea->setProperty("text", QString("hhxt"));


    EVP_CIPHER_CTX_free(ctx);

    sourсe_file.close();
    file_modificate.close();

    return 0;
}

int cryptoController::decryptFile(const QString & key, const QString & in_file){
    EVP_CIPHER_CTX *ctx;
    if(!(ctx = EVP_CIPHER_CTX_new())){
        return 0;
    }

    iv = (unsigned char*) key.data();

    if(1 != EVP_DecryptInit_ex(ctx, EVP_aes_256_cfb(), NULL, (unsigned char*) key.data(), iv))
    {
        return 0;
    }


    unsigned char ciphertext[256] = {0};
    unsigned char plaintext[256] = {0};
    int len = 0, plaintext_len = 0;

    if(in_file.lastIndexOf("file://") == -1){
        sourсefile = in_file;
    } else {
        sourсefile = in_file.mid(8);
    }

    QFile sourсe_file(sourсefile);
    sourсe_file.open(QIODevice::ReadOnly);

//    int position = sourсefile.lastIndexOf(".");
//    QString file_extension = sourсefile.mid(position);
//    QString sourсefile_dec = sourсefile.left(position) + "_decoded" + file_extension;

//    QFile file_modificate(sourсefile_dec);
//    file_modificate.open(QIODevice::ReadWrite);
    plaintext_len = sourсe_file.read((char *)plaintext, 256);

    while(plaintext_len > 0){
        if(1 != EVP_DecryptUpdate(ctx, ciphertext, &len, plaintext, plaintext_len))
        {
            return 0;
        }

//        file_modificate.write((char *)ciphertext, len);
        plaintext_len = sourсe_file.read((char *)plaintext, 256);

        QTextCodec::setCodecForLocale(QTextCodec::codecForName("CP 1251"));

        QByteArray barr = QByteArray((char*)ciphertext);

        QTextCodec *codec = QTextCodec::codecForName("CP 1251");

        QString encodedString = codec->toUnicode(barr);

        emit sendToQml(encodedString);

    }

    EVP_CIPHER_CTX_free(ctx);

    sourсe_file.close();
//    file_modificate.close();

    return 0;
}
