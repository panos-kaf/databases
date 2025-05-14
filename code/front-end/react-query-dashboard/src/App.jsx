import React from "react";
import { BrowserRouter as Router, Routes, Route, Navigate } from "react-router-dom";
import Sidebar from "./components/Sidebar";
import QueryPage from "./components/QueryPage";

const App = () => {
  return (
    <Router>
      <div style={{ display: "flex" }}>
        <Sidebar />
        <div style={{ flex: 1, padding: "20px" }}>
          <Routes>
            <Route path="/" element={<h1>Καλώς ήρθατε στο Admin Dashboard</h1>} />
            {[...Array(15).keys()].map((index) => (
              <Route
                key={index}
                path={`/query${index + 1}`}
                element={<QueryPage queryId={index + 1} />}
              />
            ))}
            {/* Αν ο χρήστης πάει σε route που δεν υπάρχει, ανακατευθύνουμε στο αρχικό */}
            <Route path="*" element={<Navigate to="/" />} />
          </Routes>
        </div>
      </div>
    </Router>
  );
};

export default App;
