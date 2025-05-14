const db = require('../db/connection');

exports.getQuery01 = async (req, res, next) => {
    const connection = await db.getConnection();
    try {
        console.log("hi");
        /*const [rows] = await connection.query(` 
                WITH RevenueCTE AS (
                SELECT 
                    festival.year AS Festival_Year,
                    purchase_type.type AS Payment_Type,
                    SUM(ticket.cost) AS Total_Revenue
                FROM ticket
                JOIN purchase_type ON ticket.purchase_type_id = purchase_type.id
                JOIN buyer ON ticket.visitor_id = buyer.visitor_id
                JOIN event ON buyer.event_id = event.id
                JOIN festival ON event.festival_id = festival.id
                GROUP BY festival.year, purchase_type.type
                )
                SELECT 
                    Festival_Year,
                    SUM(CASE WHEN Payment_Type = 'Bank Transfer' THEN Total_Revenue ELSE 0 END) AS Bank_Transfer_Earnings,
                    SUM(CASE WHEN Payment_Type = 'Cash' THEN Total_Revenue ELSE 0 END) AS Cash_Earnings,
                    SUM(CASE WHEN Payment_Type = 'Online' THEN Total_Revenue ELSE 0 END) AS Online_Earnings,
                    SUM(Total_Revenue) AS Total_Earnings
                FROM RevenueCTE
                GROUP BY Festival_Year
                ORDER BY Festival_Year;
            `);*/
        res.status(200).json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal server error' });
    } finally {
        connection.release();
    }
}
/*
exports.getQuery02 = async (req, res, next) => {
    const connection = await db.getConnection();
    try {
        const [rows] = await connection.query("SELECT festival.name AS festival_name, COUNT(DISTINCT transactions.id) AS total_transactions FROM festival LEFT JOIN transactions ON festival.id = transactions.festival_id GROUP BY festival.id");
        res.status(200).json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal server error' });
    } finally {
        connection.release();
    }
}
exports.getQuery03 = async (req, res, next) => {
    const connection = await db.getConnection();
    try {
        const [rows] = await connection.query("SELECT festival.name AS festival_name, COUNT(DISTINCT transactions.id) AS total_transactions FROM festival LEFT JOIN transactions ON festival.id = transactions.festival_id GROUP BY festival.id");
        res.status(200).json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal server error' });
    } finally {
        connection.release();
    }
}
exports.getQuery04 = async (req, res, next) => {
    const connection = await db.getConnection();
    try {
        const [rows] = await connection.query("SELECT festival.name AS festival_name, COUNT(DISTINCT transactions.id) AS total_transactions FROM festival LEFT JOIN transactions ON festival.id = transactions.festival_id GROUP BY festival.id");
        res.status(200).json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal server error' });
    } finally {
        connection.release();
    }
}
exports.getQuery05 = async (req, res, next) => {
    const connection = await db.getConnection();
    try {
        const [rows] = await connection.query("SELECT festival.name AS festival_name, COUNT(DISTINCT transactions.id) AS total_transactions FROM festival LEFT JOIN transactions ON festival.id = transactions.festival_id GROUP BY festival.id");
        res.status(200).json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal server error' });
    } finally {
        connection.release();
    }
}
exports.getQuery06 = async (req, res, next) => {
    const connection = await db.getConnection();
    try {
        const [rows] = await connection.query("SELECT festival.name AS festival_name, COUNT(DISTINCT transactions.id) AS total_transactions FROM festival LEFT JOIN transactions ON festival.id = transactions.festival_id GROUP BY festival.id");
        res.status(200).json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal server error' });
    } finally {
        connection.release();
    }
}
exports.getQuery07 = async (req, res, next) => {
    const connection = await db.getConnection();
    try {
        const [rows] = await connection.query("SELECT festival.name AS festival_name, COUNT(DISTINCT transactions.id) AS total_transactions FROM festival LEFT JOIN transactions ON festival.id = transactions.festival_id GROUP BY festival.id");
        res.status(200).json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal server error' });
    } finally {
        connection.release();
    }
}
exports.getQuery08 = async (req, res, next) => {
    const connection = await db.getConnection();
    try {
        const [rows] = await connection.query("SELECT festival.name AS festival_name, COUNT(DISTINCT transactions.id) AS total_transactions FROM festival LEFT JOIN transactions ON festival.id = transactions.festival_id GROUP BY festival.id");
        res.status(200).json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal server error' });
    } finally {
        connection.release();
    }
}
exports.getQuery09 = async (req, res, next) => {
    const connection = await db.getConnection();
    try {
        const [rows] = await connection.query("SELECT festival.name AS festival_name, COUNT(DISTINCT transactions.id) AS total_transactions FROM festival LEFT JOIN transactions ON festival.id = transactions.festival_id GROUP BY festival.id");
        res.status(200).json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal server error' });
    } finally {
        connection.release();
    }
}
exports.getQuery10 = async (req, res, next) => {
    const connection = await db.getConnection();
    try {
        const [rows] = await connection.query("SELECT festival.name AS festival_name, COUNT(DISTINCT transactions.id) AS total_transactions FROM festival LEFT JOIN transactions ON festival.id = transactions.festival_id GROUP BY festival.id");
        res.status(200).json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal server error' });
    } finally {
        connection.release();
    }
}
exports.getQuery11 = async (req, res, next) => {
    const connection = await db.getConnection();
    try {
        const [rows] = await connection.query("SELECT festival.name AS festival_name, COUNT(DISTINCT transactions.id) AS total_transactions FROM festival LEFT JOIN transactions ON festival.id = transactions.festival_id GROUP BY festival.id");
        res.status(200).json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal server error' });
    } finally {
        connection.release();
    }
}
exports.getQuery12 = async (req, res, next) => {
    const connection = await db.getConnection();
    try {
        const [rows] = await connection.query("SELECT festival.name AS festival_name, COUNT(DISTINCT transactions.id) AS total_transactions FROM festival LEFT JOIN transactions ON festival.id = transactions.festival_id GROUP BY festival.id");
        res.status(200).json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal server error' });
    } finally {
        connection.release();
    }
}
exports.getQuery13 = async (req, res, next) => {
    const connection = await db.getConnection();
    try {
        const [rows] = await connection.query("SELECT festival.name AS festival_name, COUNT(DISTINCT transactions.id) AS total_transactions FROM festival LEFT JOIN transactions ON festival.id = transactions.festival_id GROUP BY festival.id");
        res.status(200).json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal server error' });
    } finally {
        connection.release();
    }
}
exports.getQuery14 = async (req, res, next) => {
    const connection = await db.getConnection();
    try {
        const [rows] = await connection.query("SELECT festival.name AS festival_name, COUNT(DISTINCT transactions.id) AS total_transactions FROM festival LEFT JOIN transactions ON festival.id = transactions.festival_id GROUP BY festival.id");
        res.status(200).json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal server error' });
    } finally {
        connection.release();
    }
}
exports.getQuery15 = async (req, res, next) => {
    const connection = await db.getConnection();
    try {
        const [rows] = await connection.query("SELECT festival.name AS festival_name, COUNT(DISTINCT transactions.id) AS total_transactions FROM festival LEFT JOIN transactions ON festival.id = transactions.festival_id GROUP BY festival.id");
        res.status(200).json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal server error' });
    } finally {
        connection.release();
    }
};
*/
