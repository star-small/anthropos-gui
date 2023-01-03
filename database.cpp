#include "database.h"

DataBase::DataBase(QObject *parent) : QObject(parent)
{

}

DataBase::~DataBase()
{

}

void DataBase::connectToDatabase()
{
    if(!QFile("" DATABASE_NAME).exists()) {
        this->restoreDataBase();
    } else {
        this->openDataBase();
    }
}

bool DataBase::restoreDataBase()
{
    if(this->openDataBase()) {
        return (this->createTable()) ? true : false;
    } else {
        qDebug() << "Не удалось восстановить бд";
        return false;
    }
    return false;
}

bool DataBase::openDataBase()
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setHostName(DATABASE_HOSTNAME);
    db.setDatabaseName("" DATABASE_NAME);
    if (db.open()) {
        return true;
    } else {
        return false;
    }
}


void DataBase::closeDataBase()
{
    db.close();
}


bool DataBase::createTable()
{
    QSqlQuery query;
    if (!query.exec("CREATE TABLE " TABLE " ("
                    "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                    TABLE_SCALE " VARCHAR(255) NOT NULL,"
                    TABLE_CATEGORY " VARCHAR(255) NOT NULL,"
                    TABLE_DATE " TEXT"
                    " )"
                    )) {
        qDebug() << "DataBase: error of create " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

bool DataBase::inserIntoTable(const QVariantList &data)
{
    QSqlQuery query;
    query.prepare("INSERT INTO " TABLE " ( " TABLE_SCALE ", "
                                             TABLE_CATEGORY ", "
                                             TABLE_DATE " ) "
                  "VALUES (:Scale, :Category, :Date)");
    query.bindValue(":Scale",       data[0].toString());
    query.bindValue(":Category",       data[1].toString());
    query.bindValue(":Date",         data[2].toString());
    //query.prepare("delete from " TABLE);
    if(!query.exec()){
        qDebug() << "error insert into " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

bool DataBase::inserIntoTable(const QString &scale, const QString &category, const QString &date)
{
    QVariantList data;
    data.append(scale);
    data.append(category);
    data.append(date);

    if(inserIntoTable(data))
        return true;
    else
        return false;
}

