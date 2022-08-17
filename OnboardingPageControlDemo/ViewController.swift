//
//  ViewController.swift
//  OnboardingPageControlDemo
//
//  Created by marco rodriguez on 16/08/22.
//

import UIKit

struct Slide {
    let texto: String
    let color: UIColor
    let imagen: UIImage
}

class ViewController: UIViewController {
    
    var slides: [Slide] = [
        Slide(texto: "SEAT es una marca de coches generalista con origen y base en Martorell (España), fundada en 1950 y propiedad del Grupo Volkswagen desde 1986. Sus siglas originalmente eran el acrónimo de Sociedad Española de Automóviles de Turismo", color: .blue, imagen: UIImage(named: "1")!),
        Slide(texto: "SEAT comenzó su actividad con el objetivo de motorizar la España de la postguerra, mediante la fabricación bajo licencia de los automóviles italianos Fiat, gracias a un acuerdo del fabricante italiano con el gobierno de España, donde cinco bancos nacionales y el propio gobierno aportaron el capital.", color: .orange, imagen: UIImage(named: "2")!),
        Slide(texto: "Con la retirada de Fiat en 1980, y la venta de la mayoría de las acciones del Gobierno Español, en 1986, el Grupo Volkswagen se convirtió en el máximo accionista. Desde 2018, SEAT también tiene una submarca independiente, CUPRA, encargada de la línea más deportiva de la marca.", color: .red, imagen: UIImage(named: "3")!),
        Slide(texto: "SEAT fue creada por iniciativa del gobierno español, en coherencia con la política autárquica instaurada por el régimen del General Franco, con el objeto de motorizar el país, que en ese momento contaba con un promedio de 3,1 coches por cada mil habitantes.", color: .purple, imagen: UIImage(named: "4")!),
        Slide(texto: "El primer modelo de SEAT es el SEAT 1400, lanzado en 1953 y pensado para dar servicio a los altos cargos del gobierno nacional. Es una berlina cuyo nombre viene derivado de su cilindrada, como ocurriría con otros modelos de SEAT en los años sucesivos.", color: .green, imagen: UIImage(named: "5")!)
    ]

    @IBOutlet weak var OnboImagen: UIImageView!
    @IBOutlet weak var FondoOnboView: UIView!
    @IBOutlet weak var OnboLabel: UILabel!
    @IBOutlet weak var OnboPageControll: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OnboPageControll.addTarget(self, action: #selector(swipePageControl(_:)), for: .valueChanged)
        FondoOnboView.addGestureRecognizer(createSwipeGestureRecognizer(for: .left))
        FondoOnboView.addGestureRecognizer(createSwipeGestureRecognizer(for: .right))
        
        
        FondoOnboView.backgroundColor = slides[OnboPageControll.currentPage].color
        OnboImagen.image = slides[OnboPageControll.currentPage].imagen
        OnboLabel.text = slides[OnboPageControll.currentPage].texto
    }
    
    private func createSwipeGestureRecognizer(for direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer {
        // Initialize Swipe Gesture Recognizer
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))

        // Configure Swipe Gesture Recognizer
        swipeGestureRecognizer.direction = direction

        return swipeGestureRecognizer
    }
    
    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .up:
            print("Up")
        case .down:
            print("down")
        case .left:
            print("left") //avanza siguiente pagina
            
            //si es 2, no hacer nada
            if (OnboPageControll.currentPage >= 0) && (OnboPageControll.currentPage <= slides.count-1) {
                OnboPageControll.currentPage += 1
                print(slides[OnboPageControll.currentPage])
                //FondoOnboView.backgroundColor = slides[OnboPageControll.currentPage].color
//                OnboImagen.image = slides[OnboPageControll.currentPage].imagen
//                OnboLabel.text = slides[OnboPageControll.currentPage].texto
            }
            //si es mayor de 0 deslizar a la derecha +1
            
            
        case .right:
            print("right") //retrocede pagina anterior
            
            if (OnboPageControll.currentPage <= slides.count-1) && (OnboPageControll.currentPage >= 0) {
                OnboPageControll.currentPage -= 1
                print(slides[OnboPageControll.currentPage])
                //FondoOnboView.backgroundColor = slides[OnboPageControll.currentPage].color
//                OnboImagen.image = slides[OnboPageControll.currentPage].imagen
//                OnboLabel.text = slides[OnboPageControll.currentPage].texto
            }
            
            
        default:
            break
        }
        
        UIView.animate(withDuration: 0.25) {
            self.FondoOnboView.backgroundColor = self.slides[self.OnboPageControll.currentPage].color
            self.OnboImagen.image = self.slides[self.OnboPageControll.currentPage].imagen
            self.OnboLabel.text = self.slides[self.OnboPageControll.currentPage].texto
        }
    }
    
    @objc func swipePageControl(_ sender: UIPageControl) {
        let indice = sender.currentPage
        print(indice)
    }


}

