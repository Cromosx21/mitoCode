import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import RoutesApp from './routes/RoutesApp.jsx'
import { BrowserRouter } from 'react-router-dom'
import { CourseProvider } from './context/CourseContext'


createRoot(document.getElementById('root')).render(
  <BrowserRouter>
    <StrictMode>
      <CourseProvider>
        <RoutesApp />
      </CourseProvider>
    </StrictMode>
  </BrowserRouter>
)
