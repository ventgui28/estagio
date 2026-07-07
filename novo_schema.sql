
Table "Anexo" {
  "Id" integer [increment]
  "sadasdasdasdasd" "character varying(255)" [not null]
  "NomeOriginal" "character varying(100)" [not null]
  "ContentType" "character varying(50)" [not null]
  "TamanhoBytes" bigint [not null]
  "RelacionadoTipo" "character varying(50)" [not null]
  "RelacionadoId" integer [not null]
  "CriadoPorEmpresa" boolean [not null]
  "CreatedAt" timestamp [not null]
  "UpdatedAt" timestamp
  "IsDeleted" boolean [not null]
  "DeletedBy" integer

  Indexes {
    Id [pk, name: "PK_Anexo"]
    (RelacionadoTipo, RelacionadoId) [name: "IX_Anexo_RelacionadoTipo_RelacionadoId"]
  }
}

Table "AuthEmailQueue" {
  "Id" integer [increment]
  "ClienteId" integer
  "Email" text [not null]
  "Status" integer [not null]
  "Type" integer [not null]
  "Priority" integer [not null]
  "Metadata" text
  "RetryCount" integer [not null]
  "NextRetryAt" timestamp
  "LastError" text
  "CreatedAt" timestamp [not null]
  "UpdatedAt" timestamp
  "IsDeleted" boolean [not null]
  "DeletedBy" integer

  Indexes {
    Id [pk, name: "PK_AuthEmailQueue"]
    NextRetryAt [name: "IX_AuthEmailQueue_NextRetryAt"]
    Status [name: "IX_AuthEmailQueue_Status"]
  }
}

Table "Cargo" {
  "Id" integer [increment]
  "Nome" "character varying(50)" [not null]
  "IsProtegida" boolean [not null]
  "PermissionsJson" text
  "CreatedAt" timestamp [not null]
  "UpdatedAt" timestamp
  "IsDeleted" boolean [not null]
  "DeletedBy" integer

  Indexes {
    Id [pk, name: "PK_Cargo"]
  }
}

Table "Cliente" {
  "Id" integer [increment]
  "Nome" "character varying(200)" [not null]
  "Morada" "character varying(200)"
  "NIF" "character varying(20)"
  "Telefone" "character varying(20)"
  "Localidade" "character varying(100)"
  "CodigoPostal" "character varying(20)"
  "IBAN" "character varying(50)"
  "Email" "character varying(150)"
  "SupabaseUserId" uuid
  "StatusRegistoAuth" integer [not null]
  "Priority" integer [not null]
  "CreatedAt" timestamp [not null]
  "UpdatedAt" timestamp
  "IsDeleted" boolean [not null]
  "DeletedBy" integer

  Indexes {
    Id [pk, name: "PK_Cliente"]
  }
}

Table "CodigoLer" {
  "Id" integer [increment]
  "Codigo" "character varying(20)" [not null]
  "Descricao" "character varying(500)" [not null]
  "CreatedAt" timestamp [not null]
  "UpdatedAt" timestamp
  "IsDeleted" boolean [not null]
  "DeletedBy" integer

  Indexes {
    Id [pk, name: "PK_CodigoLer"]
  }
}



Table "KioskDevice" {
  "Id" integer [increment]
  "DeviceId" uuid [not null]
  "Nome" text [not null]
  "IsAuthorized" boolean [not null]
  "AuthorizedAt" timestamp [not null]
  "LastSeenAt" timestamp [not null]
  "CreatedAt" timestamp [not null]
  "UpdatedAt" timestamp
  "IsDeleted" boolean [not null]
  "DeletedBy" integer

  Indexes {
    Id [pk, name: "PK_KioskDevice"]
    DeviceId [unique, name: "IX_KioskDevice_DeviceId"]
  }
}

Table "KioskPairingCode" {
  "Id" integer [increment]
  "Code" text [not null]
  "DeviceId" uuid [not null]
  "ExpiresAt" timestamp [not null]
  "CreatedAt" timestamp [not null]
  "UpdatedAt" timestamp
  "IsDeleted" boolean [not null]
  "DeletedBy" integer

  Indexes {
    Id [pk, name: "PK_KioskPairingCode"]
    Code [unique, name: "IX_KioskPairingCode_Code"]
    DeviceId [name: "IX_KioskPairingCode_DeviceId"]
  }
}

