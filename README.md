<img width="100%" src="https://capsule-render.vercel.app/api?type=waving&color=237A0C&height=200&section=header&text=LogicMaze%20&fontSize=50&fontColor=fff&animation=twinkling&fontAlignY=40&desc=Casual%20Terminal%20Game%20&descAlignY=60&descSize=18">


O projeto foi desenvolvido com o intuito de aprendizagem da linguagem Swift, tendo em vista que foi o primeiro contato dos integrantes do grupo com a linguagem.

Jogo criado com o foco em ajudar a desenvolver o raciocínio lógico, mais precisamente introduzir inicentes à programação. O usuario receberá uma pergunta com quatro opções de resposta com um labirinto respectivo da pergunta, pada responder o usuario deve percorrer o labirinto e ir até a resposta que considera a correta. Caso chegue a alternativa certa o jogador irá avançar para a próxima pergunta e para o proximo labirinto onde ira repetir o mesmo procedimento. Caso o usuario erre três vezes o jogo encerra com a mensagem de Game Over.

# Motor Labirinto

Essa é a classe mais importante do codigo onde todos os metodos de criação e movimentação do usuario estão.
---
```
class MotorLabirinto {
    
    var labIndiceAtual: Int = 0
    var labirintos: [Labirinto] = []
    let linhas = 15 //Definindo a quantidade de linhas da matriz
    let colunas = 15 //Definindo a quantidade de colunas da matriz
    var status: String = ""
    private(set) var jogador: Jogador = Jogador(x: 0, y: 0)
    
    init() {
        self.criarLabirintos()
        self.reiniciarJogador()
    }
```
Aqui criamos a classe e declaramos as variaveis e lets iniciais para definir o tamanho dos labirintos, uma lista vazia para futuramente atribuir os labirintos e inicializando o jogador.
O ```init()``` é o constutor que recebe as funções ```criarLabirintos()```e ```reiniciarJogador()```.

---


```
func reiniciarJogador() {
        if temLabirinto() == true{
            for i in 0..<linhas {
                for j in 0..<colunas {
                    if labirintos[labIndiceAtual].mapa[i][j] == 6 {
                        jogador.atualizarPosicao(x: i, y: j)
                        return
                    }
                }
            }
        }
        else{
            print(venceu)
        }
                jogador.atualizarPosicao(x: 0, y: 0)
    }
```

A função reiniciarJogador serve para checar se existe um futuro labirinto pela função de checagem se existe um labirinto e depois percorre o labirinto e atualiza a posicao do jogador na posição cujo o valor seja 6.

---

```
 private func criarLabirintos() {
        //LABIRINTOS
        
        var lab : Labirinto = Labirinto(
            
            pergunta: """
Observe a seguinte sequência: 7, 14, 21, 28, 35, 42...
Qual é o próximo número que completa a sequência?

A) 48
B) 51
C) 49
D) 50
            

""",
            mapa : [
                [0,0,2,0,0,0,0,0,0,0,0,0,0,0,0],
                [0,0,1,0,0,0,1,0,1,1,1,6,0,0,0],
                [0,0,1,0,1,1,1,1,1,0,0,1,0,0,0],
                [0,0,1,0,1,0,0,0,1,0,0,1,0,0,0],
                [0,0,1,0,1,0,1,1,1,1,1,1,0,1,4],
                [0,0,1,0,1,0,1,0,0,0,0,0,0,1,0],
                [0,0,1,1,1,0,1,1,1,1,1,1,0,1,0],
                [0,1,1,0,1,0,0,0,1,0,0,1,0,1,0],
                [0,0,1,0,1,1,1,1,1,1,1,1,0,1,0],
                [0,0,1,0,0,1,0,0,1,0,0,1,0,1,0],
                [0,0,1,1,0,1,0,0,1,0,0,1,0,1,0],
                [0,0,0,1,1,1,1,1,1,1,1,1,1,1,0],
                [0,0,0,0,0,1,0,1,0,1,0,0,1,0,0],
                [3,1,1,1,1,1,0,1,0,1,0,0,1,0,0],
                [0,0,0,0,0,0,0,0,0,5,0,0,0,0,0],
            ],
            correta: 4
        )
        self.labirintos.append(lab)
```
Aqui é um pedaço da função de ```criarLabirinto()``` onde atribui valores à struct Labirinto que criamos. Pergunta, mapa e correta são atribuidas com as respectivas perguntas, matriz e alternativa correta. No final adicionamos esta struc no Array dos labirintos.

