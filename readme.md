# 🎬 The Ultimate SQL Crash Course (Anime Edition)

![SQL](https://img.shields.io/badge/Language-SQL-blue?style=for-the-badge&logo=postgresql)
![Level](https://img.shields.io/badge/Level-Beginner%20to%20Intermediate-orange?style=for-the-badge)

> **Master SQL basics in 20 minutes.**  
> A single, copy-pasteable SQL file based on the [SQLBolt](https://sqlbolt.com/) curriculum, adapted with a custom **Anime Database** to make learning fun and relatable.

---

## 📖 About

This repository contains a **single `.sql` file** that takes you from *Hello World* to complex joins and database management.

Instead of dry business data, we use a dataset featuring **Attack on Titan**, **Studio Ghibli**, **Violet Evergarden**, and more. This makes understanding relationships (like **Studios** vs **Anime**) intuitive and visual.

### Why this guide?

- ✅ **Zero Fluff** – Short theory followed immediately by code  
- 📄 **One File** – Everything is inside `anime_course.sql`  
- 🌍 **Universal SQL** – Works with SQLite, PostgreSQL, MySQL, and SQL Server  

---

## 🗄️ Database Schema

We use two connected tables. Here’s how the data is structured:

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

## 📋 Tables Overview

### 1. Studios
Contains the production houses (e.g., **Kyoto Animation**, **MAPPA**).

### 2. Anime
Contains anime details.  
The `studio_id` column links back to the **Studios** table.

---

## 🚀 Quick Start

### Option A: Run Locally (VS Code / DBeaver)

1. Clone this repository  
2. Open `anime_course.sql` in your editor  
3. Run the **Setup section** (lines 10–60)  
4. Execute lesson queries one by one  

### Option B: Run in Browser (No Install)

1. Open `anime_course.sql` on GitHub  
2. Copy the full file content  
3. Paste into **SQLite Online** or **DB Fiddle**  
4. Click **Run**

---

## 📚 Curriculum

The SQL file is divided into clear learning sections:

| Section | Topic | Key Concepts |
|-------:|------|--------------|
| 0 | Setup | CREATE, INSERT |
| 1 | Basics | SELECT, * |
| 2–3 | Filtering | WHERE, LIKE, IN, AND / OR |
| 4 | Sorting | ORDER BY, LIMIT, DISTINCT |
| 6–7 | Joins | INNER JOIN, LEFT JOIN |
| 8 | Nulls | IS NULL, IS NOT NULL |
| 9–11 | Math & Aggregates | COUNT, SUM, GROUP BY, HAVING |
| 13–15 | Management | INSERT, UPDATE, DELETE |
| 16–18 | Schema | ALTER, DROP |

---

## ⚡ Sneak Peek

```sql
-- LESSON 6: JOINING TABLES
-- Theory: Inner Join combines rows from two tables whenever there is a match.

-- EXAMPLE: List anime titles along with their studio name.
SELECT Anime.title, Studios.name
FROM Anime
INNER JOIN Studios ON Anime.studio_id = Studios.id;

⭐ **Based on lessons from [SQLBolt.com](https://sqlbolt.com/)**  
🎌 *Created for the community, by the community*

