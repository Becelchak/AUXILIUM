extends Node2D

onready var craft = $Buttons/Craft
onready var location = $Buttons/Location
onready var question = $Buttons/Question
onready var menu = $Buttons/Menu

onready var itemsSelect = $ItemsInfo/Buttons2/More
onready var itemsReturn = $ItemsInfo/Buttons2/Return
onready var items1 = $ItemsInfo/Plashka/ItemsMenu/Grid/ColorRect/AllCategoris
onready var items2 = $ItemsInfo/Plashka/ItemsMenu/Grid/ColorRect/LocItems
onready var items3 = $ItemsInfo/Plashka/ItemsMenu/Grid/ColorRect/CraftItems
onready var description = $ItemsInfo/Discraption

var item_now = ""
var item_show = ""

func _ready():
	craft.set_next_scene("res://Scenes/Craft.tscn")
	craft.connect("pressed", self, "change_scene", [craft.scene_to_open])
	question.connect("pressed", self, "toggle_menu", [question])
	location.connect("pressed", self, "toggle_menu",[location])
	menu.connect("pressed", self, "toggle_menu",[menu])
	
	items1.connect("item_selected", self, "set_now_item", [items1])
	items2.connect("item_selected", self, "set_show_item", [items2])
	items3.connect("item_selected", self, "set_show_item", [items3])
	itemsSelect.connect("pressed", self, "toggle_menu",[itemsSelect])
	itemsReturn.connect("pressed", self, "toggle_menu",[itemsReturn])
		
		
func change_scene(path):
	SceneChanger.change_scene(path)

func toggle_menu(button):
	if button == location:
		var menus = get_node("/root/Ui/Locations")
		menus.visible = true
	elif button == menu:
		var menus = get_node("/root/Ui/GameMenu")
		menus.visible = true
	elif button == question:
		$Buttons.visible = false
		$Background/Saveli.visible = true
		$ItemsInfo.visible = true
	elif button == itemsSelect:
		if item_now == "Добываемые ингредиенты":
			items2.visible = true
			items3.visible = false
		elif item_now == "Рукотворные ингредиенты":
			items3.visible = true
			items2.visible = false
	elif button == itemsReturn:
		if items2.visible == true:
			items2.visible = false
		elif items3.visible == true:
			items3.visible = false
		else:
			$Background/Saveli.visible = false
			$ItemsInfo.visible = false
			$Buttons.visible = true

func set_now_item(item, items):
	item_now  = items.get_item_text(item)

func set_show_item(item, items):
	item_show  = items.get_item_text(item)
	if item_show == "Romashka":
		description.text = "Описание: Ромашка - невысокий пахучий цветок \n с белыми лепестками и желтым ядром,\n имеет целебные свойства.\n \n Получение: можно найти в огороде\n и на поляне"
	elif item_show == "Ferum":
		description.text = "Описание: Железо - минерал,\n используемый в ремесле.\n \n Получение: можно найти в шахте"
	elif item_show == "Sulfur":
		description.text = "Описание: Сера - светло-жёлтый\n порошкообразный неметалл. образует многие кислоты и соли.\n \n Получение: можно найти в шахте или на болоте"
	elif item_show == "Coal":
		description.text = "Описание: Уголь - ценнейший вид топлива\n и сырьё для химических реакций.\n Бывает каменным и древесным.\n \n Получение: Можно найти в шахте\n или в результате сжигания 3-х коряг"
	elif item_show == "GazSulf":
		description.text = "Описание: Диоксид серы - \n это газ с характерным резким запахом\n(запах загорающейся спички). \n \n Получение: сжигание серы"
	elif item_show == "WaterSulf":
		description.text = "Описание: Триоксид серы - \nбесцветная жидкость с удушливым запахом.\n \n Получение: окисление диоксида серы в колбе"
	elif item_show == "SulfAcid":
		description.text = "Описание: Серная кислота - \nтяжёлая маслянистая \nжидкость без цвета и запаха.\n \n Получение: смешивание триоксида серы с водой"
	elif item_show == "SulFer":
		description.text = "Описание: Сульфид железа II\n кристаллы чёрного цвета \nс металлическим блеском.\n \n Получение: нагревание смеси железа\nс серой 1 к 1 вколбе атанора"
	elif item_show == "HydroAcid":
		description.text = "Описание: Бесцветная, прозрачная,\n едкая жидкость, «дымящаяся» на воздухе.\n \n Получение: полить повареную соль\nконцентрированной серной кислотой"
	elif item_show == "SulfNatri":
		description.text = "Описание: Бесцветные кристаллы из которых\n получают Глауберову соль.\n \n Получение: порция поваренной соли\n нагретых в жаровне"
	elif item_show == "Chlorid_Natrium":
		description.text = "Описание: Чистый хлорид натрия представляет\n собой бесцветные кристаллы, а с примесями\n принимает различные оттенки.\n \n Получение: можно найти в шахте"
	elif item_show == "Ashes":
		description.text = "Описание: Субстацния, оставшаяся после\n сгорания чего-либо.\n \n Получение: сжечь любой лишний предмет в жаровне"
	elif item_show == "Bruh":
		description.text ="Описание: Неизвестная субстанция, получившаяся\n в результате неудачного эксперимента.\n Не представляет никакой пользы,\n во всяком случае Савелий не знает что с ней делать.\nЕсли бы вы были верующим, то назвали бы это богохульством "
	elif item_show == "Nezabudka_conc":
		description.text ="Описание: Перетертые листья незабудки,\n богаты магнием.\n \n Получение: растолочь незабудку"
	elif item_show == "Nezabudka":
		description.text ="Описание: Скромное травянистое растение\n обычно растущее в садах.\n \n Получение: можно найти в саду или на поляне"
	elif item_show == "Koriaga":
		description.text ="Описание: Обычная коряга, отпавшая от дерева.\n Пригодится чтобы топить печь или получить уголь \n \n Получение: можно найти в лесу и болоте"
	elif item_show == "Romashka_ashes":
		description.text = "Описание: зола из ромашки, из которой можно\n выделить магний.\n \n Получение: сжечь 10 ромашек"