---


```
    func temLabirinto() -> Bool {
        return !(self.labIndiceAtual >= labirintos.count)
    }
```
Esta função é responsável por checar se existe lebirinto dentro do Array dos labirintos.

---


```
    func proximoLab() {
        if labIndiceAtual <=  4{
            self.labIndiceAtual += 1
        }
        else{
            print(venceu)
        }
    }
```
A ```proximoLab()``` acessa o proximo labirinto pelo indice, caso ainda exista, se não significa que o usuário venceu.

---

```
 func exibirLabirinto() {
        if labIndiceAtual >= labirintos.count {
            print("Acabaram os labirintos")
            return
        }
        
        let labAtual = labirintos[labIndiceAtual]
        for i in 0..<linhas {
            for j in 0..<colunas {
                if i == jogador.posicaoX && j == jogador.posicaoY {
                    print("🧠", terminator: "")
                } else {
                    switch labAtual.mapa[i][j] {
                        case 0: print("🟧",terminator: "")
                        case 1: print("  ",terminator: "")
                        case 2: print("A ", terminator: "")
                        case 3: print("B ", terminator: "")
                        case 4: print("C ", terminator: "")
                        case 5: print("D ", terminator: "")
                        case 6: print("  ", terminator: "")
                        default:print(" ", terminator: "")
                    }
                }
            }
            print()
        }
    }
```
Nesta função inicializada pelo ```ìnit()``` é onde o labirinto é desenhado, linha por linha e coluna por coluna, sendo 0 parede, 1 espaço para andar e 2, 3, 4, 5 as alternativas A, B, C, D respectivamente e 6 a posicao inicial do usuario.

---


```
    func acabou() -> Bool {
        let jogadorX = jogador.posicaoX
        let jogadorY = jogador.posicaoY
        let lab = self.labirintos[labIndiceAtual]
        let mapaValor = lab.mapa[jogadorX][jogadorY]
        
        if mapaValor != 2 && mapaValor != 3 && mapaValor != 4 && mapaValor != 5 {
            return true
        } else {
            return false
        }
    }
```
Aqui checamos se o usuario chegou em alguma alternativa, independentemente de estar correta ou não, interrompendo o jogo caso tenha respondido e continua jogando se não chegou em nenhuma alternativa.

---



```
    func ganhou() -> Bool {
        let jogadorX = jogador.posicaoX
        let jogadorY = jogador.posicaoY
        let lab = self.labirintos[labIndiceAtual]
        let mapaValor = lab.mapa[jogadorX][jogadorY]
        
        if mapaValor == lab.correta {
            return true
        } else {
            return false
        }
    }
```
Enquanto aqui checamos se a alternativa escolhida pelo usuário é a correta.

---


```
    func venceuJogo() -> Bool{
        if ganhou() == true && labIndiceAtual == 4{
            print("final do jogo vc ganhou")
            return true
        }
        return venceuJogo()
    }
```
Caso o usuário responda a alternativa correta e o indice do labirinto for 4, o usuário recebera a mensagem de que ganhou o jogo.

---


```
    func reiniciar() {
        for i in 0..<linhas {
            for j in 0..<colunas {
                if labirintos[labIndiceAtual].mapa[i][j] == 6 {
                    jogador.atualizarPosicao(x: i, y: j)
                }
            }
        }
    }
```
A função ```reiniciar()```é necessária para caso o jogador erre, o usuário vai reiniciar no mesmo labirinto na posição de número 6.

---

```
 func moverJogadorBaixo() {
        let novaPosX = jogador.posicaoX + 1
        let mapa = self.labirintos[labIndiceAtual].mapa
        
        if novaPosX >= mapa.count { return }
        
        if mapa[novaPosX][jogador.posicaoY] != 0 {
            jogador.atualizarPosicao(x: novaPosX, y: jogador.posicaoY)
        }
    }
```
Aqui se inicia as funções para movimentação do usuario, todas são iguais mudando apenas a jogador.posicaoX ou jogador.posicaoY dependendo do movimento dado pelo usuario e somando ou subitraindo a eles respectivo ao movimento do usuario requerido.

---


