from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    # Return a simple styled HTML page
    return """
    <html>
        <head>
            <title>Flask Demo App</title>
            <style>
                body { 
                    font-family: Arial, sans-serif; 
                    background: #f0f2f5; 
                    text-align: center; 
                    padding: 50px;
                }
                h1 { 
                    color: #2c3e50; 
                }
                p { 
                    color: #555; 
                }
                .card {
                    background: white;
                    padding: 20px;
                    margin: auto;
                    width: 300px;
                    border-radius: 12px;
                    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                }
            </style>
        </head>
        <body>
            <div class="card">
                <h1>🚀 Flask Backend</h1>
                <p>Hello from Flask! Your backend is running.</p>
                <p>Shoaib Abbas</p>
            </div>
        </body>
    </html>
    """

# @app.route("/api/data")
# def get_data():
#     return jsonify({
#         "message": "Hello from Flask API!",
#         "status": "success",
#         "data": [1, 2, 3, 4, 5]
#     })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
