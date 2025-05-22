# 📊 Análisis Fintual - Valor Cuota y Riesgo

Análisis automatizado de fondos de inversión de Fintual utilizando su API pública. Este proyecto genera reportes detallados sobre la evolución del valor cuota, volatilidad y métricas de riesgo.

## 🚀 Características

- **Obtención automática de datos** desde la API de Fintual
- **Análisis de volatilidad** y métricas de riesgo
- **Visualizaciones** con ggplot2
- **Reporte profesional** en formato Quarto/HTML
- **Métricas financieras** estándar (Sharpe, drawdown, etc.)

## 📁 Estructura del Proyecto

```
fintual-api/
├── README.md
├── api-req.R           # Script para obtener datos de la API
├── reporte.qmd         # Documento Quarto principal
├── reporte.html        # Reporte generado (HTML)
└── .gitignore
```

## 🛠️ Requisitos

### R Packages
```r
# Paquetes requeridos
install.packages(c(
  "httr2",      # Peticiones HTTP
  "jsonlite",   # Procesamiento JSON
  "dplyr",      # Manipulación de datos
  "purrr",      # Programación funcional
  "ggplot2",    # Visualizaciones
  "scales",     # Formateo de escalas
  "lubridate",  # Manejo de fechas
  "gridExtra",  # Layouts de gráficos
  "glue",       # Strings interpoladas
  "zoo",        # Series de tiempo
  "knitr",      # Reportes
  "quarto"      # Documentos Quarto
))
```

### Software
- **R** (>= 4.0.0)
- **Quarto** CLI

## 🏃‍♂️ Uso Rápido

### 1. Clonar el repositorio
```bash
git clone https://github.com/paulovillarroel/fintual-api.git
cd fintual-api
```

### 2. Ejecutar análisis
```r
# En R 
source("api-req.R")    # Obtiene los datos
```

### 3. Generar reporte
```bash
# Desde terminal
quarto render reporte.qmd

# O desde R
quarto::quarto_render("reporte.qmd")
```

## 📊 Análisis Incluidos

### Métricas Principales
- Retorno total y promedio diario
- Volatilidad diaria y anualizada
- Ratio Sharpe aproximado
- Máximo drawdown
- Análisis de tendencia

### Visualizaciones
- Evolución del valor cuota con medias móviles
- Retornos diarios (gráfico de barras)
- Retorno acumulado
- Distribución de retornos
- Volatilidad móvil

### Evaluación de Riesgo
- Comparación con benchmarks de volatilidad
- Análisis de días con movimientos significativos
- Performance mensual detallada

## ⚙️ Configuración

### Personalizar fechas y activo
En `api-req.R`:
```r
# Modificar estos parámetros
fecha_inicio <- "2025-01-01"
fecha_fin <- "2025-05-21"
asset_id <- 188  # ID del fondo Fintual. Puedes encontrarlos en https://fintualist.com/chile/tecnologia/el-api-de-fintual/
```

### API de Fintual
El proyecto utiliza el endpoint público:
```
https://fintual.cl/api/real_assets/{asset_id}/days?from_date={fecha_inicio}&to_date={fecha_fin}
```

## 📈 Ejemplo de Output

El reporte genera métricas como:
- **Retorno Total**: +12.5%
- **Volatilidad Anualizada**: 18.2%
- **Ratio Sharpe**: 1.24
- **Máximo Drawdown**: -8.7%

## 🔧 Personalización

### Añadir nuevas métricas
```r
# En data-prep chunk del .qmd
df_analysis <- df_analysis %>%
  mutate(
    # Tu nueva métrica aquí
    nueva_metrica = tu_calculo
  )
```

### Modificar visualizaciones
Los gráficos están construidos con `ggplot2` y son fácilmente personalizables modificando los chunks correspondientes en `reporte.qmd`.

## 🤝 Contribuir

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/nueva-funcionalidad`)
3. Commit tus cambios (`git commit -m 'Añade nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Abre un Pull Request

## 📝 Notas Técnicas

- **Volatilidad anualizada**: Calculada usando √252 (días hábiles por año)
- **Retornos**: Calculados como diferencias logarítmicas porcentuales
- **Medias móviles**: 7 y 30 días usando `zoo::rollmean()`
- **API Rate Limits**: Respeta los límites de la API de Fintual

## ⚠️ Disclaimer

Este análisis es solo para propósitos educativos e informativos. No constituye asesoría financiera. Las inversiones conllevan riesgos y es recomendable consultar con un asesor financiero profesional.

## 📄 Licencia

MIT License - ver [LICENSE](LICENSE) para más detalles.

## 📧 Contacto

- **Autor**: Paulo Villarroel
- **Email**: paulo@hazlacondatos.com
- **LinkedIn**: [Perfil](https://linkedin.com/in/paulovillarroel)

---

⭐ **¡Dale una estrella si te resultó útil!** ⭐