#LOOP EXTERNO PARA FAZER O JOGADOR VOLTAR A JOGAR APÓS O RESULTADO FINAL
loop do
  #Criação de dificuldades dos levels com HASH.
  hash_ia = {
    level1: rand(1..100), 
    level2: rand(1..500), 
    level3: rand(1..1000)
  };
  puts "BEM-VINDO AO JOGO DE ADIVINHAÇÃO" 

  # Variaveis declarada fora do loop
  dificuldade = nil;
  numeroIA = nil;
  numeroPlayer = nil;

  # LOOP PARA SELECIONAR DIFICULDADE (SE INCORRETA O LOOP FUNCIONA, SE NÃO, O LOOP É PARADO).
  loop do 
    puts "Selecione o nível de dificuldade:"
    puts "1. LEVEL (1 - 100)"
    puts "2. LEVEL (1 - 500)"
    puts "3. LEVEL (1 - 1000)"

    # PEGANDO DIFICULDADE ESCOLHIDA DO JOGADOR
    dificuldade = gets.to_i;

    # CHECANDO SE A ENTRADA DO DADO É VÁLIDA OU INVÁLIDA, E PEGANDO O VALOR DO HASH PARA JOGAR NA VARIAVEL DIFICULDADE
    case dificuldade
      when 1
        dificuldade = "1 - 100 (Level 1)";
        numeroIA = hash_ia[:level1];
        break
      when 2
        dificuldade = "1 - 500 (Level 2)";
        numeroIA = hash_ia[:level2];
        break
      when 3
        dificuldade = "1 - 1000 (Level 3)";
        numeroIA = hash_ia[:level3];
        break
      else
        puts "DIFICULDADE INVÁLIDA"
    end #CASE
  end #SegundoLOOP

  puts "Diga o seu número entre #{dificuldade}"
  numeroPlayer = gets.to_i;

  # Comparação do número do jogador com o número da IA
  if numeroIA == numeroPlayer
    puts "Você acertou!!"
  else
    puts "Você errou! Seu número foi #{numeroPlayer}, o número da IA foi #{numeroIA}"
  end
  # Pergunta se o jogador quer jogar novamente
  puts "Quer jogar novamente? (s/n)"
  resposta = gets.chomp.downcase

  until resposta == "s" || resposta == "n"
    puts "Resposta inválida. Digite 's' para sim ou 'n' para não"
    resposta = gets.chomp.downcase  # Repetir a pergunta até uma resposta válida ser dada
  end

  if resposta == "n"
    puts "Obrigado por jogar, até a próxima!"
    break # Sai do loop externo e termina o jogo
  end
end #PrimeiroLOOP