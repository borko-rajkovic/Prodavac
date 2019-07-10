object dm: Tdm
  OldCreateOrder = False
  Height = 1022
  Width = 1508
  object connMySQL: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'prodavac'
    SpecificOptions.Strings = (
      'MySQL.UseUnicode=True')
    Username = 'root'
    Server = 'localhost'
    ConnectDialog = connDC
    LoginPrompt = False
    Left = 200
    Top = 16
    EncryptedPassword = '8DFF90FF90FF8BFF'
  end
  object MySQLUniProvider: TMySQLUniProvider
    Left = 72
    Top = 16
  end
  object connDC: TUniConnectDialog
    DatabaseLabel = 'Baza podataka'
    PortLabel = 'Port'
    ProviderLabel = 'Provajder'
    Caption = 'Konekcija za bazu'
    UsernameLabel = 'Korisni'#269'ko ime'
    PasswordLabel = 'Lozinka'
    ServerLabel = 'Server'
    ConnectButton = 'Konektuj'
    CancelButton = 'Odustani'
    LabelSet = lsCustom
    StoreLogInfo = False
    Left = 136
    Top = 16
  end
  object QKorisnici: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * from korisnici where active = 1')
    Left = 344
    Top = 16
    object QKorisniciid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object QKorisniciIme: TWideStringField
      FieldName = 'Ime'
      Required = True
      Size = 50
    end
    object QKorisniciPrezime: TWideStringField
      FieldName = 'Prezime'
      Required = True
      Size = 50
    end
    object QKorisniciUsername: TWideStringField
      FieldName = 'Username'
      Required = True
      Size = 50
    end
    object QKorisniciPassword: TWideStringField
      FieldName = 'Password'
      Required = True
      Size = 50
    end
    object QKorisniciGrupa: TWideStringField
      FieldName = 'Grupa'
      Required = True
      Size = 50
    end
    object QKorisniciActive: TIntegerField
      FieldName = 'Active'
      Required = True
    end
  end
  object Query: TUniQuery
    Connection = connMySQL
    Left = 72
    Top = 80
  end
  object SKorisnici: TDataSource
    DataSet = QKorisnici
    Left = 408
    Top = 16
  end
  object QKupacProdaja: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select'
      'kp.id_kupca,'
      'kp.Proizvod,'
      'kp.Cijena,'
      'kp.broj_rata as '#39'Broj rata'#39','
      'kp.datum as '#39'Datum kupovine'#39','
      'kp.username as '#39'Prodao'#39','
      'sum(ur.iznos) as '#39'Pla'#263'eno'#39','
      
        'if(kp.cijena - sum(IF(ur.iznos IS NULL, 0, ur.iznos))>0,1,0) as ' +
        #39'Balans'#39
      'from kupljeni_proizvodi kp'
      'left join uplacene_rate ur'
      'on kp.id = ur.id_prodaje'
      
        'group by kp.id_kupca, proizvod, cijena, broj_rata, kp.datum, kp.' +
        'username')
    Left = 72
    Top = 256
    object QKupacProdajaid_kupca: TIntegerField
      FieldName = 'id_kupca'
      Required = True
    end
    object QKupacProdajaProizvod: TWideStringField
      FieldName = 'Proizvod'
      Required = True
      Size = 50
    end
    object QKupacProdajaCijena: TFloatField
      FieldName = 'Cijena'
      Required = True
    end
    object QKupacProdajaBrojrata: TIntegerField
      FieldName = 'Broj rata'
      Required = True
    end
    object QKupacProdajaDatumkupovine: TDateTimeField
      FieldName = 'Datum kupovine'
      Required = True
    end
    object QKupacProdajaProdao: TWideStringField
      FieldName = 'Prodao'
      Required = True
    end
    object QKupacProdajaPlaćeno: TFloatField
      FieldName = 'Pla'#263'eno'
      ReadOnly = True
    end
    object QKupacProdajaBalans: TLargeintField
      FieldName = 'Balans'
      ReadOnly = True
      Required = True
    end
  end
  object SKupacProdaja: TDataSource
    DataSet = QKupacProdaja
    Left = 152
    Top = 256
  end
  object QProdaja: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * from kupljeni_proizvodi')
    Left = 72
    Top = 376
    object QProdajaid: TIntegerField
      FieldName = 'id'
    end
    object QProdajaid_kupca: TIntegerField
      FieldName = 'id_kupca'
      Required = True
    end
    object QProdajaproizvod: TWideStringField
      FieldName = 'proizvod'
      Required = True
      Size = 50
    end
    object QProdajacijena: TFloatField
      FieldName = 'cijena'
      Required = True
    end
    object QProdajabroj_rata: TIntegerField
      FieldName = 'broj_rata'
      Required = True
    end
    object QProdajaodobreno: TBooleanField
      FieldName = 'odobreno'
      Required = True
    end
    object QProdajausername: TWideStringField
      FieldName = 'username'
      Required = True
    end
    object QProdajadatum: TDateTimeField
      FieldName = 'datum'
      Required = True
    end
  end
  object SProdaja: TDataSource
    DataSet = QProdaja
    Left = 152
    Top = 376
  end
  object QKupacPretraga: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * from kupci')
    Left = 72
    Top = 312
  end
  object SKupacPretraga: TDataSource
    DataSet = QKupacPretraga
    Left = 152
    Top = 312
  end
  object QProdajaPretraga: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select '
      'kp.id,'
      'k.Ime,'
      'k.Prezime,'
      'k.JMBG,'
      'k.BrojLicne as "Broj li'#269'ne karte",'
      'kp.Proizvod,'
      'kp.Cijena,'
      'kp.BrojKomada,'
      'kp.broj_rata as "Broj rata",'
      'kor.username as "Prodao",'
      'kp.odobreno as "Zaklju'#269'ano",'
      'kp.datum as "Datum",'
      'kp.popust as "Popust",'
      'kp.cijena - kp.popust/100*kp.cijena as "Cijena sa popustom"'
      'from kupci k'
      'inner join kupljeni_proizvodi kp'
      'on k.id = kp.id_kupca'
      'inner join korisnici kor'
      'on kp.id_prodavca = kor.id')
    Left = 72
    Top = 432
    object QProdajaPretragaid: TIntegerField
      FieldName = 'id'
    end
    object QProdajaPretragaIme: TWideStringField
      FieldName = 'Ime'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object QProdajaPretragaPrezime: TWideStringField
      FieldName = 'Prezime'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object QProdajaPretragaJMBG: TWideStringField
      FieldName = 'JMBG'
      ReadOnly = True
      Required = True
    end
    object QProdajaPretragaBrojličnekarte: TWideStringField
      FieldName = 'Broj li'#269'ne karte'
      ReadOnly = True
      Required = True
    end
    object QProdajaPretragaProizvod: TWideStringField
      FieldName = 'Proizvod'
      Required = True
      Size = 50
    end
    object QProdajaPretragaCijena: TFloatField
      FieldName = 'Cijena'
      Required = True
    end
    object QProdajaPretragaBrojrata: TIntegerField
      FieldName = 'Broj rata'
      Required = True
    end
    object QProdajaPretragaProdao: TWideStringField
      FieldName = 'Prodao'
      Required = True
    end
    object QProdajaPretragaZaključano: TBooleanField
      FieldName = 'Zaklju'#269'ano'
      Required = True
    end
    object QProdajaPretragaDatum: TDateTimeField
      FieldName = 'Datum'
      Required = True
    end
    object QProdajaPretragaPopust: TFloatField
      FieldName = 'Popust'
      Required = True
    end
    object QProdajaPretragaCijenasapopustom: TFloatField
      FieldName = 'Cijena sa popustom'
      ReadOnly = True
    end
    object QProdajaPretragaBrojKomada: TIntegerField
      FieldName = 'BrojKomada'
      Required = True
    end
  end
  object SProdajaPretraga: TDataSource
    DataSet = QProdajaPretraga
    Left = 152
    Top = 432
  end
  object QRate: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * from uplacene_rate')
    Left = 72
    Top = 488
    object QRateid: TIntegerField
      FieldName = 'id'
    end
    object QRateid_prodaje: TIntegerField
      FieldName = 'id_prodaje'
      Required = True
    end
    object QRateiznos: TFloatField
      FieldName = 'iznos'
      Required = True
    end
    object QRateodobreno: TBooleanField
      FieldName = 'odobreno'
      Required = True
    end
    object QRateusername: TWideStringField
      FieldName = 'username'
      Required = True
      Size = 50
    end
    object QRatedatum: TDateTimeField
      FieldName = 'datum'
      Required = True
    end
  end
  object SRate: TDataSource
    DataSet = QRate
    Left = 152
    Top = 488
  end
  object QUgovorStampa: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * '
      'from kupci k'
      'inner join kupljeni_proizvodi kp'
      'on k.id = kp.id_kupca')
    Left = 72
    Top = 544
    object QUgovorStampaid: TIntegerField
      FieldName = 'id'
    end
    object QUgovorStampaIme: TWideStringField
      FieldName = 'Ime'
      Required = True
      Size = 50
    end
    object QUgovorStampaPrezime: TWideStringField
      FieldName = 'Prezime'
      Required = True
      Size = 50
    end
    object QUgovorStampaJMBG: TWideStringField
      FieldName = 'JMBG'
      Required = True
    end
    object QUgovorStampaBrojLicne: TWideStringField
      FieldName = 'BrojLicne'
      Required = True
    end
    object QUgovorStampaKopijaLicne: TWideStringField
      FieldName = 'KopijaLicne'
      Required = True
      Size = 300
    end
    object QUgovorStampausername: TWideStringField
      FieldName = 'username'
      Required = True
    end
    object QUgovorStampadatum: TDateTimeField
      FieldName = 'datum'
      Required = True
    end
    object QUgovorStampaid_1: TIntegerField
      FieldName = 'id_1'
      ReadOnly = True
    end
    object QUgovorStampaid_kupca: TIntegerField
      FieldName = 'id_kupca'
      ReadOnly = True
      Required = True
    end
    object QUgovorStampaproizvod: TWideStringField
      FieldName = 'proizvod'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object QUgovorStampacijena: TFloatField
      FieldName = 'cijena'
      ReadOnly = True
      Required = True
    end
    object QUgovorStampabroj_rata: TIntegerField
      FieldName = 'broj_rata'
      ReadOnly = True
      Required = True
    end
    object QUgovorStampaodobreno: TBooleanField
      FieldName = 'odobreno'
      ReadOnly = True
      Required = True
    end
    object QUgovorStampausername_1: TWideStringField
      FieldName = 'username_1'
      ReadOnly = True
      Required = True
    end
    object QUgovorStampadatum_1: TDateTimeField
      FieldName = 'datum_1'
      ReadOnly = True
      Required = True
    end
  end
  object SUgovorStampa: TDataSource
    DataSet = QUgovorStampa
    Left = 152
    Top = 544
  end
  object frxDBUgovorStampa: TfrxDBDataset
    UserName = 'frxDBUgovorStampa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'Ime=Ime'
      'Prezime=Prezime'
      'JMBG=JMBG'
      'BrojLicne=BrojLicne'
      'KopijaLicne=KopijaLicne'
      'username=username'
      'datum=datum'
      'id_1=id_1'
      'id_kupca=id_kupca'
      'proizvod=proizvod'
      'cijena=cijena'
      'broj_rata=broj_rata'
      'odobreno=odobreno'
      'username_1=username_1'
      'datum_1=datum_1')
    DataSource = SUgovorStampa
    BCDToCurrency = False
    Left = 248
    Top = 544
  end
  object QPriznanicaStampa: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * '
      'from kupci k'
      'inner join kupljeni_proizvodi kp'
      'on k.id = kp.id_kupca'
      'inner join uplacene_rate u'
      'on kp.id = u.id_prodaje')
    Left = 72
    Top = 608
    object QPriznanicaStampaid: TIntegerField
      FieldName = 'id'
    end
    object QPriznanicaStampaIme: TWideStringField
      FieldName = 'Ime'
      Required = True
      Size = 50
    end
    object QPriznanicaStampaPrezime: TWideStringField
      FieldName = 'Prezime'
      Required = True
      Size = 50
    end
    object QPriznanicaStampaJMBG: TWideStringField
      FieldName = 'JMBG'
      Required = True
    end
    object QPriznanicaStampaBrojLicne: TWideStringField
      FieldName = 'BrojLicne'
      Required = True
    end
    object QPriznanicaStampaKopijaLicne: TWideStringField
      FieldName = 'KopijaLicne'
      Required = True
      Size = 300
    end
    object QPriznanicaStampausername: TWideStringField
      FieldName = 'username'
      Required = True
    end
    object QPriznanicaStampadatum: TDateTimeField
      FieldName = 'datum'
      Required = True
    end
    object QPriznanicaStampaid_1: TIntegerField
      FieldName = 'id_1'
      ReadOnly = True
    end
    object QPriznanicaStampaid_kupca: TIntegerField
      FieldName = 'id_kupca'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampaproizvod: TWideStringField
      FieldName = 'proizvod'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object QPriznanicaStampacijena: TFloatField
      FieldName = 'cijena'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampabroj_rata: TIntegerField
      FieldName = 'broj_rata'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampaodobreno: TBooleanField
      FieldName = 'odobreno'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampausername_1: TWideStringField
      FieldName = 'username_1'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampadatum_1: TDateTimeField
      FieldName = 'datum_1'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampaid_2: TIntegerField
      FieldName = 'id_2'
      ReadOnly = True
    end
    object QPriznanicaStampaid_prodaje: TIntegerField
      FieldName = 'id_prodaje'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampaiznos: TFloatField
      FieldName = 'iznos'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampaodobreno_1: TBooleanField
      FieldName = 'odobreno_1'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampausername_2: TWideStringField
      FieldName = 'username_2'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object QPriznanicaStampadatum_2: TDateTimeField
      FieldName = 'datum_2'
      ReadOnly = True
      Required = True
    end
  end
  object SPriznanicaStampa: TDataSource
    DataSet = QPriznanicaStampa
    Left = 152
    Top = 608
  end
  object frxDBPriznanicaStampa: TfrxDBDataset
    UserName = 'frxDBPriznanicaStampa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'Ime=Ime'
      'Prezime=Prezime'
      'JMBG=JMBG'
      'BrojLicne=BrojLicne'
      'KopijaLicne=KopijaLicne'
      'username=username'
      'datum=datum'
      'id_1=id_1'
      'id_kupca=id_kupca'
      'proizvod=proizvod'
      'cijena=cijena'
      'broj_rata=broj_rata'
      'odobreno=odobreno'
      'username_1=username_1'
      'datum_1=datum_1'
      'id_2=id_2'
      'id_prodaje=id_prodaje'
      'iznos=iznos'
      'odobreno_1=odobreno_1'
      'username_2=username_2'
      'datum_2=datum_2')
    DataSource = SPriznanicaStampa
    BCDToCurrency = False
    Left = 248
    Top = 608
  end
  object QKupci: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * from kupci'
      'inner join kupcigrupe'
      'on kupci.id_kupcigrupe=kupcigrupe.id'
      'order by kupci.id desc')
    Left = 72
    Top = 144
    object QKupciid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object QKupciIme: TWideStringField
      FieldName = 'Ime'
      Size = 50
    end
    object QKupciPrezime: TWideStringField
      FieldName = 'Prezime'
      Size = 50
    end
    object QKupciJMBG: TWideStringField
      FieldName = 'JMBG'
    end
    object QKupciBrojLicne: TWideStringField
      FieldName = 'BrojLicne'
    end
    object QKupciKopijaLicne: TWideStringField
      FieldName = 'KopijaLicne'
      Size = 300
    end
    object QKupcikontaktTelefon: TWideStringField
      FieldName = 'kontaktTelefon'
      Required = True
      Size = 50
    end
    object QKupciNapomena: TWideStringField
      FieldName = 'Napomena'
      Required = True
    end
    object QKupciusername: TWideStringField
      FieldName = 'username'
      Required = True
    end
    object QKupcidatum: TDateTimeField
      FieldName = 'datum'
      Required = True
    end
    object QKupciid_kupcigrupe: TIntegerField
      FieldName = 'id_kupcigrupe'
    end
    object QKupciid_1: TIntegerField
      FieldName = 'id_1'
      ReadOnly = True
    end
    object QKupciBroj: TWideStringField
      FieldName = 'Broj'
      ReadOnly = True
      Required = True
    end
    object QKupciNaziv: TWideStringField
      FieldName = 'Naziv'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object QKupciNapomena2: TWideStringField
      FieldName = 'Napomena2'
      Required = True
      Size = 5000
    end
    object QKupciindikator: TIntegerField
      FieldName = 'indikator'
      Required = True
    end
  end
  object SKupci: TDataSource
    DataSet = QKupci
    Left = 152
    Top = 144
  end
  object QArtGrupe: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * from artGrupe')
    Left = 336
    Top = 136
    object QArtGrupeid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object QArtGrupeBroj: TWideStringField
      FieldName = 'Broj'
      Required = True
    end
    object QArtGrupeNaziv: TWideStringField
      FieldName = 'Naziv'
      Required = True
      Size = 50
    end
  end
  object SArtGrupe: TDataSource
    DataSet = QArtGrupe
    Left = 416
    Top = 136
  end
  object QArtPopusti: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * from artPopusti')
    Left = 336
    Top = 192
    object QArtPopustiid: TIntegerField
      FieldName = 'id'
    end
    object QArtPopustiNaziv: TWideStringField
      FieldName = 'Naziv'
      Required = True
      Size = 50
    end
    object QArtPopustiIznos: TFloatField
      FieldName = 'Iznos'
      Required = True
    end
  end
  object SArtPopusti: TDataSource
    DataSet = QArtPopusti
    Left = 416
    Top = 192
  end
  object QArtRasteri: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * from artRasteri')
    Left = 336
    Top = 256
    object QArtRasteriID: TIntegerField
      FieldName = 'ID'
    end
    object QArtRasteriSifra: TWideStringField
      FieldName = 'Sifra'
      Required = True
      Size = 50
    end
    object QArtRasteriNaziv: TWideStringField
      FieldName = 'Naziv'
      Required = True
      Size = 50
    end
  end
  object SArtRasteri: TDataSource
    DataSet = QArtRasteri
    Left = 416
    Top = 256
  end
  object QArtVelicinaRastera: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * from artRasteriVelicina')
    Left = 336
    Top = 312
    object QArtVelicinaRasteraid: TIntegerField
      FieldName = 'id'
    end
    object QArtVelicinaRasteraid_rastera: TIntegerField
      FieldName = 'id_rastera'
      Required = True
    end
    object QArtVelicinaRasteraVelicina: TWideStringField
      FieldName = 'Velicina'
      Required = True
    end
  end
  object SArtVelicinaRastera: TDataSource
    DataSet = QArtVelicinaRastera
    Left = 416
    Top = 312
  end
  object QArtModeli: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select am.*, ag.Naziv as Grupa, ar.Naziv as Raster'
      'from artmodeli am'
      'inner join artgrupe ag'
      'on am.id_grupe = ag.id'
      'inner join artrasteri ar'
      'on ar.id = am.id_rastera')
    Left = 336
    Top = 368
    object QArtModeliid: TIntegerField
      FieldName = 'id'
    end
    object QArtModeliid_grupe: TIntegerField
      FieldName = 'id_grupe'
      Required = True
    end
    object QArtModelimodel: TWideStringField
      FieldName = 'model'
      Required = True
    end
    object QArtModelicijena: TFloatField
      FieldName = 'cijena'
      Required = True
    end
    object QArtModeliid_rastera: TIntegerField
      FieldName = 'id_rastera'
      Required = True
    end
    object QArtModeliGrupa: TWideStringField
      FieldName = 'Grupa'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object QArtModeliRaster: TWideStringField
      FieldName = 'Raster'
      ReadOnly = True
      Required = True
      Size = 50
    end
  end
  object SArtModeli: TDataSource
    DataSet = QArtModeli
    Left = 416
    Top = 368
  end
  object QArtModeliDetalji: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * from artmodelidetalji')
    Left = 336
    Top = 432
    object QArtModeliDetaljiid: TIntegerField
      FieldName = 'id'
    end
    object QArtModeliDetaljiid_modela: TIntegerField
      FieldName = 'id_modela'
      Required = True
    end
    object QArtModeliDetaljivelicina: TWideStringField
      FieldName = 'velicina'
      Required = True
    end
    object QArtModeliDetaljibrojkomada: TIntegerField
      FieldName = 'brojkomada'
      Required = True
    end
    object QArtModeliDetaljibarkod: TWideStringField
      FieldName = 'barkod'
      Required = True
      Size = 50
    end
  end
  object SArtModeliDetalji: TDataSource
    DataSet = QArtModeliDetalji
    Left = 416
    Top = 432
  end
  object QArtModeliPopustUnijeti: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select am.*, ap.naziv,ap.iznos from artpopustimodel am'
      'inner join artpopusti ap'
      'on am.id_popusta = ap.id and am.id = :idmodela')
    Left = 528
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idmodela'
      end>
    object QArtModeliPopustUnijetiid: TIntegerField
      FieldName = 'id'
    end
    object QArtModeliPopustUnijetiid_modela: TIntegerField
      FieldName = 'id_modela'
      Required = True
    end
    object QArtModeliPopustUnijetiid_popusta: TIntegerField
      FieldName = 'id_popusta'
    end
    object QArtModeliPopustUnijetinaziv: TWideStringField
      FieldName = 'naziv'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object QArtModeliPopustUnijetiiznos: TFloatField
      FieldName = 'iznos'
      ReadOnly = True
      Required = True
    end
  end
  object SArtModeliPopustUnijeti: TDataSource
    DataSet = QArtModeliPopustUnijeti
    Left = 608
    Top = 136
  end
  object QArtModeliPopustMoguci: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select am.*, ap.naziv,ap.iznos from artpopustimodel am'
      'inner join artpopusti ap'
      'on am.id_popusta = ap.id and am.id = :idmodela')
    Left = 528
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idmodela'
      end>
    object QArtModeliPopustMoguciid: TIntegerField
      FieldName = 'id'
    end
    object QArtModeliPopustMoguciid_modela: TIntegerField
      FieldName = 'id_modela'
      Required = True
    end
    object QArtModeliPopustMoguciid_popusta: TIntegerField
      FieldName = 'id_popusta'
    end
    object QArtModeliPopustMogucinaziv: TWideStringField
      FieldName = 'naziv'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object QArtModeliPopustMoguciiznos: TFloatField
      FieldName = 'iznos'
      ReadOnly = True
      Required = True
    end
  end
  object SArtModeliPopustMoguci: TDataSource
    DataSet = QArtModeliPopustMoguci
    Left = 608
    Top = 192
  end
  object QArtGrupePopustUnijeti: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select ag.*, ap.naziv,ap.iznos from artpopustigrupe ag'
      'inner join artpopusti ap'
      'on ag.id_popusta = ap.id and ag.id = :idgrupe')
    Left = 528
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idgrupe'
      end>
    object QArtGrupePopustUnijetiid: TIntegerField
      FieldName = 'id'
    end
    object QArtGrupePopustUnijetiid_grupe: TIntegerField
      FieldName = 'id_grupe'
      Required = True
    end
    object QArtGrupePopustUnijetiid_popusta: TIntegerField
      FieldName = 'id_popusta'
      Required = True
    end
    object QArtGrupePopustUnijetinaziv: TWideStringField
      FieldName = 'naziv'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object QArtGrupePopustUnijetiiznos: TFloatField
      FieldName = 'iznos'
      ReadOnly = True
      Required = True
    end
  end
  object SArtGrupePopustUnijeti: TDataSource
    DataSet = QArtGrupePopustUnijeti
    Left = 608
    Top = 256
  end
  object QArtGrupePopustMoguci: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select ag.*, ap.naziv,ap.iznos from artpopustigrupe ag'
      'inner join artpopusti ap'
      'on ag.id_popusta = ap.id and ag.id = :idgrupe')
    Left = 528
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idgrupe'
      end>
    object QArtGrupePopustMoguciid: TIntegerField
      FieldName = 'id'
    end
    object QArtGrupePopustMoguciid_grupe: TIntegerField
      FieldName = 'id_grupe'
      Required = True
    end
    object QArtGrupePopustMoguciid_popusta: TIntegerField
      FieldName = 'id_popusta'
      Required = True
    end
    object QArtGrupePopustMogucinaziv: TWideStringField
      FieldName = 'naziv'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object QArtGrupePopustMoguciiznos: TFloatField
      FieldName = 'iznos'
      ReadOnly = True
      Required = True
    end
  end
  object SArtGrupePopustMoguci: TDataSource
    DataSet = QArtGrupePopustMoguci
    Left = 608
    Top = 312
  end
  object QKupciGrupe: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * from kupcigrupe')
    Left = 72
    Top = 200
    object QKupciGrupeid: TIntegerField
      FieldName = 'id'
    end
    object QKupciGrupeBroj: TWideStringField
      FieldName = 'Broj'
      Required = True
    end
    object QKupciGrupeNaziv: TWideStringField
      FieldName = 'Naziv'
      Required = True
      Size = 50
    end
  end
  object SKupciGrupe: TDataSource
    DataSet = QKupciGrupe
    Left = 152
    Top = 200
  end
  object QProdajaProizvodi: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      
        'select artmodeli.id, artmodeli.model,artmodeli.cijena,artgrupe.n' +
        'aziv as grupa'
      'from artmodeli'
      'inner join artgrupe'
      'on artmodeli.id_grupe = artgrupe.id')
    Left = 736
    Top = 136
    object QProdajaProizvodiid: TIntegerField
      FieldName = 'id'
    end
    object QProdajaProizvodimodel: TWideStringField
      FieldName = 'model'
      Required = True
    end
    object QProdajaProizvodicijena: TFloatField
      FieldName = 'cijena'
      Required = True
    end
    object QProdajaProizvodigrupa: TWideStringField
      FieldName = 'grupa'
      ReadOnly = True
      Required = True
      Size = 50
    end
  end
  object SProdajaProizvodi: TDataSource
    DataSet = QProdajaProizvodi
    Left = 816
    Top = 136
  end
  object QProdajaProdavac: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * from korisnici'
      'where grupa = '#39'Operater'#39)
    Left = 736
    Top = 192
    object QProdajaProdavacid: TIntegerField
      FieldName = 'id'
    end
    object QProdajaProdavacIme: TWideStringField
      FieldName = 'Ime'
      Required = True
      Size = 50
    end
    object QProdajaProdavacPrezime: TWideStringField
      FieldName = 'Prezime'
      Required = True
      Size = 50
    end
    object QProdajaProdavacUsername: TWideStringField
      FieldName = 'Username'
      Required = True
      Size = 50
    end
    object QProdajaProdavacPassword: TWideStringField
      FieldName = 'Password'
      Required = True
      Size = 50
    end
    object QProdajaProdavacGrupa: TWideStringField
      FieldName = 'Grupa'
      Required = True
      Size = 50
    end
  end
  object SProdajaProdavac: TDataSource
    DataSet = QProdajaProdavac
    Left = 816
    Top = 192
  end
  object QProdajaPopust: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * from artpopusti')
    Left = 736
    Top = 248
    object QProdajaPopustid: TIntegerField
      FieldName = 'id'
    end
    object QProdajaPopustNaziv: TWideStringField
      FieldName = 'Naziv'
      Required = True
      Size = 50
    end
    object QProdajaPopustIznos: TFloatField
      FieldName = 'Iznos'
      Required = True
    end
  end
  object SProdajaPopust: TDataSource
    DataSet = QProdajaPopust
    Left = 816
    Top = 248
  end
  object QProdajaProizvodDetalji: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * from artmodelidetalji')
    Left = 736
    Top = 312
    object QProdajaProizvodDetaljiid: TIntegerField
      FieldName = 'id'
    end
    object QProdajaProizvodDetaljiid_modela: TIntegerField
      FieldName = 'id_modela'
      Required = True
    end
    object QProdajaProizvodDetaljivelicina: TWideStringField
      FieldName = 'velicina'
      Required = True
    end
    object QProdajaProizvodDetaljibrojkomada: TIntegerField
      FieldName = 'brojkomada'
      Required = True
    end
    object QProdajaProizvodDetaljibarkod: TWideStringField
      FieldName = 'barkod'
      Required = True
      Size = 50
    end
  end
  object SProdajaProizvodDetalji: TDataSource
    DataSet = QProdajaProizvodDetalji
    Left = 816
    Top = 312
  end
  object QProdajaPregled: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * from kupljeni_proizvodi')
    Left = 736
    Top = 376
    object QProdajaPregledid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object QProdajaPregledid_kupca: TIntegerField
      FieldName = 'id_kupca'
      Required = True
    end
    object QProdajaPregledproizvod: TWideStringField
      FieldName = 'proizvod'
      Required = True
      Size = 50
    end
    object QProdajaPregledcijena: TFloatField
      FieldName = 'cijena'
      Required = True
    end
    object QProdajaPregledbroj_rata: TIntegerField
      FieldName = 'broj_rata'
      Required = True
    end
    object QProdajaPregledid_velicine: TIntegerField
      FieldName = 'id_velicine'
      Required = True
    end
    object QProdajaPregledvelicina: TWideStringField
      FieldName = 'velicina'
      Required = True
    end
    object QProdajaPregledpopust: TFloatField
      FieldName = 'popust'
      Required = True
    end
    object QProdajaPregledodobreno: TBooleanField
      FieldName = 'odobreno'
      Required = True
    end
    object QProdajaPregledusername: TWideStringField
      FieldName = 'username'
      Required = True
    end
    object QProdajaPregleddatum: TDateTimeField
      FieldName = 'datum'
      Required = True
    end
    object QProdajaPregledbrojkomada: TIntegerField
      FieldName = 'brojkomada'
      Required = True
    end
  end
  object SProdajaPreged: TDataSource
    DataSet = QProdajaPregled
    Left = 816
    Top = 376
  end
  object QUplate: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * from uplate')
    Left = 736
    Top = 512
    object QUplateid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object QUplateid_kupca: TIntegerField
      FieldName = 'id_kupca'
      Required = True
    end
    object QUplateiznos: TFloatField
      FieldName = 'iznos'
      Required = True
    end
    object QUplateusername: TWideStringField
      FieldName = 'username'
      Required = True
      Size = 50
    end
    object QUplatedatum: TDateTimeField
      FieldName = 'datum'
      Required = True
    end
  end
  object SUplate: TDataSource
    DataSet = QUplate
    Left = 816
    Top = 512
  end
  object QArtModeliPretraga: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * from artmodeli')
    Left = 960
    Top = 136
    object QArtModeliPretragaid: TIntegerField
      FieldName = 'id'
    end
    object QArtModeliPretragaid_grupe: TIntegerField
      FieldName = 'id_grupe'
      Required = True
    end
    object QArtModeliPretragamodel: TWideStringField
      FieldName = 'model'
      Required = True
    end
    object QArtModeliPretragacijena: TFloatField
      FieldName = 'cijena'
      Required = True
    end
    object QArtModeliPretragaid_rastera: TIntegerField
      FieldName = 'id_rastera'
      Required = True
    end
  end
  object SArtModeliPretraga: TDataSource
    DataSet = QArtModeliPretraga
    Left = 1040
    Top = 136
  end
  object QArtModeliPretragaGrid: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select am.*, ag.Naziv as Grupa, ar.Naziv as Raster'
      'from artmodeli am'
      'inner join artgrupe ag'
      'on am.id_grupe = ag.id'
      'inner join artrasteri ar'
      'on ar.id = am.id_rastera')
    Left = 960
    Top = 192
    object QArtModeliPretragaGridid: TIntegerField
      FieldName = 'id'
    end
    object QArtModeliPretragaGridid_grupe: TIntegerField
      FieldName = 'id_grupe'
      Required = True
    end
    object QArtModeliPretragaGridmodel: TWideStringField
      FieldName = 'model'
      Required = True
    end
    object QArtModeliPretragaGridcijena: TFloatField
      FieldName = 'cijena'
      Required = True
    end
    object QArtModeliPretragaGridid_rastera: TIntegerField
      FieldName = 'id_rastera'
      Required = True
    end
    object QArtModeliPretragaGridGrupa: TWideStringField
      FieldName = 'Grupa'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object QArtModeliPretragaGridRaster: TWideStringField
      FieldName = 'Raster'
      ReadOnly = True
      Required = True
      Size = 50
    end
  end
  object SArtModeliPretragaGrid: TDataSource
    DataSet = QArtModeliPretragaGrid
    Left = 1040
    Top = 192
  end
  object QArtModeliPretragaPopust: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * '
      'from artpopusti p '
      'where p.id in '
      
        '(select id_popusta from artpopustimodel pm where pm.id_modela = ' +
        ':id_modela) '
      'or p.id in (select id_popusta from artpopustigrupe pg where '
      'pg.id in (select id_grupe from artmodeli where id=:id_modela));')
    Left = 960
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_modela'
      end>
    object QArtModeliPretragaPopustid: TIntegerField
      FieldName = 'id'
    end
    object QArtModeliPretragaPopustNaziv: TWideStringField
      FieldName = 'Naziv'
      Required = True
      Size = 50
    end
    object QArtModeliPretragaPopustIznos: TFloatField
      FieldName = 'Iznos'
      Required = True
    end
  end
  object SArtModeliPretragaPopust: TDataSource
    DataSet = QArtModeliPretragaPopust
    Left = 1040
    Top = 248
  end
  object QArtModeliPretragaDetalji: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * from artmodelidetalji')
    Left = 960
    Top = 312
    object QArtModeliPretragaDetaljiid: TIntegerField
      FieldName = 'id'
    end
    object QArtModeliPretragaDetaljiid_modela: TIntegerField
      FieldName = 'id_modela'
      Required = True
    end
    object QArtModeliPretragaDetaljivelicina: TWideStringField
      FieldName = 'velicina'
      Required = True
    end
    object QArtModeliPretragaDetaljibrojkomada: TIntegerField
      FieldName = 'brojkomada'
      Required = True
    end
    object QArtModeliPretragaDetaljibarkod: TWideStringField
      FieldName = 'barkod'
      Required = True
      Size = 50
    end
  end
  object SArtModeliPretragaDetalji: TDataSource
    DataSet = QArtModeliPretragaDetalji
    Left = 1040
    Top = 312
  end
  object QProdajaPregledKes: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * from kupljeni_proizvodi')
    Left = 736
    Top = 440
    object IntegerField1: TIntegerField
      FieldName = 'id'
    end
    object IntegerField2: TIntegerField
      FieldName = 'id_kupca'
      Required = True
    end
    object WideStringField1: TWideStringField
      FieldName = 'proizvod'
      Required = True
      Size = 50
    end
    object FloatField1: TFloatField
      FieldName = 'cijena'
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'broj_rata'
      Required = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'id_velicine'
      Required = True
    end
    object WideStringField2: TWideStringField
      FieldName = 'velicina'
      Required = True
    end
    object FloatField2: TFloatField
      FieldName = 'popust'
      Required = True
    end
    object BooleanField1: TBooleanField
      FieldName = 'odobreno'
      Required = True
    end
    object WideStringField3: TWideStringField
      FieldName = 'username'
      Required = True
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'datum'
      Required = True
    end
    object QProdajaPregledKesbrojkomada: TIntegerField
      FieldName = 'brojkomada'
      Required = True
    end
  end
  object SProdajaPregledKes: TDataSource
    DataSet = QProdajaPregledKes
    Left = 816
    Top = 440
  end
  object QKarticaProdaje: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'SELECT   id,  id_kupca,  id_prodavca,  proizvod,  cijena,'
      
        '  brojkomada,  broj_rata,  id_velicine,  velicina,  popust,  odo' +
        'breno,'
      '  username,  datum, cijena-cijena*popust/100 as prodajna_cijena'
      'FROM '
      '  kupljeni_proizvodi;')
    Left = 960
    Top = 440
    object QKarticaProdajeid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object QKarticaProdajeid_kupca: TIntegerField
      FieldName = 'id_kupca'
      Required = True
    end
    object QKarticaProdajeproizvod: TWideStringField
      FieldName = 'proizvod'
      Required = True
      Size = 50
    end
    object QKarticaProdajecijena: TFloatField
      FieldName = 'cijena'
      Required = True
    end
    object QKarticaProdajebroj_rata: TIntegerField
      FieldName = 'broj_rata'
      Required = True
    end
    object QKarticaProdajeid_velicine: TIntegerField
      FieldName = 'id_velicine'
      Required = True
    end
    object QKarticaProdajevelicina: TWideStringField
      FieldName = 'velicina'
      Required = True
    end
    object QKarticaProdajepopust: TFloatField
      FieldName = 'popust'
      Required = True
    end
    object QKarticaProdajeodobreno: TBooleanField
      FieldName = 'odobreno'
      Required = True
    end
    object QKarticaProdajeusername: TWideStringField
      FieldName = 'username'
      Required = True
    end
    object QKarticaProdajedatum: TDateTimeField
      FieldName = 'datum'
      Required = True
    end
    object QKarticaProdajebrojkomada: TIntegerField
      FieldName = 'brojkomada'
      Required = True
    end
    object QKarticaProdajeid_prodavca: TIntegerField
      FieldName = 'id_prodavca'
      Required = True
    end
    object QKarticaProdajeprodajna_cijena: TFloatField
      FieldName = 'prodajna_cijena'
      ReadOnly = True
    end
  end
  object SKarticaProdaje: TDataSource
    DataSet = QKarticaProdaje
    Left = 1040
    Top = 440
  end
  object QKarticaUplate: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * from uplacene_rate'
      'order by id_prodaje')
    Left = 960
    Top = 504
    object QKarticaUplateid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object QKarticaUplateid_prodaje: TIntegerField
      FieldName = 'id_prodaje'
      Required = True
    end
    object QKarticaUplateiznos: TFloatField
      FieldName = 'iznos'
      Required = True
    end
    object QKarticaUplateodobreno: TBooleanField
      FieldName = 'odobreno'
      Required = True
    end
    object QKarticaUplateusername: TWideStringField
      FieldName = 'username'
      Required = True
      Size = 50
    end
    object QKarticaUplatedatum: TDateTimeField
      FieldName = 'datum'
      Required = True
    end
  end
  object SKarticaUplate: TDataSource
    DataSet = QKarticaUplate
    Left = 1040
    Top = 504
  end
  object QKarticaKartica: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      
        'select proizvod,(cijena-cijena*popust/100)*brojkomada as duguje,' +
        ' 0 as potrazuje,-(cijena-cijena*popust/100)*brojkomada as saldo,' +
        ' date(datum) as datum, datum as dat,'
      
        'case when ifnull(datediff(curdate(),datum),0) > 165 then -(cijen' +
        'a-cijena*popust/100)*brojkomada else 0 end as preostalidug,'
      
        'case when ifnull(datediff(curdate(),datum),0) <= 165 then -(cije' +
        'na-cijena*popust/100)*brojkomada else 0 end as duguvaluti'
      'from kupljeni_proizvodi '
      'where id_kupca=13'
      'union all '
      
        'select '#39#39',0 as duguje,iznos as potrazuje, iznos as saldo, date(d' +
        'atum) as datum, datum as dat,'
      
        'case when id_prodaje in (select id from kupljeni_proizvodi where' +
        ' ifnull(datediff(curdate(),datum),0) > 165) then iznos else 0 en' +
        'd as preostalidug,'
      
        'case when id_prodaje not in (select id from kupljeni_proizvodi w' +
        'here ifnull(datediff(curdate(),datum),0) > 165) then iznos else ' +
        '0 end as duguvaluti'
      'from uplacene_rate '
      
        'where id_prodaje in (select id from kupljeni_proizvodi where id_' +
        'kupca=13) '
      'order by dat')
    Left = 960
    Top = 568
    object QKarticaKarticaduguje: TFloatField
      FieldName = 'duguje'
      ReadOnly = True
    end
    object QKarticaKarticapotrazuje: TFloatField
      FieldName = 'potrazuje'
      ReadOnly = True
      Required = True
    end
    object QKarticaKarticadatum: TDateField
      FieldName = 'datum'
      ReadOnly = True
    end
    object QKarticaKarticasaldo: TFloatField
      FieldName = 'saldo'
      ReadOnly = True
    end
    object QKarticaKarticadat: TDateTimeField
      FieldName = 'dat'
      ReadOnly = True
      Required = True
    end
    object QKarticaKarticapreostalidug: TFloatField
      FieldName = 'preostalidug'
      ReadOnly = True
    end
    object QKarticaKarticaduguvaluti: TFloatField
      FieldName = 'duguvaluti'
      ReadOnly = True
    end
    object QKarticaKarticaproizvod: TWideStringField
      FieldName = 'proizvod'
      ReadOnly = True
      Required = True
      Size = 50
    end
  end
  object SKarticaKartica: TDataSource
    DataSet = QKarticaKartica
    Left = 1040
    Top = 568
  end
  object QUplateRate: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select u.*, k.proizvod'
      'from uplacene_rate u'
      'inner join kupljeni_proizvodi k'
      'on u.id_prodaje = k.id')
    Left = 736
    Top = 568
    object QUplateRateid: TIntegerField
      FieldName = 'id'
    end
    object QUplateRateid_uplate: TIntegerField
      FieldName = 'id_uplate'
      Required = True
    end
    object QUplateRateid_prodaje: TIntegerField
      FieldName = 'id_prodaje'
      Required = True
    end
    object QUplateRateiznos: TFloatField
      FieldName = 'iznos'
      Required = True
    end
    object QUplateRateodobreno: TBooleanField
      FieldName = 'odobreno'
      Required = True
    end
    object QUplateRateusername: TWideStringField
      FieldName = 'username'
      Required = True
      Size = 50
    end
    object QUplateRatedatum: TDateTimeField
      FieldName = 'datum'
      Required = True
    end
    object QUplateRateproizvod: TWideStringField
      FieldName = 'proizvod'
      ReadOnly = True
      Required = True
      Size = 50
    end
  end
  object SUplateRate: TDataSource
    DataSet = QUplateRate
    Left = 816
    Top = 568
  end
  object Query2: TUniQuery
    Connection = connMySQL
    Left = 136
    Top = 80
  end
  object QPriznanicaStampa2: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * '
      'from kupci k'
      'inner join kupljeni_proizvodi kp'
      'on k.id = kp.id_kupca'
      'inner join uplacene_rate u'
      'on kp.id = u.id_prodaje')
    Left = 72
    Top = 672
    object QPriznanicaStampa2id: TIntegerField
      FieldName = 'id'
    end
    object QPriznanicaStampa2id_kupcigrupe: TIntegerField
      FieldName = 'id_kupcigrupe'
    end
    object QPriznanicaStampa2Ime: TWideStringField
      FieldName = 'Ime'
      Required = True
      Size = 50
    end
    object QPriznanicaStampa2Prezime: TWideStringField
      FieldName = 'Prezime'
      Required = True
      Size = 50
    end
    object QPriznanicaStampa2JMBG: TWideStringField
      FieldName = 'JMBG'
      Required = True
    end
    object QPriznanicaStampa2BrojLicne: TWideStringField
      FieldName = 'BrojLicne'
      Required = True
    end
    object QPriznanicaStampa2KopijaLicne: TWideStringField
      FieldName = 'KopijaLicne'
      Required = True
      Size = 300
    end
    object QPriznanicaStampa2kontaktTelefon: TWideStringField
      FieldName = 'kontaktTelefon'
      Required = True
      Size = 50
    end
    object QPriznanicaStampa2Napomena: TWideStringField
      FieldName = 'Napomena'
      Required = True
    end
    object QPriznanicaStampa2username: TWideStringField
      FieldName = 'username'
      Required = True
    end
    object QPriznanicaStampa2datum: TDateTimeField
      FieldName = 'datum'
      Required = True
    end
    object QPriznanicaStampa2id_1: TIntegerField
      FieldName = 'id_1'
      ReadOnly = True
    end
    object QPriznanicaStampa2id_kupca: TIntegerField
      FieldName = 'id_kupca'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampa2proizvod: TWideStringField
      FieldName = 'proizvod'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object QPriznanicaStampa2cijena: TFloatField
      FieldName = 'cijena'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampa2broj_rata: TIntegerField
      FieldName = 'broj_rata'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampa2id_velicine: TIntegerField
      FieldName = 'id_velicine'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampa2velicina: TWideStringField
      FieldName = 'velicina'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampa2popust: TFloatField
      FieldName = 'popust'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampa2odobreno: TBooleanField
      FieldName = 'odobreno'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampa2username_1: TWideStringField
      FieldName = 'username_1'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampa2datum_1: TDateTimeField
      FieldName = 'datum_1'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampa2id_2: TIntegerField
      FieldName = 'id_2'
      ReadOnly = True
    end
    object QPriznanicaStampa2id_uplate: TIntegerField
      FieldName = 'id_uplate'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampa2id_prodaje: TIntegerField
      FieldName = 'id_prodaje'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampa2iznos: TFloatField
      FieldName = 'iznos'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampa2odobreno_1: TBooleanField
      FieldName = 'odobreno_1'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampa2username_2: TWideStringField
      FieldName = 'username_2'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object QPriznanicaStampa2datum_2: TDateTimeField
      FieldName = 'datum_2'
      ReadOnly = True
      Required = True
    end
    object QPriznanicaStampa2brojkomada: TIntegerField
      FieldName = 'brojkomada'
      ReadOnly = True
      Required = True
    end
  end
  object SPriznanicaStampa2: TDataSource
    DataSet = QPriznanicaStampa2
    Left = 152
    Top = 672
  end
  object frxDBPriznanicaStampa2: TfrxDBDataset
    UserName = 'frxDBPriznanicaStampa2'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'id_kupcigrupe=id_kupcigrupe'
      'Ime=Ime'
      'Prezime=Prezime'
      'JMBG=JMBG'
      'BrojLicne=BrojLicne'
      'KopijaLicne=KopijaLicne'
      'kontaktTelefon=kontaktTelefon'
      'Napomena=Napomena'
      'username=username'
      'datum=datum'
      'id_1=id_1'
      'id_kupca=id_kupca'
      'proizvod=proizvod'
      'cijena=cijena'
      'broj_rata=broj_rata'
      'id_velicine=id_velicine'
      'velicina=velicina'
      'popust=popust'
      'odobreno=odobreno'
      'username_1=username_1'
      'datum_1=datum_1'
      'id_2=id_2'
      'id_uplate=id_uplate'
      'id_prodaje=id_prodaje'
      'iznos=iznos'
      'odobreno_1=odobreno_1'
      'username_2=username_2'
      'datum_2=datum_2'
      'brojkomada=brojkomada')
    DataSource = SPriznanicaStampa2
    BCDToCurrency = False
    Left = 248
    Top = 672
  end
  object QDnevniIzvjestaj: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select * from'
      '(select '
      'kp.id as id_akcije,concat(kor.ime,'#39' '#39',kor.prezime) as Prodavac,'
      
        'case when k.id is null then '#39#39' else concat(k.ime,'#39' '#39',k.prezime) ' +
        'end as Kupac,'
      'kp.proizvod as Proizvod,'
      'kp.cijena as Cijena,'
      'kp.brojkomada as '#39'Broj komada'#39','
      'kp.velicina as Velicina,'
      'kp.popust as Popust,'
      #39'Kupovina'#39' as Akcija,'
      'case when kp.broj_rata>0 then '#39'Rate'#39' else '#39'Gotovina'#39' end as Tip,'
      '(kp.cijena-kp.cijena*kp.popust/100)*kp.brojkomada as Iznos,'
      'kp.odobreno,'
      'kp.datum'
      'from kupljeni_proizvodi kp'
      'left join kupci k'
      'on k.id = kp.id_kupca'
      'inner join korisnici kor'
      'on kp.id_prodavca = kor.id'
      'union all'
      'select '
      'ur.id as id_akcije,concat(kor.ime,'#39' '#39',kor.prezime) as Prodavac,'
      
        'case when k.id is null then '#39#39' else concat(k.ime,'#39' '#39',k.prezime) ' +
        'end as Kupac,'
      'kp.proizvod as Proizvod,'
      'kp.cijena as Cijena,'
      'kp.brojkomada as '#39'Broj komada'#39','
      'kp.velicina as Velicina,'
      'kp.popust as Popust,'
      #39'Uplata'#39' as Akcija,'
      #39'Rata'#39' as Tip,'
      'ur.iznos as Iznos,'
      'ur.odobreno,'
      'u.datum'
      'from uplate u'
      'left join kupci k'
      'on k.id = u.id_kupca'
      'inner join uplacene_rate ur'
      'on u.id = ur.id_uplate'
      'inner join korisnici kor'
      'on u.id_prodavca = kor.id'
      'inner join kupljeni_proizvodi kp'
      'on kp.id = ur.id_prodaje'
      ') a'
      'where '
      '(Akcija = '#39'Kupovina'#39' and Tip = '#39'Gotovina'#39')'
      'OR (Akcija = '#39'Kupovina'#39' and Tip = '#39'Rate'#39')'
      'OR (Akcija = '#39'Uplata'#39' and Tip = '#39'Rata'#39')'
      'and datum = '#39'2014-12-11'#39
      'order by datum')
    Left = 1248
    Top = 136
    object QDnevniIzvjestajProdavac: TWideStringField
      FieldName = 'Prodavac'
      Size = 101
    end
    object QDnevniIzvjestajKupac: TWideStringField
      FieldName = 'Kupac'
      Size = 101
    end
    object QDnevniIzvjestajProizvod: TWideStringField
      FieldName = 'Proizvod'
      Required = True
      Size = 50
    end
    object QDnevniIzvjestajCijena: TFloatField
      FieldName = 'Cijena'
      Required = True
    end
    object QDnevniIzvjestajBrojkomada: TIntegerField
      FieldName = 'Broj komada'
      Required = True
    end
    object QDnevniIzvjestajVelicina: TWideStringField
      FieldName = 'Velicina'
      Required = True
    end
    object QDnevniIzvjestajPopust: TFloatField
      FieldName = 'Popust'
      Required = True
    end
    object QDnevniIzvjestajAkcija: TWideStringField
      FieldName = 'Akcija'
      Required = True
      Size = 8
    end
    object QDnevniIzvjestajTip: TWideStringField
      FieldName = 'Tip'
      Required = True
      Size = 8
    end
    object QDnevniIzvjestajIznos: TFloatField
      FieldName = 'Iznos'
    end
    object QDnevniIzvjestajodobreno: TShortintField
      FieldName = 'odobreno'
      Required = True
    end
    object QDnevniIzvjestajdatum: TDateTimeField
      FieldName = 'datum'
      Required = True
    end
    object QDnevniIzvjestajid_akcije: TIntegerField
      FieldName = 'id_akcije'
      Required = True
    end
  end
  object SDnevniIzvjestaj: TDataSource
    DataSet = QDnevniIzvjestaj
    Left = 1328
    Top = 136
  end
  object QStatistika: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select a.*, a.duguje-a.potrazuje as Saldo from '
      '(select  '
      'ifnull(kg.naziv,'#39'(Gotovina)'#39') as Grupa,'
      
        'case when k.id is null then '#39#39' else concat(k.ime,'#39' '#39',k.prezime) ' +
        'end as Kupac, '
      'kp.datum,'
      '(kp.cijena-kp.cijena*kp.popust/100)*kp.brojkomada as Duguje,'
      
        'case when k.id is null then (kp.cijena-kp.cijena*kp.popust/100)*' +
        'kp.brojkomada else 0 end as Potrazuje'
      'from kupljeni_proizvodi kp '
      'left join kupci k '
      'on k.id = kp.id_kupca '
      'left join kupcigrupe kg'
      'on k.id_kupcigrupe = kg.id'
      'union all '
      'select  '
      'kg.naziv as Grupa,'
      
        'case when k.id is null then '#39#39' else concat(k.ime,'#39' '#39',k.prezime) ' +
        'end as Kupac, '
      'u.datum,'
      '0 as Duguje,'
      'ur.iznos as Potrazuje'
      'from uplate u '
      'left join kupci k '
      'on k.id = u.id_kupca '
      'inner join uplacene_rate ur '
      'on u.id = ur.id_uplate '
      'inner join kupcigrupe kg'
      'on k.id_kupcigrupe = kg.id'
      'inner join kupljeni_proizvodi kp '
      'on kp.id = ur.id_prodaje '
      ') a '
      'order by datum')
    Left = 1248
    Top = 192
    object QStatistikaGrupa: TWideStringField
      FieldName = 'Grupa'
      Required = True
      Size = 50
    end
    object QStatistikaKupac: TWideStringField
      FieldName = 'Kupac'
      Size = 101
    end
    object QStatistikadatum: TDateTimeField
      FieldName = 'datum'
      Required = True
    end
    object QStatistikaDuguje: TFloatField
      FieldName = 'Duguje'
    end
    object QStatistikaPotrazuje: TFloatField
      FieldName = 'Potrazuje'
    end
    object QStatistikaSaldo: TFloatField
      FieldName = 'Saldo'
      ReadOnly = True
    end
  end
  object SStatistika: TDataSource
    DataSet = QStatistika
    Left = 1328
    Top = 192
  end
  object QDugovanja: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select CONCAT(k.ime,'#39' '#39',k.prezime) as Kupac, Saldo'
      'from kupci k'
      'inner join'
      '('
      'select id_kupca, sum(saldo) as saldo from'
      '('
      'select -(cijena-cijena*popust/100)*brojkomada as saldo, id_kupca'
      'from kupljeni_proizvodi '
      'union all '
      'select iznos as saldo, kp.id_kupca'
      'from uplacene_rate ur'
      'inner join kupljeni_proizvodi kp'
      'on ur.id_prodaje = kp.id'
      ') tblSaldo'
      'group by id_kupca'
      ') us'
      'on k.id = us.id_kupca')
    Left = 1248
    Top = 256
    object QDugovanjaKupac: TWideStringField
      FieldName = 'Kupac'
      ReadOnly = True
      Size = 101
    end
    object QDugovanjaSaldo: TFloatField
      FieldName = 'Saldo'
    end
  end
  object SDugovanja: TDataSource
    DataSet = QDugovanja
    Left = 1328
    Top = 256
  end
  object QPreracunajLampiceOBSOLETE: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'update kupci k'
      'set indikator ='
      '('
      'select '
      '--'#9'id_kupca,'
      #9'case when ifnull(sum(saldo),0) <= 0 then 3 '
      '    '#9' when ifnull(datediff(curdate(),max(datum)),0) <= 50 then 0'
      
        '         when ifnull(datediff(curdate(),max(datum)),0) >= 50 and' +
        ' ifnull(datediff(curdate(),max(datum)),0) <= 75 then 1'
      #9#9' else 2 '
      '         end as lampica'
      'from'
      '('
      'select id_kupca,'
      '(cijena-cijena*popust/100)*brojkomada as saldo, '
      'date(datum) as datum, datum as dat'
      'from kupljeni_proizvodi '
      'union all '
      
        'select id_kupca,-iznos as saldo, date(ur.datum) as datum, ur.dat' +
        'um as dat '
      'from uplacene_rate ur'
      'inner join kupljeni_proizvodi kp'
      'on ur.id_prodaje = kp.id'
      'order by dat'
      ') a'
      'where id_kupca = k.id'
      ')')
    Left = 528
    Top = 16
  end
  object QPotrazivanjaPoGrupama: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select kg.Naziv as Grupa, sum(saldo) as Saldo'
      'from'
      '('
      'select id_kupca,'
      '(cijena-cijena*popust/100)*brojkomada as saldo, '
      'date(datum) as datum, datum as dat'
      'from kupljeni_proizvodi '
      'union all '
      
        'select id_kupca,-iznos as saldo, date(ur.datum) as datum, ur.dat' +
        'um as dat '
      'from uplacene_rate ur'
      'inner join kupljeni_proizvodi kp'
      'on ur.id_prodaje = kp.id'
      'order by dat'
      ') a'
      'inner join kupci k'
      'on a.id_kupca = k.id'
      'inner join kupcigrupe kg'
      'on k.id_kupcigrupe = kg.id'
      'where id_kupca != 0'
      'and a.datum = curdate()'
      'group by kg.id')
    Left = 1248
    Top = 317
    object QPotrazivanjaPoGrupamaGrupa: TWideStringField
      FieldName = 'Grupa'
      Required = True
      Size = 50
    end
    object QPotrazivanjaPoGrupamaSaldo: TFloatField
      FieldName = 'Saldo'
      ReadOnly = True
    end
  end
  object SPotrazivanjaPoGrupama: TDataSource
    DataSet = QPotrazivanjaPoGrupama
    Left = 1328
    Top = 317
  end
  object QPotrazivanjaPoLampicama: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select '
      'case when k.Indikator = 0 THEN '#39'Zelena'#39
      #9' when k.Indikator = 1 THEN '#39'Zuta'#39
      #9' when k.Indikator = 2 THEN '#39'Crvena'#39
      #9' when k.Indikator = 3 THEN '#39'Plava'#39' end'
      ' as Lampica, sum(saldo) as Saldo'
      'from'
      '('
      'select id_kupca,'
      '(cijena-cijena*popust/100)*brojkomada as saldo, '
      'date(datum) as datum, datum as dat'
      'from kupljeni_proizvodi '
      'union all '
      
        'select id_kupca,-iznos as saldo, date(ur.datum) as datum, ur.dat' +
        'um as dat '
      'from uplacene_rate ur'
      'inner join kupljeni_proizvodi kp'
      'on ur.id_prodaje = kp.id'
      'order by dat'
      ') a'
      'inner join kupci k'
      'on a.id_kupca = k.id'
      'where id_kupca != 0'
      'group by k.indikator')
    Left = 1248
    Top = 376
    object QPotrazivanjaPoLampicamaLampica: TWideStringField
      FieldName = 'Lampica'
      ReadOnly = True
      Size = 6
    end
    object QPotrazivanjaPoLampicamaSaldo: TFloatField
      FieldName = 'Saldo'
      ReadOnly = True
    end
  end
  object SPotrazivanjaPoLampicama: TDataSource
    DataSet = QPotrazivanjaPoLampicama
    Left = 1328
    Top = 376
  end
  object QProdajaPoGrupama: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select kg.Naziv as Grupa, sum(saldo) as Saldo'
      'from'
      '('
      'select id_kupca,'
      '(cijena-cijena*popust/100)*brojkomada as saldo, '
      'date(datum) as datum, datum as dat'
      'from kupljeni_proizvodi '
      ') a'
      'inner join kupci k'
      'on a.id_kupca = k.id'
      'inner join kupcigrupe kg'
      'on k.id_kupcigrupe = kg.id'
      'where id_kupca != 0'
      'group by kg.id')
    Left = 1248
    Top = 429
    object WideStringField4: TWideStringField
      FieldName = 'Grupa'
      Required = True
      Size = 50
    end
    object FloatField3: TFloatField
      FieldName = 'Saldo'
      ReadOnly = True
    end
  end
  object SProdajaPoGrupama: TDataSource
    DataSet = QProdajaPoGrupama
    Left = 1328
    Top = 429
  end
  object QProdajaPoLampicama: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select '
      'case when k.Indikator = 0 THEN '#39'Zelena'#39
      #9' when k.Indikator = 1 THEN '#39'Zuta'#39
      #9' when k.Indikator = 2 THEN '#39'Crvena'#39
      #9' when k.Indikator = 3 THEN '#39'Plava'#39' end'
      ' as Lampica, sum(saldo) as Saldo'
      'from'
      '('
      'select id_kupca,'
      '(cijena-cijena*popust/100)*brojkomada as saldo, '
      'date(datum) as datum, datum as dat'
      'from kupljeni_proizvodi '
      ') a'
      'inner join kupci k'
      'on a.id_kupca = k.id'
      'where id_kupca != 0'
      'group by k.indikator')
    Left = 1248
    Top = 488
    object WideStringField5: TWideStringField
      FieldName = 'Lampica'
      ReadOnly = True
      Size = 6
    end
    object FloatField4: TFloatField
      FieldName = 'Saldo'
      ReadOnly = True
    end
  end
  object SProdajaPoLampicama: TDataSource
    DataSet = QProdajaPoLampicama
    Left = 1328
    Top = 488
  end
  object QProdajaPoProdavacu: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select kor.Username, sum(saldo) as Saldo'
      'from'
      '('
      'select id_kupca,'
      '(cijena-cijena*popust/100)*brojkomada as saldo, '
      'date(datum) as datum, datum as dat, id_prodavca'
      'from kupljeni_proizvodi '
      ') a'
      'inner join korisnici kor'
      'on a.id_prodavca = kor.id'
      'where id_kupca != 0'
      'group by kor.Username')
    Left = 1248
    Top = 544
    object QProdajaPoProdavacuUsername: TWideStringField
      FieldName = 'Username'
      Required = True
      Size = 50
    end
    object QProdajaPoProdavacuSaldo: TFloatField
      FieldName = 'Saldo'
      ReadOnly = True
    end
  end
  object SProdajaPoProdavacu: TDataSource
    DataSet = QProdajaPoProdavacu
    Left = 1328
    Top = 544
  end
  object QUplacenoPoGrupama: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select kg.Naziv as Grupa, sum(saldo) as Saldo'
      'from'
      '('
      
        'select id_kupca,iznos as saldo, date(ur.datum) as datum, ur.datu' +
        'm as dat '
      'from uplacene_rate ur'
      'inner join kupljeni_proizvodi kp'
      'on ur.id_prodaje = kp.id'
      'order by dat'
      ') a'
      'inner join kupci k'
      'on a.id_kupca = k.id'
      'inner join kupcigrupe kg'
      'on k.id_kupcigrupe = kg.id'
      'where id_kupca != 0'
      'group by kg.id')
    Left = 1248
    Top = 661
    object WideStringField6: TWideStringField
      FieldName = 'Grupa'
      Required = True
      Size = 50
    end
    object FloatField5: TFloatField
      FieldName = 'Saldo'
      ReadOnly = True
    end
  end
  object SUplacenoPoGrupama: TDataSource
    DataSet = QUplacenoPoGrupama
    Left = 1328
    Top = 661
  end
  object QUplacenoPoLampicama: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select '
      'case when k.Indikator = 0 THEN '#39'Zelena'#39
      #9' when k.Indikator = 1 THEN '#39'Zuta'#39
      #9' when k.Indikator = 2 THEN '#39'Crvena'#39
      #9' when k.Indikator = 3 THEN '#39'Plava'#39' end'
      ' as Lampica, sum(saldo) as Saldo'
      'from'
      '('
      
        'select id_kupca,iznos as saldo, date(ur.datum) as datum, ur.datu' +
        'm as dat '
      'from uplacene_rate ur'
      'inner join kupljeni_proizvodi kp'
      'on ur.id_prodaje = kp.id'
      'order by dat'
      ') a'
      'inner join kupci k'
      'on a.id_kupca = k.id'
      'where id_kupca != 0'
      'group by k.indikator')
    Left = 1248
    Top = 720
    object WideStringField7: TWideStringField
      FieldName = 'Lampica'
      ReadOnly = True
      Size = 6
    end
    object FloatField6: TFloatField
      FieldName = 'Saldo'
      ReadOnly = True
    end
  end
  object SUplacenoPoLampicama: TDataSource
    DataSet = QUplacenoPoLampicama
    Left = 1328
    Top = 720
  end
  object QKupciPoLampicama: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select l.naziv as Lampica,count(l.id) as Broj'
      'from lampice l'
      'inner join kupci k'
      'on l.id = k.indikator'
      'group by l.naziv'
      'order by l.id')
    Left = 1248
    Top = 776
    object QKupciPoLampicamaLampica: TWideStringField
      FieldName = 'Lampica'
    end
    object QKupciPoLampicamaBroj: TLargeintField
      FieldName = 'Broj'
      ReadOnly = True
      Required = True
    end
  end
  object SKupciPoLampicama: TDataSource
    DataSet = QKupciPoLampicama
    Left = 1328
    Top = 776
  end
  object QPodesiLampice: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'update '
      'kupci k'
      'inner join'
      '('
      'select '
      #9'id_kupca,'
      #9'ifnull(sum(-saldo),0) as dug, '
      #9'ifnull(datediff(curdate(),max(datum)),0) as brojDana '
      'from '
      '(select  '
      #9'-(cijena-cijena*popust/100)*brojkomada as saldo,'
      #9'date(datum) as datum, datum as dat, id_kupca'
      #9'from kupljeni_proizvodi  '
      #9'union all  '
      
        #9'select ur.iznos as saldo, date(ur.datum) as datum, ur.datum as ' +
        'dat, kp.id_kupca'
      #9'from uplacene_rate ur'
      #9'inner join kupljeni_proizvodi kp'
      #9'on ur.id_prodaje = kp.id) kupovine_i_uplate'
      'group by id_kupca'
      ') d'
      'on k.id = d.id_kupca'
      'inner join '
      '('
      'select id_kupca, max(brojDana) as brojDana'
      'from'
      '('
      'select '#9'kp.id,'
      '        ifnull(datediff(curdate(),max(kp.datum)),0) as brojDana,'
      '        kp.datum,'
      
        '        kp.cijena-kp.cijena*kp.popust/100 - sum(ifnull(ur.iznos,' +
        '0)) as saldo,'
      '        id_kupca'
      'from kupljeni_proizvodi kp'
      'left join uplacene_rate ur'
      'on kp.id = ur.id_prodaje'
      'where id_kupca != 0'
      'group by kp.id) a'
      'where a.saldo > 0'
      'group by id_kupca'
      ') neotplaceneKupovine'
      'on k.id = neotplaceneKupovine.id_kupca'
      'set k.indikator =   case '
      #9#9#9#9#9'when d.dug<=0 then 3      '
      
        '                    when neotplaceneKupovine.brojDana > 165 then' +
        ' 2'
      
        '                    when neotplaceneKupovine.brojDana between 13' +
        '5 and 165 then'
      '                    '#9'case '
      
        '                        when d.brojDana >50 and d.brojDana <75 t' +
        'hen 1'
      '                        else 2'
      #9'                    end               '
      '                    when d.brojDana<=50 then 0'
      
        '                    when d.brojDana >50 and d.brojDana <75 then ' +
        '1'
      '                    else 2'
      '                    end;')
    Left = 1248
    Top = 968
  end
  object QProdajePoGrupamaKupaca: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      
        'select k.ime,k.prezime,kp.datum, kp.proizvod, (cijena-cijena*pop' +
        'ust/100)*brojkomada as cijena'
      'from kupljeni_proizvodi kp'
      'inner join kupci k'
      'on kp.id_kupca = k.id'
      'inner join kupcigrupe kg'
      'on k.id_kupcigrupe = kg.id')
    Left = 1248
    Top = 840
    object QProdajePoGrupamaKupacadatum: TDateTimeField
      FieldName = 'datum'
      Required = True
    end
    object QProdajePoGrupamaKupacaproizvod: TWideStringField
      FieldName = 'proizvod'
      Required = True
      Size = 50
    end
    object QProdajePoGrupamaKupacacijena: TFloatField
      FieldName = 'cijena'
      ReadOnly = True
    end
    object QProdajePoGrupamaKupacaime: TWideStringField
      FieldName = 'ime'
      Required = True
      Size = 50
    end
    object QProdajePoGrupamaKupacaprezime: TWideStringField
      FieldName = 'prezime'
      Required = True
      Size = 50
    end
  end
  object SProdajePoGrupamaKupaca: TDataSource
    DataSet = QProdajePoGrupamaKupaca
    Left = 1328
    Top = 840
  end
  object QUplateRate2: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      
        'select sum(saldo) as saldo, sum(preostalidug) as preostali, sum(' +
        'duguvaluti) as uvaluti from'
      '('
      
        'select proizvod,(cijena-cijena*popust/100)*brojkomada as duguje,' +
        ' 0 as  potrazuje,-(cijena-cijena*popust/100)*brojkomada as saldo' +
        ', date(datum) as datum, datum as dat, '
      
        'case when ifnull(datediff(curdate(),datum),0) > 165 then  -(cije' +
        'na-cijena*popust/100)*brojkomada else 0 end as preostalidug, '
      
        'case when ifnull(datediff(curdate(),datum),0) <= 165 then  -(cij' +
        'ena-cijena*popust/100)*brojkomada else 0 end as duguvaluti '
      'from kupljeni_proizvodi  '
      'where id_kupca=13'
      'union all  '
      
        'select '#39#39',0 as duguje,iznos as potrazuje, iznos as saldo, date(d' +
        'atum) as datum, datum as dat, '
      
        'case when id_prodaje in (select id from kupljeni_proizvodi where' +
        '  ifnull(datediff(curdate(),datum),0) > 165) then iznos else 0 e' +
        'nd as preostalidug, '
      
        'case when id_prodaje not in (select id from kupljeni_proizvodi w' +
        'here  ifnull(datediff(curdate(),datum),0) > 165) then iznos else' +
        ' 0 end as duguvaluti '
      'from uplacene_rate  '
      
        'where id_prodaje in (select id from kupljeni_proizvodi where id_' +
        'kupca=13)  '
      'order by dat '
      ')'
      'a')
    Left = 736
    Top = 632
    object QUplateRate2saldo: TFloatField
      FieldName = 'saldo'
      ReadOnly = True
    end
    object QUplateRate2preostali: TFloatField
      FieldName = 'preostali'
      ReadOnly = True
    end
    object QUplateRate2uvaluti: TFloatField
      FieldName = 'uvaluti'
      ReadOnly = True
    end
  end
  object SUplateRate2: TDataSource
    DataSet = QUplateRate2
    Left = 816
    Top = 632
  end
  object QKupciPoLampicamaDetalji: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      
        'select k.Ime, k.Prezime, kg.Naziv as Grupa, k.kontaktTelefon as ' +
        #39'Broj telefona'#39',tb_saldo.saldo as saldo'
      'from kupci k'
      'inner join lampice l'
      'on k.indikator = l.id'
      'inner join kupcigrupe kg'
      'on k.id_kupcigrupe = kg.id'
      'inner join ('
      'select sum(saldo) as saldo, id_kupca from '
      '('
      
        'select sum(-(cijena-cijena*popust/100)*brojkomada) as saldo, id_' +
        'kupca'
      'from kupljeni_proizvodi  '
      'group by id_kupca'
      'union all  '
      'select SUM(iznos) as saldo, id_kupca'
      'from uplacene_rate u'
      'inner join kupljeni_proizvodi kp'
      'on u.id_prodaje = kp.id'
      'group by id_kupca'
      ') tb_saldo'
      'group by id_kupca'
      ') tb_saldo'
      'on k.id = tb_saldo.id_kupca'
      'where l.naziv = '#39'crvena'#39)
    Left = 1248
    Top = 904
    object QKupciPoLampicamaDetaljiIme: TWideStringField
      FieldName = 'Ime'
      Required = True
      Size = 50
    end
    object QKupciPoLampicamaDetaljiPrezime: TWideStringField
      FieldName = 'Prezime'
      Required = True
      Size = 50
    end
    object QKupciPoLampicamaDetaljiGrupa: TWideStringField
      FieldName = 'Grupa'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object QKupciPoLampicamaDetaljiBrojtelefona: TWideStringField
      FieldName = 'Broj telefona'
      Required = True
      Size = 50
    end
    object QKupciPoLampicamaDetaljisaldo: TFloatField
      FieldName = 'saldo'
      ReadOnly = True
    end
  end
  object SKupciPoLampicamaDetalji: TDataSource
    DataSet = QKupciPoLampicamaDetalji
    Left = 1328
    Top = 904
  end
  object QProdajaPoProdavacuAnaliza: TUniQuery
    Connection = connMySQL
    SQL.Strings = (
      'select concat(k.Ime,'#39' '#39',k.prezime) as Kupac, kp.Proizvod,'
      'kp.Cijena,kp.brojkomada,kp.Velicina,kp.Popust,kp.Datum'
      'from kupljeni_proizvodi kp'
      'inner join korisnici kor'
      'on kp.id_prodavca = kor.id'
      'inner join kupci k'
      'on k.id = kp.id_kupca')
    Left = 1248
    Top = 600
    object QProdajaPoProdavacuAnalizaKupac: TWideStringField
      FieldName = 'Kupac'
      ReadOnly = True
      Size = 101
    end
    object QProdajaPoProdavacuAnalizaProizvod: TWideStringField
      FieldName = 'Proizvod'
      Required = True
      Size = 50
    end
    object QProdajaPoProdavacuAnalizaCijena: TFloatField
      FieldName = 'Cijena'
      Required = True
    end
    object QProdajaPoProdavacuAnalizabrojkomada: TIntegerField
      FieldName = 'brojkomada'
      Required = True
    end
    object QProdajaPoProdavacuAnalizaVelicina: TWideStringField
      FieldName = 'Velicina'
      Required = True
    end
    object QProdajaPoProdavacuAnalizaPopust: TFloatField
      FieldName = 'Popust'
      Required = True
    end
    object QProdajaPoProdavacuAnalizaDatum: TDateTimeField
      FieldName = 'Datum'
      Required = True
    end
  end
  object SProdajaPoProdavacuAnaliza: TDataSource
    DataSet = QProdajaPoProdavacuAnaliza
    Left = 1328
    Top = 600
  end
  object Import_artikala: TUniScript
    SQL.Strings = (
      
        'INSERT INTO `artmodeli` (`id`, `id_grupe`, `model`, `cijena`, `i' +
        'd_rastera`) VALUES '
      '  (2001, 1, '#39'B23912'#39', 28, 1),'
      '  (2002, 1, '#39'B23903'#39', 35, 1),'
      '  (2003, 1, '#39'B23908'#39', 39, 1),'
      '  (2004, 1, '#39'B23902'#39', 35, 1),'
      '  (2005, 1, '#39'F76458'#39', 42, 1),'
      '  (2006, 1, '#39'D68703'#39', 59, 1),'
      '  (2007, 1, '#39'D68710'#39', 55, 1),'
      '  (2008, 1, '#39'S83321'#39', 45, 1),'
      '  (2009, 1, '#39'F98506'#39', 49, 1),'
      '  (2010, 1, '#39'D69659'#39', 55, 1),'
      '  (2011, 1, '#39'D68711'#39', 55, 1),'
      '  (2012, 1, '#39'F98530'#39', 42, 1),'
      '  (2013, 1, '#39'D68705'#39', 59, 1),'
      '  (2014, 1, '#39'D68702'#39', 59, 1),'
      '  (2015, 1, '#39'D69655'#39', 55, 1),'
      '  (2016, 1, '#39'F98811'#39', 65, 1),'
      '  (2017, 1, '#39'F98855'#39', 69, 1),'
      '  (2018, 1, '#39'F98810'#39', 65, 1),'
      '  (2019, 1, '#39'F98895'#39', 69, 1),'
      '  (2020, 1, '#39'F98857'#39', 69, 1),'
      '  (2021, 1, '#39'D68664'#39', 69, 1),'
      '  (2022, 1, '#39'F98289'#39', 75, 1),'
      '  (2023, 1, '#39'D69456'#39', 69, 1),'
      '  (2024, 1, '#39'S85595'#39', 69, 1),'
      '  (2025, 1, '#39'F98325'#39', 69, 1),'
      '  (2026, 1, '#39'B33550'#39', 65, 1),'
      '  (2027, 1, '#39'D68675'#39', 65, 1),'
      '  (2028, 1, '#39'D68674'#39', 65, 1),'
      '  (2029, 1, '#39'B24856'#39', 95, 1),'
      '  (2030, 1, '#39'B33561'#39', 65, 1),'
      '  (2031, 1, '#39'S83322'#39', 45, 1),'
      '  (2032, 1, '#39'F98648'#39', 79, 1),'
      '  (2033, 1, '#39'F98856'#39', 69, 1),'
      '  (2034, 4, '#39'102081'#39', 100, 1),'
      '  (2035, 4, '#39'102083'#39', 100, 1),'
      '  (2036, 4, '#39'308108'#39', 130, 1),'
      '  (2037, 4, '#39'718978'#39', 120, 1),'
      '  (2038, 4, '#39'718979'#39', 120, 1),'
      '  (2039, 4, '#39'708190'#39', 140, 1),'
      '  (2040, 4, '#39'714603'#39', 115, 1),'
      '  (2041, 6, '#39'DW3507-05'#39', 84, 1),'
      '  (2042, 6, '#39'DW4508-02'#39', 84, 1),'
      '  (2043, 6, '#39'DW3507-14'#39', 84, 1),'
      '  (2044, 6, '#39'DW3507-02'#39', 84, 1),'
      '  (2045, 6, '#39'DW3507-09'#39', 84, 1),'
      '  (2046, 6, '#39'DW3507-24'#39', 89, 1),'
      '  (2047, 6, '#39'DW3261-01'#39', 94, 1),'
      '  (2048, 6, '#39'AMAIA'#39', 79, 1),'
      '  (2049, 10, '#39'SPM0035DB4'#39', 99, 1),'
      '  (2050, 10, '#39'SPM0008DB4'#39', 99, 1),'
      '  (2051, 11, '#39'S30395-2272'#39', 37, 1),'
      '  (2052, 11, '#39'S30392-006'#39', 37, 1),'
      '  (2053, 11, '#39'S30395-2504'#39', 37, 1),'
      '  (2054, 11, '#39'S30392-2175'#39', 37, 1),'
      '  (2055, 12, '#39'ULTIMATE R.2 BO'#39', 39, 1),'
      '  (2056, 12, '#39'ULTIMATE R.3 BO'#39', 39, 1),'
      '  (2057, 12, '#39'S90224'#39', 17, 1),'
      '  (2058, 12, '#39'SC2487-838'#39', 17, 1),'
      '  (2059, 12, '#39'SC2736-010'#39', 18, 1),'
      '  (2060, 13, '#39'9040'#39', 69, 1),'
      '  (2061, 13, '#39'1505'#39', 59, 1),'
      '  (2062, 14, '#39'652965-424'#39', 42, 1),'
      '  (2063, 14, '#39'407759-065'#39', 95, 1),'
      '  (2064, 14, '#39'407626-065'#39', 95, 1),'
      '  (2065, 14, '#39'407626-065'#39', 95, 1),'
      '  (2066, 14, '#39'653675-411'#39', 58, 1),'
      '  (2067, 14, '#39'653692-818'#39', 58, 1),'
      '  (2068, 14, '#39'705477-006'#39', 58, 1),'
      '  (2069, 14, '#39'641893-014'#39', 74, 1),'
      '  (2070, 14, '#39'629993-441'#39', 127, 1),'
      '  (2071, 14, '#39'685139-012'#39', 74, 1),'
      '  (2072, 14, '#39'724940-401'#39', 63, 1),'
      '  (2073, 14, '#39'704922-600'#39', 79, 1),'
      '  (2074, 17, '#39'AB1062'#39', 35, 1),'
      '  (2075, 17, '#39'AB1124'#39', 29, 1),'
      '  (2076, 17, '#39'AB1128'#39', 25, 1),'
      '  (2077, 17, '#39'AB1131'#39', 25, 1),'
      '  (2078, 17, '#39'AB6753'#39', 25, 1),'
      '  (2079, 17, '#39'AB2666'#39', 25, 1),'
      '  (2080, 17, '#39'BA4862-001'#39', 32, 1),'
      '  (2081, 17, '#39'BA4862-616'#39', 32, 1),'
      '  (2082, 17, '#39'BA4863-001'#39', 26, 1),'
      '  (2083, 17, '#39'BA4863-077'#39', 26, 1),'
      '  (2084, 17, '#39'BA4863-433'#39', 26, 1),'
      '  (2085, 17, '#39'BA4863-487'#39', 26, 1),'
      '  (2086, 17, '#39'BA4864-001'#39', 26, 1),'
      '  (2087, 17, '#39'EQB153102-05'#39', 29, 1),'
      '  (2088, 17, '#39'EQB153102-08'#39', 29, 1),'
      '  (2089, 18, '#39'V62896'#39', 35, 1),'
      '  (2090, 19, '#39'64517'#39', 85, 1),'
      '  (2091, 19, '#39'64521'#39', 100, 1),'
      '  (2092, 19, '#39'64593'#39', 100, 1),'
      '  (2093, 19, '#39'12016'#39', 70, 1),'
      '  (2094, 19, '#39'12016'#39', 70, 1),'
      '  (2095, 19, '#39'47971'#39', 60, 1),'
      '  (2096, 19, '#39'48357'#39', 65, 1),'
      '  (2097, 19, '#39'84301L'#39', 55, 1),'
      '  (2098, 19, '#39'84301L'#39', 55, 1),'
      '  (2099, 19, '#39'12013'#39', 60, 1),'
      '  (2100, 19, '#39'12111'#39', 75, 1),'
      '  (2101, 19, '#39'12111'#39', 75, 1),'
      '  (2102, 19, '#39'51480'#39', 75, 1),'
      '  (2103, 19, '#39'51480'#39', 75, 1),'
      '  (2104, 21, '#39'10282'#39', 62, 1),'
      '  (2105, 21, '#39'10283'#39', 62, 1),'
      '  (2106, 21, '#39'10292'#39', 44, 1),'
      '  (2107, 21, '#39'10293'#39', 44, 1),'
      '  (2108, 21, '#39'10320A'#39', 59, 1),'
      '  (2109, 21, '#39'10324'#39', 44, 1),'
      '  (2110, 21, '#39'10355'#39', 59, 1),'
      '  (2111, 21, '#39'10357'#39', 53, 1),'
      '  (2112, 21, '#39'10365'#39', 73, 1),'
      '  (2113, 21, '#39'10368'#39', 57, 1),'
      '  (2114, 21, '#39'10374'#39', 73, 1),'
      '  (2115, 21, '#39'10375'#39', 73, 1),'
      '  (2116, 21, '#39'10389'#39', 59, 1),'
      '  (2117, 21, '#39'10391'#39', 59, 1),'
      '  (2118, 21, '#39'10470'#39', 55, 1),'
      '  (2119, 21, '#39'10471'#39', 55, 1),'
      '  (2120, 21, '#39'10472'#39', 69, 1),'
      '  (2121, 21, '#39'10474'#39', 69, 1),'
      '  (2122, 21, '#39'10490A'#39', 74, 1),'
      '  (2123, 21, '#39'10494'#39', 54, 1),'
      '  (2124, 21, '#39'10498'#39', 54, 1),'
      '  (2125, 21, '#39'10499'#39', 54, 1),'
      '  (2126, 23, '#39'9020'#39', 59, 1),'
      '  (2127, 23, '#39'9015'#39', 59, 1),'
      '  (2128, 23, '#39'520'#39', 73, 1),'
      '  (2129, 23, '#39'526'#39', 59, 1),'
      '  (2130, 23, '#39'149'#39', 64, 1),'
      '  (2131, 23, '#39'527'#39', 63, 1),'
      '  (2132, 23, '#39'524'#39', 63, 1),'
      '  (2133, 23, '#39'993'#39', 98, 1),'
      '  (2134, 23, '#39'999'#39', 98, 1),'
      '  (2135, 23, '#39'1019'#39', 98, 1),'
      '  (2136, 23, '#39'1025'#39', 69, 1),'
      '  (2137, 23, '#39'1032'#39', 69, 1),'
      '  (2138, 23, '#39'LH22211'#39', 49, 1);'
      ''
      
        'INSERT INTO `artmodelidetalji` (`id_modela`, `velicina`, `brojko' +
        'mada`, `barkod`) VALUES '
      '  (2001, '#39'40'#39', 7, '#39#39'),'
      '  (2001, '#39'41'#39', 0, '#39#39'),'
      '  (2001, '#39'42'#39', 0, '#39#39'),'
      '  (2001, '#39'43'#39', 0, '#39#39'),'
      '  (2001, '#39'44'#39', 0, '#39#39'),'
      '  (2001, '#39'45'#39', 0, '#39#39'),'
      '  (2001, '#39'46'#39', 0, '#39#39'),'
      '  (2001, '#39'47'#39', 0, '#39#39'),'
      '  (2002, '#39'40'#39', 6, '#39#39'),'
      '  (2002, '#39'41'#39', 0, '#39#39'),'
      '  (2002, '#39'42'#39', 0, '#39#39'),'
      '  (2002, '#39'43'#39', 0, '#39#39'),'
      '  (2002, '#39'44'#39', 0, '#39#39'),'
      '  (2002, '#39'45'#39', 0, '#39#39'),'
      '  (2002, '#39'46'#39', 0, '#39#39'),'
      '  (2002, '#39'47'#39', 0, '#39#39'),'
      '  (2003, '#39'40'#39', 3, '#39#39'),'
      '  (2003, '#39'41'#39', 0, '#39#39'),'
      '  (2003, '#39'42'#39', 0, '#39#39'),'
      '  (2003, '#39'43'#39', 0, '#39#39'),'
      '  (2003, '#39'44'#39', 0, '#39#39'),'
      '  (2003, '#39'45'#39', 0, '#39#39'),'
      '  (2003, '#39'46'#39', 0, '#39#39'),'
      '  (2003, '#39'47'#39', 0, '#39#39'),'
      '  (2004, '#39'40'#39', 8, '#39#39'),'
      '  (2004, '#39'41'#39', 0, '#39#39'),'
      '  (2004, '#39'42'#39', 0, '#39#39'),'
      '  (2004, '#39'43'#39', 0, '#39#39'),'
      '  (2004, '#39'44'#39', 0, '#39#39'),'
      '  (2004, '#39'45'#39', 0, '#39#39'),'
      '  (2004, '#39'46'#39', 0, '#39#39'),'
      '  (2004, '#39'47'#39', 0, '#39#39'),'
      '  (2005, '#39'40'#39', 9, '#39#39'),'
      '  (2005, '#39'41'#39', 0, '#39#39'),'
      '  (2005, '#39'42'#39', 0, '#39#39'),'
      '  (2005, '#39'43'#39', 0, '#39#39'),'
      '  (2005, '#39'44'#39', 0, '#39#39'),'
      '  (2005, '#39'45'#39', 0, '#39#39'),'
      '  (2005, '#39'46'#39', 0, '#39#39'),'
      '  (2005, '#39'47'#39', 0, '#39#39'),'
      '  (2006, '#39'40'#39', 3, '#39#39'),'
      '  (2006, '#39'41'#39', 0, '#39#39'),'
      '  (2006, '#39'42'#39', 0, '#39#39'),'
      '  (2006, '#39'43'#39', 0, '#39#39'),'
      '  (2006, '#39'44'#39', 0, '#39#39'),'
      '  (2006, '#39'45'#39', 0, '#39#39'),'
      '  (2006, '#39'46'#39', 0, '#39#39'),'
      '  (2006, '#39'47'#39', 0, '#39#39'),'
      '  (2007, '#39'40'#39', 11, '#39#39'),'
      '  (2007, '#39'41'#39', 0, '#39#39'),'
      '  (2007, '#39'42'#39', 0, '#39#39'),'
      '  (2007, '#39'43'#39', 0, '#39#39'),'
      '  (2007, '#39'44'#39', 0, '#39#39'),'
      '  (2007, '#39'45'#39', 0, '#39#39'),'
      '  (2007, '#39'46'#39', 0, '#39#39'),'
      '  (2007, '#39'47'#39', 0, '#39#39'),'
      '  (2008, '#39'40'#39', 5, '#39#39'),'
      '  (2008, '#39'41'#39', 0, '#39#39'),'
      '  (2008, '#39'42'#39', 0, '#39#39'),'
      '  (2008, '#39'43'#39', 0, '#39#39'),'
      '  (2008, '#39'44'#39', 0, '#39#39'),'
      '  (2008, '#39'45'#39', 0, '#39#39'),'
      '  (2008, '#39'46'#39', 0, '#39#39'),'
      '  (2008, '#39'47'#39', 0, '#39#39'),'
      '  (2009, '#39'40'#39', 3, '#39#39'),'
      '  (2009, '#39'41'#39', 0, '#39#39'),'
      '  (2009, '#39'42'#39', 0, '#39#39'),'
      '  (2009, '#39'43'#39', 0, '#39#39'),'
      '  (2009, '#39'44'#39', 0, '#39#39'),'
      '  (2009, '#39'45'#39', 0, '#39#39'),'
      '  (2009, '#39'46'#39', 0, '#39#39'),'
      '  (2009, '#39'47'#39', 0, '#39#39'),'
      '  (2010, '#39'40'#39', 5, '#39#39'),'
      '  (2010, '#39'41'#39', 0, '#39#39'),'
      '  (2010, '#39'42'#39', 0, '#39#39'),'
      '  (2010, '#39'43'#39', 0, '#39#39'),'
      '  (2010, '#39'44'#39', 0, '#39#39'),'
      '  (2010, '#39'45'#39', 0, '#39#39'),'
      '  (2010, '#39'46'#39', 0, '#39#39'),'
      '  (2010, '#39'47'#39', 0, '#39#39'),'
      '  (2011, '#39'40'#39', 11, '#39#39'),'
      '  (2011, '#39'41'#39', 0, '#39#39'),'
      '  (2011, '#39'42'#39', 0, '#39#39'),'
      '  (2011, '#39'43'#39', 0, '#39#39'),'
      '  (2011, '#39'44'#39', 0, '#39#39'),'
      '  (2011, '#39'45'#39', 0, '#39#39'),'
      '  (2011, '#39'46'#39', 0, '#39#39'),'
      '  (2011, '#39'47'#39', 0, '#39#39'),'
      '  (2012, '#39'40'#39', 5, '#39#39'),'
      '  (2012, '#39'41'#39', 0, '#39#39'),'
      '  (2012, '#39'42'#39', 0, '#39#39'),'
      '  (2012, '#39'43'#39', 0, '#39#39'),'
      '  (2012, '#39'44'#39', 0, '#39#39'),'
      '  (2012, '#39'45'#39', 0, '#39#39'),'
      '  (2012, '#39'46'#39', 0, '#39#39'),'
      '  (2012, '#39'47'#39', 0, '#39#39'),'
      '  (2013, '#39'40'#39', 10, '#39#39'),'
      '  (2013, '#39'41'#39', 0, '#39#39'),'
      '  (2013, '#39'42'#39', 0, '#39#39'),'
      '  (2013, '#39'43'#39', 0, '#39#39'),'
      '  (2013, '#39'44'#39', 0, '#39#39'),'
      '  (2013, '#39'45'#39', 0, '#39#39'),'
      '  (2013, '#39'46'#39', 0, '#39#39'),'
      '  (2013, '#39'47'#39', 0, '#39#39'),'
      '  (2014, '#39'40'#39', 21, '#39#39'),'
      '  (2014, '#39'41'#39', 0, '#39#39'),'
      '  (2014, '#39'42'#39', 0, '#39#39'),'
      '  (2014, '#39'43'#39', 0, '#39#39'),'
      '  (2014, '#39'44'#39', 0, '#39#39'),'
      '  (2014, '#39'45'#39', 0, '#39#39'),'
      '  (2014, '#39'46'#39', 0, '#39#39'),'
      '  (2014, '#39'47'#39', 0, '#39#39'),'
      '  (2015, '#39'40'#39', 17, '#39#39'),'
      '  (2015, '#39'41'#39', 0, '#39#39'),'
      '  (2015, '#39'42'#39', 0, '#39#39'),'
      '  (2015, '#39'43'#39', 0, '#39#39'),'
      '  (2015, '#39'44'#39', 0, '#39#39'),'
      '  (2015, '#39'45'#39', 0, '#39#39'),'
      '  (2015, '#39'46'#39', 0, '#39#39'),'
      '  (2015, '#39'47'#39', 0, '#39#39'),'
      '  (2016, '#39'40'#39', 9, '#39#39'),'
      '  (2016, '#39'41'#39', 0, '#39#39'),'
      '  (2016, '#39'42'#39', 0, '#39#39'),'
      '  (2016, '#39'43'#39', 0, '#39#39'),'
      '  (2016, '#39'44'#39', 0, '#39#39'),'
      '  (2016, '#39'45'#39', 0, '#39#39'),'
      '  (2016, '#39'46'#39', 0, '#39#39'),'
      '  (2016, '#39'47'#39', 0, '#39#39'),'
      '  (2017, '#39'40'#39', 4, '#39#39'),'
      '  (2017, '#39'41'#39', 0, '#39#39'),'
      '  (2017, '#39'42'#39', 0, '#39#39'),'
      '  (2017, '#39'43'#39', 0, '#39#39'),'
      '  (2017, '#39'44'#39', 0, '#39#39'),'
      '  (2017, '#39'45'#39', 0, '#39#39'),'
      '  (2017, '#39'46'#39', 0, '#39#39'),'
      '  (2017, '#39'47'#39', 0, '#39#39'),'
      '  (2018, '#39'40'#39', 9, '#39#39'),'
      '  (2018, '#39'41'#39', 0, '#39#39'),'
      '  (2018, '#39'42'#39', 0, '#39#39'),'
      '  (2018, '#39'43'#39', 0, '#39#39'),'
      '  (2018, '#39'44'#39', 0, '#39#39'),'
      '  (2018, '#39'45'#39', 0, '#39#39'),'
      '  (2018, '#39'46'#39', 0, '#39#39'),'
      '  (2018, '#39'47'#39', 0, '#39#39'),'
      '  (2019, '#39'40'#39', 11, '#39#39'),'
      '  (2019, '#39'41'#39', 0, '#39#39'),'
      '  (2019, '#39'42'#39', 0, '#39#39'),'
      '  (2019, '#39'43'#39', 0, '#39#39'),'
      '  (2019, '#39'44'#39', 0, '#39#39'),'
      '  (2019, '#39'45'#39', 0, '#39#39'),'
      '  (2019, '#39'46'#39', 0, '#39#39'),'
      '  (2019, '#39'47'#39', 0, '#39#39'),'
      '  (2020, '#39'40'#39', 16, '#39#39'),'
      '  (2020, '#39'41'#39', 0, '#39#39'),'
      '  (2020, '#39'42'#39', 0, '#39#39'),'
      '  (2020, '#39'43'#39', 0, '#39#39'),'
      '  (2020, '#39'44'#39', 0, '#39#39'),'
      '  (2020, '#39'45'#39', 0, '#39#39'),'
      '  (2020, '#39'46'#39', 0, '#39#39'),'
      '  (2020, '#39'47'#39', 0, '#39#39'),'
      '  (2021, '#39'40'#39', 20, '#39#39'),'
      '  (2021, '#39'41'#39', 0, '#39#39'),'
      '  (2021, '#39'42'#39', 0, '#39#39'),'
      '  (2021, '#39'43'#39', 0, '#39#39'),'
      '  (2021, '#39'44'#39', 0, '#39#39'),'
      '  (2021, '#39'45'#39', 0, '#39#39'),'
      '  (2021, '#39'46'#39', 0, '#39#39'),'
      '  (2021, '#39'47'#39', 0, '#39#39'),'
      '  (2022, '#39'40'#39', 6, '#39#39'),'
      '  (2022, '#39'41'#39', 0, '#39#39'),'
      '  (2022, '#39'42'#39', 0, '#39#39'),'
      '  (2022, '#39'43'#39', 0, '#39#39'),'
      '  (2022, '#39'44'#39', 0, '#39#39'),'
      '  (2022, '#39'45'#39', 0, '#39#39'),'
      '  (2022, '#39'46'#39', 0, '#39#39'),'
      '  (2022, '#39'47'#39', 0, '#39#39'),'
      '  (2023, '#39'40'#39', 16, '#39#39'),'
      '  (2023, '#39'41'#39', 0, '#39#39'),'
      '  (2023, '#39'42'#39', 0, '#39#39'),'
      '  (2023, '#39'43'#39', 0, '#39#39'),'
      '  (2023, '#39'44'#39', 0, '#39#39'),'
      '  (2023, '#39'45'#39', 0, '#39#39'),'
      '  (2023, '#39'46'#39', 0, '#39#39'),'
      '  (2023, '#39'47'#39', 0, '#39#39'),'
      '  (2024, '#39'40'#39', 9, '#39#39'),'
      '  (2024, '#39'41'#39', 0, '#39#39'),'
      '  (2024, '#39'42'#39', 0, '#39#39'),'
      '  (2024, '#39'43'#39', 0, '#39#39'),'
      '  (2024, '#39'44'#39', 0, '#39#39'),'
      '  (2024, '#39'45'#39', 0, '#39#39'),'
      '  (2024, '#39'46'#39', 0, '#39#39'),'
      '  (2024, '#39'47'#39', 0, '#39#39'),'
      '  (2025, '#39'40'#39', 8, '#39#39'),'
      '  (2025, '#39'41'#39', 0, '#39#39'),'
      '  (2025, '#39'42'#39', 0, '#39#39'),'
      '  (2025, '#39'43'#39', 0, '#39#39'),'
      '  (2025, '#39'44'#39', 0, '#39#39'),'
      '  (2025, '#39'45'#39', 0, '#39#39'),'
      '  (2025, '#39'46'#39', 0, '#39#39'),'
      '  (2025, '#39'47'#39', 0, '#39#39'),'
      '  (2026, '#39'40'#39', 12, '#39#39'),'
      '  (2026, '#39'41'#39', 0, '#39#39'),'
      '  (2026, '#39'42'#39', 0, '#39#39'),'
      '  (2026, '#39'43'#39', 0, '#39#39'),'
      '  (2026, '#39'44'#39', 0, '#39#39'),'
      '  (2026, '#39'45'#39', 0, '#39#39'),'
      '  (2026, '#39'46'#39', 0, '#39#39'),'
      '  (2026, '#39'47'#39', 0, '#39#39'),'
      '  (2027, '#39'40'#39', 11, '#39#39'),'
      '  (2027, '#39'41'#39', 0, '#39#39'),'
      '  (2027, '#39'42'#39', 0, '#39#39'),'
      '  (2027, '#39'43'#39', 0, '#39#39'),'
      '  (2027, '#39'44'#39', 0, '#39#39'),'
      '  (2027, '#39'45'#39', 0, '#39#39'),'
      '  (2027, '#39'46'#39', 0, '#39#39'),'
      '  (2027, '#39'47'#39', 0, '#39#39'),'
      '  (2028, '#39'40'#39', 10, '#39#39'),'
      '  (2028, '#39'41'#39', 0, '#39#39'),'
      '  (2028, '#39'42'#39', 0, '#39#39'),'
      '  (2028, '#39'43'#39', 0, '#39#39'),'
      '  (2028, '#39'44'#39', 0, '#39#39'),'
      '  (2028, '#39'45'#39', 0, '#39#39'),'
      '  (2028, '#39'46'#39', 0, '#39#39'),'
      '  (2028, '#39'47'#39', 0, '#39#39'),'
      '  (2029, '#39'40'#39', 8, '#39#39'),'
      '  (2029, '#39'41'#39', 0, '#39#39'),'
      '  (2029, '#39'42'#39', 0, '#39#39'),'
      '  (2029, '#39'43'#39', 0, '#39#39'),'
      '  (2029, '#39'44'#39', 0, '#39#39'),'
      '  (2029, '#39'45'#39', 0, '#39#39'),'
      '  (2029, '#39'46'#39', 0, '#39#39'),'
      '  (2029, '#39'47'#39', 0, '#39#39'),'
      '  (2030, '#39'40'#39', 5, '#39#39'),'
      '  (2030, '#39'41'#39', 0, '#39#39'),'
      '  (2030, '#39'42'#39', 0, '#39#39'),'
      '  (2030, '#39'43'#39', 0, '#39#39'),'
      '  (2030, '#39'44'#39', 0, '#39#39'),'
      '  (2030, '#39'45'#39', 0, '#39#39'),'
      '  (2030, '#39'46'#39', 0, '#39#39'),'
      '  (2030, '#39'47'#39', 0, '#39#39'),'
      '  (2031, '#39'40'#39', 10, '#39#39'),'
      '  (2031, '#39'41'#39', 0, '#39#39'),'
      '  (2031, '#39'42'#39', 0, '#39#39'),'
      '  (2031, '#39'43'#39', 0, '#39#39'),'
      '  (2031, '#39'44'#39', 0, '#39#39'),'
      '  (2031, '#39'45'#39', 0, '#39#39'),'
      '  (2031, '#39'46'#39', 0, '#39#39'),'
      '  (2031, '#39'47'#39', 0, '#39#39'),'
      '  (2032, '#39'40'#39', 0, '#39#39'),'
      '  (2032, '#39'41'#39', 0, '#39#39'),'
      '  (2032, '#39'42'#39', 0, '#39#39'),'
      '  (2032, '#39'43'#39', 0, '#39#39'),'
      '  (2032, '#39'44'#39', 0, '#39#39'),'
      '  (2032, '#39'45'#39', 0, '#39#39'),'
      '  (2032, '#39'46'#39', 0, '#39#39'),'
      '  (2032, '#39'47'#39', 0, '#39#39'),'
      '  (2033, '#39'40'#39', 6, '#39#39'),'
      '  (2033, '#39'41'#39', 0, '#39#39'),'
      '  (2033, '#39'42'#39', 0, '#39#39'),'
      '  (2033, '#39'43'#39', 0, '#39#39'),'
      '  (2033, '#39'44'#39', 0, '#39#39'),'
      '  (2033, '#39'45'#39', 0, '#39#39'),'
      '  (2033, '#39'46'#39', 0, '#39#39'),'
      '  (2033, '#39'47'#39', 0, '#39#39'),'
      '  (2034, '#39'40'#39', 14, '#39#39'),'
      '  (2034, '#39'41'#39', 0, '#39#39'),'
      '  (2034, '#39'42'#39', 0, '#39#39'),'
      '  (2034, '#39'43'#39', 0, '#39#39'),'
      '  (2034, '#39'44'#39', 0, '#39#39'),'
      '  (2034, '#39'45'#39', 0, '#39#39'),'
      '  (2034, '#39'46'#39', 0, '#39#39'),'
      '  (2034, '#39'47'#39', 0, '#39#39'),'
      '  (2035, '#39'40'#39', 3, '#39#39'),'
      '  (2035, '#39'41'#39', 0, '#39#39'),'
      '  (2035, '#39'42'#39', 0, '#39#39'),'
      '  (2035, '#39'43'#39', 0, '#39#39'),'
      '  (2035, '#39'44'#39', 0, '#39#39'),'
      '  (2035, '#39'45'#39', 0, '#39#39'),'
      '  (2035, '#39'46'#39', 0, '#39#39'),'
      '  (2035, '#39'47'#39', 0, '#39#39'),'
      '  (2036, '#39'40'#39', 3, '#39#39'),'
      '  (2036, '#39'41'#39', 0, '#39#39'),'
      '  (2036, '#39'42'#39', 0, '#39#39'),'
      '  (2036, '#39'43'#39', 0, '#39#39'),'
      '  (2036, '#39'44'#39', 0, '#39#39'),'
      '  (2036, '#39'45'#39', 0, '#39#39'),'
      '  (2036, '#39'46'#39', 0, '#39#39'),'
      '  (2036, '#39'47'#39', 0, '#39#39'),'
      '  (2037, '#39'40'#39', 7, '#39#39'),'
      '  (2037, '#39'41'#39', 0, '#39#39'),'
      '  (2037, '#39'42'#39', 0, '#39#39'),'
      '  (2037, '#39'43'#39', 0, '#39#39'),'
      '  (2037, '#39'44'#39', 0, '#39#39'),'
      '  (2037, '#39'45'#39', 0, '#39#39'),'
      '  (2037, '#39'46'#39', 0, '#39#39'),'
      '  (2037, '#39'47'#39', 0, '#39#39'),'
      '  (2038, '#39'40'#39', 13, '#39#39'),'
      '  (2038, '#39'41'#39', 0, '#39#39'),'
      '  (2038, '#39'42'#39', 0, '#39#39'),'
      '  (2038, '#39'43'#39', 0, '#39#39'),'
      '  (2038, '#39'44'#39', 0, '#39#39'),'
      '  (2038, '#39'45'#39', 0, '#39#39'),'
      '  (2038, '#39'46'#39', 0, '#39#39'),'
      '  (2038, '#39'47'#39', 0, '#39#39'),'
      '  (2039, '#39'40'#39', 10, '#39#39'),'
      '  (2039, '#39'41'#39', 0, '#39#39'),'
      '  (2039, '#39'42'#39', 0, '#39#39'),'
      '  (2039, '#39'43'#39', 0, '#39#39'),'
      '  (2039, '#39'44'#39', 0, '#39#39'),'
      '  (2039, '#39'45'#39', 0, '#39#39'),'
      '  (2039, '#39'46'#39', 0, '#39#39'),'
      '  (2039, '#39'47'#39', 0, '#39#39'),'
      '  (2040, '#39'40'#39', 8, '#39#39'),'
      '  (2040, '#39'41'#39', 0, '#39#39'),'
      '  (2040, '#39'42'#39', 0, '#39#39'),'
      '  (2040, '#39'43'#39', 0, '#39#39'),'
      '  (2040, '#39'44'#39', 0, '#39#39'),'
      '  (2040, '#39'45'#39', 0, '#39#39'),'
      '  (2040, '#39'46'#39', 0, '#39#39'),'
      '  (2040, '#39'47'#39', 0, '#39#39'),'
      '  (2041, '#39'40'#39', 15, '#39#39'),'
      '  (2041, '#39'41'#39', 0, '#39#39'),'
      '  (2041, '#39'42'#39', 0, '#39#39'),'
      '  (2041, '#39'43'#39', 0, '#39#39'),'
      '  (2041, '#39'44'#39', 0, '#39#39'),'
      '  (2041, '#39'45'#39', 0, '#39#39'),'
      '  (2041, '#39'46'#39', 0, '#39#39'),'
      '  (2041, '#39'47'#39', 0, '#39#39'),'
      '  (2042, '#39'40'#39', 8, '#39#39'),'
      '  (2042, '#39'41'#39', 0, '#39#39'),'
      '  (2042, '#39'42'#39', 0, '#39#39'),'
      '  (2042, '#39'43'#39', 0, '#39#39'),'
      '  (2042, '#39'44'#39', 0, '#39#39'),'
      '  (2042, '#39'45'#39', 0, '#39#39'),'
      '  (2042, '#39'46'#39', 0, '#39#39'),'
      '  (2042, '#39'47'#39', 0, '#39#39'),'
      '  (2043, '#39'40'#39', 10, '#39#39'),'
      '  (2043, '#39'41'#39', 0, '#39#39'),'
      '  (2043, '#39'42'#39', 0, '#39#39'),'
      '  (2043, '#39'43'#39', 0, '#39#39'),'
      '  (2043, '#39'44'#39', 0, '#39#39'),'
      '  (2043, '#39'45'#39', 0, '#39#39'),'
      '  (2043, '#39'46'#39', 0, '#39#39'),'
      '  (2043, '#39'47'#39', 0, '#39#39'),'
      '  (2044, '#39'40'#39', 11, '#39#39'),'
      '  (2044, '#39'41'#39', 0, '#39#39'),'
      '  (2044, '#39'42'#39', 0, '#39#39'),'
      '  (2044, '#39'43'#39', 0, '#39#39'),'
      '  (2044, '#39'44'#39', 0, '#39#39'),'
      '  (2044, '#39'45'#39', 0, '#39#39'),'
      '  (2044, '#39'46'#39', 0, '#39#39'),'
      '  (2044, '#39'47'#39', 0, '#39#39'),'
      '  (2045, '#39'40'#39', 6, '#39#39'),'
      '  (2045, '#39'41'#39', 0, '#39#39'),'
      '  (2045, '#39'42'#39', 0, '#39#39'),'
      '  (2045, '#39'43'#39', 0, '#39#39'),'
      '  (2045, '#39'44'#39', 0, '#39#39'),'
      '  (2045, '#39'45'#39', 0, '#39#39'),'
      '  (2045, '#39'46'#39', 0, '#39#39'),'
      '  (2045, '#39'47'#39', 0, '#39#39'),'
      '  (2046, '#39'40'#39', 1, '#39#39'),'
      '  (2046, '#39'41'#39', 0, '#39#39'),'
      '  (2046, '#39'42'#39', 0, '#39#39'),'
      '  (2046, '#39'43'#39', 0, '#39#39'),'
      '  (2046, '#39'44'#39', 0, '#39#39'),'
      '  (2046, '#39'45'#39', 0, '#39#39'),'
      '  (2046, '#39'46'#39', 0, '#39#39'),'
      '  (2046, '#39'47'#39', 0, '#39#39'),'
      '  (2047, '#39'40'#39', 4, '#39#39'),'
      '  (2047, '#39'41'#39', 0, '#39#39'),'
      '  (2047, '#39'42'#39', 0, '#39#39'),'
      '  (2047, '#39'43'#39', 0, '#39#39'),'
      '  (2047, '#39'44'#39', 0, '#39#39'),'
      '  (2047, '#39'45'#39', 0, '#39#39'),'
      '  (2047, '#39'46'#39', 0, '#39#39'),'
      '  (2047, '#39'47'#39', 0, '#39#39'),'
      '  (2048, '#39'40'#39', 6, '#39#39'),'
      '  (2048, '#39'41'#39', 0, '#39#39'),'
      '  (2048, '#39'42'#39', 0, '#39#39'),'
      '  (2048, '#39'43'#39', 0, '#39#39'),'
      '  (2048, '#39'44'#39', 0, '#39#39'),'
      '  (2048, '#39'45'#39', 0, '#39#39'),'
      '  (2048, '#39'46'#39', 0, '#39#39'),'
      '  (2048, '#39'47'#39', 0, '#39#39'),'
      '  (2049, '#39'40'#39', 8, '#39#39'),'
      '  (2049, '#39'41'#39', 0, '#39#39'),'
      '  (2049, '#39'42'#39', 0, '#39#39'),'
      '  (2049, '#39'43'#39', 0, '#39#39'),'
      '  (2049, '#39'44'#39', 0, '#39#39'),'
      '  (2049, '#39'45'#39', 0, '#39#39'),'
      '  (2049, '#39'46'#39', 0, '#39#39'),'
      '  (2049, '#39'47'#39', 0, '#39#39'),'
      '  (2050, '#39'40'#39', 7, '#39#39'),'
      '  (2050, '#39'41'#39', 0, '#39#39'),'
      '  (2050, '#39'42'#39', 0, '#39#39'),'
      '  (2050, '#39'43'#39', 0, '#39#39'),'
      '  (2050, '#39'44'#39', 0, '#39#39'),'
      '  (2050, '#39'45'#39', 0, '#39#39'),'
      '  (2050, '#39'46'#39', 0, '#39#39'),'
      '  (2050, '#39'47'#39', 0, '#39#39'),'
      '  (2051, '#39'40'#39', 8, '#39#39'),'
      '  (2051, '#39'41'#39', 0, '#39#39'),'
      '  (2051, '#39'42'#39', 0, '#39#39'),'
      '  (2051, '#39'43'#39', 0, '#39#39'),'
      '  (2051, '#39'44'#39', 0, '#39#39'),'
      '  (2051, '#39'45'#39', 0, '#39#39'),'
      '  (2051, '#39'46'#39', 0, '#39#39'),'
      '  (2051, '#39'47'#39', 0, '#39#39'),'
      '  (2052, '#39'40'#39', 9, '#39#39'),'
      '  (2052, '#39'41'#39', 0, '#39#39'),'
      '  (2052, '#39'42'#39', 0, '#39#39'),'
      '  (2052, '#39'43'#39', 0, '#39#39'),'
      '  (2052, '#39'44'#39', 0, '#39#39'),'
      '  (2052, '#39'45'#39', 0, '#39#39'),'
      '  (2052, '#39'46'#39', 0, '#39#39'),'
      '  (2052, '#39'47'#39', 0, '#39#39'),'
      '  (2053, '#39'40'#39', 5, '#39#39'),'
      '  (2053, '#39'41'#39', 0, '#39#39'),'
      '  (2053, '#39'42'#39', 0, '#39#39'),'
      '  (2053, '#39'43'#39', 0, '#39#39'),'
      '  (2053, '#39'44'#39', 0, '#39#39'),'
      '  (2053, '#39'45'#39', 0, '#39#39'),'
      '  (2053, '#39'46'#39', 0, '#39#39'),'
      '  (2053, '#39'47'#39', 0, '#39#39'),'
      '  (2054, '#39'40'#39', 4, '#39#39'),'
      '  (2054, '#39'41'#39', 0, '#39#39'),'
      '  (2054, '#39'42'#39', 0, '#39#39'),'
      '  (2054, '#39'43'#39', 0, '#39#39'),'
      '  (2054, '#39'44'#39', 0, '#39#39'),'
      '  (2054, '#39'45'#39', 0, '#39#39'),'
      '  (2054, '#39'46'#39', 0, '#39#39'),'
      '  (2054, '#39'47'#39', 0, '#39#39'),'
      '  (2055, '#39'40'#39', 8, '#39#39'),'
      '  (2055, '#39'41'#39', 0, '#39#39'),'
      '  (2055, '#39'42'#39', 0, '#39#39'),'
      '  (2055, '#39'43'#39', 0, '#39#39'),'
      '  (2055, '#39'44'#39', 0, '#39#39'),'
      '  (2055, '#39'45'#39', 0, '#39#39'),'
      '  (2055, '#39'46'#39', 0, '#39#39'),'
      '  (2055, '#39'47'#39', 0, '#39#39'),'
      '  (2056, '#39'40'#39', 12, '#39#39'),'
      '  (2056, '#39'41'#39', 0, '#39#39'),'
      '  (2056, '#39'42'#39', 0, '#39#39'),'
      '  (2056, '#39'43'#39', 0, '#39#39'),'
      '  (2056, '#39'44'#39', 0, '#39#39'),'
      '  (2056, '#39'45'#39', 0, '#39#39'),'
      '  (2056, '#39'46'#39', 0, '#39#39'),'
      '  (2056, '#39'47'#39', 0, '#39#39'),'
      '  (2057, '#39'40'#39', 8, '#39#39'),'
      '  (2057, '#39'41'#39', 0, '#39#39'),'
      '  (2057, '#39'42'#39', 0, '#39#39'),'
      '  (2057, '#39'43'#39', 0, '#39#39'),'
      '  (2057, '#39'44'#39', 0, '#39#39'),'
      '  (2057, '#39'45'#39', 0, '#39#39'),'
      '  (2057, '#39'46'#39', 0, '#39#39'),'
      '  (2057, '#39'47'#39', 0, '#39#39'),'
      '  (2058, '#39'40'#39', 8, '#39#39'),'
      '  (2058, '#39'41'#39', 0, '#39#39'),'
      '  (2058, '#39'42'#39', 0, '#39#39'),'
      '  (2058, '#39'43'#39', 0, '#39#39'),'
      '  (2058, '#39'44'#39', 0, '#39#39'),'
      '  (2058, '#39'45'#39', 0, '#39#39'),'
      '  (2058, '#39'46'#39', 0, '#39#39'),'
      '  (2058, '#39'47'#39', 0, '#39#39'),'
      '  (2059, '#39'40'#39', 8, '#39#39'),'
      '  (2059, '#39'41'#39', 0, '#39#39'),'
      '  (2059, '#39'42'#39', 0, '#39#39'),'
      '  (2059, '#39'43'#39', 0, '#39#39'),'
      '  (2059, '#39'44'#39', 0, '#39#39'),'
      '  (2059, '#39'45'#39', 0, '#39#39'),'
      '  (2059, '#39'46'#39', 0, '#39#39'),'
      '  (2059, '#39'47'#39', 0, '#39#39'),'
      '  (2060, '#39'40'#39', 7, '#39#39'),'
      '  (2060, '#39'41'#39', 0, '#39#39'),'
      '  (2060, '#39'42'#39', 0, '#39#39'),'
      '  (2060, '#39'43'#39', 0, '#39#39'),'
      '  (2060, '#39'44'#39', 0, '#39#39'),'
      '  (2060, '#39'45'#39', 0, '#39#39'),'
      '  (2060, '#39'46'#39', 0, '#39#39'),'
      '  (2060, '#39'47'#39', 0, '#39#39'),'
      '  (2061, '#39'40'#39', 9, '#39#39'),'
      '  (2061, '#39'41'#39', 0, '#39#39'),'
      '  (2061, '#39'42'#39', 0, '#39#39'),'
      '  (2061, '#39'43'#39', 0, '#39#39'),'
      '  (2061, '#39'44'#39', 0, '#39#39'),'
      '  (2061, '#39'45'#39', 0, '#39#39'),'
      '  (2061, '#39'46'#39', 0, '#39#39'),'
      '  (2061, '#39'47'#39', 0, '#39#39'),'
      '  (2062, '#39'40'#39', 10, '#39#39'),'
      '  (2062, '#39'41'#39', 0, '#39#39'),'
      '  (2062, '#39'42'#39', 0, '#39#39'),'
      '  (2062, '#39'43'#39', 0, '#39#39'),'
      '  (2062, '#39'44'#39', 0, '#39#39'),'
      '  (2062, '#39'45'#39', 0, '#39#39'),'
      '  (2062, '#39'46'#39', 0, '#39#39'),'
      '  (2062, '#39'47'#39', 0, '#39#39'),'
      '  (2063, '#39'40'#39', 6, '#39#39'),'
      '  (2063, '#39'41'#39', 0, '#39#39'),'
      '  (2063, '#39'42'#39', 0, '#39#39'),'
      '  (2063, '#39'43'#39', 0, '#39#39'),'
      '  (2063, '#39'44'#39', 0, '#39#39'),'
      '  (2063, '#39'45'#39', 0, '#39#39'),'
      '  (2063, '#39'46'#39', 0, '#39#39'),'
      '  (2063, '#39'47'#39', 0, '#39#39'),'
      '  (2064, '#39'40'#39', 7, '#39#39'),'
      '  (2064, '#39'41'#39', 0, '#39#39'),'
      '  (2064, '#39'42'#39', 0, '#39#39'),'
      '  (2064, '#39'43'#39', 0, '#39#39'),'
      '  (2064, '#39'44'#39', 0, '#39#39'),'
      '  (2064, '#39'45'#39', 0, '#39#39'),'
      '  (2064, '#39'46'#39', 0, '#39#39'),'
      '  (2064, '#39'47'#39', 0, '#39#39'),'
      '  (2065, '#39'40'#39', 10, '#39#39'),'
      '  (2065, '#39'41'#39', 0, '#39#39'),'
      '  (2065, '#39'42'#39', 0, '#39#39'),'
      '  (2065, '#39'43'#39', 0, '#39#39'),'
      '  (2065, '#39'44'#39', 0, '#39#39'),'
      '  (2065, '#39'45'#39', 0, '#39#39'),'
      '  (2065, '#39'46'#39', 0, '#39#39'),'
      '  (2065, '#39'47'#39', 0, '#39#39'),'
      '  (2066, '#39'40'#39', 11, '#39#39'),'
      '  (2066, '#39'41'#39', 0, '#39#39'),'
      '  (2066, '#39'42'#39', 0, '#39#39'),'
      '  (2066, '#39'43'#39', 0, '#39#39'),'
      '  (2066, '#39'44'#39', 0, '#39#39'),'
      '  (2066, '#39'45'#39', 0, '#39#39'),'
      '  (2066, '#39'46'#39', 0, '#39#39'),'
      '  (2066, '#39'47'#39', 0, '#39#39'),'
      '  (2067, '#39'40'#39', 6, '#39#39'),'
      '  (2067, '#39'41'#39', 0, '#39#39'),'
      '  (2067, '#39'42'#39', 0, '#39#39'),'
      '  (2067, '#39'43'#39', 0, '#39#39'),'
      '  (2067, '#39'44'#39', 0, '#39#39'),'
      '  (2067, '#39'45'#39', 0, '#39#39'),'
      '  (2067, '#39'46'#39', 0, '#39#39'),'
      '  (2067, '#39'47'#39', 0, '#39#39'),'
      '  (2068, '#39'40'#39', 4, '#39#39'),'
      '  (2068, '#39'41'#39', 0, '#39#39'),'
      '  (2068, '#39'42'#39', 0, '#39#39'),'
      '  (2068, '#39'43'#39', 0, '#39#39'),'
      '  (2068, '#39'44'#39', 0, '#39#39'),'
      '  (2068, '#39'45'#39', 0, '#39#39'),'
      '  (2068, '#39'46'#39', 0, '#39#39'),'
      '  (2068, '#39'47'#39', 0, '#39#39'),'
      '  (2069, '#39'40'#39', 4, '#39#39'),'
      '  (2069, '#39'41'#39', 0, '#39#39'),'
      '  (2069, '#39'42'#39', 0, '#39#39'),'
      '  (2069, '#39'43'#39', 0, '#39#39'),'
      '  (2069, '#39'44'#39', 0, '#39#39'),'
      '  (2069, '#39'45'#39', 0, '#39#39'),'
      '  (2069, '#39'46'#39', 0, '#39#39'),'
      '  (2069, '#39'47'#39', 0, '#39#39'),'
      '  (2070, '#39'40'#39', 8, '#39#39'),'
      '  (2070, '#39'41'#39', 0, '#39#39'),'
      '  (2070, '#39'42'#39', 0, '#39#39'),'
      '  (2070, '#39'43'#39', 0, '#39#39'),'
      '  (2070, '#39'44'#39', 0, '#39#39'),'
      '  (2070, '#39'45'#39', 0, '#39#39'),'
      '  (2070, '#39'46'#39', 0, '#39#39'),'
      '  (2070, '#39'47'#39', 0, '#39#39'),'
      '  (2071, '#39'40'#39', 5, '#39#39'),'
      '  (2071, '#39'41'#39', 0, '#39#39'),'
      '  (2071, '#39'42'#39', 0, '#39#39'),'
      '  (2071, '#39'43'#39', 0, '#39#39'),'
      '  (2071, '#39'44'#39', 0, '#39#39'),'
      '  (2071, '#39'45'#39', 0, '#39#39'),'
      '  (2071, '#39'46'#39', 0, '#39#39'),'
      '  (2071, '#39'47'#39', 0, '#39#39'),'
      '  (2072, '#39'40'#39', 8, '#39#39'),'
      '  (2072, '#39'41'#39', 0, '#39#39'),'
      '  (2072, '#39'42'#39', 0, '#39#39'),'
      '  (2072, '#39'43'#39', 0, '#39#39'),'
      '  (2072, '#39'44'#39', 0, '#39#39'),'
      '  (2072, '#39'45'#39', 0, '#39#39'),'
      '  (2072, '#39'46'#39', 0, '#39#39'),'
      '  (2072, '#39'47'#39', 0, '#39#39'),'
      '  (2073, '#39'40'#39', 10, '#39#39'),'
      '  (2073, '#39'41'#39', 0, '#39#39'),'
      '  (2073, '#39'42'#39', 0, '#39#39'),'
      '  (2073, '#39'43'#39', 0, '#39#39'),'
      '  (2073, '#39'44'#39', 0, '#39#39'),'
      '  (2073, '#39'45'#39', 0, '#39#39'),'
      '  (2073, '#39'46'#39', 0, '#39#39'),'
      '  (2073, '#39'47'#39', 0, '#39#39'),'
      '  (2074, '#39'40'#39', 9, '#39#39'),'
      '  (2074, '#39'41'#39', 0, '#39#39'),'
      '  (2074, '#39'42'#39', 0, '#39#39'),'
      '  (2074, '#39'43'#39', 0, '#39#39'),'
      '  (2074, '#39'44'#39', 0, '#39#39'),'
      '  (2074, '#39'45'#39', 0, '#39#39'),'
      '  (2074, '#39'46'#39', 0, '#39#39'),'
      '  (2074, '#39'47'#39', 0, '#39#39'),'
      '  (2075, '#39'40'#39', 5, '#39#39'),'
      '  (2075, '#39'41'#39', 0, '#39#39'),'
      '  (2075, '#39'42'#39', 0, '#39#39'),'
      '  (2075, '#39'43'#39', 0, '#39#39'),'
      '  (2075, '#39'44'#39', 0, '#39#39'),'
      '  (2075, '#39'45'#39', 0, '#39#39'),'
      '  (2075, '#39'46'#39', 0, '#39#39'),'
      '  (2075, '#39'47'#39', 0, '#39#39'),'
      '  (2076, '#39'40'#39', 9, '#39#39'),'
      '  (2076, '#39'41'#39', 0, '#39#39'),'
      '  (2076, '#39'42'#39', 0, '#39#39'),'
      '  (2076, '#39'43'#39', 0, '#39#39'),'
      '  (2076, '#39'44'#39', 0, '#39#39'),'
      '  (2076, '#39'45'#39', 0, '#39#39'),'
      '  (2076, '#39'46'#39', 0, '#39#39'),'
      '  (2076, '#39'47'#39', 0, '#39#39'),'
      '  (2077, '#39'40'#39', 9, '#39#39'),'
      '  (2077, '#39'41'#39', 0, '#39#39'),'
      '  (2077, '#39'42'#39', 0, '#39#39'),'
      '  (2077, '#39'43'#39', 0, '#39#39'),'
      '  (2077, '#39'44'#39', 0, '#39#39'),'
      '  (2077, '#39'45'#39', 0, '#39#39'),'
      '  (2077, '#39'46'#39', 0, '#39#39'),'
      '  (2077, '#39'47'#39', 0, '#39#39'),'
      '  (2078, '#39'40'#39', 9, '#39#39'),'
      '  (2078, '#39'41'#39', 0, '#39#39'),'
      '  (2078, '#39'42'#39', 0, '#39#39'),'
      '  (2078, '#39'43'#39', 0, '#39#39'),'
      '  (2078, '#39'44'#39', 0, '#39#39'),'
      '  (2078, '#39'45'#39', 0, '#39#39'),'
      '  (2078, '#39'46'#39', 0, '#39#39'),'
      '  (2078, '#39'47'#39', 0, '#39#39'),'
      '  (2079, '#39'40'#39', 10, '#39#39'),'
      '  (2079, '#39'41'#39', 0, '#39#39'),'
      '  (2079, '#39'42'#39', 0, '#39#39'),'
      '  (2079, '#39'43'#39', 0, '#39#39'),'
      '  (2079, '#39'44'#39', 0, '#39#39'),'
      '  (2079, '#39'45'#39', 0, '#39#39'),'
      '  (2079, '#39'46'#39', 0, '#39#39'),'
      '  (2079, '#39'47'#39', 0, '#39#39'),'
      '  (2080, '#39'40'#39', 10, '#39#39'),'
      '  (2080, '#39'41'#39', 0, '#39#39'),'
      '  (2080, '#39'42'#39', 0, '#39#39'),'
      '  (2080, '#39'43'#39', 0, '#39#39'),'
      '  (2080, '#39'44'#39', 0, '#39#39'),'
      '  (2080, '#39'45'#39', 0, '#39#39'),'
      '  (2080, '#39'46'#39', 0, '#39#39'),'
      '  (2080, '#39'47'#39', 0, '#39#39'),'
      '  (2081, '#39'40'#39', 8, '#39#39'),'
      '  (2081, '#39'41'#39', 0, '#39#39'),'
      '  (2081, '#39'42'#39', 0, '#39#39'),'
      '  (2081, '#39'43'#39', 0, '#39#39'),'
      '  (2081, '#39'44'#39', 0, '#39#39'),'
      '  (2081, '#39'45'#39', 0, '#39#39'),'
      '  (2081, '#39'46'#39', 0, '#39#39'),'
      '  (2081, '#39'47'#39', 0, '#39#39'),'
      '  (2082, '#39'40'#39', 8, '#39#39'),'
      '  (2082, '#39'41'#39', 0, '#39#39'),'
      '  (2082, '#39'42'#39', 0, '#39#39'),'
      '  (2082, '#39'43'#39', 0, '#39#39'),'
      '  (2082, '#39'44'#39', 0, '#39#39'),'
      '  (2082, '#39'45'#39', 0, '#39#39'),'
      '  (2082, '#39'46'#39', 0, '#39#39'),'
      '  (2082, '#39'47'#39', 0, '#39#39'),'
      '  (2083, '#39'40'#39', 11, '#39#39'),'
      '  (2083, '#39'41'#39', 0, '#39#39'),'
      '  (2083, '#39'42'#39', 0, '#39#39'),'
      '  (2083, '#39'43'#39', 0, '#39#39'),'
      '  (2083, '#39'44'#39', 0, '#39#39'),'
      '  (2083, '#39'45'#39', 0, '#39#39'),'
      '  (2083, '#39'46'#39', 0, '#39#39'),'
      '  (2083, '#39'47'#39', 0, '#39#39'),'
      '  (2084, '#39'40'#39', 7, '#39#39'),'
      '  (2084, '#39'41'#39', 0, '#39#39'),'
      '  (2084, '#39'42'#39', 0, '#39#39'),'
      '  (2084, '#39'43'#39', 0, '#39#39'),'
      '  (2084, '#39'44'#39', 0, '#39#39'),'
      '  (2084, '#39'45'#39', 0, '#39#39'),'
      '  (2084, '#39'46'#39', 0, '#39#39'),'
      '  (2084, '#39'47'#39', 0, '#39#39'),'
      '  (2085, '#39'40'#39', 7, '#39#39'),'
      '  (2085, '#39'41'#39', 0, '#39#39'),'
      '  (2085, '#39'42'#39', 0, '#39#39'),'
      '  (2085, '#39'43'#39', 0, '#39#39'),'
      '  (2085, '#39'44'#39', 0, '#39#39'),'
      '  (2085, '#39'45'#39', 0, '#39#39'),'
      '  (2085, '#39'46'#39', 0, '#39#39'),'
      '  (2085, '#39'47'#39', 0, '#39#39'),'
      '  (2086, '#39'40'#39', 10, '#39#39'),'
      '  (2086, '#39'41'#39', 0, '#39#39'),'
      '  (2086, '#39'42'#39', 0, '#39#39'),'
      '  (2086, '#39'43'#39', 0, '#39#39'),'
      '  (2086, '#39'44'#39', 0, '#39#39'),'
      '  (2086, '#39'45'#39', 0, '#39#39'),'
      '  (2086, '#39'46'#39', 0, '#39#39'),'
      '  (2086, '#39'47'#39', 0, '#39#39'),'
      '  (2087, '#39'40'#39', 6, '#39#39'),'
      '  (2087, '#39'41'#39', 0, '#39#39'),'
      '  (2087, '#39'42'#39', 0, '#39#39'),'
      '  (2087, '#39'43'#39', 0, '#39#39'),'
      '  (2087, '#39'44'#39', 0, '#39#39'),'
      '  (2087, '#39'45'#39', 0, '#39#39'),'
      '  (2087, '#39'46'#39', 0, '#39#39'),'
      '  (2087, '#39'47'#39', 0, '#39#39'),'
      '  (2088, '#39'40'#39', 8, '#39#39'),'
      '  (2088, '#39'41'#39', 0, '#39#39'),'
      '  (2088, '#39'42'#39', 0, '#39#39'),'
      '  (2088, '#39'43'#39', 0, '#39#39'),'
      '  (2088, '#39'44'#39', 0, '#39#39'),'
      '  (2088, '#39'45'#39', 0, '#39#39'),'
      '  (2088, '#39'46'#39', 0, '#39#39'),'
      '  (2088, '#39'47'#39', 0, '#39#39'),'
      '  (2089, '#39'40'#39', 5, '#39#39'),'
      '  (2089, '#39'41'#39', 0, '#39#39'),'
      '  (2089, '#39'42'#39', 0, '#39#39'),'
      '  (2089, '#39'43'#39', 0, '#39#39'),'
      '  (2089, '#39'44'#39', 0, '#39#39'),'
      '  (2089, '#39'45'#39', 0, '#39#39'),'
      '  (2089, '#39'46'#39', 0, '#39#39'),'
      '  (2089, '#39'47'#39', 0, '#39#39'),'
      '  (2090, '#39'40'#39', 4, '#39#39'),'
      '  (2090, '#39'41'#39', 0, '#39#39'),'
      '  (2090, '#39'42'#39', 0, '#39#39'),'
      '  (2090, '#39'43'#39', 0, '#39#39'),'
      '  (2090, '#39'44'#39', 0, '#39#39'),'
      '  (2090, '#39'45'#39', 0, '#39#39'),'
      '  (2090, '#39'46'#39', 0, '#39#39'),'
      '  (2090, '#39'47'#39', 0, '#39#39'),'
      '  (2091, '#39'40'#39', 8, '#39#39'),'
      '  (2091, '#39'41'#39', 0, '#39#39'),'
      '  (2091, '#39'42'#39', 0, '#39#39'),'
      '  (2091, '#39'43'#39', 0, '#39#39'),'
      '  (2091, '#39'44'#39', 0, '#39#39'),'
      '  (2091, '#39'45'#39', 0, '#39#39'),'
      '  (2091, '#39'46'#39', 0, '#39#39'),'
      '  (2091, '#39'47'#39', 0, '#39#39'),'
      '  (2092, '#39'40'#39', 3, '#39#39'),'
      '  (2092, '#39'41'#39', 0, '#39#39'),'
      '  (2092, '#39'42'#39', 0, '#39#39'),'
      '  (2092, '#39'43'#39', 0, '#39#39'),'
      '  (2092, '#39'44'#39', 0, '#39#39'),'
      '  (2092, '#39'45'#39', 0, '#39#39'),'
      '  (2092, '#39'46'#39', 0, '#39#39'),'
      '  (2092, '#39'47'#39', 0, '#39#39'),'
      '  (2093, '#39'40'#39', 5, '#39#39'),'
      '  (2093, '#39'41'#39', 0, '#39#39'),'
      '  (2093, '#39'42'#39', 0, '#39#39'),'
      '  (2093, '#39'43'#39', 0, '#39#39'),'
      '  (2093, '#39'44'#39', 0, '#39#39'),'
      '  (2093, '#39'45'#39', 0, '#39#39'),'
      '  (2093, '#39'46'#39', 0, '#39#39'),'
      '  (2093, '#39'47'#39', 0, '#39#39'),'
      '  (2094, '#39'40'#39', 8, '#39#39'),'
      '  (2094, '#39'41'#39', 0, '#39#39'),'
      '  (2094, '#39'42'#39', 0, '#39#39'),'
      '  (2094, '#39'43'#39', 0, '#39#39'),'
      '  (2094, '#39'44'#39', 0, '#39#39'),'
      '  (2094, '#39'45'#39', 0, '#39#39'),'
      '  (2094, '#39'46'#39', 0, '#39#39'),'
      '  (2094, '#39'47'#39', 0, '#39#39'),'
      '  (2095, '#39'40'#39', 11, '#39#39'),'
      '  (2095, '#39'41'#39', 0, '#39#39'),'
      '  (2095, '#39'42'#39', 0, '#39#39'),'
      '  (2095, '#39'43'#39', 0, '#39#39'),'
      '  (2095, '#39'44'#39', 0, '#39#39'),'
      '  (2095, '#39'45'#39', 0, '#39#39'),'
      '  (2095, '#39'46'#39', 0, '#39#39'),'
      '  (2095, '#39'47'#39', 0, '#39#39'),'
      '  (2096, '#39'40'#39', 7, '#39#39'),'
      '  (2096, '#39'41'#39', 0, '#39#39'),'
      '  (2096, '#39'42'#39', 0, '#39#39'),'
      '  (2096, '#39'43'#39', 0, '#39#39'),'
      '  (2096, '#39'44'#39', 0, '#39#39'),'
      '  (2096, '#39'45'#39', 0, '#39#39'),'
      '  (2096, '#39'46'#39', 0, '#39#39'),'
      '  (2096, '#39'47'#39', 0, '#39#39'),'
      '  (2097, '#39'40'#39', 5, '#39#39'),'
      '  (2097, '#39'41'#39', 0, '#39#39'),'
      '  (2097, '#39'42'#39', 0, '#39#39'),'
      '  (2097, '#39'43'#39', 0, '#39#39'),'
      '  (2097, '#39'44'#39', 0, '#39#39'),'
      '  (2097, '#39'45'#39', 0, '#39#39'),'
      '  (2097, '#39'46'#39', 0, '#39#39'),'
      '  (2097, '#39'47'#39', 0, '#39#39'),'
      '  (2098, '#39'40'#39', 5, '#39#39'),'
      '  (2098, '#39'41'#39', 0, '#39#39'),'
      '  (2098, '#39'42'#39', 0, '#39#39'),'
      '  (2098, '#39'43'#39', 0, '#39#39'),'
      '  (2098, '#39'44'#39', 0, '#39#39'),'
      '  (2098, '#39'45'#39', 0, '#39#39'),'
      '  (2098, '#39'46'#39', 0, '#39#39'),'
      '  (2098, '#39'47'#39', 0, '#39#39'),'
      '  (2099, '#39'40'#39', 5, '#39#39'),'
      '  (2099, '#39'41'#39', 0, '#39#39'),'
      '  (2099, '#39'42'#39', 0, '#39#39'),'
      '  (2099, '#39'43'#39', 0, '#39#39'),'
      '  (2099, '#39'44'#39', 0, '#39#39'),'
      '  (2099, '#39'45'#39', 0, '#39#39'),'
      '  (2099, '#39'46'#39', 0, '#39#39'),'
      '  (2099, '#39'47'#39', 0, '#39#39'),'
      '  (2100, '#39'40'#39', 2, '#39#39'),'
      '  (2100, '#39'41'#39', 0, '#39#39'),'
      '  (2100, '#39'42'#39', 0, '#39#39'),'
      '  (2100, '#39'43'#39', 0, '#39#39'),'
      '  (2100, '#39'44'#39', 0, '#39#39'),'
      '  (2100, '#39'45'#39', 0, '#39#39'),'
      '  (2100, '#39'46'#39', 0, '#39#39'),'
      '  (2100, '#39'47'#39', 0, '#39#39'),'
      '  (2101, '#39'40'#39', 3, '#39#39'),'
      '  (2101, '#39'41'#39', 0, '#39#39'),'
      '  (2101, '#39'42'#39', 0, '#39#39'),'
      '  (2101, '#39'43'#39', 0, '#39#39'),'
      '  (2101, '#39'44'#39', 0, '#39#39'),'
      '  (2101, '#39'45'#39', 0, '#39#39'),'
      '  (2101, '#39'46'#39', 0, '#39#39'),'
      '  (2101, '#39'47'#39', 0, '#39#39'),'
      '  (2102, '#39'40'#39', 2, '#39#39'),'
      '  (2102, '#39'41'#39', 0, '#39#39'),'
      '  (2102, '#39'42'#39', 0, '#39#39'),'
      '  (2102, '#39'43'#39', 0, '#39#39'),'
      '  (2102, '#39'44'#39', 0, '#39#39'),'
      '  (2102, '#39'45'#39', 0, '#39#39'),'
      '  (2102, '#39'46'#39', 0, '#39#39'),'
      '  (2102, '#39'47'#39', 0, '#39#39'),'
      '  (2103, '#39'40'#39', 2, '#39#39'),'
      '  (2103, '#39'41'#39', 0, '#39#39'),'
      '  (2103, '#39'42'#39', 0, '#39#39'),'
      '  (2103, '#39'43'#39', 0, '#39#39'),'
      '  (2103, '#39'44'#39', 0, '#39#39'),'
      '  (2103, '#39'45'#39', 0, '#39#39'),'
      '  (2103, '#39'46'#39', 0, '#39#39'),'
      '  (2103, '#39'47'#39', 0, '#39#39'),'
      '  (2104, '#39'40'#39', 2, '#39#39'),'
      '  (2104, '#39'41'#39', 0, '#39#39'),'
      '  (2104, '#39'42'#39', 0, '#39#39'),'
      '  (2104, '#39'43'#39', 0, '#39#39'),'
      '  (2104, '#39'44'#39', 0, '#39#39'),'
      '  (2104, '#39'45'#39', 0, '#39#39'),'
      '  (2104, '#39'46'#39', 0, '#39#39'),'
      '  (2104, '#39'47'#39', 0, '#39#39'),'
      '  (2105, '#39'40'#39', 1, '#39#39'),'
      '  (2105, '#39'41'#39', 0, '#39#39'),'
      '  (2105, '#39'42'#39', 0, '#39#39'),'
      '  (2105, '#39'43'#39', 0, '#39#39'),'
      '  (2105, '#39'44'#39', 0, '#39#39'),'
      '  (2105, '#39'45'#39', 0, '#39#39'),'
      '  (2105, '#39'46'#39', 0, '#39#39'),'
      '  (2105, '#39'47'#39', 0, '#39#39'),'
      '  (2106, '#39'40'#39', 3, '#39#39'),'
      '  (2106, '#39'41'#39', 0, '#39#39'),'
      '  (2106, '#39'42'#39', 0, '#39#39'),'
      '  (2106, '#39'43'#39', 0, '#39#39'),'
      '  (2106, '#39'44'#39', 0, '#39#39'),'
      '  (2106, '#39'45'#39', 0, '#39#39'),'
      '  (2106, '#39'46'#39', 0, '#39#39'),'
      '  (2106, '#39'47'#39', 0, '#39#39'),'
      '  (2107, '#39'40'#39', 1, '#39#39'),'
      '  (2107, '#39'41'#39', 0, '#39#39'),'
      '  (2107, '#39'42'#39', 0, '#39#39'),'
      '  (2107, '#39'43'#39', 0, '#39#39'),'
      '  (2107, '#39'44'#39', 0, '#39#39'),'
      '  (2107, '#39'45'#39', 0, '#39#39'),'
      '  (2107, '#39'46'#39', 0, '#39#39'),'
      '  (2107, '#39'47'#39', 0, '#39#39'),'
      '  (2108, '#39'40'#39', 1, '#39#39'),'
      '  (2108, '#39'41'#39', 0, '#39#39'),'
      '  (2108, '#39'42'#39', 0, '#39#39'),'
      '  (2108, '#39'43'#39', 0, '#39#39'),'
      '  (2108, '#39'44'#39', 0, '#39#39'),'
      '  (2108, '#39'45'#39', 0, '#39#39'),'
      '  (2108, '#39'46'#39', 0, '#39#39'),'
      '  (2108, '#39'47'#39', 0, '#39#39'),'
      '  (2109, '#39'40'#39', 1, '#39#39'),'
      '  (2109, '#39'41'#39', 0, '#39#39'),'
      '  (2109, '#39'42'#39', 0, '#39#39'),'
      '  (2109, '#39'43'#39', 0, '#39#39'),'
      '  (2109, '#39'44'#39', 0, '#39#39'),'
      '  (2109, '#39'45'#39', 0, '#39#39'),'
      '  (2109, '#39'46'#39', 0, '#39#39'),'
      '  (2109, '#39'47'#39', 0, '#39#39'),'
      '  (2110, '#39'40'#39', 1, '#39#39'),'
      '  (2110, '#39'41'#39', 0, '#39#39'),'
      '  (2110, '#39'42'#39', 0, '#39#39'),'
      '  (2110, '#39'43'#39', 0, '#39#39'),'
      '  (2110, '#39'44'#39', 0, '#39#39'),'
      '  (2110, '#39'45'#39', 0, '#39#39'),'
      '  (2110, '#39'46'#39', 0, '#39#39'),'
      '  (2110, '#39'47'#39', 0, '#39#39'),'
      '  (2111, '#39'40'#39', 2, '#39#39'),'
      '  (2111, '#39'41'#39', 0, '#39#39'),'
      '  (2111, '#39'42'#39', 0, '#39#39'),'
      '  (2111, '#39'43'#39', 0, '#39#39'),'
      '  (2111, '#39'44'#39', 0, '#39#39'),'
      '  (2111, '#39'45'#39', 0, '#39#39'),'
      '  (2111, '#39'46'#39', 0, '#39#39'),'
      '  (2111, '#39'47'#39', 0, '#39#39'),'
      '  (2112, '#39'40'#39', 3, '#39#39'),'
      '  (2112, '#39'41'#39', 0, '#39#39'),'
      '  (2112, '#39'42'#39', 0, '#39#39'),'
      '  (2112, '#39'43'#39', 0, '#39#39'),'
      '  (2112, '#39'44'#39', 0, '#39#39'),'
      '  (2112, '#39'45'#39', 0, '#39#39'),'
      '  (2112, '#39'46'#39', 0, '#39#39'),'
      '  (2112, '#39'47'#39', 0, '#39#39'),'
      '  (2113, '#39'40'#39', 2, '#39#39'),'
      '  (2113, '#39'41'#39', 0, '#39#39'),'
      '  (2113, '#39'42'#39', 0, '#39#39'),'
      '  (2113, '#39'43'#39', 0, '#39#39'),'
      '  (2113, '#39'44'#39', 0, '#39#39'),'
      '  (2113, '#39'45'#39', 0, '#39#39'),'
      '  (2113, '#39'46'#39', 0, '#39#39'),'
      '  (2113, '#39'47'#39', 0, '#39#39'),'
      '  (2114, '#39'40'#39', 2, '#39#39'),'
      '  (2114, '#39'41'#39', 0, '#39#39'),'
      '  (2114, '#39'42'#39', 0, '#39#39'),'
      '  (2114, '#39'43'#39', 0, '#39#39'),'
      '  (2114, '#39'44'#39', 0, '#39#39'),'
      '  (2114, '#39'45'#39', 0, '#39#39'),'
      '  (2114, '#39'46'#39', 0, '#39#39'),'
      '  (2114, '#39'47'#39', 0, '#39#39'),'
      '  (2115, '#39'40'#39', 1, '#39#39'),'
      '  (2115, '#39'41'#39', 0, '#39#39'),'
      '  (2115, '#39'42'#39', 0, '#39#39'),'
      '  (2115, '#39'43'#39', 0, '#39#39'),'
      '  (2115, '#39'44'#39', 0, '#39#39'),'
      '  (2115, '#39'45'#39', 0, '#39#39'),'
      '  (2115, '#39'46'#39', 0, '#39#39'),'
      '  (2115, '#39'47'#39', 0, '#39#39'),'
      '  (2116, '#39'40'#39', 2, '#39#39'),'
      '  (2116, '#39'41'#39', 0, '#39#39'),'
      '  (2116, '#39'42'#39', 0, '#39#39'),'
      '  (2116, '#39'43'#39', 0, '#39#39'),'
      '  (2116, '#39'44'#39', 0, '#39#39'),'
      '  (2116, '#39'45'#39', 0, '#39#39'),'
      '  (2116, '#39'46'#39', 0, '#39#39'),'
      '  (2116, '#39'47'#39', 0, '#39#39'),'
      '  (2117, '#39'40'#39', 1, '#39#39'),'
      '  (2117, '#39'41'#39', 0, '#39#39'),'
      '  (2117, '#39'42'#39', 0, '#39#39'),'
      '  (2117, '#39'43'#39', 0, '#39#39'),'
      '  (2117, '#39'44'#39', 0, '#39#39'),'
      '  (2117, '#39'45'#39', 0, '#39#39'),'
      '  (2117, '#39'46'#39', 0, '#39#39'),'
      '  (2117, '#39'47'#39', 0, '#39#39'),'
      '  (2118, '#39'40'#39', 1, '#39#39'),'
      '  (2118, '#39'41'#39', 0, '#39#39'),'
      '  (2118, '#39'42'#39', 0, '#39#39'),'
      '  (2118, '#39'43'#39', 0, '#39#39'),'
      '  (2118, '#39'44'#39', 0, '#39#39'),'
      '  (2118, '#39'45'#39', 0, '#39#39'),'
      '  (2118, '#39'46'#39', 0, '#39#39'),'
      '  (2118, '#39'47'#39', 0, '#39#39'),'
      '  (2119, '#39'40'#39', 2, '#39#39'),'
      '  (2119, '#39'41'#39', 0, '#39#39'),'
      '  (2119, '#39'42'#39', 0, '#39#39'),'
      '  (2119, '#39'43'#39', 0, '#39#39'),'
      '  (2119, '#39'44'#39', 0, '#39#39'),'
      '  (2119, '#39'45'#39', 0, '#39#39'),'
      '  (2119, '#39'46'#39', 0, '#39#39'),'
      '  (2119, '#39'47'#39', 0, '#39#39'),'
      '  (2120, '#39'40'#39', 1, '#39#39'),'
      '  (2120, '#39'41'#39', 0, '#39#39'),'
      '  (2120, '#39'42'#39', 0, '#39#39'),'
      '  (2120, '#39'43'#39', 0, '#39#39'),'
      '  (2120, '#39'44'#39', 0, '#39#39'),'
      '  (2120, '#39'45'#39', 0, '#39#39'),'
      '  (2120, '#39'46'#39', 0, '#39#39'),'
      '  (2120, '#39'47'#39', 0, '#39#39'),'
      '  (2121, '#39'40'#39', 1, '#39#39'),'
      '  (2121, '#39'41'#39', 0, '#39#39'),'
      '  (2121, '#39'42'#39', 0, '#39#39'),'
      '  (2121, '#39'43'#39', 0, '#39#39'),'
      '  (2121, '#39'44'#39', 0, '#39#39'),'
      '  (2121, '#39'45'#39', 0, '#39#39'),'
      '  (2121, '#39'46'#39', 0, '#39#39'),'
      '  (2121, '#39'47'#39', 0, '#39#39'),'
      '  (2122, '#39'40'#39', 1, '#39#39'),'
      '  (2122, '#39'41'#39', 0, '#39#39'),'
      '  (2122, '#39'42'#39', 0, '#39#39'),'
      '  (2122, '#39'43'#39', 0, '#39#39'),'
      '  (2122, '#39'44'#39', 0, '#39#39'),'
      '  (2122, '#39'45'#39', 0, '#39#39'),'
      '  (2122, '#39'46'#39', 0, '#39#39'),'
      '  (2122, '#39'47'#39', 0, '#39#39'),'
      '  (2123, '#39'40'#39', 1, '#39#39'),'
      '  (2123, '#39'41'#39', 0, '#39#39'),'
      '  (2123, '#39'42'#39', 0, '#39#39'),'
      '  (2123, '#39'43'#39', 0, '#39#39'),'
      '  (2123, '#39'44'#39', 0, '#39#39'),'
      '  (2123, '#39'45'#39', 0, '#39#39'),'
      '  (2123, '#39'46'#39', 0, '#39#39'),'
      '  (2123, '#39'47'#39', 0, '#39#39'),'
      '  (2124, '#39'40'#39', 0, '#39#39'),'
      '  (2124, '#39'41'#39', 0, '#39#39'),'
      '  (2124, '#39'42'#39', 0, '#39#39'),'
      '  (2124, '#39'43'#39', 0, '#39#39'),'
      '  (2124, '#39'44'#39', 0, '#39#39'),'
      '  (2124, '#39'45'#39', 0, '#39#39'),'
      '  (2124, '#39'46'#39', 0, '#39#39'),'
      '  (2124, '#39'47'#39', 0, '#39#39'),'
      '  (2125, '#39'40'#39', 0, '#39#39'),'
      '  (2125, '#39'41'#39', 0, '#39#39'),'
      '  (2125, '#39'42'#39', 0, '#39#39'),'
      '  (2125, '#39'43'#39', 0, '#39#39'),'
      '  (2125, '#39'44'#39', 0, '#39#39'),'
      '  (2125, '#39'45'#39', 0, '#39#39'),'
      '  (2125, '#39'46'#39', 0, '#39#39'),'
      '  (2125, '#39'47'#39', 0, '#39#39'),'
      '  (2126, '#39'40'#39', 1, '#39#39'),'
      '  (2126, '#39'41'#39', 0, '#39#39'),'
      '  (2126, '#39'42'#39', 0, '#39#39'),'
      '  (2126, '#39'43'#39', 0, '#39#39'),'
      '  (2126, '#39'44'#39', 0, '#39#39'),'
      '  (2126, '#39'45'#39', 0, '#39#39'),'
      '  (2126, '#39'46'#39', 0, '#39#39'),'
      '  (2126, '#39'47'#39', 0, '#39#39'),'
      '  (2127, '#39'40'#39', 1, '#39#39'),'
      '  (2127, '#39'41'#39', 0, '#39#39'),'
      '  (2127, '#39'42'#39', 0, '#39#39'),'
      '  (2127, '#39'43'#39', 0, '#39#39'),'
      '  (2127, '#39'44'#39', 0, '#39#39'),'
      '  (2127, '#39'45'#39', 0, '#39#39'),'
      '  (2127, '#39'46'#39', 0, '#39#39'),'
      '  (2127, '#39'47'#39', 0, '#39#39'),'
      '  (2128, '#39'40'#39', 1, '#39#39'),'
      '  (2128, '#39'41'#39', 0, '#39#39'),'
      '  (2128, '#39'42'#39', 0, '#39#39'),'
      '  (2128, '#39'43'#39', 0, '#39#39'),'
      '  (2128, '#39'44'#39', 0, '#39#39'),'
      '  (2128, '#39'45'#39', 0, '#39#39'),'
      '  (2128, '#39'46'#39', 0, '#39#39'),'
      '  (2128, '#39'47'#39', 0, '#39#39'),'
      '  (2129, '#39'40'#39', 1, '#39#39'),'
      '  (2129, '#39'41'#39', 0, '#39#39'),'
      '  (2129, '#39'42'#39', 0, '#39#39'),'
      '  (2129, '#39'43'#39', 0, '#39#39'),'
      '  (2129, '#39'44'#39', 0, '#39#39'),'
      '  (2129, '#39'45'#39', 0, '#39#39'),'
      '  (2129, '#39'46'#39', 0, '#39#39'),'
      '  (2129, '#39'47'#39', 0, '#39#39'),'
      '  (2130, '#39'40'#39', 1, '#39#39'),'
      '  (2130, '#39'41'#39', 0, '#39#39'),'
      '  (2130, '#39'42'#39', 0, '#39#39'),'
      '  (2130, '#39'43'#39', 0, '#39#39'),'
      '  (2130, '#39'44'#39', 0, '#39#39'),'
      '  (2130, '#39'45'#39', 0, '#39#39'),'
      '  (2130, '#39'46'#39', 0, '#39#39'),'
      '  (2130, '#39'47'#39', 0, '#39#39'),'
      '  (2131, '#39'40'#39', 1, '#39#39'),'
      '  (2131, '#39'41'#39', 0, '#39#39'),'
      '  (2131, '#39'42'#39', 0, '#39#39'),'
      '  (2131, '#39'43'#39', 0, '#39#39'),'
      '  (2131, '#39'44'#39', 0, '#39#39'),'
      '  (2131, '#39'45'#39', 0, '#39#39'),'
      '  (2131, '#39'46'#39', 0, '#39#39'),'
      '  (2131, '#39'47'#39', 0, '#39#39'),'
      '  (2132, '#39'40'#39', 1, '#39#39'),'
      '  (2132, '#39'41'#39', 0, '#39#39'),'
      '  (2132, '#39'42'#39', 0, '#39#39'),'
      '  (2132, '#39'43'#39', 0, '#39#39'),'
      '  (2132, '#39'44'#39', 0, '#39#39'),'
      '  (2132, '#39'45'#39', 0, '#39#39'),'
      '  (2132, '#39'46'#39', 0, '#39#39'),'
      '  (2132, '#39'47'#39', 0, '#39#39'),'
      '  (2133, '#39'40'#39', 1, '#39#39'),'
      '  (2133, '#39'41'#39', 0, '#39#39'),'
      '  (2133, '#39'42'#39', 0, '#39#39'),'
      '  (2133, '#39'43'#39', 0, '#39#39'),'
      '  (2133, '#39'44'#39', 0, '#39#39'),'
      '  (2133, '#39'45'#39', 0, '#39#39'),'
      '  (2133, '#39'46'#39', 0, '#39#39'),'
      '  (2133, '#39'47'#39', 0, '#39#39'),'
      '  (2134, '#39'40'#39', 1, '#39#39'),'
      '  (2134, '#39'41'#39', 0, '#39#39'),'
      '  (2134, '#39'42'#39', 0, '#39#39'),'
      '  (2134, '#39'43'#39', 0, '#39#39'),'
      '  (2134, '#39'44'#39', 0, '#39#39'),'
      '  (2134, '#39'45'#39', 0, '#39#39'),'
      '  (2134, '#39'46'#39', 0, '#39#39'),'
      '  (2134, '#39'47'#39', 0, '#39#39'),'
      '  (2135, '#39'40'#39', 1, '#39#39'),'
      '  (2135, '#39'41'#39', 0, '#39#39'),'
      '  (2135, '#39'42'#39', 0, '#39#39'),'
      '  (2135, '#39'43'#39', 0, '#39#39'),'
      '  (2135, '#39'44'#39', 0, '#39#39'),'
      '  (2135, '#39'45'#39', 0, '#39#39'),'
      '  (2135, '#39'46'#39', 0, '#39#39'),'
      '  (2135, '#39'47'#39', 0, '#39#39'),'
      '  (2136, '#39'40'#39', 1, '#39#39'),'
      '  (2136, '#39'41'#39', 0, '#39#39'),'
      '  (2136, '#39'42'#39', 0, '#39#39'),'
      '  (2136, '#39'43'#39', 0, '#39#39'),'
      '  (2136, '#39'44'#39', 0, '#39#39'),'
      '  (2136, '#39'45'#39', 0, '#39#39'),'
      '  (2136, '#39'46'#39', 0, '#39#39'),'
      '  (2136, '#39'47'#39', 0, '#39#39'),'
      '  (2137, '#39'40'#39', 1, '#39#39'),'
      '  (2137, '#39'41'#39', 0, '#39#39'),'
      '  (2137, '#39'42'#39', 0, '#39#39'),'
      '  (2137, '#39'43'#39', 0, '#39#39'),'
      '  (2137, '#39'44'#39', 0, '#39#39'),'
      '  (2137, '#39'45'#39', 0, '#39#39'),'
      '  (2137, '#39'46'#39', 0, '#39#39'),'
      '  (2137, '#39'47'#39', 0, '#39#39'),'
      '  (2138, '#39'40'#39', 1, '#39#39'),'
      '  (2138, '#39'41'#39', 0, '#39#39'),'
      '  (2138, '#39'42'#39', 0, '#39#39'),'
      '  (2138, '#39'43'#39', 0, '#39#39'),'
      '  (2138, '#39'44'#39', 0, '#39#39'),'
      '  (2138, '#39'45'#39', 0, '#39#39'),'
      '  (2138, '#39'46'#39', 0, '#39#39'),'
      '  (2138, '#39'47'#39', 0, '#39#39');')
    Connection = connMySQL
    Left = 656
    Top = 16
  end
end
