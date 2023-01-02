#ifndef LISTMODEL_H
#define LISTMODEL_H

#include <QObject>
#include <QSqlQueryModel>
class ListModel : public QSqlQueryModel
{
    Q_OBJECT
public:
    enum Roles {
        IdRole = Qt::UserRole + 1,
        ScaleRole,
        CategoryRole,
        DateRole
    };
    explicit ListModel(QObject *parent = 0);
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
public slots:
    void updateModel();
    int getId(int row);
signals:

};

#endif // LISTMODEL_H
