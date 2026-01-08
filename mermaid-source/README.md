# Mermaid Source Files

This directory contains the extracted Mermaid diagram source code from the HTML files in the `docs` directory.

## Files

Each `.mmd` file corresponds to an HTML file in the docs directory and contains the pure Mermaid diagram code.

### Client Flows (Klient)
- `klient-01-rejestracja.mmd` - Client registration and verification
- `klient-02-tworzenie-sprawy-gielda.mmd` - Creating a case in the marketplace
- `klient-03-bezposrednie-zapytanie.mmd` - Direct inquiry to a lawyer
- `klient-04-wspolpraca-z-prawnikiem.mmd` - Collaboration with a lawyer
- `klient-05-edycja-anulowanie.mmd` - Editing and canceling cases

### Lawyer Flows (Prawnik)
- `prawnik-01-rejestracja-profil.mmd` - Lawyer registration and profile
- `prawnik-02-gielda-skladanie-ofert.mmd` - Marketplace and submitting offers
- `prawnik-03-zapytanie-od-klienta.mmd` - Responding to client inquiries
- `prawnik-04-wspolpraca-z-klientem.mmd` - Collaboration with client

### Administrator Flows
- `administrator-01-moderacja-spraw.mmd` - Case moderation
- `administrator-02-moderacja-opinii.mmd` - Review moderation
- `administrator-03-weryfikacja-prawnikow.mmd` - Lawyer verification
- `administrator-04-zarzadzanie-uzytkownikami.mmd` - User management
- `administrator-05-zarzadzanie-trescia.mmd` - Content management
- `administrator-06-monitorowanie-audyt.mmd` - Monitoring and audit
- `administrator-07-konfiguracja-ustawien.mmd` - Configuration and settings

## Usage

You can edit these `.mmd` files directly using any text editor. To update the HTML files with your changes, you'll need to replace the content between the `<pre class="mermaid">` tags in the corresponding HTML file.

## Editing Tips

- Use the [Mermaid Live Editor](https://mermaid.live/) to preview your changes
- Each diagram follows the flowchart TD (top-down) format
- Maintain consistent styling for similar node types
