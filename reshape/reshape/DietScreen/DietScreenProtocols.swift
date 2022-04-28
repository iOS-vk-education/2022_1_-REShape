//
//  DietScreenProtocols.swift
//  reshape
//
//  Created by Veronika on 24.03.2022.
//  
//

import Foundation

protocol DietScreenModuleInput {
	var moduleOutput: DietScreenModuleOutput? { get }
}

protocol DietScreenModuleOutput: AnyObject {
}

// Команды управляющие вьюхой
protocol DietScreenViewInput: AnyObject {
    // Управление таблицей
    func showCells(for indexPaths: [IndexPath])
    func hideCells(for indexPaths: [IndexPath])
    func reloadTableView()
    func reloadTableSections(atSection sections: IndexSet)
    func uncheckedMeal(_ state: Bool, forIndexPath indexPath: IndexPath)
}

protocol DietScreenViewOutput: AnyObject {
    // Запросы от таблицы
    func requestNumOfDays()
    
    // Геттеры
    func getNumOfDay() -> Int
    func getNumOfRows(inSection section: Int) -> Int
    
    func getCellType(from indexPath: IndexPath) -> MealsType
    func getCellDisclosure(forMeal meal: MealsType, atSection section: Int) -> DisclosureState
    
    func getMealState(forMeal meal: MealsType, atIndex indexPath: IndexPath) -> Bool
    func getMealName(forMeal meal: MealsType, atIndex indexPath: IndexPath) -> String
    func getMealCalories(forMeal meal: MealsType, atIndex indexPath: IndexPath) -> Double
    
    // Обработчики нажатий на ячейки
    func clickedDiet(_ state: DisclosureState, mealType celltype: MealsType, inSection section: Int)
    func clickedMeal(_ state: Bool, forMeal celltype: MealsType, atIndex indexPath: IndexPath)
}

protocol DietScreenInteractorInput: AnyObject {
    // Запросы от презентера
    func requestNumOfDays()
    
    // Геттеры
    func getCellInfo(forMeal meal: MealsType, atSection section: Int) -> CellInfo
    func getMealData(withID id: Int, forMeal meal: MealsType, atSection section: Int) -> MealData
    func getMealCount(forMeal meal: MealsType, atSection section: Int) -> Int
    
    // Изменение состояния базы данных
    func changeDisclosure(toState state: DisclosureState, forMeal meal: MealsType, atSection section: Int)
    func changeMealState(toState state: Bool, withID id: Int, forMeal meal: MealsType, atSection section: Int)
}

protocol DietScreenInteractorOutput: AnyObject {
    // Ответы на запросы презентера или интерактора
    func updateMealData(forMeal meal: MealsType, atSection section: Int)
    func updateNumOfDays(_ days: Int)
    func undoChangeMealState(_ state: Bool, withID id: Int, forMeal meal: MealsType, atSection section: Int)
}

protocol DietScreenRouterInput: AnyObject {
}
