bool toggle = false;
List<int> selectedProducts = [];
List<String> productList = [];
int productIndex = 0;

class Products {
  Map<String, List<dynamic>> products = {
    "Immunity": [
      false,
      50.0,
      "9E5 HEALTH DRINK",
      "KAVACH PRASH",
      "SPIRULINA GOLD"
    ],
    "Dry or Wet Cough": [
      false,
      50.0,
      "COF NIL",
      "KAVACH PRASH",
      "IMMUNO 3 CAP"
    ],
    "Cold and Fever": [false, 50.0, "BELOW 37", "KAVACH PRASH", "IMMUNO 3 CAP"],
    "Cough - Diabetic Patients": [
      false,
      50.0,
      "COF NIL",
      "KAVACH PRASH",
      "IMMUNO 3 CAP"
    ],
    "Liver Infection": [
      false,
      50.0,
      "LIV a'GAIN SYRUP",
      "LIV a'GAIN CAP",
      "SPIRULINA GOLD"
    ],
    "Enlarged or Sluggish Liver": [
      false,
      50.0,
      "LIV a'GAIN SYRUP",
      "LIV a'GAIN CAP",
      "9E5 HEALTH DRINK"
    ],
    "Hepatitis B and E": [
      false,
      50.0,
      "LIV a'GAIN CAP",
      "BLOOD PURIFIER",
      "DAILY DETOX"
    ],
    "Loss of Appetite": [
      false,
      50.0,
      "LIV a'GAIN SYRUP",
      "LIV a'GAIN CAP",
      "SPIRULINA GOLD"
    ],
    "Gas, Acidity": [
      false,
      50.0,
      "LIV a'GAIN SYRUP",
      "IMMUNO 3 CAP",
      "LIV a'GAIN CAP"
    ],
    "Burning in Stomach": [
      false,
      50.0,
      "9E5 HEALTH DRINK",
      "IMMUNO 3 CAP",
      "LIV a'GAIN SYRUP"
    ],
    "Constipation": [
      false,
      50.0,
      "IMMUNO 3 CAP",
      "9E5 HEALTH DRINK",
      "LIV a'GAIN SYRUP"
    ],
    "Indigestion": [
      false,
      50.0,
      "9E5 HEALTH DRINK",
      "LIV a'GAIN SYRUP",
      "IMMUNO 3 CAP"
    ],
    "Stomach Pain": [
      false,
      50.0,
      "LIV a'GAIN SYRUP",
      "LIV a'GAIN CAP",
      "IMMUNO 3 CAP"
    ],
    "Problem with Vision/Eyes": [
      false,
      50.0,
      "IMMUNO 3 CAP",
      "PROTEIN POWDER",
      "NUTRILIFE"
    ],
    "Arthritis": [
      false,
      50.0,
      "9E5 HEALTH DRINK",
      "NO VEDNA GEL",
      "SPIRULINA GOLD"
    ],
    "Pain (Muscular or Joints) ": [
      false,
      50.0,
      "9E5 HEALTH DRINK",
      "NO VEDNA GEL",
      "PROTEIN POWDER"
    ],
    "Body ache or Headache": [
      false,
      50.0,
      "9E5 HEALTH DRINK",
      "NO VEDNA CAP",
      "NO VEDNA GEL"
    ],
    "Heart problems": [
      false,
      50.0,
      "WELL HART",
      "DAILY DETOX",
      "9E5 HEALTH DRINK"
    ],
    "Cholesterol Problems": [
      false,
      50.0,
      "WELL HART",
      "9E5 HEALTH DRINK",
      "DIABA LIFE"
    ],
    "Blood Pressure": [
      false,
      50.0,
      "WELL HART",
      "9E5 HEALTH DRINK",
      "SPIRULINA GOLD"
    ],
    "Stress Problem": [
      false,
      50.0,
      "PHYT STRESS",
      "9E5 HEALTH DRINK",
      "NUTRILIFE"
    ],
    "Lack of Concentration, Anxiety": [
      false,
      50.0,
      "9E5 HEALTH DRINK",
      "PHYT STRESS",
      "PROTEIN POWDER"
    ],
    "Difficulty to sleep, Wake up tired ": [
      false,
      50.0,
      "PHYT STRESS",
      "9E5 HEALTH DRINK",
      "FEALING SYRUP"
    ],
    "Underweight": [
      false,
      50.0,
      "NUTRILIFE",
      "PROTEIN POWDER",
      "SPIRULINA GOLD"
    ],
    "Problem in Gaining Height": [
      false,
      50.0,
      "PROTEIN POWDER",
      "NUTRILIFE",
      "KAVACH PRASH"
    ],
    "Protein Deficiency": [
      false,
      50.0,
      "PROTEIN POWDER",
      "SPIRULINA GOLD",
      "NUTRILIFE"
    ],
    "Vitamins Deficiency": [
      false,
      50.0,
      "NUTRILIFE",
      "9E5 HEALTH DRINK",
      "SPIRULINA GOLD"
    ],
    "Low Energy, Feeling Tired": [
      false,
      50.0,
      "9E5 HEALTH DRINK",
      "KAVACH PRASH",
      "FEALING SYRUP"
    ],
    "Falling ill Frequently": [
      false,
      50.0,
      "9E5 HEALTH DRINK",
      "KAVACH PRASH",
      "IMMUNO 3 CAP"
    ],
    "Thyroid (Hypothyroidism)": [
      false,
      50.0,
      "9E5 HEALTH DRINK",
      "SPIRULINA GOLD",
      "ThyHealth"
    ],
    "Cervical Problem": [
      false,
      50.0,
      "9E5 HEALTH DRINK",
      "NO VEDNA CAP",
      "NO VEDNA GEL"
    ],
    "Migraine Problem": [
      false,
      50.0,
      "9E5 HEALTH DRINK",
      "SPIRULINA GOLD",
      "KAVACH PRASH"
    ],
    "Uric acid ": [
      false,
      50.0,
      "9E5 HEALTH DRINK",
      "DIABA LIFE",
      "BLOOD PURIFIER"
    ],
    "Urinary Tract Infection": [
      false,
      50.0,
      "URI FLUSH-3",
      "9E5 HEALTH DRINK",
      "BLOOD PURIFIER"
    ],
    "Psoriasis": [
      false,
      50.0,
      "9E5 HEALTH DRINK",
      "DAILY DETOX",
      "BLOOD PURIFIER"
    ],
    "Breathlessness": [
      false,
      50.0,
      "9E5 HEALTH DRINK",
      "WELL HART",
      "NUTRILIFE"
    ],
    "Various Cancers": [
      false,
      50.0,
      "9E5 HEALTH DRINK",
      "PROTEIN POWDER",
      "SPIRULINA GOLD"
    ],
    "Diabetes": [false, 50.0, "DIABA LIFE", "DAILY DETOX", "SPIRULINA GOLD"],
    "Menstrual cycle related problem": [
      false,
      50.0,
      "WOMAN COMPANION",
      "9E5 HEALTH DRINK",
      "FEALING SYRUP"
    ],
    "Iron/Hemoglobin Deficiency": [
      false,
      50.0,
      "FEALING SYRUP",
      "9E5 HEALTH DRINK",
      "SPIRULINA GOLD"
    ],
    "Loss of libido for Men": [
      false,
      50.0,
      "MAN SHAKTIMAN",
      "9E5 HEALTH DRINK",
      "PROTEIN POWDER"
    ],
    "Baldness": [
      false,
      50.0,
      "PROTEIN POWDER",
      "MAHA BHRINGRAJ OIL",
      "SPIRULINA GOLD"
    ],
    "Hair Fall & Dandruff": [
      false,
      50.0,
      "MAHA BHRINGRAJ OIL",
      "PROTEIN POWDER",
      "SPIRULINA GOLD"
    ],
    "Skin - Pimples, Blemishes etc": [
      false,
      50.0,
      "BLOOD PURIFIER",
      "DAILY DETOX",
      "9E5 HEALTH DRINK"
    ],
    "Obesity (Overweight)": [
      false,
      50.0,
      "MELT FAT",
      "IMMUNO 3 CAP",
      "LIV a'GAIN SYRUP"
    ],
    "Kidney Infection, Kidney Stone": [
      false,
      50.0,
      "URI FLUSH-3",
      "9E5 HEALTH DRINK",
      "BLOOD PURIFIER"
    ],
    "Cuts, Burns & Wounds": [
      false,
      50.0,
      "WOUND HEALING CRM",
      "KAVACH PRASH",
      "PROTEIN POWDER"
    ],
    "Calcium Deficiency": [
      false,
      50.0,
      "NATCIUM",
      "NUTRILIFE",
      "9E5 HEALTH DRINK"
    ],
    "PCOD (Women infertility)": [
      false,
      50.0,
      "CYCLOVA",
      "WOMAN COMPANION",
      "9E5 HEALTH DRINK"
    ],
    "Skin Allergy Problems": [
      false,
      50.0,
      "ANTILERGY",
      "9E5 HEALTH DRINK",
      "BLOOD PURIFIER"
    ],
    "Asthma (Respiratory Problems)": [
      false,
      50.0,
      "AYUSHWAAS",
      "9E5 HEALTH DRINK",
      "KAVACH PRASH"
    ],
  };

