#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSql>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlDatabase>
#include <QFile>
#include <QDate>
#include <QDebug>

#define DATABASE_HOSTNAME "Troy"
#define DATABASE_NAME "Third.db"

#define TABLE "State"
#define TABLE_SCALE "Scale"
#define TABLE_CATEGORY "Category"
#define TABLE_DATE "Date"
class DataBase : public QObject

{
    Q_OBJECT
public:
    explicit DataBase(QObject *parent=0);
    ~DataBase();
    void connectToDatabase();
private:
    QSqlDatabase db;
private:
    bool openDataBase();
    bool restoreDataBase();
    void     closeDataBase();
    bool createTable();
public slots:
    bool inserIntoTable(const QVariantList &data);      // Добавление записей в таблицу
    bool inserIntoTable(const QString &scale, const QString &category, const QString &date);
    //bool removeRecord(const int id); // Удаление записи из таблицы по её id
};

#endif // DATABASE_H
