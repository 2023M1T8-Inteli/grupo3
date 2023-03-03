extends Node

var falas = {#dicionario contendo o diálogo inicial com o guia fabricio e do diamante no tutorial
	'fabricio': {
		0: 'Olá, tudo bem? Prazer em conhecê-lo, eu sou o Fabrício, e trabalho na V.Tal. Estarei aqui para te auxiliar!',
		1: 'Será delegado a você algumas tarefas para serem cumpridas. Entretanto, haverão alguns desafios que irão tentar dificultar o seu trajeto.',
		2: "Eles se resumem a conflitos que testarão o seu comportamento ético perante operações da empresa.",
		3: "Para passar por eles com êxito, basta escolher a opção que mais condiz com nosso código de ética!",
		4: "Conforme você acerta as respostas, sua reputação aumentará, e com isso conseguirá subir de nível, alcançando cargos cada vez mais altos!"
	},
	'diamante': {
		0: 'Use as setas no canto inferior esquerdo para se movimentar pelo mapa!',
		1: 'Clique no botão “X” para abrir o minimapa. Ele irá mostrar sua localização na cidade e seu próximo destino',
		2: 'No canto da tela, você pode clicar no botão “Y” para ligar ou desligar o som do jogo.'
	},
	'situacao1': {
		0: "Boa tarde, meu nome é Robert e eu trabalho na Claro, vi que você trabalha na V.tal para qual empresa você está indo instalar a fibra?",
		1: "Estou indo instalar da Tim",
		2: "Eu te pago uma grana se você instalar essa fibra da minha empresa",
		3: {
			1: "Parabéns!! Você escolheu a opção mais ética",
			2: "Parabéns!! Você escolheu uma ótima opção, agindo plenamente de acordo com o código de ética da empresa. Entretanto, faltou reportar a situação para o compliance, para que possamos ter um controle da situação!",
			3: "A família tem grande importância, mas devemos sempre ter um comportamento ético. A opção mais ética seria recusar a proposta e reportar ao compliance, já que se trata de uma tentativa de suborno",
			4: "A opção mais ética seria recusar a proposta e reportar ao compliance, já que se trata de uma tentativa de suborno, portanto, aceitar o dinheiro seria totalmente contra o código de ética da empresa."
		}
	}
}

var posicaox
var posicaoy
var pontuacao = 0 
var controle_tela = true

func tela():
	controle_tela = false

func atualizar_pontuacao(x):
	pontuacao = x 
	
func atualizar_posicao(x,y):
	posicaox = x
	posicaoy = y
	return posicaox + posicaoy
	
var speed = 300
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

