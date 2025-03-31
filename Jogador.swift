//
//  Jogador.swift
//  projetoJoguinho
//
//  Created by Aluno Mack on 24/03/25.
//

import Foundation

class Jogador {
    private(set) var vida: Int = 3 
    private(set) var posicaoX: Int = 0
    private(set) var posicaoY: Int = 0

    
    init(x: Int, y:Int) {
        self.posicaoX = x
        self.posicaoY = y
    }
    
    func atualizarPosicao(x: Int, y:Int) {
        self.posicaoX = x
        self.posicaoY = y
    }
    
    func reiniciar() {
        self.vida = 3
        self.posicaoY = 0
        self.posicaoX = 0
    }
    
    func perderVida() {
        self.vida = self.vida <= 0 ? 0 : self.vida - 1;
    }
    
}
    