  List<String> hindiQues = [
    "रोग प्रतिरोधक शक्ति",
    "शुष्क या गीली खाँसी",
    "सर्दी और बुखार",
    "खांसी - मधुमेह रोगियों",
    "जिगर संक्रमण",
    "बढ़े हुए या सुस्त यकृत",
    "हेपेटाइटिस बी और ई",
    "भूख में कमी",
    "गैस, अम्लता",
    "पेट में जलन",
    "कब्ज",
    "खट्टी डकार",
    "पेट दर्द",
    "विजन / आंखों की समस्या",
    "गठिया",
    "दर्द (पेशी या जोड़ों का दर्द)",
    "शारीरिक दर्द या सिरदर्द",
    "हृदय की समस्याएं",
    "कोलेस्ट्रॉल समस्याएं",
    "रक्त चाप",
    "तनाव समस्या",
    "एकाग्रता का अभाव, चिंता",
    "नींद न आना, थका हुआ लगना",
    "कम वजन",
    "लम्बाई कम होना",
    "प्रोटीन की कमी",
    "विटामिन की कमी",
    "कम ऊर्जा, थका हुआ लगना",
    "बीमार अक्सर गिरने",
    "थायराइड",
    "गर्दन संबंधी समस्या",
    "माइग्रेन",
    "यूरिक अम्ल",
    "मूत्र पथ के संक्रमण",
    "सोरायसिस",
    "सांस (सीढ़ियों चढ़ना, चलना)",
    "विभिन्न प्रकार के कैंसर",
    "मधुमेह, या शुगर",
    "मासिक चक्र संबंधी समस्याएं",
    "आयरन / हीमोग्लोबिन की कमी",
    "पुरुषों के लिए कामेच्छा का नुकसान होना",
    "गंजापन",
    "बालों के झड़ने और रूसी समस्या",
    "त्वचा रोग - मुंहासे, दाग-धब्बे आदि",
    "मोटापा",
    "गुर्दा संक्रमण",
    "चीरा लगना, जला हुआ और घाव",
    "कैल्शियम की कमी",
    "महिलाओं में बांझपन",
    "त्वचा रोग",
    "दमा",
  ];

