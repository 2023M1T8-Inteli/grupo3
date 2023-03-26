extends Node

var falas = {#dicionario contendo o diálogo inicial com o guia fabricio e do diamante no tutorial
	'fabricio': {
		0: "Olá, tudo bem? Prazer em conhecê-lo, eu sou o Fabrício, e trabalho na V.Tal. Estarei aqui para te auxiliar!",
		1: "Vi no seu currículo que você se formou no Inteli, um dos maiores institutos de tecnologia do mundo, e quem sabe do Brasil!",
		2: "Vejo em você um enorme potencial para alcançar o cargo mais alto da V.Tal, o Rei das Fibras, e se tornar um grande funcionário da nossa empresa.",
		3: "Entretanto, não basta ser um mestre da tecnologia. Precisamos que você também esteja alinhada aos nossos valores éticos, e pra isso precisamos que você domine nosso Código de Ética!",
		4: "Poderíamos te passar um arquivo com 50 páginas para ler, mas sabemos o quão tedioso é isso. Então, em vez disso, vamos te passar algumas tarefas, nas quais sua conduta ética será testada!",
		5: "Assim, você passará por situações que irão testar seu comportamento perante dilemas éticos e, de acordo com sua reação, você receberá pontos de reputação!",
		6: "Ao conseguir uma certa quantidade de pontos de reputação, você subirá de nível, recebendo um novo título, até chegar ao tão sonhado Rei das Fibras!",
		7: "Mas não se preocupe, todas as instruções de como fazer as tarefas serão passadas por minha colega Nathália! Ela irá te ajudar durante o seu trajeto na empresa."
	},
	'diamante': {
		0: "Use as setas no canto inferior esquerdo para se movimentar pelo mapa!",
		1: "Aperte o botão A para interagir com os personagens no jogo ",
	},
	'situacao1': {
		"nome":"Robert",
		0: {"text": "Opa, tudo bem? Eu sou o Robert, e trabalho na Boa Comunicação S.A. Reparei que você trabalha na V.Tal, e tenho uma proposta para você. Mas antes disso, para qual empresa você está indo instalar a fibra?", "nome": "Robert"},
		1: {"text": "Olá, tudo certo? Eu estou indo instalar a fibra da Rápida Conexão.", "nome": "Mr. V.Tal"},
		2: {"text": "Ah, bom saber! Então é o seguinte, eu posso te oferecer uma certa quantia, e em troca você instala a fibra da minha empresa. O que acha?", "nome": "Robert"},
		3: {
			1: {"text":"Parabéns!! Você escolheu a opção mais ética. É essencial recusar ofertas de suborno, já que fazê-lo se configura como corrupção, que é condenada no nosso código de ética.", "feedback":"res://imagens/parabens.png"},
			2: {"text":"Parabéns!! Você escolheu uma ótima opção, reconhecendo o suborno corrupto de Robert e questionando a sua atitude. Afinal, a corrupção vai contra nosso código de ética.", "feedback":"res://imagens/parabens.png"},
			3: {"text":"A família tem grande importância, mas devemos sempre ter um comportamento ético. A opção mais ética seria recusar a proposta de suborno, já que se trata de um caso de corrupção, o que vai contra nosso código de ética.", "feedback":"res://imagens/aten.png"},
			4: {"text":"Aceitar essa oferta vai totalmente contra nosso código de ética. Afinal, a proposta se trata de um suborno e, portanto, se enquadra como corrupção..", "feedback":"res://imagens/aten.png"}
		}
	},
	'situacao2':{
		0: {"text": "Ei, cara, há quanto tempo não te vejo! Vi que você foi contratado pela V.Tal, como tem sido o seu trabalho lá até então?", "nome": "???"},
		1: {"text": "Ah, oi Paulo! Tem sido bem interessante, estou aprendendo bastante. E você, ainda está trabalhando na Boa Comunicações?", "nome": "Mr. V.Tal"},
		2: {"text": "Sim, sigo firme e forte lá! Inclusive, estamos pensando em lançar um novo produto, que irá explodir a mente dos clientes. E vocês, trabalhando em algo novo?", "nome": "Paulo"},
		3: {
			1: "Esquece o trabalho cara, vamos falar sobre outra coisa! Viu o último jogo do Flamengo?",
			2: "Ah sabe como é, prefiro não comentar assuntos sobre o trabalho",
			3: "Estamos trabalhando para conseguir oferecer um pacote de 1 GB para nossos clientes",
			4: "Posso até te contar sobre o que estamos fazendo, mas tudo tem o seu preço"
		},
		4:{
			1: "Ótima escolha! Você mudou de assunto para não violar o código de ética, já que divulgar informações confidenciais de clientes é contrário aos valores da V.Tal, visto que fere nosso princípio de neutralidade",
			2: "Ótima escolha! Você se recusou a divulgar informações sigilosas de nossos clientes para a concorrência, já que fazê-lo fere nosso princípio de neutralidade .",
			3: "Apesar de estar em um momento descontraído, você não pode divulgar informações de cliente para correntes, já que isso viola nosso princípio de neutralidade",
			4: "Divulgar informações confidenciais de clientes é contrário aos valores da V.Tal, e fere nosso princípio de neutralidade e, portanto, vai contra o código de ética "
		},
		5: "Que jogo feio foi aquele! Minha bisavó jogaria futebol melhor do que aqueles caras!",
		6: "Tudo bem, te entendo! Às vezes é realmente melhor não comentar esses tipos de dados com os outros",
		7: "Ótima proposta, aposto que será uma grande inovação no mercado. E até que ela me deu uma ideia muito boa...",
		8: "Eu até estaria disposto a pagar por isso, mas estou sem dinheiro no momento! Fica para a próxima.",
		9: "Mas enfim, tenho que ir embora para ficar com a família. Até a próxima, foi um prazer te encontrar de novo!",
	},
	"situcao3":{
		0: {"text": "Olá, tudo bem? Você é o funcionário da V.Tal com quem vim fechar negócios?", "nome": "???"},
		1: {"text": "Isso mesmo! Eu vim até aqui para poder fechar o contrato com você", "nome": "Mr. V.Tal"},
		2: {"text": "Ótimo! Prazer em conhecê-lo, me chamo Letícia. E sobre a negociação, antes de fecharmos, eu gostaria de saber sobre alguns dados da Rápida Conexão.", "nome": "Letícia"},
		3: {"text": "Essas informações são essenciais para que eu possa fechar o contrato. Sei que você é uma pessoa bem influente na empresa, então será que conseguiria me fornecê-las?", "nome": "Letícia"},
		4: "",
		5: {"text": "Muito obrigada! Agora, podemos fechar o contrato sem nenhum problema", "nome": "Letícia"},
		6: {"text": "Eu preciso desses dados para poder fechar o contrato. Infelizmente, não tem outra maneira", "nome": "Letícia"},
		7: {"text": "Ok. Sem essas informações, não posso fechar o contrato. Então, nossa conversa acabou.", "nome": "Letícia"},
		8: {
			1: {"text":"Fornecer dados confidencias de nossos clientes fere o princípio de neutralidade da V.Tal e, assim, viola o código de ética.", "feedback":"res://imagens/parabens.png"},
			2: {"text":"", "feedback":"res://imagens/parabens.png"},
			3: {"text":"Parabéns! Mesmo que você não tenha conseguido fechar o contrato, você seguiu fielmente nossos valores éticos! Afinal, entregar dados dos nossos clientes fere o princípio de neutralidade da V.Tal.", "feedback":"res://imagens/aten.png"},
			4: {"text":"Mesmo que seja importante fechar negócios com um cliente, seguir a ética é sempre a prioridade. Fornecer informações de nossos clientes vai contra o princípio da neutralidade e, por isso, não deve ser feito.", "feedback":"res://imagens/aten.png"}
		},
	},
	"nathalia": {
		0: "Olá, eu sou a Nathália, e sou funcionária da Vtal! E assim como o Fabrício, te auxiliarei na sua jornada. Te ajudarei passando instruções sobre o que fazer ao longo da sua jornada, por meio dessas ligações!",
		1: "Como sua primeira tarefa, precisamos que você instale a fibra ótica de um cliente na casa do quarteirão abaixo!",
		2: "Está vendo essa exclamação verde? Ela indicará os mini jogos que você terá que fazer.",
		3: "Caso você termine um mini jogo e ainda não tenha pontos de reputação o suficiente para subir de nível, você pode refazê-los quantas vezes conseguir para acumular pontos!",
		4: "Parabéns, você conseguiu liberar uma área, e agora pode transitar livremente por ela.",
		5: "Continue assim, e você estará cada vez mais próximo de se tornar o rei da fibra.",
		6: "Para comemorar essa conquista após um árduo dia de trabalho, hoje a breja é por nossa conta!",
		7: "Vá até o bar acima da V.Tal para pegar a sua recompensa.",
		8: "Seu progresso está ótimo. Agora, conseguiu liberar a última área do mapa.",
		9: "A partir de agora tome mais cuidado com suas ações, pois quanto maior o seu cargo maior o impacto que suas ações causarão.",
		10: "Vejo que após todos estes desafios enfrentados, você se provou ético e digno de se tornar o Rei da fibra. Por fim, volte para o prédio da V.Tal para uma surpresa!",
		11: "A partir de agora você conseguirá entrar nele!",
	}
}
enum state_situations {INIT,SITUATION_1, SITUATION_2,  SITUATION_3}
enum state_areas {AREA_1, AREA_2,  AREA_3, FINAL}
enum state_person{FRENTE,TRAS,ESQUERDA,DIREITA,PARADO}
enum state_nivel{N1,N2,N3,N4,N5}

