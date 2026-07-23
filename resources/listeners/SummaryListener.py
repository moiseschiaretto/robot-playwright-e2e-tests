"""
SummaryListener.py

Listener do Robot Framework (API v3) que imprime um "Resumo da Execucao"
ao final da suite, no mesmo espirito da tabela usada no projeto
java-api-rest-assured-contract-tests (SummaryReportGenerator.java).

Nao substitui o console nativo do Robot Framework - aparece IMPRESSO
DEPOIS dele, como resumo final.

Uso:
    robot --outputdir results --listener resources/listeners/SummaryListener.py tests/

O nome do arquivo (SummaryListener.py) precisa bater com o nome da classe
(SummaryListener) - essa e a convencao do Robot Framework para listeners
carregados via caminho de arquivo.
"""


class SummaryListener:
    ROBOT_LISTENER_API_VERSION = 3

    def __init__(self):
        self.rows = []

    def end_test(self, data, result):
        longname_parts = result.parent.longname.split(".")
        recurso = longname_parts[1] if len(longname_parts) > 1 else longname_parts[0]

        self.rows.append(
            {
                "resource": recurso,
                "name": result.name,
                "status": result.status,
                "elapsed": result.elapsedtime,
            }
        )

    def close(self):
        if not self.rows:
            return

        total = len(self.rows)
        passou = sum(1 for r in self.rows if r["status"] == "PASS")
        falhou = total - passou

        col_recurso = 12
        col_cenario = 46
        col_status = 10
        col_ms = 8
        espaco = 2

        largura_total = col_recurso + col_cenario + col_status + col_ms + (espaco * 3)
        separador = "-" * largura_total

        print()
        print("=== RESUMO DA EXECUCAO ===")
        print(separador)
        print(
            f"{'RECURSO':<{col_recurso}}{' ' * espaco}"
            f"{'CENARIO':<{col_cenario}}{' ' * espaco}"
            f"{'STATUS':<{col_status}}{' ' * espaco}"
            f"{'MS':>{col_ms}}"
        )
        print(separador)

        modulo_atual = None
        for row in self.rows:
            if row["resource"] != modulo_atual:
                if modulo_atual is not None:
                    print(separador)
                modulo_atual = row["resource"]

            nome = row["name"]
            if len(nome) > col_cenario - 3:
                nome = nome[: col_cenario - 3] + "..."

            status_label = "PASSOU" if row["status"] == "PASS" else "FALHOU"

            print(
                f"{row['resource']:<{col_recurso}}{' ' * espaco}"
                f"{nome:<{col_cenario}}{' ' * espaco}"
                f"{status_label:<{col_status}}{' ' * espaco}"
                f"{row['elapsed']:>{col_ms}}"
            )

        print(separador)

        # Subtotal por modulo
        modulos = {}
        for row in self.rows:
            m = modulos.setdefault(row["resource"], {"total": 0, "passou": 0, "ms": 0})
            m["total"] += 1
            m["ms"] += row["elapsed"]
            if row["status"] == "PASS":
                m["passou"] += 1

        print("--- Subtotal por modulo ---")
        for nome_modulo, dados in modulos.items():
            texto_contagem = f"{dados['passou']}/{dados['total']} passou"
            print(
                f"{nome_modulo:<{col_recurso}}"
                f"{texto_contagem:<{col_cenario}}"
                f"{dados['ms']:>{col_ms}} ms"
            )

        print(separador)
        taxa_sucesso = (passou / total * 100) if total else 0
        tempo_total_ms = sum(r["elapsed"] for r in self.rows)
        print(f"Total: {total} | Passou: {passou} | Falhou: {falhou} | Taxa de sucesso: {taxa_sucesso:.1f}% | Tempo total: {tempo_total_ms} ms")
        print(separador)
        print()