  Map<String, List<String>> videos = {
    "9E5 HEALTH DRINK": [
      'https://www.youtube.com/watch?v=5slQarLheTU',
      'https://www.youtube.com/watch?v=nSWHnOqVrjw'
    ],
    "ANTILERGY": [
      'https://www.youtube.com/watch?v=KaXvvEeweaU',
      'https://www.youtube.com/watch?v=KaXvvEeweaU'
    ],
    "AYUSHWAAS": [
      'https://www.youtube.com/watch?v=vQbY9pJimII',
      'https://www.youtube.com/watch?v=vQbY9pJimII'
    ],
    "BELOW 37": [
      'https://www.youtube.com/watch?v=Dlwm4Nasxmc',
      'https://www.youtube.com/watch?v=dQMRq0qkvQo'
    ],
    "BLOOD PURIFIER": [
      'https://www.youtube.com/watch?v=_tORdR2g5Rw',
      'https://www.youtube.com/watch?v=_tORdR2g5Rw'
    ],
    "COF NIL": [
      'https://www.youtube.com/watch?v=avN_m6985Bc',
      'https://www.youtube.com/watch?v=avN_m6985Bc'
    ],
    "CYCLOVA": [
      'https://www.youtube.com/watch?v=-ojOLq69BKs',
      'https://www.youtube.com/watch?v=-ojOLq69BKs'
    ],
    "DAILY DETOX": [
      'https://www.youtube.com/watch?v=1PZmbtUA4h0',
      'https://www.youtube.com/watch?v=XykrJtbiA_0'
    ],
    "DIABA LIFE": [
      'https://www.youtube.com/watch?v=YLXfzjPQcok',
      'https://www.youtube.com/watch?v=YLXfzjPQcok'
    ],
    "FEALING SYRUP": [
      'https://www.youtube.com/watch?v=A9r7XEqotvk',
      'https://www.youtube.com/watch?v=A9r7XEqotvk'
    ],
    "IMMUNO 3 CAP": [
      'https://www.youtube.com/watch?v=elKVH9GpXIw',
      'https://www.youtube.com/watch?v=3q4lCxOupuk'
    ],
    "KAVACH PRASH": [
      'https://www.youtube.com/watch?v=avhcwTKtBpQ',
      'https://www.youtube.com/watch?v=qaBk24_zSoI'
    ],
    "LIV a'GAIN CAP": [
      'https://www.youtube.com/watch?v=ygkh0tMH3rI',
      'https://www.youtube.com/watch?v=9284dkOwHYc'
    ],
    "LIV a'GAIN SYRUP": [
      'https://www.youtube.com/watch?v=ygkh0tMH3rI',
      'https://www.youtube.com/watch?v=9284dkOwHYc'
    ],
    "MAHA BHRINGRAJ OIL": [
      'https://www.youtube.com/watch?v=_tORdR2g5Rw',
      'https://www.youtube.com/watch?v=_tORdR2g5Rw'
    ],
    "MAN SHAKTIMAN": [
      'https://www.youtube.com/watch?v=5mT-RhD-WxU',
      'https://www.youtube.com/watch?v=CZUc_HhG-Qg'
    ],
    "MELT FAT": [
      'https://www.youtube.com/watch?v=_tORdR2g5Rw',
      'https://www.youtube.com/watch?v=_tORdR2g5Rw'
    ],
    "NATCIUM": [
      'https://www.youtube.com/watch?v=_tORdR2g5Rw',
      'https://www.youtube.com/watch?v=_tORdR2g5Rw'
    ],
    "NO VEDNA CAP": [
      'https://www.youtube.com/watch?v=kJxFy8zsFGY',
      'https://www.youtube.com/watch?v=OVkc-5flctU'
    ],
    "NO VEDNA GEL": [
      'https://www.youtube.com/watch?v=kJxFy8zsFGY',
      'https://www.youtube.com/watch?v=OVkc-5flctU'
    ],
    "NUTRILIFE": [
      'https://www.youtube.com/watch?v=7ujiaYQxKeo',
      'https://www.youtube.com/watch?v=7ujiaYQxKeo'
    ],
    "PHYT STRESS": [
      'https://www.youtube.com/watch?v=c-ymmHhYmNg',
      'https://www.youtube.com/watch?v=TGGfOnLw9w8'
    ],
    "PROTEIN POWDER": [
      'https://www.youtube.com/watch?v=_tORdR2g5Rw',
      'https://www.youtube.com/watch?v=_tORdR2g5Rw'
    ],
    "SPIRULINA GOLD": [
      'https://www.youtube.com/watch?v=JDWZHgsb8U4',
      'https://www.youtube.com/watch?v=JDWZHgsb8U4'
    ],
    "ThyHealth": [
      'https://www.youtube.com/watch?v=VjnaGMN7nuk',
      'https://www.youtube.com/watch?v=VjnaGMN7nuk'
    ],
    "URI FLUSH-3": [
      'https://www.youtube.com/watch?v=5nZVIIETJbg',
      'https://www.youtube.com/watch?v=5nZVIIETJbg'
    ],
    "WELL HART": [
      'https://www.youtube.com/watch?v=xVwFOkX-dbc',
      'https://www.youtube.com/watch?v=j33Lqhkqh5A'
    ],
    "WOMAN COMPANION": [
      'https://www.youtube.com/watch?v=seacJXy4iKk',
      'https://www.youtube.com/watch?v=y8hwCE5mZ9k'
    ],
    "WOUND HEALING CRM": [
      'https://www.youtube.com/watch?v=tUaMNcj9OkI',
      'https://www.youtube.com/watch?v=3RT_iih_xAk'
    ],
  };
}
