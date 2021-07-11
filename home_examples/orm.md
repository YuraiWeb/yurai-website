### Database Model

```
@DbTable("tablename")
final class DbModel
{
  import std.datetime : DateTime;

  public:
  ulong id;
  string name;
  @DbCreateTime DateTime created;
  @DbTimestamp DateTime timestamp;
}
```

### Setup

```
// Requires mysql-native dependency and the version flag "YURAI_MYSQL"
import yurai.data.mapping.mysql;

auto service = new MysqlDataService("connectionString");
```

### Insert / Update

If the model's id doesn't evalute to truthy ex. if it's 0 then it will insert, otherwise it will update.

```
auto model = new DbModel;
model.name = "Name";
service.save(model);
```

### Insert / Update Many

Ditto regarding when save does what.

```
DbModel[] models = [];
foreach (_; 0 .. 10)
{
  auto model = new DbModel;
  model.name = "Name";
  models ~= model;
}

service.save(models);
```

### Select One

Parameters are query (where) and params.

```
auto params = new DbParam[1];
params[0] = cast(ulong)10;

auto model = service.selectSingle!(DbModel)("`id` = ?", params);
```

### Select Many

Ditto regarding parameters.

```
auto modelsRange = service.selectMany!(DbModel)(null, null);
```

Learn more about [ORM](/docs/specifications/database-mysql-orm)
