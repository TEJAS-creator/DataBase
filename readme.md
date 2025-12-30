# 🎬 The Ultimate SQL Crash Course (Anime Edition)

![SQL](https://img.shields.io/badge/Language-SQL-blue?style=for-the-badge&logo=postgresql)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Beginner%20to%20Intermediate-orange?style=for-the-badge)

> **Master SQL basics in 20 minutes.**
> A single, copy-pasteable SQL file based on the [SQLBolt](https://sqlbolt.com/) curriculum, adapted with a custom **Anime Database** to make learning fun and relatable.

---

## 📖 About
This repository contains a **single `.sql` file** that takes you from "Hello World" to complex joins and database management. 

Instead of dry business data, we use a dataset featuring *Attack on Titan*, *Studio Ghibli*, *Violet Evergarden*, and more. This makes understanding relationships (like **Studios** vs. **Anime**) intuitive and visual.

### Why this guide?
* **Zero Fluff:** Crisp theory followed immediately by code.
* **One File:** No switching between tabs. Everything is in `anime_course.sql`.
* **Universal:** Written in standard SQL compatible with SQLite, PostgreSQL, MySQL, and SQL Server.

---

## 🗄️ The Database Schema

We use two connected tables. Here is how the data is structured:

```mermaid
erDiagram
    STUDIOS ||--o{ ANIME : produces
    STUDIOS {
        INTEGER id PK
        TEXT name
        TEXT country
    }
    ANIME {
        INTEGER id PK
        TEXT title
        INTEGER studio_id FK
        TEXT genre
        INTEGER episodes
        DECIMAL rating
        INTEGER release_year
    }
