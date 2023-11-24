const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');


const app = express();
const PORT = 3000;

// Conectar a MongoDB Atlas
mongoose.connect('mongodb+srv://hugo:waos123@cluster0.fj9ba2x.mongodb.net/Pruebas?retryWrites=true&w=majority');

const mongoSchema = new mongoose.Schema({
  nombres: String,
  email: String,
  numeroCelular: Number,
  contrasena: String,
  rol: String,
  estado: Number,
  fechaRegistro: { type: Date, default: Date.now },
  fechaActualizacion: { type: Date, default: Date.now },
  peso: Number,
  puntos: Number,
  fecha: { type: Date, default: Date.now },
});

const MongoModel = mongoose.model('Pruebas', mongoSchema, 'prueba1');

app.use(bodyParser.json());

app.get('/api/tudata', async (req, res) => {

  try {
    const data = await MongoModel.find();
    res.json(data);
  } catch (error) {
    res.status(500).json({ error: 'Error al obtener datos de la base de datos' });
  }
});

app.post('/api/tudata', async (req, res) => {
  try {
    const newData = new MongoModel(req.body);
    await newData.save();
    res.json(newData);
  } catch (error) {
    res.status(500).json({ error: 'Error al agregar datos a la base de datos' });
  }
});

app.listen(PORT, '192.168.100.120', () => {
  console.log(`Servidor en ejecución en http://localhost:${PORT}`);
});

app.put('/api/tudata/:userId', async (req, res) => {
  const userId = req.params.userId;
  const newWeight = req.body.peso;

  try {
    const user = await MongoModel.findById(userId);
    if (!user) {
      return res.status(404).json({ error: 'Usuario no encontrado' });
    }

    user.peso = newWeight;
    user.fechaActualizacion = new Date(); // Actualizar la fecha de actualización
    await user.save();

    res.json({ message: 'Peso actualizado con éxito' });
  } catch (error) {
    console.error('Error al actualizar el peso:', error);
    res.status(500).json({ error: 'Error al actualizar el peso' });
  }
});


