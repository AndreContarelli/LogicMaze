
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
    
    // MARK: Métodos úteis
    
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

        lab = Labirinto(
            pergunta: """
Considere a afirmação: “Se hoje é sábado, amanhã não
trabalharei.” A negação dessa afirmação é:

A) Hoje não é sábado ou amanhã trabalharei.
B) Hoje é sábado e amanhã trabalharei.
C) Se hoje não é sábado, amanhã trabalharei.
D) Se hoje não é sábado, amanhã não trabalharei.
    

""",
            mapa : [
                [0,0,0,0,0,0,0,0,0,0,2,0,0,0,0],
                [0,6,0,0,1,1,1,0,0,0,1,0,1,1,0],
                [0,1,0,0,1,0,1,1,0,0,1,0,0,1,0],
                [0,1,0,0,1,0,0,1,1,0,1,1,1,1,0],
                [0,1,0,0,1,0,0,0,1,1,1,0,0,1,0],
                [0,1,1,1,1,1,1,1,0,1,0,0,0,1,0],
                [0,0,0,0,1,0,0,1,0,1,1,1,1,1,0],
                [5,1,1,0,1,1,0,1,0,1,0,0,0,1,0],
                [0,0,1,0,0,0,0,1,0,1,1,1,0,1,0],
                [0,0,1,0,1,1,1,1,0,0,0,1,0,1,0],
                [0,0,1,0,1,0,1,1,1,1,0,1,0,0,0],
                [0,0,1,1,1,0,1,0,0,1,1,1,0,1,3],
                [0,0,0,0,0,0,1,0,0,0,0,0,0,1,0],
                [0,0,0,0,1,1,1,1,1,1,1,1,1,1,0],
                [0,0,0,0,4,0,0,0,0,0,0,0,0,0,0],
            ],
            correta: 3
        )
        self.labirintos.append(lab)

        lab = Labirinto(
            pergunta: """
Dona Maria tem quatro filhos: Francisco, Paulo,
Raimundo e Sebastião. A esse respeito, sabe-se que:

    I. Sebastião é mais velho que Raimundo.
    II. Francisco é mais novo que Paulo.
    III. Paulo é mais velho que Raimundo.

Assim, é obrigatoriamente verdadeiro que:
A) Paulo é o mais velho.
B) Sebastião não é o mais novo.
C) Raimundo não é o mais novo.
D) Francisco é o mais novo.

""",
            mapa : [
                [0,0,0,3,0,0,0,0,0,0,0,0,0,0,0],
                [0,1,0,1,0,1,1,1,1,0,1,1,1,0,0],
                [0,1,0,1,1,1,0,0,1,0,1,0,1,0,0],
                [0,1,0,0,0,0,0,0,1,0,1,0,1,0,0],
                [0,1,0,1,1,1,1,1,1,1,1,0,1,0,0],
                [0,1,0,1,0,0,0,0,0,0,1,0,1,1,4],
                [0,1,1,1,0,0,1,1,1,0,1,0,0,0,0],
                [0,1,0,1,1,1,1,0,1,1,1,1,1,0,0],
                [0,0,0,0,0,0,1,0,0,0,0,0,1,1,0],
                [5,1,1,1,1,1,1,0,1,1,1,1,1,1,0],
                [0,0,0,0,0,0,0,0,1,0,0,0,0,1,0],
                [0,1,1,1,1,1,1,1,1,0,0,6,0,1,0],
                [0,1,0,0,0,0,1,0,1,0,0,1,0,1,0],
                [0,1,1,1,1,0,1,0,1,1,0,1,1,1,0],
                [0,0,0,0,2,0,0,0,0,0,0,0,0,0,0],
            ],
            correta: 3
        )
        self.labirintos.append(lab)
        

        lab = Labirinto(
            pergunta : """
Alguns consideram que a cidade de Florianópolis
foi fundada no dia 23 de março de 1726, que caiu
em um sábado. Após 90 dias, no dia 21 de junho,
a data assinalou o início do inverno, quando a
noite é a mais longa do ano.

    Esse dia caiu em uma:

A) Terça-feira
B) Quarta-feira
C) Quinta-feira
D) Sexta-feira


""",
            mapa : [
                [0,0,5,0,0,0,0,0,0,0,0,0,0,0,0],
                [0,0,1,0,1,1,0,1,1,1,1,1,0,1,0],
                [0,0,1,1,0,1,0,1,0,1,0,1,0,1,0],
                [0,0,0,1,0,1,0,1,0,0,0,1,1,1,0],
                [0,0,0,1,0,1,0,1,0,1,1,1,0,0,0],
                [0,0,0,1,0,1,1,1,0,1,0,0,1,1,2],
                [0,0,0,1,0,1,0,1,0,1,0,1,1,0,0],
                [0,0,0,1,0,1,0,6,0,1,0,1,0,1,0],
                [4,1,0,1,0,1,0,0,0,1,0,1,0,1,0],
                [0,1,0,1,1,1,0,0,0,1,1,1,0,1,0],
                [0,1,0,0,0,1,0,1,0,1,0,0,0,1,0],
                [0,1,1,1,1,1,0,1,1,1,1,1,1,1,0],
                [0,0,0,0,0,1,0,0,0,1,0,0,1,0,0],
                [0,0,0,1,1,1,1,1,1,1,0,1,1,0,0],
                [0,0,0,3,0,0,0,0,0,0,0,0,0,0,0],
            ],
            correta: 4
        )
        self.labirintos.append(lab)
        
        lab = Labirinto(
            pergunta: """
Alice, Bruno, Carlos e Denise são as quatro primeiras
pessoas de uma fila, não necessariamente nesta ordem.
    
João olha para os quatro e afirma:

Bruno e Carlos estão em posições consecutivas na fila;
Alice está entre Bruno e Carlos na fila.
Entretanto, as duas afirmações de João são falsas.
Sabe-se que Bruno é o terceiro da fila. O segundo da fila é...

A) Denise
B) Bruno
C) Carlos
D) Alice

""",
            mapa : [
                [0,0,0,0,0,0,0,3,0,0,0,0,0,0,0],
                [0,1,1,1,0,0,0,1,0,0,1,1,1,1,0],
                [0,1,0,1,1,1,1,1,0,0,1,0,0,1,0],
                [0,1,0,0,0,0,0,0,0,0,1,0,1,1,0],
                [0,1,0,1,1,1,1,0,1,1,1,0,1,0,0],
                [0,1,1,1,0,0,1,1,1,0,0,0,1,1,4],
                [0,1,0,0,1,1,1,0,1,0,0,0,0,0,0],
                [0,1,0,0,6,0,1,0,1,1,1,1,1,0,0],
                [0,1,0,0,0,0,0,0,0,0,1,0,1,0,0],
                [0,1,1,1,1,1,1,1,1,0,1,0,1,1,0],
                [0,0,0,0,0,1,0,0,1,0,0,0,0,1,0],
                [2,1,0,0,0,1,0,0,1,1,1,1,0,1,0],
                [0,1,0,1,1,1,0,0,1,0,0,1,0,0,0],
                [0,1,1,1,0,0,0,1,1,0,0,1,1,1,0],
                [0,0,0,0,0,0,0,0,0,0,0,0,0,5,0],
            ],
            correta: 2
        )
        self.labirintos.append(lab)
    }
    
    func temLabirinto() -> Bool {
        return !(self.labIndiceAtual >= labirintos.count)
    }
    
    func proximoLab() {
        if labIndiceAtual <=  4{
            self.labIndiceAtual += 1
        }
        else{
            print(venceu)
        }
    }
    
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
  
    func venceuJogo() -> Bool{
        if ganhou() == true && labIndiceAtual == 4{
            print("final do jogo vc ganhou")
            return true
        }
        return venceuJogo()
    }
    
    func reiniciar() {
        for i in 0..<linhas {
            for j in 0..<colunas {
                if labirintos[labIndiceAtual].mapa[i][j] == 6 {
                    jogador.atualizarPosicao(x: i, y: j)
                }
            }
        }
    }
    
    // MARK: Métodos de movimento
    
    func moverJogadorBaixo() {
        let novaPosX = jogador.posicaoX + 1
        let mapa = self.labirintos[labIndiceAtual].mapa
        
        if novaPosX >= mapa.count { return }
        
        if mapa[novaPosX][jogador.posicaoY] != 0 {
            jogador.atualizarPosicao(x: novaPosX, y: jogador.posicaoY)
        }
    }
    
    func moverJogadorCima() {
        let novaPosX = jogador.posicaoX - 1
        let mapa = self.labirintos[labIndiceAtual].mapa
        
        if novaPosX < 0 { return }
        
        if mapa[novaPosX][jogador.posicaoY] != 0 {
            jogador.atualizarPosicao(x: novaPosX, y: jogador.posicaoY)
        }
    }
    
    func moverJogadorEsquerda() {
        let novaPosY = jogador.posicaoY - 1
        let mapa = self.labirintos[labIndiceAtual].mapa
        
        if novaPosY < 0 { return }
        
        if mapa[jogador.posicaoX][novaPosY] != 0 {
            jogador.atualizarPosicao(x: jogador.posicaoX, y: novaPosY)
        }
    }
    
    func moverJogadorDireita() {
        let novaPosY = jogador.posicaoY + 1
        let mapa = self.labirintos[labIndiceAtual].mapa
        
        if novaPosY >= mapa[0].count { return }
        
        if mapa[jogador.posicaoX][novaPosY] != 0 {
            jogador.atualizarPosicao(x: jogador.posicaoX, y: novaPosY)
        }
    }
    
    func exibirPergunta(){
        let lab = self.labirintos[labIndiceAtual]
        let perguntas = lab.pergunta
        print(Colors.yellow + perguntas + Colors.reset)
       
    }
    
}




