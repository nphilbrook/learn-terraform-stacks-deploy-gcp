exports.helloWorld = (req, res) => {
  const name = req.query.name || req.body?.name || "World";
  
  res.status(200).send(`Hello, ${name}!`);
};