Table "Log" {
  "Id" integer [increment]
  "Timestamp" timestamp [not null]
  "Level" "character varying(20)" [not null]
  "Message" text [not null]
  "Source" text
  "UserId" integer
  "Operation" text
  "EntityName" text
  "EntityId" text
  "Changes" text
  "StackTrace" text
  "AuthMethod" text

  Indexes {
    Id [pk, name: "PK_Log"]
    EntityId [name: "IX_Log_EntityId"]
    EntityName [name: "IX_Log_EntityName"]
    Level [name: "IX_Log_Level"]
    Operation [name: "IX_Log_Operation"]
    Timestamp [name: "IX_Log_Timestamp"]
    UserId [name: "IX_Log_UserId"]
  }
}

Table "Noticias" {
  "Id" integer [increment]
  "Titulo" "character varying(200)" [not null]
  "Subtitulo" "character varying(500)"
  "Slug" "character varying(200)" [not null]
  "Conteudo" text
  "ImagemUrl" "character varying(500)"
  "Categoria" "character varying(100)"
  "Autor" "character varying(100)"
  "Publicado" boolean [not null]
  "Visualizacoes" integer [not null]
  "Views" integer [not null]
  "SeoTitle" "character varying(200)"
  "SeoDescription" "character varying(500)"
  "CreatedBySupabaseUserId" uuid
  "CreatedAt" timestamp [not null]
  "UpdatedAt" timestamp
  "IsDeleted" boolean [not null]
  "DeletedBy" integer

  Indexes {
    Id [pk, name: "PK_Noticias"]
    Slug [unique, name: "IX_Noticias_Slug"]
  }
}


Table "Utilizador" {
  "Id" integer [increment]
  "Username" "character varying(50)" [not null]
  "PasswordHash" text [not null]
  "Nome" "character varying(100)" [not null]
  "CargoId" integer
  "CreatedAt" timestamp [not null]
  "UpdatedAt" timestamp
  "IsDeleted" boolean [not null]
  "DeletedBy" integer

  Indexes {
    Id [pk, name: "PK_Utilizador"]
    CargoId [name: "IX_Utilizador_CargoId"]
    Username [unique, name: "IX_Utilizador_Username"]
  }
}

Table "PedidoRecolha" {
  "Id" integer [increment]
  "IdCliente" integer
  "ClienteSequenceNumber" integer
  "NomeContacto" "character varying(100)"
  "TelefoneContacto" "character varying(20)"
  "MoradaPedido" "character varying(200)"
  "Email" text
  "IsManual" boolean [not null]
  "Status" integer [not null]
  "Notas" "character varying(500)"
  "CreatedAt" timestamp [not null]
  "UpdatedAt" timestamp
  "IsDeleted" boolean [not null]
  "DeletedBy" integer

  Indexes {
    Id [pk, name: "PK_PedidoRecolha"]
    (IdCliente, ClienteSequenceNumber) [name: "IX_PedidoRecolha_IdCliente_ClienteSequenceNumber"]
  }
}

Table "Recolha" {
  "Id" integer [increment]
  "Data" timestamp [not null]
  "IdCliente" integer
  "IdPedidoRecolha" integer
  "ClienteSequenceNumber" integer
  "Status" integer [not null]
  "Notas" "character varying(500)"
  "NomeContacto" "character varying(100)"
  "TelefoneContacto" "character varying(20)"
  "MoradaPedido" "character varying(200)"
  "Email" text
  "CreatedAt" timestamp [not null]
  "UpdatedAt" timestamp
  "IsDeleted" boolean [not null]
  "DeletedBy" integer

  Indexes {
    Id [pk, name: "PK_Recolha"]
    (Data, IdCliente, IsDeleted) [name: "IX_Recolha_Data_IdCliente_IsDeleted"]
    (IdCliente, ClienteSequenceNumber) [name: "IX_Recolha_IdCliente_ClienteSequenceNumber"]
  }
}

Table "Material" {
  "Id" integer [increment]
  "Nome" "character varying(200)" [not null]
  "IdLerCode" integer
  "PrecoKg" numeric(18,2) [not null]
  "CreatedAt" timestamp [not null]
  "UpdatedAt" timestamp
  "IsDeleted" boolean [not null]
  "DeletedBy" integer

  Indexes {
    Id [pk, name: "PK_Material"]
    IdLerCode [name: "IX_Material_IdLerCode"]
  }
}

