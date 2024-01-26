#!/bin/bash

mostrar_menu() {
    clear
    echo "===== Menú Principal ====="
    echo "1. Actualizar la Clave GPG"
    echo "2. Limpiar la Caché de Pacman"
    echo "3. Reinstalar Pacman y PackageKit"
    echo "4. Limpiar sistema operativo y purgar dependencias y conflictos"
    echo "5. Salir"
    echo "=========================="
}

actualizar_clave_gpg() {
    sudo pacman -Sy archlinux-keyring
}

limpiar_cache_pacman() {
    sudo pacman -Scc
}

reinstalar_pacman_packagekit() {
    sudo pacman -Sy pacman packagekit
    sudo chown -R root:root /etc/pacman.d/
    sudo chmod -R 644 /etc/pacman.d/
    sudo pacman -Sy packagekit
    sudo pacman -Sg
}

limpiar_purgar_sistema() {
    # Inserta aquí los comandos para limpiar y purgar el sistema
    echo "Limpiar y purgar sistema..."
}

while true; do
    mostrar_menu

    read -p "Selecciona una opción (1-5): " opcion

    case $opcion in
        1) actualizar_clave_gpg ;;
        2) limpiar_cache_pacman ;;
        3) reinstalar_pacman_packagekit ;;
        4) limpiar_purgar_sistema ;;
        5) echo "Saliendo..."; exit ;;
        *) echo "Opción no válida, intenta de nuevo." ;;
    esac

    read -p "Presiona Enter para continuar..."
done
