import Foundation

let motorJogo: MotorLabirinto = MotorLabirinto()
let gerirVida : Jogador = Jogador(x: 0, y: 0)

//Printa a tela inicial (nome do jogo)
print("\u{001B}[2J")

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

print("\u{001B}[2J")

while motorJogo.temLabirinto() {
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
    
    if motorJogo.ganhou() {
        motorJogo.proximoLab()
        
        print("\u{001B}[2J")
        print(Colors.cyan + "Certa resposta!" + Colors.reset)
        print()
        print("Pressione enter para continuar")
        let _ = readLine()
        motorJogo.reiniciarJogador()
        
    } else {
        motorJogo.jogador.perderVida()
        print("\u{001B}[2J")
        print(Colors.cyan + "Que pena... resposta incorreta, tente novamente!" + Colors.reset)
        print()
        print("Pressione enter para continuar")
        let _ = readLine()
        motorJogo.reiniciarJogador()
    }
    
    if motorJogo.jogador.vida == 0 {
        print("\u{001B}[2J")
        print("Voce esgotou suas vidas...")
        print()
        print(Colors.cyan + gameOver + Colors.reset)
        exit(0)
    }
}
    
print(Colors.cyan + menu + Colors.reset)
    
    





































//    for _ in listaLabirintos{
//
//        while true{
//            var posX = labAtual.posicaoInicialX //A posicao inicial do usuário será [7][8] no primeiro labirinto, nos outros mudar
//            var posY = labAtual.posicaoInicialY
//            exibirLabirinto(x: labAtual.mapa)
//
//            var newPosX = posX
//            var newPosY = posY
//
//            //TROCA DE MATRIZ DO JOGADOR
//            if let controle = readLine()?.lowercased(){
//                switch controle{
//                case "w": newPosX -= 1
//                case "s": newPosX += 1
//                case "a": newPosY -= 1
//                case "d": newPosY += 1
//                default : break
//                }
//
//                //TELA DE GAMER OVER, CASO O JOGADOR PERCA TODAS AS VIDAS
//                if controle == "q" {
//                    print("\u{001B}[2J")
//                    print(gameOver)
//                    continue
//                }
//
//                //POSICAO DA ALTERNATIVA CORRETA.
//
//            }
//
//            //SUBSTITUICAO DA POSICAO DO JOGADOR, A CADA COMANDO
//            if newPosX >= 0 && newPosX < linhas && newPosY >= 0 && newPosY < colunas && (labAtual.mapa[newPosX][newPosY] == 1 || labAtual.mapa[newPosX][newPosY] == 2 || labAtual.mapa[newPosX][newPosY] == 3 || labAtual.mapa[newPosX][newPosY] == 4 || labAtual.mapa[newPosX][newPosY] == 5) {
//                posX = newPosX
//                posY = newPosY
//            }
//            if labAtual.alternativaCerta == newPosX && labAtual.alternativaCerta == newPosY{
//
//            }
//
//        }
//
//    }
    
    
    
    
    

    
    





/*

 
 
 
- Menu (Feito) --> Yas vai passar
- Página de Game Over (Feito)
- Perguntas no labirinto
- Colocar as vidas, os niveis (personalizado)
- Código Ansi para personalizacao
- Colocar o Mapa no meio
- Estrutura de repeticao
- Colocar as outras opcoes de labirinto (Feito)
- Aumentar a fonte do terminal (Nao é possivel)
- Separar funcoes em arquivos diferentes para organizacao
- trocar formato das instrucoes
 
*/



//    var posX = labAtual.posicaoInicialX //A posicao inicial do usuário será [7][8] no primeiro labirinto, nos outros mudar
//    var posY = labAtual.posicaoInicialY //a posicao inicial
