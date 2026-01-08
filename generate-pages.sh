#!/bin/bash

# Skrypt generujący osobne strony HTML dla każdego diagramu

SOURCE_DIR="/Users/burzychs/Websites/lexado/user-flows"
OUTPUT_DIR="/Users/burzychs/Websites/lexado-diagrams/docs"

# Funkcja generująca HTML dla diagramu
generate_html() {
    local mmd_file="$1"
    local output_file="$2"
    local title="$3"
    local role="$4"

    # Wyciągnij kod Mermaid (bez linii z %%)
    local mermaid_code=$(grep -v '^%%' "$mmd_file")

    cat > "$output_file" << EOF
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$title - Lexado</title>
    <script type="module">
        import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.esm.min.mjs';
        mermaid.initialize({
            startOnLoad: true,
            theme: 'default',
            flowchart: {
                useMaxWidth: true,
                htmlLabels: true,
                curve: 'basis'
            }
        });
    </script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            line-height: 1.6;
            color: #333;
            background: #f5f5f5;
            padding: 20px;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .back-button {
            background: rgba(255,255,255,0.2);
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: all 0.3s;
            font-weight: 500;
        }

        .back-button:hover {
            background: rgba(255,255,255,0.3);
            transform: translateX(-5px);
        }

        .header-content h1 {
            font-size: 2em;
            margin-bottom: 5px;
        }

        .role-badge {
            display: inline-block;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.9em;
            font-weight: 500;
            margin-top: 8px;
        }

        .role-klient {
            background: #e3f2fd;
            color: #1976d2;
        }

        .role-prawnik {
            background: #f3e5f5;
            color: #7b1fa2;
        }

        .role-admin {
            background: #fff3e0;
            color: #e65100;
        }

        .diagram-container {
            padding: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 500px;
        }

        .mermaid {
            width: 100%;
            text-align: center;
            display: flex;
            justify-content: center;
        }

        .mermaid svg {
            max-width: 100%;
            height: auto;
            margin: 0 auto;
        }

        footer {
            text-align: center;
            padding: 20px;
            background: #f9f9f9;
            border-top: 1px solid #e0e0e0;
            color: #666;
        }

        @media (max-width: 768px) {
            header {
                flex-direction: column;
                text-align: center;
                gap: 15px;
            }

            .diagram-container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <a href="index.html" class="back-button">← Powrót do listy</a>
            <div class="header-content">
                <h1>$title</h1>
                <span class="role-badge role-${role,,}">$role</span>
            </div>
        </header>

        <div class="diagram-container">
            <pre class="mermaid">
$mermaid_code
            </pre>
        </div>

        <footer>
            <p><strong>Lexado</strong> - Platforma łącząca klientów z prawnikami</p>
        </footer>
    </div>
</body>
</html>
EOF
}

# KLIENT
generate_html "$SOURCE_DIR/klient/01-rejestracja.mmd" "$OUTPUT_DIR/klient-01-rejestracja.html" "Rejestracja i weryfikacja konta klienta" "KLIENT"
generate_html "$SOURCE_DIR/klient/02-tworzenie-sprawy-gielda.mmd" "$OUTPUT_DIR/klient-02-tworzenie-sprawy-gielda.html" "Tworzenie sprawy przez giełdę" "KLIENT"
generate_html "$SOURCE_DIR/klient/03-bezposrednie-zapytanie.mmd" "$OUTPUT_DIR/klient-03-bezposrednie-zapytanie.html" "Bezpośrednie zapytanie do prawnika" "KLIENT"
generate_html "$SOURCE_DIR/klient/04-wspolpraca-z-prawnikiem.mmd" "$OUTPUT_DIR/klient-04-wspolpraca-z-prawnikiem.html" "Współpraca i komunikacja z prawnikiem" "KLIENT"
generate_html "$SOURCE_DIR/klient/05-edycja-anulowanie.mmd" "$OUTPUT_DIR/klient-05-edycja-anulowanie.html" "Edycja i anulowanie sprawy" "KLIENT"

# PRAWNIK
generate_html "$SOURCE_DIR/prawnik/01-rejestracja-profil.mmd" "$OUTPUT_DIR/prawnik-01-rejestracja-profil.html" "Rejestracja, weryfikacja i profil" "PRAWNIK"
generate_html "$SOURCE_DIR/prawnik/02-gielda-skladanie-ofert.mmd" "$OUTPUT_DIR/prawnik-02-gielda-skladanie-ofert.html" "Giełda i składanie ofert FROM_LAWYER" "PRAWNIK"
generate_html "$SOURCE_DIR/prawnik/03-zapytanie-od-klienta.mmd" "$OUTPUT_DIR/prawnik-03-zapytanie-od-klienta.html" "Otrzymanie zapytania TO_LAWYER" "PRAWNIK"
generate_html "$SOURCE_DIR/prawnik/04-wspolpraca-z-klientem.mmd" "$OUTPUT_DIR/prawnik-04-wspolpraca-z-klientem.html" "Współpraca z klientem" "PRAWNIK"

# ADMINISTRATOR
generate_html "$SOURCE_DIR/administrator/01-moderacja-spraw.mmd" "$OUTPUT_DIR/administrator-01-moderacja-spraw.html" "Moderacja nowych spraw" "ADMINISTRATOR"
generate_html "$SOURCE_DIR/administrator/02-moderacja-opinii.mmd" "$OUTPUT_DIR/administrator-02-moderacja-opinii.html" "Moderacja opinii klientów" "ADMINISTRATOR"
generate_html "$SOURCE_DIR/administrator/03-weryfikacja-prawnikow.mmd" "$OUTPUT_DIR/administrator-03-weryfikacja-prawnikow.html" "Weryfikacja nowych prawników" "ADMINISTRATOR"
generate_html "$SOURCE_DIR/administrator/04-zarzadzanie-uzytkownikami.mmd" "$OUTPUT_DIR/administrator-04-zarzadzanie-uzytkownikami.html" "Zarządzanie użytkownikami" "ADMINISTRATOR"
generate_html "$SOURCE_DIR/administrator/05-zarzadzanie-trescia.mmd" "$OUTPUT_DIR/administrator-05-zarzadzanie-trescia.html" "Zarządzanie treścią CMS" "ADMINISTRATOR"
generate_html "$SOURCE_DIR/administrator/07-konfiguracja-ustawien.mmd" "$OUTPUT_DIR/administrator-07-konfiguracja-ustawien.html" "Konfiguracja ustawień" "ADMINISTRATOR"

echo "✅ Wygenerowano wszystkie 15 stron HTML!"
echo "📂 Lokalizacja: $OUTPUT_DIR"