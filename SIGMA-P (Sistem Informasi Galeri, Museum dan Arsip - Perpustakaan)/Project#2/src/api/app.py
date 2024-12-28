from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://user:password@localhost/sigma_db'
db = SQLAlchemy(app)

class Museum(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    latitude = db.Column(db.Float, nullable=False)
    longitude = db.Column(db.Float, nullable=False)
    description = db.Column(db.Text)

@app.route('/api/locations')
def get_locations():
    museums = Museum.query.all()
    return jsonify({
        'museums': [{
            'id': m.id,
            'name': m.name,
            'lat': m.latitude,
            'lng': m.longitude,
            'description': m.description
        } for m in museums]
    })

if __name__ == '__main__':
    app.run(debug=True)