```
    func exibirPergunta(){
        let lab = self.labirintos[labIndiceAtual]
        let perguntas = lab.pergunta
        print(Colors.yellow + perguntas + Colors.reset)
       
    }
```
Nesta função exibimos a pergunta junto com a exibição do respectivo labirinto. Encerrando a classe MotorLabirinto.

# Jogador

```
class Jogador {
    private(set) var vida: Int = 3 
    private(set) var posicaoX: Int = 0
    private(set) var posicaoY: Int = 0

    
    init(x: Int, y:Int) {
        self.posicaoX = x
        self.posicaoY = y
    }
```
Aqui inicializamos a classe Jogador que terá vida, posicaoX e posicaoY sendo inicializadas pelo ```ìnit(x:Int, y:Int)``` .

---


```    
    func atualizarPosicao(x: Int, y:Int) {
        self.posicaoX = x
        self.posicaoY = y
    }
```
Atualizamos a posicao do jogador nesta função a medida que ele for se movimentando.

---


```    
    func reiniciar() {
        self.vida = 3
        self.posicaoY = 0
        self.posicaoX = 0
    }
```
Reiniciamos o jogador com esta função.

---


```
    func perderVida() {
        self.vida = self.vida <= 0 ? 0 : self.vida - 1;
    }
```
Esta função tem a funcionalidade de checar se o jogador tem vidas restantes e caso tenha, decrementa uma vida com a resposta errada.

# Labirinto

```
struct Labirinto {
    var pergunta : String
    var mapa : [[Int]]
    var correta : Int
}
```
Criação da struct Labirinto que, como mostrado anteriormente na função ```exibirLabirinto()```, contendo pergunta, mapa e correta.

---


```
struct Colors {
    static let yellow = "\u{001B}[0;33m"
    static let cyan = "\u{001B}[0;36m"
    static let reset = "\u{001B}[0;0m"
}
```
Aqui apenas alocamos os codigos ANSI a variaveis para poder colorir os menus mais facilmente.

# Main

```
let motorJogo: MotorLabirinto = MotorLabirinto()
```
Aqui é onde iniciamos a classe MotorLabirinto.

---

```
let menu : String = """

██╗      ██████╗  ██████╗ ██╗ ██████╗    ███╗   ███╗ █████╗ ███████╗███████╗
██║     ██╔═══██╗██╔════╝ ██║██╔════╝    ████╗ ████║██╔══██╗╚══███╔╝██╔════╝
██║     ██║   ██║██║  ███╗██║██║         ██╔████╔██║███████║  ███╔╝ █████╗
██║     ██║   ██║██║   ██║██║██║         ██║╚██╔╝██║██╔══██║ ███╔╝  ██╔══╝
███████╗╚██████╔╝╚██████╔╝██║╚██████╗    ██║ ╚═╝ ██║██║  ██║███████╗███████╗
╚══════╝ ╚═════╝  ╚═════╝ ╚═╝ ╚═════╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝

"""

let gameOver : String = """
 ██████╗  █████╗ ███╗   ███╗███████╗     ██████╗ ██╗   ██╗███████╗██████╗
██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔═══██╗██║   ██║██╔════╝██╔══██╗
██║  ███╗███████║██╔████╔██║█████╗      ██║   ██║██║   ██║█████╗  ██████╔╝
██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██║   ██║╚██╗ ██╔╝██╔══╝  ██╔══██╗
╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ╚██████╔╝ ╚████╔╝ ███████╗██║  ██║
 ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝     ╚═════╝   ╚═══╝  ╚══════╝╚═╝  ╚═╝
                                                                          
"""
let venceu : String = """
██╗   ██╗ ██████╗  ██████╗███████╗    ██╗   ██╗███████╗███╗   ██╗ ██████╗███████╗██╗   ██╗     ██████╗
██║   ██║██╔═══██╗██╔════╝██╔════╝    ██║   ██║██╔════╝████╗  ██║██╔════╝██╔════╝██║   ██║    ██╔═══██╗
██║   ██║██║   ██║██║     █████╗      ██║   ██║█████╗  ██╔██╗ ██║██║     █████╗  ██║   ██║    ██║   ██║
╚██╗ ██╔╝██║   ██║██║     ██╔══╝      ╚██╗ ██╔╝██╔══╝  ██║╚██╗██║██║     ██╔══╝  ██║   ██║    ██║   ██║
 ╚████╔╝ ╚██████╔╝╚██████╗███████╗     ╚████╔╝ ███████╗██║ ╚████║╚██████╗███████╗╚██████╔╝    ╚██████╔╝
  ╚═══╝   ╚═════╝  ╚═════╝╚══════╝      ╚═══╝  ╚══════╝╚═╝  ╚═══╝ ╚═════╝╚══════╝ ╚═════╝      ╚═════╝
"""
```
Criamos os menus de inicio, vitória e derrota aqui.

