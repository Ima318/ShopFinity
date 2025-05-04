/* Reset and base styles */
* {
margin: 0;
padding: 0;
box-sizing: border-box;
}

body {
font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
line-height: 1.6;
color: #333;
background-color: #f5f7fa;
}

.container {
max-width: 800px;
margin: 0 auto;
padding: 2rem;
}

/* Header styles */
header {
margin-bottom: 2rem;
text-align: center;
}

header h1 {
color: #2c3e50;
margin-bottom: 0.5rem;
font-size: 2rem;
}

header p {
color: #7f8c8d;
}

/* Form styles */
form {
background-color: white;
padding: 2rem;
border-radius: 8px;
box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.form-group {
margin-bottom: 1.5rem;
}

.form-row {
display: flex;
gap: 1rem;
margin-bottom: 1.5rem;
}

.form-row .form-group {
flex: 1;
margin-bottom: 0;
}

label {
display: block;
margin-bottom: 0.5rem;
font-weight: 600;
color: #2c3e50;
}

input[type="text"],
input[type="number"],
textarea,
select {
width: 100%;
padding: 0.75rem;
border: 1px solid #ddd;
border-radius: 4px;
font-size: 1rem;
transition: border-color 0.3s;
}

input[type="text"]:focus,
input[type="number"]:focus,
textarea:focus,
select:focus {
border-color: #3498db;
outline: none;
box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
}

/* File input styling */
.file-input-container {
position: relative;
margin-bottom: 0.5rem;
}

input[type="file"] {
position: absolute;
top: 0;
left: 0;
width: 100%;
height: 100%;
opacity: 0;
cursor: pointer;
z-index: 2;
}

.file-input-placeholder {
display: flex;
align-items: center;
justify-content: center;
padding: 2rem;
border: 2px dashed #ddd;
border-radius: 4px;
background-color: #f9f9f9;
color: #7f8c8d;
transition: all 0.3s;
}

input[type="file"]:hover + .file-input-placeholder,
input[type="file"]:focus + .file-input-placeholder {
border-color: #3498db;
background-color: #ecf0f1;
}

/* Image preview */
#image-preview {
margin-top: 1rem;
text-align: center;
}

#image-preview img {
max-width: 100%;
max-height: 200px;
border-radius: 4px;
margin-bottom: 0.5rem;
}

#remove-image {
background-color: #e74c3c;
color: white;
border: none;
padding: 0.5rem 1rem;
border-radius: 4px;
cursor: pointer;
font-size: 0.875rem;
transition: background-color 0.3s;
}

#remove-image:hover {
background-color: #c0392b;
}

.hidden {
display: none;
}

/* Button styles */
.form-actions {
display: flex;
justify-content: flex-end;
gap: 1rem;
margin-top: 2rem;
}

button {
padding: 0.75rem 1.5rem;
border: none;
border-radius: 4px;
font-size: 1rem;
font-weight: 600;
cursor: pointer;
transition: all 0.3s;
}

.btn-primary {
background-color: #3498db;
color: white;
}

.btn-primary:hover {
background-color: #2980b9;
}

.btn-secondary {
background-color: #ecf0f1;
color: #7f8c8d;
}

.btn-secondary:hover {
background-color: #bdc3c7;
color: #2c3e50;
}

/* Footer styles */
footer {
margin-top: 2rem;
text-align: center;
color: #7f8c8d;
font-size: 0.875rem;
}

/* Responsive styles */
@media (max-width: 768px) {
.container {
padding: 1rem;
}

form {
padding: 1.5rem;
}

.form-row {
flex-direction: column;
gap: 1.5rem;
}

.form-actions {
flex-direction: column-reverse;
}

button {
width: 100%;
}
}