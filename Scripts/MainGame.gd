extends Node2D

onready var craft = $Buttons/Craft
onready var location = $Buttons/Location
onready var question = $Buttons/Question
onready var menu = $Buttons/Menu

onready var requestSugar = $ItemsInfo/Buttons2/Request
onready var itemsSelect = $ItemsInfo/Buttons2/More
onready var itemsReturn = $ItemsInfo/Buttons2/Return
onready var items1 = $ItemsInfo/Plashka/ItemsMenu/Grid/ColorRect/AllCategoris
onready var items2 = $ItemsInfo/Plashka/ItemsMenu/Grid/ColorRect/LocItems
onready var items3 = $ItemsInfo/Plashka/ItemsMenu/Grid/ColorRect/CraftItems
onready var items4 = $ItemsInfo/Plashka/ItemsMenu/Grid/ColorRect/Progress
onready var description = $ItemsInfo/Discraption

onready var player = get_node("/root/PlayerData")

var item_now = ""
var item_show = ""

func _ready():
	if player.Is_last_quest:
		requestSugar.visible = true
	craft.set_next_scene("res://Scenes/Craft.tscn")
	craft.connect("pressed", self, "change_scene", [craft.scene_to_open])
	question.connect("pressed", self, "toggle_menu", [question])
	location.connect("pressed", self, "toggle_menu",[location])
	menu.connect("pressed", self, "toggle_menu",[menu])
	
	items1.connect("item_selected", self, "set_now_item", [items1])
	items2.connect("item_selected", self, "set_show_item", [items2])
	items3.connect("item_selected", self, "set_show_item", [items3])
	itemsSelect.connect("pressed", self, "toggle_menu",[itemsSelect])
	requestSugar.connect("pressed", self, "toggle_menu",[requestSugar])
	itemsReturn.connect("pressed", self, "toggle_menu",[itemsReturn])
		
		
func change_scene(path):
	SceneChanger.change_scene(path)

func toggle_menu(button):
	if button == location:
		var menus = get_node("/root/Ui/Locations")
		menus.visible = true
	elif button == requestSugar:
		player.inventory["Sugar"] = [1,5]
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
			items4.visible = false
		elif item_now == "Рукотворные ингредиенты (Растворы)":
			items3.visible = true
			items2.visible = false
			items4.visible = false
		elif item_now == "Прогресс испытания":
			items4.visible = true
			items3.visible = false
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
		description.text = "Описание: Бесцветные кристаллы из которых\n получают Глауберову соль.\n \n Получение: из порции поваренной соли\n нагретой в жаровне"
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
		description.text = "Описание: Зола из ромашки, из которой можно\n выделить магний.\n \n Получение: сжечь 10 ромашек"
	elif item_show == "Wood_conc":
		description.text = "Описание: Измельченая древесина, используется\n и как топливо и как сырье в производстве.\n \n Получение: растолочь корягу в ступке"
	elif item_show == "Landish":
		description.text = "Описание: Ландыш - травянистое цветковое растение,\n содержит вещества для стимуляции расширения артерий.\n Ядовит \n \n Получение: можно найти на поляне "
	elif item_show == "Landish_ashes":
		description.text = "Описание: Зола из ландыша, в которой можно\n выделить фосфор.\n \n Получение: сжечь 10 ландышей"
	elif item_show == "Celuloza":
		description.text = "Описание: Целлюлоза - белое твёрдое, стойкое вещество,\n не разрушается при нагревании и является горючим.\n \n Получение: предварительно нагреть в атаноре воду,\n после в произвольном порядке добавляя в нее две порции\n древесной щепы и одну порцию раствора сульфита натрия "
	elif item_show == "Nezabudka_Infusion":
		description.text = "Описание: Отвар из незабудки - средство народной медицины,\n помогающее от кожной сыпи и зуда. \n \n Получение: две порции измельченной незабудки смешать\n с водой и поварить некоторое время."
	elif item_show == "Romashka_Infusion":
		description.text = "Описание: Отвар из ромашки - средство от бессоницы и мигрени,\n иногда от простуды и боли в зубах.\n \n Получение: три порции измельченной ромашки смешать\n с водой и поварить некоторое время"
	elif item_show == "Zemlianika":
		description.text = "Описание: Земляника - травянистое растение,\n чьи плоды произрастают в одноименных ягодах.\n Хорошее лакомство любому кто зайдет в лес.\n \n Получение: можно найти в лесу, если вам это требуется"
	elif item_show == "Limon": 
		description.text = "Описание: Лимон - растение рода Цитрус.\n Произростает в субтропическом климате,\n а потому в местных краях редкий гость. \n \n Получение: может произростать в огороде,\n если Савелий хорошо его попросит."
	elif item_show == "Ferum_conc":
		description.text = "Описание: Смесь измельченного железа.\n \n Получение: растолочь кусок железа в ступке,\n насколько хватит сил."
	elif item_show == "Juice":
		description.text = "Описание: Компот - сок из ягоды или фруктов,\n смешанных в кипящей воде с последующим остыванием. \nПолучение: строго заранее налить воды и подогреть ее,\nпосле чего подлить лимонной кислоты, а уже следом сироп,\nполученный из варки необходимых ягод или фруктов.\nВ конце засыпать сахар и перемешать."
	elif item_show == "Limon_acid":
		description.text = "Описание: Лимонная кислота - универсальное средство,\n нашедшее применение в кулинарии.\n Кислота средней силы.\n \n Получение: растолочь лимон"
	elif item_show == "Zemlianika_sirop":
		description.text = "Описание: Сироп из земляники - липкая жидкость,\n схожая с вареньем, но более жидкая и менее сладкая.\n \n Получение: положить в горячую воду не менее\n 8 порций земляники, перемешивая их до получения\n однородной массы."
	elif item_show == "Sugar": 
		description.text = "Описание: Сахар - съестной продукт,\n в основе которого лежит сахароза.\n \n Получение: растение из которого принято его получать\n не растет даже на живом огороде,\n поэтому Савелий советует брать из его запасов."
	elif item_show == "Landish_conc":
		description.text = "Описание - перетертые листья ландыша, богаты фосфором.\n \n Получение: растолочь ландыш"
	elif item_show == "Landish_Infusion":
		description.text = "Описание: Отвар из ландыша - средство от боли в сердце.\n Ввиду наличия яда в самом ландыше,\n данный отвар без нужной дозировки станет ядом.\n \n Получение: в заранее нагретой воде размешать\n концентрат ландыша и его золу"
