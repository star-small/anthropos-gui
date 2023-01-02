#include "listmodel.h"
#include "database.h"
ListModel::ListModel(QObject *parent)
    : QSqlQueryModel(parent)
{
    this->updateModel();
}
QVariant ListModel::data(const QModelIndex & index, int role) const {

    int columnId = role - Qt::UserRole - 1;
    QModelIndex modelIndex = this->index(index.row(), columnId);

    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

QHash<int, QByteArray> ListModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[ScaleRole] = "scale";
    roles[CategoryRole] = "category";
    roles[DateRole] = "date";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModel::updateModel()
{
    // Обновление производится SQL-запросом к базе данных
    this->setQuery("SELECT id, " TABLE_SCALE ", " TABLE_CATEGORY ", " TABLE_DATE " FROM " TABLE);
}

// Получение id из строки в модели представления данных
int ListModel::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
