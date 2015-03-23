var insertUser
insertUser = function(name, age) {
  return db.users.insert({
    name: 'name',
    age: age,
    __v: 0
  });
};
db.users.drop();
insertUser('brian', 42);
insertUser('susan', 31);
insertUser('arron', 2);

