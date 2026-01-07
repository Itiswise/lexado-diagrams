# Lexado - Diagramy User Flow

Interaktywna dokumentacja ścieżek użytkownika dla platformy Lexado.

## Opis

To repozytorium zawiera 16 interaktywnych diagramów przedstawiających user flow dla trzech ról użytkowników platformy Lexado:

- **Klient** (5 diagramów) - ścieżki klienta szukającego pomocy prawnej
- **Prawnik** (4 diagramy) - ścieżki prawnika świadczącego usługi
- **Administrator** (7 diagramów) - ścieżki administratora zarządzającego platformą

## Struktura

```
lexado-diagrams/
├── docs/                          # Folder GitHub Pages
│   ├── index.html                 # Strona główna z listą wszystkich diagramów
│   ├── klient-01-rejestracja.html
│   ├── klient-02-tworzenie-sprawy-gielda.html
│   ├── klient-03-bezposrednie-zapytanie.html
│   ├── klient-04-wspolpraca-z-prawnikiem.html
│   ├── klient-05-edycja-anulowanie.html
│   ├── prawnik-01-rejestracja-profil.html
│   ├── prawnik-02-gielda-skladanie-ofert.html
│   ├── prawnik-03-zapytanie-od-klienta.html
│   ├── prawnik-04-wspolpraca-z-klientem.html
│   ├── administrator-01-moderacja-spraw.html
│   ├── administrator-02-moderacja-opinii.html
│   ├── administrator-03-weryfikacja-prawnikow.html
│   ├── administrator-04-zarzadzanie-uzytkownikami.html
│   ├── administrator-05-zarzadzanie-trescia.html
│   ├── administrator-06-monitorowanie-audyt.html
│   └── administrator-07-konfiguracja-ustawien.html
├── generate-pages.sh              # Skrypt do generowania stron HTML
└── README.md                      # Ten plik
```

## Technologia

- **Mermaid.js** - renderowanie diagramów bezpośrednio w przeglądarce
- **GitHub Pages** - hosting statyczny
- **Responsive Design** - responsywny layout dostosowany do urządzeń mobilnych

## Diagramy

### 👤 Klient (5 diagramów)

1. **Rejestracja i weryfikacja konta** - proces rejestracji, weryfikacja e-mail, OAuth
2. **Tworzenie sprawy przez giełdę** - publikacja sprawy, moderacja, otrzymywanie ofert
3. **Bezpośrednie zapytanie do prawnika** - wysłanie zapytania TO_LAWYER
4. **Współpraca i komunikacja z prawnikiem** - czat, wideo, dokumenty, opinie
5. **Edycja i anulowanie sprawy** - modyfikacja i anulacja spraw

### ⚖️ Prawnik (4 diagramy)

1. **Rejestracja, weryfikacja i profil** - rejestracja, weryfikacja przez admina, profil
2. **Giełda i składanie ofert FROM_LAWYER** - przeglądanie spraw, składanie ofert
3. **Otrzymanie zapytania TO_LAWYER** - obsługa bezpośrednich zapytań
4. **Współpraca z klientem** - komunikacja, zarządzanie sprawą, dokumentacja

### 🛡️ Administrator (7 diagramów)

1. **Moderacja nowych spraw** - zatwierdzanie/odrzucanie spraw
2. **Moderacja opinii klientów** - weryfikacja i publikacja opinii
3. **Weryfikacja nowych prawników** - sprawdzanie dokumentów i uprawnień
4. **Zarządzanie użytkownikami** - edycja, blokowanie, usuwanie kont
5. **Zarządzanie treścią CMS** - strony statyczne i blog
6. **Monitorowanie i audyt** - monitoring platformy, logi bezpieczeństwa
7. **Konfiguracja ustawień** - parametry systemowe, szablony powiadomień

## Wdrożenie na GitHub Pages

### Krok 1: Inicjalizacja repozytorium

```bash
cd /Users/burzychs/Websites/lexado-diagrams
git init
git add .
git commit -m "Initial commit: Lexado user flow diagrams"
```

### Krok 2: Połączenie z GitHub

Utwórz nowe repozytorium na GitHub (np. `lexado-diagrams`), a następnie:

```bash
git remote add origin https://github.com/TWOJA-NAZWA/lexado-diagrams.git
git branch -M main
git push -u origin main
```

### Krok 3: Aktywacja GitHub Pages

1. Przejdź do ustawień repozytorium na GitHub: `Settings` → `Pages`
2. W sekcji **Source** wybierz:
   - Branch: `main`
   - Folder: `/docs`
3. Kliknij **Save**
4. Po kilku minutach strona będzie dostępna pod adresem: `https://TWOJA-NAZWA.github.io/lexado-diagrams/`

## Regeneracja stron

Jeśli wprowadzisz zmiany w plikach `.mmd` w repozytorium głównym Lexado, uruchom skrypt aby zaktualizować strony HTML:

```bash
bash generate-pages.sh
```

## Linkowanie w dokumentacji

Po wdrożeniu GitHub Pages, możesz linkować do poszczególnych diagramów w dokumentacji:

```markdown
[Diagram 1: Rejestracja klienta](https://TWOJA-NAZWA.github.io/lexado-diagrams/klient-01-rejestracja.html)
```

Lub do strony głównej z wszystkimi diagramami:

```markdown
[Wszystkie diagramy User Flow](https://TWOJA-NAZWA.github.io/lexado-diagrams/)
```

## Kolory i konwencje

- 🟢 Zielony (#90EE90) - stan początkowy / sukces
- 🔴 Różowy (#FFB6C1) - błąd / odrzucenie
- 🔵 Niebieski (#87CEEB) - neutralny stan końcowy
- 🟡 Żółty (#FFE4B5) - punkt decyzyjny

## Autor

Dokumentacja wygenerowana dla platformy **Lexado** - platforma łącząca klientów z prawnikami.