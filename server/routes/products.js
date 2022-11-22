const express = require("express");
const { Product } = require("../models/product");
const productRouter = express.Router();
const auth = require("../middleware/auth")

//Get all products
productRouter.get("/api/products", auth, async (req, res) => {
  try {
   const category = req.query.category;
    const products = await Product.find({category: category});
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

productRouter.get("/api/products/search/:name", auth, async (req, res) => {
  try {
    const products = await Product.find({
      name: { $regex: req.params['name'], $options: "i" },
    });

    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = productRouter;