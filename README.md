# PMC Smart Property Tax & Government Housing Portal (Pune, Maharashtra)

[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.3.4-brightgreen.svg)](https://spring.io/projects/spring-boot)
[![Java](https://img.shields.io/badge/Java-21%20LTS-orange.svg)](https://openjdk.org/projects/jdk/21/)
[![React](https://img.shields.io/badge/React-19-blue.svg)](https://react.dev/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.x-blue.svg)](https://www.typescriptlang.org/)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind%20CSS-3.4-38bdf8.svg)](https://tailwindcss.com/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-336791.svg)](https://www.postgresql.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

An enterprise-grade civic digital services platform designed for **Pune Municipal Corporation (पुणे महानगरपालिका)**. The portal unifies automated property registration, transparent versioned tax assessment, dynamic UPI payments, citizen grievance redressal with appellate escalation, and verified government housing under **MHADA Pune Board** with a 0% brokerage guarantee.

---

> ### ⚠️ Mandatory Statutory & Prototype Notice
> This platform is an independent civic software prototype engineered to demonstrate modern digital municipal governance. **It is not an official portal of the Pune Municipal Corporation (PMC) or the Maharashtra Housing and Area Development Authority (MHADA).** External integrations (IGR Maharashtra, MahaRERA, MHADA) operate via simulated services with production-grade data validation. Calculations marked as *Pending Official Verification* (such as historical 3x unassessed property penalties) represent configurable prototype simulations and do not constitute legal levies without municipal gazette notification.

---

## 🏛️ Executive Summary & Key Capabilities

1. **Automated Developer-to-Owner Property Registration:** Builders register layouts, buildings, and sold units with official Sale Deed / Index II numbers. The system proposes the official registration date as the tax commencement date for PMC Officer approval.
2. **Verified PMC Property Tax Calculation Engine:** Computes Annual Rateable Value (ARV) and itemizes municipal taxes (General, Water, Conservancy, Tree, Education, Fire, Cleaning) based on official Ready-Reckoner locality rates.
3. **40% PT40 Concession Module:** Implements the statutory 40% rebate exclusively on the General Tax component for self-occupied residential properties with verified utility/voter proof.
4. **Historical Unassessed Property Audit (3x Penalty Scrutiny):** Configurable audit queue for missing or unassessed properties with full legal basis documentation, itemized penalty breakdown, and appellate safeguards.
5. **Dynamic UPI QR Code Payment Gateway:** Instant payment settlement via dynamic UPI QR code (`upi://pay?pa=...`), signed webhook verification (HMAC-SHA256), idempotent reconciliation, and printable official digital receipts.
6. **"Challenge Your Property Tax" & Appellate Escalation:** Structured disputes against incorrect carpet areas, occupancy misclassifications, or unverified penalties, with 1-click escalation to the Deputy Municipal Commissioner.
7. **MHADA Pune Housing Portal:** Direct access to verified affordable housing schemes (EWS, LIG, MIG, HIG) across Baner, Wagholi, and Hinjewadi with a statutory **0% brokerage guarantee** and official verification badges.
8. **Bilingual Localization (English & मराठी):** 1-click instant language toggle across the entire portal interface.

---

## 🛠️ Technology Stack

| Layer | Technologies |
|---|---|
| **Backend** | Java 21 LTS, Spring Boot 3.3.4, Spring Web REST, Spring Security 6, Spring Data JPA / Hibernate 6, Flyway 10, Springdoc OpenAPI 2.6 (Swagger UI), Spring Boot Actuator, Maven |
| **Frontend** | React 19, TypeScript, Vite 8, Tailwind CSS, React Router 7, Axios, React Hook Form, Recharts, Lucide Icons, QRCode.react |
| **Database** | PostgreSQL 16 (production), H2 Database in PostgreSQL compatibility mode (development/test) |
| **DevOps & Infra** | Docker, Docker Compose, Multi-stage builds, Nginx 1.25 Alpine reverse proxy, 256-bit JWT authentication |

---

## 👥 Three Main Login Categories

The public login interface provides strictly separated authentication flows for three primary civic user types:

### 1. Citizen / Property Owner (`CITIZEN`)
- Search central property registry by PMC Property ID, CTS, or Survey number.
- Claim ownership and link properties to account.
- View official tax demand bills with itemized line items.
- Apply for the **40% PT40 Concession** with MSEDCL electricity bill proof.
- Instant tax payment via dynamic UPI QR code or NetBanking.
- Download verified digital receipts with HMAC verification QR codes.
- Lodge formal tax disputes and escalate unresolved cases to the Appellate Authority.

### 2. Developer / Builder (`DEVELOPER`)
- Register developer firm with MahaRERA number.
- Create real estate projects, building wings, and unit inventories.
- Submit sold property registrations with official Index II reference and registration date.
- Propose statutory tax commencement dates for new home buyers.
- Track PMC Tax Officer verification and approval in real time.

### 3. Government / PMC Employee (`GOVERNMENT`)
Enforces role-based municipal authorizations:
- **PMC Tax Officer (`PMC_TAX_OFFICER`):** Verifies submitted sale deeds, checks Index II validity, approves/rejects submissions, and activates local tax accounts.
- **Senior Tax Officer (`PMC_SENIOR_TAX_OFFICER`):** Audits historical unassessed properties and sanctions provisional 3x penalty cases.
- **Grievance Officer (`PMC_GRIEVANCE_OFFICER`):** Investigates contested carpet areas, conducts site inspections, and issues documented determinations.
- **Appellate Supervisor (`PMC_SUPERVISOR`):** Reviews escalated grievances and issues final binding municipal orders.
- **System Administrator (`PMC_ADMIN`):** Inspects immutable audit logs, drafts versioned tax rules, and manages ready-reckoner rate tables.

---

## 📐 Pune Property Tax Calculation Formula

$$\text{ARV} = \text{Carpet Area (sq.ft)} \times \text{Locality Ready-Reckoner Rate} \times \text{Usage Multiplier} \times \text{Construction Multiplier} \times \text{Age Factor}$$

### Tax Rates Schedule (Annual)
| Tax Component | Rate (% of ARV) | Statutory Description |
|---|---|---|
| **General Tax (सामान्य कर)** | 14.0% | Base municipal civic tax (**40% PT40 rebate applies here**) |
| **Water Benefit Tax (पाणी लाभ कर)** | 8.0% | Municipal water infrastructure cess |
| **Conservancy Tax (मलनिस्सारण कर)** | 12.0% | Sewerage and drainage maintenance |
| **Tree Cess (वृक्ष उपकर)** | 1.0% | Urban tree preservation fund |
| **Education Cess (शिक्षण उपकर)** | 5.0% | Primary civic education fund |
| **Fire Tax (अग्निशामक कर)** | 2.0% | Fire brigade equipment maintenance |
| **Special Cleaning Tax (स्वच्छता कर)** | 2.0% | Solid waste management cess |
| **Total Normal Annual Rate** | **44.0%** | Standard assessed annual liability |

---

## 🚀 Quick Start Guide

### Option A: Run with Docker Compose (Recommended)

Ensure Docker and Docker Compose are installed and running:

```bash
# 1. Clone repository
git clone https://github.com/pmc-civic/property-tax-portal.git
cd "Property Tax"

# 2. Copy environment file
cp .env.example .env

# 3. Launch PostgreSQL, Backend, and Frontend containers
docker-compose up -d --build

# 4. Access portal
# Frontend:  http://localhost
# Backend:   http://localhost:8080/api/v1
# Swagger:   http://localhost:8080/swagger-ui.html
```

---

### Option B: Local Development Setup

#### Prerequisites
- **Java 21 LTS** (e.g. Microsoft OpenJDK 21 or Eclipse Temurin 21)
- **Node.js 20+** and **npm**
- **Maven 3.9+** (or use bundled `./mvnw`)

#### Step 1: Start Backend (Spring Boot)
```bash
cd backend

# Run with bundled Maven wrapper (uses embedded H2 in PostgreSQL mode by default)
./mvnw clean spring-boot:run
```
The Spring Boot backend will start on `http://localhost:8080`. Flyway migrations and database seeders will execute automatically.

#### Step 2: Start Frontend (React + Vite)
```bash
cd frontend

# Install dependencies
npm install

# Start development server
npm run dev
```
The frontend will start on `http://localhost:5173` with an automatic API proxy to `:8080`.

---

## 🔑 Demo Login Credentials

All demo accounts are pre-seeded with password: `Password@123`

| User Type | Username | Role / Jurisdiction | Capabilities |
|---|---|---|---|
| **Citizen** | `citizen` | Property Owner (Pune) | Claim property, pay tax with UPI, apply for PT40, dispute tax |
| **Developer** | `developer` | Pune City Developers LLP | Register projects, submit sold units with Index II |
| **PMC Officer** | `taxofficer` | PMC Tax Officer | Verify developer sales, issue PMC Property IDs, activate bills |
| **Senior Officer** | `seniortaxofficer` | Senior Tax Officer | Audit unassessed properties, review 3x penalties |
| **Grievance Officer** | `grievanceofficer` | Grievance Redressal Cell | Investigate citizen complaints, grant assessment adjustments |
| **Supervisor** | `supervisor` | Appellate Authority | Adjudicate escalated disputes, issue final binding orders |
| **Administrator** | `admin` | System Administrator | View immutable audit trail, draft and approve versioned tax rules |

> **Tip:** You can also use the **1-Click Test Login Pills** directly on the Login page (`/login`) to instantly authenticate as any role!

---

## 🧪 Automated Testing

### Backend Unit & Integration Tests (JUnit 5, Mockito, SpringBootTest)
```bash
cd backend
./mvnw test
```
**Test Coverage Includes:**
- `CalculationEngineServiceTest`:
  - 40% PT40 General Tax rebate calculation.
  - Rented property denial of concession.
  - Historical 3x penalty calculation and verification disclaimer flag.
- `AuthWorkflowTest`:
  - JWT token generation, role verification, and login category mismatch validation.
- `PropertyRegistrationWorkflowTest`:
  - End-to-end integration: Developer submits sale deed -> PMC Officer verifies and approves -> Tax demand generated -> Dynamic UPI order created -> Signed webhook payment settled -> Printable official receipt generated.

### Frontend Compilation & Typecheck
```bash
cd frontend
npm run build
```
Executes TypeScript typechecking (`tsc`) and production Vite minification.

---

## 📡 REST API Directory (OpenAPI 3.0)

Interactive API documentation is available at `http://localhost:8080/swagger-ui.html`.

### Authentication
- `POST /api/v1/auth/login`: Authenticate citizen, developer, or municipal officer.
- `POST /api/v1/auth/register`: Register citizen or developer organization.
- `GET /api/v1/auth/me`: Retrieve current authenticated profile.

### Property Registry
- `GET /api/v1/properties`: Search registry by PMC ID, CTS, Survey No, Ward, or Locality.
- `GET /api/v1/properties/{id}`: Full property record with ownership transfer history.
- `POST /api/v1/properties/{id}/claim`: Claim property ownership with Index II proof.
- `GET /api/v1/properties/my-properties`: List properties associated with current user.

### Tax Assessment & Concessions
- `POST /api/v1/assessments/estimate`: Real-time simulator with Ready-Reckoner rates.
- `GET /api/v1/properties/{id}/tax-bill`: Retrieve official PMC Tax Demand Bill.
- `POST /api/v1/assessments/apply-concession`: Apply for 40% PT40 self-occupied rebate.
- `GET /api/v1/localities`: List Pune localities and Ready-Reckoner rates.
- `GET /api/v1/wards`: List 15 PMC administrative wards and zones.

### Developer Portal
- `GET /api/v1/projects`: List developer real estate layouts and units.
- `POST /api/v1/projects`: Register new RERA layout and unit inventory.
- `POST /api/v1/registrations`: Submit sold property with Index II and registration date.
- `GET /api/v1/registrations`: Track submitted sale deeds and PMC verification status.

### Government Verification & Administration
- `GET /api/v1/gov/verification-queue`: PMC Officer queue for submitted sale deeds.
- `POST /api/v1/gov/registrations/{id}/approve`: Approve sale, issue PMC ID, create tax account.
- `POST /api/v1/gov/registrations/{id}/reject`: Reject sale deed with documented grounds.
- `GET /api/v1/gov/dashboard`: Revenue stats, collection efficiency, queue backlogs.
- `GET /api/v1/gov/audit-logs`: Immutable system audit trail.

### Payments & Receipts
- `POST /api/v1/payments/orders`: Generate dynamic UPI QR order (`upi://pay?pa=...`).
- `POST /api/v1/payments/verify`: HMAC-SHA256 signed payment gateway callback.
- `GET /api/v1/payments/{receiptNo}/receipt`: Official PMC tax payment receipt.

### Grievances & Appellate Escalation
- `POST /api/v1/grievances`: Lodge tax dispute (Carpet Area, PT40, 3x Penalty).
- `GET /api/v1/grievances/{id}`: Detailed grievance timeline and officer findings.
- `POST /api/v1/grievances/{id}/escalate`: 1-click citizen escalation to Appellate Authority.
- `POST /api/v1/gov/grievances/{id}/decision`: Officer records binding decision.
- `POST /api/v1/gov/grievances/{id}/resolve-escalation`: Appellate supervisor issues final order.

### MHADA Housing
- `GET /api/v1/mhada/schemes`: Active Pune MHADA lottery schemes with 0% brokerage.
- `GET /api/v1/mhada/listings`: Affordable housing units with verification badges.

---

## 📄 License
This prototype project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
