# Namespace and PreverenceKey
Красивый полет кнопки двумя разными способами

<img src="https://github.com/ihValery/NamespaceAndPreverenceKey/blob/main/Images/example1.gif?raw=true"></a>
<img src="https://github.com/ihValery/NamespaceAndPreverenceKey/blob/main/Images/example2.gif?raw=true"></a>
<img src="https://github.com/ihValery/NamespaceAndPreverenceKey/blob/main/Images/example3.gif?raw=truef"></a>
<img src="https://github.com/ihValery/NamespaceAndPreverenceKey/blob/main/Images/example4.gif?raw=truef"></a>
<img src="https://github.com/ihValery/NamespaceAndPreverenceKey/blob/main/Images/example5.gif?raw=truef"></a>

- Multiple Namespaces + Color Namespace 
    - Вместо того, чтобы изменять все идентификаторы, мы просто изменяете одно пространство имен (одно представление может обслуживать свою геометрию с более чем одним значением id).

- AnchorPoint
    - 9 позиций и один Namespace

- Namespace (прикольно для пиццы)
    - очень все интуинтиыно )))

- PreverenceKey
    - узнаем размеры одной вкладки и ее смещение
    - а потом манипулируем этими данными
    - добиваемся прекрасного эффекта для таббара
    - наигрался а потом нашел лучшую статью ))) https://swiftui-lab.com/communicating-with-the-view-tree-part-1/
    
    
- Краткое слово в UnitPoint
    - В большинстве примеров при использовании UnitPoint мы указываем предопределенные значения (.topLeading, .center, .bottom и т.д.). Это может ввести вас в заблуждение, заставив думать, что UnitPoint — это перечисление, но это не так. Это структура с некоторыми статическими переменными для предопределенных точек, таких как:
        - .topLeading = UnitPoint(x: 0, y: 0)
        - .bottomTrailing = UnitPoint(x: 1, y:0)
        - .center = UnitPoint(x: 0.5, y: 0.5)
    - Это означает, что вы действительно можете определить свой собственный UnitPoint, скажем: UnitPoint(x: -1.5, y: 0.5). Обратите внимание, что вы также можете использовать отрицательные числа и превышать диапазон от 0,0 до 1,0, если это имеет смысл.
