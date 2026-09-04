# Supermercado Litoral: Inflação Acumulada de +58.7% entre 2020 e 2026

Uma análise detalhada do histórico de preços do **Supermercado Litoral** (CNPJ: `08.189.400/0001-07`) revela que o nível geral de preços do estabelecimento acumulou uma alta de **+58.68%** entre agosto de 2020 e julho de 2026. O período de maior aceleração inflacionária ocorreu entre **2021 e 2024**, com o ritmo desacelerando significativamente a partir de 2025.

---

## Principais Descobertas (Key Findings)

1. **Aceleração entre 2021 e 2024**: O índice geral acumulado subiu de **100.0 em 2020** para **153.3 em 2024**. Esse avanço foi puxado por altas anuais consecutivas expressivas: **+8.94% (2020→2021)**, **+13.57% (2021→2022)**, **+10.89% (2022→2023)** e **+11.75% (2023→2024)**.
2. **Estabilização Recente (2024→2026)**: Nos últimos dois anos, a variação de preços arrefeceu drasticamente. O índice variou apenas **+2.04% entre 2024 e 2025**, e **+1.43% entre 2025 e 2026**, encerrando o período avaliado em **158.68**.
3. **Explosão no Preço do Café**: O **Café Santa Clara 250g** registrou a maior alta entre os produtos básicos analisados, passando de um preço médio de **R$ 3,59 em 2020** para **R$ 14,49 em 2026** — uma alta nominal extraordinária de **+303.62%**.
4. **Comportamento Misto em Outras Categorias**:
   * O energético/tônico **Taff Man-Ex 110ml** dobrou de preço, registrando alta de **+106.13%** (de R$ 3,10 para R$ 6,39).
   * A **Cebola Branca (kg)** subiu **+62.66%** (de R$ 3,99 para R$ 6,49).
   * Itens industrializados como o **Refrigerante Coca-Cola 250ml** apresentaram uma alta mais contida e próxima à média geral: **+48.00%** (de R$ 1.75 para R$ 2.59).

---

## Tabela de Índice Geral e Variações Anuais

| Ano | Índice Geral de Preços (Base 2020 = 100) | Variação Anual (YoY) | Número de Produtos na Amostra |
|:---:|:---------------------------------------:|:--------------------:|:----------------------------:|
| **2020** | 100.00 | — | 261 observações |
| **2021** | 108.94 | +8.94% | 45 produtos coincidentes |
| **2022** | 123.73 | +13.57% | 37 produtos coincidentes |
| **2023** | 137.21 | +10.89% | 16 produtos coincidentes |
| **2024** | 153.32 | +11.75% | 25 produtos coincidentes |
| **2025** | 156.45 | +2.04% | 99 produtos coincidentes |
| **2026** | 158.68 | +1.43% | 65 produtos coincidentes |

---

## Evolução de Preços de Itens Representativos

| Nome do Produto nas Fontes | Preço em 2020 | Preço em 2026 | Variação Total (%) | Tipo de Categoria |
|:---|:---:|:---:|:---:|:---|
| **CAFE SANTA CLARA 250G CLASSICO ALMOFADA** | R$ 3,59 | R$ 14,49 | **+303.62%** | Alimento Básico |
| **TAFF MAN-EX 110ML UND** | R$ 3,10 | R$ 6,39 | **+106.13%** | Bebida Funcional |
| **CEBOLA BRANCA KG** | R$ 3,99 | R$ 6,49 | **+62.66%** | Hortifrúti |
| **REFRIGERANTE COCA-COLA 250ML PET** | R$ 1,75 | R$ 2,59 | **+48.00%** | Industrializado / Bebida |

---

## Metodologia e Fonte de Dados

* **Fonte**: Arquivos de histórico de preços (`Price_History_part_1_of_5.csv` a `Price_History_part_5_of_5.csv`) filtrados unicamente pelo CNPJ do Supermercado Litoral (`08.189.400/0001-07`), com base na correspondência fiscal eletrônica do projeto.
* **Cálculo do Índice**: Foi utilizado um modelo de **Índice de Preços Encadeado por Média Geométrica**. Para cada par de anos consecutivos ($t-1$ e $t$), calculou-se a variação percentual dos preços médios apenas para os produtos que possuíam dados registrados em ambos os anos (evitando distorções causadas por mudanças na composição da amostra de produtos). A média geométrica dessas variações foi encadeada anualmente a partir da base 100.0 em 2020.
* **Tratamento de Outliers**: Registros de preços que correspondiam a fardos/embalagens coletivas (ex: caixas fechadas de Taff Man-Ex vendidas acima de R$ 10,00) foram removidos para garantir que as séries históricas analisassem exclusivamente as unidades individuais.

---

*Nota: Todas as alegações e dados numéricos acima foram extraídos e calculados estritamente com base nas fontes CSV de histórico de preços presentes no seu projeto.*
