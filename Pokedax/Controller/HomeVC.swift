//
//  ViewController.swift
//  Pokedax
//
//  Created by Meitar Basson on 25/04/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var pokemonImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var orderLabel: UILabel!
    
    let pokemonApi = PokemonAPI()
    var skills: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateNewPokemon()
    }
    
    func generateNewPokemon() {
        let randomPokemon = Int.random(in: 1...964)
        pokemonApi.getRandomPokemonUrlSession(id: randomPokemon) { (pokemon) in
            self.pokemonApi.getPokemonImage(id: randomPokemon) { (image) in
                DispatchQueue.main.async {
                    self.pokemonImg.image = image
                    self.nameLabel.text = pokemon?.name
                    self.weightLabel.text = "\(pokemon?.weight ?? 0)"
                    self.orderLabel.text = "\(pokemon?.order ?? 0)"
                    self.skills = pokemon!.pokemonMoves
                }
            }
        }
    }


    @IBAction func skillsButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "toSkillsVC", sender: self)
    }
    
    @IBAction func generatePokemon(_ sender: Any) {
        generateNewPokemon()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let skillsVC = segue.destination as? SkillsVC {
            skillsVC.img = pokemonImg.image
            skillsVC.name = nameLabel.text
            skillsVC.skills = skills
        }
    }
    
}

