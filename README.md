# 📊 Análisis Fintual - Valor Cuota y Riesgo

Análisis automatizado de fondos de inversión de Fintual utilizando su API pública. Este proyecto genera reportes detallados sobre la evolución del valor cuota, volatilidad y métricas de riesgo.

## 🚀 Características

- **Obtención automática de datos** desde la API de Fintual
- **Análisis de volatilidad** y métricas de riesgo
- **Visualizaciones** con ggplot2
- **Reporte profesional** en formato Quarto/HTML
- **Métricas financieras** estándar (Sharpe, drawdown, etc.)

## 🤖 Análisis con IA Generativa

Este reporte está optimizado para ser analizado por modelos de lenguaje (LLMs) como Claude, ChatGPT, Gemini, etc. El documento incluye:

- Métricas estructuradas en formato fácil de procesar
- Descripciones detalladas de cada gráfico y análisis
- Contexto completo para interpretación automatizada
- Datos organizados específicamente para análisis por IA

## 🎯 Prompt Recomendado

Para obtener el mejor análisis, usa el siguiente prompt con tu LLM preferido:

```
**Role and Task:**

You are an expert financial analyst. Your task is to analyze a financial report and provide a summary and recommendations.  

**Input Data:**

1.  **Report:** Analyze the financial report located at: [https://paulovillarroel.quarto.pub/analisis-fintual/](https://paulovillarroel.quarto.pub/analisis-fintual/)  This report is based on data from the official Fintual public API.
2.  **Complementary Information:** Supplement your analysis, investment strategy assessment, and historical performance comparison using information available on the official Fintual website for the "Risky Norris" fund: [https://fintual.cl/risky-norris](https://fintual.cl/risky-norris)

**Specific Instructions:**

* **Report Analysis:** Provide a detailed analysis of the key findings, methodologies, and conclusions presented in the provided report.  Identify any strengths, weaknesses, or potential biases in the report's analysis.
* **Summary:** Generate a concise summary of the report's main points, including key performance indicators, trends, and significant observations.
* **Recommendations:** Based on your expert analysis of both the report and the information from the Fintual website, offer actionable recommendations. These recommendations should be specific and justified, and could include:
    * Investment strategies related to the "Risky Norris" fund.
    * Potential risks and opportunities associated with the fund.
    * Comparison of the report's findings with Fintual's official information.
    * Suggestions for further analysis or due diligence.
* **Output Format:** Present your response in a structured format with clear headings and subheadings.  Use bullet points or numbered lists to organize key findings and recommendations.  Include a brief introductory paragraph setting the context of your analysis. Use spanish language for response.

**Constraints:**

* Focus exclusively on the provided report and the specified Fintual website. Do not consult other external sources unless absolutely necessary to clarify terms or concepts (and if you do, explicitly state the source).
* Assume the user has a moderate understanding of finance and investment terminology.  Explain any highly technical terms briefly.
* Be objective and avoid personal opinions or financial advice.  Present your analysis and recommendations based on the data and your expert interpretation.
```

Nota: Este ejemplo está ajustado específicamente al Fondo Risky Norris. Para otros fondos, modifica la URL de documentación correspondiente.

## 💡 Beneficios del Análisis por IA

- Interpretación objetiva de métricas y tendencias
- Comparación automática con benchmarks del mercado
- Recomendaciones personalizadas según perfil de riesgo
- Análisis integral combinando datos cuantitativos y contexto del fondo
- Identificación de patrones no evidentes en análisis manual

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
