function ls --description "Usa exa si está disponible, sino usa ls normal"
    if command -q lsd
        command lsd --color never --icon always $argv
    else
        # Usar ls normal
        command ls --color=auto $argv
    end
end
