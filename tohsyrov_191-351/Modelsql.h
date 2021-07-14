//#ifndef MODELSQL
//#define MODELSQL

//#include <QObject>
//#include <QAbstractItemModel>

//class GroupObject
//{
//public: /* TODO прочие параметры для задания свойств */
//    GroupObject();
//    GroupObject(const QString p_name,
//                const QString p_description,
//                int p_is_closed,
//                const QString p_type,
//                const QString p_photo,
//                const int p_id,
//                const QString p_screen_name,
//                int p_members_count
//                );

//    // get-методы на каждое свойство
//    QString getname() const;
//    QString getdescription() const;
//    int getis_closed() const;
//    QString gettype() const;
//    QString getphoto() const;
//    int getid() const;
//    QString getscreen_name() const;
//    int getmembers_count() const;


//private:   // свойства, хранящие данные модели
//    QString m_name;
//    QString m_description;
//    int m_is_closed;
//    QString m_type;
//    QString m_photo;
//    int m_id;
//    QString m_screen_name;
//    int m_members_count;
//};

//class model : public QAbstractListModel
//{
//    Q_OBJECT
//public:
//    enum enmRoles { // TODO прочие нумерованные обозначения для полей
//        name = Qt::UserRole + 1,
//        description,
//        is_closed,
//        type,
//        photo,
//        id,
//        screen_name,
//        members_count
//    };


//    explicit model(QObject *parent = nullptr);
//    void addItem(const GroupObject & newItem);
//    int rowCount(const QModelIndex & parent = QModelIndex()) const;

//    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
//    QVariantMap get(int idx) const;
//    void clear();

//protected:
//    QHash<int, QByteArray> roleNames() const;
//private:
//    QList<GroupObject> groups;

//};

//#endif // MODELSQL