enum StateCameraClamp {
	On
	Off
}
var camera_state = StateCameraClamp.On

enum State {
	Inicio
	Situacao1
	Situacao1_finish
	Situacao2
	Situacao2_finish
	Mini_Game2
	Situacao3
	Situacao3_finish
	Mini_Game3
	Final
}

var moldura  = "res://imagens/niveis/MolduraDefensorPronta.png"


enum State_skin {
	Defensor
	General
	Rei
}

var current_state_skin = State_skin.Defensor
var current_state = State.Inicio
var call_index = 0
var cutscene_index = 0
var current_area = state_areas.AREA_1
var current_situations = state_situations.INIT
var current_person = state_person.PARADO
var current_nivel = state_nivel.N1
var nivel_index = 0
var nivel_1= false #variavel de controle de nível
var nivel_2= false #variavel de controle de nível
var nivel_3= false #variavel de controle de nível
var nivel_4= false #variavel de controle de nível
var nivel_5= false #variavel de controle de nível
var situation_2 = false
var area_1_desbl = false #variavel de controle para areas já desbloqueadas
var controle_nathalia = true # variavel de controle do dialogo inicial
var nthalia_index = 0
var posicaox = 142
var posicaoy = 201
var pontuacao = 0 #pontuação do personagem
var controle_tela = true
var teste
var posicao_bar = Vector2(169, 296)

func tela():
	controle_tela = false

func atualizar_pontuacao(x):
	pontuacao = x 
	
func atualizar_posicao(x,y):
	posicaox = x
	posicaoy = y
	
func velocity(x):
	speed = x 

var speed = 250
# Called when the node enters the scene tree for the first time.
func _ready():
	controle_nathalia = true
