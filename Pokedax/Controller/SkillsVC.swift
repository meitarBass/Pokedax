//
//  SkillsVC.swift
//  Pokedax
//
//  Created by Meitar Basson on 25/04/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

class SkillsVC: UIViewController {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var skillsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var skills : [String]?
    var img : UIImage?
    var name : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pokemonImage.image = img
        skillsLabel.text = parseSkills()
        nameLabel.text = name
    }
    
    func parseSkills() -> String {
        if let skills = skills {
            var text = "Your Pokemon skills are: "
            for i in 0...skills.count - 2 {
                text = text + "\(skills[i]), "
            }
            text = text + "\(skills[skills.count - 1])."
            return text
        }
        return ""
    }

}