Table "RevisoesNoticias" {
  "Id" integer [increment]
  "NoticiaId" integer [not null]
  "Titulo" "character varying(200)"
  "Resumo" "character varying(500)"
  "Conteudo" text
  "Categoria" "character varying(100)"
  "ImagemUrl" "character varying(500)"
  "MetaTitle" "character varying(200)"
  "MetaDescription" "character varying(500)"
  "CreatedAt" timestamp [not null]
  "UpdatedAt" timestamp
  "IsDeleted" boolean [not null]
  "DeletedBy" integer

  Indexes {
    Id [pk, name: "PK_RevisoesNoticias"]
    NoticiaId [name: "IX_RevisoesNoticias_NoticiaId"]
  }
}

Table "ChatMessage" {
  "Id" integer [increment]
  "ClienteId" integer [not null]
  "UtilizadorId" integer
  "IsFromCompany" boolean [not null]
  "Content" "character varying(1000)" [not null]
  "ExpiresAt" timestamp [not null]
  "IsRead" boolean [not null]
  "ReadAt" timestamp
  "CreatedAt" timestamp [not null]
  "UpdatedAt" timestamp
  "IsDeleted" boolean [not null]
  "DeletedBy" integer

  Indexes {
    Id [pk, name: "PK_ChatMessage"]
    (ClienteId, ExpiresAt, IsRead) [name: "IX_ChatMessage_ClienteId_ExpiresAt_IsRead"]
    UtilizadorId [name: "IX_ChatMessage_UtilizadorId"]
  }
}

Table "NotaInterna" {
  "Id" integer [increment]
  "Conteudo" "character varying(2000)" [not null]
  "UtilizadorId" integer [not null]
  "RelacionadoTipo" "character varying(50)" [not null]
  "RelacionadoId" integer [not null]
  "CreatedAt" timestamp [not null]
  "UpdatedAt" timestamp
  "IsDeleted" boolean [not null]
  "DeletedBy" integer

  Indexes {
    Id [pk, name: "PK_NotaInterna"]
    (RelacionadoTipo, RelacionadoId) [name: "IX_NotaInterna_RelacionadoTipo_RelacionadoId"]
    UtilizadorId [name: "IX_NotaInterna_UtilizadorId"]
  }
}

Table "SolicitacaoAlteracaoPerfil" {
  "Id" integer [increment]
  "ClienteId" integer [not null]
  "Nome" "character varying(200)" [not null]
  "Morada" text
  "NIF" "character varying(20)"
  "Telefone" "character varying(20)"
  "Localidade" "character varying(100)"
  "CodigoPostal" "character varying(20)"
  "IBAN" "character varying(50)"
  "Email" "character varying(150)" [not null]
  "Status" integer [not null]
  "MotivoRejeicao" "character varying(500)"
  "ResolvidoPor" integer
  "DataResolucao" timestamp
  "CreatedAt" timestamp [not null]
  "UpdatedAt" timestamp
  "IsDeleted" boolean [not null]
  "DeletedBy" integer

  Indexes {
    Id [pk, name: "PK_SolicitacaoAlteracaoPerfil"]
    ClienteId [name: "IX_SolicitacaoAlteracaoPerfil_ClienteId"]
    ResolvidoPor [name: "IX_SolicitacaoAlteracaoPerfil_ResolvidoPor"]
  }
}

Table "UserKioskDevice" {
  "Id" integer [increment]
  "UserId" integer [not null]
  "KioskDeviceId" integer [not null]
  "CreatedAt" timestamp [not null]
  "UpdatedAt" timestamp
  "IsDeleted" boolean [not null]
  "DeletedBy" integer

  Indexes {
    Id [pk, name: "PK_UserKioskDevice"]
    KioskDeviceId [name: "IX_UserKioskDevice_KioskDeviceId"]
    UserId [name: "IX_UserKioskDevice_UserId"]
  }
}

Table "UserPin" {
  "UserId" integer [not null]
  "PinHash" text [not null]
  "Id" integer [not null]
  "CreatedAt" timestamp [not null]
  "UpdatedAt" timestamp
  "IsDeleted" boolean [not null]
  "DeletedBy" integer

  Indexes {
    UserId [pk, name: "PK_UserPin"]
  }
}


Table "PedidoMaterialPretendido" {
  "MateriaisPretendidosId" integer [not null]
  "PedidoRecolhaId" integer [not null]

  Indexes {
    (MateriaisPretendidosId, PedidoRecolhaId) [pk, name: "PK_PedidoMaterialPretendido"]
    PedidoRecolhaId [name: "IX_PedidoMaterialPretendido_PedidoRecolhaId"]
  }
}

