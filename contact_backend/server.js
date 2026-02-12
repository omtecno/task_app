const express = require("express");
const cors = require("cors");
const dotenv = require("dotenv");
const { Pool } = require("pg");

dotenv.config();

const app = express();

// ✅ Enable CORS (VERY IMPORTANT for Flutter Web)
app.use(cors());

// ✅ Middleware to parse JSON
app.use(express.json());

// ✅ PostgreSQL Connection
const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});

// ✅ Test Route
app.get("/", (req, res) => {
  res.send("TAWADE TIGER IS ON🚀");
});

// ✅ POST API - Save Message
app.post("/api/messages", async (req, res) => {
  try {
    const { message } = req.body;

    if (!message) {
      return res.status(400).json({ error: "Message is required" });
    }

    const newMessage = await pool.query(
      "INSERT INTO messages (message) VALUES ($1) RETURNING *",
      [message]
    );

    res.status(201).json({
      success: true,
      data: newMessage.rows[0],
    });
  } catch (error) {
    console.error("Error saving message:", error);
    res.status(500).json({ error: "Server error" });
  }
});

// ✅ GET API - Fetch All Messages (for testing)
app.get("/api/messages", async (req, res) => {
  try {
    const allMessages = await pool.query(
      "SELECT * FROM messages ORDER BY created_at DESC"
    );
    res.json(allMessages.rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Server error" });
  }
});

// ✅ Start Server
const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT} 🚀`);
});
