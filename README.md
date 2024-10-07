# Net-Eng

## Samling av skript för nätverksingenjörer

Välkommen till **Net-Eng**! Detta repository är dedikerat till att samla skriptlösningar som är användbara för nätverksingenjörer. Här hittar du skript som täcker en rad olika uppgifter, från att skapa nätverksbryggor till att övervaka och analysera nätverkstrafik. Syftet är att tillhandahålla verktyg för att effektivisera nätverksrelaterade uppgifter.

### Innehåll

- [bridge_wireshark.sh](bridge_wireshark.sh): Skript för att skapa en transparent nätverksbrygga och starta Wireshark för att analysera trafik utan att påverka klienter. När Wireshark stängs ner tas bryggan bort automatiskt.
- Fler skript kommer att läggas till löpande.

### Förutsättningar

För att använda skripten i detta repository, se till att du har installerat följande verktyg:

- **iproute2**: Hanterar nätverksinterface.
- **bridge-utils** (valfritt): Används om du vill hantera bryggor med `brctl`.
- **Wireshark**: För att fånga och analysera nätverkstrafik.

För att automatiskt installera dessa verktyg kan du köra vårt installationsskript [requirements.sh](requirements.sh).

### Installation av nödvändiga verktyg

1. Kör följande kommando för att installera alla nödvändiga paket:

    ```bash
    sudo ./requirements.sh
    ```

2. Om du vill tillåta icke-root-användare att använda Wireshark, följ anvisningarna i installationsskriptet.

### Hur man använder skripten

1. Klona detta repository:
   
    ```bash
    git clone https://github.com/ditt-användarnamn/Net-Eng.git
    ```

2. Gå till mappen med de specifika skripten och kör dem med root-behörighet:
   
    ```bash
    cd Net-Eng
    sudo ./bridge_wireshark.sh
    ```

### Planerade funktioner

- Skript för nätverksövervakning
- Automatisering av VLAN-konfiguration
- Verktyg för felsökning av nätverksproblem

### Bidra

Alla bidrag till detta repository är välkomna! Om du har ett skript som du tror kan vara användbart för andra nätverksingenjörer, skapa gärna en pull request eller öppna en issue för diskussion.

### Licens

Detta projekt är licensierat under MIT-licensen – se [LICENSE](LICENSE) för mer information.
