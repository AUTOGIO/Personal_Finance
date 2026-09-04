# Personal Inflation Index (IIP) Tracker & Analytics

An advanced, data-driven framework designed to monitor, analyze, and project your **Personal Inflation Index (IIP)**, offering a mathematically rigorous alternative to generic consumer price indices (such as IPCA). This project transforms a historical ledger of **3,572 real-world transactions** (spanning January 2022 to September 2026) into an interactive financial planning tool.

> **Atualizado em 03/09/2026** — 253 transações novas desde a última versão (238 do Supermercado Litoral, notas de 02/07, 16/07 e 02/09/2026 + 15 da Masterboi Paraíba). Ver "Nota de Atualização" no final deste documento para o que mudou e o que ficou intencionalmente intocado.

---

## 📊 Core Deliverables & Artifacts

Files actually present in this repository (paths relative to project root):

1. **`02_Models/personal_inflation_tracker-v2.xlsx`** (Financial Tracker & Terminal)
   * `Registro de Compras` sheet: unified transaction ledger, 3,572 rows, automatic category mapping.
   * `Terminal IIP` sheet: Bloomberg/Reuters-style dark dashboard — chained-Jevons index, dynamic `=SUMIF()` category totals, 2027 scenario toggle (**Otimista** / **Conservador** / **Pessimista**, cell `I9`).

2. **`02_Models/iip_terminal.html`** — standalone interactive dashboard (open directly in a browser, or via `make open`). Static snapshot of the tracker's key figures; regenerate by hand after a data refresh, it is not formula-linked to the xlsx.

3. **`01_Reports/personal_inflation_tracker_methodology.pdf`** (Mathematical Guide)
   * Typeset PDF detailing the **Chained Jevons Index** (geometric mean) and how transaction-based budget weights construct the personalized price index.

4. **`04_Charts/personal_inflation_index.png`** — IIP vs. market index chart, 2022–2026, backing `01_Reports/personal_inflation_index.md`.

5. **`04_Charts/category_inflation_and_budget_2027.png`** and **`04_Charts/litoral_price_analysis.png`** — category inflation/2027 budget chart and the Litoral pricing deep-dive.

6. **`01_Reports/personal_inflation_index.md`** — drivers analysis: what's behind the +40.23% vs. +28.25% divergence, item-level outliers, 2026 YTD risk read.

7. **`01_Reports/category_inflation_and_budget_2027.md`** — sector-by-sector breakdown, 2027 scenario table, and a four-point risk-mitigation playbook.

8. **`01_Reports/litoral_price_analysis.md`** — six-year audit (2020–2026) of Supermercado Litoral, tracking a 58.68% general price increase.

9. **`05_Comparisons/manaira_vs_litoral_price_comparison.md`** (+ `.png`) — snapshot price comparison against Supermercados Manaíra (market-basket benchmark, not personal spend).

---

## 🧮 How the Personal Inflation Index (IIP) Works

Traditional inflation indices assume a static, nationwide "average" basket of goods. The IIP replaces this with **your actual purchase frequencies and expenditure shares**, calculated using two core steps:

### 1. The Budget Weight Vector ($W_c$)
Your total spending of **R$ 79.744,57** was mapped across five core spending categories, establishing their budgetary significance:
* **Alimentação e Bebidas (Food & Beverage)**: **86.10%** (R$ 68.656,57)
* **Transporte e Automotivo (Transportation)**: **5.73%** (R$ 4.572,39)
* **Saúde e Cuidados Pessoais (Healthcare & Personal Care)**: **4.78%** (R$ 3.808,05)
* **Serviços e Entregas (Services & Deliveries)**: **2.07%** (R$ 1.647,48)
* **Habitação e Construção (Housing & Hardware)**: **1.33%** (R$ 1.060,08)

### 2. Chained Jevons Formulation
To compare year-over-year price shifts without distortion from changing inventory or seasonal items, the index uses an **unweighted geometric mean of price ratios for overlapping items** ($\Omega$) between consecutive years, which is then chain-linked:

$$I_t = I_{t-1} 	imes \prod_{i \in \Omega} \left( rac{P_{i,t}}{P_{i,t-1}} ight)^{rac{1}{n}}$$

