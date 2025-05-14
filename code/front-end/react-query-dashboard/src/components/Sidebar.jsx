import React from "react";
import { Link } from "react-router-dom";

const Sidebar = () => {
  return (
    <div style={styles.sidebar}>
      <h2 style={styles.title}>Admin Dashboard</h2>
      <ul style={styles.list}>
        {[...Array(15).keys()].map((index) => (
        <li
          key={index}
          style={styles.item}
          onClick={() => window.history.pushState({}, "", `/query${index + 1}`)}
        >
          ⚙️ Query {index + 1}
        </li>

        ))}
      </ul>
    </div>
  );
};

const styles = {
  sidebar: {
    width: "250px",
    height: "100vh",
    backgroundColor: "#282c34",
    color: "white",
    padding: "20px",
    display: "flex",
    flexDirection: "column",
  },
  title: {
    fontSize: "20px",
    marginBottom: "20px",
  },
  list: {
    listStyle: "none",
    padding: 0,
  },
  item: {
    padding: "10px",
    cursor: "pointer",
    borderRadius: "5px",
    marginBottom: "10px",
    backgroundColor: "#3a3f47",
    textAlign: "center",
  },
  link: {
    textDecoration: "none",
    color: "white",
  },
};

export default Sidebar;
