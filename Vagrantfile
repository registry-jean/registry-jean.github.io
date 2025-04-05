# === Configuration globale ===
BOX_NAME       = "ubuntu/focal64"
BOX_VERSION    = "20240821.0.1"
VM_NAME        = "vm-registry"
VM_HOSTNAME    = "jean"
VM_IP          = "192.168.56.10"
VM_MEMORY      = 2048
VM_CPUS        = 2
SETUP_PROJECT_SCRIPT = "setup_project.sh"

Vagrant.configure("2") do |config|
  config.vm.box = BOX_NAME
  config.vm.box_version = BOX_VERSION
  config.vm.network "private_network", type: "static", ip: VM_IP
  config.vm.hostname = VM_HOSTNAME

  # Synchronisation du fichier .env via un lien symbolique
  config.vm.synced_folder ".", "/home/vagrant/workspace", type: "virtualbox"
  config.vm.provision "shell", inline: <<-SHELL
    echo "Nettoyer les paquets inutiles pour libérer de l'espace..."
    sudo apt-get update -y && sudo apt-get upgrade -y
    sudo apt-get autoremove -y
    sudo apt-get autoclean -y
    ln -sf /home/vagrant/workspace/.env /home/vagrant/.env
  SHELL

  # Configuration du provider VirtualBox
  config.vm.provider "virtualbox" do |vb|
    vb.name = VM_NAME
    vb.memory = VM_MEMORY
    vb.cpus = VM_CPUS
  end

  config.vm.provision :shell, path: SETUP_PROJECT_SCRIPT

    # Vérification et installation de Docker si nécessaire
  config.vm.provision "shell", inline: <<-SHELL
    echo "L'envoi des images docker est en cours en arrière-plan..."
    echo "**************************************************************************************************"
    echo "Faire 'vagrant ssh' pour se connecter"
  SHELL
end