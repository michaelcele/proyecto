#Proyecto biblioteca

graph LR
A[Inicio] --> B(app.js - Express);
B --> C[Configuración: Motor EJS, Middleware urlencoded, session, MOVER session AQUÍ, Rutas];
C --> D[Petición HTTP Ejemplo: GET /];
D --> E[Ruteo];
E --> F[routes.js];
F --> G[GET /];
G --> H[Renderiza login.ejs];
H --> I[Respuesta al Cliente];
F --> J[POST /login];
J --> K[Obtiene usuario y password];
K --> L[data.query - Consulta usuarios];
L --> M[Verifica credenciales];
M -- Sí --> N[Crea Sesión];
M -- No --> O[Redirige a /];
N --> P[Redirige a /nav];
O --> P;
F --> Q[GET /lista];
Q --> R[data.query - Consulta biblioteca];
R --> S[Renderiza libros.ejs con datos];
F --> T[...];
F --> U[report.js - CUIDADO: RUTAS CONFLICTIVAS];
U --> V[GET /generar];
V --> W[data.query - Consulta estadísticas];
W --> X[Crea PDF con jsPDF];
X --> Y[Envia PDF al Cliente];
Y --> Z[Fin];

