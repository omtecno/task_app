const express = require("express");
const router = express.Router();
const pool = require("../db");

// POST - Save Message
router.post("/", async (req, res) => {
  try {
    const { message } = req.body;

    if (!message || message.trim() === "") {
      return res.status(400).json({
        success: false,
        error: "Message is required"
      });
    }

    const newMessage = await pool.query(
      "INSERT INTO messages (message) VALUES ($1) RETURNING *",
      [message]
    );

    res.status(201).json({
      success: true,
      data: newMessage.rows[0]
    });

  } catch (error) {
    console.error("Error saving message:", error);
    res.status(500).json({
      success: false,
      error: "Server Error"
    });
  }
});

module.exports = router;
