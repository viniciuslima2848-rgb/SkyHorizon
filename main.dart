class Passageiro {
  String? nome;
  String? cpf;
  String? rg;
  String? email;
  String? celular;
}

class PlataformaVenda {
  int? codigoCanal;
  String? nomeCanal;
}

class Atendente {
  String? nome;
  String? matricula;
  String? cargo;
  String? email;
  String? celular;
  double? salario;
}

class Passagem {
  String? _codigoLocalizador = '';

  Passageiro? passageiro;
  PlataformaVenda? plataforma;
  Atendente? atendente;
  String? observacoes;

  Passagem();

  Passagem.somenteCodigo(String codigoLocalizador) {
    _codigoLocalizador = codigoLocalizador;
  }

  Passagem.completa(
    String codigoLocalizador,
    Passageiro? passageiro,
    PlataformaVenda? plataforma,
    Atendente? atendente,
    String? observacoes,
  ) {
    _codigoLocalizador = codigoLocalizador;
    this.passageiro = passageiro;
    this.plataforma = plataforma;
    this.atendente = atendente;
    this.observacoes = observacoes;
  }

  Passagem.codigoEPassageiro({
    String? codigoLocalizador,
    this.passageiro,
  }) {
    _codigoLocalizador = codigoLocalizador;
  }

  Passagem.all(
    String codigoLocalizador, {
    required this.passageiro,
    required this.plataforma,
    required this.atendente,
    this.observacoes,
  }) {
    _codigoLocalizador = codigoLocalizador;
  }

  String? getCodigoLocalizador() {
    return _codigoLocalizador;
  }

  void setCodigoLocalizador(String? codigoLocalizador) {
    if (codigoLocalizador == null || codigoLocalizador.isEmpty) {
      print("Código localizador de passagem inválido!");
      return;
    }

    _codigoLocalizador = codigoLocalizador;
  }

  String? get codigoLocalizador => _codigoLocalizador;

  set codigoLocalizador(String? codigoLocalizador) {
    if (codigoLocalizador == null || codigoLocalizador.isEmpty) {
      print("Código localizador de passagem inválido!");
      return;
    }

    _codigoLocalizador = codigoLocalizador;
  }

  void EmitirPassagem() {
    print("Passagem emitida com sucesso!");
  }

  bool CancelarPassagem() {
    print("Passagem cancelada com sucesso!");
    return true;
  }

  void AtualizarPassagem() {
    print("Passagem atualizada com sucesso!");
  }

  Passagem ConsultarPassagem(String codigo) {
    print("Passagem consultada com sucesso!");
    return Passagem();
  }
}

mixin Logger {
  void log(String mensagem) {
    print(mensagem);
  }
}

mixin Auditoria {
  void auditar(String mensagem) {
    print("[Auditoria]: $mensagem");
  }
}

class PassagemPrimeiraClasse extends Passagem with Logger, Auditoria {
  String? loungeAcesso;

  PassagemPrimeiraClasse(
    String codigoLocalizador,
    Passageiro? passageiro,
    PlataformaVenda? plataforma,
    Atendente? atendente,
    String? observacoes, {
    required this.loungeAcesso,
  }) : super.all(
          codigoLocalizador,
          passageiro: passageiro,
          plataforma: plataforma,
          atendente: atendente,
          observacoes: observacoes,
        );

  @override
  void AtualizarPassagem() {
    print("Passagem de Primeira Classe atualizada com sucesso!");
    log("Atendente responsável: ${super.atendente?.nome}");
    auditar("Verificação de segurança realizada para a Primeira Classe.");
  }
}

void main() {
  Passageiro passageiro = Passageiro();
  passageiro.nome = "João da Silva";
  passageiro.cpf = "123.456.789-00";
  passageiro.rg = "12.345.678-9";
  passageiro.email = "joao@email.com";
  passageiro.celular = "(11) 99999-9999";

  PlataformaVenda plataforma = PlataformaVenda();
  plataforma.codigoCanal = 1;
  plataforma.nomeCanal = "Site SkyHorizon";

  Atendente atendente = Atendente();
  atendente.nome = "Maria Oliveira";
  atendente.matricula = "AT001";
  atendente.cargo = "Atendente";
  atendente.email = "maria@skyhorizon.com";
  atendente.celular = "(11) 98888-8888";
  atendente.salario = 3500.00;

  Passagem passagem1 = Passagem();
  passagem1.passageiro = passageiro;
  passagem1.plataforma = plataforma;
  passagem1.atendente = atendente;
  passagem1.observacoes = "Passagem padrão";

  passagem1.EmitirPassagem();
  passagem1.AtualizarPassagem();
  passagem1.ConsultarPassagem("SH001");
  passagem1.CancelarPassagem();

  passagem1.setCodigoLocalizador("SH001");
  print("Código localizador: ${passagem1.getCodigoLocalizador()}");

  passagem1.setCodigoLocalizador("");
  passagem1.codigoLocalizador = null;

  Passagem passagem2 = Passagem.all(
    "SH002",
    passageiro: passageiro,
    plataforma: plataforma,
    atendente: atendente,
    observacoes: "Passagem criada utilizando parâmetros nomeados",
  );

  passagem2.EmitirPassagem();
  print("Código da segunda passagem: ${passagem2.codigoLocalizador}");

  PassagemPrimeiraClasse passagemVip = PassagemPrimeiraClasse(
    "VIP001",
    passageiro,
    plataforma,
    atendente,
    "Passagem de Primeira Classe",
    loungeAcesso: "Lounge VIP Internacional",
  );

  passagemVip.EmitirPassagem();
  passagemVip.AtualizarPassagem();
  passagemVip.ConsultarPassagem("VIP001");

  print("Lounge de acesso: ${passagemVip.loungeAcesso}");
}