Table "Pesagem" {
  "Id" integer [increment]
  "Data" timestamp [not null]
  "Peso" numeric(18,2) [not null]
  "IdRecolha" integer
  "IdMaterial" integer [not null]
  "IdUtilizador" integer
  "Notas" "character varying(500)"
  "ValorCalculado" numeric(18,2)
  "CreatedAt" timestamp [not null]
  "UpdatedAt" timestamp
  "IsDeleted" boolean [not null]
  "DeletedBy" integer

  Indexes {
    Id [pk, name: "PK_Pesagem"]
    (Data, IdMaterial, IsDeleted) [name: "IX_Pesagem_Data_IdMaterial_IsDeleted"]
    IdMaterial [name: "IX_Pesagem_IdMaterial"]
    IdRecolha [name: "IX_Pesagem_IdRecolha"]
    IdUtilizador [name: "IX_Pesagem_IdUtilizador"]
  }
}

Table "RecolhaMaterialPreSelecionado" {
  "MateriaisPreSelecionadosId" integer [not null]
  "RecolhaId" integer [not null]

  Indexes {
    (MateriaisPreSelecionadosId, RecolhaId) [pk, name: "PK_RecolhaMaterialPreSelecionado"]
    RecolhaId [name: "IX_RecolhaMaterialPreSelecionado_RecolhaId"]
  }
}


Ref "FK_Utilizador_Cargo_CargoId":"Cargo"."Id" < "Utilizador"."CargoId" [delete: restrict]

Ref "FK_PedidoRecolha_Cliente_IdCliente":"Cliente"."Id" < "PedidoRecolha"."IdCliente" [delete: restrict]

Ref "FK_Recolha_Cliente_IdCliente":"Cliente"."Id" < "Recolha"."IdCliente" [delete: restrict]

Ref "FK_Material_CodigoLer_IdLerCode":"CodigoLer"."Id" < "Material"."IdLerCode" [delete: restrict]

Ref "FK_RevisoesNoticias_Noticias_NoticiaId":"Noticias"."Id" < "RevisoesNoticias"."NoticiaId" [delete: cascade]

Ref "FK_ChatMessage_Cliente_ClienteId":"Cliente"."Id" < "ChatMessage"."ClienteId" [delete: cascade]

Ref "FK_ChatMessage_Utilizador_UtilizadorId":"Utilizador"."Id" < "ChatMessage"."UtilizadorId" [delete: restrict]

Ref "FK_NotaInterna_Utilizador_UtilizadorId":"Utilizador"."Id" < "NotaInterna"."UtilizadorId" [delete: restrict]

Ref "FK_SolicitacaoAlteracaoPerfil_Cliente_ClienteId":"Cliente"."Id" < "SolicitacaoAlteracaoPerfil"."ClienteId" [delete: cascade]

Ref "FK_SolicitacaoAlteracaoPerfil_Utilizador_ResolvidoPor":"Utilizador"."Id" < "SolicitacaoAlteracaoPerfil"."ResolvidoPor" [delete: restrict]

Ref "FK_UserKioskDevice_KioskDevice_KioskDeviceId":"KioskDevice"."Id" < "UserKioskDevice"."KioskDeviceId" [delete: cascade]

Ref "FK_UserKioskDevice_Utilizador_UserId":"Utilizador"."Id" < "UserKioskDevice"."UserId" [delete: cascade]

Ref "FK_UserPin_Utilizador_UserId":"Utilizador"."Id" < "UserPin"."UserId" [delete: cascade]

Ref "FK_PedidoMaterialPretendido_Material_MateriaisPretendidosId":"Material"."Id" < "PedidoMaterialPretendido"."MateriaisPretendidosId" [delete: cascade]

Ref "FK_PedidoMaterialPretendido_PedidoRecolha_PedidoRecolhaId":"PedidoRecolha"."Id" < "PedidoMaterialPretendido"."PedidoRecolhaId" [delete: cascade]

Ref "FK_Pesagem_Material_IdMaterial":"Material"."Id" < "Pesagem"."IdMaterial" [delete: restrict]

Ref "FK_Pesagem_Recolha_IdRecolha":"Recolha"."Id" < "Pesagem"."IdRecolha" [delete: cascade]

Ref "FK_Pesagem_Utilizador_IdUtilizador":"Utilizador"."Id" < "Pesagem"."IdUtilizador" [delete: restrict]

Ref "FK_RecolhaMaterialPreSelecionado_Material_MateriaisPreSelecion~":"Material"."Id" < "RecolhaMaterialPreSelecionado"."MateriaisPreSelecionadosId" [delete: cascade]

Ref "FK_RecolhaMaterialPreSelecionado_Recolha_RecolhaId":"Recolha"."Id" < "RecolhaMaterialPreSelecionado"."RecolhaId" [delete: cascade]