---

## 📈 Summary of Key Historical Trends (2022–2026)

* **The Personal vs. Market Divergence**: Your personal inflation rate — last computed at **+40.23%** — outstripped general market index inflation (**+28.25%**). This figure is **not recomputed in this refresh** (see note below); it predates the 253 new transactions.
* **Services & Deliveries**: **Taxa de Entrega** (Delivery Fee) appeared 110 times, rising from a median of **R$ 11.00** in 2022 to **R$ 18.00** in 2026 (+63.64%) — unchanged, no new delivery-fee transactions were added this round.
* **Extreme Food Outliers**: **Cenoura (Carrot) per kg** — median price by year: R$ 3.99 (2022) → R$ 9.99 (Apr/2026) → **R$ 6.99 (Sep/2026, new data point)**. The 2026 median across both points is now R$ 8.49, i.e. **+112.8%** vs. 2022 (was reported as +150.38% pre-refresh, using a single April data point).

---

## 🔮 2027 Budget Projections & Scenario Modeling

The project models three distinct scenarios for 2027 based on your baseline annualized expenditure of **R$ 17,392.84** (figure **not recomputed** in this refresh):

| Scenario | IIP Projected Rate | Market Projected Rate | 2027 Required Budget | Annual Cost Increase |
| :--- | :---: | :---: | :---: | :---: |
| **Otimista** (Optimistic) | **+2.00%** | +2.00% | **R$ 17,749.46** | +R$ 356.62 |
| **Conservador** (Base Case) | **+5.00%** | +3.50% | **R$ 18,182.82** | **+R$ 789.98** |
| **Pessimista** (Pessimistic) | **+8.00%** | +6.00% | **R$ 18,835.07** | +R$ 1,442.23 |

---

## 🛠️ Instructions for Future Maintenance & Use

1. **Logging Transactions**: Add your day-to-day receipts to the `Registro de Compras` sheet in the Excel tracker. Fill in the *Date*, *xProd* (item name), *Qty*, *Price*, *Category*, and *Merchant*.
2. **Dynamic Updates**: The category totals (`Terminal IIP`, seção 2) recalculam automaticamente via `SUMIF` assim que a planilha é aberta no Excel/LibreOffice — não precisa editar fórmulas ao adicionar linhas.
3. **Simulating Projections**: Change the scenario dropdown cell (**`I9`**) on the main dashboard tab to immediately shift between Otimista, Conservador, and Pessimista projections on the charts and metrics.

---

## 📝 Nota de Atualização (03/09/2026)

**O que foi atualizado nesta rodada** (números exatos, recalculados diretamente do `Registro de Compras`):
* Total de transações: 3.319 → **3.572** (+253)
* Total gasto: R$ 75.085,76 → **R$ 79.744,57**
* Vetor de peso por categoria (tabela acima) — todos os 5 valores recalculados
* Estatística da Cenoura (outlier de alimentação) — recalculada, ver acima

**O que foi deixado intacto, propositalmente**: a taxa de inflação acumulada (+40,23%), as taxas anuais do IIP, a comparação com o mercado (+28,25%) e a tabela de projeção de orçamento 2027. Tentei reproduzir a metodologia de Jevons encadeado documentada a partir do `Registro de Compras` bruto e também a partir do `Price_History` (base mais limpa usada no `litoral_price_analysis.md`) — nenhuma das duas reproduziu os números publicados com exatidão, o que indica que o cálculo original aplicou um critério de limpeza/seleção de itens não documentado. Prefiro deixar esses números como estão (não afetados pelos dados novos) a substituí-los por um cálculo que não bate com o método publicado. Se quiser esse recálculo feito de forma rigorosa, isso é um projeto à parte — me avise.

**Dados adicionados**:
* 238 transações do Supermercado Litoral (notas fiscais de 02/07/2026, 16/07/2026 e 02/09/2026)
* 15 transações da **Masterboi Paraíba** (CNPJ 03.721.769/0003-59, João Pessoa/PB) — data 02/09/2026, confirmada contra o recibo físico em 04/09/2026 (antes tratada como placeholder)
