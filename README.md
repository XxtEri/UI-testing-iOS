В данном репозитории добавлены UI тесты для приложения Meowle

## Что сделать, чтобы запустить и проверить решение?

1. Склонировать репозиторий
2. В терминале в корне проекта прописать команду pod install
3. Открыть файл проекта с расширением .xcworkspace в IDE, например Xcode
4. Радоваться, что все открылось :)
5. Перейти по пути <b>./meowleUITests</b>

В папке meowleUITests лежит три директории:

- Extensions - директория с необходимыми общими расширениями
- Resources - директория с необходимыми ресурсами, например с json файлами для мокирования
- Tests - директория, в которой лежат автоматизированные тест-кейсы

## Тест-кейс 1

<details>
  <summary>Написать автотест, в котором нужно:</summary>
  
  1) открыть приложение;
  
  2) отключить автоматическую авторизацию, выставив параметры метода "openApp" как "isAuthorised: false";
  
  3) тапнуть по полю "Введите своё имя";
  
  4) ввести имя "Александр" (или любое другое имя на свой вкус);
  
  5) нажать на кнопку "Войти";
  
  6) убедиться, что открылась главная страница приложения.
</details>

Найти автоматизацию данного тест-кейса можно в файле [./meowleUITests/Tests/MeowleAuthUITests.swift](https://github.com/XxtEri/QA-Mobile-Homework22/blob/main/meowleUITests/Tests/MeowleAuthUITests.swift)

Для данного теста были созданы страницы [входа](https://github.com/XxtEri/QA-Mobile-Homework22/blob/main/meowleUITests/Tests/PageObjects/MeowleAuthPage.swift) и [поиска](https://github.com/XxtEri/QA-Mobile-Homework22/blob/main/meowleUITests/Tests/PageObjects/MeowleSearchCatPage.swift), применяя паттерн PageObject

## Задание 2

<details>
  <summary>Написать автотест, в котором нужно:</summary>
  
  1) открыть приложение;

  2) авторизоваться в приложении;
  
  3) тапнуть по кнопке "Все имена";
  
  4) при тапе на кнопку "Все имена" замокать список котиков, удалив из списка все имена, оставив в списке только три котика: "Кот №1", "Кот №2", "Кот №3".
  
  5) проверить, что после тапа по кнопке "Все имена" открылся экран со списком замоканных котиков "Кот №1", "Кот №2", "Кот №3".
</details>

Найти автоматизацию данного тест-кейса можно в файле [./blob/main/meowleUITests/Tests/MeowleSearchCatUITests.swift](https://github.com/XxtEri/QA-Mobile-Homework22/blob/main/meowleUITests/Tests/MeowleSearchCatUITests.swift)

Для данного теста была создана страница [поиска](https://github.com/XxtEri/QA-Mobile-Homework22/blob/main/meowleUITests/Tests/PageObjects/MeowleSearchCatPage.swift), применяя паттерн PageObject

## Задание 3

<details>
  <summary>Написать автотест, в котором нужно:</summary>
  
  1) открыть приложение;

  2) убедиться, что мы попали на "Гланвую" страницу;
  
  3) перейти во вкладку "Настройки";
  
  3) убедиться, что вкладка "Настройки" открыта;
  
  3) прописать accessibilityIdentifyer кнопке "Выйти из аккаунта";
  
  4) тапнуть по кнопке "Выйти из аккаунта", используя в методе тапа accessibilityIdentifyer назначенный данной кнопке на прошлом шаге;
  
  5) убедиться, что произошёл разлогин из приложения.
</details>

Найти автоматизацию данного тест-кейса можно в файле [./blob/main/meowleUITests/Tests/MeowleLogoutUITests.swift](https://github.com/XxtEri/QA-Mobile-Homework22/blob/main/meowleUITests/Tests/MeowleLogoutUITests.swift)

Для данного теста были созданы страницы [поиска](https://github.com/XxtEri/QA-Mobile-Homework22/blob/main/meowleUITests/Tests/PageObjects/MeowleSearchCatPage.swift), [входа](https://github.com/XxtEri/QA-Mobile-Homework22/blob/main/meowleUITests/Tests/PageObjects/MeowleAuthPage.swift), [отдельный page для таббара](https://github.com/XxtEri/QA-Mobile-Homework22/blob/main/meowleUITests/Tests/PageObjects/MeowleTabBarPage.swift) и [настроек](https://github.com/XxtEri/QA-Mobile-Homework22/blob/main/meowleUITests/Tests/PageObjects/MeowleSettingsPage.swift), применяя паттерн PageObject

## Задание 4

<details>
  <summary>Написать автотест, в котором нужно:</summary>
  
  1) открыть приложение;
  
  2) убедиться, что мы попали на "Гланвую" страницу;
  
  3) тапунть по поисковому полю;
  
  4) ввести в поле "Введите имя котика" имя "Батон";
  
  5) тапнуть по кнопке "Поиск";
  
  6) убедиться, что в поисковой выдаче отобразился кот "Батон";
  
  7) тапнуть по котику "Батон" в поисковой выдаче;
  
  8) в открывшейся карточке котика "Батон" в правом верхнем углу нажать лайк;
  
  9) проверить, что лайков стало на один больше (было 5, а стало 6).
</details>

Найти автоматизацию данного тест-кейса можно в файле [QA-Mobile-Homework22/blob/main/meowleUITests/Tests/MeowleCatUITests.swift](https://github.com/XxtEri/QA-Mobile-Homework22/blob/main/meowleUITests/Tests/MeowleCatUITests.swift)

Для данного теста была создана страница [поиска](https://github.com/XxtEri/QA-Mobile-Homework22/blob/main/meowleUITests/Tests/PageObjects/MeowleSearchCatPage.swift), применяя паттерн PageObject
