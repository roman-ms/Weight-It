//
//  NutritionModel.swift
//  Edamam
//
//  Created by Roman Meshkov on 2/25/24.
//

import Foundation

struct NutritionModel: Codable {
    let uri: String
    let calories: Double
    let totalCO2Emissions: Double
    let co2EmissionsClass: String
    let totalWeight: Double
    let totalNutrients: TotalNutrients
    let totalDaily: TotalDaily
}

struct TotalNutrients: Codable {
    let ENERC_KCAL: NutrientInfo
    let FAT: NutrientInfo
    let FASAT: NutrientInfo
    let FATRN: NutrientInfo
    let FAMS: NutrientInfo
    let FAPU: NutrientInfo
    let CHOCDF: NutrientInfo
}

struct NutrientInfo: Codable {
    let label: String
    let quantity: Double
    let unit: String
}


struct TotalDaily: Codable {
    let ENERC_KCAL: DailyInfo
    let FAT: DailyInfo
    let FASAT: DailyInfo
    let FATRN: DailyInfo
    let FAMS: DailyInfo
    let FAPU: DailyInfo
    let CHOCDF: DailyInfo
}

struct DailyInfo: Codable {
    let label: String
    let quantity: Double
    let unit: String
}


// JSON File example:
/*
 {
 "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_cfe25efcfe384bfabbe83a780886e591",
 "calories": 141,
 "totalCO2Emissions": 2080.103777771511,
 "co2EmissionsClass": "E",
 "totalWeight": 100,
 "dietLabels": [
 "LOW_CARB",
 "LOW_SODIUM"
 ],
 "healthLabels": [
 "SUGAR_CONSCIOUS",
 "LOW_POTASSIUM",
 "KIDNEY_FRIENDLY",
 "KETO_FRIENDLY",
 "GLUTEN_FREE",
 "WHEAT_FREE",
 "EGG_FREE",
 "PEANUT_FREE",
 "TREE_NUT_FREE",
 "SOY_FREE",
 "FISH_FREE",
 "SHELLFISH_FREE",
 "PORK_FREE",
 "RED_MEAT_FREE",
 "CRUSTACEAN_FREE",
 "CELERY_FREE",
 "MUSTARD_FREE",
 "SESAME_FREE",
 "LUPINE_FREE",
 "MOLLUSK_FREE",
 "ALCOHOL_FREE"
 ],
 "cautions": [
 "MILK",
 "SULFITES",
 "FODMAP"
 ],
 "totalNutrients": {
 "ENERC_KCAL": {
 "label": "Energy",
 "quantity": 141.1062986822303,
 "unit": "kcal"
 },
 "FAT": {
 "label": "Total lipid (fat)",
 "quantity": 8.54314944206133,
 "unit": "g"
 },
 "FASAT": {
 "label": "Fatty acids, total saturated",
 "quantity": 3.127072353142089,
 "unit": "g"
 },
 "FATRN": {
 "label": "Fatty acids, total trans",
 "quantity": 0.04191275427355602,
 "unit": "g"
 },
 "FAMS": {
 "label": "Fatty acids, total monounsaturated",
 "quantity": 3.253481481900906,
 "unit": "g"
 },
 "FAPU": {
 "label": "Fatty acids, total polyunsaturated",
 "quantity": 1.4468789428065292,
 "unit": "g"
 },
 "CHOCDF": {
 "label": "Carbohydrate, by difference",
 "quantity": 6.880738732882683,
 "unit": "g"
 },
 "CHOCDF.net": {
 "label": "Carbohydrates (net)",
 "quantity": 5.697038030350888,
 "unit": "g"
 },
 "FIBTG": {
 "label": "Fiber, total dietary",
 "quantity": 1.1837007025317943,
 "unit": "g"
 },
 "SUGAR": {
 "label": "Sugars, total including NLEA",
 "quantity": 1.7702886822474113,
 "unit": "g"
 },
 "SUGAR.added": {
 "label": "Sugars, added",
 "quantity": 0.265693242847278,
 "unit": "g"
 },
 "PROCNT": {
 "label": "Protein",
 "quantity": 9.430514391171036,
 "unit": "g"
 },
 "CHOLE": {
 "label": "Cholesterol",
 "quantity": 34.76920233181958,
 "unit": "mg"
 },
 "NA": {
 "label": "Sodium, Na",
 "quantity": 158.469634465749,
 "unit": "mg"
 },
 "CA": {
 "label": "Calcium, Ca",
 "quantity": 24.5646263713101,
 "unit": "mg"
 },
 "MG": {
 "label": "Magnesium, Mg",
 "quantity": 21.96487471386095,
 "unit": "mg"
 },
 "K": {
 "label": "Potassium, K",
 "quantity": 217.21161810506476,
 "unit": "mg"
 },
 "FE": {
 "label": "Iron, Fe",
 "quantity": 1.046823567642827,
 "unit": "mg"
 },
 "ZN": {
 "label": "Zinc, Zn",
 "quantity": 0.7203040173920138,
 "unit": "mg"
 },
 "P": {
 "label": "Phosphorus, P",
 "quantity": 101.35543912429586,
 "unit": "mg"
 },
 "VITA_RAE": {
 "label": "Vitamin A, RAE",
 "quantity": 35.17633420471548,
 "unit": "µg"
 },
 "VITC": {
 "label": "Vitamin C, total ascorbic acid",
 "quantity": 8.245859749801348,
 "unit": "mg"
 },
 "THIA": {
 "label": "Thiamin",
 "quantity": 0.08209544053674603,
 "unit": "mg"
 },
 "RIBF": {
 "label": "Riboflavin",
 "quantity": 0.08691604549836564,
 "unit": "mg"
 },
 "NIA": {
 "label": "Niacin",
 "quantity": 3.4833663414767218,
 "unit": "mg"
 },
 "VITB6A": {
 "label": "Vitamin B-6",
 "quantity": 0.2597253738012247,
 "unit": "mg"
 },
 "FOLDFE": {
 "label": "Folate, DFE",
 "quantity": 16.621916893252177,
 "unit": "µg"
 },
 "FOLFD": {
 "label": "Folate, food",
 "quantity": 12.486520990787723,
 "unit": "µg"
 },
 "FOLAC": {
 "label": "Folic acid",
 "quantity": 2.482888548758939,
 "unit": "µg"
 },
 "VITB12": {
 "label": "Vitamin B-12",
 "quantity": 0.1799430758543811,
 "unit": "µg"
 },
 "VITD": {
 "label": "Vitamin D (D2 + D3)",
 "quantity": 0.0932276747331097,
 "unit": "µg"
 },
 "TOCPHA": {
 "label": "Vitamin E (alpha-tocopherol)",
 "quantity": 0.6858292642188285,
 "unit": "mg"
 },
 "VITK1": {
 "label": "Vitamin K (phylloquinone)",
 "quantity": 6.162167065127841,
 "unit": "µg"
 },
 "WATER": {
 "label": "Water",
 "quantity": 73.17741302576646,
 "unit": "g"
 }
 },
 "totalDaily": {
 "ENERC_KCAL": {
 "label": "Energy",
 "quantity": 7.0553149341115144,
 "unit": "%"
 },
 "FAT": {
 "label": "Fat",
 "quantity": 13.143306833940507,
 "unit": "%"
 },
 "FASAT": {
 "label": "Saturated",
 "quantity": 15.635361765710446,
 "unit": "%"
 },
 "CHOCDF": {
 "label": "Carbs",
 "quantity": 2.2935795776275607,
 "unit": "%"
 },
 "FIBTG": {
 "label": "Fiber",
 "quantity": 4.734802810127177,
 "unit": "%"
 },
 "PROCNT": {
 "label": "Protein",
 "quantity": 18.86102878234207,
 "unit": "%"
 },
 "CHOLE": {
 "label": "Cholesterol",
 "quantity": 11.589734110606527,
 "unit": "%"
 },
 "NA": {
 "label": "Sodium",
 "quantity": 6.602901436072875,
 "unit": "%"
 },
 "CA": {
 "label": "Calcium",
 "quantity": 2.45646263713101,
 "unit": "%"
 },
 "MG": {
 "label": "Magnesium",
 "quantity": 5.229732074728798,
 "unit": "%"
 },
 "K": {
 "label": "Potassium",
 "quantity": 4.621523789469463,
 "unit": "%"
 },
 "FE": {
 "label": "Iron",
 "quantity": 5.815686486904594,
 "unit": "%"
 },
 "ZN": {
 "label": "Zinc",
 "quantity": 6.5482183399273985,
 "unit": "%"
 },
 "P": {
 "label": "Phosphorus",
 "quantity": 14.47934844632798,
 "unit": "%"
 },
 "VITA_RAE": {
 "label": "Vitamin A",
 "quantity": 3.90848157830172,
 "unit": "%"
 },
 "VITC": {
 "label": "Vitamin C",
 "quantity": 9.162066388668164,
 "unit": "%"
 },
 "THIA": {
 "label": "Thiamin (B1)",
 "quantity": 6.841286711395504,
 "unit": "%"
 },
 "RIBF": {
 "label": "Riboflavin (B2)",
 "quantity": 6.6858496537204335,
 "unit": "%"
 },
 "NIA": {
 "label": "Niacin (B3)",
 "quantity": 21.77103963422951,
 "unit": "%"
 },
 "VITB6A": {
 "label": "Vitamin B6",
 "quantity": 19.978874907786512,
 "unit": "%"
 },
 "FOLDFE": {
 "label": "Folate equivalent (total)",
 "quantity": 4.155479223313044,
 "unit": "%"
 },
 "VITB12": {
 "label": "Vitamin B12",
 "quantity": 7.497628160599214,
 "unit": "%"
 },
 "VITD": {
 "label": "Vitamin D",
 "quantity": 0.6215178315540647,
 "unit": "%"
 },
 "TOCPHA": {
 "label": "Vitamin E",
 "quantity": 4.57219509479219,
 "unit": "%"
 },
 "VITK1": {
 "label": "Vitamin K",
 "quantity": 5.135139220939867,
 "unit": "%"
 }
 },
 "ingredients": [
 {
 "text": "100g Chicken curry",
 "parsed": [
 {
 "quantity": 100,
 "measure": "gram",
 "foodMatch": "Chicken curry",
 "food": "Chicken Curry",
 "foodId": "food_bvtr6y9bu7ntw3awu621ebcgvghh",
 "weight": 100,
 "retainedWeight": 100,
 "nutrients": {
 "VITD": {
 "label": "Vitamin D (D2 + D3), International Units",
 "quantity": 3.9924149838017486,
 "unit": "IU"
 },
 "FATRN": {
 "label": "Fatty acids, total trans",
 "quantity": 0.04191275427355603,
 "unit": "g"
 },
 "ENERC_KCAL": {
 "label": "Energy",
 "quantity": 141.1062986822303,
 "unit": "kcal"
 },
 "FASAT": {
 "label": "Fatty acids, total saturated",
 "quantity": 3.127072353142089,
 "unit": "g"
 },
 "VITA_RAE": {
 "label": "Vitamin A, RAE",
 "quantity": 35.17633420471548,
 "unit": "µg"
 },
 "PROCNT": {
 "label": "Protein",
 "quantity": 9.430514391171036,
 "unit": "g"
 },
 "TOCPHA": {
 "label": "Vitamin E (alpha-tocopherol)",
 "quantity": 0.6858292642188285,
 "unit": "mg"
 },
 "CHOLE": {
 "label": "Cholesterol",
 "quantity": 34.76920233181958,
 "unit": "mg"
 },
 "CHOCDF": {
 "label": "Carbohydrate, by difference",
 "quantity": 6.880738732882683,
 "unit": "g"
 },
 "FAT": {
 "label": "Total lipid (fat)",
 "quantity": 8.54314944206133,
 "unit": "g"
 },
 "FIBTG": {
 "label": "Fiber, total dietary",
 "quantity": 1.1837007025317943,
 "unit": "g"
 },
 "RIBF": {
 "label": "Riboflavin",
 "quantity": 0.08691604549836564,
 "unit": "mg"
 },
 "THIA": {
 "label": "Thiamin",
 "quantity": 0.08209544053674604,
 "unit": "mg"
 },
 "FAPU": {
 "label": "Fatty acids, total polyunsaturated",
 "quantity": 1.4468789428065292,
 "unit": "g"
 },
 "NIA": {
 "label": "Niacin",
 "quantity": 3.4833663414767218,
 "unit": "mg"
 },
 "VITC": {
 "label": "Vitamin C, total ascorbic acid",
 "quantity": 8.245859749801348,
 "unit": "mg"
 },
 "FAMS": {
 "label": "Fatty acids, total monounsaturated",
 "quantity": 3.253481481900906,
 "unit": "g"
 },
 "VITB6A": {
 "label": "Vitamin B-6",
 "quantity": 0.2597253738012247,
 "unit": "mg"
 },
 "VITB12": {
 "label": "Vitamin B-12",
 "quantity": 0.1799430758543811,
 "unit": "µg"
 },
 "SUGAR.added": {
 "label": "Sugars, added",
 "quantity": 0.265693242847278,
 "unit": "g"
 },
 "WATER": {
 "label": "Water",
 "quantity": 73.17741302576646,
 "unit": "g"
 },
 "K": {
 "label": "Potassium, K",
 "quantity": 217.21161810506476,
 "unit": "mg"
 },
 "P": {
 "label": "Phosphorus, P",
 "quantity": 101.35543912429586,
 "unit": "mg"
 },
 "NA": {
 "label": "Sodium, Na",
 "quantity": 158.469634465749,
 "unit": "mg"
 },
 "ZN": {
 "label": "Zinc, Zn",
 "quantity": 0.7203040173920138,
 "unit": "mg"
 },
 "SUGAR": {
 "label": "Sugars, total including NLEA",
 "quantity": 1.7702886822474113,
 "unit": "g"
 },
 "CA": {
 "label": "Calcium, Ca",
 "quantity": 24.5646263713101,
 "unit": "mg"
 },
 "MG": {
 "label": "Magnesium, Mg",
 "quantity": 21.96487471386095,
 "unit": "mg"
 },
 "FE": {
 "label": "Iron, Fe",
 "quantity": 1.046823567642827,
 "unit": "mg"
 },
 "VITK1": {
 "label": "Vitamin K (phylloquinone)",
 "quantity": 6.162167065127841,
 "unit": "µg"
 },
 "FOLFD": {
 "label": "Folate, food",
 "quantity": 12.48652099078772,
 "unit": "µg"
 },
 "FOLAC": {
 "label": "Folic acid",
 "quantity": 2.482888548758939,
 "unit": "µg"
 },
 "FOLDFE": {
 "label": "Folate, DFE",
 "quantity": 16.621916893252177,
 "unit": "µg"
 }
 },
 "measureURI": "http://www.edamam.com/ontologies/edamam.owl#Measure_gram",
 "status": "OK"
 }
 ]
 }
 ],
 "totalNutrientsKCal": {
 "ENERC_KCAL": {
 "label": "Energy",
 "quantity": 140,
 "unit": "kcal"
 },
 "PROCNT_KCAL": {
 "label": "Calories from protein",
 "quantity": 37,
 "unit": "kcal"
 },
 "FAT_KCAL": {
 "label": "Calories from fat",
 "quantity": 76,
 "unit": "kcal"
 },
 "CHOCDF_KCAL": {
 "label": "Calories from carbohydrates",
 "quantity": 27,
 "unit": "kcal"
 }
 }
 }
 */
