//
//  UserViewController.swift
//  C6Bank
//
//  Created by Gabriel de Castro Chaves on 03/10/22.
//

import UIKit

class UserViewController: UIViewController {
    
    //MARK: - Var
    private var perfilList: [Perfil] = []
    private var configuracoesList: [Configuracoes] = []
    var isTapped = true
    
     //MARK: - View lifecycle
     override func viewDidLoad() {
         super.viewDidLoad()
         turnViewIntoCircle()
         setPerfilButton()
         setTableView()
         addPerfil()
         addConfiguracoes()
     }
     
     //MARK: - IBOutlets
     @IBOutlet weak var configuracoesButton: UIButton!
     @IBOutlet weak var perfilButton: UIButton!
     @IBOutlet weak var perfilUnderlineView: UIView!
     @IBOutlet weak var configuracoesUnderlineView: UIView!
     @IBOutlet weak var divisionView: UIView!
     @IBOutlet weak var userImageContentView: UIView!
     @IBOutlet weak var userImage: UIImageView!
     @IBOutlet weak var tableView: UITableView!
     
     //MARK: - Functions
     private func setTableView() {
         tableView.delegate = self
         tableView.dataSource = self
         tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
     }
     
     private func addPerfil() {
         perfilList.append(Perfil(
             section: "Conta",
             image: ["square.text.square.fill", "person.fill.badge.plus"],
             text: ["Meus dados cadastrais", "Convidar amigos"]))
         
         perfilList.append(Perfil(
             section: "Ajuda",
             image: ["text.bubble.fill.rtl"],
             text: ["Canais de atendimento"]))
     }
     
     private func addConfiguracoes() {
         configuracoesList.append(Configuracoes(
             section: "Personalização",
             image: ["c6-config", "bell.fill"],
             text: ["ícone do app", "Configurar notificações"]))
         
         configuracoesList.append(Configuracoes(
             section: "Segurança e privacidade",
             image: ["logo-pix-cinza"],
             text: ["Meus limites pix"]))
         
         configuracoesList.append(Configuracoes(
             section: "Configurações de conta",
             image: ["person.2.fill"],
             text: ["Gerenciar contas"]))
     }
     
     private func turnViewIntoCircle() {
         userImageContentView.layer.cornerRadius = userImageContentView.frame.height / 2
         userImageContentView.layer.masksToBounds = true
     }
     
     private func setConfiguracoesButton() {
         configuracoesButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
         configuracoesButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
         perfilUnderlineView.backgroundColor = .black
         perfilButton.titleLabel?.textColor = .lightGray
         configuracoesUnderlineView.backgroundColor = .systemYellow
     }
     
     private func setPerfilButton() {
         perfilButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
         configuracoesUnderlineView.backgroundColor = .black
         configuracoesButton.titleLabel?.textColor = .lightGray
         perfilUnderlineView.backgroundColor = .systemYellow
     }
     
     //MARK: - IBActions
     @IBAction private func dismissButton(_ sender: UIButton) {
         dismiss(animated: true)
     }
     
     @IBAction private func perfilButton(_ sender: UIButton) {
         setPerfilButton()
         isTapped.toggle()
         tableView.reloadData()
     }
     
     @IBAction private func configuracoesButton(_ sender: UIButton) {
         setConfiguracoesButton()
         isTapped.toggle()
         tableView.reloadData()
     }
     
 }

 //MARK: TableView
 extension UserViewController: UITableViewDelegate, UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if isTapped {
             return perfilList[section].text.count
         } else {
             return configuracoesList[section].text.count
         }
         
     }
     
     func numberOfSections(in tableView: UITableView) -> Int {
         if isTapped {
             return perfilList.count
         } else {
             return configuracoesList.count
         }
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
         
         if isTapped {
             cell?.setCell(text: perfilList[indexPath.section].text[indexPath.row],
                           image: perfilList[indexPath.section].image[indexPath.row])
         } else {
             cell?.setCell(text: configuracoesList[indexPath.section].text[indexPath.row],
                           image: configuracoesList[indexPath.section].image[indexPath.row])
         }
         
         return cell ?? UITableViewCell()
     }
     
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         if isTapped {
             return perfilList[section].section
         } else {
             return configuracoesList[section].section
         }
     }
     
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 44
     }
     
     func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
         if let header = view as? UITableViewHeaderFooterView {
             header.textLabel?.textColor = .lightGray
             header.textLabel?.font = UIFont.boldSystemFont(ofSize: 13)
         }
         
         tableView.sectionHeaderTopPadding = 20
     }
     
     func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
         return nil
     }
     
 }


