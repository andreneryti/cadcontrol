object DMConexao: TDMConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 478
  Top = 413
  Height = 322
  Width = 448
  object SQLConexao: TSQLConnection
    ConnectionName = 'cc'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=cf-cpddsk01:cadcontrol'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet='
      'SQLDialect=3'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=sysdba'
      'WaitOnLocks=True')
    VendorLib = 'GDS32.DLL'
    BeforeConnect = SQLConexaoBeforeConnect
    Left = 80
    Top = 56
  end
  object SQLConexaoImg: TSQLConnection
    ConnectionName = 'CadSindImg'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=CadSindImg'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet='
      'SQLDialect=3'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=sysdba'
      'WaitOnLocks=True')
    VendorLib = 'GDS32.DLL'
    BeforeConnect = SQLConexaoImgBeforeConnect
    Left = 72
    Top = 112
  end
  object UserSettings: TUCSettings
    AppMessages.MsgsForm_BtNew = '&Nova Mensagem'
    AppMessages.MsgsForm_BtReplay = '&Responder'
    AppMessages.MsgsForm_BtForward = 'E&ncaminhar'
    AppMessages.MsgsForm_BtDelete = '&Excluir'
    AppMessages.MsgsForm_WindowCaption = 'Mensagens do Sistema'
    AppMessages.MsgsForm_ColFrom = 'Remetente'
    AppMessages.MsgsForm_ColSubject = 'Assunto'
    AppMessages.MsgsForm_ColDate = 'Data'
    AppMessages.MsgsForm_PromptDelete = 'Confirma excluir as mensagens selecionadas ?'
    AppMessages.MsgRec_BtClose = '&Fechar'
    AppMessages.MsgRec_WindowCaption = 'Mensagem'
    AppMessages.MsgRec_Title = 'Mensagem Recebida'
    AppMessages.MsgRec_LabelFrom = 'De :'
    AppMessages.MsgRec_LabelDate = 'Date'
    AppMessages.MsgRec_LabelSubject = 'Assunto'
    AppMessages.MsgRec_LabelMessage = 'Mensagem'
    AppMessages.MsgSend_BtSend = '&Enviar'
    AppMessages.MsgSend_BtCancel = '&Cancelar'
    AppMessages.MsgSend_WindowCaption = 'Mensagem'
    AppMessages.MsgSend_Title = 'Enviar Nova Mensagem'
    AppMessages.MsgSend_GroupTo = 'Para'
    AppMessages.MsgSend_RadioUser = 'Usu'#225'rio :'
    AppMessages.MsgSend_RadioAll = 'Todos'
    AppMessages.MsgSend_GroupMessage = 'Mensagem'
    CommonMessages.AutoLogonError = 'Falha de Auto Logon!'#13#10'Informe um usu'#225'rio e senha v'#225'lidos.'
    CommonMessages.ChangePasswordError.InvalidCurrentPassword = 'Senha Atual n'#227'o confere!'
    CommonMessages.ChangePasswordError.NewPasswordError = 'Os campos: Nova Senha e Confirma'#231#227'o devem ser iguais.'
    CommonMessages.ChangePasswordError.NewEqualCurrent = 'Nova senha igual a senha atual'
    CommonMessages.ChangePasswordError.PasswordRequired = 'A Senha '#233' obrigat'#243'ria'
    CommonMessages.ChangePasswordError.MinPasswordLength = 'A senha deve conter no m'#237'nimo %d caracteres'
    CommonMessages.ChangePasswordError.InvalidNewPassword = 'Proibido utilizar senhas obvias!'
    CommonMessages.InvalidLogin = 'Usu'#225'rio ou Senha inv'#225'lidos!'
    CommonMessages.InitialMessage.Strings = (
      'ATEN'#199#195'O Login Inicial:'
      ''
      'Usu'#225'rio : :user'
      'Senha : :password'
      ''
      'Defina as permiss'#245'es para este usu'#225'rio.')
    CommonMessages.MaxLoginAttemptsError = 
      '%d Tentativas de login inv'#225'lido. Por motivos de segun'#231'a o '#13#10'sist' +
      'ema ser'#225' fechado.'
    CommonMessages.PasswordChanged = 'Senha alterada com sucesso!'
    CommonMessages.BlankPassword = 'Retirada senha do Login %s'
    Login.WindowCaption = '::: CADCONTROL - Acesso ao Sistema :::'
    Login.LabelUser = 'Usu'#225'rio '
    Login.LabelPassword = 'Senha : '
    Login.BtOk = 'OK'
    Login.BtCancel = '&Cancelar'
    Login.LeftImage.Data = {
      07544269746D617016090000424D160900000000000036040000280000003200
      0000180000000100080000000000E00400000000000000000000000100000000
      000000000000000080000080000000808000800000008000800080800000C0C0
      C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
      E00000400000004020000040400000406000004080000040A0000040C0000040
      E00000600000006020000060400000606000006080000060A0000060C0000060
      E00000800000008020000080400000806000008080000080A0000080C0000080
      E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
      E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
      E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
      E00040000000400020004000400040006000400080004000A0004000C0004000
      E00040200000402020004020400040206000402080004020A0004020C0004020
      E00040400000404020004040400040406000404080004040A0004040C0004040
      E00040600000406020004060400040606000406080004060A0004060C0004060
      E00040800000408020004080400040806000408080004080A0004080C0004080
      E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
      E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
      E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
      E00080000000800020008000400080006000800080008000A0008000C0008000
      E00080200000802020008020400080206000802080008020A0008020C0008020
      E00080400000804020008040400080406000804080008040A0008040C0008040
      E00080600000806020008060400080606000806080008060A0008060C0008060
      E00080800000808020008080400080806000808080008080A0008080C0008080
      E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
      E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
      E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
      E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
      E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
      E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
      E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
      E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
      E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
      E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
      A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF00FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD0000FDFDFDFDFDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD525252525252525252525252
      5252FDFDFDFDFDFD0000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
      FDFDFDFDFDFDFDAFB75E5E5E66666767676F6F6F6FB752FDFDFDFDFD0000FDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDAFBF6FBFBF
      BFBFBFBFBFBFBFBFBFB752FDFDFDFDFD0000FDFDFDFDFDFDFDFDFDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDAFB76F676F6FB7B7B7B7B7776F5EB752FD
      FDFDFDFD0000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
      FDFDFDAFBF6FBFBFBFBFBFBFBFBFBFBFBFB752FDFDFDFDFD0000FDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDAFB76F676F6F6FB7B7
      B7B7776F5EB752FDFDFDFDFD0000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDAFBF6FBFBFBFBFBFBFBFBFBFBFBFBF52FDFDFDFDFD
      0000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDAF
      B76767676F6F6FB7B7B7776F5EB752FDFDFDFDFD0000FDFDFDFDFDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDAFBF6FBFBFBFBFBFBFBFBFBFBF
      BFBF52FDFDFDFDFD0000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
      FDFDFDFDFDFDFDAFB76767676F6F6F6FB7B7776F5EB752FDFDFDFDFD0000FDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDAFBF6FBFBF
      BFBFBFBFBFBFBFBFBFBF52FDFDFDFDFD0000FDFDFDFDFDFDFDFDFDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDAFBFB7AFAFB7B7B7B7BFBFBFBFB7B752FD
      FDFDFDFD0000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
      FDFDFDFDAFB76F675E5E5E5E5E5E676FB7A5FDFDFDFDFDFD0000FDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF7F79BFDFDFDFD
      FDFDA4F7A3FDFDFDFDFDFDFD0000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDF7F79BFDFDFDFDFDFDA407A3FDFDFDFDFDFDFD
      0000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
      FDF7F79BFDFDFDFDFDFDA407A3FDFDFDFDFDFDFD0000FDFDFDFDFDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF7F7A4FDFDFDFDFDFDF707
      A3FDFDFDFDFDFDFD0000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDF707A49AFDFDFDFDA30707A3FDFDFDFDFDFDFD0000FDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF7F6A4
      A49B9A9AA3A407079AFDFDFDFDFDFDFD0000FDFDFDFDFDFDFDFDFDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF7F6F7F7A4A4F70707A3FDFDFDFD
      FDFDFDFD0000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
      FDFDFDFDFDFDFDF7F6F6F6F6F607A3FDFDFDFDFDFDFDFDFD0000FDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF7A3A3A3
      A3A3FDFDFDFDFDFDFDFDFDFD0000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
      0000}
    Log.WindowCaption = 'Seguran'#231'a'
    Log.LabelDescription = 'Log do Sistema'
    Log.LabelUser = 'Usu'#225'rio :'
    Log.LabelDate = 'Data :'
    Log.LabelLevel = 'N'#237'vel m'#237'nimo : '
    Log.ColLevel = 'N'#237'vel'
    Log.ColMessage = 'Mensagem'
    Log.ColUser = 'Usu'#225'rio'
    Log.ColDate = 'Data'
    Log.BtFilter = '&Aplicar Filtro'
    Log.BtDelete = '&Excluir Log'
    Log.PromptDelete = 'Confirma excluir todos os registros de log selecionados ?'
    Log.BtClose = '&Fechar'
    UsersForm.WindowCaption = 'Seguran'#231'a'
    UsersForm.LabelDescription = 'Cadastro de Usu'#225'rios'
    UsersForm.ColName = 'Nome'
    UsersForm.ColLogin = 'Login'
    UsersForm.ColEmail = 'Email'
    UsersForm.BtAdd = '&Adicionar'
    UsersForm.BtChange = 'A&lterar'
    UsersForm.BtDelete = '&Excluir'
    UsersForm.PromptDelete = 'Confirma excluir o usu'#225'rio "%s" ?'
    UsersForm.BtRights = 'A&cessos'
    UsersForm.BtPassword = '&Senha'
    UsersForm.BtClose = '&Fechar'
    AddChangeUser.WindowCaption = 'Cadastro de Usu'#225'rios'
    AddChangeUser.LabelAdd = 'Adicionar Usu'#225'rio'
    AddChangeUser.LabelChange = 'Alterar Usu'#225'rio'
    AddChangeUser.LabelName = 'Nome : '
    AddChangeUser.LabelLogin = 'Login : '
    AddChangeUser.LabelEmail = 'Email : '
    AddChangeUser.CheckPrivileged = 'Usu'#225'rio privilegiado'
    AddChangeUser.BtSave = '&Gravar'
    AddChangeUser.BtCancel = 'Cancelar'
    AddChangeProfile.WindowCaption = 'Perfil de Usu'#225'rios'
    AddChangeProfile.LabelAdd = 'Adicionar Perfil'
    AddChangeProfile.LabelChange = 'Alterar Perfil'
    AddChangeProfile.LabelName = 'Descri'#231#227'o : '
    AddChangeProfile.BtSave = '&Gravar'
    AddChangeProfile.BtCancel = 'Cancelar'
    UsersProfile.WindowCaption = 'Seguran'#231'a'
    UsersProfile.LabelDescription = 'Perfil de Usu'#225'rios'
    UsersProfile.ColProfile = 'Perfil'
    UsersProfile.BtAdd = '&Adicionar'
    UsersProfile.BtChange = 'A&lterar'
    UsersProfile.BtDelete = '&Excluir'
    UsersProfile.BtRights = 'A&cessos'
    UsersProfile.PromptDelete = 'Existem usu'#225'rios com o perfil "%s". Confirma excluir?'
    UsersProfile.BtClose = '&Fechar'
    Rights.WindowCaption = 'Seguran'#231'a'
    Rights.LabelUser = 'Permiss'#245'es do Usu'#225'rio : '
    Rights.LabelProfile = 'Permiss'#245'es do Perfil : '
    Rights.PageMenu = 'Itens do Menu'
    Rights.PageActions = 'A'#231#245'es'
    Rights.BtUnlock = '&Liberar'
    Rights.BtLock = '&Bloquear'
    Rights.BtSave = '&Gravar'
    Rights.BtCancel = '&Cancelar'
    ChangePassword.WindowCaption = 'Seguran'#231'a'
    ChangePassword.LabelDescription = 'Trocar Senha'
    ChangePassword.LabelCurrentPassword = 'Senha Atual :'
    ChangePassword.LabelNewPassword = 'Nova Senha : '
    ChangePassword.LabelConfirm = 'Confirma'#231#227'o : '
    ChangePassword.BtSave = '&Gravar'
    ChangePassword.BtCancel = 'Cancelar'
    ResetPassword.WindowCaption = 'Definir senha do usu'#225'rio : "%s"'
    ResetPassword.LabelPassword = 'Senha : '
    Left = 200
    Top = 136
  end
  object UserControl: TDBXUserControl
    AutoStart = True
    ApplicationID = 'CadControl'
    Actions.ActionList = UserActions
    UsersForm.Action = acCadUsu
    UsersForm.UsePrivilegedField = True
    UsersForm.ProtectAdmin = True
    EncryptKey = 0
    NotAllowedItems.MenuVisible = False
    NotAllowedItems.ActionVisible = False
    Login.AutoLogon.Active = False
    Login.AutoLogon.User = 'MASTER'
    Login.AutoLogon.Password = 'MASTER'
    Login.AutoLogon.MessageOnError = True
    Login.InitialLogin.User = 'Admin'
    Login.InitialLogin.Email = '@core-rj.org.br'
    Login.InitialLogin.Password = 'Admin'
    Login.MaxLoginAttempts = 3
    Login.GetLoginName = lnNone
    LogControl.Action = acLogSis
    LogControl.Active = True
    LogControl.TableLog = 'UCLog'
    ExtraRight = <
      item
        FormName = 'frmLocAssoc'
        CompName = 'SpeedButton1'
        Caption = '2.1.1. Novo'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmLocAssoc'
        CompName = 'spAlterar'
        Caption = '2.1.2. Consultar/Alterar'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmLocAssoc'
        CompName = 'spExcluir'
        Caption = '2.1.3. Excluir'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmLocAssoc'
        CompName = 'SpeedButton2'
        Caption = '2.1.4. Alterar Dados B'#225'sicos'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmContribuicaoValores'
        CompName = 'spNovo'
        Caption = '3.1. Novo'
        GroupName = '3 - Contribui'#231#227'o - Valores'
      end
      item
        FormName = 'frmContribuicaoValores'
        CompName = 'spEditar'
        Caption = '3.2. Editar'
        GroupName = '3 - Contribui'#231#227'o - Valores'
      end
      item
        FormName = 'frmContribuicaoValores'
        CompName = 'spExcluir'
        Caption = '3.3. Excluir'
        GroupName = '3 - Contribui'#231#227'o - Valores'
      end
      item
        FormName = 'frmBoletoRecibo'
        CompName = 'spAtivarDesativar'
        Caption = '4.1. Ativar / Cancelar'
        GroupName = '4 - Situa'#231#227'o Boleto/Guia'
      end
      item
        FormName = 'frmBoletoRecibo'
        CompName = 'spImprimir'
        Caption = '4.2. Imprimir Listagem'
        GroupName = '4 - Situa'#231#227'o Boleto/Guia'
      end
      item
        FormName = 'frmBoletoRecibo'
        CompName = 'spPagar'
        Caption = '4.3. Pagar / Cancelar Pagto'
        GroupName = '4 - Situa'#231#227'o Boleto/Guia'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'editDataRegistro'
        Caption = '2.2.1. Alterar Data de Registro'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'editRepresentacao'
        Caption = '2.2.1. Alterar Representa'#231#227'o'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'editRegistroSocial'
        Caption = '2.2.1. Alterar Registro Social'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'editDataNasc'
        Caption = '2.2.1. Alterar Data Nascimento'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'editEstadocivil'
        Caption = '2.2.1. Alterar Estado Civil'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'editNaturalidade'
        Caption = '2.2.1. Alterar Naturalidade'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'editNacionalidade'
        Caption = '2.2.1. Alterar Nacionalidade'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'editPai'
        Caption = '2.2.1. Alterar Nome do Pai'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'editMae'
        Caption = '2.2.1. Alterar Nome da M'#227'e'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'editIdentidade'
        Caption = '2.2.1. Alterar Identidade'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'editDataemissao'
        Caption = '2.2.1. Alterar Data de Emiss'#227'o'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'editOE'
        Caption = '2.2.1. Alterar '#211'rg'#227'o Expedidor'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'editTitulo'
        Caption = '2.2.1. Alterar T'#237'tulo Eleitor'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'editZona'
        Caption = '2.2.1. Alterar Zona Eleitoral'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'editSecao'
        Caption = '2.2.1. Alterar Se'#231#227'o Eleitoral'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'editCNH'
        Caption = '2.2.1. Alterar CNH'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'btfoto'
        Caption = '2.2.1. Alterar Foto'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spOBSAdd'
        Caption = '2.2.2. Observa'#231#227'o - Nova'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spOBSEditar'
        Caption = '2.2.2. Observa'#231#227'o - Editar'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spOBSExcluir'
        Caption = '2.2.2. Observa'#231#227'o - Excluir'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spOBSPrint'
        Caption = '2.2.2. Observa'#231#227'o - Excluir'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spEnderAdd'
        Caption = '2.3.1. Endere'#231'o - Novo'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spEnderEdit'
        Caption = '2.3.1. Endere'#231'o - Editar'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'SpEnderExclui'
        Caption = '2.3.1. Endere'#231'o - Excluir'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spContatoAdd'
        Caption = '2.3.2. Contato - Novo'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spContatoEdit'
        Caption = '2.3.2. Contato - Editar'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spContatoExcluir'
        Caption = '2.3.2. Contato - Excluir'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spCorrespAdd'
        Caption = '2.3.3. Correspond'#234'ncia - Nova'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spCorrespEdit'
        Caption = '2.3.3. Correspond'#234'ncia - Editar'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spCorrespExcluir'
        Caption = '2.3.3. Correspond'#234'ncia - Excluir'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spRelAdd'
        Caption = '2.4.1. Relacionamento - Novo'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spRelEdit'
        Caption = '2.4.1. Relacionamento - Editar'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spRelDel'
        Caption = '2.4.1. Relacionamento - Excluir'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spCapSocAdd'
        Caption = '2.4.2. Capital Social - Novo'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spCapSocEdit'
        Caption = '2.4.2. Capital Social - Editar'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spCapSocDel'
        Caption = '2.4.2. Capital Social - Excluir'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spSegmentoAdd'
        Caption = '2.4.3. Segmento - Novo'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spSegmentoDel'
        Caption = '2.4.3. Segmento - Excluir'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spSindAdd'
        Caption = '2.4.4. Sindicato - Novo'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spSindDel'
        Caption = '2.4.4. Sindicato - Excluir'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spDocsEntregueEditar'
        Caption = '2.5.1. Docs. Entregues - Editar'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'sdAnexoAdd'
        Caption = '2.5.2. Anexos - Novo'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spAnexosEditar'
        Caption = '2.5.2. Anexos - Editar'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spAnexosDel'
        Caption = '2.5.2. Anexos - Excluir'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spMovimentoAdd'
        Caption = '2.6.1. Movimento - Novo'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spMovimentoEdit'
        Caption = '2.6.1. Movimento - Editar'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spMovimentoDel'
        Caption = '2.6.1. Movimento - Excluir'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spMovimentoPrint'
        Caption = '2.6.1. Movimento - Imprimir'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spPrevisao'
        Caption = '2.7.1. D'#233'bitos - Previs'#227'o'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spBoleto'
        Caption = '2.7.2. D'#233'bitos - Boleto / Guia'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spExtrato'
        Caption = '2.7.3. D'#233'bitos - Extrato'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spPrescricao'
        Caption = '2.7.4. D'#233'bitos - Prescri'#231#227'o'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spManutencao'
        Caption = '2.7.6. D'#233'bitos - Manuten'#231#227'o'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'SpNovoParc'
        Caption = '2.8.1. Parcelamento - Novo'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spExcluirParc'
        Caption = '2.8.2. Parcelamento - Excluir'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'SpAtivarParc'
        Caption = '2.8.3. Parcelamento - Ativar/Desativar'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spManutencaoParcelamento'
        Caption = '2.8.4. Parcelamento - Manuten'#231#227'o'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spIsencao'
        Caption = '2.7.5. D'#233'bitos - Isen'#231#227'o'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spExtornoPresc'
        Caption = '2.7.7. D'#233'bitos - Estorno Prescricao'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'EditarVencimentoValor1'
        Caption = '2.8.1. Editar Vencimento/Valor Parcelas'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spRecibo'
        Caption = '2.7.8. D'#233'bitos - Recibo'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmNovoAssoc'
        CompName = 'spReciboParcelamento'
        Caption = '2.8.5. Parcelamento - Recibo'
        GroupName = '2 - Filiados'
      end
      item
        FormName = 'frmInadimplencia'
        CompName = 'spGerarBoleto'
        Caption = '6.1. Gerar Boleto/Guia'
        GroupName = '6 - Inadimpl'#234'ncia'
      end
      item
        FormName = 'frmInadimplencia'
        CompName = 'spImprimirEtiq'
        Caption = '6.2. Imprimir Etiquetas'
        GroupName = '6 - Inadimpl'#234'ncia'
      end
      item
        FormName = 'frmInadimplencia'
        CompName = 'spGerarPlanilha'
        Caption = '6.3. Gerar Planilha'
        GroupName = '6 - Inadimpl'#234'ncia'
      end
      item
        FormName = 'frmInadimplencia'
        CompName = 'spRecuperacaoCredito'
        Caption = '6.4. Adicionar a Lote'
        GroupName = '6 - Inadimpl'#234'ncia'
      end
      item
        FormName = 'frmRelatParcelamentos'
        CompName = 'spImprimirEtiq'
        Caption = '9.1. Imprimir Etiquetas'
        GroupName = '9 - Relat'#243'rio de Parcelamento'
      end
      item
        FormName = 'frmRelatParcelamentos'
        CompName = 'spEnviarMala'
        Caption = '9.3. Mala Direta'
        GroupName = '9 - Relat'#243'rio de Parcelamento'
      end
      item
        FormName = 'frmRelatParcelamentos'
        CompName = 'spGerarPlanilha'
        Caption = '9.5. Gerar Planilha'
        GroupName = '9 - Relat'#243'rio de Parcelamento'
      end
      item
        FormName = 'frmRelatParcelamentos'
        CompName = 'spRecuperacaoCredito'
        Caption = '9.7. Adicionar a Lote'
        GroupName = '9 - Relat'#243'rio de Parcelamento'
      end
      item
        FormName = 'frmLotesControle'
        CompName = 'btnAdicionarRegistro'
        Caption = '10.1 - Adicionar Cadastro'
        GroupName = '10 - Recupera'#231#227'o de Cr'#233'dito'
      end
      item
        FormName = 'frmLotesControle'
        CompName = 'btnDocumentos'
        Caption = '10.3 - Documentos'
        GroupName = '10 - Recupera'#231#227'o de Cr'#233'dito'
      end
      item
        FormName = 'frmLotesControle'
        CompName = 'btnEnviarMala'
        Caption = '10.5 - Mala Direta'
        GroupName = '10 - Recupera'#231#227'o de Cr'#233'dito'
      end
      item
        FormName = 'frmLotesControle'
        CompName = 'btnGerarPlanilha'
        Caption = '10.7 - Gerar Planilha'
        GroupName = '10 - Recupera'#231#227'o de Cr'#233'dito'
      end
      item
        FormName = 'frmLotesControle'
        CompName = 'btnAtualizarValores'
        Caption = '10.9 - Atualizar Valores'
        GroupName = '10 - Recupera'#231#227'o de Cr'#233'dito'
      end
      item
        FormName = 'frmLotesControle'
        CompName = 'btnManutRepasse'
        Caption = '10.11 - Manuten'#231#227'o de Repasse'
        GroupName = '10 - Recupera'#231#227'o de Cr'#233'dito'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'DFDF1'
        Caption = '1.1. Cadastro'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'GDFD1'
        Caption = '1.1.1. Cadastro: Filiados'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'Documentos1'
        Caption = '1.1.2. Cadastro: Tipos'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'Contatos1'
        Caption = '1.1.2.1. Cadastro: Tipos de Contato'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'ipodeMovimentao1'
        Caption = '1.1.2.2. Cadastro: Tipo de Movimenta'#231#227'o'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'ndicedeCorreo1'
        Caption = '1.1.3. Cadastro: '#205'ndice de Corre'#231#227'o'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'ValorContribuio1'
        Caption = '1.1.4. Cadastro: Contribui'#231#227'o - Valores'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'Sair1'
        Caption = '1.1.5. Sair'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'Operaes1'
        Caption = '1.2. Opera'#231#245'es'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'ExtratoNovoRegistro1'
        Caption = '1.2.1. Opera'#231#245'es: Extrato - Novo Registro'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'DatadoSistema1'
        Caption = '1.2.2. Opera'#231#245'es: Data do Sistema'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'BoletoRecibo1'
        Caption = '1.2.3. Opera'#231#245'es: Situa'#231#227'o - Boleto / Guia'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'LeituradeRetorno1'
        Caption = '1.2.4. Opera'#231#245'es: Leitura de Retorno'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'Inadimplncia1'
        Caption = '1.2.6. Opera'#231#245'es: Inadimpl'#234'ncia'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'Usurio1'
        Caption = '1.3. Usu'#225'rio'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'rocarSenha1'
        Caption = '1.3.1. Usu'#225'rio: Trocar Senha'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'EfetuarLogoff1'
        Caption = '1.3.2. Usu'#225'rio: Mensagens'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'Mensagens1'
        Caption = '1.3.3. Usu'#225'rio: Efetuar Logoff'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'Manuteno1'
        Caption = '1.4. Manuten'#231#227'o'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'Usurios1'
        Caption = '1.4.1. Manuten'#231#227'o: Usu'#225'rios'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'CadastrodeUsurios1'
        Caption = '1.4.1.1. Manuten'#231#227'o: Cadastro de Usu'#225'rios'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'Permisses1'
        Caption = '1.4.1.2. Manuten'#231#227'o: Perfil de Usu'#225'rios'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'LogdoSistema1'
        Caption = '1.4.2. Manuten'#231#227'o: Log do Sistema'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'Relatrios1'
        Caption = '1.5. Relat'#243'rios'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'ListagemdeFiliados1'
        Caption = '1.5.1. Relat'#243'rios: Listagem de Filiados'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'Parcelamentos1'
        Caption = '1.5.2. Relat'#243'rios: Parcelamentos'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'Filiadosemdia1'
        Caption = '1.2.7. Filiados em dia'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'Selic1'
        Caption = '1.1.3.1. Taxa Selic'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'IGPM1'
        Caption = '1.1.3.2. Taxa IGPM'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'ResumoCadastral1'
        Caption = '1.5.3. Relat'#243'rios: Resumo Cadastral'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'MovimentoporPerodo1'
        Caption = '1.5.4. Relat'#243'rios: Financeiro >>Movimento por Per'#237'odo'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'MalaDireta1'
        Caption = '1.1.6. Cadastro: Mala Direta'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'SimulaodeValordeGuia1'
        Caption = '1.2.7. Opera'#231#245'es: Simula'#231#227'o de Valor de Guia'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'RecebimentosporPerodoGuias1'
        Caption = '1.5.5. Recebimentos por Per'#237'odo (Guias)'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'GuiasNoIdentificadas1'
        Caption = '1.5.6. Guias N'#227'o Identificadas'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'MovimentaoporPerodo1'
        Caption = '1.5.7. Movimenta'#231#227'o por Per'#237'odo'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'AdesoaoSimplesNacional1'
        Caption = '1.5.8. Ades'#227'o ao Simples Nacional'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'AtendimentosObservaes1'
        Caption = '1.5.9. Atendimentos (Observa'#231#245'es)'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'LotesRecuperaodeCrditos1'
        Caption = '1.2.9. Lotes (Recupera'#231#227'o de Cr'#233'ditos)'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'RepassedePagamentos1'
        Caption = '1.5.10. Lotes - Repasse de Pagamentos'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'Remessa1'
        Caption = '1.2.5. Remessa'
        GroupName = '1 - Menu Principal'
      end
      item
        FormName = 'frmPrincipal'
        CompName = 'ExtratoNovoRegistroNova1'
        Caption = '1.2.7. Extrato - Novo Registro - Nova'
        GroupName = '1 - Menu Principal'
      end>
    UsersProfile.Active = True
    UsersProfile.Action = acPerfilUsu
    TableUsers = 'UCUSUARIO'
    TableRights = 'UCPERMISSOES'
    ChangePasswordForm.Action = acTrocaSenha
    ChangePasswordForm.ForcePassword = False
    ChangePasswordForm.MinPasswordLength = 0
    SQLConnection = SQLConexao
    Left = 200
    Top = 200
  end
  object AppMessages: TUCAppMessage
    Active = True
    Interval = 30000
    TableMessages = 'UCMESSAGE'
    UserControl = UserControl
    Left = 280
    Top = 208
  end
  object UserActions: TActionList
    Left = 72
    Top = 176
    object acCadUsu: TAction
      Category = 'Usuario'
      Caption = 'Cadastro de Usu'#225'rios'
    end
    object acPerfilUsu: TAction
      Category = 'Usuario'
      Caption = 'Perfil de Usu'#225'rios'
    end
    object acLogSis: TAction
      Category = 'Usuario'
      Caption = 'Log do Sistema'
    end
    object acTrocaSenha: TAction
      Category = 'Usuario'
      Caption = 'Trocar Senha'
    end
    object acLogOff: TAction
      Category = 'Usuario'
      Caption = 'Efetuar Logoff'
      OnExecute = acLogOffExecute
    end
    object acUserMessages: TAction
      Category = 'Usuario'
      Caption = 'Mensagens'
      OnExecute = acUserMessagesExecute
    end
  end
  object Imagens: TImageList
    Left = 269
    Top = 144
    Bitmap = {
      494C01019F00A400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000009002000001002000000000000090
      0200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000636B7300C69C94000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000316B
      4200316B4200316B4200296342002963420029634200215A3900215A3900215A
      3900185231001852310018523100184A29000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000737373000000000000000000000000006394B500218CEF002173B500CE9C
      9400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006BA57B0063A5730063A5
      73005A9C73005A9C73005A946B005A946B004A945A004A945A004A945A00398C
      5200398C5200318C4A00318C4A00184A29000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84009C9C9C008C8C8C0000000000000000004AB5FF0042A5FF00218CEF007B84
      9400CE9C94000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000427B52006BA57B00EFF7EF00EFF7
      EF00E7F7E700E7EFE700E7EFE700DEEFDE00DEEFDE00DEEFDE00DEEFDE00DEEF
      DE00DEE7DE00DEE7DE00318C4A00184A29000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000212121004242
      4200A5A5A5000000000000000000000000000000000052BDFF005ABDFF00218C
      EF002173B500CE9C940000000000000000000000000000000000000000000000
      000000000000000000000000000000000000427B520073AD8400EFF7EF00EFF7
      EF00EFF7EF00E7F7E700E7EFE700E7EFE700DEEFDE00DEEFDE00DEEFDE00DEEF
      DE00DEEFDE00DEE7DE00398C5200185231000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021212100313131006363
      73008C8C8C000000000000000000000000000000000031A5FF0052BDFF0042A5
      FF00218CEF0084849400CE9C9400000000000000000000000000000000000000
      00000000000000000000000000000000000042845A0073AD8400EFF7EF00EFF7
      EF00EFF7EF00EFF7EF00EFF7EF00E7EFE70084AD8C0029523100295231002952
      310029523100DEEFDE00398C5200185231000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002121210042424200636373000000
      00000000000000000000000000000000000000000000000000000000000052BD
      FF005ABDFF003184D60052636B00000000009C6B6B00CEA59C00D6B5A500CE9C
      9C00C69494000000000000000000000000004A8463007BB58C00F7FFF70052A5
      5A0029523100295231002952310029523100187B18006BB573004A945A004A94
      4A00215A3900DEEFDE004A945A00215A39000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000073EFFF000000000000000000212121003131310063637300848484000000
      00000000000000000000000000000000000000000000000000000000000031A5
      FF0052BDFF00C6CEDE009C9C9C00AD8C8400E7D6BD00FFFFD600FFFFDE00FFFF
      D600EFDEC600000000000000000000000000528C630084BD9400F7FFF700F7F7
      F70052A55A0063B5730052A55A00187B18007BC684004A945A004A944A00215A
      390084AD8C00DEEFDE004A945A00215A39000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073EFFF000073D6000000
      00004A4AAD003942840021100000424242006363730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6ADAD00CEA59400FFE7BD00FFF7CE00FFFFD600FFFFD600FFFF
      DE00FFFFE700FFFFFF00C6A5A500000000005A946B008CB59400F7FFF700F7FF
      F700F7FFF70052A55A003184310084BD94004A945A004A944A00215A3900639C
      6300639C6300DEEFDE004A945A00215A39000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073EFFF004ACEFF007B73
      B500317BDE001808840010003900636373008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD8C8C00EFDEB500F7D6AD00FFF7CE00EFDEA500B55A1800FFFF
      EF00FFFFF700FFFFFF00F7EFDE00000000005A9C730094C69C00FFFFFF00F7FF
      F700F7FFF7003184310094C69C005AAD630052A55A00316B4200006B0000E7F7
      E700E7EFE700E7EFE7005A946B00296342000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007384C60021A5
      F700B5FFFF0039C6FF0073EFFF0052526B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E7CEAD00FFEFBD00F7CE9C00EFC68400EFC68400B55A1800E7D6
      C600E7D6C600FFFFDE00FFFFDE00C694940063A5730094C69C00FFFFFF00FFFF
      FF00429442009CD6A5006BB573005AAD630042844A0052A55A0031843100006B
      0000E7F7E700E7EFE7005A946B00296342000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002163D6000073D600B5FF
      FF00A5F7FF008CEFFF0029ADF700426BE7005252B50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFD6B500FFE7B500F7C68C00B55A1800B55A1800B55A1800B55A
      1800B55A1800FFFFDE00FFFFDE00BD9C8C006BA57B009CD6A500FFFFFF004A94
      4A00ADD6B50073BD7B0073BD7B004A945A0052845A006BB56B0052A55A003184
      3100006B0000E7F7E7005A9C7300316B42000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073EFFF00A5ADEF006373D60021BD
      FF0073EFFF0063DEFF00189CFF007B94DE0073EFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E7CEAD00FFEFBD00EFBD8400F7C69400FFEFC600B55A1800FFFF
      D600FFFFD600FFFFD600FFFFDE00C694940073AD84009CD6A500FFFFFF006BB5
      6B0063AD6B0063AD6B00529C5A00F7FFF700F7FFF70052845A0052845A005284
      5A0052845A00EFF7EF005A9C7300316B42000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000847B94002973
      B50042C6EF0029A5E700296BC600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D6ADA500FFEFBD00F7DEAD00F7CE9C00F7D6A500B55A1800FFFF
      D600FFFFD600FFFFD600FFFFD6000000000073AD8400ADD6B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFF700F7FFF700F7F7F700EFF7
      EF00EFF7EF00EFF7EF0063A57300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000399CE7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C69C8C00FFFFFF00FFFFFF00F7C69400EFBD8400F7C6
      9400F7D6AD00FFEFC600BD9C8C00000000007BB58C00ADD6B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFF700F7FFF700F7F7
      F700EFF7EF00EFF7EF0063A57300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004ACEFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFEFE700FFFFEF00FFE7B500F7DEAD00FFE7
      B500FFEFBD00C69C940000000000000000007BB58C00ADD6B500ADD6B5009CD6
      A5009CD6A50094C69C0094C69C0094C69C008CB5940084BD94007BB58C0073AD
      840073AD840073AD84006BA57B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C69C8C00CEA59C00C69C
      94000000000000000000000000000000000084BD94007BB58C0073AD840073AD
      84006BA57B0063A573005A9C73005A946B00528C63004A8463004A8463004284
      5A00427B5200427B520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE63000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000000000000000000000000000000000000000
      000000000000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE63000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE6300000000000000000000FFE7C600FFDEB500FFD6
      A500DE7B0000FFDEB500FFD6AD00CE6300000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFE7C600FFDE
      B500FFDEB500FFD6AD00FFD6A500FFD6A500DE7B0000FFDEBD00FFDEB500FFD6
      AD00FFD6AD00FFD6A500FFD6A500000000000000000000000000000000000000
      000000000000CE630000FFFFFF00FFF7E700FFF7E700FFF7E700FFEFD600FFE7
      C600FFE7C600FFD6AD00FFD6AD00CE63000000000000CE630000FFFFFF00FFF7
      EF00FFF7E700FFEFDE00FFEFD600FFE7CE00FFE7C600FFDEBD00FFDEB500FFD6
      AD00FFD6AD00FFD6A500CE6300000000000000000000FFEFD600FFE7C600FFD6
      A500DE7B0000FFE7C600FFDEB500CE6300000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFEFD600FFE7
      C600FFDEBD00FFDEB500FFD6AD00FFD6A500DE7B0000FFE7C600FFE7C600FFDE
      B500FFDEB500FFD6A500FFD6A500000000000000000000000000000000000000
      000000000000CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7E700FFF7
      E700FFEFD600FFE7C600FFDEB500CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7EF00FFF7E700FFEFDE00FFE7C600FFE7C600FFDE
      B500FFDEB500FFD6AD00CE6300000000000000000000FFFFF700FFF7E700FFE7
      C600DE7B0000FFF7E700FFEFD600CE6300000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFEFD600FFE7
      C600FFE7C600FFDEB500FFDEB500FFD6A500DE7B0000FFEFD600FFE7C600FFDE
      BD00FFDEB500FFD6A500FFD6A500000000000000000000000000000000000000
      000000000000CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      E700FFF7E700FFEFD600FFE7C600CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFF7EF00FFF7E700FFEFD600FFE7CE00FFDE
      BD00FFDEB500FFD6AD00CE6300000000000000000000FFFFFF00FFF7EF00FFEF
      CE00DE7B0000FFF7F700FFF7E700CE6300000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFF7EF00FFEF
      D600FFEFD600FFE7C600FFE7BD00FFD6A500DE7B0000FFF7E700FFF7DE00FFEF
      CE00FFE7C600FFDEB500FFD6A50000000000FFD6AD00FFF7E700FFF7E700FFF7
      E700FFF7E700CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7E700FFEFD600CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFDE00FFE7
      CE00FFE7C600FFDEB500CE6300000000000000000000FFFFFF00FFF7EF00FFF7
      EF00DE7B0000FFF7EF00FFF7EF00CE6300000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFF7
      E700FFF7DE00FFEFCE00FFE7C600FFDEB500DE7B0000FFF7EF00FFF7E700FFEF
      D600FFEFCE00FFE7BD00FFDEB50000000000FFD6AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7E700CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7E700FFEF
      D600FFEFCE00FFE7C600CE6300000000000000000000DE7B0000DE7B0000DE7B
      0000DE7B0000DE7B0000DE7B0000CE6300000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFF7
      F700FFF7EF00FFEFD600FFEFD600FFDEB500DE7B0000FFFFFF00FFFFF700FFF7
      E700FFF7DE00FFE7C600FFDEB50000000000FFD6AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DE7B0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      E700FFEFD600FFE7C600CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFFF
      F700FFF7EF00FFF7E700FFEFD600FFE7C600DE7B0000FFFFFF00FFFFF700FFF7
      EF00FFF7E700FFEFCE00FFE7C60000000000FFD6AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B
      0000DE7B0000DE7B0000DE7B0000CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      EF00FFF7E700FFEFD600CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFFF
      F700FFF7F700FFF7EF00FFF7E700FFE7C600DE7B0000FFFFFF00FFFFF700FFF7
      F700FFF7EF00FFEFD600FFE7C60000000000FFD6AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00D6731000D6731000D6731000D6731000D6731000D673
      1000D6731000D6731000D67310000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFF
      FF00FFF7EF00FFEFD600CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFF7
      F700FFF7F700FFF7EF00FFF7E700FFEFD600DE7B0000FFFFFF00FFF7EF00FFF7
      EF00FFF7EF00FFEFD600FFEFD60000000000FFD6AD00FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00DEBD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      EF00FFF7EF00FFEFD600CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D66B0000FFFFFF00FFF7
      EF00FFFFF700FFF7E700FFF7E700FFF7EF00DE7B0000FFFFFF00FFF7EF00FFF7
      EF00FFF7E700FFF7EF00FFF7EF000000000000000000FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000D66B0000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7
      EF00FFF7E700FFF7EF00CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6730000DE7B0000DE7B
      0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B
      0000DE7B0000DE7B0000DE7B0000000000000000000000000000000000000000
      000000000000FFD6AD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000D6730000DE7B0000DE7B
      0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B
      0000DE7B0000DE7B0000CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6731000D673
      1000D6731000D6731000D6731000CE63000000000000D6731000D6731000D673
      1000D6731000D67B2100D6731000000000000000000000000000000000000000
      000000000000FFD6AD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000D6731000D673
      1000D6731000D6731000D6731000D6731000D6731000D6731000D6731000D673
      1000D6731000D67B210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000052CEE70010A5CE00089C
      BD00089CBD00089CBD00089CBD00089CC600089CBD00089CBD00089CBD00089C
      BD00089CBD00218CAD0063292900000000000000000000000000000000000000
      0000CE630000FFF7E700FFF7E700FFF7E700FFF7E700FFEFD600FFE7C600FFDE
      B500FFD6AD00FFD6AD00CE6300000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE6300000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000000000000000000008B5DE0000B5DE0000BD
      E70000BDE70000BDE70000C6EF00219CBD0010B5DE0000BDE70000BDE70000BD
      E70000BDE70000C6F700396B7B00000000000000000000000000000000000000
      0000CE630000FFFFFF00FFFFFF00FFF7E700FFF7E700FFF7E700FFEFD600FFE7
      C600FFDEB500FFD6AD00CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFF7EF00FFF7EF00FFF7EF00FFEFD600FFEFD600FFDEB500FFDEB500FFDE
      B500FFD6AD00FFD6AD00CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFF7EF00FFF7EF00FFF7EF00FFEFD600FFEFD600FFDEB500FFDEB500FFDE
      B500FFD6AD00FFD6AD00CE630000000000000000000018C6E70000C6EF0000D6
      FF0000D6FF0000D6FF0000C6E700311018005221310000D6FF0000D6FF0000D6
      FF0010EFFF0008BDE7006B4A520000000000000000000000000000000000CE63
      0000CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7E700FFF7
      E700FFEFD600FFDEB500CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFFFF700FFF7E700FFEFDE00FFE7
      C600FFE7BD00FFD6AD00CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFF7E700FFF7DE00FFE7
      C600FFE7BD00FFD6AD00CE630000000000000000000063DEEF0000C6E70008DE
      FF0000D6FF0000D6FF0000D6EF000800000018394A0000D6FF0000D6FF0008DE
      FF0010EFFF00298C9C009C7B7B0000000000000000000000000000000000FFFF
      FF00CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      E700FFEFD600FFE7C600CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00FFEF
      DE00FFEFCE00FFDEB500CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00FFEF
      D600FFEFCE00FFDEB500CE6300000000000000000000000000006BDEF70008DE
      FF0008E7FF0000DEFF0000DEFF00187B940000DEFF0000DEFF0000DEFF0018F7
      FF0000DEFF00AD8484000000000000000000000000000000000000000000FFFF
      FF00CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFEFD600CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      EF00FFF7E700FFDEB500CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      EF00FFF7E700FFDEB500CE6300000000000000000000000000000000000000D6
      EF0010EFFF0000DEFF0000DEFF003931420000D6EF0000DEFF0000DEFF0008DE
      FF0000D6EF0000000000000000000000000000000000CE630000CE630000FFFF
      FF00CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7E700CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7EF00FFEFD600CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7EF00FFEFD600CE6300000000000000000000000000000000000008CE
      E70000D6EF0000E7FF0000EFFF0084314200188C9C0000E7FF0010F7FF0008CE
      E7005A52520000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B
      0000DE7B0000DE7B0000CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFF7EF00FFF7EF00FFF7EF00FFEFD600FFEFD600FFDEB500FFDEB500FFDE
      B500FFD6AD00FFD6AD00CE6300000000000000000000DEBD9400CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000E7A563000000000000000000000000000000000063DE
      EF0000D6E70008EFFF0000EFF7006B213100396B7B0008EFFF0018F7FF002994
      9C00A57B7B0000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7EF00FFF7E700FFF7E700FFEFD600FFEFCE00FFE7
      BD00FFDEB500FFD6AD00CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00FFF7EF00FFEFD600FFEFD600FFDE
      B500FFDEB500FFD6AD00CE630000000000000000000000000000000000000000
      000063E7EF0008F7F70008DEDE00310010003918210018F7FF0000EFFF00A56B
      6B000000000000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7E70000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00FFEF
      D600FFE7C600FFDEB500CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00FFEF
      D600FFE7C600FFDEB500CE630000000000000000000000000000000000000000
      00000000000000EFF70008DEDE00310010003110180008F7FF0008DEEF000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00DE7B
      0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B
      0000DE7B000000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      E700FFEFDE00FFDEB500CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      E700FFEFD600FFDEB500CE630000000000000000000000000000000000000000
      00000000000010E7EF0000EFF70000DEE70018FFFF0008E7EF005A6363000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00D673
      1000D6731000D6731000D6731000D6731000D6731000D6731000D6731000D673
      1000D673100000000000000000000000000000000000D66B0000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7EF00FFEFD600CE6300000000000000000000D66B0000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7EF00FFEFD600CE630000000000000000000000000000000000000000
      00000000000063E7EF0000E7EF0008FFFF0018FFFF0021B5BD00946363000000
      00000000000000000000000000000000000000000000DE7B0000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE63
      00000000000000000000000000000000000000000000D6730000DE7B0000DE7B
      0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B
      0000DE7B0000DE7B0000CE6300000000000000000000D6730000DE7B0000DE7B
      0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B
      0000DE7B0000DE7B0000CE630000000000000000000000000000000000000000
      000000000000000000004AEFEF0031FFFF0000FFFF0094737300000000000000
      00000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000000000000000000000000000000000000000000000000000D6731000D673
      1000D6731000D6731000D6731000D6731000D6731000D6731000D6731000D673
      1000D6731000D67B210000000000000000000000000000000000D6731000D673
      1000D6731000D6731000D6731000D6731000D6731000D6731000D6731000D673
      1000D6731000D67B210000000000000000000000000000000000000000000000
      000000000000000000000000000008F7FF0010F7F70000000000000000000000
      0000000000000000000000000000000000000000000000000000D6731000D673
      1000D6731000D6731000D6731000D6731000D6731000D6731000D67310000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000063DEEF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE6300000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C636300948C
      8C00A59C9C00A59C9C00A59C9C00B5A5A500BDADAD00B5A5A500B5A5A5009C84
      84008473730094949400000000000000000000000000CE630000FFFFFF00FFF7
      EF00FFF7E700FFEFDE00FFEFD600FFE7CE00FFE7C600FFDEBD00FFDEB500FFD6
      AD00FFD6AD00FFD6A500CE6300000000000000000000CE630000FFFFFF00FFF7
      EF00FFF7E700FFEFDE00FFEFD600FFE7CE00FFE7C600FFDEBD00FFDEB500FFD6
      AD00FFD6AD00FFD6A500CE63000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE6300000000000000000000000000009C636300948C
      8C00ADADAD00C6C6C600C6C6C600B5A5A500BDADAD00CEB5B500D6BDBD00E7C6
      C600E7C6C60084848400000000000000000000000000CE630000FFFFFF00DE7B
      0000CE630000FFF7EF00FFF7EF00FFEFD600FFEFD600DE7B0000CE630000FFDE
      B500FFDEB500FFD6AD00CE6300000000000000000000CE630000FFFFFF00E7A5
      6300DE7B0000FFFFF700FFF7EF00DE7B0000CE630000FFE7C600E7A56300CE63
      0000FFDEB500FFD6AD00CE63000000000000CE630000FFF7EF00FFF7EF00FFEF
      DE00FFEFD600FFE7CE00FFE7C600FFDEBD00FFDEB500FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD000000000000000000000000009C636300948C
      8C00948C8C00A59C9C00AD9C9C00BDA5A500946B6B00CEB5B500AD9C9C00ADA5
      A500ADA5A50084848400000000000000000000000000CE630000FFFFFF00E7A5
      6300CE630000FFFFFF00FFF7EF00FFF7EF00FFEFD600E7A56300CE630000FFDE
      B500FFDEB500FFD6AD00CE6300000000000000000000CE630000FFFFFF00E7A5
      6300E7A56300FFFFFF00FFFFFF00E7A56300CE630000FFEFD600E7A56300CE63
      0000FFDEB500FFD6AD00CE63000000000000CE630000FFFFF700FFF7EF009C94
      94009C949400FFEFD600FFE7CE009C9494009C949400FFDEB500FFD6AD009C94
      94009C949400FFD6AD00FFD6AD000000000000000000000000009C6363009C9C
      9C00BDBDBD00C6C6C600CEC6C600BDA5A500946B6B00CEB5B500D6BDBD00E7C6
      C600E7CECE0084848400000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFEFD600FFEFD600FFE7
      C600FFE7C600FFDEB500CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFEFD600FFE7
      C600FFE7C600FFDEB500CE63000000000000CE630000FFFFFF00FFFFFF004273
      FF004273FF00FFEFDE00FFEFDE00A5390800A5390800FFDEBD00FFDEB500009C
      CE00009CCE00FFD6AD00FFD6AD000000000000000000000000009C6363009494
      9400A59C9C00AD9C9C00B5A5A500BDA5A500946B6B00D6BDBD00C6ADAD00B5A5
      A500ADA5A50084848400000000000000000000000000CE630000FFFFFF00CE63
      0000CE6300009C9C9C00848484006B6B6B00FFFFFF00CE630000CE6300009C9C
      9C00848484006B6B6B00CE6300000000000000000000CE630000FFFFFF00CE63
      0000CE630000FFFFFF00FFFFFF00CE630000CE630000FFF7EF00CE630000CE63
      0000FFEFD600FFE7C600CE63000000000000CE630000FFFFFF00FFFFFF004273
      FF004273FF00FFF7E700FFF7E700A5390800A5390800FFE7C600FFDEBD00009C
      CE00009CCE00FFD6AD00FFD6AD000000000000000000000000009C6363009C9C
      9C00BDBDBD00CEC6C600CEC6C600C6A5A500946B6B00D6BDBD00DEC6C600E7CE
      CE00E7CECE0084848400000000000000000000000000CE630000FFFFFF00E7A5
      6300CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7A56300CE630000FFEF
      D600FFE7C600FFE7C600CE6300000000000000000000CE630000FFFFFF00E7A5
      6300E7A56300FFFFFF00FFFFFF00E7A56300CE630000FFFFFF00E7A56300CE63
      0000FFEFD600FFE7C600CE63000000000000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7EF00FFF7E700FFEFDE00FFE7CE00FFE7CE00FFDE
      BD00FFDEBD00FFD6AD00FFD6AD000000000000000000000000009C6363009C94
      9400A5949400ADA5A500B5A5A500C6A5A500946B6B00D6BDBD00C6ADAD00B5A5
      A500ADA5A50084848400000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00FFF7
      EF00FFEFD600FFEFD600CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      EF00FFF7EF00FFEFD600CE63000000000000CE630000FFFFFF00FFFFFF00B5B5
      B500B5B5B500FFFFF700FFFFF700B5B5B500B5B5B500FFEFD600FFEFD600ADAD
      AD00ADADAD00FFDEB500FFDEB5000000000000000000000000009C636300A59C
      9C00C6BDBD00CEC6C600D6CECE00C6A5A500946B6B00DEC6C600E7CECE00E7CE
      CE00E7CECE0084848400000000000000000000000000CE630000FFFFFF00CE63
      0000CE6300009C9C9C00848484006B6B6B00FFFFFF00CE630000CE6300009C9C
      9C00848484006B6B6B00CE6300000000000000000000CE630000FFFFFF00CE63
      0000CE630000FFFFFF00FFFFFF00CE630000CE630000FFFFFF00CE630000CE63
      0000FFF7EF00FFEFD600CE63000000000000CE630000FFFFFF00FFFFFF00CE9C
      9C00CE9C9C00FFFFFF00FFFFFF00E77B0000E77B0000FFF7E700FFEFDE00009C
      0000009C0000FFE7C600FFDEBD000000000000000000000000009C6363009C94
      9400A59C9C00B5A5A500BDADAD008C737300735A5A00A5848400CEB5B500CEBD
      BD00C6BDBD0084848400000000000000000000000000CE630000FFFFFF00DE7B
      0000CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00DE7B0000CE630000FFF7
      EF00FFF7EF00FFEFD600CE6300000000000000000000CE630000FFFFFF00E7A5
      6300DE7B0000FFFFFF00FFFFFF00DE7B0000CE630000FFFFFF00E7A56300CE63
      0000FFF7EF00FFEFD600CE63000000000000CE630000FFFFFF00FFFFFF00CE9C
      9C00CE9C9C00FFFFFF00FFFFFF00E77B0000E77B0000FFF7EF00FFF7E700009C
      0000009C0000FFE7C600FFE7C6000000000000000000000000009C636300ADA5
      A500C6C6C600CEC6C600CEC6C600AD7B7B00AD949400AD8C8C00C6949400E7D6
      D600E7D6D60084848400000000000000000000000000D66B0000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7EF00FFF7EF00CE6300000000000000000000D66B0000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7
      EF00FFF7E700FFF7EF00CE63000000000000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFF7
      E700FFF7E700FFEFD600FFE7CE000000000000000000000000009C636300A59C
      9C00AD9C9C00BDA5A500C6ADAD00CE8C8C00CE9C9C00CE8C8C00CE949400C6BD
      BD00C6BDBD0084848400000000000000000000000000D6730000DE7B0000DE7B
      0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B
      0000DE7B0000DE7B0000CE6300000000000000000000D6730000DE7B0000DE7B
      0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B
      0000DE7B0000DE7B0000CE63000000000000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      EF00FFF7EF00FFEFDE00FFEFD6000000000000000000000000009C636300ADA5
      A500CEC6C600DECECE00DED6D600CEADAD00946B6B00E7C6C600E7D6D600E7D6
      D600E7DEDE008484840000000000000000000000000000000000D6731000D673
      1000D6731000D6731000D6731000D6731000D6731000D6731000D6731000D673
      1000D6731000D67B210000000000000000000000000000000000D6731000D673
      1000D6731000D6731000D6731000D6731000D6731000D6731000D6731000D673
      1000D6731000D67B21000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE6300000000000000000000000000009C636300AD9C
      9C00B5A5A500BDADAD00C6B5B500CEADAD00946B6B00E7C6C600D6C6C600D6C6
      C600D6CECE008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE6300000000000000000000000000009C636300AD9C
      9C00B5A5A500C6ADAD00C6B5B500D6B5B500B58C8C00E7C6C600E7CECE00E7D6
      D600E7DEDE008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006B846300319C
      3100319C3100319C3100319C310052634200636B4A00948C8400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE6300000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000000000000000000073AD73001084100021A5
      210031A5310039AD390039AD3900319C310031942900319C3100218421000000
      00000000000000000000000000000000000000000000C64A2900C6421800CE4A
      2100CE4A2900C64A2900C64A290084736B000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFF7
      EF00FFF7E700FFEFDE00FFEFD600FFE7CE00FFE7C600FFDEBD00FFDEB500FFD6
      AD00FFD6AD00FFD6A500CE6300000000000000000000CE630000FFFFFF00FFF7
      EF00FFF7E700FFEFDE00FFEFD600FFE7CE00FFE7C600FFDEBD00FFDEB500FFD6
      AD00FFD6AD00FFD6A500CE63000000000000000000003994390029AD29004ABD
      4A005AC65A0052B5520073B56B004AA54200B5E7A50042BD4200299C29000000
      00000000000000000000000000000000000000000000F7634A00F7634A00FF7B
      6300FF8C6B00EFC69400D66B4200F7634A00D64A290042AD4200218421009CDE
      8C009CDE8C005AD65A0042CE42000000000000000000CE630000FFFFFF00E7A5
      6300DE7B0000FFFFF700FFF7EF00FFF7EF00FFEFD600FFE7C600FFE7C600FFDE
      B500FFDEB500FFD6AD00CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7EF00FFF7EF00FFEFD600FFE7C600FFE7C600FFDE
      B500FFDEB500FFD6AD00CE63000000000000000000008CBD8C00299C29005AC6
      5A006BCE6B0063A56300F7FFEF0084BD7B00B5E7A50052C6520031A531000000
      00000000000000000000000000000000000000000000F7634A00FF7B6300FF8C
      6B00DE6B4200FFDEAD00DE7B4A00FF8C6B00E75A390052B5520084BD7300B5E7
      A5009CDE8C005AD65A005AD65A000000000000000000CE630000FFFFFF00E7A5
      6300E7A56300FFFFFF00FFFFFF00FFF7EF00FFF7EF00FFEFD600FFE7C600FFDE
      B500FFDEB500FFD6AD00CE6300000000000000000000CE630000FFFFFF00E7A5
      6300CE630000CE630000CE630000FFF7EF00FFF7EF00CE630000CE630000CE63
      0000FFDEB500FFD6AD00CE6300000000000000000000000000000000000052B5
      52004A9C4200BDC6C600BDC6C60094B57B007BCE7B0052B55200428439000000
      00000000000000000000000000000000000000000000D66B4A00EF7B5A00D66B
      4200DE9C8400FFBD8C00E78C5A00FF8C6B00B56B31005AAD5A00EFF7E700A5CE
      A5005AB55A009CDE8C009CDE8C000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFEFD600FFE7
      C600FFE7C600FFDEB500CE6300000000000000000000CE630000FFFFFF00E7A5
      6300E7A56300DE7B0000CE630000FFFFFF00FFFFFF00E7A56300DE7B0000CE63
      0000FFE7C600FFDEB500CE630000000000000000000000000000000000004A8C
      420018734A00217BBD00217BBD004284630063BD6300528C4A00000000000000
      0000000000000000000000000000000000000000000000000000A56342004221
      5A002929940042317300A5524A009463210073D673005AA55A00FFF7E700F7EF
      DE007BAD63009CDE8C005AA55A000000000000000000CE630000FFFFFF00CE63
      0000CE630000FFFFFF00D6D6D6009C9C9C009C9C9C009C9C9C00848484006B6B
      6B006B6B6B00FFE7C600CE6300000000000000000000CE630000FFFFFF00E7A5
      6300E7A56300E7A56300E7A56300FFFFFF00FFFFFF00E7A56300E7A56300E7A5
      6300FFEFD600FFE7C600CE63000000000000000000000000000000000000217B
      BD002994EF003194FF003194FF002994EF00216B9C0000000000000000000000
      0000000000000000000000000000000000000000000031313100080808001039
      94001842AD001842AD0010399C000000000000000000187B7B002184D600218C
      DE002184D6005A737300000000000000000000000000CE630000FFFFFF00E7A5
      6300E7A56300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      EF00FFEFD600FFE7C600CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      EF00FFEFD600FFE7C600CE630000000000000000000000000000000000002994
      EF00399CFF00399CFF00399CFF00399CFF00298CE70000000000000000000000
      0000000000000000000000000000000000000000000018181800081018001852
      BD00185ABD00185ABD001852BD00737B8C0000000000298CE7003194F7003194
      F7003194F7002173A500000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      EF00FFF7EF00FFEFD600CE6300000000000000000000CE630000FFFFFF00E7A5
      6300CE630000CE630000CE630000FFFFFF00FFFFFF00CE630000CE630000CE63
      0000FFF7EF00FFEFD600CE63000000000000000000000000000063849C0042A5
      FF004AADFF006BBDFF006BBDFF004AADFF0042A5F70000000000000000000000
      000000000000000000000000000000000000000000003131310021212100297B
      DE00297BE700297BE700297BDE004A5A84000000000042A5FF0042ADFF0042AD
      FF0042A5FF0039A5FF002973A5000000000000000000CE630000FFFFFF00CE63
      0000CE630000FFFFFF00D6D6D6009C9C9C009C9C9C009C9C9C00848484006B6B
      6B006B6B6B00FFEFD600CE6300000000000000000000CE630000FFFFFF00E7A5
      6300E7A56300DE7B0000CE630000FFFFFF00FFFFFF00E7A56300DE7B0000CE63
      0000FFF7EF00FFEFD600CE6300000000000000000000000000006BA5C6004AAD
      FF004AB5FF0052B5FF006BBDFF006BBDFF004AADFF0000000000000000000000
      000000000000000000000000000000000000000000003939390029292900298C
      F7005AADFF00429CFF00298CF700526B8C00000000004AADFF006BBDFF006BBD
      FF006BBDFF0042A5FF00529CC6000000000000000000CE630000FFFFFF00E7A5
      6300DE7B0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7
      EF00FFF7EF00FFEFD600CE6300000000000000000000CE630000FFFFFF00E7A5
      6300E7A56300E7A56300E7A56300FFFFFF00FFFFFF00E7A56300E7A56300E7A5
      6300FFF7EF00FFEFD600CE63000000000000000000000000000063A5C600298C
      CE003194DE002184C600298CC6002984C6002994CE0000000000000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A005252
      520031314200292994002929940000000000000000006BBDFF0042A5DE004AB5
      F7006BBDFF004AADF7002184BD000000000000000000D66B0000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7
      EF00FFF7E700FFF7EF00CE6300000000000000000000D66B0000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7
      EF00FFF7E700FFF7EF00CE63000000000000000000000000000063849C00428C
      C6004A94C6007BBDEF0063ADF700398CCE00216BA50000000000000000000000
      00000000000000000000000000000000000000000000393939005A5A5A009C9C
      9C00A5A5A5004A4A4A00313131000000000000000000187BB5003994C600429C
      CE003194CE002984BD00106B9C000000000000000000D6730000DE7B0000DE7B
      0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B
      0000DE7B0000DE7B0000CE6300000000000000000000D6730000DE7B0000DE7B
      0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B
      0000DE7B0000DE7B0000CE63000000000000000000000000000000000000428C
      B5004294C6009CCEE7008CBDE700106B9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A00424242007B7B7B000000000000000000000000008CBDD6005AA5D60094C6
      E7007BBDE700529CC60000000000000000000000000000000000D6731000D673
      1000D6731000D6731000D6731000D6731000D6731000D6731000D6731000D673
      1000D6731000D67B210000000000000000000000000000000000D6731000D673
      1000D6731000D6731000D6731000D6731000D6731000D6731000D6731000D673
      1000D6731000D67B210000000000000000000000000000000000000000000000
      00006BA5BD00529CBD004A8CAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009CC6DE0094C6
      DE0084B5D6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000004A0000004A0000085A0800085A0800004A0000004A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5520000BD5A00009C39
      08000000000000000000000000000000000000000000000000000000000084BD
      E700316BCE00316BCE003973CE00397BD6003984DE004294E7004294E7003194
      EF0073BDEF0000000000000000000000000000000000ADDEF700B5FFFF0094F7
      FF008CEFFF006BD6F70052C6E70029ADD60021A5D60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000063
      0800005A080021BD4A0008BD180008B5180008B5180008BD180008B51800086B
      0800005208000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD5A0000D66B0000A542
      0800A5420800000000000000000000000000000000000000000000000000B5EF
      FF004294E70073D6FF008CD6FF008CD6FF008CD6FF00A5E7FF00B5EFFF0094DE
      FF0084CEFF000000000000000000000000000000000063BDE700CEFFFF0094F7
      FF0094F7FF0094F7FF0094F7FF008CEFFF0073DEF7004AC6E70031B5DE0018A5
      D60018A5D600000000000000000000000000000000000000000000000000086B
      100008AD180021BD4A0010B5210008B5180008B5180008B5180008B5180008B5
      1800088410000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C390800A5420800CE6B
      0000B55200009C3908000000000000000000000000000000000000000000B5EF
      FF004A9CEF0073D6FF008CD6FF008CD6FF008CD6FF008CD6FF008CDEFF0094DE
      FF0084CEFF00000000000000000000000000000000005AC6E70094D6EF008CF7
      FF0094F7FF0094F7FF008CF7FF008CEFFF008CEFFF008CEFFF008CEFFF0084E7
      FF005ACEEF0000000000000000000000000000000000085A0800087B180021BD
      4A0021BD4A0008B5210008B51800DEF7E700FFFFFF0031BD420008B5180008B5
      180008B51800088410000052080000000000A54208009C3908009C3908009C39
      08009C3908009C3908009C3908009C390800A5420800000000009C390800CE63
      0000CE6B00009C3908009C3908000000000000000000000000000000000084CE
      FF004A94E7004294E70052A5EF0063B5F7006BC6F7006BC6F7005AC6FF003163
      CE007BCEF700000000000000000000000000000000007BE7F70063C6E7008CF7
      FF0094F7FF0094F7FF008CF7FF008CEFFF008CEFFF008CEFFF008CEFFF007BE7
      F70073DEF70000000000000000000000000000000000085A080018BD420018BD
      390018BD310008B5180008B51800DEF7E700FFFFFF0031BD420008B5180008B5
      180008B5180008B518000063080000000000AD4A1000E78C2900DE7B1000CE6B
      0000CE6B0000CE6B0000CE6B0000D66B0000B552080000000000000000009C39
      0800B5520800BD5A00009C3908000000000000000000000000000000000084CE
      FF00428CE7004284DE004A94E7005AADEF0063B5F7006BC6F7005AC6FF003163
      CE0073BDEF00000000000000000000000000000000009CEFFF0063DEEF00BDFF
      FF008CF7FF0094F7FF000873080008730800087308008CEFFF008CEFFF0073DE
      F70073DEF70029ADD60000000000000000000000000029BD520029C65A0018BD
      420010B5290008B5180008B51800DEF7E700FFFFFF0031BD420008B5180008B5
      180008B5180008B5180008B5180000000000AD4A1000F7A53900E78C2900CE63
      0800B5520000B5520000B5520000B5520800A542080000000000000000000000
      00009C390800CE6B0000AD4A080000000000000000000000000000000000B5EF
      FF004AA5F70073D6FF008CD6FF008CD6FF008CD6FF008CD6FF00B5EFFF0094DE
      FF008CDEFF000000000000000000000000000000000094EFF7008CF7FF00CEF7
      FF00A5FFFF0008730800087308000894180008941800087B10000873080073DE
      F70073DEF7004AC6E7000000000000000000086B080031C66B0029C6630018BD
      420021BD5A0008B5180008B51800DEF7E700FFFFFF0031BD420008B5180008B5
      180008B5180008B5180008BD180000520800AD4A1000FFB55200C66B2100F79C
      3100D67318009C39080000000000000000000000000000000000000000000000
      000000000000CE630000C66300009C390800000000000000000000000000B5EF
      FF004AA5F70073D6FF008CD6FF008CD6FF008CD6FF00A5E7FF00B5EFFF0094DE
      FF008CD6FF00000000000000000000000000000000009CEFFF0094FFFF0063D6
      EF0052CEE70063C6E70063C6E700BDE7F700ADF7FF00089C180010AD21000873
      080073DEF70094F7FF0039B5DE0000000000087B080042CE7B0031C66B0029BD
      5200E7F7EF00EFFFF7005ACE8400E7F7E700FFFFFF0039C64A0008B51800FFFF
      FF00EFFFEF0008B5180008BD180000520800AD4A1000FFBD5200BD5A1800F7A5
      4200F7A53900A53908009C390800000000000000000000000000000000000000
      000000000000C6630000C66300009C390800000000000000000000000000B5EF
      FF0094BDEF008CADE70094BDEF009CC6EF009CCEF700A5DEFF00A5DEFF0094CE
      FF00A5CEF700000000000000000000000000000000009CEFFF0094FFFF009CFF
      FF0094FFFF008CEFFF0084EFFF0042B5DE00ADDEF7000884100010AD21000873
      08006BD6F70094F7FF005AD6EF0000000000088410005AD68C0039C6730039C6
      6B00C6EFD600FFFFFF00DEF7E700DEF7E700FFFFFF0039C64A0094DE9C00FFFF
      FF00EFFFEF0008B5180008B5180000630800AD4A1000FFB55200BD6318009C39
      0000C66B2100F7A53900D67B21009C3908000000000000000000000000000000
      00009C390800CE6B0000C66300009C3908000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084847B008C73
      5A0000000000000000000000000000000000000000009CF7FF0094FFFF0094F7
      FF0094F7FF0094F7FF008CF7FF0094F7FF008CEFFF000873080021AD39000873
      08006BC6E7007BCEE70084CEEF0000000000088C100084DEAD0073D69C0039C6
      6B0031C66300E7F7EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADE7
      B50018BD390010B5290008BD180000520800AD4A1000FFB55200BD6318000000
      00009C390000F7AD4A00FFAD4200AD4A08009C3908000000000000000000A542
      08009C390800CE6B0000BD5A0000000000000000000000000000000000000000
      0000948473008C735A000000000000000000000000000000000084847B008C73
      5A000000000000000000000000000000000000000000A5F7FF0094FFFF0094F7
      FF0094F7FF0094F7FF008CF7FF0008730800087308000873100031BD4A000873
      0800087308000873080000000000000000000000000084DEAD009CE7B50029C6
      630039C66B0063D68C00EFFFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0018BD
      420018BD390010B5210008BD180000000000AD4A1000FFB55200BD6318000000
      0000000000009C390000AD4A1000FFAD4200F79C3100B55A1000AD4A0800BD5A
      0000CE6B0000B55208009C390800000000000000000000000000000000000000
      0000948473007B6B6300000000000000000000000000000000008C8C84008C73
      5A0000000000000000000000000000000000000000007BCEE700B5FFFF0094FF
      FF0094F7FF0084EFFF0031ADDE0039B5DE00087308005AEF940052DE840021AD
      310021AD39000000000000000000000000000000000029B54A00ADEFC6007BD6
      9C0039C66B0031C66B0039C66B00F7FFF700FFFFFF00A5E7AD0021BD520018BD
      420018BD390010BD3100088C180000000000AD4A1000FFBD5200BD6318000000
      000000000000000000009C390000C66B2100E7943900EF942900DE7B1000CE6B
      0000C65A00009C39080000000000000000000000000000000000000000000000
      0000948473007B737300000000000000000000000000000000009C9C94008C73
      5A00000000000000000000000000000000000000000021A5D60084D6EF0094E7
      F7009CEFFF005ACEE70010A5D600000000000000000031AD52005AE78C0039BD
      5A00087310000000000000000000000000000000000039B54A0063CE8400C6EF
      D60073D69C0029C6630031C66B007BDEA500F7FFF70031C65A0029C65A0021BD
      4A0018BD420018BD3100085A080000000000000000009C3908009C3908000000
      0000000000000000000000000000000000009C3908009C3908009C3908009C39
      0800000000000000000000000000000000000000000000000000000000000000
      00008C7B63008C8C8C0084847B007B6342007B6342008C8C8C00C6C6C600846B
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000087B10000000
      00000000000000000000000000000000000000000000000000000000000084DE
      AD00CEF7DE00B5EFCE008CDEAD0052CE84004ACE7B0052CE840052CE840039C6
      6B0029C65A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFEFEF00ADADAD008C8C8C008C8C8C00C6C6C600CECECE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000031B5
      42006BD68C00C6EFDE00CEF7DE00ADEFC600A5E7BD008CDEAD0073D69C0039BD
      6300108421000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009484730094846B0094846B008C735A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000031B5420029B54A0039BD5A0039BD630021A54200108421000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000317300003173000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000042424A003139390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006B7373006B73730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000031730000428C0000428C0000428C0000428C000031
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000029394A00000810000008100010183100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006B635A00EFA56300D67B210000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031730000428C0000428C0000428C0000428C0000428C000031
      630000317300000000000000000000000000AD4A4200AD4A4200AD4A4200AD4A
      4200AD4A4200AD4A4200AD4A42000000000073212100AD4A4200AD4A4200AD4A
      4200AD4A4200AD4A4200AD4A4200AD4A42000000000000000000000000000000
      0000000000000000000010183100080818000808180010213100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006B635A00EFA55A00D673180000000000000000000000
      0000000000000000000000000000000000000000000000000000003173000042
      8C0000428C0000428C0000428C0000428C0000428C0000428C0000428C000031
      630000316300000000000000000000000000AD4A4200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000B5B5B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AD4242000000000000000000000000000000
      0000000000000000000018395200215A840018395A0010315200000000000000
      0000000000000000000000000000000000000000000084848400A594A500A5A5
      A5008484840000000000736B6300E7944A00D673180000000000000000000000
      0000000000000000000000000000000000000000000000317300395A8C00395A
      8C000031730000000000000000000031630000428C0000428C0000428C000031
      630000316300000000000000000000000000AD4A4200FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F70000000000B5B5B500FFFFFF00FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700AD4242000000000000000000000000000000
      00000000000000000000317BB500319CBD00296B8C003184C600000000000000
      00000000000000000000000000000000000000000000C6C6C600B5B5B500BDBD
      BD00B5B5B5005A525200736B6300E7944200D673180000000000000000000000
      00000000000000000000000000000000000000000000395A8C00395A8C00D68C
      8C00FF9C9C0000000000FFB5AD00FF9C9C00D68C8C0000428C0000428C000031
      630000316300000000000000000000000000AD4A4200FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F70000000000B5B5B500FFFFFF00FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700AD4A4A000000000000000000000000000000
      0000000000000000000042ADEF0039A5D60039B5E70042C6F700000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      6300BDBDBD00A5A5A500736B6300DE8C3900D6732100948C84009C9C9C009C9C
      9C009C9C9C00949494008C7B8C000000000000000000395A8C0000317300D68C
      8C00FFBDBD00FFCECE00FFCECE00FFB5AD00FF9C9C000031630000428C000031
      630000316300000000000000000000000000AD4A4200FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F70000000000B5B5B500FFFFFF00FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700AD4A4A000000000000000000000000000000
      000000000000527B9C0042ADEF004AB5E7004ACEEF0042C6F700527B9C000000
      0000000000000000000000000000000000000000000000000000000000006363
      6300B5B5B500ADADAD00736B6300DE8C3900D6732100A59C9400B5B5B500B5B5
      B500ADADAD00ADADAD00A594A5000000000000000000395A8C0000000000FFD6
      D600FFCECE000000000000000000FFCECE00FFB5AD000000000000428C000031
      630000316300000000000000000000000000AD4A4200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000B5B5B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AD4A4A000000000000000000000000000000
      0000000000004AADE70063CEF7006BD6F7006BCEEF0063D6F70052BDEF000000
      00000000000000000000000000000000000000000000D6D6D600DEDEDE00C6C6
      C600C6C6C6005A5252007B6B5A00DE842900DE73290000000000000000000000
      00000000000000000000000000000000000000000000395A8C0000000000EFDE
      D600FFD6D60000000000FFCECE00FFCECE00FFCECE000000000000428C000031
      630000316300000000000000000000000000AD4A4200F7EFEF00FFF7F700F7EF
      EF00FFF7F700FFF7F700FFF7F70000000000B5ADAD00FFFFFF00FFF7F700F7EF
      EF00F7EFEF00FFF7F700FFF7F700AD4A4A000000000000000000000000000000
      0000949C9C0063D6F7007BE7FF009CEFFF009CEFFF007BE7FF006BD6F700949C
      9C0000000000000000000000000000000000000000009C9C9C00A5A5A500B5B5
      B500A5A5A5000000000063635A00D67B2100DE73310000000000000000000000
      00000000000000000000000000000000000000000000395A8C0000000000EFEF
      E700FFE7E70000000000FFCECE00FFBDBD00FF9C9C00395A8C0000639C000031
      630000316300000000000000000000000000AD4A4200AD423900AD423900AD42
      3900AD423900AD423900AD423900000000008C525200AD423900AD423900AD42
      3900AD423900AD423900AD423900AD42390000000000000000000000000063B5
      DE0052ADE700A5F7FF00C6F7FF00B5F7FF00C6F7FF00B5F7FF0094F7FF005AC6
      EF009C9C9C000000000000000000000000000000000000000000000000000000
      000000000000000000007B635200D6731800CE73390000000000000000000000
      00000000000000000000000000000000000000000000395A8C0031003100EFEF
      E700FFEFE70000000000FFCECE00EFA5A500D68C8C0000639C00005A94000031
      630000316300000000000000000000000000C66B4A00EFDEC600EFDEC600FFF7
      D600FFF7D600C66B4A00FFFFD6006B4AD600DEC6C600FFF7D600FFF7D600FFF7
      D600FFF7D600C66B4A00F7EFD600AD42390000000000000000000000000094B5
      D60063CEF700B5F7FF00C6F7FF00BDF7FF00ADF7FF00B5F7FF009CF7FF0063E7
      FF0084949C000000000000000000000000000000000000000000000000000000
      00000000000000000000635242007B5A4200A563420000000000000000000000
      0000000000000000000000000000000000000000000000317300395A8C00D68C
      8C00FF9C9C0000000000FF9C9C0031003100395A8C00007BC6000073B5000052
      8C0000317300000000000000000000000000C66B4A00EFDEC600EFDEC600FFF7
      D600FFF7D600C66B4A006B4AD6002910A5003918C600FFF7D600FFF7D600FFF7
      D600FFF7D600C66B4A00F7EFD600AD4239000000000000000000000000007BB5
      D60063DEFF00A5F7FF00B5F7FF00DEFFFF00DEFFFF00B5F7FF009CF7FF0063E7
      FF0084A5BD000000000000000000000000000000000000000000000000008C8C
      8C004A636B00000000005A5252006B6B6B005A52520000000000000000000000
      0000000000000000000000000000000000000000000000000000003173000000
      0000000000000000000000000000395A8C00218CEF00428CDE00007BC6000063
      9C0000317300000000000000000000000000C66B4A00EFDEC600EFDEC600EFDE
      C600FFF7D6006B4AD6002908DE00311884002910A5006B4AD600EFDEC600EFDE
      C600EFDEC600FFF7D600FFF7D600AD4239000000000000000000000000008CBD
      DE005AD6F7008CF7FF00ADF7FF00B5F7FF00B5F7FF00ADF7FF008CF7FF005AD6
      F700A5A5AD00000000000000000000000000000000000000000000000000F7F7
      F700BDADAD005A5252005A525200B5B5B500B5B5B50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000031
      7300ADD6F7004A9CF7003994EF003994EF003994EF00218CEF00218CEF000000
      000000000000000000000000000000000000C66B4A00EFDEC600EFD6BD00EFD6
      BD006B4AD6002908DE002908DE0031188400311884002910A5003918C600EFDE
      C600EFDEC600EFDEC600EFDEC600AD4239000000000000000000000000000000
      000063B5DE0063EFFF0073F7FF0084F7FF0084F7FF0073F7FF0063EFFF0094B5
      BD0000000000000000000000000000000000000000000000000063636300BDBD
      BD00636363009C9C9C006B6B6B00B5B5B500BDBDBD00B5B5B5005A5252005A52
      52005A5252000000000000000000000000000000000000000000000000000000
      00000031730063ADF7004A9CF7003994EF003994EF003994EF00003173000000
      000000000000000000000000000000000000C66B4A00EFDEC600EFDEC6006B4A
      D6002908DE002908DE002908DE003118840031188400311884002910A5006B4A
      D600EFDEC600EFDEC600EFDEC600AD4239000000000000000000000000000000
      00000000000052CEF70063E7FF006BF7FF006BF7FF0063E7FF0052CEF7000000
      0000000000000000000000000000000000000000000000000000527B8400B5B5
      B50063636300A5A5A5006B6B6B00A5A5A500ADADAD00C6C6C600C6C6C600B5B5
      B5009C9C9C000000000000000000000000000000000000000000000000000000
      0000000000000031730000317300003173000031730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084B5DE008CBDDE0094B5BD00000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      6300847B7B00847B7B008484840084848400848484007B7B7B00737373000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000737373005A5A5A005252520052525200737373000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000104A1000104A1000104A10000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A57B7300A57B
      7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B73008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B00B5B5B500C6C6C600CECECE00CECECE00CECECE00C6C6C6004A4A
      4A00636363000000000000000000000000000000000000000000000000000000
      000063AD630039CE390039CE390063AD6300428C420000000000000000000000
      0000000000000000000000000000000000000000000000000000A57B7300FFE7
      D600FFE7CE00FFE7C600FFE7C600FFDEBD00FFDEBD00FFDEB500FFD6AD00FFD6
      A500FFD6A500FFCEC6008C5A5A000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000000000000000000000000000000000008484
      84006B6B6B00A5A5A5009C9C9C009C9C9C00A5A5A500BDBDBD00C6C6C600B5B5
      B500525252000000000000000000000000000000000000000000000000000000
      0000108C180039CE390039CE390039CE3900108C180000000000000000000000
      0000000000000000000000000000000000000000000000000000A57B7300FFEF
      D600FFE7D600FFE7CE00FFE7C600FFDEBD00FFDEBD00FFDEB500FFDEB500FFD6
      AD00FFD6A500FFCEC6008C5A5A000000000000000000CE630000FFFFFF00FFF7
      EF00FFF7E700FFEFDE00FFEFD600FFE7CE00FFE7C600FFDEBD00FFDEB500FFD6
      AD00FFD6AD00FFD6A500CE630000000000000000000000000000000000006363
      6300737373009C9C9C00A5A5A500BDBDBD00C6C6C600C6C6C600BDBDBD00BDBD
      BD00CECECE00424242008484840000000000000000000000000000000000108C
      180073DE730073DE730073DE730073DE730039CE390000000000000000000000
      0000000000000000000000000000000000000000000000000000AD847B00FFEF
      DE00FFEFDE00FFE7D600FFE7CE00FFE7C600FFE7C600FFDEBD00FFDEBD00FFDE
      B500FFD6AD00FFCEC6008C5A5A000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700FFF7EF00FFEFD600FFE7C600FFE7C600FFDE
      B500FFDEB500FFD6AD00CE630000000000000000000000000000000000006363
      6300737373008C8C8C008484840094949400BDBDBD00CECECE00CECECE00A5A5
      A500C6C6C6007373730052525200000000000000000000000000108C180094F7
      9C0084EF8C0084EF840039CE390073DE730073DE7300108C1800000000000000
      0000000000000000000000000000000000000000000000000000B5847B00FFEF
      DE00FFEFDE00FFEFD600ADB5E700FFE7CE00FFE7C600CEC6CE00FFDEBD00FFDE
      B500FFDEB500FFCEC6008C5A5A000000000000000000CE630000FFFFFF009C9C
      9C009C9C9C00DEDEDE009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C00FFD6AD00CE630000000000000000000000000000000000005A5A
      5A00636363009C737300B5848400BD848400AD7B7B009C9C9C00C6C6C600CECE
      CE00ADADAD00C6C6C60073737300000000000000000063AD630073DE730094F7
      9C0084EF840000000000428C420084EF840094F79C0073DE7300108C18000000
      0000000000000000000000000000000000000000000000000000B58C7B00FFF7
      E700FFEFE7000031FF000031FF003152F7008C9CE7000031FF000031FF00FFDE
      BD00FFDEBD00FFCEC6008C5A5A000000000000000000CE630000FFFFFF009C9C
      9C009C9C9C00E7E7E7009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C00FFEFD600CE6300000000000000000000000000006B6363005A5A
      5A00525252009473730094737300A57B7B00AD7B7B00635A5A00A5A5A500CECE
      CE00BDBDBD00CECECE00A5A5A500000000000000000063AD630039CE390039CE
      3900108C1800000000000000000039CE390084EF840073DE730039CE39000000
      0000000000000000000000000000000000000000000000000000BD8C7B00FFF7
      EF00FFF7E7009CA5EF000031FF000031FF000031FF000031FF006373E700FFDE
      BD00FFDEBD00FFCEC6008C5A5A000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00FFEF
      D600FFEFD600FFEFD600CE630000000000000000000084737300736363005252
      52004A4A4A007B7B7B007B7B7B006B6B6B00736B6B009C737300635A5A00BDBD
      BD00C6C6C600BDBDBD00CECECE00000000000000000000000000000000000000
      000000000000000000000000000000000000108C180094F79C0094F79C00108C
      1800000000000000000000000000000000000000000000000000C6948400FFFF
      F700FFF7EF00FFF7E7009CADEF000031FF000031FF003152F700EFDED600FFE7
      C600FFE7C600FFCEC6008C5A5A000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00FFF7EF00FFEF
      D600FFEFD600FFEFD600CE6300000000000084636300AD8C8C00947373004A4A
      4A004A4A4A008C8C8C009494940084848400737373009473730063525200B5B5
      B500C6C6C600B5B5B500CECECE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084EF840094F79C0073DE
      7300428C42000000000000000000000000000000000000000000C6948400FFFF
      F700FFFFF7009CADF7000031FF000031FF000031FF000031FF003152F700FFE7
      CE00FFE7C600FFCEC6008C5A5A000000000000000000CE630000FFFFFF009C9C
      9C009C9C9C00E7E7E7009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C00FFEFD600CE6300000000000084525200D6B5B500DEBDBD003939
      390042424200BDBDBD00BDBDBD00A5A5A5008C8C8C00736B6B005A5252009C9C
      9C00ADADAD00A5A5A500C6C6C600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000039CE3900BDFF
      BD0094F79C0063AD630000000000000000000000000000000000CE9C8400FFFF
      FF00FFFFFF009CADF7000031FF00FFF7E700FFEFE7001042FF00637BEF00FFE7
      D600FFE7CE00FFC6C6008C5A5A000000000000000000CE630000FFFFFF00B5B5
      B500B5B5B500E7E7E700B5B5B500B5B5B500B5B5B500B5B5AD00B5B5AD00B5AD
      AD00B5ADAD00FFEFD600CE6300000000000084525200EFD6D600F7E7E7003939
      390042424200BDBDBD00CECECE00A5A5A5008C8C8C00636363004A4A4A009494
      94009C9C9C00A5A5A500BDBDBD00000000000000000000000000000000000000
      0000000000000000000000000000A59C9C0000000000A59C9C0000000000BDFF
      BD00BDFFBD0039CE390063AD6300000000000000000000000000D6A58400FFFF
      FF00FFFFFF00FFFFF700CED6FF00FFF7EF00FFF7E700DEDEE700FFEFDE00FFEF
      D600FFE7D600FFBDB5008C5A5A000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      EF00FFF7EF00FFEFE700CE6300000000000094737300EFEFEF00EFEFEF007B7B
      7B00313131004242420052525200949494007B7B7B004A4A4A00636363007B7B
      7B00848484009C9C9C0094949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000039CE390073DE730063AD6300000000000000000000000000DEAD8C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00FFF7E700FFEFE700E7C6
      AD00E7A59C00E79C8C008C5A5A000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      EF00FFF7E700FFF7E700CE6300000000000000000000C6BDBD00D6D6D600B5B5
      B5004242420042424200424242004A4A4A00424242005A5A5A00636363007373
      730073737300949494005A5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000063AD630000000000000000000000000000000000DEAD8C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFF7EF00FFF7E700B584
      7300B5847300B58473008C5A5A000000000000000000D6730000DE7B0000DE7B
      0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B
      0000DE7B0000DE7B0000CE630000000000000000000000000000846363008C73
      73007B5A5A003939390031313100424242004A4A4A00525252005A5A5A006363
      63006B6B6B00525252000000000000000000000000000000000000000000A59C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7B58C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00B584
      7300E7AD84000000000000000000000000000000000000000000D6731000D673
      1000D6731000D6731000D6731000D6731000D6731000D6731000D6731000D673
      1000D6731000D67B210000000000000000000000000000000000000000000000
      000000000000000000004242420039393900424242004A4A4A00525252005A5A
      5A005A5A5A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7B58C00FFFF
      FF00FFFFFF00F7F7F700F7F7F700F7F7F700EFEFEF00EFEFEF00EFEFE700B584
      7300D6A584000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C8C8C0052525200525252008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000636B7300C69C94000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD7B7B00B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000737373005A5A5A005252520052525200737373000000
      0000000000000000000000000000000000006394B500218CEF002173B500CE9C
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD738400F7E7
      C60010F7FF0010F7FF0010F7FF0084FFFF0084FFFF0084FFFF00C6FFFF00C6FF
      FF00C6FFFF00EFCE9400B584840000000000000000007B6B63005A4A42005A52
      52006B6B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B00B5B5B500C6C6C600CECECE00CECECE00CECECE00C6C6C6004A4A
      4A00636363000000000000000000000000004AB5FF0042A5FF00218CEF007B84
      9400CE9C94000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD738400F7E7
      CE0010F7FF0010F7FF0010F7FF0010F7FF0010F7FF0084FFFF0084FFFF00C6FF
      FF00C6FFFF00EFCE9400B584840000000000000000008C522100A53900006B31
      18005239290052524A0063636300848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84006B6B6B00A5A5A5009C9C9C009C9C9C00A5A5A500BDBDBD00C6C6C600B5B5
      B5005252520000000000000000000031DE000000000052BDFF005ABDFF00218C
      EF002173B500CE9C940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD738400F7EF
      DE0010F7FF0010F7FF0084FFFF0084FFFF00C6FFFF00C6FFFF00C6FFFF00C6FF
      FF00C6FFFF00EFCE9400B584840000000000000000009C5A2100B5521800FFEF
      CE00FFDEB500E7A57300CE8452008C4A210073422100524A4200636363000000
      00000000000000000000000000000000000000000000000000000031DE000031
      DE00737373009C9C9C00A5A5A500BDBDBD00C6C6C600C6C6C600BDBDBD00BDBD
      BD00CECECE00424242000031DE00000000000000000031A5FF0052BDFF0042A5
      FF00218CEF0084849400CE9C9400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD7B8400F7EF
      DE0010F7FF0010F7FF0010F7FF0084FFFF0084FFFF00C6FFFF00C6FFFF00C6FF
      FF00C6FFFF00EFCE9400B58484000000000000000000A55A2100B5521800FFE7
      CE00FFE7C600FFE7BD00FFDEB500EFB58400DE945A008C4A2100523929000000
      00000000000000000000000000000000000000000000000000000031FF000031
      DE000031DE008C8C8C008484840094949400BDBDBD00CECECE00CECECE00A5A5
      A500C6C6C6000031DE000031DE000000000000000000000000000000000052BD
      FF005ABDFF003184D60052636B00000000009C6B6B00CEA59C00D6B5A500CE9C
      9C00C69494000000000000000000000000000000000000000000CE948C00FFF7
      EF000052AD000052AD000063CE000063CE000063CE000063CE000063CE000063
      CE000063CE00EFCE9400B58484000000000000000000AD632100B55A2100FFEF
      D600FFE7CE00A5C6C600C6CEBD00FFCE8C00FFBD6300B56B3100523929000000
      0000000000000000000000000000000000000000000000000000000000000031
      FF000031FF000031DE00B5848400BD848400AD7B7B009C9C9C00C6C6C6000031
      DE000031DE00C6C6C600737373000000000000000000000000000000000031A5
      FF0052BDFF00C6CEDE009C9C9C00AD8C8400E7D6BD00FFFFD600FFFFDE00FFFF
      D600EFDEC6000000000000000000000000000000000000000000CE948C00FFF7
      EF0010F7FF0010F7FF0010F7FF0084FFFF0084FFFF00C6FFFF00C6FFFF00C6FF
      FF00C6FFFF00EFCE9400B58484000000000000000000B56B2900BD633100FFEF
      DE00EFE7D6004AADCE009CC6C600F7BD7300EFBD6B00B56B3100523929000000
      00000000000000000000000000000000000000000000000000006B6363005A5A
      5A00525252000031DE000031DE00A57B7B00AD7B7B00635A5A00A5A5A5000031
      DE000031DE00CECECE00A5A5A500000000000000000000000000000000000000
      000000000000C6ADAD00CEA59400FFE7BD00FFF7CE00FFFFD600FFFFD600FFFF
      DE00FFFFE700FFFFFF00C6A5A500000000000000000000000000CE948C00FFFF
      FF0010F7FF0010F7FF0010F7FF0010F7FF0010F7FF0084FFFF0084FFFF00C6FF
      FF00C6FFFF00EFCEA500B58484000000000000000000BD6B2900BD734200B5D6
      DE0052B5D600ADCED600009CCE005A524A0042424200B56B3100523929000000
      0000000000000000000000000000000000000000000084737300736363005252
      52004A4A4A007B7B7B000031FF000031DE00736B6B000031DE000031DE00BDBD
      BD00C6C6C600BDBDBD00CECECE00000000000000000000000000000000000000
      000000000000BD8C8C00EFDEB500F7D6AD00FFF7CE00FFFFD600FFFFDE00FFFF
      EF00FFFFF700FFFFFF00F7EFDE00000000000000000000000000CE948C00FFFF
      FF000052AD000052AD000063CE000063CE000063CE000063CE000063CE000063
      CE000063CE00EFCEA500B58484000000000000000000C6732900BD734200C6DE
      E700A5D6DE00CEDED6004AADCE00FFD6AD0052737B0018526B008C5A52000000
      00000000000000000000000000000000000084636300AD8C8C00947373004A4A
      4A004A4A4A008C8C8C00949494000031FF000031DE000031DE000031DE00B5B5
      B500C6C6C600B5B5B500CECECE00000000000000000000000000000000000000
      000000000000E7CEAD00FFEFBD00F7CE9C00FFEFC600FFFFD600FFFFDE00FFFF
      F700FFFFF700FFFFDE00FFFFDE00C69494000000000000000000CE948C00FFFF
      FF0010F7FF0010F7FF0010F7FF0084FFFF0084FFFF00C6FFFF00C6FFFF00C6FF
      FF00C6FFFF00DEC6A500A57B84000000000000000000D67B2900C6845A00FFF7
      EF00FFF7EF00F7EFDE00B5D6DE00C6D6CE00FFD6AD00F7BD8400F7AD5A008C5A
      52000000000000000000000000000000000084525200D6B5B500DEBDBD003939
      390042424200BDBDBD000031FF000031FF000031DE000031FF000031DE009C9C
      9C00ADADAD00A5A5A500C6C6C600000000000000000000000000000000000000
      000000000000EFD6B500FFE7B500F7C68C00F7DEB500FFFFD600FFFFDE00FFFF
      EF00FFFFEF00FFFFDE00FFFFDE00BD9C8C000000000000000000CE948C00FFFF
      FF0010F7FF0010F7FF0010F7FF0010F7FF0010F7FF0084FFFF00C6FFFF00C6FF
      FF00EFD6BD00B5AD94009C7B84000000000000000000CE732900CE8C6B00FFFF
      F700FFF7EF00FFF7E700D6E7DE008CC6CE00F7EFDE00FFD6AD00FFC68C00C673
      39008C5A520000000000000000000000000084525200EFD6D600F7E7E7003939
      3900424242000031FF000031FF000031DE008C8C8C000031FF000031DE009494
      94009C9C9C00A5A5A500BDBDBD00000000000000000000000000000000000000
      000000000000E7CEAD00FFEFBD00EFBD8400F7C69400FFEFC600FFFFD600FFFF
      D600FFFFD600FFFFD600FFFFDE00C69494000000000000000000D69C9400FFFF
      FF000052AD000052AD000063CE000063CE000063CE000063CE00EFDED600AD84
      7300AD7B7300AD7B7300AD7B73000000000000000000CE732900CE9C7B00FFFF
      FF00FFFFFF00FFFFF700FFF7EF0094CED600CEE7DE009C633100AD7B7300FFC6
      8C00EFA55A008C5A5200000000000000000094737300EFEFEF00EFEFEF007B7B
      7B000031FF000031FF000031DE00949494007B7B7B004A4A4A00636363000031
      FF000031DE009C9C9C0094949400000000000000000000000000000000000000
      000000000000D6ADA500FFEFBD00F7DEAD00F7CE9C00F7D6A500F7E7BD00FFFF
      D600FFFFD600FFFFD600FFFFD600000000000000000000000000DEA59400FFFF
      FF0010F7FF0010F7FF0010F7FF0084FFFF00C6FFFF00C6FFFF00E7CEC600E7B5
      8400E7AD6B00EFA53900B58484000000000000000000CE732900BD734200E7C6
      B500EFDED600F7F7F700FFFFF700EFF7EF00F7F7E7009C63310052392900FFD6
      AD009C94A5000010AD0000009C000000000000000000C6BDBD00D6D6D6000031
      FF000031FF000031DE00424242004A4A4A00424242005A5A5A00636363007373
      73000031FF00949494005A5A5A00000000000000000000000000000000000000
      00000000000000000000C69C8C00FFFFFF00FFFFFF00F7C69400EFBD8400F7C6
      9400F7D6AD00FFEFC600BD9C8C00000000000000000000000000DEA59400FFFF
      FF0010F7FF0010F7FF0010F7FF0010F7FF0010F7FF0084FFFF00E7D6CE00EFC6
      8C00F7BD6B0000000000000000000000000000000000EFA55200D66B1000C65A
      0000C65A0000C65A0800BD5A1000C6632100C673390094522100523929000000
      00000018C600106BFF001029D6000000000000000000000000000031FF000031
      FF000031DE003939390031313100424242004A4A4A00525252005A5A5A006363
      63006B6B6B005252520000000000000000000000000000000000000000000000
      0000000000000000000000000000EFEFE700FFFFEF00FFE7B500F7DEAD00FFE7
      B500FFEFBD00C69C940000000000000000000000000000000000DEA59400FFFF
      FF0010F7FF0010F7FF0010F7FF0010F7FF0010F7FF0084FFFF00E7D6D600EFC6
      8C00B584840000000000000000000000000000000000AD9C7B00BDA57300D69C
      5200DE8C3900DE842900D6731000CE630000C65A00005A4A39005A4A39000000
      0000000000000018C6000000000000000000000000000031FF000031FF000031
      DE0000000000000000004242420039393900424242004A4A4A00525252005A5A
      5A005A5A5A000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C69C8C00CEA59C00C69C
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000031FF000031DE000000
      0000000000000000000000000000000000008C8C8C0052525200525252008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000636B7300C69C94000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CE636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEADAD00DEDEDE00BD9C
      9C00CEADAD00CEADAD00CEADAD00CEADAD00CEADAD00CEADAD00CEADAD00A584
      84009C7B7B003131310000000000000000006394B500218CEF002173B500CE9C
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000CEADAD00CEAD
      AD00C6A5A500C6A5A500C69C9C00C69C9C00BD9C9C00BD9C9C00B59494009C7B
      84008C6373000000000000000000000000004AB5FF0042A5FF00218CEF007B84
      9400CE9C94000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD7B
      7300CE636300B55A5A009C848400E7CECE00FFF7F700F7F7F700CEB5B5009C31
      3100C65A5A000000000000000000000000000000000000000000000000000000
      0000ADADAD00D6D6D6009CD6AD00C6C6C6009C9494007B6B6B005A5252000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000052BDFF005ABDFF00218C
      EF002173B500CE9C940000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD7B
      7300CE636300B55A5A009C7B7B00B5737300E7DEDE00FFFFFF00D6B5B5009C31
      3100BD5A5A0000000000000000000000000000000000A5A5A500848484006B6B
      6B0063636300EFEFEF00BDD6C600C6C6C600A59C9C00B5949400AD8C8C005A52
      52007B7B7B00000000000000000000000000CEADAD00CEADAD00CEADAD00CEAD
      AD00CEADAD00B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000031A5FF0052BDFF0042A5
      FF00218CEF0084849400CE9C9400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD7B
      7300CE636300B55A5A00B58C8C0094313100A59C9C00FFFFFF00E7C6C6009431
      3100BD5A5A0000000000000000000000000094949400DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DED6CE00EFEFDE00E7DEDE00B5ADAD00B5A5A500CE9C
      9C00D69C9C0084636300524A4A0000000000CEADAD008C6363008C6363008C63
      63008C6363008C6363008C6363008C6363008C6363008C6363008C6363008C63
      63008C636300DEDEDE00B58484000000000000000000000000000000000052BD
      FF005ABDFF003184D60052636B00000000009C6B6B0000630000007300000073
      0800427B3100000000000000000000000000000000000000000000000000BD7B
      7300CE636300BD5A5A00C6948C00B5848400AD8C8C00E7C6C600DEADAD00A539
      3900C65A5A00000000000000000000000000ADADAD00D6D6D600DEDEDE00E7E7
      E700E7DEDE00E7E7DE00F7D6AD00FFF7EF00FFF7EF00EFC69C00C6AD9C00AD9C
      9C00C6949400E79C9C00D68C8C0052525200CEADAD00FFCE6300FFCE6300FFCE
      6300FFCE6300FFCE6300FFCE6300FFCE6300FFCE6300FFCE6300FFCE6300FFCE
      6300FFCE6300FFCE6300B58484000000000000000000000000000000000031A5
      FF0052BDFF00C6CEDE009C9C9C00AD8C84004284310084A55A0063944200109C
      290021AD42004A9442000000000000000000000000000000000000000000BD7B
      7300B5525200C6848400D6A5A500D6ADA500D6ADAD00D6A5A500D6ADA500D69C
      9C00CE63630000000000000000000000000000000000A5A5A500C6BDB500E7C6
      A500E7D6BD00F7EFE700F7D6AD00FFF7EF00FFF7EF00FFC69400F7B57B00E79C
      4A00D68C42009C7B5A00947B7300A56B6B00CEADAD00FFCE6300FFCE6B00FFD6
      6B00FFD67300FFD67300FFD67300FFD67300FFD67300FFD67300FFD67300FFCE
      6B00FFCE6B00FFCE6300B5848400000000000000000000000000000000000000
      000000000000C6ADAD00CEA59400FFE7BD00FFF7CE00FFFFD600FFFFD600FFFF
      DE001084210031BD52000884180000000000000000000000000000000000BD7B
      7300AD524A00F7F7F700F7F7EF00F7F7F700F7F7F700F7F7F700F7F7F700DEBD
      BD00C65A5A00000000000000000000000000000000000000000000000000ADAD
      A500BDBDB500DED6CE00E7CEAD00FFF7EF00FFF7EF00FFC69400F7B57B00E79C
      4A00D68C39009C6B390073635A00845A5A00CEADAD00FFCE6300FFD67300FFD6
      7B00FFD67B00FFDE8400FFDE8400FFDE8400FFDE8400FFD67B00FFD67B00FFD6
      7300FFD67300FFCE6300CEADAD00000000000000000000000000000000000000
      000000000000BD8C8C00EFDEB5008CB57B00FFF7CE00FFFFD600FFFFDE00FFFF
      EF00108418004AE77B00087B180000000000000000000000000000000000BD7B
      7300B5524A00EFEFEF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600DEBD
      BD00C65A5A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A50084848400A58C7B006B6B6300524A
      4A008C6B6B00DE9C9C00BD84840000000000CEADAD00FFDE8400FFDE8400FFDE
      8400FFDE8C00FFDE8C00FFDE8C00FFDE8C00FFDE8C00FFDE8C00FFDE8C00FFDE
      8C00FFDE8400FFCE6300CEADAD00000000000000000000000000000000000000
      000000000000006300001884210052EF840010841800FFFFD600528C390021A5
      420042D66B0052F78C004AE77B0021843100000000000000000000000000BD7B
      7300B5524A00EFEFEF00DED6D600DEDEDE00DEDEDE00DEDEDE00DED6D600DEBD
      BD00C65A5A000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B004A4A4A003939390063525200C694
      9400C69494009C8C8C000000000000000000CEADAD00FFDE8400FFDE8400FFDE
      8C00FFE79400FFE79400FFE79400FFE79C00FFE79400FFE79400FFDE8C00FFDE
      8400FFDE8C00FFDE8400CEADAD00000000000000000000000000000000000000
      000000000000107B180052E77B0052F78C0039CE6B00FFFFD600FFFFDE001073
      100039CE6B005AF78C0052E77B0052944200000000000000000000000000BD7B
      7300B5524A00EFEFEF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600DEBD
      BD00C65A5A000000000000000000000000000000000000000000000000006B6B
      6B00525252006B6B6B008C8C8C00C6C6C600CECECE00948C8C008C8484000000
      000000000000000000000000000000000000CEADAD00FFDE8400FFDE8C00FFE7
      9C00FFE79C00FFEFA500FFEFA500FFEFA500FFEFA500FFE79C00FFE79C00FFE7
      9400FFDE8C00FFDE8400CEADAD00000000000000000000000000000000000000
      00001084180010841800108421004AE77B00108418001084180010841800FFFF
      D6009CBD8C001084180052943900C6949400000000000000000000000000BD7B
      7300B5524A00FFF7F700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00DEBD
      BD00C65A5A0000000000000000000000000000000000949494006B6B6B009C9C
      9C00BDBDBD00E7E7E700E7E7E700E7E7E700D6D6D6008C8C8C00000000000000
      000000000000000000000000000000000000CEADAD00FFDE8400FFDE8C00FFEF
      A500FFEFA500FFEFAD00FFEFAD00FFEFAD00FFEFAD00FFEFA500FFEFA500FFE7
      9C00FFE79400FFDE8400CEADAD00000000000000000000000000000000000000
      000000000000D6ADA500087B180042DE730010841800F7D6A500F7E7BD00FFFF
      D600FFFFD6009CB58400FFFFD600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ADADAD00A5A5A500A5A5
      A500A56B6B00B58C8C009C949400000000000000000000000000000000000000
      000000000000000000000000000000000000CEADAD00FFD67B00FFEFA500FFEF
      AD00FFF7B500FFF7BD00FFF7BD00FFF7BD00FFF7BD00FFF7B500FFEFAD00FFEF
      A500FFE79C00FFD67B00CEADAD00000000000000000000000000000000000000
      00000000000000000000C69C8C0031C6630021AD4200F7C69400EFBD8400F7C6
      9400F7D6AD00FFEFC600BD9C8C000000000000000000CE636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CE636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEADAD00FFEFA500FFF7BD00FFF7
      BD00FFF7BD00FFFFC600FFFFC600FFFFC600FFFFC600FFF7BD00FFF7BD00FFF7
      B500FFF7B500FFEFA500CEADAD00000000000000000000000000000000000000
      0000000000000000000000000000087B180021AD4200107310006394420084A5
      630042843100C69C940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEADAD00CEADAD00CEAD
      AD00CEADAD00CEADAD00CEADAD00CEADAD00CEADAD00CEADAD00CEADAD00CEAD
      AD00CEADAD00CEADAD00CEADAD00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C69C8C00CEA59C00C69C
      9400000000000000000000000000000000000000000000000000AD7B7B00B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD7B7B00F7E7
      C600F7DEC600BDCE8C00E7D6A500EFCEA500EFCE9C00EFCE9400EFCE9400EFCE
      9400EFCE9400EFCE9400B58C7B000000000000000000B5847300C66B6B00CE63
      6300BD5A5A00A58C8C00B5848400DECECE00F7F7EF00F7F7F700EFEFE700B573
      7300942929009C393900C65A5A000000000000000000CE636300B5525200B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B5008C420800843910000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD7B7300CE636300B55A5A009C848400E7CECE00FFF7F700F7F7
      F700CEB5B5009C313100C65A5A00000000000000000000000000AD7B7B00F7E7
      CE00F7DEC600CED69C00009C00006BB54A0039A529006BB54A00C6C67B00EFCE
      9400EFCE9400EFCE9400B58C7B000000000000000000B5847300C66B6B00CE63
      6300BD5A5A00A57B7B009C393900C69C9C00EFE7E700FFF7F700F7F7EF00BD7B
      7B00942929009C393900C65A5A0000000000B5847300CE636300BD5A5A00A58C
      8C0094292900DECECE00C6CEC600FFFFFF00E7E7E700A5392100C65A5A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD7B7300CE636300B55A5A009C7B7B00B5737300E7DEDE00FFFF
      FF00D6B5B5009C313100BD5A5A00000000000000000000000000AD7B7B00F7EF
      DE00F7E7D600EFDEBD00009C0000009C0000009C0000009C0000009C0000C6C6
      7B00EFCE9400EFCE9400B58C7B000000000000000000B5847300C66B6B00CE63
      6300BD5A5A00AD8C8C00943131009C4A4A00C6C6C600EFEFEF00FFF7F700C67B
      7B00942929009C393900C65A5A0000000000B5847300CE636300B5525200AD8C
      8C009429290094313100B5B5B500D6E7DE00F7F7F700B5393900C65A5A002121
      0000C65A5A000000000000000000000000000000000000000000000000000000
      000000000000BD7B7300CE636300B55A5A00B58C8C0094313100A59C9C00FFFF
      FF00E7C6C60094313100BD5A5A00000000000000000000000000AD847B00F7EF
      DE00F7E7D600E7DEC600009C0000009C000039AD3100C6CE8C006BB54A0039A5
      2900EFCE9400EFCE9400B58C7B000000000000000000B5847300C66B6B00CE63
      6300B5525200B58C8C009429290094313100ADA5A500E7E7DE00F7EFEF00C684
      8400942929009C393900C65A5A0000000000B5847300CE636300B5525200C6AD
      AD00BD9C9C00BDA5A500BDA5A500EFE7E700C6CEC600B5393900C65A5A00B552
      4200C65A5A000000000000000000000000000000000000000000000000000000
      000000000000BD7B7300CE636300BD5A5A00C6948C00B5848400AD8C8C00E7C6
      C600DEADAD00A5393900C65A5A00000000000000000000000000B58C7B00FFF7
      EF00F7EFE700EFE7CE00009C0000009C0000009C0000E7D6AD00EFD6AD00EFCE
      A5007BCE7B00EFCE9400B58C7B000000000000000000B5847300C66B6B00CE63
      6300BD5A5A00D6A5A500C69C9C00BD949400AD8C8C00C69C9C00D6ADAD00C673
      7300A5424200AD4A4A00C663630000000000B5847300AD4A4A00CE8C8C00CE73
      7300CE737300CE737300CE737300CE737300DE7B7B00AD424200CE636300C652
      5200C65A5A0021210000C65A5A000000000000000000A57B7300B5847300B584
      7300B5847300BD7B7300B5525200C6848400D6A5A500D6ADA500D6ADAD00D6A5
      A500D6ADA500D69C9C00CE636300000000000000000000000000B58C8400FFF7
      EF00F7EFE700EFE7CE00EFE7CE00E7DEC600EFDEBD00E7D6AD00F7D6B500EFD6
      AD007BCE7B00EFCE9400B58C7B000000000000000000B5847300C66B6B00CE63
      6300CE636300CE636300CE636300CE636300CE636300C6636300C6636300CE63
      6300CE636300CE636300CE63630000000000B5847300C6847B00F7F7EF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00EFE7E700AD313100CE636300B552
      5200C65A5A00B5524200C65A5A000000000000000000FFDECE00FFDECE00FFDE
      C600FFDEBD00BD7B7300AD524A00F7F7F700F7F7EF00F7F7F700F7F7F700F7F7
      F700F7F7F700DEBDBD00C65A5A00000000000000000000000000BD948400FFFF
      FF00FFF7F700F7EFE700F7EFE700EFE7CE00009C0000009C0000009C0000E7D6
      AD00EFD6AD00EFCEA500B58C7B000000000000000000B5847300AD4A4A00B56B
      6B00C68C8C00D6BDBD00D6BDBD00D6BDBD00D6BDBD00D6BDBD00D6BDBD00D6BD
      BD00D6BDBD00CE8C8C00CE63630000000000B5847300C6847B00FFFFFF00D6CE
      CE00D6CECE00D6CECE00D6CECE00E7E7E700EFE7E700AD313100BD5A5A00B552
      5200CE636300B5524200C65A5A000000000000000000FFEFDE00FFEFDE00E794
      6300CE6B4200BD7B7300B5524A00EFEFEF00D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600DEBDBD00C65A5A00000000000000000000000000C6948400FFFF
      FF00FFFFFF00109C1000ADD6A500EFE7CE00EFE7CE00009C0000009C0000E7D6
      AD00F7D6B500EFCEA500B58C7B000000000000000000B5847300AD424200F7F7
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00CE8C8C00C65A5A0000000000B5847300C6847B00FFFFFF00EFE7
      E700EFE7E700EFE7E700EFE7E700FFF7F700EFE7E700AD313100BD5A5A00B552
      5200CE636300B5524200C65A5A000000000000000000FFF7E700FFD6A500A542
      08005A5A1800BD7B7300B5524A00EFEFEF00DED6D600DEDEDE00DEDEDE00DEDE
      DE00DED6D600DEBDBD00C65A5A00000000000000000000000000C69C8400FFFF
      FF00FFFFFF00CEEFCE00009C0000009C0000009C0000009C0000009C0000EFDE
      BD00F7DEBD00DEC6A5009C847B000000000000000000B5847300AD424200FFFF
      FF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7F7F700CE8C8C00BD5A5A0000000000B5847300C6847B00FFFFFF00D6CE
      CE00D6CECE00D6CECE00D6CECE00E7E7E700EFE7E700AD313100BD5A5A00B552
      5200BD5A5A00B5524200CE6363000000000000000000FFF7E700C65A0000428C
      000018940000BD7B7300B5524A00EFEFEF00D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600DEBDBD00C65A5A00000000000000000000000000CE9C8C00FFFF
      FF00FFFFFF00F7FFF7009CDE9C00009C0000009C0000009C0000109C1000E7DE
      C600EFDEBD00B5AD94009C847B000000000000000000B5847300AD424200FFFF
      FF00E7E7E700CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00C6C6
      C600E7DEDE00CE8C8C00BD5A5A0000000000B5847300C6847B00FFFFFF00FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700EFE7E700AD313100BD5A5A00B552
      5200BD5A5A00B5524200CE6363000000000000000000FFF7E700D673080018B5
      31009CB53900BD7B7300B5524A00FFF7F700F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00DEBDBD00C65A5A00000000000000000000000000D6A58C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7E700E7DEC6008484
      5A00AD7B7300AD7B7300AD8473000000000000000000B5847300AD424200FFFF
      FF00EFE7E700D6CECE00D6CECE00D6CECE00D6CECE00D6CECE00D6CECE00CECE
      CE00E7E7E700CE8C8C00BD5A5A00000000000000000000000000B5847300C684
      7B00FFFFFF00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700B542
      4200BD5A5A00B5524200BD5A5A000000000000000000FFFFFF00E7EFCE00A5EF
      AD00A5EFAD009C9408008C840800FFE7D600B584730000000000000000000000
      0000000000000000000000000000000000000000000000000000DEAD8C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00E7CEC600E7B5
      8400E7AD6B00EFA53900B58484000000000000000000B5847300AD424200FFFF
      FF00EFEFE700E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DE
      DE00EFEFEF00CE8C8C00BD5A5A00000000000000000000000000B5847300C684
      7B00FFFFFF00D6CECE00D6CECE00D6CECE00D6CECE00D6CECE00FFF7F700AD31
      3100BD5A5A00B5524200BD5A5A000000000000000000FFFFFF00FFFFFF00A5EF
      AD008CE79400D6B55A00FFDEBD00FFC6BD00B584730000000000000000000000
      0000000000000000000000000000000000000000000000000000DEAD8C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00EFC6
      8C00F7BD6B0000000000000000000000000000000000B5847300AD424200FFFF
      FF00E7E7E700D6CECE00D6CECE00D6CECE00D6CECE00D6CECE00D6CECE00CECE
      CE00E7E7E700CE8C8C00BD5A5A00000000000000000000000000B58C6B00B58C
      6B00C6CECE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600BD7B
      7300BD737300B54A3900BD5A5A000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7EF00F7E7D600F79C3900CE9C840000000000000000000000
      0000000000000000000000000000000000000000000000000000DEAD8C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6D600EFC6
      8C00B584840000000000000000000000000000000000B5847300AD424200FFFF
      FF00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700CE8C8C00C65A5A00000000000000000000000000000000000000
      0000B5847300C6847B00FFFFFF00CEC6C600CEC6C600CEC6C600CEC6C600CEC6
      C600FFF7F700A5392100BD5A5A000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700F7E7D600D6A584000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B5847300B57B7300C6CECE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6009431180094313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD7B7B00B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      000000000000D6CEB500D6CEB500C6BDA500ADAD9C009C9C9400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ADADAD00F7F7F700F7F7F700ADADAD005A5A5A0084848400ADADAD00E7DE
      DE00E7E7E700B5B5B50000000000000000000000000000000000AD7B7B00F7E7
      CE00F7DEC600F7D6B500F7D6AD00EFCEA500EFCE9C00EFCE9400EFCE9400EFCE
      9400EFCE9400EFCE9400B58C7B0000000000000000000000000000000000FFE7
      BD00FFEFC600FFDEB500FFDEAD00FFDEB500FFDEB500FFE7BD00FFEFC600FFEF
      C600949494000000000000000000000000000000000000000000000000000000
      00009C390800BD5A0000A5420800000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDB5
      B500E7E7E700FFFFFF00EFEFEF00B5ADAD004A4A4A0031313100424242008484
      8400ADADAD00E7E7E700DEDEDE00000000000000000000000000AD7B7B00F7E7
      CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFCE9400EFCE
      9400EFCE9400EFCE9400B58C7B0000000000000000000000000000000000FFEF
      C600FFE7BD00FFDEB500FFD6AD00E7E7B500D6E7AD00FFF7D600FFF7DE00FFF7
      CE00FFEFC6000000000000000000000000000000000000000000000000009C39
      0800AD4A0800CE6B0000B5520000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CECECE00F7F7F700F7F7
      F700F7F7F700C6C6C600ADADAD00A5A5A500ADADAD00B5ADAD009C9C9C005A5A
      5A003939390042424200A59C9C00000000000000000000000000AD7B7B00F7EF
      DE00F7E7D600F7DEC600F7DEC600F7D6B500F7D6AD00EFCEA500EFCE9C00EFCE
      9400EFCE9400EFCE9400B58C7B00000000000000000000000000F7C68C00FFE7
      BD00FFF7CE00FFDEAD00FFD6A500CED69C00009C0000009C0000009C000052BD
      5200FFF7DE00FFEFC600B5B5B500000000000000000000000000A5420800BD5A
      0000CE6B0000A5420800A5420800000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFEFEF00F7F7F700DEDE
      DE00BDBDBD00B5B5B500D6D6D600A5A5A500A59C9C00A59C9C00ADA5A500B5B5
      B500A5A5A5006B6B6B00A59C9C00000000000000000000000000AD847B00F7EF
      DE00F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE
      9C00EFCE9400EFCE9400B58C7B00000000000000000000000000F7C68C00EFB5
      7300F7BD7B00FFF7CE00FFF7CE00BDD69400009C0000089C080063C65A00089C
      08008CD68400EFD6A50094949400000000000000000000000000A5420800CE6B
      0000BD5A0000A5420800000000009C3908009C3908009C3908009C3908009C39
      08009C3908009C3908009C3908009C39080000000000B5ADAD00A5A5A500D6D6
      D600DEDEDE00D6D6D600EFE7E700F7F7F700EFEFEF00D6D6D600CECECE00B5B5
      B500ADA5A500A59C9C009C9C9C00000000000000000000000000B58C7B00FFF7
      EF00181818008494EF000842FF00524A4200F7DEBD00F7D6B500F7D6AD00EFCE
      A500EFCE9C00EFCE9400B58C7B000000000000000000D6CEBD00F7C68C00F7C6
      8C00F7C68C00F7C68C00F7C68C00CED69C0021A52100009C00005ABD5A00F7EF
      CE009CD69400F7C694009C9C94000000000000000000AD4A0800DE841800AD4A
      08009C3908000000000000000000BD5A0000CE6B0000CE630000CE630000CE63
      0000CE630000CE630000CE6300009C39080000000000BDBDBD00D6D6D600D6D6
      D600D6D6D600E7E7E700F7F7F700C6BDC600CECECE00E7E7E700E7E7E7005A52
      42005A5242005A5242005A524200000000000000000000000000B58C8400FFF7
      EF00292929004263F700A5ADE7004A424A00F7DEC600F7DEBD00F7D6B500F7D6
      AD00EFCEA500EFCE9400B58C7B000000000000000000F7C68C00FFC69400FFC6
      9400FFC69400FFC69400FFC69400C6DE9C00E7E7B500C6E7B500ADDEA500FFFF
      E700FFF7DE00FFCE9C00A5A594000000000000000000C66B1800EF9429009C39
      0800000000000000000000000000B5520000C6630000C6630000C6630000C663
      0000CE630000CE6B0000CE6B00009C39080000000000BDBDBD00DEDEDE00D6D6
      D600E7E7E700B5B5B500BDBDBD00D6F7D600EFEFEF00F7BDB500BDBDBD007384
      D6004263F7001039E7004A424A00000000000000000000000000BD948400FFFF
      FF004242420042424200424239001842D600738CEF00F7DEC600F7DEBD00F7D6
      B500F7D6AD00EFCEA500B58C7B000000000000000000F7C68C00FFD6A500FFD6
      A500FFD6A500FFD6A500FFD6A50073C6630094CE8400FFFFDE007BC67300009C
      000042B54200FFD6A500C6B59C00000000009C390800FFB54A00CE7321000000
      00000000000000000000000000000000000000000000000000009C390800C663
      0000CE6B0000BD5A0000CE6B00009C3908000000000000000000B5B5B500D6D6
      D600C6C6C600CEC6C600F7F7F700F7F7F700EFEFEF00E7E7E700E7E7E7009494
      B500CECECE004A63CE00214AD600000000000000000000000000C6948400FFFF
      FF00F7F7F700F7EFE700F7EFE700DED6D600426BF7009CA5DE00F7DEC600F7DE
      BD00F7D6B500EFCEA500B58C7B000000000000000000FFDEAD00FFDEB500FFDE
      B500FFDEB500FFDEB500FFDEB500D6DEA50010A51000CEEFBD009CD69400009C
      000042B54200FFDEB500D6C6A500000000009C390000FFB55200BD6318000000
      00000000000000000000000000000000000000000000A5420800A5420800CE6B
      0000C6630000BD5A0000CE6B00009C390800000000000000000000000000ADAD
      AD00F7F7F700DEDEDE00BDBDBD00C6C6C600D6D6D600D6D6D600D6D6D600ADAD
      AD00BDB5B50000000000000000006B8CFF000000000000000000C69C8400FFFF
      FF0084848400848484008484840084848400F7EFE700F7E7D600F7E7CE00F7DE
      C600F7DEBD00DEC6A5009C847B000000000000000000FFEFC600FFEFC600FFEF
      C600FFEFC600FFEFC600FFEFC600FFEFC600F7EFC60018A51800089C080039B5
      390042B54200FFEFC600F7EFCE00000000009C390000FFBD5200CE7329000000
      0000000000000000000000000000000000009C390800C6630000CE6B0000AD4A
      08009C390800BD5A0000CE6B00009C3908000000000000000000000000000000
      0000EFDEDE00FFE7D600FFDED600F7DED600F7DED600E7DEDE00DEDEDE000000
      00000000000000000000000000003163FF000000000000000000CE9C8C00FFFF
      FF0008080800ADB5B500848CAD0042424200F7EFE700F7EFDE00F7E7D600F7E7
      CE00EFD6BD00B5AD94009C847B000000000000000000FFF7D600FFF7D600FFF7
      D600FFF7D600FFF7D600FFF7D600FFF7D600FFF7D600D6EFC600C6E7B500F7FF
      E70094D68C00FFF7D600FFF7D600000000009C390800FFB55200EF9C42009C39
      08000000000000000000000000009C390800A5420800CE6B0000CE6B00009C39
      080000000000BD5A0000CE6B00009C3908000000000000000000000000000000
      0000E7C6BD00FFDED600FFDECE00FFCEBD00FFC6B500F7B5A500000000008C8C
      8C00000000005A637B0042424200000000000000000000000000D6A58C00FFFF
      FF00292929003163FF00849CFF004A4A5200FFF7F700FFF7E700EFDED600AD84
      7300AD7B7300AD7B7300AD8473000000000000000000FFFFDE00FFFFDE00FFFF
      DE00FFFFDE00FFFFDE00FFFFDE00FFE7BD00FFE7B500F7DEA500FFDEB500FFF7
      D600FFFFDE00FFFFDE00FFFFDE000000000000000000B55A1800FFAD4A00EF9C
      3900B5521000AD4A0800B55A1800EF9C3100EF942900A54208009C3908000000
      000000000000BD5A0000CE6B00009C3908000000000000000000000000000000
      0000E7CEC600FFDED600FFDECE00FFCEBD00FFC6B500F7B5A500000000000000
      000000000000526BBD005A5A5A00000000000000000000000000DEAD8C00FFFF
      FF0018181800CED6EF00FFFFFF00314AC600FFFFF700FFF7EF00E7CEC600E7B5
      8400E7AD6B00EFA53900B58484000000000000000000FFF7CE00FFFFD600FFFF
      D600FFF7D600FFE7BD00F7CE9400EFB57300EFB56B00EFB57300EFB57300F7C6
      8400F7DEA500FFFFDE00FFFFDE0000000000000000009C390800BD631800FFBD
      5200FFB54A00F7AD4A00FFB55200EF9C3900C66B18009C390800000000000000
      000000000000BD5A0000CE6B00009C3908000000000000000000000000000000
      0000E7CEC600FFDED600FFDECE00FFCEBD00FFC6B500F7BDB500000000009CA5
      C600000000004A6BE700314AC600000000000000000000000000DEAD8C00FFFF
      FF00EFEFEF00EFEFEF00EFEFEF00CED6EF003163FF00C6CEFF00E7D6CE00EFC6
      8C00F7BD6B000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6BD9C00F7BD7B00F7BD7B00F7BD
      8400F7C68400F7C68C00FFD6AD00000000000000000000000000000000009C39
      08009C390800A54208009C3908009C3908000000000000000000000000000000
      000000000000A5420800A542080000000000000000000000000000000000E7C6
      C600FFEFE700FFDED600FFDECE00FFCEBD00FFCEB50000000000000000004242
      420042424200313952001039E700000000000000000000000000DEAD8C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFFF00426BFF00E7D6D600EFC6
      8C00B58484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6C6AD00EFBD8C00F7C6
      8400F7C68C00FFC69400FFC69400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7CE
      C600E7C6C600E7C6BD00E7BDB500E7B5AD00F7BDB50000000000000000000000
      00000000000000000000000000003163FF000000000000000000DEA58400D6A5
      8400D6A58400D69C7B00CE9C7B00C6947B00C6947B00BD8C7300B58473000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEC6AD00D6BD9C00C6BDB500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A57B
      7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B73008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000218429002184290000000000000000000000
      000000000000000000000000000000000000000000005284B5005284B500A58C
      9C00CEADAD00FFEFD600FFE7CE00FFE7CE00FFE7C600FFDEBD00FFDEB500FFDE
      B500FFD6AD00FFCEB5008C5A5A00000000000000000000000000000000000000
      0000ADADAD00F7F7F700F7F7F700ADADAD005A5A5A0084848400ADADAD00E7DE
      DE00E7E7E700B5B5B50000000000000000000000000000000000000000000000
      0000949C9C0063636300636363006363630063636300949C9C00949C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063A5630094DE8C0039B5520021842900000000000000
      00000000000000000000000000000000000000000000000000005ABDFF006373
      AD00A58C9C00FFEFD600FFEFD600FFE7CE00FFE7CE00FFDEBD00FFDEBD00FFDE
      B500FFDEB500FFCEB5008C5A5A0000000000000000000000000000000000BDB5
      B500E7E7E700FFFFFF00EFEFEF00B5ADAD004A4A4A0031313100424242008484
      8400ADADAD00E7E7E700DEDEDE0000000000000000000000000073635A00A57B
      5200CE845A00DE945200CE944A00D6944A00D68C4A00CE8C5200CE945200845A
      3900524252000000000000000000000000000000000000000000000000000000
      0000000000000000000063A5630094DE8C0039B5520021842900000000000000
      0000000000000000000000000000000000000000000000000000000000005ABD
      FF003984DE00A58C9C00DEBDB500FFEFD600FFE7CE00FFE7CE00FFE7C600FFDE
      BD00FFDEB500FFD6BD008C5A5A000000000000000000CECECE00F7F7F700F7F7
      F700F7F7F700C6C6C600ADADAD00A5A5A500ADADAD00B5ADAD009C9C9C005A5A
      5A003939390042424200A59C9C00000000000000000073636300946B5200CE8C
      5200CE844A00CE8C4A00C6844A00C6845200CE8C5200D68C4A00C6845200A57B
      4A005A4A84000000000000000000000000000000000000000000000000000000
      0000000000000000000063A5630094DE8C0039B5520021842900000000000000
      000000000000000000000000000000000000000000000000000000000000CEBD
      B5005AB5F7006373AD00B5ADAD00DEBDB500C6A59C00CEADA500DEBDAD00FFDE
      BD00FFDEBD00FFD6BD0094635A000000000000000000EFEFEF00F7F7F700DEDE
      DE00BDBDBD00B5B5B500D6D6D600A5A5A500A59C9C00A59C9C00ADA5A500B5B5
      B500A5A5A5006B6B6B00A59C9C000000000000000000AD7B4A00C6844A00C67B
      4200DE946300EFCEA500F7EFBD00FFEFBD00F7EFBD00F7C69C00DEA56B00AD73
      4200634A9C004242420000000000000000000000000000000000000000000000
      0000000000000000000063A5630094DE8C0039B5520021842900000000000000
      000000000000000000000000000000000000000000000000000000000000F7F7
      EF00FFF7EF00E7D6D600BD948C00FFFFCE00FFFFCE00FFFFE700FFFFEF00C69C
      9400F7D6BD00FFD6C600946363000000000000000000B5ADAD00A5A5A500D6D6
      D600DEDEDE00D6D6D600EFE7E700F7F7F700EFEFEF00D6D6D600CECECE00B5B5
      B500ADA5A500A59C9C009C9C9C000000000000000000BD844200CE7B3900F7DE
      A500EFE7AD00F7EFBD00FFE7B500F7EFAD00FFEFB500FFE7C600EFEFB500BD9C
      7300524A94005252520000000000000000000000000000000000218429002184
      290021842900218429002184290094DE8C0039B5520021842900218429002184
      290021842900218429002184290000000000000000000000000000000000F7F7
      EF00FFF7EF00D6B5B500E7C6A500FFF7BD00FFFFD600FFFFF700FFFFFF00E7D6
      C600CEA59C00FFD6C6009C6B63000000000000000000BDBDBD00D6D6D600D6D6
      D600D6D6D600E7E7E700F7F7F700C6BDC600CECECE00E7E7E700E7E7E700D6D6
      D600CECECE00BDBDBD00A5A5A5000000000000000000E7AD7B00F7DEA500F7DE
      A500F7DEAD00F7DEAD00F7DEAD00FFDEAD00F7DEAD00A59C8400948C9C00BDA5
      F700B5A5FF005A5A5A0000000000000000000000000063A5630039B5520039B5
      520039B5520039B5520039B5520039B5520039B5520039B5520039B5520039B5
      520039B5520039B5520039B5520000000000000000000000000000000000FFF7
      F700FFFFF700CEA59C00FFFFCE00FFEFB500FFFFCE00FFFFE700FFFFEF00FFFF
      DE00BD9C9400FFD6C600A5736B000000000000000000BDBDBD00DEDEDE00D6D6
      D600E7E7E700B5B5B500BDBDBD00D6F7D600EFEFEF00F7BDB500BDBDBD00ADA5
      A500ADADAD00BDBDBD00B5B5B5000000000000000000EFC69C00FFDEAD00FFDE
      A500F7DE9C00F7DEA500F7DEA500EFCEA500A5A58C00AD94E700AD94EF00A59C
      EF00B59CFF006363630000000000000000000000000063A5630094DE8C0094DE
      8C0094DE8C0094DE8C0094DE8C0094DE8C0039B5520094DE8C0094DE8C0094DE
      8C0094DE8C0094DE8C0094DE8C0000000000000000000000000000000000FFFF
      FF00FFFFFF00CEAD9C00F7EFC600FFEFBD00FFFFCE00FFFFD600FFFFDE00F7EF
      CE00C69C9400FFD6CE00A5736B00000000000000000000000000B5B5B500D6D6
      D600C6C6C600CEC6C600F7F7F700F7F7F700EFEFEF00E7E7E700E7E7E700D6D6
      D600CECECE00A5A5A5000000000000000000000000007BD6C60084FFFF007BFF
      FF007BFFFF007BFFFF007BFFFF006BC6CE008C73C6009C84E7008C7BE7009C84
      F7009484EF00636363000000000000000000000000000000000063A5630063A5
      630063A5630063A5630063A5630094DE8C0039B5520021842900218429002184
      290021842900218429002184290000000000000000000000000000000000FFFF
      FF00FFFFFF00E7D6D600D6BDAD00FFFFFF00FFE7B500FFDEAD00FFEFB500D6AD
      9400E7C6BD00FFCEC600AD7B6B0000000000000000000000000000000000ADAD
      AD00F7F7F700DEDEDE00BDBDBD00C6C6C600D6D6D600D6D6D600D6D6D600ADAD
      AD00BDB5B500000000000000000000000000000000006394940073EFFF0073EF
      FF007BEFFF0073EFFF006BEFFF0073EFFF007BC6C600946BE7009473F7008C73
      E7009473E700A5A5A50000000000000000000000000000000000000000000000
      0000000000000000000063A5630094DE8C0039B5520021842900000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00D6B5B500EFE7DE00F7F7D600F7EFBD00EFDEB500CEA5
      9C00FFD6CE00FFBDB500AD7B7300000000000000000000000000000000000000
      0000EFDEDE00FFE7D600FFDED600F7DED600F7DED600E7DEDE00DEDEDE000000
      00000000000000000000000000000000000000000000000000009494940073C6
      DE006BE7FF006BE7FF006BE7FF0073E7FF006BE7FF0073BDCE00736BB5007B6B
      94008C948C000000000000000000000000000000000000000000000000000000
      0000000000000000000063A5630094DE8C0039B5520021842900000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7DEDE00F7E7DE00FFFFF700B584
      7300B5847300B5847300B5847300000000000000000000000000000000000000
      0000E7C6BD00FFDED600FFDECE00FFCEBD00FFC6B500F7B5A500000000000000
      000000000000000000000000000000000000000000000000000000000000848C
      94006B8C94006BC6DE0063CEEF005ADEFF0063CEEF007BB5C6006B848C00949C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063A5630094DE8C0039B5520021842900000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700EFB5
      8C00FFAD3900CE946B00CE9C8400000000000000000000000000000000000000
      0000E7CEC600FFDED600FFDECE00FFCEBD00FFC6B500F7B5A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063A5630094DE8C0039B5520021842900000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700EFCE
      A500DEB58C000000000000000000000000000000000000000000000000000000
      0000E7CEC600FFDED600FFDECE00FFCEBD00FFC6B500F7BDB500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063A5630094DE8C0039B5520021842900000000000000
      000000000000000000000000000000000000000000000000000000000000FFF7
      E700FFEFE700F7EFDE00F7E7DE00EFDED600EFDED600E7D6CE00DED6CE00DEAD
      8C00DEAD8C00000000000000000000000000000000000000000000000000E7C6
      C600FFEFE700FFDED600FFDECE00FFCEBD00FFCEB50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7CE
      C600E7C6C600E7C6BD00E7BDB500E7B5AD00F7BDB50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD7B7B00B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      000000000000A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B7300000000000000000021A5D60021A5D60042BD
      E70029ADD60018A5D60000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000000000000000000000000000AD738400F7E7
      C600F7DEC600F7D6B500F7D6AD00EFCEA500EFCE9C00EFCE9400EFCE9400EFCE
      9400EFCE9400EFCE9400B5848400000000000000000000000000299CDE00ADE7
      F700ADE7F700B5ADAD00F7E7D600F7E7D600F7E7D600EFDECE00EFDECE00EFDE
      CE00EFDECE00F7E7D600A57B73000000000000000000ADDEF700B5FFFF0094F7
      FF008CEFFF006BD6F70052C6E70029ADD60021A5D60000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFF7
      EF00FFF7E700FFEFDE00FFEFD600FFE7CE00FFE7C600FFDEBD00FFDEB500FFD6
      AD00FFD6AD00FFD6A500CE630000000000000000000000000000AD738400F7E7
      CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFCE9400EFCE
      9400EFCE9400EFCE9400B58484000000000000000000299CDE00A5E7F7008CEF
      FF008CEFFF00ADADAD00F7E7DE00F7E7DE00F7E7D600F7E7D600F7E7D600EFDE
      CE00EFDECE00F7E7D600A57B7300000000000000000042B5DE00BDEFF70094F7
      FF0094F7FF0094F7FF008CF7FF008CF7FF0094F7FF008CEFFF008CEFFF0063D6
      EF0031ADDE0000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF0018181800DECECE000842FF00394AAD00FFE7C600FFE7C600FFDE
      B500FFDEB500FFD6AD00CE630000000000000000000000000000AD738400F7EF
      DE00F7E7D600F7DEC600ADADD600294AFF00949CDE00EFCEA500EFCE9C00EFCE
      9400EFCE9400EFCE9400B58484000000000000000000299CDE00A5E7F70094E7
      FF008CEFFF00ADADAD00F7E7DE00F7E7CE00F7DEC600F7DEC600F7DEC600F7DE
      C600F7DEC600F7E7D600A57B730000000000000000005AC6E70094D6EF008CF7
      FF0094F7FF0094F7FF008CF7FF008CEFFF008CEFFF008CEFFF008CEFFF0084E7
      FF005ACEEF0000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00292929007384D600A5ADE7001039E700FFEFD600FFE7CE00FFDE
      BD00FFDEB500FFD6AD00CE630000000000000000000000000000AD7B8400F7EF
      DE00F7E7D6006B84FF002952FF002952FF00395AFF00F7D6AD00EFCEA500EFCE
      9C00EFCE9400EFCE9400B58484000000000000000000299CDE00ADE7F7009CEF
      FF0094EFFF00B5ADAD00F7EFE700F7E7DE00F7E7D600F7E7D600F7E7D600F7E7
      CE00EFDECE00F7E7D600A57B7300000000000000000094EFF70052CEE7009CFF
      FF0094F7FF0094F7FF008CF7FF008CEFFF008CEFFF008CEFFF008CEFFF0073DE
      F70073DEFF0018A5D600000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF0042424200424242004242390042424A00738CEF00FFEFDE00FFE7
      CE00FFE7C600FFDEB500CE630000000000000000000000000000B5848400FFF7
      EF00CECEDE00637BF700CEC6DE00D6CEDE00395AFF00BDB5DE00F7D6AD00EFCE
      A500EFCE9C00EFCE9400B58484000000000000000000299CDE00B5E7F700ADEF
      FF00ADEFFF00BDB5AD00F7EFEF00F7F7EF00F7EFEF00F7EFE700F7EFE700F7EF
      DE00F7E7DE00F7EFDE00A57B730000000000000000009CEFFF0063DEEF00BDFF
      FF008CF7FF0094F7FF008CF7FF008CEFFF008CEFFF008CEFFF008CEFFF0073DE
      F70073DEF70029ADD600000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00F7F7F700F7EFEF00F7EFE700F7E7DE00426BF7004A6BEF00FFEF
      D600FFEFCE00FFE7C600CE630000000000000000000000000000BD848400FFF7
      EF00F7EFE700F7EFDE00F7E7D600F7E7CE008C94E7005273F700EFD6BD00F7D6
      AD00EFCEA500EFCE9400B58484000000000000000000299CDE00BDEFF700B5EF
      FF00B5EFFF00C6B5B500F7F7EF00F7DEC600FFDEBD00FFDEBD00FFDEBD00FFD6
      B500FFDEBD00F7EFDE00A57B7300000000000000000094EFF7009CFFFF0063BD
      E700BDE7F700C6F7FF00C6F7FF009CF7FF0084EFFF008CEFFF008CEFFF000873
      080039BD63001084180018A5D6000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF0084848400848484008484840084848400FFFFFF00FFFFF700FFF7
      E700FFEFD600FFE7C600CE630000000000000000000000000000C68C8C00FFFF
      FF00FFF7F700F7EFE700F7EFE700F7E7D600F7E7CE002952FF004A6BFF00F7D6
      B500F7D6AD00EFCEA500B58484000000000000000000299CDE00C6EFF700C6F7
      FF00C6F7FF00CEBDB500FFF7F700FFFFFF00FFF7F700FFF7F700F7F7EF00F7F7
      EF00F7F7EF00DED6CE00A57B730000000000000000009CEFFF0094FFFF0063D6
      EF0052CEE70063C6E70063C6E700BDE7F700B5F7FF008CEFFF008CEFFF0031AD
      52005AE78C0039BD5A00087310000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00080808008C8C8C00848CAD005A637B00FFFFFF00FFFFF700FFF7
      EF00FFF7E700FFEFD600CE630000000000000000000000000000C68C8C00FFFF
      FF00FFFFFF00FFF7EF00F7EFE700F7EFDE00F7E7D600637BF700294AFF00F7DE
      BD00F7D6B500EFCEA500B58484000000000000000000299CDE00C6EFF700D6F7
      FF00CEF7FF00D6C6B500FFF7F700FFFFFF00FFFFF700FFF7F700F7F7EF00F7EF
      E700E7DED600C6BDBD00A57B730000000000000000009CEFFF0094FFFF0094F7
      FF0094F7FF0094F7FF0094F7FF007BE7F70042BDE7000873080021AD310039BD
      5A0042CE6B0029BD4A0021AD31000073080000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00292929007B94DE00849CFF001039E700FFFFFF00FFFFF700FFFF
      FF00FFF7EF00FFEFD600CE630000000000000000000000000000CE948C00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700F7EFE700F7EFE700F7E7D600CEC6D600F7DE
      C600F7DEBD00DEC6A500A57B84000000000000000000299CDE00CEEFF700E7F7
      FF00DEF7FF00DECEBD00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFF700D6B5
      AD00E7B58400F78C63000000000000000000000000009CF7FF0094FFFF0094F7
      FF0094F7FF0094F7FF008CF7FF0094F7FF008CEFFF0008730800087308000873
      100031BD4A0008730800087308000873080000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00181818009CA5C600FFFFFF004A6BE700FFFFFF00FFFFF700FFF7
      EF00FFF7EF00FFEFD600CE630000000000000000000000000000CE948C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00F7EFE700F7EFDE00F7E7D600F7E7
      CE00EFD6BD00B5AD94009C7B84000000000000000000299CDE00CEEFF700EFFF
      FF00E7FFFF00E7CEBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6B5
      AD00E7B5840000000000000000000000000000000000B5F7FF0094FFFF0094F7
      FF0094F7FF0094F7FF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF000873
      100018AD290008730800000000000000000000000000D66B0000FFFFFF00FFFF
      FF00FFFFFF00EFEFEF00EFEFEF00EFEFEF00EFEFEF003163FF006B8CFF00FFF7
      EF00FFF7E700FFF7EF00CE630000000000000000000000000000D69C9400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7E700EFDED600AD84
      7300AD7B7300AD7B7300AD7B73000000000000000000299CDE00CEEFF700FFFF
      FF00F7FFFF00EFE7DE00E7DED600DEDED600D6D6D600CED6D600C6D6D600C6D6
      D600ADE7EF00000000000000000000000000000000007BCEE700B5FFFF0094FF
      FF0094F7FF0084EFFF0031ADDE0039B5DE0042B5DE004ABDDE004ABDDE000884
      100010AD210008730800000000000000000000000000D6730000DE7B0000DE7B
      0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000EFEFFF006B8CFF00DE7B
      0000DE7B0000DE7B0000CE630000000000000000000000000000DEA59400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00E7CEC600E7B5
      8400E7AD6B00EFA53900B58484000000000000000000299CDE00CEEFF700F7FF
      FF00B5DEEF00B5DEEF00ADE7EF00ADE7EF00ADE7EF00ADE7EF00ADE7EF00D6FF
      FF00ADEFFF00000000000000000000000000000000000000000018A5D60021A5
      D60029ADD60021A5D600000000000000000000000000000000000884100008A5
      1800088C10000000000000000000000000000000000000000000D6731000D673
      1000D6731000D6731000D6731000D6731000D6731000D6731000D6731000D673
      1000D6731000D67B210000000000000000000000000000000000DEA59400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00EFC6
      8C00F7BD6B0000000000000000000000000000000000299CDE00D6EFF700BDA5
      9C00BDADA500DED6D600DED6D600DED6D600DED6D600DED6CE00C6B5AD00EFFF
      FF00B5EFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000008730800087308000894180008941800087B
      1000087308000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEA59400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6D600EFC6
      8C00B58484000000000000000000000000000000000000000000299CDE00E7DE
      DE00A5948C00F7EFEF00FFFFFF00FFFFFF00FFFFFF00CEBDB5009C948C00BDF7
      FF00299CDE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C948C009C948C009C948C009C948C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD7B7B00B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021A5D60021A5D60042BD
      E70029ADD60018A5D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD738400F7E7
      C600F7DEC600F7D6B500F7D6AD00EFCEA500EFCE9C00EFCE9400EFCE9400EFCE
      9400EFCE9400EFCE9400B5848400000000000000000000000000A5B56300A5F7
      9C00E7EFA500FFD67300FFC642009C9C21007B942100398C3100429C42000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ADDEF700B5FFFF0094F7
      FF008CEFFF006BD6F70052C6E70029ADD60021A5D60000000000000000000000
      0000000000000000000000000000000000000000000000000000AD738400F7E7
      CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFCE9400EFCE
      9400EFCE9400EFCE9400B5848400000000000000000000000000B5B56300FFFF
      FF00A5F79C0084EF7B007BEF6300CEEF8C00F7DE7B00FFCE4A00DEAD21000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042B5DE00BDEFF70094F7
      FF0094F7FF0094F7FF008CF7FF008CF7FF0094F7FF008CEFFF008CEFFF0063D6
      EF0031ADDE000000000000000000000000000000000000000000AD738400F7EF
      DE00F7E7D600F7DEC600F7DEC600F7D6B500F7D6AD00EFCEA500EFCE9C00EFCE
      9400EFCE9400EFCE9400B5848400000000000000000000000000B5B56300FFFF
      FF00F7FFDE00A5BD21009CB51800B5C62100CEC62100FFDE4A00FFDE5A00529C
      31003994310052AD520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005AC6E70094D6EF008CF7
      FF0094F7FF0094F7FF008CF7FF008CEFFF008CEFFF008CEFFF008CEFFF0073DE
      F7005ACEEF000000000000000000000000000000000000000000AD7B8400F7EF
      DE00F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE
      9C00EFCE9400EFCE9400B5848400000000000000000000000000A5B5630084EF
      7B008CEF7B00B5BD2100B5B52100BDB52900B5B521009CAD18009CB51800E7CE
      4200F7CE4200A5BD390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094EFF70052CEE7009CFF
      FF0094F7FF0094F7FF008CF7FF008CEFFF008CEFFF008CEFFF008CEFFF0073DE
      F70084E7FF0018A5D60000000000000000000000000000000000B5848400FFF7
      EF00F7EFE700F7E7D600F7E7D600F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE
      A500EFCE9C00EFCE9400B5848400000000000000000000000000A5B5630084EF
      7B00A5DE4A00A5C61800A5C61800CEC62100DEC62900BDBD2100A5B51800B5B5
      3100B5AD3100A5C64200000000000000000000000000000000000021A5000021
      A5000021A5000021A5000021A5000021A5000021A5000021A5000021A5000021
      A5000021A5000021A5000021A50000000000000000009CEFFF0063DEEF00BDFF
      FF008CF7FF0094F7FF008CF7FF008CEFFF008CEFFF008CEFFF008CEFFF0073DE
      F70084E7FF0029ADD60000000000000000000000000000000000BD848400FFF7
      EF00F7EFE700F7EFDE00F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6
      AD00EFCEA500EFCE9400B5848400000000000000000000000000A5B56300DEFF
      CE00FFDE5A00E7CE3100CEC62100B5C61800A5BD1800A5BD10009CB51000BDBD
      3100BDB531007BB552000000000000000000000000000021A5000029E7000029
      E7000029E7000029E7000029E7000029E7000029E7000029E7000029E7000029
      E7000029E7000029E7000029E700000000000000000094EFF7009CFFFF0063BD
      E700BDE7F700C6F7FF00C6F7FF009CF7FF0084EFFF008CEFFF008CEFFF009CB5
      FF004A73FF00A5F7FF0021A5D600000000000000000000000000C68C8C00FFFF
      FF00FFF7F700F7EFE700F7EFE700F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6
      B500F7D6AD00EFCEA500B5848400000000000000000000000000A5B56300B5EF
      6300E7D62900FFD63100F7D62100F7CE2900DECE2100B5C61000B5C61000DECE
      3100E7CE3900000000000000000000000000000000000021A500B5C6FF009CBD
      FF009CBDFF009CB5FF009CB5FF00739CFF00638CF700638CF7005284F7005284
      F700526BF700526BF700526BF70000000000000000009CEFFF0094FFFF0063D6
      EF0052CEE70063C6E70063C6E700BDE7F700B5F7FF008CEFFF008CEFFF002142
      EF000031FF0094F7FF0042BDE700000000000000000000000000C68C8C00FFFF
      FF00FFFFFF00FFF7EF00F7EFE700F7EFDE00F7E7D600F7E7CE00F7DEC600F7DE
      BD00F7D6B500EFCEA500B5848400000000000000000000000000B5B56300FFE7
      7300E7DE3900CED62900CED61800CECE1800CECE1800CECE1800DECE2100E7CE
      3100F7D6420000000000000000000000000000000000000000000021A5000021
      A5000021A5000021A5000021A5000021A5000021A5000021A5000021A5000021
      A5000021A5000021A5000021A50000000000000000009CEFFF0094FFFF0094F7
      FF0094F7FF0094F7FF0094F7FF007BE7F70042BDE7009CB5FF000031FF00295A
      DE000052FF000031FF009CB5FF00000000000000000000000000CE948C00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700F7EFE700F7EFE700F7E7D600F7E7CE00F7DE
      C600F7DEBD00DEC6A500A57B8400000000000000000000000000B5B56300FFDE
      4A00FFE76300E7DE4200DEDE3100CED62900CED62900CED61800CECE1800FFDE
      3900B5C642000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009CF7FF0094FFFF0094F7
      FF0094F7FF0094F7FF008CF7FF0094F7FF008CEFFF005AD6EF009CB5FF0018CE
      FF0029D6FF00527BFF0029ADD600000000000000000000000000CE948C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00F7EFE700F7EFDE00F7E7D600F7E7
      CE00EFD6BD00B5AD94009C7B8400000000000000000000000000A5B56300CEDE
      4200CEE75200CEDE4200CEDE3900E7DE4200F7DE4200FFDE3900FFD63100FFDE
      420084BD4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5F7FF0094FFFF0094F7
      FF0094F7FF0094F7FF009CEFFF009CEFFF009CB5FF007384E7005273EF006BE7
      FF008CEFFF00397BFF00738CF7009CB5FF000000000000000000D69C9400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7E700EFDED600AD84
      7300AD7B7300AD7B7300AD7B7300000000000000000000000000B5B55A00CEEF
      7300CEEF7300CEEF5A00CEE75200CEE74A00CEDE4200DEDE4200E7DE4200BDCE
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007BCEE700B5FFFF0094FF
      FF0094F7FF0084EFFF0031ADDE0039B5DE0042B5DE004ABDDE004A5ADE0008B5
      FF0008B5FF00315AFF0000000000000000000000000000000000DEA59400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00E7CEC600E7B5
      8400E7AD6B00EFA53900B5848400000000000000000000000000B5B55A00FFF7
      A500FFF7A500FFF79C00F7EF8C00FFE77B00FFE77B00F7E75A00DEDE42008CBD
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000018A5D60021A5
      D60029ADD60021A5D6000000000000000000000000007B9CFF006B8CFF007B9C
      FF000031FF009CB5FF004A73FF00000000000000000000000000DEA59400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00EFC6
      8C00F7BD6B000000000000000000000000000000000000000000A5A54A00739C
      A5009CC6730063ADC600CED6840042739400DED67B00BDBDB500CECE730094A5
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000738C
      F7001042FF000000000000000000000000000000000000000000DEA59400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6D600EFC6
      8C00B584840000000000000000000000000000000000000000000000000052C6
      D600A5ADBD004AA5B500847B8400529CAD00A57B84007B94A500C68484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6949400C6949400C694
      9400C6949400C6949400C6949400C6949400C6949400C6949400C6949400C694
      9400C6949400C6949400C69494000000000000000000ADADAD00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00949494004242420031313100FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000007B7373007B7373005A5A5A000000000000000000000000007B73
      73007B7373005A5A5A00000000000000000000000000000000000000000084BD
      E700316BCE00316BCE003973CE00397BD6003984DE004294E7004294E7003194
      EF0073BDEF00000000000000000000000000CE9C9C00CE9C9C00E7BDA500FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00E7B5A500CE9C9C00C6949400FF00FF00737373005A5A5A009494
      9400FF00FF00FF00FF00FF00FF00FF00FF00949494004242420031313100FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000424A4A00B5ADAD00CECECE008C848C007B7373000000000042424200ADAD
      AD00CECECE0084848C007B73730000000000000000000000000000000000B5EF
      FF004294E70073D6FF008CD6FF008CD6FF008CD6FF00A5E7FF00B5EFFF0094DE
      FF0084CEFF00000000000000000000000000C6949400E7B59C00CE9C9C00F7DE
      BD00F7D6B500F7D6B500F7D6B500F7D6B500F7D6B500F7D6B500F7D6B500F7D6
      B500F7DEBD00CE9C9C00E7BDA500C6949400FF00FF0094949400313131005A5A
      5A0094949400FF00FF00FF00FF00FF00FF00949494004242420031313100FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000005252
      5200F7EFEF00847B8C0052636B008C9C9C00C6CECE00BDBDC600C6CECE005252
      5200DEDEDE0052524A00EFEFEF0000000000000000000000000000000000B5EF
      FF004A9CEF0073D6FF008CD6FF008CD6FF008CD6FF008CD6FF008CDEFF0094DE
      FF0084CEFF00000000000000000000000000C6949400F7E7C600F7C6A500E7C6
      BD00F7E7D600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600F7E7
      D600DEBDB500EFCEB500F7E7D600C6949400FF00FF007B7B7B0084848C003131
      31004A4A4A007B7B7B00FF00FF00FF00FF00949494004242420031313100FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000736B
      6B00D6D6D600848C8C006B636300737373007B73730063736B006B7373006B73
      7B00736B6B00BDCEC600D6CECE000000000000000000000000000000000084CE
      FF004A94E7004294E70052A5EF0063B5F7006BC6F7006BC6F7005AC6FF003163
      CE007BCEF700000000000000000000000000C6949400F7E7DE00F7DEC600CE9C
      9C00EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600EFDED600E7CE
      C600CE949400F7E7D600F7E7DE00C6949400FF00FF00FF00FF007B7B7B007B7B
      7B00292929004A4A4A007B7B7B00FF00FF00949494004242420031313100FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000006342
      31006B634A00737363006B736B0084736300B56B5200DE5A3900AD5A4A00846B
      6B006B7373009C8C9400000000000000000000000000000000000000000084CE
      FF00428CE7004284DE004A94E7005AADEF0063B5F7006BC6F7005AC6FF003163
      CE0073BDEF00000000000000000000000000C6949400F7F7EF00F7EFE700F7CE
      B500C6949400F7F7EF00F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700CE9C
      9400F7D6C600F7EFE700F7F7EF00C6949400FF00FF00FF00FF00FF00FF003939
      390073737300212121004A4A4A007B7B7B0031313100313131008C8C8C00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000AD5A
      39004A631800186B1800316B1800EF6B4200E7633900F7632900945A18005A4A
      29005A5A4A00000000000000000000000000000000000000000000000000B5EF
      FF004AA5F70073D6FF008CD6FF008CD6FF008CD6FF008CD6FF00B5EFFF0094DE
      FF008CDEFF00000000000000000000000000C6949400FFFFF700F7F7EF00F7D6
      C600CE9C9400D6ADAD00D6B5AD00D6ADAD00D6B5AD00D6ADAD00D6A5A500DEB5
      AD00F7EFE700F7F7EF00FFFFF700C6949400FF00FF00FF00FF00FF00FF00FF00
      FF00424242007B7B7B00212121005A5A5A0031313100ADADAD008C8C8C00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000847B7B00F77B
      520029842100CE945200B5944A00FF8C5A00F77B5200FF6B4200B5632900216B
      0800424A0800000000000000000000000000000000000000000000000000B5EF
      FF004AA5F70073D6FF008CD6FF008CD6FF008CD6FF00A5E7FF00B5EFFF0094DE
      FF008CD6FF00000000000000000000000000C6949400F7E7E700D6ADAD00DEC6
      C600F7F7F700F7FFFF00EFF7F700EFF7F700EFF7F700EFFFFF00EFFFFF00E7DE
      D600CEA5A500DEC6C600FFF7F700C6949400FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF003939420073737B0021212100212121006B6B6B004A4A4A003939
      39003939390039393900FF00FF00FF00FF00000000000000000063636300318C
      3900108C2100E7AD6B0031AD4A00F79C6300EF945A00F77B4A00EF6B3900216B
      0800216B0800000000000000000000000000000000000000000000000000B5EF
      FF0094BDEF008CADE70094BDEF009CC6EF009CCEF700A5DEFF00A5DEFF0094CE
      FF00A5CEF700000000000000000000000000CE949400CE9C9C00CE9C9C00FFFF
      FF00FFFFFF00F7FFFF00F7FFFF00EFFFFF00EFFFFF00EFFFFF00EFFFFF00EFFF
      FF00EFF7F700C6949400D6A5A500C6949400FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00393942007B7B7B00292929004A4A4A00BD735200BD73
      5200BD7352006B6B6B0031313100FF00FF00000000000000000073737B0008AD
      420008C65A0010DE7B0000B55200FFBD8400F7B57300EF8C5200FF7B4A00216B
      0800216B08000000000000000000000000000000000000000000000000000000
      0000A5948400736B63000000000000000000000000000000000084847B008C73
      5A0000000000000000000000000000000000CE949400B5FFFF00FFFFFF00FFFF
      FF00F7FFFF00F7FFFF00F7FFFF00EFFFFF00EFFFFF00EFFFFF00F7FFFF00EFFF
      FF00E7F7FF00DEEFF700C6E7EF00C6949400FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0042424200C67B6300CE846B00D68C6B00D68C
      7300D6846B00C67B6300BD735200FF00FF0000000000000000009C94940000B5
      4A0000C6630008EF8C0000AD5200FFCE9400FFB57B00EF945200AD843900216B
      0800425221000000000000000000000000000000000000000000000000000000
      0000A5948400736B6300000000000000000000000000000000008C8484008C73
      5A0000000000000000000000000000000000CE9C9400BDEFEF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7FFFF00EFF7F700CEE7E700C6DEDE00A5C6
      CE009CBDCE0084B5C60094A5B500C6949400FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0042424200D68C7300E7947B00E79C8400EFA5
      8C00EF9C8400DE8C7300DE947B003131310000000000000000000000000073A5
      730008CE6B0008EF8C0000EF8C00F7D69400FFBD84004294420010842900635A
      31009C9484000000000000000000000000000000000000000000000000000000
      0000A59484007B737300000000000000000000000000000000009C9C94008C73
      5A000000000000000000000000000000000000000000CE949400C6949400ADF7
      FF009CFFFF008CDEE70084DEE70084E7EF008CEFF7008CEFF7008CE7FF008CE7
      FF0094DEF700CE9C9400CE9C940000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF004A4A4A00EFA58C00EFAD9400FFBDA500FFBD
      A500F7B59C00EFA58C00EFA58C0029292900000000000000000000000000A594
      730039BD630031DE84005AE78C0094C67300FFB57B00B5944A00DE7B4A00947B
      6300000000000000000000000000000000000000000000000000000000000000
      0000A5948400737373007B634A00000000000000000084736300B5B5B5008C73
      5A00000000000000000000000000000000000000000000000000C6949400B5B5
      B50094E7EF008CF7FF008CEFFF008CF7FF008CF7FF008CEFFF008CEFFF009CD6
      E700BDA5AD00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0039393900EFA58C00FFC6AD00FFCEBD00FFC6
      B500FFC6AD00FFB59C00FFB59C00313131000000000000000000000000000000
      000000000000B59C7B00EFAD7B00F7A57300F7946B00AD846B00ADA594000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFEFEF00ADADAD008C8C8C008C8C8C00C6C6C600CECECE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CE9C9400BDB5B5009CE7E7008CF7FF008CF7FF009CE7E700BDADB500CE9C
      940000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF002929290063636300FFCEBD00FFEFE700FFE7
      DE00FFD6C600EFAD9400EF9C8400FF00FF000000000000000000000000000000
      0000000000009C949400A5ADB5008C8C8C009C9494009C949400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5948400E7E7E700EFEFEF00EFEFEF00CECEC6008C735A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CE949400CE9C9C00ADC6CE00ADC6CE00CE9C9C00CE9494000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF0029292900FFEFE700FFEFE700FFEF
      E700FFD6C600EF9C840039394200FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00313131005252
      520031313100FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CEC6C600B5B5B5007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C0008009C000800B5001800B50018009C0008009C0008000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000018004A0018004A0029085A0029085A0018004A0018004A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CEC6C600CEC6C600848484000000000000000000000000000000
      0000BDBDBD004A94D6000000000000000000000000000000000000000000B500
      2100B5001800CE006B00CE008400CE007300CE007300CE008400CE007300B500
      2100AD0010000000000000000000000000000000000000000000000000002900
      630029005A005208AD005A08BD005A08B5005A08B5005A08BD005A08B5003108
      6B00210052000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B00CECECE00848484000000000000000000000000006BBD
      E7006BADCE004A9CB5004A94D60000000000000000000000000000000000B500
      2100CE006B00CE007300CE007300CE007300CE007300CE007300CE007300CE00
      7300C60039000000000000000000000000000000000000000000000000003108
      6B005208AD005A08B5005A08B5005A08B5005A08B5005A08B5005A08B5005A08
      B500420884000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B00CEC6C600848484000000000000000000000000006BA5
      C6007BCEEF006BCEE7004A94D6000000000000000000B5001800C6003100D600
      8400D6007300CE007300CE006B00CE007300CE007300CE007300CE007300CE00
      7300CE007300C6003900AD001000000000000000000029085A0042087B007318
      BD006B10B5005A08B5005208AD005A08B5005A08B5005A08B5005A08B5005A08
      B5005A08B5004208840021005200000000000000000000000000EF9C2900EF8C
      2900EF8C2900EF8C2900EF8C2900EF8C2900EF8C2900EF8C2900EF8C2900EF8C
      2900EF8C2900EF8C2900EF8C2900000000000000000000000000000000000000
      000000000000CEC6C600BDBDBD008C8C8C0000000000000000000000000094CE
      E70063BDF7004A9CBD00000000000000000000000000B5001800DE008400DE00
      8400D6008400CE006B00CE007300EF31AD00FFDEFF00F76BDE00CE007300CE00
      7300CE007300CE007300B5002100000000000000000029085A008418BD007B18
      BD007318BD005208AD005A08B500A57BD600F7EFFF00C6ADEF005A10B5005A08
      B5005A08B5005A08B500290063000000000000000000EF9C3100FFAD4A00FFFF
      FF00FFFFFF00FFD6A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFBD
      6B00FFFFFF00FFCE7B00FFA53900000000000000000000000000000000000000
      000000000000A5A5A50094949400848484000000000000000000A5C6DE0063BD
      F70042A5E70000000000000000000000000000000000DE008400E7008C00DE00
      8400D6007300CE007300CE007300CE007300F75ADE00FFFFFF00FFFFFF00CE00
      7300CE007300CE007300CE00730000000000000000008C29BD009C29C6008418
      BD006B10B5005A08B5005A08B5005A10B500C6A5EF00FFFFFF00FFFFFF005A10
      B5005A08B5005A08B5005A08B5000000000000000000EF9C3100FFAD4A00FFAD
      4A00FFAD4A00FFAD4A00FFAD4A00FFAD4A00FFAD4A00FFAD4A00FFAD4A00FFAD
      4A00FFAD4A00FFAD4A00FFA53900000000000000000000000000000000000000
      000000000000ADADAD008C8C8C006B73730000000000A5C6DE004A9CC600399C
      DE0052BDEF00000000000000000000000000B5002100E7088C00E7008C00DE00
      8400CE007300CE007300CE007300CE007300CE007300FFFFFF00FFFFFF00F75A
      DE00CE007300CE007300CE008400AD00100031086B00A531C6009C29C6008418
      BD005A10B5005A08B5005A08B5005A08B5005A08B500FFFFFF00FFFFFF00C6A5
      EF005A10B5005A08B5005A08BD002100520000000000EF9C3100FFAD4A00FFAD
      4A00FFAD4A00FFAD4A00FFAD4A00FFAD4A00FFAD4A00FFAD4A00FFAD4A00FFAD
      4A00FFAD4A00FFAD4A00FFA539000000000000000000000000009C9C9C00D6D6
      D600D6D6D600A5ADBD005ABDEF0052BDFF0063C6EF0073D6F7004AADFF0042AD
      E7004A94D600000000000000000000000000B5003100EF089C00E7088C00FFCE
      FF00FFEFFF00FFEFFF00FFEFFF00FFEFFF00FFEFFF00FFDEFF00FFFFFF00FFFF
      FF00FFFFFF00CE007300CE008400AD00100031087B00B542CE00A531C600F7E7
      FF00FFF7FF00FFF7FF00FFF7FF00FFF7FF00FFF7FF00F7EFFF00FFFFFF00FFFF
      FF00FFFFFF005A08B5005A08BD002100520000000000EF9C3100FFAD4A00FFFF
      FF00FFCE7B00FFCE7B00FFFFFF00FFFFFF00FFCE7B00FFCE7B00FFFFFF00FFFF
      FF00FFCE7B00FFCE7B00FFA5390000000000000000009C9C9C00D6D6D600CEC6
      C600EFEFEF008CBDDE0073D6FF0052B5FF0084EFFF006BCEFF0042A5EF00429C
      DE0000000000000000000000000000000000C6003900F718AD00EF088C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CE007300CE007300B500210042088400BD5AD600AD39C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF005A08B5005A08B5002900630000000000EF9C3100FFAD4A00FFFF
      FF00FFCE7B00FFCE7B00FFFFFF00FFFFFF00FFCE7B00FFCE7B00FFFFFF00FFFF
      FF00FFCE7B00FFCE7B00FFA5390000000000000000009C9C9C00DEDEDE00A5A5
      A5007B7B7B007BE7FF005AC6FF0042A5E70073CEDE006BCEFF0042A5FF005A73
      840000000000000000000000000000000000C6004200F739BD00F729AD00EF08
      8C00E7088C00E7088C00E7088C00E7088C00DE008400FF9CEF00FFFFFF00FFDE
      FF00E7189C00D6007300CE008400AD00100042088C00CE84DE00C673D600AD39
      C600A542C600A542C600A542C600A539C6008C21BD00EFCEF700FFFFFF00FFEF
      FF00A563CE006B10B5005A08BD002100520000000000EF9C3100FFAD4A00FFAD
      4A00FFAD4A00FFAD4A00FFAD4A00FFAD4A00FFAD4A00FFAD4A00FFAD4A00FFAD
      4A00FFAD4A00FFAD4A00FFA5390000000000000000009C9C9C00E7E7E7009494
      9400A5ADAD007BE7FF0042A5FF005A7B9C00637B840094DEFF004AADFF00429C
      DE005A73840000000000000000000000000000000000F739BD00F752DE00E700
      8C00E7088C00E7088C00E7088C00E7088C00EF189C00FFFFFF00FFFFFF00EF18
      9C00DE008400CE007300CE0084000000000000000000CE84DE00D69CEF009C29
      C600A539C600A539C600A539C600A531C600AD5ACE00FFFFFF00FFFFFF00AD5A
      CE008418BD005A10B5005A08BD000000000000000000FFA53900FFAD4A00FFAD
      4A00FFAD3900FFAD4A00FFAD3900FFAD4A00FFAD3900FFAD3900FFAD3900FFAD
      3900FFAD4A00FFAD4A00FFA5390000000000000000009C9C9C00F7F7F700B5B5
      B5008CA5BD00E7F7FF00BDE7FF0052B5FF006BA5B50073737B002184CE004AB5
      F7004A94D60000000000000000000000000000000000DE007300FF6BEF00EF31
      AD00E7088C00E7088C00E7088C00FF73DE00FFFFFF00FFBDFF00E7109C00DE00
      8400DE008400D6008400C600420000000000000000008429B500DEADF700C67B
      D600A539C600A531C600A539C600DEB5EF00FFFFFF00F7DEFF00A54ACE008418
      BD007B18BD007310BD004A088C000000000000000000FFA53900D66B0000D663
      0000D6630000D6630000D6630000D6630000D6630000D6630000D6630000D663
      0000D6630000D66B0000D66300000000000000000000A5A59C00ADADAD00EFEF
      EF00E7E7E70094C6F700BDE7FF0084D6FF0084EFFF00A58C8C003184CE00429C
      D6004A94D60000000000000000000000000000000000DE087300EF189C00F784
      DE00F729AD00E7008C00E7088C00EF21AD00FFCEFF00E7088C00E7008400DE00
      8400DE008400D6008400B500180000000000000000007B39B500AD63CE00E7BD
      EF00C673D6009C29C600A531C600BD6BD600F7E7FF00A542C6009421BD008421
      BD008418BD007318BD0029085A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A59C00DEBD9C009C9C
      9C0000000000ADADAD00A5A5A5006BA5C6008C9CA5007B8CA50042A5FF004A94
      D60000000000000000000000000000000000000000000000000000000000F739
      BD00FF9CEF00FF73DE00F742BD00EF109C00EF109C00EF109C00EF109C00E708
      8C00E7008C00000000000000000000000000000000000000000000000000CE84
      DE00EFCEF700E7B5EF00CE8CDE00B552CE00AD4ACE00B552CE00B552CE00A539
      C6009C29C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A59C007B7B
      73006363630073737300737373009C949400BDA5A50094EFEF005AC6FF000000
      000000000000000000000000000000000000000000000000000000000000DE08
      7300EF21AD00FF9CEF00FF9CEF00FF6BEF00F75ADE00F742BD00F729AD00E708
      8400C60039000000000000000000000000000000000000000000000000007331
      B500B56BD600EFCEF700EFCEF700DEADF700D6A5EF00CE8CDE00C673D6009439
      BD004A1084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A5A59C00A5A59C00A5A59C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DE087300DE007300E7088400E7088400D6005A00C60039000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007331B5008429B5008C39BD009439BD007321A5004A1084000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000948C8C00948C8C00948C8C00948C8C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D6AD9400CEA59400C6A594000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C9C
      9C00948C8C00CECECE00D6D6D600BDBDBD00BDBDBD00CEC6C600CEC6C600948C
      8C00948C8C00000000000000000000000000000000000000000000000000D6AD
      9C00DEB59C00EFCEA500FFEFDE009463630094636300B58C8400C69C8C00BD94
      8C000000000000000000000000000000000094949400948C94008C8C8C008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C008C8C8C008C8C8C0073737300000000008C7B8400A5949C00637B
      8C0042B5D6005ACEEF0063DEF70073DEF7007BE7F7008CE7EF0094EFEF006384
      8C005A636B00000000000000000000000000000000000000000000000000A5A5
      A500D6D6D600B5B5B5008C8484009C9484009C948400847B73009C949400D6C6
      C600AD9C9C00000000000000000000000000000000000000000000000000E7BD
      9C00F7CE9C00EFCEAD00FFEFDE0094636300946363009463630094636300CEA5
      8C00C69C8C00BD8C84000000000000000000949494008CCE8C008CCE8C008CBD
      8C008CC6940094DEA50094DEA50094DEAD0094DEB5008CDEBD008CDEBD008CDE
      BD0094E7CE009CD6BD009CD6BD006B6B6B0000000000A5848C00BDADAD008C4A
      4A004A849C0052C6E70063CEE70073DEEF007BDEEF008CEFF7009CFFFF005AA5
      BD003194B5007B737B000000000000000000000000009C9C9C00A5A5A500D6D6
      D6008C8C8400FFFFEF00FFF7E700D6BDBD00AD9CBD00FFF7EF00FFFFFF00847B
      6B00AD949400AD9C9C00948C8C000000000000000000D6B59C00EFCEA500EFCE
      A500F7CE9C00F7D6B500FFEFDE00946363009463630094636300946363005A39
      39005A393900EFC6A500C69C8C00000000009C9C9C00398C3900318C3100398C
      4200398C42003994420039944200429C520052A573005AAD7B006BC69C008CEF
      D60094FFE70094E7DE0094E7DE006B6B6B0000000000A5848C00CEA5A5007B6B
      730042A5C60052C6E70063CEE70073DEEF007BDEEF008CEFF7009CFFFF007BAD
      B5005ACEEF005A6B73000000000000000000000000009C9C9C00D6DED600427B
      4200D6D6BD00FFE7C600F7D6A500F7C68400F7C68400F7D6AD00FFF7DE00F7F7
      E700847B6B00E7C6C600948C8C000000000000000000F7D6AD00F7D6AD00F7D6
      A500F7CE9C00F7D6BD00FFEFDE00946363009463630094636300946363005A39
      39005A393900E7C6A500C69C8C00000000009C9C9C0008520800004A00000052
      08000052080000520800005208000852080008420800297B390052A57300A5FF
      FF009CFFFF0094EFE70094EFE7006B6B6B00000000009C848400949CA5007B52
      5A004A849C0052C6E70063CEE70073DEEF007BDEEF008CEFF7009CFFFF0084AD
      B50084D6DE005A63730000000000000000000000000084B58400219C390052DE
      8400218C2900FFFFD600FFFFD600FFF7CE00FFE7B500F7C69400F7CE9C00FFE7
      C600FFFFFF00A58C8C00E7C6C6000000000000000000F7DEAD00FFDEAD00F7D6
      A500F7CE9C00F7D6BD00FFEFDE006B424200946363005A3939005A3939005A39
      39005A393900E7C6A500C69C8C0000000000A5A5A50008520800005200000039
      00000039000000390000003100000852080010631000318C31005ABD730084E7
      B50073E7AD0073CEA50073CEA5006B6B6B0000000000AD8C8C00E7B5AD008C5A
      5A004294B50052C6E70063CEE70073DEEF007BDEEF008CEFF70094F7FF005AA5
      B5002984AD00948C8C0000000000000000009C9C9C00108C210042D66B005AE7
      8C0052DE7B00DEEFBD00FFFFD600FFFFDE00FFFFD600F7D6A500F7C69400F7C6
      8C00FFF7E7007B736300EFC6C600A59C9C0000000000F7DEAD00FFDEAD00F7D6
      A500F7CE9C00F7D6BD00FFEFDE006B424200946363005A3939005A3939005A39
      39005A393900E7C6A500C69C8C0000000000A5A5A5001063100008630800004A
      0000003900000031000000310000106310001884290042B5520073D67B0094B5
      4A00B5AD2900B5A53900B5A539006B6B6B00000000008C7B8400638C9C00636B
      7B004A94AD0052C6E70063CEE70073DEEF007BDEEF008CEFF7009CFFFF006BA5
      B50031ADDE0063636B0000000000000000000073080018A5290029BD420042CE
      630029A54200188C2900398C39008C847B0063636B009C9C8C00948C7B00EFB5
      7B00D6BDB500847B7300E7BDBD00A59C9C0000000000F7D6A500F7D6A5004AB5
      FF0042A5FF0073ADEF00F7F7F700FFEFDE006B4242005A3939005A3939005A39
      39006B424200E7C69C00C69C8C0000000000ADADAD00429C4200429C4200106B
      180000390000004A0000004A0000427B180094B54A009CAD3900AD9C2100D68C
      0800F78C0000E78C1000E78C10006B6B6B0000000000AD8C8C00DEB5B500944A
      4A00428CA50052C6E70063CEE70073DEEF007BDEEF008CEFF7009CFFFF007BB5
      BD0073DEEF00636B73000000000000000000007308002184290018AD310031C6
      5200298C2900BDD6AD00B5D69C008C8C84007373730052524A0052524A00EFBD
      8400BDADB500847B7300E7BDBD00A59C9C0000000000D6DEC6007BCEF70052BD
      FF004AB5FF00319CFF0073B5FF00FFF7E700FFEFDE005A3939005A3939006B42
      4200F7D6B500EFC6A500C69C8C0000000000ADADB5005ABD630052BD5A00187B
      180000520000005A0000085A00006B6B0800C66B0000CE630000DE6B0000DE6B
      0000DE730000DE7B1000CE7B18006B6B6B00000000007B737B0039738C004A84
      9C004A9CBD0052C6E70063CEE70073DEEF007BDEEF008CEFF7009CFFFF0084AD
      B50084D6DE00636B730000000000000000009C9C9C00B5D6B500088C100018AD
      3100298C3100FFFFFF00FFFFFF00FFFFDE00FFFFDE00424242006B6B6300F7CE
      9C00FFEFD6008C7B7B00EFC6C600A59C9C00319CFF005AB5FF0063BDFF0063C6
      FF005ABDFF004AADFF0042A5FF0084BDFF00FFF7EF00FFEFDE00FFEFDE00FFEF
      DE00F7E7CE009C94AD00AD94A50000000000B5B5B5004AB542004AB54200529C
      3900529C3900429C3900849C4200DE8C3900DE7B2100CE6B1000C6630800C65A
      0800C6520000BD630800BD6B18006B6B6B0000000000A5848400CEADAD009442
      42004A849C0052C6E70063CEE70073DEEF007BDEEF008CE7EF0094F7FF0073B5
      C60052ADCE0094949400000000000000000000000000D6D6D600298C290010AD
      2100108C1800FFFFFF00FFFFFF00FFFFF700FFFFDE00E7E7C6004A4A4200E7CE
      AD00FFFFE700B59C9C00E7C6C60000000000000000005AB5FF005AB5FF0063BD
      FF0063C6FF0052B5FF004AADFF00319CFF0084BDFF00FFEFDE00FFEFDE00FFF7
      E700B5B5C6009494AD000000000000000000BDBDBD0073BD420073BD4200A5BD
      5A00E7D68400E7D68400FFEF9C00F7CE7B00F7C66B00DE9C4200C6732900BD73
      3100AD4A0000AD4A08009C4208006B6B6B000000000094949400317394004294
      B5004AADCE0052CEEF005ACEEF0073DEF7007BE7F70094EFFF009CFFFF007BAD
      B5005AD6EF006B6B6B0000000000000000000000000094949400CECECE000894
      180010AD2100218C29007BB57B00F7FFF700FFFFFF00FFFFFF00FFFFEF00E7EF
      C60094948C00DEC6C600948C8C00000000000000000000000000319CFF0063BD
      FF0063BDFF005AC6FF0052BDFF0042A5FF00399CFF0084C6FF00D6E7EF005A84
      C6005A84C600000000000000000000000000BDBDBD00FFD68400FFD67B00FFCE
      6300FFC65200FFC66300FFCE6B00FFC65200FFCE6300F7CE7B00FFFFBD00E7C6
      9400D6AD7300AD6B4200AD6B42006B6B6B000000000000000000000000008C94
      9400527B8C0063A5B50073ADBD007BADB50084B5BD0084C6CE0084CEDE007BB5
      C60073DEEF00636B7B00000000000000000000000000949494009C9C9C00398C
      4200088C100008A51800089418001884210021843100FFFFFF00FFFFEF00A59C
      9400C6ADAD00A59C9C0094949400000000000000000000000000000000005AB5
      FF0063BDFF0063C6FF005AC6FF004AADFF0042A5FF00319CFF00319CFF005284
      DE0000000000000000000000000000000000C6C6C600FFD68400FFD68C00FFB5
      4200FFAD2900FFBD4A00FFBD5A00FFB54200FFBD5A00FFDE9C00F7EFC600F7EF
      C600EFE7B500F7EFC600F7EFC6006B6B6B000000000000000000000000000000
      0000000000008C949400639CB50073CEDE0084CEDE0084BDC6007BBDC60084DE
      E70084EFFF006B737B0000000000000000000000000000000000000000009C9C
      9C00CECECE00CECECE00BDBDB500CEBDAD00CEBDAD00B5ADAD00C6B5B500D6BD
      BD00A59C9C000000000000000000000000000000000000000000000000000000
      0000319CFF0063BDFF0063BDFF00319CFF0063A5E70000000000000000000000
      000000000000000000000000000000000000C6C6C600F7D6A500F7D6A500F7CE
      8C00F7CE8C00F7CE8C00F7D6AD00F7CE9400F7D6AD00F7D69C00EFCE9C00EFD6
      A500EFD6A500EFCEA500E7C69C00737373000000000000000000000000000000
      000000000000000000000000000000000000000000008CADB50084BDC6008CB5
      B500ADADAD000000000000000000000000000000000000000000000000009494
      940094949400C6C6C600D6D6D600C6C6C600C6C6C600CEC6C600C6BDBD009494
      9400949494000000000000000000000000000000000000000000000000000000
      000000000000319CFF00319CFF005284DE000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600EFCEA500EFCE9C00EFCE
      A500EFCEA500EFCE9C00E7C69C00E7C69C00E7C69C00E7C69C00E7C69C00E7C6
      9C00EFC69400E7C69400DEBD9400A5A5A5000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008C9494008C94
      9400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000948C8C00948C8C00948C8C00948C8C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDC6C600BDC6C600BDBDC600BDBD
      BD00B5B5BD00B5B5BD00B5B5B500ADB5B500ADADB500ADADAD00A5A5AD00A5A5
      AD00A5A5A5009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000004A0000004A0000085A0800085A0800004A0000004A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006B7373006B73730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A59C9C00AD9C9C00AD9C9400A5949400736B6B007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000063
      0800005A080008AD180008BD180008B5180008B5180008BD180008B51800086B
      08000052080000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      000000000000000000006B635A00EFA56300D67B210000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7D6
      CE00F7EFEF00EFEFEF00E7DEDE00E7E7E700E7E7E700EFEFEF00EFEFEF00B5A5
      9C0063636300000000000000000000000000000000000000000000000000086B
      100008AD180008B5180008B5180008B5180008B5180008B5180008B5180008B5
      18000884100000000000000000000000000000000000FFFFFF00FFFFFF00FFEF
      D600FFEFD600FFEFD600FFEFD600FFE7CE00FFE7CE00FFE7C600FFDEBD00FFDE
      B500FFDEB500FFD6AD00FFD6A500CE6300000000000000000000000000000000
      000000000000000000006B635A00EFA55A00D673180000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADAD00EFEF
      EF00EFEFEF00CEAD9C00BD846300C67B5200CE846300DECEC600E7E7E700F7EF
      EF00CEBDB50000000000000000000000000000000000085A0800087B180018BD
      310010B5290008B5180008AD180008B5180008B5180008B5180008B5180008B5
      180008B5180008841000005208000000000000000000FFFFFF00D6843100FFFF
      F700FFF7EF00FFEFD600FFE7C600FFD6AD00D67B1800FFE7C600FFE7C600FFDE
      BD00FFDEB500FFD6AD00FFD6AD00CE6300000000000000000000000000000000
      00000000000000000000736B6300E7944A00D673180000000000000000000000
      00000000000000000000000000000000000000000000F7E7DE00F7F7F700D6A5
      8C00BD633900C6633100BD734A00F7F7F700E7C6B500C6633100BD633100DECE
      C600EFEFEF00A59C9400737373000000000000000000085A080018BD420018BD
      390018BD310008AD180008B518007BD68400EFFFEF00ADE7AD0010B5210008B5
      180008B5180008B51800006308000000000000000000FFFFFF00DE8C4200FFFF
      F700FFF7EF00FFEFD600FFE7C600FFD6AD00DE842900FFE7CE00FFE7C600FFDE
      BD00FFDEBD00FFDEB500FFD6AD00CE6300000000000000000000000000000000
      00000000000000000000736B6300E7944200D673180000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700EFEFEF00BD63
      3100C6633100C6633100C6734A00F7F7F700DEAD9400C6633100C6633100C673
      4A00E7DED600F7E7DE00736B6B00000000000000000029BD520029C65A0018BD
      420010B5290008B5180008B5180010B52100A5E7AD00FFFFFF00FFFFFF0010B5
      210008B5180008B5180008B518000000000000000000FFFFFF00DE8C4200FFFF
      FF00FFFFFF00FFF7EF00FFEFE700109C1000009C0000FFEFD600FFE7CE00FFE7
      C600FFE7C600FFDEBD00FFDEB500CE6300000000000000000000000000000000
      00000000000000000000736B6300DE8C3900D673210000000000000000000000
      000000000000000000000000000000000000D6CECE00F7F7F700D6947300C663
      3100CE6B3100CE633100CE6B3900DE946B00CE734A00CE633100CE633100C663
      3100BD633100F7F7F700EFDED60000000000086B080031C66B0029C6630018BD
      420010B5210008B5180008B5180008B5180008B51800FFFFFF00FFFFFF00A5E7
      AD0010B5210008B5180008BD18000052080000000000FFFFFF00DE8C4200FFFF
      FF00FFFFFF00FFFFF700FFF7EF00ADD69400009C000031AD2900BDD6A500FFE7
      CE00EFDEBD00FFE7C600FFDEBD00CE6300000000000000000000000000000000
      00000000000000000000736B6300DE8C3900D673210000000000000000000000
      000000000000000000000000000000000000EFDED600EFE7E700C6734200CE6B
      3900CE6B3100CE633100C66B3900FFF7F700DE9C7B00CE633100CE633100C663
      3100C6633100EFEFEF00F7EFE70000000000087B080042CE7B0031C66B00E7F7
      EF00F7FFF700F7FFF700F7FFF700F7FFF700F7FFF700EFFFEF00FFFFFF00FFFF
      FF00FFFFFF0008B5180008BD18000052080000000000FFFFFF00DE842100DE7B
      0000DE7B0000DE7B0000DE7B0000DE7B0000DE842100009C0000009C0000009C
      0000009C0000FFE7C600FFE7C600CE6300000000000000000000000000000000
      000000000000000000007B6B5A00DE842900DE73290000000000000000000000
      000000000000000000000000000000000000EFDED600E7BDAD00CE6B3900CE6B
      3900CE633100CE633100CE633100EFEFEF00FFF7F700CE6B3900CE633100CE6B
      3900C66B3900F7EFEF00F7F7F70000000000088410005AD68C0039C67300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0008B5180008B518000063080000000000FFFFFF00EFC69C00D673
      0000D6730000D6730000D6730000D6730000EFC69C00109C1000009C0000009C
      0000009C0000FFE7CE00FFE7C600CE6300000000000000000000000000000000
      0000000000000000000063635A00D67B2100DE73310000000000000000000000
      000000000000000000000000000000000000EFDED600EFC6AD00CE734200CE6B
      3900CE633100CE633100CE633100C6A59400F7F7EF00E7A58400CE633100CE6B
      3900CE6B3900F7F7EF00FFF7F70000000000088C100084DEAD0073D69C0039C6
      730042C6730042C6730042C6730039C66B0021BD5200CEEFDE00FFFFFF00EFFF
      F70063CE7B0010B5290008BD18000052080000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0031AD2900009C0000009C
      0000009C0000FFEFD600FFEFD600CE6300000000000000000000000000000000
      000000000000000000007B635200D6731800CE73390000000000000000000000
      000000000000000000000000000000000000EFDED600FFEFE700E7845200D673
      4200CE6B3900CE734A00CE6B3900CE633100C6734200FFFFFF00E7B59C00D673
      4200D6734200FFFFFF00FFF7EF00000000000000000084DEAD009CE7B50029C6
      630039C66B0039C66B0039C66B0031C66B005ACE8400FFFFFF00FFFFFF005ACE
      7B0018BD420010B5210008BD18000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      EF00FFF7EF00FFEFDE00FFEFD600CE6300000000000000000000000000000000
      00000000000000000000635242007B5A4200A563420000000000000000000000
      000000000000000000000000000000000000F7E7DE00FFFFFF00F7AD8400DE7B
      4A00D67B4A00F7E7DE00DEA58C00CE633100CE6B4200FFFFFF00E7BDAD00D673
      4200D6734200FFFFFF00F7E7E700000000000000000029B54A00ADEFC6007BD6
      9C0039C66B0031C66B0039C66B00B5EFC600FFFFFF00DEF7E7004ACE730018BD
      420018BD390010BD3100088C18000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      EF00FFF7EF00FFEFDE00FFEFE700CE6300000000000000000000000000008C8C
      8C004A636B00000000005A5252006B6B6B005A52520000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFA5
      7300FF9C6300E7E7E700FFFFFF00F7EFE700FFFFFF00E7DED600EF8C6300EF8C
      5A00FFE7D600FFF7EF00C6BDB500000000000000000039B54A0063CE8400C6EF
      D60073D69C0029C6630031C66B006BD69400E7F7EF0042C6730021BD5A0021BD
      4A0018BD420018BD3100085A08000000000000000000DE7B0000DE7B0000DE7B
      0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B
      0000DE7B0000DE7B0000DE7B0000CE630000000000000000000000000000F7F7
      F700BDADAD005A5252005A525200B5B5B500B5B5B50000000000000000000000
      00000000000000000000000000000000000000000000EFDED600FFFFFF00FFD6
      B500FFBD8C00E7B59C00E7DED600E7DEDE00E7E7E700F7AD8400FF9C6B00FFD6
      BD00FFFFFF00E7D6CE009C9C9C000000000000000000000000000000000084DE
      AD00CEEFDE00B5EFCE008CDEAD0052CE84004ACE7B0052CE840052CE840039C6
      6B0029C65A0000000000000000000000000000000000CE731000CE731000CE73
      1000CE731000CE731000CE731000CE731000CE731000CE731000CE731000CE73
      1000CE731000CE731000CE73100000000000000000000000000063636300BDBD
      BD00BDBDBD009C9C9C006B6B6B00B5B5B500BDBDBD00B5B5B5005A5252005A52
      52005A5252000000000000000000000000000000000000000000F7E7DE00FFFF
      FF00FFFFFF00FFFFE700FFF7D600FFE7B500FFE7B500FFE7D600FFFFF700FFFF
      FF00F7EFE70000000000000000000000000000000000000000000000000031B5
      42006BD68C00CEEFDE00CEEFDE00ADEFC600A5E7BD008CDEAD0073D69C0039BD
      6300108421000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000527B8400DEDE
      DE00DEDEDE00A5A5A5006B6B6B00A5A5A500ADADAD00C6C6C600C6C6C600B5B5
      B5009C9C9C00000000000000000000000000000000000000000000000000EFDE
      D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFDE
      D600ADADAD000000000000000000000000000000000000000000000000000000
      00000000000031B5420029B54A0039BD5A0039BD630021A54200108421000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B7373008484840084848400848484007B7B7B00737373000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7EFE700EFDED600EFDED600EFDED600EFDED600EFDED600EFDED6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6949400188CE7006B9CC600000000000000000021A5D60021A5D60042BD
      E70029ADD60018A5D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000039ADDE007BE7F7005AD6EF0052C6E70042BDDE0018A5D600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B5521000B56342000000000000000000000000000000000000000000A542
      1000BD5A00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C694
      94004A7BA50052B5FF004AB5FF000000000000000000ADDEF700B5FFFF0094F7
      FF008CEFFF006BD6F70052C6E70029ADD60021A5D60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000021A5D600BDFFFF0094FFFF008CEFFF007BE7F7005ACEEF004AC6E70029AD
      D60029ADDE00000000000000000000000000000000000000000000000000BD6B
      4200FF9C2100DE7B0000D66B0000C65A0000BD5A0000BD5A0000BD5A0000BD5A
      0000C6630000A542000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD949400188C
      E7004AB5FF000000000000000000000000000000000042B5DE00BDEFF70094F7
      FF0094F7FF0094F7FF008CF7FF008CF7FF0094F7FF008CEFFF008CEFFF0063D6
      EF0031ADDE000000000000000000000000000000000000000000000000000000
      000029ADD600A5E7F700A5FFFF0094F7FF008CF7FF008CF7FF0094F7FF0094F7
      FF0094F7FF0042BDE70000000000000000000000000000000000000000000000
      000000000000BD7B52000000000000000000000000000000000000000000A542
      1000A54210000000000000000000000000000000000039ADDE0039ADDE0039AD
      DE00000000000000000000000000D6B5A500C6A59C00000000005A6B73004AB5
      FF0052B5FF00000000000000000000000000000000005AC6E70094D6EF008CF7
      FF0094F7FF0094F7FF008CF7FF008CEFFF008CEFFF008CEFFF008CEFFF0073DE
      F7005ACEEF000000000000000000000000000000000000000000000000000000
      000039B5DE0094DEEF00A5FFFF0094F7FF008CF7FF008CEFFF008CEFFF008CEF
      FF008CEFFF006BD6F70029ADD600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5DEF700BDFFFF009CFF
      FF008CEFFF00F7F7EF00BDFFFF00BDFFFF009CFFFF00FFEFC600D6B5A5000000
      0000000000000000000000000000000000000000000094EFF70052CEE7009CFF
      FF0094F7FF0094F7FF008CF7FF008CEFFF008CEFFF008CEFFF008CEFFF0073DE
      F70084E7FF0018A5D60000000000000000000000000094DEEF007BE7F70052C6
      E70039B5DE005AC6E700ADE7F7008CF7FF008CF7FF008CEFFF008CEFFF008CEF
      FF008CEFFF0084EFFF006BD6F700000000000000000000000000B5634200B563
      420000000000000000000000000000000000B5634200C6630000AD5221000000
      000000000000000000000000000000000000000000006BC6E700BDFFFF0094F7
      FF0094F7FF00BDFFFF00BDFFFF009CFFFF009CFFFF0073E7FF00F7DEB5000000
      000000000000000000000000000000000000000000009CEFFF0063DEEF00BDFF
      FF008CF7FF0094F7FF008CF7FF008CEFFF008CEFFF008CEFFF008CEFFF0073DE
      F70084E7FF0029ADD60000000000000000000000000084DEF70063D6EF0073E7
      F70039B5DE0073E7F7006BC6E700ADEFF700A5EFF700A5F7FF008CF7FF008CEF
      FF008CEFFF0084EFFF008CEFFF00000000000000000000000000000000009C39
      000000000000000000000000000000000000A5420000B54A0000B56342000000
      000000000000000000000000000000000000000000005AC6E70094DEEF008CF7
      FF00C6AD9C00BDFFFF00BDFFFF009CFFFF009CFFFF0084EFFF00FFDEAD000000
      0000000000000000000000000000000000000000000094EFF7009CFFFF0063BD
      E700BDE7F700C6F7FF00C6F7FF009CF7FF0084EFFF008CEFFF008CEFFF0063D6
      F70084E7FF00A5F7FF0021A5D60000000000000000005AC6E7008CEFFF008CF7
      FF0042B5DE0094FFFF009CFFFF008CF7FF0084EFFF005AC6E7005AC6E700ADF7
      FF00A5F7FF0094EFFF00B5FFFF0029ADD600000000000000000000000000A539
      0000A5390000A5420000A5420000A5420000CE630000B56342000000000021A5
      210000A51000009C000042B5420000000000000000007BE7F7005AC6E70094FF
      FF00C6A59C00BDFFFF009CFFFF009CFFFF009CFFFF0073E7FF00FFE7B5000000
      000000000000000000000000000000000000000000009CEFFF0094FFFF0063D6
      EF0052CEE70063C6E70063C6E700BDE7F700B5F7FF008CEFFF008CEFFF0063D6
      F70084E7FF0094F7FF0042BDE70000000000000000005AC6E70094EFF70094F7
      FF0039B5DE0094FFFF0094F7FF0094F7FF0094F7FF0084F7FF005AC6E70094DE
      EF009CDEF7009CDEF700A5E7F70042B5DE00000000000000000000000000B563
      4200AD4A00000000000000000000BD5A0000CE6300000000000000000000009C
      000010B5310042B5420000000000000000000000000094F7FF0073E7F700A5E7
      F700ADEFF700FFF7C60084EFFF0084EFFF0073E7FF00FFFFFF00DEC6AD0031B5
      DE0000000000000000000000000000000000000000009CEFFF0094FFFF0094F7
      FF0094F7FF0094F7FF0094F7FF007BE7F70042BDE700BDE7F700BDE7F700BDE7
      F700CEEFF700CEEFF700C6EFFF0000000000000000008CEFFF005AC6E7009CFF
      FF0042B5DE009CFFFF0094F7FF008CF7FF0094EFFF0094EFF70094EFF70094EF
      FF009CF7FF000000000000000000000000000000000000000000000000000000
      0000B5634200BD735200BD735200DE730000A5420000009C0000009C000018BD
      4A0010AD31000000000000000000000000000000000094F7FF0094FFFF005AC6
      E7005AC6E700CEAD9C00F7DEB500FFE7AD00FFEFC600D6BDBD0073E7FF0052C6
      E70000000000000000000000000000000000000000009CF7FF0094FFFF0094F7
      FF0094F7FF0094F7FF008CF7FF0094F7FF008CEFFF005AD6EF005AD6EF0031B5
      DE0021A5D60029ADD60029ADD600000000000000000094F7FF0073E7F700A5E7
      F700ADEFF700B5FFFF009CFFFF009CFFFF005ACEEF0042B5DE0042B5DE004ABD
      E70052C6E7000000000000000000000000000000000000000000000000000000
      000000000000AD522100A5420000CE6B0000B57B52000000000042B5420029BD
      5A00089C08000000000000000000000000000000000094F7FF0094FFFF0094F7
      FF0094F7FF009CF7FF0084F7FF005AC6E70094DEEF0094DEEF009CDEF700A5E7
      F70042B5DE0000000000000000000000000000000000B5F7FF0094FFFF0094F7
      FF0094F7FF0094F7FF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF0039B5
      DE00000000000000000000000000000000000000000094EFF70094FFFF0094FF
      FF008CF7FF0073E7F7005AC6E700ADE7F700ADF7FF008CE7FF0094EFFF0094EF
      F70029ADD6000000000000000000000000000000000000000000000000000000
      000000000000BD631000FFA52100734A0000009C000042B5420010AD290008A5
      1800009C00000000000000000000000000000000000094F7FF0094FFFF0094F7
      FF0094F7FF0094F7FF0094F7FF007BEFF7005AC6E7005AC6E70029ADD60039AD
      DE0029ADD600000000000000000000000000000000007BCEE700B5FFFF0094FF
      FF0094F7FF0084EFFF0031ADDE0039B5DE0042B5DE004ABDDE004ABDDE0021A5
      D600000000000000000000000000000000000000000094F7FF0094FFFF0094F7
      FF0094F7FF009CF7FF0084F7FF005AC6E70094DEEF0094DEEF009CDEF700A5E7
      F70042B5DE000000000000000000000000000000000000000000000000000000
      000000000000A54A2100FFAD4A0042B54200009C0000009C000029BD5A0021A5
      2100000000000000000000000000000000000000000029ADD600B5FFFF00A5FF
      FF009CFFFF0039ADDE0042B5DE0042B5DE004ABDE70042B5DE00000000000000
      000000000000000000000000000000000000000000000000000018A5D60021A5
      D60029ADD60021A5D60000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5F7FF009CFFFF0094F7
      FF008CF7FF0094EFF70094EFF70094EFFF0094EFFF0063D6EF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000042B5420039C66B0021BD52000000
      0000000000000000000000000000000000000000000029ADD60029ADD60029AD
      D60029ADD6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD600B5FFFF00A5FF
      FF009CFFFF0039ADDE0042B5DE0042B5DE004ABDE70042B5DE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006BD68C0021AD31000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042B54200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031ADDE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031ADDE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000010A5D600C6FFFF0094F7FF007BE7
      F7006BD6EF0042BDE70029ADD60018A5D60018A5D60000000000007308000000
      0000000000000000000000000000000000000000000021A5D60021A5D60042BD
      E70029ADD60018A5D60000000000000000000000000000000000000000000000
      00000000000000000000000000000000000010A5D600C6FFFF0094F7FF007BE7
      F7006BD6EF0042BDE70042424200424242004242420042424200424242000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000010A5D600DEFFFF0094FFFF0094FF
      FF009CF7FF0094F7FF008CEFFF005ACEEF0042BDE70021A5D60008841800428C
      39000000000000000000000000000000000000000000ADDEF700B5FFFF0094F7
      FF008CEFFF006BD6F70052C6E70029ADD60021A5D60000000000000000000000
      00000000000000000000000000000000000010A5D600DEFFFF0094FFFF0094FF
      FF009CFFFF0094F7FF00737373005ACEEF0042BDE7001073E70018A5D6000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000021ADD6008CCEEF00BDFFFF0094F7
      FF0094F7FF00298C4200088418000884180008841800088418000884180008A5
      180008A518000000000000000000000000000000000042B5DE00BDEFF70094F7
      FF0094F7FF0094F7FF008CF7FF008CF7FF0094F7FF008CEFFF008CEFFF0063D6
      EF0031ADDE0000000000000000000000000021ADD6008CCEEF00BDFFFF0094F7
      FF0094F7FF008CF7FF00737373001852FF000031F7000842FF001042B5008CEF
      FF0063D6F7000000000000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000021A5D60052BDDE00C6F7FF0094F7
      FF0094F7FF00298C42005AE7840042CE730042CE730031C66B0021BD4A0010B5
      310008A51800007308000000000000000000000000005AC6E70094D6EF008CF7
      FF0094F7FF0094F7FF008CF7FF008CEFFF008CEFFF008CEFFF008CEFFF0073DE
      F7005ACEEF0000000000000000000000000021A5D60052BDDE00C6F7FF0094F7
      FF0094F7FF008CF7FF00737373001852FF006BCEFF00317BFF000839EF0084EF
      FF0073D6F70018A5D60000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000021A5D6006BDEF7008CCEEF008CF7
      FF0094F7FF00298C42005AE784005AE7840042CE730031C66B0042CE730021BD
      4A0010B5310008A5180000730800000000000000000094EFF70052CEE7009CFF
      FF0094F7FF0094F7FF008CF7FF008CEFFF008CEFFF008CEFFF008CEFFF0073DE
      F70084E7FF0018A5D600000000000000000021A5D6006BDEF7008CCEEF008CF7
      FF0094F7FF008CF7FF00737373008CEFFF008CEFFF008CEFFF0008217B000031
      F70063D6F70042BDE70000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000021A5D6008CF7FF005ABDE7008CF7
      FF0094F7FF00298C42004AAD4A0021A5390021A53900189C290021BD4A0031C6
      6B0021BD4A000073080018A5D60000000000000000009CEFFF0063DEEF00BDFF
      FF008CF7FF0094F7FF008CF7FF008CEFFF008CEFFF008CEFFF008CEFFF0073DE
      F70084E7FF0029ADD600000000000000000021A5D6008CF7FF005ABDE7008CF7
      FF0094F7FF008CF7FF0073737300737373007373730073737300737373000039
      FF000031F7006BD6EF0018A5D600000000000000000000000000000000008C7B
      7300736352000000D6000000D600000000000000000000000000000000000000
      00000000000000000000000000000000000021A5D6009CFFFF00C6ADA500BDE7
      F700C6F7FF00BDFFFF00BDFFFF008CF7FF008CEFFF008CEFFF0021A53900189C
      2900298C42009CF7FF004AC6E700000000000000000094EFF7009CFFFF0063BD
      E700BDE7F700C6F7FF00C6F7FF009CF7FF0084EFFF008CEFFF008CEFFF0063D6
      F70084E7FF00A5F7FF0021A5D6000000000021A5D6009CFFFF0073E7F700BDE7
      F700C6F7FF00BDFFFF00BDFFFF008CF7FF008CEFFF008CEFFF008CEFFF0084E7
      FF0063D6F7000031F700A5F7FF00000000000000000000000000000000008C7B
      7300736352000808E7001008F7000000D6000000D60000000000000000000000
      00000000000000000000000000000000000021A5D60094FFFF00C6ADA50042BD
      E7004ABDDE006BC6E70073C6E700D6F7FF009CF7FF008CEFFF0021A53900428C
      39006BD6FF009CF7FF0084E7F70000000000000000009CEFFF0094FFFF0063D6
      EF0052CEE70063C6E70063C6E700BDE7F700B5F7FF008CEFFF008CEFFF009CB5
      FF004A73FF0094F7FF0042BDE7000000000021A5D60094FFFF0094FFFF0042BD
      E7004ABDDE006BC6E700424242004242420042424200424242004242420084EF
      FF0063D6F700A5F7FF00A5F7FF00000000000000000000000000000000008C7B
      7300736352000808E7001008F7005242FF005242FF000808E7001008F7000000
      D6000000D60000000000000000000000000021A5D60094FFFF00CEB5AD00FFF7
      EF00FFEFE700F7E7CE00F7E7C600F7DEBD0042B5DE00D6F7FF00B5FFFF00A5F7
      FF007BDEFF009CF7FF009CF7FF0018A5D600000000009CEFFF0094FFFF0094F7
      FF0094F7FF0094F7FF0094F7FF007BE7F70042BDE7002142EF002142EF002142
      EF000031FF005A7BF7001042FF000000000021A5D60094FFFF0094F7FF0094F7
      FF0094F7FF0094F7FF007373730094F7FF0039ADDE004273FF00B5FFFF00A5F7
      FF007BDEFF00A5F7FF00A5F7FF0018A5D6000000000000000000000000008C7B
      7300736352000808E7001008F7005242FF005242FF000808E7001008F7001008
      F7001008F7000000D600000000000000000021A5D60094FFFF00D6BDB500FFF7
      F700FFF7EF00F7E7D600F7E7CE00F7DEC600F7DEBD005ABDE700A5DEEF00B5E7
      F700BDE7F700CEEFF700CEEFF70029ADD600000000009CF7FF0094FFFF0094F7
      FF0094F7FF0094F7FF008CF7FF0094F7FF008CEFFF009CB5FF000031FF00295A
      DE000052FF000031FF009CB5FF000000000021A5D60094FFFF0094F7FF0094F7
      FF0094F7FF008CF7FF00737373005AB5FF000842FF000842FF00426BB500B5E7
      F700BDE7F700CEEFF700CEEFF70029ADD6000000000000000000000000008C7B
      7300736352000808E7001008F7005242FF005242FF000808E7001008F7005242
      FF001008F7000000D600000000000000000029ADD60094FFFF00DEC6B500FFFF
      FF00FFFFFF00FFEFE700FFEFDE00F7E7CE00F7DEC600F7DEB500B58484008CEF
      FF0039BDE70000000000000000000000000000000000B5F7FF0094FFFF0094F7
      FF0094F7FF0094F7FF009CEFFF009CEFFF004A73FF000031FF000039FF009CEF
      FF00D6F7FF000052FF000031FF004A73FF0029ADD60094FFFF0094F7FF0094F7
      FF0094F7FF0094F7FF0073737300428CFF0084EFFF004A9CFF000039FF008CEF
      FF0039BDE7000000000000000000000000000000000000000000000000008C7B
      7300736352000808E7001008F7005242FF005242FF000808E7001008F7000000
      D6000000D60000000000000000000000000021A5D600A5FFFF00DEC6B500FFFF
      FF00FFFFFF00FFF7F700FFEFE700FFEFDE00FFEFDE00C6BDAD00B584840094EF
      FF0039B5DE00000000000000000000000000000000007BCEE700B5FFFF0094FF
      FF0094F7FF0084EFFF0031ADDE0039B5DE009CB5FF007384E7005273EF006BE7
      FF008CEFFF00397BFF00738CF7009CB5FF0021A5D600A5FFFF0094F7FF0094F7
      FF0094F7FF008CEFFF007373730094E7F70094DEEF008CCEEF00104AF70084D6
      F70039B5DE000000000000000000000000000000000000000000000000008C7B
      7300736352000808E7001008F7000000D6000000D60000000000000000000000
      000000000000000000000000000000000000000000006BC6E700E7CEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7CECE00B5848400EFA54A00CE737B000000
      000000000000000000000000000000000000000000000000000018A5D60021A5
      D60029ADD60021A5D600000000000000000000000000738CFF000031FF00638C
      FF000039FF000031FF00315AFF0000000000000000006BC6E70094E7EF009CE7
      F7009CEFF70031B5DE0000000000000000000000000000000000000000000839
      FF000031F7000000000000000000000000000000000000000000000000008C7B
      7300736352000000D6000000D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018A5D600E7CEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00B5848400D67B8C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B9CFF006B8CFF007B9C
      FF000031FF009CB5FF004A73FF00000000000000000018A5D60021A5D60029AD
      D60029ADD60018A5D60000000000000000000000000000000000000000000000
      00000031F7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEAD8400DEAD
      8400DEAD8400DEAD8400DEAD8400DEAD8400C6738C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009CB5
      FF004A73FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C0008009C000800B5001800B50018009C0008009C0008000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000018004A0018004A0029085A0029085A0018004A0018004A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B500
      2100B5001800CE006B00CE008400CE007300CE007300CE008400CE007300B500
      2100AD0010000000000000000000000000000000000000000000000000002900
      630029005A005208AD005A08BD005A08B5005A08B5005A08BD005A08B5003108
      6B00210052000000000000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B500
      2100CE006B00CE007300CE007300CE007300CE007300CE007300CE007300CE00
      7300C60039000000000000000000000000000000000000000000000000003108
      6B005208AD005A08B5005A08B5005A08B5005A08B5005A08B5005A08B5005A08
      B500420884000000000000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5001800C6003100D600
      8400D6007300CE007300CE006B00CE007300CE007300CE007300CE007300CE00
      7300CE007300C6003900AD001000000000000000000029085A0042087B007318
      BD006B10B5005A08B5005208AD005A08B5005A08B5005A08B5005A08B5005A08
      B5005A08B5004208840021005200000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5001800DE008400DE00
      8400D6008400CE006B00CE007300FFDEFF00FFDEFF00CE007300CE007300CE00
      7300CE007300CE007300B5002100000000000000000029085A008418BD007B18
      BD007318BD005208AD005A10B500F7EFFF00F7EFFF005A08B5005A08B5005A08
      B5005A08B5005A08B50029006300000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DE008400E7008C00DE00
      8400D6007300F76BDE00FFFFFF00FFFFFF00F75ADE00CE007300CE007300CE00
      7300CE007300CE007300CE00730000000000000000008C29BD009C29C6008418
      BD006B10B500C6ADEF00FFFFFF00FFFFFF00C6A5EF005A08B5005A08B5005A08
      B5005A08B5005A08B5005A08B500000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5002100E7088C00E7008C00DE00
      8400D6007300FFFFFF00FFFFFF00F74ABD00CE007300CE007300CE007300CE00
      7300CE007300CE007300CE008400AD00100031086B00A531C6009C29C6008418
      BD006B10B500FFFFFF00FFFFFF00BD94DE005A08B5005A08B5005A08B5005A08
      B5005A08B5005A08B5005A08BD00210052000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5003100EF089C00E7088C00F75A
      DE00FFFFFF00FFFFFF00FFFFFF00FFEFFF00FFEFFF00FFEFFF00FFEFFF00FFEF
      FF00FFEFFF00CE007300CE008400AD00100031087B00B542CE00A531C600D6A5
      EF00FFFFFF00FFFFFF00FFFFFF00FFF7FF00FFF7FF00FFF7FF00FFF7FF00FFF7
      FF00FFF7FF005A08B5005A08BD00210052000000000000000000000000008C7B
      730073635200BD636300BD636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      73007363520008A5180008A51800000000000000000000000000000000000000
      000000000000000000000000000000000000C6003900F718AD00EF088C00FFEF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CE007300CE007300B500210042088400BD5AD600AD39C600FFF7
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF005A08B5005A08B500290063000000000000000000000000008C7B
      730073635200D6731800E7841800BD636300BD63630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      73007363520021C6310021C6310008A5180008A5180000000000000000000000
      000000000000000000000000000000000000C6004200F739BD00F729AD00E708
      8C00F729AD00FFFFFF00FFFFFF00EF109C00DE008400DE008400DE008400DE00
      8400DE008400D6007300CE008400AD00100042088C00CE84DE00C673D600A539
      C600C673D600FFFFFF00FFFFFF00AD52CE008C21BD008429BD008429BD008421
      BD008421BD006B10B5005A08BD00210052000000000000000000000000008C7B
      730073635200D6731800E7841800EFA55200EFA55200D6731800E7841800BD63
      6300BD6363000000000000000000000000000000000000000000000000008C7B
      73007363520021B5310021C631005ADE6B005ADE6B0021B5310021C6310008A5
      180008A5180000000000000000000000000000000000F739BD00F752DE00E700
      8C00E7088C00FFDEFF00FFFFFF00FFBDFF00EF189C00DE008400DE008400DE00
      8400DE008400CE007300CE0084000000000000000000CE84DE00D69CEF009C29
      C600A539C600F7EFFF00FFFFFF00F7DEFF00B55ACE008421BD008421BD008421
      BD008418BD005A10B5005A08BD00000000000000000000000000000000008C7B
      730073635200D6731800E7841800EFA55200EFA55200D6731800E7841800E784
      1800E7841800BD63630000000000000000000000000000000000000000008C7B
      73007363520021B5310021C631005ADE6B005ADE6B0021B5310021C6310021D6
      390021D6390008A51800000000000000000000000000DE007300FF6BEF00EF31
      AD00E7088C00E7088C00EF189C00FFFFFF00FFFFFF00DE008400DE008400DE00
      8400DE008400D6008400C600420000000000000000008429B500DEADF700C67B
      D600A539C600A531C600B55ACE00FFFFFF00FFFFFF008C21BD008C21BD008418
      BD007B18BD007310BD004A088C00000000000000000000000000000000008C7B
      730073635200D6731800E7841800EFA55200EFA55200D6731800E7841800EFA5
      5200E7841800BD63630000000000000000000000000000000000000000008C7B
      73007363520021B5310021C631005ADE6B005ADE6B0021B5310021C631005ADE
      6B0021D6390008A51800000000000000000000000000DE087300EF189C00F784
      DE00F729AD00E7008C00E7088C00F784DE00FFCEFF00E7008400E7008400DE00
      8400DE008400D6008400B500180000000000000000007B39B500AD63CE00E7BD
      EF00C673D6009C29C600A531C600E7BDEF00F7E7FF009421BD009421BD008421
      BD008418BD007318BD0029085A00000000000000000000000000000000008C7B
      730073635200D6731800E7841800EFA55200EFA55200D6731800E7841800BD63
      6300BD6363000000000000000000000000000000000000000000000000008C7B
      73007363520021B5310021C631005ADE6B005ADE6B0021B5310021C6310008A5
      180008A51800000000000000000000000000000000000000000000000000F739
      BD00FF8CEF00FF73DE00F742BD00EF109C00EF109C00EF109C00EF109C00E708
      8C00E7008C00000000000000000000000000000000000000000000000000CE84
      DE00EFC6F700E7B5EF00CE8CDE00B552CE00AD4ACE00B552CE00B552CE00A539
      C6009C29C6000000000000000000000000000000000000000000000000008C7B
      730073635200D6731800E7841800BD636300BD63630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      73007363520021B5310021C6310008A5180008A5180000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DE08
      7300EF21AD00F78CEF00FF8CEF00FF6BEF00F75ADE00F742BD00F729AD00E708
      8400C60039000000000000000000000000000000000000000000000000007331
      B500B56BD600CEC6F700EFC6F700DEADF700D6A5EF00CE8CDE00C673D6009439
      BD004A1084000000000000000000000000000000000000000000000000008C7B
      730073635200BD636300BD636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      73007363520008A5180008A51800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DE087300DE007300E7088400E7088400D6005A00C60039000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007331B5008429B5008C39BD009439BD007321A5004A1084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD7B7B00B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000AD7B7B00B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000087B
      AD00087BAD00000000000000000000000000000000000000000000000000087B
      AD00087BAD000000000000000000000000000000000000000000AD738400F7E7
      C600F7DEC600F7D6B500F7D6AD00EFCEA500EFCE9C00EFCE9400EFCE9400EFCE
      9400EFCE9400EFCE9400B5848400000000000000000000000000AD738400F7E7
      C600F7DEC600F7D6B500F7D6AD00EFCEA500EFCE9C00EFCE9400EFCE9400EFCE
      9400EFCE9400EFCE9400B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000084DE
      F70073EFFF00087BAD00000000000000000000000000000000001084B500FFFF
      FF0031C6EF000000000000000000000000000000000000000000AD738400F7E7
      CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFCE9400EFCE
      9400EFCE9400EFCE9400B5848400000000000000000000000000AD738400F7E7
      CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFCE9400EFCE
      9400EFCE9400EFCE9400B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000052B5
      D6006BE7FF0042BDDE00087BAD0000000000000000001884B5004ACEEF0042E7
      FF00189CC6000000000000000000000000000000000000000000AD738400DEDE
      DE009C9C9C009C9C9C009C9C9C005A524A00A5947B009C9C9C009C9C9C009C9C
      9C009C9C9C00EFCE9400B5848400000000000000000000000000AD738400F7EF
      DE00F7E7D600F7DEC600F7DEC600F7D6B500F7D6AD00EFCEA500EFCE9C00EFCE
      9400EFCE9400EFCE9400B58484000000000000000000B5848400B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B584840000000000000000000000000000000000087B
      AD0063C6E70063E7FF007BEFFF001084B500188CBD00FFFFFF005AE7FF0021AD
      D600087BAD000000000000000000000000000000000000000000AD7B8400F7EF
      DE00F7E7D600F7E7CE00F7DEC600313939005263630094846300C6AD8400EFCE
      9C00EFCE9400EFCE9400B5848400000000000000000000000000AD7B8400F7EF
      DE00F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE
      9C00EFCE9400EFCE9400B58484000000000000000000FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700000000000000000000000000000000000000
      0000399CC6004ADEFF0063E7FF0073DEF7007BE7F7007BEFFF006BE7FF00108C
      B500000000000000000000000000000000000000000000000000B5848400DEDE
      DE009C9C9C009C9C9C009C9C9C0052737B00297B9C00D67318008C5A5200C6AD
      84009C9C9C00EFCE9400B5848400000000000000000000000000B5848400FFF7
      EF00F7EFE700F7E7D600F7E7D600F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE
      A500EFCE9C00EFCE9400B58484000000000000000000FFF7F700FFFFFF00F7E7
      D600F7E7D600F7E7D600F7E7D600F7E7D600F7E7D600F7E7D600F7E7D600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000004ADEFF0039DEFF0063E7FF007BEFFF009CEFFF0084EFFF000000
      0000000000000000000000000000000000000000000000000000BD848400FFF7
      EF00F7EFE700F7EFDE00F7E7D600F7E7CE007B737B00FFB56300D67318009484
      6300C6AD8400EFCE9400B5848400000000000000000000000000BD848400FFF7
      EF00F7EFE700F7EFDE00F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6
      AD00EFCEA500EFCE9400B58484000000000000000000FFF7F700FFFFFF00FFD6
      A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000087B
      AD001084B50021D6FF0029D6FF0052DEFF006BE7FF0094EFFF0094EFFF00087B
      AD00000000000000000000000000000000000000000000000000C68C8C00DEDE
      DE009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C00FFD6AD00FFC68400D673
      18008C5A5200C6AD8400B5848400000000000000000000000000C68C8C00FFFF
      FF00FFF7F700F7EFE700F7EFE700F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6
      B500F7D6AD00EFCEA500B58484000000000000000000FFF7F700FFFFFF00FFD6
      A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000087BAD001884B5008CE7
      FF0073E7FF0039DEFF0021D6FF0029D6FF0042DEFF006BE7FF0084EFFF009CF7
      FF007BE7F700087BAD0000000000000000000000000000000000C68C8C00FFFF
      FF00FFFFFF00FFF7EF00F7EFE700F7EFDE00F7E7D600AD7B7300FFD6AD00FFB5
      6300D673180094846300B5848400000000000000000000000000C68C8C00FFFF
      FF00FFFFFF00FFF7EF00F7EFE700F7EFDE00F7E7D600F7E7CE00F7DEC600F7DE
      BD00F7D6AD00EFCEA500B58484000000000000000000FFF7F700FFFFFF00F7E7
      D600F7E7D600F7E7D600F7E7D600F7E7D600F7E7D600F7E7D600F7E7D600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000042A5C600ADE7F700ADF7
      FF008CE7FF0052DEFF0039DEFF0018D6FF0029D6FF005AE7FF0073E7FF009CEF
      FF0094EFFF0052C6E700087BAD00000000000000000000000000CE948C00DEDE
      DE009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C00FFCE
      9400BD8484004ABDFF000863A500000000000000000000000000CE948C00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700F7EFE700F7EFE700F7E7D600F7E7CE00F7DE
      BD00F7DEBD00F7D6AD00B58484000000000000000000FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFB56300FFB56300FFFFFF000000000000000000087BAD00087BAD00087B
      AD00087BAD00087BAD0073BDDE0029D6FF0018D6FF0021ADD600087BAD00087B
      AD00087BAD00087BAD00087BAD00000000000000000000000000CE948C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00F7EFE700F7EFDE00F7E7D600AD7B
      7300299CEF00299CEF000018AD00000000000000000000000000CE948C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00F7EFE700F7EFDE00F7E7D600F7E7
      CE00F7DEBD00F7DEBD00B58484000000000000000000FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFD6A500FFB56300FFFFFF00000000000000000000000000000000000000
      00000000000000000000087BAD004ADEFF0031DEFF000884B500000000000000
      0000000000000000000000000000000000000000000000000000D69C9400DEDE
      DE009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C00EFDED600AD84
      7300AD7B73006B8CFF00106BFF00000000000000000000000000D69C9400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFE700F7EFE700F7E7
      CE00F7E7CE00F7DEBD00B58484000000000000000000FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000087BAD0084EFFF0063E7FF00087BAD00000000000000
      0000000000000000000000000000000000000000000000000000DEA59400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00E7CEC600E7B5
      8400E7AD6B000018C6000018C600000000000000000000000000DEA59400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00F7EFE700F7EF
      E700F7E7CE00F7E7CE00B58484000000000000000000DEC6BD00EFD6BD00EFD6
      BD00EFD6BD00EFD6BD00EFD6BD00EFD6BD00EFD6BD00EFD6BD00EFD6BD00DEC6
      BD00DEC6BD00DEC6BD00CEADA500000000000000000000000000000000000000
      00000000000000000000087BAD009CEFFF007BEFFF00087BAD00000000000000
      0000000000000000000000000000000000000000000000000000DEA59400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00EFC6
      8C00F7BD6B000000000000000000000000000000000000000000DEA59400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EF
      E700F7EFE700F7E7CE00B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DEFFFF00ADF7FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000DEA59400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6D600EFC6
      8C00B58484000000000000000000000000000000000000000000DEA59400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      F700F7EFE700F7EFE700B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7FFFF00C6F7FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000087BAD00087BAD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000004A0000004A0000085A0800085A0800004A0000004A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6945A00AD4A2900943110008C632900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B6B007BDEFF004A7B8C008C8C
      8C00000000000000000000000000000000000000000000000000000000000063
      0800005A080021BD4A0008BD180008B5180008B5180008BD180008B51800086B
      080000520800000000000000000000000000000000000000000000000000C694
      5A00CE732900C6634200BD634A00C65A3900C65A4200CE634A00AD4A29007352
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000297BB5002184C6004A9CB500000000000000
      00000000000000000000000000000000000000000000000000008C8C8C007B7B
      7B00000000000000000000000000000000007B7B7B0063C6FF004A9CC6007373
      730084848400000000000000000000000000000000000000000000000000086B
      100008AD180021BD4A0010B5210008B5180008B5180008B5180008B5180008B5
      180008841000000000000000000000000000000000000000000000000000C663
      2900BD523100A5522900945A3100AD421000AD421800BD523100C66342008C39
      10006B4A39000000000000000000000000000000000000000000000000000000
      0000000000004294C6001884DE00187BEF0039A5F70094FFFF0094FFFF004294
      C6005AA5C600000000000000000000000000000000006BADBD0084E7FF003939
      39006B6B6B00000000000000000094949400736B6B001884B500107BAD009C63
      6300BD7B7B0063636300000000000000000000000000085A0800087B180021BD
      4A0021BD4A0008B5210008B518007BDEA500F7FFF70031C65A0008B5180008B5
      180008B5180008841000005208000000000000000000DE9C4A00AD4208009C39
      0000A53900009C42000021631000A5420000A53900009C3100009C310000B54A
      2900BD5A4A00846B630000000000000000000000000000000000000000000000
      0000000000001094EF00108CF700187BEF0010BDFF0052E7FF0084F7FF009CFF
      FF0084E7EF005AA5C6000000000000000000000000005284940063C6FF003942
      4A0052525200848484007B6B6B009C6B6B00CE84840052A5BD0073DEFF009C63
      6300D6848400635252008C8C8C000000000000000000085A080018BD420018BD
      390018BD310008B5180008B51800F7FFF700FFFFFF00A5E7AD0008B5180008B5
      180008B5180008B51800006308000000000000000000B55A10009C390000AD42
      0000AD4A0000B54A0000186300008C520000AD4A0000A54200009C3900009C42
      10009C634A007B42290000000000000000000000000000000000000000004294
      C60008ADFF001094F7001884F70000BDFF00319CB50039A5C60000C6F70008CE
      FF0039DEFF0094FFFF0094FFFF000000000000000000635A5A0018739C00296B
      8C000021B500AD737300DE8C8C00DE8C8C00DE8C8C005273730094F7FF00A56B
      6B000021B500A56B6B00635A5A00000000000000000029BD520029C65A0018BD
      420010B5290063D68C00EFFFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0008B5
      180008B5180008B5180008B5180000000000DE9C4A00AD4A0000B5520000C663
      0000CE6300004A730000007B000008730000946B0000BD5A0000B55200007352
      080052632900945229007B5239000000000000000000000000000000000000BD
      F70008ADFF001094F700108CF70000C6F70042BDE70042CEEF0029A5C60018A5
      CE0000C6FF0029D6F70063EFFF004294C60000000000A56B6B003973840073CE
      F7005273FF000021B500D6848400D6848400D68484004A525200B5E7E7000021
      B5000031DE00B5737300735A5A0000000000086B080031C66B0029C6630018BD
      420010B52900E7F7EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADE7
      B50008B5180008B5180008BD180000520800DE9C4A00B5520000C65A0000D66B
      0000D66B00004A840000008C000094730000CE6B0000C66300008C630000395A
      000031631800845A31007B422100000000000000000000000000319CCE00089C
      E70008A5F700109CF70008BDFF007BBDD6006BC6DE0039A5C60029ADD60000C6
      F700429CB50042BDE70000BDEF000000000000000000BD7B7B00AD73730094F7
      FF0084D6DE005273FF000031DE00BD7B7B00BD7B7B000021B5000021B500D6A5
      A500D6A5A500C68C8C007B63630000000000087B080042CE7B0031C66B0052CE
      8400C6EFD600FFFFFF00DEF7E700DEF7E700FFFFFF0039C64A0094DE9C00FFFF
      FF00EFFFEF0008B5180008BD180000520800DE9C4A00CE630000D66B0000948C
      0000529400008C9400008C940000F78C0000EF8400005A7B0000007B0000006B
      000000630000635A1800844A18000000000000000000298CD6001884DE001073
      D6001094EF0021B5F70031ADCE0029ADD60018C6EF0084B5BD005ABDD60039A5
      BD0039ADCE0008B5E700188CB5000000000000000000B5737300B5737300A5DE
      DE00B5E7E700AD7373005273FF000021B500CE8C8C000031DE000031DE00DEAD
      AD00DEA5A500BD8C8C007B6B6B0000000000088410005AD68C0039C6730052CE
      8400E7F7EF00EFFFF7005ACE8400E7F7E700FFFFFF0039C64A0008B51800FFFF
      FF00EFFFEF0008B5180008B5180000630800DE9C4A00D66B0000DE73000008A5
      180052A518008CA51800F7A51000FF940000F7940000C6840000298400000873
      0000426300004263100084521800000000000000000000C6FF0042D6FF0010C6
      FF000884CE0084F7FF008CEFF7005ADEF700ADBDC60031B5D600299CBD0031C6
      EF0010C6EF00000000000000000000000000000000009C6B6B00A56B6B00B584
      8400CE9C9C00FFD6D600FFCECE000031E7000031E700E7ADAD00F7C6C600EFB5
      B500E7ADAD00946B6B000000000000000000088C100084DEAD0073D69C0039C6
      6B0021BD5A0029C6520029BD5200DEF7E700FFFFFF0031BD420018BD390018BD
      390018BD390010B5290008BD180000520800DE9C4A00E77B00007B94100021BD
      420021C64A0029C65A0073CE5A00FFC65200FFB53100F7940000CE8C00000884
      0000007300002163000094733900000000000000000010D6FF0031D6FF0008C6
      F700087BC6005ACEFF008CF7FF007BF7FF007BEFFF0073C6D600ADB5BD0021CE
      F7001084AD0000000000000000000000000000000000A57B7B00D6BDBD00FFEF
      EF00FFE7E700DEB5B500D6A5A5000031EF000031E7000021B500DE9C9C00EFB5
      B500E7B5B500A594940000000000000000000000000084DEAD009CE7B50029C6
      630039C66B0031C6630031C66300DEF7E700FFFFFF0031BD420021BD4A0018BD
      420018BD390010B5210008BD180000000000DE9C4A00D67B000052A5210029C6
      520031CE63004AD673004AD67300FFDE7B00FFC65200FF9400009C9400002984
      0000087B0000396B0000AD946B00000000000000000052B5D60094E7EF008CEF
      F70052DEFF0042C6E70031B5F700087BBD00218CBD0073E7F70042D6F7001094
      F7001884D60000000000000000000000000000000000B5737300BD9C9C00FFF7
      F700FFF7F7000021B5000031EF00F7DEDE00FFE7E700FFCECE000031FF00C694
      9400A58C8C000000000000000000000000000000000029B54A00ADEFC6007BD6
      9C0039C66B0031C66B0039C66B00DEF7E700FFFFFF0031BD420021BD520018BD
      420018BD390010BD3100088C180000000000000000004ABD4A0021BD420052D6
      7B007BDE8C00B5F7B500C6F7CE00CEEFA50094CE63009CA51800BD9400006B84
      0000087B0000BD9C63000000000000000000000000007BB5CE006BB5CE0094E7
      EF00A5F7FF0073EFFF005ADEFF0021B5F700189CCE0018BDE70010C6F70010B5
      FF00108CCE000000000000000000000000000000000000000000B56B6B00F7E7
      E700FFF7F7000031F7000031FF00FFDEDE00FFD6D600FFCECE00E7ADAD000031
      F700000000000000000000000000000000000000000039B54A0063CE8400C6EF
      D60073D69C0029C6630031C66B00DEF7E700FFFFFF0031BD420029C65A0021BD
      4A0018BD420018BD3100085A080000000000000000004AD67B0031C6520063DE
      7B0084E79400E7FFC600ADF7B50094E7940031CE63008CA51800C6940000D673
      0000397B00000000000000000000000000000000000000000000000000000000
      00007BB5CE006BB5CE0063BDD600A5E7F7009CEFFF0084E7F7004ACEEF00429C
      BD00000000000000000000000000000000000000000000000000000000000021
      B5000031F700BD9C9C00AD848400BDA5A500BDA5A500FFFFFF009C9C9C000000
      00000000000000000000000000000000000000000000000000000000000084DE
      AD00CEF7DE00B5EFCE008CDEAD0052CE84004ACE7B0052CE840052CE840039C6
      6B0029C65A0000000000000000000000000000000000000000000000000094CE
      63009CD66B00B5E79400C6DE84004AD67B0031CE63006BA51800EF840000EFA5
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000007BB5CE0094C6DE007BB5CE006BB5CE0073B5CE006BADC6000000
      0000000000000000000000000000000000000000000000000000000000005273
      FF000031F70000000000000000000000000000000000FFFFFF009C9C9C000000
      00000000000000000000000000000000000000000000000000000000000031B5
      42006BD68C00C6EFDE00CEF7DE00ADEFC600A5E7BD008CDEAD0073D69C0039BD
      6300108421000000000000000000000000000000000000000000000000000000
      00004AD67B009CD6730084D67B0052CE5A0029C6520073A52100EFA529000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000031B5420029B54A0039BD5A0039BD630021A54200108421000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B730000000000000000000000000000000000A542
      0800B55200000000000000000000000000000000000000000000B5520000A542
      0800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A57B7300EFDECE00EFE7D600EFE7D600EFE7D600EFDECE00EFDE
      CE00EFDECE00EFE7D600EFDECE00000000000000000000000000A5420800A542
      080000000000AD4A0000A54208000000000000000000B5520000A5420800A542
      0800B54A00000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000846B6B00846B6B00846B
      6B00846B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031DE000031DE00000000000000000000000000000000000000
      000000000000A57B7300EFDED600EFE7DE00EFE7DE00EFE7D600EFE7D600EFDE
      CE00EFDECE00EFE7D600EFDECE00000000000000000000000000C65A00000000
      000000000000A5420800AD4A000000000000B5520000AD4A0000000000000000
      0000AD4A00000000000000000000000000000000000000000000A54A0000A54A
      0000A54A0000A54A0000A54A0000A54A0000846B6B00846B6B00FF9C9C00A573
      7300846B6B00846B6B00846B6B0000000000000000000031DE000031DE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031DE000031DE00000000000000000000000000000000000000
      000000000000B5847300EFDED600FFE7CE00F7DEBD00F7DEBD00F7DEBD00F7DE
      BD00F7DEBD00EFE7D600EFDECE00000000000000000000000000BD520000A542
      08000000000000000000AD4A000000000000A54208000000000000000000A539
      0800AD4A00000000000000000000000000000000000031636300316363003163
      63003163630031636300846B6B00A5737300FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00A573730000000000000000000031DE000031DE000031
      DE000031DE000000000000000000000000000000000000000000000000000031
      DE000031DE0000000000000000000000000000000000A57B7300A57B7300A57B
      7300A57B7300B5847300EFE7DE00F7EFDE00F7E7DE00F7E7D600F7E7D600F7E7
      D600EFE7D600F7E7D600EFDECE0000000000000000000000000000000000B552
      0000A5390800A5420800B54A000000000000A5420800A542080000000000AD4A
      0000AD4A00000000000000000000000000000000000000636300006363000063
      63000063630000636300846B6B00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00CE9C9C00846B6B0000000000000000000031DE000031
      DE000031DE0000000000000000000000000000000000000000000031DE000031
      DE000031DE0000000000000000000000000000000000EFDECE00F7EFDE00EFE7
      D600EFE7D600BD8C8400EFE7DE00F7EFE700F7EFDE00F7E7DE00F7E7D600F7E7
      D600F7E7D600F7E7DE00EFDECE00000000000000000000000000000000000000
      0000C65A0000AD4A0000B55200008C42180094421000AD4A0000A54208000000
      0000000000000000000000000000000000000000000000000000639C9C00B5DE
      DE00B5DEDE00846B6B00846B6B00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE0000000000846B6B000000000000000000000000000000
      00000031DE000031DE000031DE00000000000031DE000031DE000031DE000000
      00000000000000000000000000000000000000000000EFDED600F7EFE700EFE7
      DE00EFE7D600CE9C8400EFE7E700F7EFDE00F7E7D600F7E7D600F7E7D600FFE7
      CE00F7DEC600F7EFDE00EFDED600000000000000000000000000000000000000
      000000000000C65A00009442100084736B007B5A4A00C65A0000000000000000
      0000000000000000000000000000000000000000000000000000639C9C00FFFF
      FF00FFFFFF00846B6B00A5737300FFEFEF00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE0000000000FFCECE00A57373000000000000000000000000000000
      0000000000000031DE000031DE000031DE000031DE000031DE000031DE000000
      00000000000000000000000000000000000000000000EFDED600F7EFE700F7DE
      BD00F7DEBD00DEAD8400F7EFEF00FFF7F700FFF7EF00F7EFEF00F7EFE700F7EF
      E700F7EFE700F7EFE700DED6CE00000000000000000000000000000000000000
      00000000000063524A0094847B00CEB5B500846B63006B524200000000000000
      0000000000000000000000000000000000000000000000000000639C9C00B5DE
      DE00B5DEDE00846B6B00A5737300FFFFFF00FFEFEF00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00A57373000000000000000000000000000000
      000000000000000000000031DE000031DE000031FF0000000000000000000000
      00000000000000000000000000000000000000000000EFE7DE00FFF7EF00F7E7
      DE00F7E7DE00DEAD8400F7EFEF00FFFFFF00FFFFFF00FFF7F700FFF7F700FFF7
      EF00FFF7F700D6D6D600BDBDBD00000000000000000000000000000000000000
      00000000000073635200D6C6C60094847B008C7B73007B6B5A00000000000000
      0000000000000000000000000000000000000000000000000000639C9C00FFFF
      FF00FFFFFF00846B6B00846B6B00FFFFFF00FFEFEF00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00846B6B000000000000000000000000000000
      0000000000000031DE000031DE000031DE000031DE000031FF00000000000000
      00000000000000000000000000000000000000000000EFE7DE00FFF7F700F7EF
      DE00F7E7DE00E7B58C00F7EFEF00FFFFFF00FFFFFF00FFFFFF00FFFFF700EFE7
      DE00B5847300EFAD5A00E79C4200000000000000000000000000000000000000
      000000000000EFE7E700EFE7E700000000008C736B00E7CECE007B6B5A000000
      0000000000000000000000000000000000000000000000000000639C9C00B5DE
      DE00B5DEDE007B39B500846B6B00FFCECE00FFEFEF00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00846B6B000000000000000000000000000000
      00000031FF000031FF000031DE0000000000000000000031FF000031FF000000
      00000000000000000000000000000000000000000000EFE7E700FFFFF700F7E7
      D600F7E7D600EFBD9400FFF7EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFE7
      E700B5847300EFAD5A00BD848400000000000000000000000000000000000000
      000063524200FFFFFF00ADA59C00000000006B524200FFFFFF00ADA59C000000
      0000000000000000000000000000000000000000000000000000639C9C00FFFF
      FF00FFFFFF00FFFFFF00A5737300A5737300FFCECE00FFEFEF00FFCECE00FFCE
      CE00FFCECE00FFCECE00A5737300000000000000000000000000000000000031
      FF000031FF000031FF000031FF0000000000000000000031FF000031FF000031
      FF000000000000000000000000000000000000000000F7EFEF00FFFFFF00FFF7
      EF00FFF7EF00EFBD9400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD
      8400B58473000000000000000000000000000000000000000000000000009C84
      7B008C7B730094847B0000000000000000000000000094847B00FFFFFF009C84
      7B00000000000000000000000000000000000000000000000000639C9C00B5DE
      DE00B5DEDE00B5DEDE00B5DEDE0063636300846B6B00846B6B00A5737300A573
      7300846B6B00846B6B00846B6B000000000000000000000000000031FF000031
      FF000031FF000000000000000000000000000000000000000000000000000031
      FF000031FF0000000000000000000000000000000000F7EFEF00FFFFFF00FFFF
      FF00FFF7F700FFF7F700FFF7F700FFF7F700EFE7E700BDBDBD00B58473000000
      0000000000000000000000000000000000000000000000000000000000006352
      4200BDB5AD006B5242000000000000000000000000006B524200CEC6BD006352
      4200000000000000000000000000000000000000000000000000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000846B6B00846B6B00846B
      6B00846B6B0031636300CE63000000000000000000000031FF000031FF000031
      FF000031FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7EFEF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFFF00B5847300E7AD7300E79C4200BD8484000000
      0000000000000000000000000000000000000000000000000000000000007363
      52008C7B6B000000000000000000000000000000000000000000000000007363
      5200000000000000000000000000000000000000000000000000DE7B0000DE7B
      0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B
      0000DE7B0000CE630000CE63000000000000000000000031FF000031FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFF7EF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B5847300F7C67B00BD848400000000000000
      0000000000000000000000000000000000000000000000000000000000006B5A
      4A006B5A4A000000000000000000000000000000000000000000000000006B5A
      4A0000000000000000000000000000000000000000000000000000000000E7A5
      6300E7A56300E7A56300E7A56300E7A56300E7A56300E7A56300E7A56300E7A5
      6300E7A56300E7A56300CE63000000000000000000000031FF000031FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEAD8400DEAD8400DEAD
      8400DEAD8400DEAD8400DEAD8400B5847300BD84840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD8C
      8C00B5949400AD949400A5848400AD8C8C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6C6C600DEDEDE00DED6
      D600DED6D600CEB5B500D6C6C600BD9C9C00BD9494009C6B6300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000214A940000000000000000001884BD001073B5000000
      0000214A94000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B6B007BDEFF004A7B8C008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      0000B5521000B56342000000000000000000000000000000000000000000A542
      1000BD5A0000000000000000000000000000B5847300E7E7E700E7E7E700DEDE
      DE00DED6D600D6BDBD00D6C6C600C6B5B500BD9494008C5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000029639C002173AD00214A94002952840039B5E70029A5D600294A
      7B0000529400426B8C00000000000000000000000000000000008C8C8C007B7B
      7B00000000000000000000000000000000007B7B7B0063C6FF004A9CC6007373
      730084848400000000000000000000000000000000000000000000000000BD6B
      4200FF9C2100DE7B0000D66B0000C65A0000BD5A0000BD5A0000BD5A0000BD5A
      0000C6630000A5420000000000000000000000000000EFEFEF00F7F7F700E7E7
      E700DEDEDE00D6ADAD00CE949400C68C8C00BD8C8C00A5736B00AD7B7300C6A5
      A500A59494008C5A520000000000000000000000000000000000000000000000
      0000000000005AADD60052B5E7004AB5EF0039ADE70039B5E70031ADDE0018A5
      D60018A5D6003194B50073737B0000000000000000006BADBD0084E7FF003939
      39006B6B6B00000000000000000094949400736B6B001884B500107BAD009C63
      6300BD7B7B006363630000000000000000000000000000000000000000000000
      000000000000BD7B52000000000000000000000000000000000000000000A542
      1000A542100000000000000000000000000000000000B5847300DEBDBD00E7E7
      E700DEDEDE00CEA5A500CE7B7B00CE7B7B00BD8C8400B5848C00CEADAD00CEAD
      AD00ADA5A5009C8484007B4A5200000000000000000000000000000000000000
      00000000000000428C00298CC6004ABDEF0042BDEF0039B5E70031ADDE0021A5
      DE0018A5D600214A940000428C0000000000000000005284940063C6FF003942
      4A0052525200848484007B6B6B009C6B6B00CE84840052A5BD0073DEFF009C63
      6300D6848400635252008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C949400CE8C7B00FFB5
      3900F7BD8400C6737300C65A5A00B55A5A00CEADAD00D6BDBD00CEA5A500C694
      94009C737300AD9494009CBD9C00A57373000000000000000000000000000000
      0000000000005AC6FF0052C6F7004ABDEF005AC6EF00A5A5A5006B6B6B00006B
      AD00007BB500089CCE000894CE000000000000000000635A5A0018739C00296B
      8C00634A4A00AD737300DE8C8C00DE8C8C00DE8C8C005273730094F7FF00A56B
      6B00DE8C8C00A56B6B00635A5A00000000000000000000000000B5634200B563
      420000000000000000000000000000000000B5634200C6630000AD5221000000
      000000000000000000000000000000000000000000009C949400D6946B00FFB5
      3900FFB53900F7B56300DEA58400B5636300CEA5A500CEA5A500D6ADAD00CEAD
      AD00AD8C8C009C737300A57B7B00A57373000000000000000000000000000000
      00000000000052C6EF0052C6EF004ABDEF006BC6EF00A5A5A5006B6B6B00108C
      C6001094C600089CCE00109CCE000000000000000000A56B6B003973840073CE
      F7004A4A4A00AD737300D6848400D6848400D68484004A525200B5E7E700A56B
      6B00D6848400B5737300735A5A00000000000000000000000000000000009C39
      000000000000000000000000000000000000A5420000B54A0000B56342000000
      000000000000000000000000000000000000000000009C949400E7A55200FFC6
      5A00FFC65A00FFBD4A00FFBD4A00FFC65200FFC65200D6847B00D6B5B500CEA5
      A500AD7B7B00C6949400B5848400A57B73000000000063A55A00428C31000000
      000000000000088C1000188484004ABDEF006BC6EF00A5A5A5006B6B6B0021A5
      DE0018A5D600A5C6BD00000000000000000000000000BD7B7B00AD73730094F7
      FF0084D6DE00B5737300BD7B7B00BD7B7B00BD7B7B00AD737300CE848400D6A5
      A500D6A5A500C68C8C007B63630000000000000000000000000000000000A539
      0000A5390000A5420000A5420000A5420000CE630000B56342000000000021A5
      210000A51000009C000042B5420000000000000000009C949400F7B55200FFC6
      5200FFC65A00FFC65A00FFC65A00FFC65200FFC65200D68C7B00D6B5B500CEA5
      A500AD7B7B00CE949400BD8C8C00A57B730000000000399C3100088C10005A84
      21003994290031CE4A0031AD9C0042B5DE0063C6D6009C9C9C006363630039AD
      D60029A5D60000000000000000000000000000000000B5737300B5737300A5DE
      DE00B5E7E700AD737300B5737300BD7B7B00CE8C8C00E7B5B500E7B5B500DEAD
      AD00DEA5A500BD8C8C007B6B6B0000000000000000000000000000000000B563
      4200AD4A00000000000000000000BD5A0000CE6300000000000000000000009C
      000010B5310042B54200000000000000000000000000CEA58C00FFCE6300FFD6
      7300FFD67B00FFD67B00FFD67B00FFCE6B00FFCE6300CE949400D6BDBD00CE9C
      9C00AD7B7B00AD7B7B00B5848400A57373000000000063D66B0052EF7B0031CE
      4A0039D65A0031CE4A0021BD310018B5290031B531007B735A006B6352000000
      000000000000000000000000000000000000000000009C6B6B00A56B6B00B584
      8400CE9C9C00FFD6D600FFCECE00E7ADAD00D6949400E7ADAD00F7C6C600EFB5
      B500E7ADAD00946B6B0000000000000000000000000000000000000000000000
      0000B5634200BD735200BD735200DE730000A5420000009C0000009C000018BD
      4A0010AD310000000000000000000000000000000000D6AD7B00FFCE6B00FFDE
      8400FFDE8C00FFDE8C00FFDE8C00FFD67B00FFD67300CE9C9C00D6BDBD00CE94
      9400AD737300CE949400BD8C8C00A573730084BD7B0031A531004ADE6B0042DE
      6B0039D65A0031CE4A0029C6420018B5290018A51800317B21006B8442000000
      00000000000000000000000000000000000000000000A57B7B00D6BDBD00FFEF
      EF00FFE7E700DEB5B500D6A5A500EFC6C600FFDEDE00EFBDBD00DE9C9C00EFB5
      B500E7B5B500A594940000000000000000000000000000000000000000000000
      000000000000AD522100A5420000CE6B0000B57B52000000000042B5420029BD
      5A00089C080000000000000000000000000000000000EFCE7B00FFDE8400FFE7
      9C00FFEFA500FFEFAD00FFEFA500FFE79400FFDE8400D6ADAD00D6BDBD00D6A5
      A500C6737300C6737300BD6B6B00A573730094E7A50052EF840052EF7B0063E7
      7B00CED6CE006B736B0018731800008C000008940800089C080052A529000000
      00000000000000000000000000000000000000000000B5737300BD9C9C00FFF7
      F700FFF7F700FFE7E700E7C6C600F7DEDE00FFE7E700FFCECE00F7C6C600C694
      9400A58C8C000000000000000000000000000000000000000000000000000000
      000000000000BD631000FFA52100734A0000009C000042B5420010AD290008A5
      1800009C000000000000000000000000000000000000EFCE8400FFDE8C00FFEF
      A500FFF7B500FFF7BD00FFF7B500FFE79C00FFDE8C00DEC6C600EFE7E700F7EF
      EF00EFE7E700D6949400CE737300A57B730094E7A5005AEF840052EF7B009CEF
      AD00D6D6D6006B6B6B00217B2900089C080008A5100018A5180073C663000000
      0000000000000000000000000000000000000000000000000000B56B6B00F7E7
      E700FFF7F700FFFFFF00FFF7F700FFDEDE00FFD6D600FFCECE00E7ADAD00B5A5
      A500000000000000000000000000000000000000000000000000000000000000
      000000000000A54A2100FFAD4A0042B54200009C0000009C000029BD5A0021A5
      210000000000000000000000000000000000000000000000000000000000AD8C
      8C00A58C8C00B59C9400CEB59C00EFDEA500F7D69400B5847300B5847300B584
      7300B5847300B584730000000000000000000000000042D6630039D65A009CEF
      AD00D6D6D6006B6B6B00399C420018B5290018A5180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDA5A500BD9C9C00AD848400BDA5A500BDA5A500FFFFFF009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000042B5420039C66B0021BD52000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD8C8C00AD8C8C00AD848400AD84840000000000000000000000
      000000000000000000000000000000000000000000008CF7AD005AE77B00ADEF
      B500CECECE00636363005A944A0021B5290063C6630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006BD68C0021AD31000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CEAD84005A5A5A00C6BDB500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042B54200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000884AD000884AD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000846B6B00846B6B00846B6B00A573730000000000A5737300846B6B00846B
      6B00A57373000000000000000000000000000000000021A5D60021A5D60042BD
      E70029ADD60018A5D60000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000884AD0031AD
      D60042ADCE000884AD00107B9C0018A5CE0029ADCE001894BD000884AD0042AD
      CE0042ADCE000884AD000000000000000000B552180084522100844218008442
      1800844218008442180084421800844218008442180084421800844218008442
      180084421800844218008442180084421800000000000000000000000000846B
      6B00846B6B00A5737300FF9C9C00FFBDBD0000000000FFBDBD00FF9C9C00FF9C
      9C00846B6B00000000000000000000000000000000005ACEEF00B5FFFF0094F7
      FF008CEFFF006BD6F70052C6E70029ADD60021A5D60000000000000000000000
      00000000000000000000000000000000000000000000000000000884AD0042C6
      E70039C6EF0010B5E70010ADDE0021CEF7004ADEFF0018A5CE0063CEE7007BD6
      EF0018A5CE000884AD000000000000000000B552180052392900523929005239
      2900523929005239290052392900523929005239290052392900523929005239
      2900523929005239290052392900844218000000000000000000846B6B00A573
      7300FFBDBD00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFB5
      B500FF9C9C00846B6B00A573730000000000000000009CEFFF0094F7FF0094F7
      FF0094F7FF008CEFFF008CEFFF0073EFFF0063E7FF005ADEFF005ADEFF005ACE
      EF004AC6E70018A5D6000000000000000000000000000884AD0031A5C60084E7
      FF0073E7FF0018A5CE0018A5CE0018D6FF0031D6FF0063D6F7007BD6EF00BDEF
      FF00BDEFFF000884AD000884AD0000000000B552180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008442180000000000846B6B00846B6B00FFBD
      BD00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFC6
      C600FFB5B500A5737300846B6B0000000000000000009CEFFF0094F7FF0094F7
      FF0094F7FF008CEFFF008CEFFF007BEFFF0073EFFF0063E7FF0063E7FF005ADE
      FF005ADEFF005ADEFF0018A5D600000000000884AD008CDEF7006BCEEF008CE7
      FF007BE7FF005ADEFF0042DEFF0018D6FF0021D6FF0063E7FF008CEFFF00A5EF
      FF008CE7FF0042B5DE0039B5DE000884AD00B552180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008442180000000000846B6B00A5737300FFDE
      DE00FFE7E700FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FF9C9C00FF9C9C00A57373000000000094EFF70094F7FF0094F7
      FF0094F7FF0094F7FF008CEFFF008CEFFF008CEFFF0084EFFF0073EFFF0063E7
      FF005ADEFF005ADEFF0018A5D600000000000884AD00A5DEEF00BDEFFF00A5EF
      FF008CEFFF006BE7FF0052DEFF0052B5C60052ADC60018CEF70010D6FF0010D6
      FF0010D6FF0010CEFF0008CEF7000884AD00B552180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008442180000000000846B6B00A5737300FFE7
      E700FFDEDE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FF9C9C00846B6B00000000009CEFFF0094F7FF0094F7
      FF008CF7FF0094F7FF008CF7FF008CEFFF008CEFFF008CEFFF0084EFFF006BE7
      FF0063E7FF005ADEFF0018A5D600000000000000000084CEDE00C6F7FF00ADEF
      FF0094EFFF007BCEE70094949400A5A5A500A59C9C009494940039BDDE0010D6
      FF0010D6FF0010D6FF0008BDEF0000000000B55218000000000042424200FFFF
      FF0042424200424242000808080000000000424242006B6B6B006B6B6B006B6B
      6B006B6B6B0000000000000000008442180000000000A5737300FFCECE00FFEF
      EF00FFDEDE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE0000000000FFCE
      CE00FFCECE00FFCECE00FF9C9C00846B6B000000000094EFF70094F7FF0094F7
      FF0094F7FF0094F7FF0094F7FF008CF7FF008CEFFF008CEFFF008CEFFF007BEF
      FF0073EFFF005ADEFF0018A5D600000000000884AD007BC6DE00C6F7FF00BDF7
      FF00A5EFFF00BDBDBD00EFEFEF00ADADAD00ADA5A500DEBDBD00CEB5BD0073E7
      FF009CEFFF00BDEFFF006BBDD6000884AD00B552180000000000FFFFFF000808
      0800000000000000000000000000FFFFFF004242420000000000000000000000
      000000000000000000000000000084421800000000000000000000000000FFEF
      EF00FFE7E700FFCECE00FFCECE00FFCECE000000000000000000FFCECE00FFCE
      CE00FFCECE000000000000000000846B6B00000000009CEFFF0094FFFF0094F7
      FF0094F7FF0094F7FF0094F7FF0094F7FF008CF7FF008CEFFF008CEFFF0084EF
      FF007BEFFF005AE7FF0018A5D600000000000884AD0094DEEF00B5E7F700C6F7
      FF00ADEFFF00CECECE00EFEFEF00ADADAD00ADA5A500DEBDBD00D6B5B50084E7
      FF00ADEFFF00B5E7F7008CCEE7000884AD00B552180000000000FFFFFF000000
      000000000000FFFFFF0008080800FFFFFF000808080000000000000000000000
      00000000000000000000000000008442180000000000A5737300FFCECE00FFF7
      F700FFEFEF00FFDEDE00FFCECE00FFCECE0000000000FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FF9C9C00846B6B00000000009CEFFF0094FFFF0094F7
      FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0010841800108418001084
      1800108418008CEFFF0018A5D6000000000000000000000000000884AD00CEF7
      FF00BDF7FF00CECECE00EFEFEF00ADADAD00ADA5A500DEBDBD00D6B5B50063E7
      FF0084E7FF000884AD000000000000000000B55218000000000042424200FFFF
      FF00424242000000000000000000080808000000000000000000000000000000
      00000000000000000000000000008442180000000000A5737300FFCECE00FFFF
      FF00FFF7F700FFEFEF00FFD6D600FFCECE0000000000FFCECE00FFCECE00FFCE
      CE00FFCECE00FFBDBD00FF9C9C00846B6B00000000009CF7FF00BDE7F700C6F7
      FF00C6F7FF009CF7FF008CF7FF0094F7FF0094F7FF001084180031AD52001084
      1800089418008CEFFF0018A5D6000000000000000000000000000884AD006BBD
      D60073C6DE00CECECE00EFEFEF00ADADAD00ADA5A500DEBDBD00D6B5B50031B5
      DE0042B5D6000884AD000000000000000000B552180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008442180000000000846B6B00A5737300FFEF
      EF00FFEFEF00FFF7F700FFE7E700FFCECE0000000000FFCECE00FFCECE00FFC6
      C600FFBDBD00FF9C9C00A57373000000000000000000B5F7FF0094FFFF0094F7
      FF0094F7FF0031ADDE007BCEE7009CEFFF009CEFFF00108418004AD67B0021AD
      3900108418005ACEEF0018A5D600000000000000000000000000000000000000
      000000000000CECECE00EFEFEF00ADADAD00ADA5A500DEBDBD00D6B5B5000000
      000000000000000000000000000000000000B552180029211800292118002921
      1800292118002921180029211800292118002921180029211800292118002921
      18002921180029211800292110008442180000000000846B6B00846B6B00FFCE
      CE00FFEFEF00FFF7F700FFE7E700FFCECE0000000000FFCECE00FFCECE00FFBD
      BD00FFADAD00A5737300846B6B0000000000000000007BCEE700B5FFFF0094FF
      FF0094F7FF0084EFFF0031ADDE0039B5DE0042B5DE0010841800108418001084
      18001084180039BDE70000000000000000000000000000000000000000000000
      000000000000CECECE00CECECE009C9C9C009C949400C6ADAD00CEB5B5000000
      000000000000000000000000000000000000B5521800EFC67B00EFC67B00EFC6
      7B00EFC67B00EFC67B00EFC67B00EFC67B00EFC67B00EFC67B00EFC67B00EFC6
      7B00EFC67B00EFC67B00EFC67B0084421800000000000000000000000000846B
      6B00A5737300FFEFEF00FFCECE00FFCECE0000000000FFCECE00FFBDBD00FF9C
      9C00A5737300A57373000000000000000000000000000000000018A5D60021A5
      D60029ADD60021A5D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CECECE00EFEFEF00BDBDBD00A5A5A500BDADAD00ADA5A5000000
      000000000000000000000000000000000000B5521800E78C3100E78C3100E78C
      3100E78C3100E78C3100E78C3100E78C3100E78C3100E78C3100E78C3100EF9C
      4A00EF9C5200D68C5A006B7BC60084421800000000000000000000000000846B
      6B00846B6B00A5737300FFBDBD00FFCECE0000000000FFBDBD00FF9C9C00A573
      7300846B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEDEDE00F7F7F700D6D6D600B5B5B500ADA5A500AD9C9C000000
      00000000000000000000000000000000000000000000A5522900A5522900A552
      2900A5522900A5522900A5522900A5522900A5522900A5522900A5522900A552
      2900A5522900A5522900A5522900000000000000000000000000000000000000
      000000000000846B6B00846B6B00846B6B00846B6B00846B6B00846B6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009494940094949400949494009494940094949400949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5735A00A5735A00A5948C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031638C00426BB500318C
      D6002194D600186B9400295A6B00636363000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B594
      8C00AD4A00009C390000AD633900CE9C8400BD7B52009C3100008C3100007B42
      2900735242000000000000000000000000000000000000000000CE846300CE94
      7B00E7B59C00BD846B00BD8C7B00B5847300946B520073422900844A39008463
      5A00000000000000000000000000000000000000000000000000000000003163
      8C00CE948C00B5848400B5848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000396B9C004A6BB500427B
      D600428CDE003994EF002994EF00188CB500186B94004A5A5A006B6B6B000000
      000000000000000000000000000000000000000000000000000000000000B552
      0800DE730000A5420800BD735200E7D6C600E7CEBD00DEB5A500C68C7300A54A
      18009C310000B5948C0000000000000000000000000000000000BD846300FFC6
      AD00FFE7C600CE8C7300DE947B00F7A58400F7A58400B5847300A5847B007B4A
      390084635A00000000000000000000000000000000000000000000000000B584
      8400DEA59400F7EFE700EFDED600B5848400B584840000000000000000000000
      000000000000000000000000000000000000000000003973B500426BBD00427B
      D600427BD600428CDE00398CDE003994EF003994EF003194F7003194FF002194
      EF001894D600295A730073737300000000000000000000000000BD5A1000E784
      0000DE7B0000A5420800BD7B6300EFDED600E7D6C600DEB5A500D6B59C00D6AD
      9C00D6A58C00BD73520000000000000000000000000000000000C6846B00F7BD
      A500FFCEAD00E7C6AD00FFD6BD00CE9C9400EFD6C600E79C7B00E7A58C00DEA5
      8C00B58C84000000000000000000000000000000000000000000396BAD00B584
      8400DEA59400FFF7EF00F7EFE700F7EFE700F7EFE700F7EFE700EFDED600B584
      8400B584840000000000000000000000000000000000317BBD004273CE004273
      CE00427BD600427BD600428CDE003994EF003994EF003994F7003194F700319C
      FF00319CFF00188CBD0063636300000000000000000000000000CE630000E784
      0000E77B0000A5420800BD846300EFDED600EFD6CE00D6A58C00D6AD9400CE9C
      8400D6AD9400BD73520000000000000000000000000000000000C6846B00FFBD
      A500FFCEB500DEAD9C00DEB59C00E7CEB500EFEFE700DEAD9400EFBDA500E7B5
      9C00B58C7B000000000000000000000000000000000000000000426BB500B584
      8400DEA59400FFF7EF00FFF7EF00B5ADB5004A4A4A00ADADAD00F7EFE700F7EF
      E700B584840000000000000000000000000000000000318CDE00427BD600426B
      BD004273BD00427BD600427BD600428CDE00398CDE003994EF003994EF003194
      F7003194FF00188CCE0063636300000000000000000000000000CE6B0000EF8C
      0000E78400009C3900008C5A4200F7E7E700EFDED600E7CEC600D6C6BD00C6AD
      A500D6B59C00BD73520000000000000000000000000000000000BD846B00FFC6
      B500FFD6BD00CE9C8400E7B59C00C68C7300C67B6300DEAD9400C68C7B00DEB5
      9C00B58C7B000000000000000000000000000000000000000000426BB500B584
      8400DEA59400FFFFFF00FFF7F700FFF7F700FFF7F700313131008C848400F7EF
      E700B584840000000000000000000000000000000000318CDE00427BD6004A6B
      B500426BBD004273CE00427BD600427BD600428CDE003994EF003994EF003994
      F7003194F700188CCE0063636300000000000000000000000000CE6B0000EF8C
      0000EF840000943100005A392900F7EFE700EFE7DE00EFD6CE00E7CEC600DEBD
      AD00DEB5A500BD73520000000000000000000000000000000000C6846300FFC6
      B500FFCEB500E7CEB500FFEFCE00D6948400FFD6BD00CE947B00D6948400DEAD
      9400B58C7B000000000000000000000000000000000000000000426BB500B584
      8400DEA59400FFFFFF00FFFFFF00ADA5AD00B5ADB5004A4A4A00A5A5A500F7EF
      E700B5848400000000000000000000000000000000003994EF004273BD00394A
      6B00394A6B00425A94004263AD00427BD600427BD600428CDE00398CDE003994
      EF003994EF00188CBD0063636300000000000000000000000000D6730800F794
      0000F78C0000BD6B3900F7CEAD00D6A57B00E7B58C00EFC6A500E7BDA500DEC6
      B500DEBDAD00BD73520000000000000000000000000000000000C6846300FFCE
      BD00FFE7C600B57B6300BD7B6300EFC6A500AD7B6B00FFD6B500FFC69400FFCE
      AD00B58C7B000000000000000000000000000000000000000000426BB500B584
      8400DEA59400FFFFFF00FFFFFF0031313100CECECE00FFF7EF00FFF7EF00F7EF
      E700B5848400000000000000000000000000000000004294EF00426BB5004A6B
      B5004263AD00425A940039527B0039527300395A8C003973B5003973CE003994
      EF003994EF00188CBD0063636300000000000000000000000000D6730800FF94
      0000F7940000FFEFE700FFF7EF00F7DEC600F7D6B500F7CEA500C6845A006331
      100063392900B5948C0000000000000000000000000000000000C6846300FFD6
      C600FFE7C600BD8C7B00DEAD9400D6A58C00C68C7300CEADAD007384AD00CEBD
      B500CE9C84000000000000000000000000000000000000000000426BB500B584
      8400DEA59400FFFFFF00FFFFFF00ADA5AD00313131007B737300FFF7F700F7EF
      E700B5848400000000000000000000000000000000004A94DE0042638C004273
      CE004273CE004273CE004273CE005294D60094EFFF008CDEFF005294D600426B
      B5004263AD0039527B0039424A00000000000000000000000000D67B1800FF9C
      0800FF940000D68C4200F7EFE700EFD6C600F7D6C600CE9C8400D6AD9400D6A5
      8C00C68C63000000000000000000000000000000000000000000BD846300FFD6
      CE00FFD6BD00E7C6B500DEBDA500EFCEB500DEC6B500B5B5B5004A9CF700BDB5
      D600DE9C73000000000000000000000000000000000000000000426BB500B584
      8400DEA59400FFFFFF00FFFFFF004A5A5200CECECE00FFFFFF00FFFFFF00FFF7
      F700B5848400000000000000000000000000000000005294D60042526B00427B
      D600427BD600427BD600427BD6004A94DE005AB5EF0063CEF7004A94DE00427B
      D600427BD600427BD600394A6300000000000000000000000000D67B2100FFA5
      1800FF9C0800D6843900EFD6C600E7A55A00D6A58C00D6AD9C00D6B59C00D6A5
      9400CE946B000000000000000000000000000000000000000000BD846300FFDE
      CE00FFDEC600EFC6A500F7CEAD00F7D6BD00EFDEC600E7DECE00A5CEDE00D6CE
      CE00CE9473000000000000000000000000000000000000000000426BB500B584
      8400DEA59400FFFFFF00FFFFFF00CECECE004A5A52004A5A5200CECECE00FFF7
      F700B584840000000000000000000000000000000000396394004A8CCE009CCE
      F700ADD6F700ADD6F7009CCEF7006BADEF00529CEF004294EF003994EF003994
      EF003994EF00398CDE00394A5200000000000000000000000000D6842900FFAD
      2900FFA51800E7943900F7EFE700D6CECE0084ADCE007394AD00638CAD00D6AD
      9C00D69C73000000000000000000000000000000000000000000C6846300FFE7
      DE00F7D6BD00E79C7300F7A58400F7A58400DE9C7B00DE9C7B00EFAD8400F7CE
      B500BD9C94000000000000000000000000000000000000000000426B9C00B584
      8400DEA59400FFFFFF00FFFFFF00ADA5AD00FFF7FF008C949400FFF7FF00FFFF
      FF00B5848400000000000000000000000000000000005A636B004A5A6B003963
      9400396BAD00428CDE00529CEF007BBDEF008CD6F70094D6FF008CD6F7005AB5
      EF004AADF7003994EF0042424A00000000000000000000000000D6843100FFAD
      3100FFA52900EF9C3900F7EFEF00EFE7DE00EFDECE00E7CEBD00DEC6B500DEB5
      A500DEA573000000000000000000000000000000000000000000C6846300FFEF
      E700F7DEC600EF844A00FF9C6300FF9C6300FFA56B00FFA57300FFAD7B00EFBD
      A500BDA59400000000000000000000000000000000000000000042638C00B584
      8400DEA59400DEA59400FFFFFF00ADA5AD00FFFFFF004A5A5200ADA5AD00FFFF
      FF00B58484000000000000000000000000000000000000000000000000000000
      0000000000001842AD0039424A00000000000000000008086B00181852004252
      6B00425A7B007B7B7B0000000000000000000000000000000000D6844200FFBD
      4A00FFB53900FFA52900FFCE8C00F7CEA500EFCEA500E7CEBD00E7C6AD00DEBD
      AD00DEAD7B000000000000000000000000000000000000000000C6846300FFF7
      F700FFF7DE00E7AD8C00E7A57B00E7947300DE946B00E78C6300F78C5A00E7B5
      9400CEA594000000000000000000000000000000000000000000000000004273
      CE00426BB5003173CE00B5848400B5848400B584840000000000DEA59400DEA5
      9400DEA594000000000000000000000000000000000000000000000000000000
      0000000000002163D60021429C0021396B0029315A0008188C00182163000000
      0000000000000000000000000000000000000000000000000000D68C4200FFD6
      9C00F7D6A500EFDED600EFD6CE00E7C6AD00E7BDA500DEAD7B00DE9C6B00CE73
      1800D66B18000000000000000000000000000000000000000000CE846300FFFF
      FF00FFFFF700FFFFDE00FFFFDE00FFFFDE00FFF7DE00FFDEC600F7CEAD00FFEF
      D600DEB59C000000000000000000000000000000000000000000000000000000
      0000000000004273CE00426BB500396B9C003173CE00B5848400B5848400B584
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7BD
      AD00E7C6B500E7C6BD00E7CEC600E7CEBD00DEC6B500F7EFD600FFF7DE00F7EF
      D600DEB5A5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD7B7B00B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B58484000000000000000000636B7300C69C94000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000004A0000004A0000085A0800085A0800004A0000004A00000000
      0000000000000000000000000000000000000000000000000000AD7B7B00F7E7
      CE00F7DEC600F7DEB500F7D6B500F7D6A500F7CE9C00EFCE9400EFCE9400EFCE
      9400EFCE9400EFCE9400B58C7B00000000006394B500218CEF002173B500CE9C
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000063
      0800005A080008AD180008BD180008B5180008B5180008BD180008B51800086B
      0800005208000000000000000000000000000000000000000000AD7B7B00FFE7
      CE00F7E7CE00F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400EFCE9400B58C7B00000000004AB5FF0042A5FF00218CEF007B84
      9400CE9C94000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000086B
      100008AD180008B5180008B5180008B5180008B5180008B5180008B5180008B5
      1800088410000000000000000000000000000000000000000000AD7B7B00FFEF
      DE00FFE7D600F7E7C600F7DEC600F7DEB500F7D6B500F7D6A500F7CEA500EFCE
      9400EFCE9400EFCE9400B58C7B00000000000000000052BDFF005ABDFF00218C
      EF002173B500CE9C940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001873FF006B73BD00945A6B00BD736300945A63009C6B7300318C
      FF000000000000000000000000000000000000000000085A0800087B180018BD
      310010B5290008B5180008AD180008B5180008B5180008B5180008B5180008B5
      180008B518000884100000520800000000000000000000000000AD847B00FFEF
      E700FFEFDE00F7E7CE00F7E7CE00F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE
      9C00EFCE9400EFCE9400B58C7B00000000000000000031A5FF0052BDFF0042A5
      FF00218CEF0084849400CE9C9400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002152E700DE9C7B00DEB58C00EFDEBD00EFDEC600D68C6300DE8C52001873
      FF001873FF0000000000000000000000000000000000085A080018BD420018BD
      390018BD310008AD180010B52100EFFFEF00EFFFEF0008B5180008B5180008B5
      180008B5180008B5180000630800000000000000000000000000B58C7B00FFF7
      EF00181818008494EF000842FF00524A4200F7DEC600F7DEB500F7D6B500F7D6
      A500F7CE9C00EFCE9400B58C7B000000000000000000000000000000000052BD
      FF005ABDFF003184D60052636B00000000009C6B6B00CEA59C00D6B5A500CE9C
      9C00C69494000000000000000000000000000000000000000000000000001852
      DE00FFBD6B00E7B58C00EFC69400F7F7C600E7CEAD00D6844A00EFCE9400F7F7
      E700FFFFFF001873FF00318CFF00000000000000000029BD520029C65A0018BD
      420010B52900ADE7AD00FFFFFF00FFFFFF00A5E7AD0008B5180008B5180008B5
      180008B5180008B5180008B51800000000000000000000000000B58C8400FFF7
      F700292929004263F700A5ADE7004A424A00F7E7C600F7DEBD00F7DEB500F7D6
      AD00F7D6A500EFCE9C00B58C7B000000000000000000000000000000000031A5
      FF0052BDFF00C6CEDE009C9C9C00AD8C8400E7D6BD00FFFFD600FFFFDE00FFFF
      D600EFDEC6000000000000000000000000000000000000000000000000007B7B
      8400D68C6300EFC69400F7D6A500FFF7DE00F7EFDE00EFAD7300EFD6AD00F7E7
      D600FFFFFF00FFFFFF001873FF0000000000086B080031C66B0029C6630018BD
      420010B52900FFFFFF00FFFFFF0094DE9C0008B5180008B5180008B5180008B5
      180008B5180008B5180008BD1800005208000000000000000000BD948400FFFF
      FF004242420042423900423939001842D600738CEF00F7E7C600F7DEC600F7DE
      B500F7D6B500EFCEA500B58C7B00000000000000000000000000000000000000
      000000000000C6ADAD00CEA59400FFE7BD00FFF7CE00FFFFD600FFFFD600FFFF
      DE00FFFFE700FFFFFF00C6A5A5000000000000000000000000001873FF0000D6
      E700F7EFDE00F7EFE700FFFFFF00F7EFE700D67B4A00EFDEB500C6CECE00FFF7
      EF00FFFFFF00FFFFFF00BDFFCE001873FF00087B080042CE7B0031C66B00A5E7
      BD00FFFFFF00FFFFFF00FFFFFF00F7FFF700F7FFF700F7FFF700F7FFF700F7FF
      F700F7FFF70008B5180008BD1800005208000000000000000000C6948400FFFF
      FF00FFFFFF00F7EFEF00F7EFE700DED6D600426BF7009CA5DE00F7E7C600F7DE
      BD00F7DEB500F7D6AD00B58C7B00000000000000000000000000000000000000
      000000000000BD8C8C00EFDEB500F7D6AD00FFF7CE00FFFFD600FFFFDE00FFFF
      EF00FFFFF700FFFFFF00F7EFDE00000000000000000000000000317BDE0000D6
      E700F7EFDE00F7EFDE00FFFFF700DEAD9400D6946B00EFE7CE00F7F7E700C6CE
      CE00C6CECE00FFFFFF0052EF6B00318CFF00088410005AD68C0039C67300F7FF
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0008B5180008B51800006308000000000000000000CE9C8C00FFFF
      FF0084848400848484008484840084848400FFEFE700FFEFD600FFE7D600F7E7
      C600F7DEC600DEC6A500A5847B00000000000000000000000000000000000000
      000000000000E7CEAD00FFEFBD00F7CE9C00FFEFC600E7D6C600E7D6C600E7D6
      C600E7D6C600FFFFDE00FFFFDE00C6949400000000001873FF0010CE2900FFFF
      F700EFDEC600FFFFF700FFFFFF00DE946B00EFBD8400EFE7C600F7E7CE00FFFF
      FF00FFFFFF0073B5FF001873FF0000000000088C100084DEAD0073D69C0039C6
      6B0073D69C00FFFFFF00FFFFFF0052CE7B0021BD520029BD4A0029BD4A0021BD
      4A0021BD4A0010B5290008BD1800005208000000000000000000CEA58C00FFFF
      FF0008080800ADB5B500848CAD0042424200FFF7EF00FFEFDE00FFEFD600F7E7
      CE00EFDEC600B5AD94009C847B00000000000000000000000000000000000000
      000000000000EFD6B500FFE7B500F7C68C00F7DEB500B55A1800B55A1800B55A
      1800B55A1800FFFFDE00FFFFDE00BD9C8C00000000003194AD0029B52900F7EF
      E700EFE7CE00FFFFF700FFFFFF00D69C6B00EFC69400C6CECE00C6CECE00FFFF
      FF00FFFFFF002994FF00318CFF00000000000000000084DEAD009CE7B50029C6
      630039C66B00EFFFEF00FFFFFF00DEF7E7005ACE840021BD4A0021BD4A0021BD
      4A0018BD420010B5210008BD1800000000000000000000000000D6A58C00FFFF
      FF00292929003163FF00849CFF004A4A5200FFFFF700FFF7EF00EFDED600AD84
      7300AD7B7300AD7B7300AD847300000000000000000000000000000000000000
      000000000000E7CEAD00FFEFBD00EFBD8400F7C69400FFEFC600FFFFD600FFFF
      D600FFFFD600FFFFD600FFFFDE00C6949400000000001894C600D6D6A500CEDE
      FF001873FF00318CFF0000000000318CFF001873FF00FFFFFF00FFFFFF00C6CE
      CE00FFFFFF00318CFF0000000000000000000000000029B54A00ADEFC6007BD6
      9C0039C66B0031C66B005ACE8400FFFFFF00FFFFFF0021BD520021BD520018BD
      420018BD390010BD3100088C1800000000000000000000000000DEAD8C00FFFF
      FF0018181800D6D6EF00FFFFFF00314AC600FFFFFF00FFFFF700E7CEC600E7B5
      8400E7AD6B00EFA53900BD848400000000000000000000000000000000000000
      000000000000D6ADA500FFEFBD00F7DEAD00F7CE9C00F7D6A500F7E7BD00FFFF
      D600FFFFD600FFFFD600FFFFD60000000000000000001873FF004A7BEF00318C
      FF0000000000000000000000000000000000318CFF00ADC6FF00FFFFFF00FFFF
      FF00B5DEFF000000000000000000000000000000000039B54A0063CE8400C6EF
      D60073D69C0029C6630031C66B00C6EFD600E7F7EF0021BD5A0021BD5A0021BD
      4A0018BD420018BD3100085A0800000000000000000000000000DEAD8C00FFFF
      FF00F7F7F700EFEFEF00EFEFEF00CED6EF00315AFF00C6CEFF00E7D6D600EFC6
      8C00F7BD6B000000000000000000000000000000000000000000000000000000
      00000000000000000000C69C8C00FFFFFF00FFFFFF00F7C69400EFBD8400F7C6
      9400F7D6AD00FFEFC600BD9C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000318CFF003984
      FF0039A5FF0000000000000000000000000000000000000000000000000084DE
      AD00CEF7DE00B5EFCE008CDEAD0052CE84004ACE7B0052CE840052CE840039C6
      6B0029C65A000000000000000000000000000000000000000000DEAD8C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFFF00426BFF00EFDEDE00F7C6
      8C00BD8484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFEFE700FFFFEF00FFE7B500F7DEAD00FFE7
      B500FFEFBD00C69C940000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000318C
      FF000000000000000000000000000000000000000000000000000000000031B5
      42006BD68C00C6EFDE00CEF7DE00ADEFC600A5E7BD008CDEAD0073D69C0039BD
      6300108421000000000000000000000000000000000000000000DEAD8400DEA5
      8400DEA58400D6A58400D69C7B00CE947B00C6947B00BD8C7300B58473000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C69C8C00CEA59C00C69C
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000031B5420029B54A0039BD5A0039BD630021A54200108421000000
      0000000000000000000000000000000000000000000000000000AD7B7B00B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      000000000000A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B730000000000000000000000000000000000A57B
      7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B73008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD738400F7E7
      C600F7DEC600F7D6B500F7D6AD00EFCEA500EFCE9C00EFCE9400EFCE9400EFCE
      9400EFCE9400EFCE9400B5848400000000000000000000000000299CDE00ADE7
      F700ADE7F700B5ADAD00F7E7DE00F7E7DE00F7E7D600F7E7D600F7E7D600F7E7
      D600F7E7D600F7E7D600A57B730000000000000000005284B5005284B500A58C
      9C00CEADAD00FFEFD600FFE7CE00FFE7CE00FFE7C600FFDEBD00FFDEB500FFDE
      B500FFD6AD00FFCEB5008C5A5A00000000008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A0073424200000000000000
      0000000000000000000000000000000000000000000000000000AD738400F7E7
      CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFCE9400EFCE
      9400EFCE9400EFCE9400B58484000000000000000000299CDE00A5E7F7008CEF
      FF008CEFFF00B5ADAD00F7E7DE00F7EFDE00F7E7DE00F7E7D600F7E7D600F7E7
      CE00F7E7CE00F7E7D600A57B73000000000000000000000000005ABDFF006373
      AD00A58C9C00FFEFD600FFEFD600FFE7CE00FFE7CE00FFDEBD00FFDEBD00FFDE
      B500FFDEB500FFCEB5008C5A5A00000000008C5A5A00F7EFD600F7E7CE00F7E7
      CE00F7E7C600F7E7C600F7E7C600F7E7C600F7E7CE0073424200000000000000
      0000000000000000000000000000000000000000000000000000AD738400F7EF
      DE00F7E7D600F7DEC600F7DEC600F7D6B500F7D6AD00EFCEA500EFCE9C00EFCE
      9400EFCE9400EFCE9400B58484000000000000000000299CDE00ADE7F70094EF
      FF008CEFFF00B5ADAD00F7EFE700FFE7CE00FFE7CE00F7E7C600F7DEC600F7DE
      C600F7DEC600F7E7D600A57B7300000000000000000000000000000000005ABD
      FF003984DE00A58C9C00DEBDB500FFEFD600FFE7CE00FFE7CE00FFE7C600FFDE
      BD00FFDEB500FFD6BD008C5A5A00000000008C5A5A00F7EFDE00EFE7D600EFE7
      CE00EFDECE00EFDEC600EFDEC600EFDEC600EFDEC60073424200000000000000
      0000000000000000000000000000000000000000000000000000AD7B8400F7EF
      DE00F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE
      9C00EFCE9400EFCE9400B58484000000000000000000299CDE00ADE7F7009CEF
      FF009CEFFF00B5ADAD00FFEFE700F7EFDE00F7EFDE00F7E7D600F7E7D600F7E7
      CE00F7E7CE00F7EFD600A57B730000000000000000000000000000000000CEBD
      B5005AB5F7006373AD00B5ADAD00DEBDB500C6A59C00CEADA500DEBDAD00FFDE
      BD00FFDEBD00FFD6BD0094635A0000000000A5635A00F7EFE700F7D6B500F7BD
      8400F7BD8400F7BD8400F7BD7B00F7CEAD00EFE7C60073424200000000000000
      0000000000000000000000000000000000000000000000000000B5848400FFF7
      EF00F7EFE700F7E7D600F7E7D600F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE
      A500EFCE9C00EFCE9400B58484000000000000000000299CDE00BDEFF700ADF7
      FF00ADF7FF00C6B5B500FFF7EF00FFF7F700FFF7EF00F7F7EF00F7EFE700F7EF
      E700F7EFE700F7EFDE00A57B730000000000000000000000000000000000F7F7
      EF00FFF7EF00E7D6D600BD948C00FFFFCE00FFFFCE00FFFFE700FFFFEF00C69C
      9400F7D6BD00FFD6C6009463630000000000A5635A00FFF7EF00F7EFDE00F7E7
      D600F7E7CE00F7DECE00EFDEC600E7D6BD00E7DEC6007B4A4A00000000000000
      0000000000000000000000000000000000000000000000000000BD848400FFF7
      EF00F7EFE700F7EFDE00F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6
      AD00EFCEA500EFCE9400B58484000000000000000000299CDE00BDEFF700B5F7
      FF00B5F7FF00C6BDB500FFF7F700FFE7C600FFDEBD00FFDEBD00FFDEBD00FFDE
      BD00FFDEBD00FFEFE700A57B730000000000000000000000000000000000F7F7
      EF00FFF7EF00D6B5B500E7C6A500FFF7BD00FFFFD600FFFFF700FFFFFF00E7D6
      C600CEA59C00FFD6C6009C6B630000000000A5736B00FFF7EF00F7D6AD00EFB5
      7300EFB57300F7B57300EFB57300D6B59400CEC6B5007B4A4A00000000000000
      0000000000000000000000000000000000000000000000000000C68C8C00FFFF
      FF00FFF7F700F7EFE700F7EFE700F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6
      B500F7D6AD00EFCEA500B58484000000000000000000299CDE00C6EFF700CEF7
      FF00C6F7FF00D6C6B500FFFFF700FFFFFF00FFFFFF00FFFFF700FFF7F700FFF7
      F700FFF7EF00DEDED600A57B730000000000000000000000000000000000FFF7
      F700FFFFF700CEA59C00FFFFCE00FFEFB500FFFFCE00FFFFE700FFFFEF00FFFF
      DE00BD9C9400FFD6C600A5736B0000000000BD846B00F7F7F700E7D6C600B5A5
      8C00BDAD9C00D6BDA500B5A594007B7363007B736B006B424200000000000000
      0000000000000000000000000000000000000000000000000000C68C8C00FFFF
      FF00FFFFFF00FFF7EF00F7EFE700F7EFDE00F7E7D600F7E7CE00F7DEC600F7DE
      BD00F7D6B500EFCEA500B58484000000000000000000299CDE00CEEFF700D6F7
      FF00CEF7FF00D6C6B500FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7F700F7EF
      EF00E7DED600C6BDBD00A57B730000000000000000000000000000000000FFFF
      FF00FFFFFF00CEAD9C00F7EFC600FFEFBD00FFFFCE00FFFFD600FFFFDE00F7EF
      CE00C69C9400FFD6CE00A5736B0000000000BD846B00F7F7F7005A73A500946B
      4A00946B4A00A57B52008C6B4200314273003939520052313100000000000000
      0000000000000000000000000000000000000000000000000000CE948C00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700F7EFE700F7EFE700F7E7D600F7E7CE00F7DE
      C600F7DEBD00DEC6A500A57B84000000000000000000299CDE00CEEFF700E7FF
      FF00E7FFFF00E7CEBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6B5
      AD00E7B58400F78C63000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00E7D6D600D6BDAD00FFFFFF00FFE7B500FFDEAD00FFEFB500D6AD
      9400E7C6BD00FFCEC600AD7B6B0000000000D6946B00FFFFFF0042528400849C
      B50084848C00395284006BC6E7005AA5D600428CC60031293900000000007373
      7300393939004239390021212100423939000000000000000000CE948C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00F7EFE700F7EFDE00F7E7D600F7E7
      CE00EFD6BD00B5AD94009C7B84000000000000000000299CDE00CEEFF700EFFF
      FF00EFFFFF00E7CEBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6BD
      B500EFB57B00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00D6B5B500EFE7DE00F7F7D600F7EFBD00EFDEB500CEA5
      9C00FFD6CE00FFBDB500AD7B730000000000DE9C7300FFFFFF009C9CB500BDEF
      F7008CB5CE0073D6EF0039528400395284005294D60018184200181842007373
      7300ADADAD004239390039313100423939000000000000000000D69C9400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7E700EFDED600AD84
      7300AD7B7300AD7B7300AD7B73000000000000000000299CDE00D6EFF700FFFF
      FF00F7FFFF00EFE7DE00E7DED600DEDED600DEDED600CED6D600CED6D600CED6
      D600ADE7F700000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7DEDE00F7E7DE00FFFFF700B584
      7300B5847300B5847300B584730000000000E7AD7B00FFFFFF00FFFFFF00A5A5
      BD0052638C004A6B9C00395284003952840052B5EF004294E7003184DE007373
      7300B5BDBD0042393900524A4A00524A4A000000000000000000DEA59400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00E7CEC600E7B5
      8400E7AD6B00EFA53900B58484000000000000000000299CDE00D6EFF700FFFF
      FF00BDE7EF00B5E7EF00B5E7EF00ADE7EF00ADE7EF00ADE7EF00ADE7F700DEFF
      FF00B5EFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700EFB5
      8C00FFAD3900CE946B00CE9C840000000000E7AD7B00FFFFFF00FFFFFF00FFFF
      FF00ADADBD007BDEEF004A6B9C0063BDEF0052B5EF004294E7003184DE007373
      7300EFEFEF00423939005A5A5A005A5A5A000000000000000000DEA59400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00EFC6
      8C00F7BD6B0000000000000000000000000000000000299CDE00D6EFFF00BDA5
      9C00BDADA500E7DED600E7DED600E7DED600E7DED600DED6D600C6B5AD00EFFF
      FF00BDF7FF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700EFCE
      A500DEB58C000000000000000000000000000000000000000000000000000000
      0000000000000000000039528400ADDEF70052B5EF004294E7003184DE007373
      7300EFEFEF004239390073737300737373000000000000000000DEA59400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6D600EFC6
      8C00B58484000000000000000000000000000000000000000000299CDE00E7DE
      DE00A5948C00F7EFEF00FFFFFF00FFFFFF00FFFFFF00CEC6BD00A5948C00C6F7
      FF00299CDE00000000000000000000000000000000000000000000000000FFF7
      E700FFEFE700F7EFDE00F7E7DE00EFDED600EFDED600E7D6CE00DED6CE00DEAD
      8C00DEAD8C000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A7BAD004A84BD004273B50039528C007373
      7300737373004239390073737300636363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C948C009C948C009C948C009C948C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD7B7B00B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000AD7B7B00B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B584840000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B00007B7B
      7B00000000000000000000000000000000000000000000000000AD7B7B00F7E7
      CE00F7DEC600F7DEB500F7D6B500F7D6A500F7CE9C00EFCE9400EFCE9400EFCE
      9400EFCE9400EFCE9400B58C7B00000000000000000000000000AD738400F7E7
      C600F7DEC600F7D6B500F7D6AD00EFCEA500EFCE9C00EFCE9400EFCE9400EFCE
      9400EFCE9400EFCE9400B584840000000000000000000000000000FFFF0000FF
      FF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00FFFF00007B7B
      0000000000000000000000000000000000000000000000000000AD7B7B00FFE7
      CE00F7E7CE00F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400EFCE9400B58C7B00000000000000000000000000AD738400F7E7
      CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFCE9400EFCE
      9400EFCE9400EFCE9400B584840000000000000000000000000000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00FFFF00007B7B
      00007B7B00000000000000000000000000000000000000000000AD7B7B00FFEF
      DE00FFE7D600F7E7C600F7DEC600F7DEB500F7D6B500F7D6A500F7CEA500EFCE
      9400EFCE9400EFCE9400B58C7B00000000000000000000000000AD738400DEDE
      DE009C9C9C009C9C9C009C9C9C005A524A00A5947B009C9C9C009C9C9C009C9C
      9C009C9C9C00EFCE9400B584840000000000000000000000000000FFFF0000FF
      FF0000FFFF00000000000000000000FFFF0000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00FFFF00007B7B
      00007B7B000000000000000000007B7B7B000000000000000000AD847B00FFEF
      E700FFEFDE009CA5DE00526BEF00F7DEBD00F7DEB500526BE7009C9CC600EFCE
      9C00EFCE9400EFCE9400B58C7B00000000000000000000000000AD7B8400F7EF
      DE00F7E7D600F7E7CE00F7DEC600313939005263630094846300C6AD8400EFCE
      9C00EFCE9400EFCE9400B584840000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF000000000000FFFF00000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00007B7B7B007B7B7B0000FFFF0000FFFF0000FFFF00007B7B00FFFF00007B7B
      00007B7B00007B7B7B0000000000000000000000000000000000B58C7B00FFF7
      EF00FFEFE700CEC6DE000839FF00526BEF00526BEF000839FF00C6BDBD00F7D6
      A500F7CE9C00EFCE9400B58C7B00000000000000000000000000B5848400DEDE
      DE009C9C9C009C9C9C009C9C9C0052737B00297B9C00D67318008C5A5200C6AD
      84009C9C9C00EFCE9400B584840000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000007B7B000000FFFF0000FFFF0000FFFF00007B7B00FFFF00007B7B
      00007B7B00007B7B7B0000000000000000000000000000000000B58C8400FFFF
      F700FFF7EF00FFEFDE00CEC6DE000031FF000031FF00C6BDCE00F7DEB500F7D6
      AD00F7D6A500EFCE9C00B58C7B00000000000000000000000000BD848400FFF7
      EF00F7EFE700F7EFDE00F7E7D600F7E7CE007B737B00FFB56300D67318009484
      6300C6AD8400EFCE9400B5848400000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000000000000000000000000000000000007B7B7B007B7B
      7B007B7B00007B7B0000007B7B0000FFFF0000FFFF00007B7B007B7B00007B7B
      00007B7B00007B7B7B0000000000000000000000000000000000BD948400FFFF
      FF00FFFFF700FFF7EF005273F7000839FF000839FF00526BEF00F7DEC600F7DE
      B500F7D6B500EFCEA500B58C7B00000000000000000000000000C68C8C00DEDE
      DE009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C00FFD6AD00FFC68400D673
      18008C5A5200C6AD8400B5848400000000000000000000000000FFFF0000FFFF
      000000000000FFFF0000BDBDBD0000000000000000000000000000000000FFFF
      0000FFFF0000FFFF00000000000000000000000000007B7B7B007B7B7B007B7B
      7B007B7B0000FFFF00007B7B0000007B7B0000FFFF00007B7B007B7B00007B7B
      7B007B7B00007B7B7B0000000000000000000000000000000000C6948400FFFF
      FF00FFFFFF004263FF000031FF00CECEE700CEC6DE000031FF00395AEF00F7DE
      BD00F7DEB500F7D6AD00B58C7B00000000000000000000000000C68C8C00FFFF
      FF00FFFFFF00FFF7EF00F7EFE700F7EFDE00F7E7D600AD7B7300FFD6AD00FFB5
      6300D673180094846300B5848400000000000000000000000000FFFF0000FFFF
      0000FFFF000000000000BDBDBD000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000007B7B7B00FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF00007B7B0000007B7B00007B7B00FFFF00007B7B
      00007B7B00007B7B7B0000000000000000000000000000000000CE9C8C00FFFF
      FF00FFFFFF00CED6FF00CED6F700FFF7EF00FFEFE700CEC6DE00C6C6DE00F7E7
      C600F7DEC600DEC6A500A5847B00000000000000000000000000CE948C00DEDE
      DE009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C00FFCE
      9400BD8484004ABDFF000863A500000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000007B7B7B00FFFF0000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFF0000FFFF0000007B7B00007B7B00FFFF00007B7B
      00007B7B00007B7B7B0000000000000000000000000000000000CEA58C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00FFEFDE00FFEFD600F7E7
      CE00EFDEC600B5AD94009C847B00000000000000000000000000CE948C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00F7EFE700F7EFDE00F7E7D600AD7B
      7300299CEF00299CEF000018AD00000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF00000000000000000000000000007B7B7B007B7B7B007B7B
      7B007B7B0000FFFF00007B7B0000007B7B0000FFFF00007B7B00FFFF00007B7B
      00007B7B00007B7B7B0000000000000000000000000000000000D6A58C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00EFDED600AD84
      7300AD7B7300AD7B7300AD847300000000000000000000000000D69C9400DEDE
      DE009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C00EFDED600AD84
      7300AD7B73006B8CFF00106BFF00000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      00007B7B0000FFFF0000007B7B0000FFFF0000FFFF00007B7B00FFFF00007B7B
      00007B7B00007B7B7B0000000000000000000000000000000000DEAD8C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700E7CEC600E7B5
      8400E7AD6B00EFA53900BD848400000000000000000000000000DEA59400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00E7CEC600E7B5
      8400E7AD6B000018C6000018C600000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF007B7B0000FFFF
      00007B7B00007B7B7B0000000000000000000000000000000000DEAD8C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6D600EFC6
      8C00F7BD6B000000000000000000000000000000000000000000DEA59400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00EFC6
      8C00F7BD6B000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000000000007B7B7B0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF007B7B
      00007B7B00007B7B7B0000000000000000000000000000000000DEAD8C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFDEDE00F7C6
      8C00BD8484000000000000000000000000000000000000000000DEA59400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6D600EFC6
      8C00B58484000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000314A6300AD7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C3908008C3908008C39
      08008439080084390000843100007B3100007331000073310000632900005A21
      00005A2100005A2100004A21000042180000000000000000000000000000316B
      4200316B4200316B4200296342002963420029634200215A3900215A3900215A
      3900185231001852310018523100184A29000000000000000000000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005284B500086BE700315A8C00BD7B
      7B00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B55A3100AD8C8400C6B5AD00BDAD
      A500BDADA500BDADA500BDA59C00B5A59C00B5A59C00B5A59C00AD9C9400B59C
      9400AD9C9400B59C94008C736B0052210000000000006BA57B0063A5730063A5
      73005A9C73005A9C73005A946B005A946B004A945A004A945A004A945A00398C
      5200398C5200318C4A00318C4A00184A29000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000031A5FF0031A5FF00106BE700315A
      8C00B57B7B000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5633100D6BDB500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7F700FFEFEF00FFEF
      EF00FFEFEF00FFF7EF00B59C94005A210000427B52006BA57B00EFF7EF00EFF7
      EF00E7F7E700E7EFE700E7EFE700DEEFDE00DEEFDE00DEEFDE00DEEFDE00DEEF
      DE00DEE7DE00DEE7DE00318C4A00184A29000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000031A5FF00319CFF00086B
      DE00315A8C00BD7B7B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5633900D6BDB500FFFFFF00E7DE
      D600E7DED600E7D6CE00FFFFFF00F7EFE700DED6CE00DECEC600FFEFEF00F7EF
      E700F7E7E700FFEFEF00AD9C94005A210000427B520073AD8400EFF7EF00EFF7
      EF00EFF7EF00E7F7E700E7EFE700E7EFE700DEEFDE00DEEFDE00DEEFDE00DEEF
      DE00DEEFDE00DEE7DE00398C5200185231000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000031A5FF00319C
      FF00086BDE0031638C00A57B7B00000000000000000000000000000000000000
      000000000000000000000000000000000000B56B3900D6BDB500FFFFFF008C42
      29009452310084391000FFFFFF00DEC6B500633110005A310800E7D6D600FFF7
      EF00F7EFE700FFEFEF00AD9C94005A21000042845A0073AD8400EFF7EF00EFF7
      EF00EFF7EF00EFF7EF00EFF7EF00E7EFE70084AD8C0029523100295231002952
      310029523100DEEFDE00398C5200185231000000000000000000000000000000
      0000000000000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      00000000000000000000000000000000000000000000000000000000000039A5
      FF00319CFF00106BCE00424A5A00000000009C6B6300AD8C7B00AD8C7B00AD84
      730000000000000000000000000000000000BD6B4200D6BDB500FFFFFF00A563
      4A00D6846300C6633900F7EFEF00E7CEC600A55229009C4A2100948C7300FFF7
      F700F7EFEF00FFEFEF00AD9C9400632900004A8463007BB58C00F7FFF70052A5
      5A0029523100295231002952310029523100187B18006BB573004A945A004A94
      4A00215A3900DEEFDE004A945A00215A39000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000039ADFF00A5CEE700AD847B00AD847300E7CEB500FFFFDE00FFFFDE00FFFF
      CE00CEB59C00A5736B000000000000000000BD734A00DEC6B500FFFFFF00AD73
      5200E79C8400D67B52008C4A2900C6A59400BD633900BD5A3100733908009C8C
      7300FFF7EF00FFF7F700B59C9C0073310000528C630084BD9400F7FFF700F7F7
      F70052A55A0063B5730052A55A00187B18007BC684004A945A004A944A00215A
      390084AD8C00DEEFDE004A945A00215A39000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6947B00FFEFAD00FFFFCE00FFFFCE00FFFFD600FFFF
      DE00FFFFFF00E7D6D6009C6B630000000000C6735200DEBDB500FFFFFF00AD73
      5A00E7A58C00CE846300B5633900844A3100C6734A00C66331009C522100734A
      2900DED6CE00FFF7F700B5A59C00733100005A946B008CB59400F7FFF700F7FF
      F700F7FFF70052A55A003184310084BD94004A945A004A944A00215A3900639C
      6300639C6300DEEFDE004A945A00215A39000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B58C7B00FFD69400FFF7C600FFFFD600FFFFDE00FFFF
      F700FFFFFF00FFFFFF00B594840000000000CE7B5A00DEC6BD00FFFFFF00C67B
      6300EFB59C00AD735200DE9C8400D6846300CE735200C6633900BD6B4A00AD5A
      29005A421800FFFFFF00B5A59C007B3108005A9C730094C69C00FFFFFF00F7FF
      F700F7FFF7003184310094C69C005AAD630052A55A00316B4200006B0000E7F7
      E700E7EFE700E7EFE7005A946B00296342000000000000000000000000000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C7B00FFDE9400EFB57B00FFEFBD00FFFFD600FFFFDE00FFFF
      F700FFFFF700FFFFE700EFDEBD00A57B7300D6845A00DEC6BD00FFFFFF00CE84
      6B00EFB5A500AD6B5200B57B6300DE9C8400D67B5A00BD6B4200B5846B00BD6B
      420073391000FFFFFF00BDAD9C008439080063A5730094C69C00FFFFFF00FFFF
      FF00429442009CD6A5006BB573005AAD630042844A0052A55A0031843100006B
      0000E7F7E700E7EFE7005A946B00296342000000000000000000000000000000
      00000000000000FFFF000000000000FFFF000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C7B00FFDE9C00EFA56300F7D69C00FFFFCE00FFFFD600FFFF
      DE00FFFFDE00FFFFD600EFE7C600AD7B7300D68C6300DEC6BD00FFFFFF00D694
      7B00EFBDAD00BD846B00FFFFFF00C6947B00D6947300BD6B4A00F7F7F700B584
      7300CE7B5A00ADA58C00B59C9400843908006BA57B009CD6A500FFFFFF004A94
      4A00ADD6B50073BD7B0073BD7B004A945A0052845A006BB56B0052A55A003184
      3100006B0000E7F7E7005A9C7300316B42000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD7B7300FFE7A500F7B57B00EFBD7B00F7DEA500FFFFCE00FFFF
      D600FFFFD600FFFFD600DEC6A500A5736B00DE8C6B00DECEC600F7D6CE00EFB5
      9C00EFC6AD00E7AD9400CEADA500E7D6CE00DEA58C00D68C7300F7E7DE00C684
      6B00D68C7300AD7B5A00A57363008C39080073AD84009CD6A500FFFFFF006BB5
      6B0063AD6B0063AD6B00529C5A00F7FFF700F7FFF70052845A0052845A005284
      5A0052845A00EFF7EF005A9C7300316B42000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CEB59400FFFFDE00F7D6A500EFBD7B00F7C68C00FFE7
      AD00FFF7BD00FFFFCE00A5736B0000000000DE8C6B00E7D6CE00E7AD9400DE94
      7B00D68C7300D68C7300C67B6300FFFFFF00CE734A00CE735200EFCEBD00BD5A
      3100C66B4A00C6633100944A29008C39080073AD8400ADD6B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFF700F7FFF700F7F7F700EFF7
      EF00EFF7EF00EFF7EF0063A57300000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5736B00E7D6D600FFFFEF00F7CE8C00F7B57300F7C6
      8C00FFE7A500C6A58C00A5736B0000000000E78C6B00DECEC600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6B5AD008C3908007BB58C00ADD6B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFF700F7FFF700F7F7
      F700EFF7EF00EFF7EF0063A57300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C6B6300BD948400EFD6A500EFD69C00E7C6
      9400A5736B00A5736B000000000000000000E7947300CEAD9C00DECEC600DECE
      BD00DECEBD00DEC6BD00DEC6BD00DEC6BD00D6C6B500D6C6B500D6BDB500D6BD
      B500D6BDB500D6BDB500AD8C7B008C4208007BB58C00ADD6B500ADD6B5009CD6
      A5009CD6A50094C69C0094C69C0094C69C008CB5940084BD94007BB58C0073AD
      840073AD840073AD84006BA57B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A57B7300AD847300A57B
      6B0000000000000000000000000000000000DE8C6B00E7947300DE946B00DE8C
      6B00DE8C6B00DE8C6B00CE846300D6846300CE7B5A00C6735200C6734A00BD73
      4A00BD6B4200BD6B4200B5633900AD5A310084BD94007BB58C0073AD840073AD
      84006BA57B0063A573005A9C73005A946B00528C63004A8463004A8463004284
      5A00427B5200427B520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      00000000000000000000FFFFFF0000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000FFFF000000000000FFFF000000000000FFFF000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF0000000000BDBDBD00000000000000
      0000FFFFFF0000000000FFFFFF0000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      000000000000000000000000000000000000000000007B7B7B000000FF000000
      FF0000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000FFFF000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000000000000000000000000000000000007B7B7B000000FF00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000FFFFFF000000000000000000FFFFFF000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000000000BDBDBD00FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      FF0000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF00000084000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      FF00000084000000FF0000000000008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B000000000000000000000000007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      FF00000084000000FF0000848400008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B0000000000000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      FF00000084000000FF000084840000848400000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      FF00000084000000FF000084840000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00000000000000
      000000000000FFFFFF00000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B000000000000000000000000007B7B7B000000000000FFFF007B7B7B000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      0000FFFFFF00000000007B7B7B00000000000000000000000000000084000000
      840000008400000084000000840000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B00000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B0000000000000000000000000000848400008484000084
      840000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B00FFFF
      FF00BDBDBD00FFFFFF00BDBDBD00FFFFFF007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000848400008484000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B007B7B7B00FFFFFF00BDBD
      BD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFFFF007B7B7B007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008484000084840000848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00BDBDBD00FFFF
      FF00BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBDBD007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400008484000084840000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00FFFFFF00BDBD
      BD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFFFF007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000848400008484000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00BDBDBD00FFFF
      FF00BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBDBD007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400000000000000000000000000000000007B7B
      7B00000000007B7B7B000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B007B7B7B00FFFFFF00BDBD
      BD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFFFF007B7B7B007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B00000000007B7B7B000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B00FFFF
      FF00BDBDBD00FFFFFF00BDBDBD00FFFFFF007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      00000000000000000000000000007B7B7B000000000000000000000000007B7B
      7B00000000007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B000000000000000000000000007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BDBDBD0000000000BDBDBD00000000007B7B7B000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF0000000000BDBDBD0000000000BDBDBD00000000007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BDBDBD00000000007B7B7B00000000007B7B7B000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF0000000000BDBDBD00000000007B7B7B00000000007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BDBDBD0000000000BDBDBD00000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF007B7B7B007B7B7B00BDBDBD0000000000BDBDBD007B7B7B00000000007B7B
      7B007B7B7B000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BDBDBD00000000007B7B7B00000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000BDBDBD00BDBDBD00000000007B7B7B00BDBDBD00000000007B7B
      7B007B7B7B00000000000000000000000000000000008484840000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF008484840000000000000000000000000000FFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BDBDBD0000000000BDBDBD00000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000BDBDBD00BDBDBD0000000000BDBDBD007B7B7B00000000007B7B
      7B007B7B7B0000000000000000000000000000000000848484000000000000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF0000000000848484000000000000000000000000008484840000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BDBDBD00000000007B7B7B00000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF007B7B7B007B7B7B00BDBDBD00000000007B7B7B00BDBDBD00000000007B7B
      7B007B7B7B00000000000000000000000000000000008484840000FFFF000000
      000000FFFF00C6C6C60000FFFF000000000000FFFF00C6C6C60000FFFF000000
      000000FFFF00848484000000000000000000000000000000000084848400FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BDBDBD0000000000BDBDBD00000000007B7B7B000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF0000000000BDBDBD0000000000BDBDBD00000000007B7B7B007B7B
      7B00000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF000000000000FF
      FF00C6C6C6008484840000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BDBDBD00000000007B7B7B00000000007B7B7B000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF0000000000BDBDBD00000000007B7B7B00000000007B7B7B007B7B
      7B0000000000000000000000000000000000000000008484840000FFFF00C6C6
      C60000FFFF000000000000FFFF00C6C6C60000FFFF000000000000FFFF00C6C6
      C60000FFFF0084848400000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000000000FFFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000000000000000000000000
      00007B7B7B00000000007B7B7B00000000007B7B7B00000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF000000000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF000000000000FF
      FF00C6C6C6008484840000000000000000000000000084848400FFFFFF0000FF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00BDBDBD00BDBDBD00BDBDBD007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B0000000000000000000000000000000000000000008484840000FFFF000000
      000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF000000
      000000FFFF00848484000000000000000000000000000000000084848400FFFF
      FF0000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      840000000000000000000000000000000000000000000000000000000000FFFF
      FF00BDBDBD00BDBDBD00BDBDBD007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000848484000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF0000000000848484000000000000000000000000000000000084848400FFFF
      FF0000FFFF0000FFFF0000000000000000008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B007B7B7B007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000008484
      8400FFFFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B007B7B7B007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000084840000000000000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00000000000000000000000000000000000000
      000000000000000084000000FF000000FF000000FF000000FF000000FF000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000848400000000000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD0000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000084000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000008400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B00BDBDBD0000000000000000000000000000000000000000000000
      00007B7B7B0000000000000000000000000000000000000000000000FF000000
      FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B00BDBD
      BD00BDBDBD00BDBDBD00000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B0000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD0000000000000000007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B0000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD0000000000BDBDBD00000000007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B0000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00BDBDBD000000
      FF00BDBDBD00BDBDBD00000000007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B0000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF00BDBD
      BD00BDBDBD00BDBDBD00000000007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B000000000000000000000000000000000084848400000084000000
      FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF000000FF000000FF0000008400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00000000007B7B7B007B7B7B007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00000000007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000084000000FF000000FF000000FF000000FF000000FF000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00000000007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084008400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840084008400840084008400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840084008400
      8400840084008400840084008400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840084008400
      8400840084008400840084008400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840084008400
      840084008400FFFFFF008484840000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840084008400
      840084008400840084008400840000000000FFFFFF0000000000000000000000
      0000000000008400840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840084008400
      840084008400840084008400840000000000FFFFFF0000000000000000000000
      0000840084008400840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840084008400
      840084008400840084008400840000000000FFFFFF0000000000000000008400
      8400840084008400840084008400840084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840084008400
      840084008400840084008400840000000000FFFFFF0000000000000000000000
      0000840084008400840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840084008400
      840084008400840084000000000000000000FFFFFF0000000000000000000000
      0000000000008400840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840084008400
      84000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000000000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00000000000000000000000000FFFF
      FF00840000008400000084000000840000000000000000000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFF
      FF00840000008400000084000000840000000000000000848400848484000084
      8400848484000084840084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000840000008400
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000084848400008484008484
      8400008484008484840000848400848484000084840084848400008484008484
      8400008484000000000000000000000000000000000000000000840000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      84000000000000FFFF00000000000000000000FFFF0000000000848484000084
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000900200000100010000000000801400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF9FFFE0000000FFF70FFF80000000
      FFE307FF00000000FFC783FF00000000FF8781FF00000000FF1FE10700000000
      F61FE00700000000907FF80100000000807FF80100000000C0FFF80000000000
      807FF80000000000007FF80000000000C1FFF80100010000F7FFFC0100010000
      F7FFFE0300010000FFFFFF8F00030000FFFFFFFFFFFFFFFF8081F800800180FF
      8001F800800180FF8001F800800180FF8001F800800180FF80010000800180FF
      80010000800180FF800100008001FFFF800100008001FFFF800100018001FFFF
      800100018001FFFF800180018001FFFF8001F8018001FFFFC081F801C003FFFF
      FFFFF801FFFFFFFFFFFFFC01FFFFFFFFFFFFFFFFFFFFFFFF8001F00180018001
      8001F001800180018001E001800180018001E00180018001C003E00180018001
      E007800180018001E007800180018001E007800180018001F00F800780018001
      F81F800780018001F81F800780018001F81F800F80018001FC3F800FC003C003
      FE7FC01FFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80018001FFFFC003
      800180010001C003800180010001C003800180010001C003800180010001C003
      800180010001C003800180010001C003800180010001C003800180010001C003
      800180010001C003800180010001C003800180010001C003C003C0030001C003
      FFFFFFFF8001C003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC03FFFFF80018001
      801F80FF80018001801F800180018001801F800180018001E01F800180018001
      E03FC00180018001E07F818380018001E07F808380018001C07F808180018001
      C07F808180018001C07F818180018001C07F818180018001E0FFE383C003C003
      F1FFFFC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81FFF8FE007807FE007
      FF87E0078007E007FF83E007800780010041E007800780010061E00780038001
      0071E0078003000003F8E0078001000001F8E0078001000000F0FFCF80010000
      1061F3CF800380011801F3CF800780011C03F3CF818780019F0FF00FFFDFE007
      FFFFF81FFFFFE007FFFFFC3FFFFFF81FFF9FFFFFFE7FFE7FFC0FFFFFFC3FFC7F
      F8070000FC3FFC7FC0070000FC3F847F80070000FC3F807F80070000FC3FE001
      80070000F81FE00180070000F81F807F80070000F00F847F80070000E007FC7F
      80070000E007FC7F80070000E007E47FC0070000E007E07FE01F0000F00FC007
      F01F0000F81FC007F87FFFFFFE3FE01FFC1FF8FFC001FFFFF007F07FC0018001
      E007F07FC0018001E001E07FC0018001E001C03FC0018001E001841FC0018001
      C001861FC00180018001FF0FC00180010001FF87C00180010001FFC3C0018001
      0001E881C001800100018AB1C00180018001EABBC0018001C003AABFC007C003
      FC07BAAFC007FFFFFF0FFFFFFFFFFFFF9FFFC001FFFFFC1F0FFFC00187FFF007
      07FFC00180FFE00683FFC001801FC00181FFC001801FC001E107C001801FE001
      E007C001801FC001F801C001801F8001F801C001801F0001F800C001800F0001
      F800C00180070001F800C00180030001F801C00180018001FC01C0078011C003
      FE03C007801B8C07FF8FFFFFFFFF9F0FFFFFFFFFFFFF9FFFBFFDFFFF80030FFF
      FFFFFE7FC00707FFE007F01F800183FFE0078007000181FFE00700010001E107
      E00700000001E003E00780000001F801E007E0000001F801E007FE010001F800
      E007FE030001F800E007E01F0001F000E007803F0001F801FFFF81FF0001FC01
      BFFDFFFF0001FE03FFFFFFFF8001FF8FC001FFFFFFFFFFFFC0018001801FF801
      C0018001001FF801C00180010007F801C00180010007F801C001800100018001
      C001800100018001C001800100018001C001800100018001C001800100018001
      C001800100018001C0018001C001807FC0018001C001807FC0078001C001807F
      C0078001F00180FFFFFFFFFFF001FFFFFFFFC001F83FFFFFF003C001E007F1FF
      E001C001E007E1FF8001C001C001C1FF8001C001C001C2008001C00180018600
      8001C00180018E008001C00180011FC0C001C00180011F80E006C00180011F00
      F01EC00180010E08F029C00180018018F039C00180018038F029C007FF01E0F9
      E061C007FF81FFFFE07EC01FFFF1FFFFFFFFFFFFE001FFFFFFFFFE7F8001F003
      F01FFC3FC001E001C007FC3FE00180018007FC3FE00180018003FC3FE0018001
      8003C001E001800180038001E001800180038001E001C0038003C001E001E007
      8003FC3FE001F01FC007FC3FE001F03FE00FFC3FE001F03FFFFFFC3FE007F03F
      FFFFFC3FE007E07FFFFFFFFFFFFFE07FFFFFFFFFC001F80183FF8001C001C001
      807F8001C001800180078001C001800180078001C001800180038001C0018001
      80038001C001800180018001C001800180018001C001800180008001C0018003
      80008001C001800780038001C001800780038001C0018007C3C7C003C0078007
      FE07FFFFC007C007FFFFFFFFFFFFF87FFFFFFFFFC001FFFFFFFF83FFC001C01F
      FFFF807FC001C01FFFFF8007C001C003FFFF8007C001C003FFFF8003C001C003
      C0018003C001C00380018001C001C00780018001C001C007C0018001C001C007
      FFFF8001C001C007FFFF8000C001C00FFFFF8003C001C00FFFFFC381C007C00F
      FFFFFFE7C007E01FFFFFFFFFFFFFFFFFFFFFFFFF80018000F8E3E00700000000
      F041E00700000000E001E00700000000E001E00700000000E003E00700000000
      E007E00700000000C007E00700000000C007E00700000000C007F3CF00000000
      C007F3CF00000000E007F3CF80010000E00FF18FC0070000F81FF81FF00F0000
      F83FF81FF81F0000FFFFFFFFFFFF0000FFFFF8FFF81FF81FFFFFF8F3E007E007
      FFFFF8E1E007E007FFFFF8E180018001C001F8E3800180018001F8C780018001
      8001F887000000008001C007000000008001800F000000008001800F00000000
      800180078001800180018007800180018001800780018001FFFF880FE007E007
      FFFFC01FE007E007FFFFF1FFF81FF81FFC3FF8FFFFFFFFFFE007E00F00008007
      E007E00300008003800180010000800380018001000080038001800100008003
      0000800100008003000080010000800300008001000080030000000100008003
      80018003000080038001C0070000E0038001E00F0000F803E007F07F0000FF87
      E007F8FF0000FFCFFC3FFFFF0001FFFFF81FFFFFFE7FF81FE0078000FC7FE007
      E0078000FC7FC00780018000FC7F800180018000FC7F800180018000FC7F0001
      00008000FC7F000100008000FC7F000100008000FC7F000100008000FC7F0001
      80018000FC7F000180018000E47F800180018000E07F8001E0078001C007C007
      E007FFFFC007E007F81FFFFFF81FF01FFFFFFFFFFFFFFFFFFFF183FFF03FF3E7
      FFE1807FF007E003FFC78007F003FBE78E478007F001FFFF801F80038001CF1F
      801F80038001EF1F801F80018000E021801F80018000E663800F80018007F007
      800F80018007F8478007800F8007F8078007800F8007F80F803FC3FF803FFF1F
      87FFFFFF803FFF9FFFFFFFFFFFFFFFBFFFFFBFFFFFFFBFFFE7FF005F83FF001F
      E7FF000F807F001FE7FF000780070007E7FF000380070003E7FF000180030003
      E7FF000180030001E1FF000180010001E07F000180010001E007000080010000
      E003000080010000E003000780000007E007000780000007E07F801FC38183E7
      E1FF803FFF8183F7FFFFC07FFFE7FFFFF81FF81FFFFFFFFFE007E007E7FFE7FF
      E007E007E7FFE7FF80018001E7FFE7FF80018001E7FFE7FF80018001E7FFE7FF
      00000000E7FFE7FF00000000E1FFE1FF00000000E07FE07F00000000E007E007
      80018001E003E00380018001E003E00380018001E007E007E007E007E07FE07F
      E007E007E1FFE1FFF81FF81FFFFFFFFFC001C001FFFFE7E7C001C001FFFFE3C7
      C001C001FFFFE187C001C0018001E007C001C0018001F00FC001C0018001F81F
      C001C0018001E00FC001C00180018003C001C00180018001C001C00180018001
      C001C0018001FC3FC001C0018001FC3FC001C0018001FC3FC007C001FFFFFE7F
      C007C001FFFFFE7FFFFFFFFFFFFFFE7FFFFFFF9FF81FFC3FFFFFFF0FE007E00F
      FE3FCF07E007E007F807860380018003F803800180018003E001800180010001
      E000800100000001C00180010000000180018001000000018007800300000001
      800780038001000180078007800180038007C00F80018007F00FE01FE007E00F
      F81FE79FE007F01FFFFFFF9FF81FFFFFF801E7CFFFFFFFFFF801C987FF87FFF9
      F801D937C0019FF9F801CD67800187E78001E1278000C7C78001F01FC000F11F
      8001F83FC000F81F8001F83FC000FC7F8001F83FC000F83F8001F91FC000F19F
      8001F11FC001E18F8007E38FC001C7E7801FE38FC00187FF801FE7EFC0019FFF
      803FE7EFE0019FFF807FFFFFFFFFFFFFE0FFFFFFFF9FFFFF803FFD97FF0FF3E7
      003FF803CF07E0038003F8018603FBE78001F8018001FFFF8000F8018001CF1F
      8000F8018001EF1F800098038001E021800080078001E6638000801F8003F007
      8000001F8003F8478000001F8007F8078000001FC00FF80FE003807FF01FFF1F
      F87F807FFF9FFF9FFFFFF1FFFF9FFFBFFFFFFFFFFE7FFFFFF00783FFC0030000
      E007807FC0030000C00180038001000080018001000000008000800100000000
      80008001800100008000800100000000800080010000000080008001C0030000
      80008001C003000080018001F81F000080018003F81F0000E003C3FFF81F0000
      E007FFFFF81F8001F81FFFFFF81FFFFFFFFFF8FFFFFFFFFF80FFE007C00FE1FF
      801FE003C007E07F8001C003C007C0078001C003C007C0078001C003C007C007
      8001C003C007C0078001C003C007C0078001C003C007C0078001C007C007C007
      8001C007C007C0078001C007C007C0078001C007C007C007F983C007C007E007
      F81FC007C007F80FFFFFFFFFE007FFFFC0019FFFFFFFF81FC0010FFFFFFFE007
      C00107FFFFFFE007C00183FFF80F8001C00181FFF0078001C001E107E0018001
      C001E007E0010000C001F801C0000000C001F801C0000000C001F80080010000
      C001F80080018001C001F80082038001C001F8018F078001C007FC01FFC7E007
      C007FE03FFEFE007C01FFF8FFFFFF81FC001F801E001FFFFC001C0018001003F
      C0018001C001003FC0018001E001003FC0018001E001003FC0018001E001003F
      C0018001E001003FC0018001E001003FC0018001E001003FC0018003E0010020
      C0018007E0010000C0018007E0010000C0018007E0010000C0078007E007FC00
      C007C007E007FE00FFFFF87FFFFFFFFFC003F3FFC001C001C003FF8FC001C001
      C003FF8FC001C001C003FF87C001C001C0030380C001C001C003F003C001C001
      C003F003C001C001C003C003C001C001C0038003C001C001C0030003C001C001
      C0030003C001C001C0038003C001C001C003F003C001C001C003F003C007C007
      C003F803C007C007C003FC07FFFFFFFFE00F9FFF8000E000E00F0FFF00008000
      E00F07FF00000000F00F83FF00000000F00FC1FF00000000F80FE10F00000000
      F007F00300000000F007FC0100000000F007FC0100000000F00FF80000000000
      F01FF80000000000F81FF80000000000FE1FFC0100000001FF1FFC0100000001
      FF1FFE0300000001FFBFFF8F00000003FFFFFFFFFC00FDFFFFFFFC00FC00F8FF
      F9FFFC002000F8FFF0FFFC000000F87FF0FFFC000000F81FE07FEC000000F80F
      C07FE4000000F00F843FE0000000E00F1E3F00000000E00FFE1F00010000E00F
      FF1F0003E000F01FFF8F0007F800F00FFFC7000FF000F00FFFE3E3FFE001F007
      FFF8E7FFC403F007FFFFEFFFEC07F007F862FFFFFFFFFFFD80E0FFFFF83FFFF8
      01E0C007F39FFFF101E0C007F7DFFFE331E1C007F55FFFC731C1C007F55FE08F
      C181C007F55FC01FC307C007F55F803FFE17C007F55F001FCC37C007F55F001F
      A877C007F55F001F40F7C007F55F001F01E3C00FFDDF001FC1E3C01FFDDF803F
      C0E3C03FFE3FC07FC83FFFFFFFFFE0FFFFFFE00FE00FFFFFE001E00FE00FFFFF
      E001E00FC007FFFFE001E00FC007C001E001E00F800380018001E00F80028001
      8001E00F000180018001A00B80038001C001C007C00780010001E00FC0078001
      0001E00FC00780018003C007C0078001C007C007C0078001C00FC007F83F8003
      E07FF83FF83FFFFFF03FF83FFFFFFFFFFFFFFFFFC380F80FFFFFFFFFC300F007
      FFFFFFFFC201E003FFFFFFFFC003C001FC7FFFFFC0038000FC7FFFFFC0038000
      FC7FFFFF00038000E00FE00700038000E00FE00700038000E00FE00700038000
      FC7FFFFF00038000FC7FFFFF0007C001FC7FFFFF000FE003FFFFFFFF003FF007
      FFFFFFFF80FFF80FFFFFFFFFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FF
      FFFFFFFF8FFFE0FFC007C0078C0380FFFFFFFFFF8FFF803FF83FF807FFFF803F
      FFFFFFFFFFFF803FC007C0078FFF803BFFFFFFFF8C038033F01FF8078FFF8020
      FFFFFFFFFFFF8033C007C007FFFF803BFFFFFFFF8FFF803FF83FF8078C03803F
      FFFFFFFF8FFF803FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFE00FFFFFFFFFFFFFFFFFC007F00F81FFF83FFFFFF8C7E3FFF39FC03F
      F8C7F1FFF39FFFFFF8C7F8FFF39FC007F80FFC7FF39FFFFFF8C7FE3FF39FC03F
      F8C7FF1FF39FFFFFF8C7FF8FF39FC007F00FFF03E10FFFFFFFFFFFFFFFFFC03F
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FFFFFFFC00
      FFFFF6CFFE008000FFFFF6B7FE000000FFFFF6B7FE000000FFF7F8B780000000
      C1F7FE8F80000001C3FBFE3F80000003C7FBFF7F80000003CBFBFE3F80010003
      DCF7FEBF80030003FF0FFC9F80070FC3FFFFFDDF807F0003FFFFFDDF80FF8007
      FFFFFDDF81FFF87FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC001C007
      C007001F8031BFEBC007000F80310005C007000780317E31C007000380017E35
      C007000180010006C007000080017FEAC007001F8FF18014C007001F8FF1C00A
      C007001F8FF1E001C0078FF18FF1E007C00FFFF98FF1F007C01FFF758FF5F003
      C03FFF8F8001F803FFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object sdsConfig: TSQLDataSet
    SQLConnection = SQLConexao
    CommandText = 'select * from config'
    Params = <>
    Left = 344
    Top = 16
    object sdsConfigEMP_ID: TIntegerField
      FieldName = 'EMP_ID'
      Required = True
    end
    object sdsConfigNOMEEMP: TStringField
      FieldName = 'NOMEEMP'
      Size = 120
    end
    object sdsConfigCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object sdsConfigDOC_TIPOINSCRICAO: TStringField
      FieldName = 'DOC_TIPOINSCRICAO'
      Size = 40
    end
    object sdsConfigDOC_NUMINSCRICAO: TStringField
      FieldName = 'DOC_NUMINSCRICAO'
      Size = 30
    end
    object sdsConfigENDER_LOGRADOURO: TStringField
      FieldName = 'ENDER_LOGRADOURO'
      Size = 60
    end
    object sdsConfigENDER_NUMERO: TStringField
      FieldName = 'ENDER_NUMERO'
      Size = 10
    end
    object sdsConfigENDER_COMPLEMENTO: TStringField
      FieldName = 'ENDER_COMPLEMENTO'
      Size = 40
    end
    object sdsConfigENDER_BAIRRO: TStringField
      FieldName = 'ENDER_BAIRRO'
      Size = 40
    end
    object sdsConfigCIDADE_ID: TIntegerField
      FieldName = 'CIDADE_ID'
      Required = True
    end
    object sdsConfigENDER_CEP: TStringField
      FieldName = 'ENDER_CEP'
      Size = 8
    end
    object sdsConfigTEL1: TStringField
      FieldName = 'TEL1'
    end
    object sdsConfigTEL2: TStringField
      FieldName = 'TEL2'
    end
    object sdsConfigCEL: TStringField
      FieldName = 'CEL'
    end
    object sdsConfigFAX: TStringField
      FieldName = 'FAX'
    end
    object sdsConfigSITE: TStringField
      FieldName = 'SITE'
      Size = 100
    end
    object sdsConfigEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object sdsConfigREGIAO: TStringField
      FieldName = 'REGIAO'
    end
    object sdsConfigMULTA_PERC: TFMTBCDField
      FieldName = 'MULTA_PERC'
      Precision = 15
      Size = 2
    end
    object sdsConfigJUROS_PERC: TFMTBCDField
      FieldName = 'JUROS_PERC'
      Precision = 15
      Size = 2
    end
    object sdsConfigCAMINHOPDFSEMAIL: TStringField
      FieldName = 'CAMINHOPDFSEMAIL'
      Size = 200
    end
    object sdsConfigNOMEINICIALARQPDF: TStringField
      FieldName = 'NOMEINICIALARQPDF'
    end
    object sdsConfigLIMITEEMAILHORA: TIntegerField
      FieldName = 'LIMITEEMAILHORA'
    end
    object sdsConfigNOTIF_TEXTO1: TMemoField
      FieldName = 'NOTIF_TEXTO1'
      BlobType = ftMemo
    end
    object sdsConfigNOTIF_TEXTO2: TMemoField
      FieldName = 'NOTIF_TEXTO2'
      BlobType = ftMemo
    end
    object sdsConfigPERCENTREPASSE: TFMTBCDField
      FieldName = 'PERCENTREPASSE'
      Precision = 18
      Size = 2
    end
    object sdsConfigTEXTO1_CONFISSAO_PJ: TMemoField
      FieldName = 'TEXTO1_CONFISSAO_PJ'
      BlobType = ftMemo
    end
    object sdsConfigTEXTO1_CONFISSAO_PF: TMemoField
      FieldName = 'TEXTO1_CONFISSAO_PF'
      BlobType = ftMemo
    end
    object sdsConfigTEXTO2_CONFISSAO_PF: TMemoField
      FieldName = 'TEXTO2_CONFISSAO_PF'
      BlobType = ftMemo
    end
    object sdsConfigTEXTO2_CONFISSAO_PJ: TMemoField
      FieldName = 'TEXTO2_CONFISSAO_PJ'
      BlobType = ftMemo
    end
    object sdsConfigNOTIF_TEXTO_PF_1: TMemoField
      FieldName = 'NOTIF_TEXTO_PF_1'
      BlobType = ftMemo
    end
    object sdsConfigNOTIF_TEXTO_PF_2: TMemoField
      FieldName = 'NOTIF_TEXTO_PF_2'
      BlobType = ftMemo
    end
    object sdsConfigCAMINHONOTIFIC: TStringField
      FieldName = 'CAMINHONOTIFIC'
      Size = 200
    end
    object sdsConfigCOBRREGISTRADA: TIntegerField
      FieldName = 'COBRREGISTRADA'
    end
    object sdsConfigCAMINHOREMESSA: TStringField
      FieldName = 'CAMINHOREMESSA'
      Size = 200
    end
    object sdsConfigARQSREMESSA: TStringField
      FieldName = 'ARQSREMESSA'
      Size = 300
    end
  end
  object SdsGeraGen: TSQLQuery
    NoMetadata = True
    SQLConnection = SQLConexao
    Params = <>
    Left = 360
    Top = 168
  end
  object SQLQuery1: TSQLQuery
    NoMetadata = True
    SQLConnection = SQLConexao
    Params = <>
    Left = 264
    Top = 24
  end
  object SdsExecSql: TSQLDataSet
    MaxBlobSize = 0
    Params = <>
    Left = 384
    Top = 200
  end
end