---

```
while true {
    print(Colors.cyan + menu + Colors.reset)
    print("\n[C] Começar")
    print("[S] Sair")
    
    if let input = readLine()?.lowercased() {
        if input == "c" {
            print("O jogo começou!")
            motorJogo.exibirLabirinto()
            break
        } else if input == "s" {
            print("Saindo do jogo...")
            exit(0)
        } else {
            print("Opção inválida. Tente novamente.\n")
        }
    }
}

```
Neste while true é onde mostramos o menu e esperamos uma resposta dele para começar o jogo ou sair, caso inicie o jogo chamamos a função ```exibirLabirinto()```.

---

```
print("\u{001B}[2J")
``` 

Comando para dar um "clear" no terminal, que da um espaço entre uma interação e outra.

---

```
while motorJogo.temLabirinto(){
```
As linhas de código a seguir estarão dentro deste while que checa se existe labirinto.

---

```
    repeat {
        
        motorJogo.exibirPergunta()
        print()
        motorJogo.exibirLabirinto()
        print()
        print()
        
        //instrucoes para o usuario
        let comandos = """
        [W] - Para cima | [S] - Para baixo| [D] - Para direita
              [A] - Para esquerda | [Q] - Sair do jogo
             Tecle [Enter] para confirmar seu movimento
        
                      Lembre-se, você é o 🧠
        """
        
        print(Colors.cyan + comandos + Colors.reset)
        print()
        print("Digite seu comando: ")
        print()
        
        //TROCA DE MATRIZ DO JOGADOR
        if let controle = readLine()?.lowercased(){
            switch controle{
            case "w": motorJogo.moverJogadorCima()
            case "s": motorJogo.moverJogadorBaixo()
            case "a": motorJogo.moverJogadorEsquerda()
            case "d": motorJogo.moverJogadorDireita()
            case "q":
                print("\u{001B}[2J")
                print(Colors.cyan + gameOver + Colors.reset)
                exit(0)
            default : break
            }
        }
        print("\u{001B}[2J")
    } while motorJogo.acabou()
```
Aqui temos um repet while com a condição de caso de resposta do jogador com o ```motorJogo.acabou()``` função explicada anteriormente,
Exibimos a pergunta, o labirinto e os comandos de instrução do usuário e depois recebe o comando de movimento dentro do switch case chamando a respectiva função de movimento.

---

```
 if motorJogo.ganhou() {
        motorJogo.proximoLab()
        
        print("\u{001B}[2J")
        print(Colors.cyan + "Certa resposta!" + Colors.reset)
        print()
        print("Pressione enter para continuar")
        let _ = readLine()
        motorJogo.reiniciarJogador()
```
Caso o usuário acerte printamos uma mensagem de resposta correta e chamamos as funções ```motorJogo.proximoLab()```e```motorJogo.reiniciarJogador()```e pedimos um enter para o usuário passe para a próxima pergunta e labirinto.

---

```
else {
        motorJogo.jogador.perderVida()
        print("\u{001B}[2J")
        print(Colors.cyan + "Que pena... resposta incorreta, tente novamente!" + Colors.reset)
        print()
        print("Pressione enter para continuar")
        let _ = readLine()
        motorJogo.reiniciarJogador()
    }
```
Caso o usuário erre printamos uma mensagem de que errou a resposta e chamamos a função de ```motorJogo.jogador.perderVida()```e```motorJogo.reiniciarJogador()``` e pedimos o enter novamente para o jogador tentar novamente.

---

```
if motorJogo.jogador.vida == 0 {
        print("\u{001B}[2J")
        print("Voce esgotou suas vidas...")
        print()
        print(Colors.cyan + gameOver + Colors.reset)
        exit(0)
    }
}
```
Por fim checamos se o usuário ainda tem vidas restantes e se estiver com 0 vidas, printamos a mensagem de que esgotou as vidas e encerramos o código.
