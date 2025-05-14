import React, { useEffect, useState } from "react";
import axios from "axios";

const QueryPage = ({ queryId }) => {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        setLoading(true);
        setError(null);


        const paddedId = queryId < 10 ? `0${queryId}` : queryId;
        const response = await axios.get(`http://localhost:3000/query/${paddedId}`);
        
        setData(response.data);
      } catch (err) {
        console.error("Error fetching data:", err);
        setError("Σφάλμα κατά την ανάκτηση των δεδομένων.");
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [queryId]);

  if (loading) return <p>Φόρτωση δεδομένων...</p>;
  if (error) return <p>{error}</p>;

  return (
    <div>
      <h2>Αποτελέσματα για Query {queryId}</h2>
      
      {data.length > 0 ? (
        <table border="1" style={{ width: "100%", marginTop: "20px" }}>
          <thead>
            <tr>
              {Object.keys(data[0]).map((key) => (
                <th key={key}>{key}</th>
              ))}
            </tr>
          </thead>
          <tbody>
            {data.map((row, index) => (
              <tr key={index}>
                {Object.values(row).map((value, idx) => (
                  <td key={idx}>{value}</td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
      ) : (
        <p>Δεν υπάρχουν αποτελέσματα.</p>
      )}
    </div>
  );
};

export default QueryPage;
