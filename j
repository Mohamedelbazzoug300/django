from fpdf import FPDF

# Création du PDF
class PDF(FPDF):
    def header(self):
        self.set_font("Arial", "B", 12)
        self.cell(0, 10, "Rapport de Stage - Réfrigération commerciale et climatisation", 0, 1, "C")

    def chapter_title(self, title):
        self.set_font("Arial", "B", 11)
        self.ln(5)
        self.cell(0, 10, title, 0, 1, "L")

    def chapter_body(self, body):
        self.set_font("Arial", "", 11)
        self.multi_cell(0, 10, body)
        self.ln()

# Données du rapport
rapport = {
    "Nom": "[Ton nom]",
    "Établissement": "[Nom de ton école]",
    "Entreprise": "[Nom de l’entreprise]",
    "Période": "[Dates du stage]"
}

sections = {
    "1. Introduction": "Dans le cadre de ma formation en [nom de la formation], j’ai réalisé un stage au sein de l’entreprise [Nom], spécialisée dans la réfrigération commerciale et la climatisation. L’objectif était de découvrir le métier sur le terrain et de mettre en pratique mes connaissances.",
    "2. Présentation de l’entreprise": "[Nom de l’entreprise] intervient dans l’installation, l’entretien et le dépannage de systèmes frigorifiques (chambres froides, vitrines) et de climatisation. Elle travaille avec des clients professionnels et particuliers.",
    "3. Missions réalisées": "- Observation et participation à la maintenance d’équipements.\n- Dépannage (recherche de fuites, changement de pièces).\n- Installation d’unités (tirage au vide, raccordements).\n- Contrôle des pressions et vérification des installations.",
    "4. Compétences acquises": "- Lecture de schémas frigorifiques.\n- Utilisation des outils de mesure.\n- Application des règles de sécurité.\n- Diagnostic de pannes simples.",
    "5. Bilan": "Ce stage a été très enrichissant. J’ai mieux compris le rôle du technicien frigoriste et les exigences du métier. Il a renforcé mon envie de poursuivre dans cette voie."
}

# Génération du PDF
pdf = PDF()
pdf.add_page()

pdf.set_font("Arial", "", 12)
for key, value in rapport.items():
    pdf.cell(0, 10, f"{key} : {value}", ln=True)

for title, body in sections.items():
    pdf.chapter_title(title)
    pdf.chapter_body(body)

# Sauvegarde
file_path = "/mnt/data/Rapport_Stage_Refrigeration.pdf"
pdf.output(file_path)
file_path