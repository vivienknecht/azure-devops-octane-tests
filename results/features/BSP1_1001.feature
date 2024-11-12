Feature: Compra pixel propio cambio estado

Background:
Given realizo login correcto en ms "https:***************************************" con rut "***************"
Then recibo respuesta 200


@testUpload
    Scenario Outline: Compra igual o menor a cero
      Given ingreso en el body parametro "<store>"
      And obtengo "<code>" de la bbdd
      And ingreso en campo "<successUrl>"
      And ingreso> "<subtotal>"
      And ingreso "<price>"
      And ingreso "<totalprice>"
      When ejecuto ms "https:***************************************"
      Then obtengo status 201
      And campo identifier
      And campo totalcashback
      And valido en bbdd sales en la collections sales el estado de la compra WAITING

      Examples:
        |store|code|subtotal|successUrl|price|totalprice|
        |5f5bcfdd9d20fa001b0ebcd6|LK0R-KGJ5-BBD1|http://labarra.cl|0|0|0|


  Scenario Outline: Compra tiene monto cashback superior a monto
    Given ingreso en el body parametro "<store>"
    And obtengo "<code>" de la bbdd
    And ingreso "<subtotal>"
    And ingreso "<price1>"
    And ingreso "<totalprice1>"
    And ingreso "<price2>"
    And ingreso "<totalprice2>"
    When ejecuto ms "https:***************************************"
    Then obtengo status 201
    And campo identifier
    And campo totalcashback
    And valido en bbdd sales en la collections sales el estado de la compra WAITING

    Examples:
      |store|code|subtotal|price1|totalprice1|price2|totalprice2|
      |5f5bcfdd9d20fa001b0ebcd6|LK0R-KGJ5-BBD1|100000|20000|20000|40000|80000|


  Scenario Outline: Compra tiene monto cashback mayor al monto de la compra
    Given ingreso en el body parametro "<store>"
    And obtengo "<code>" de la bbdd
    And ingreso "<subtotal>"
    And ingreso "<price1>"
    And ingreso "<cashback1>"
    And ingreso "<totalprice1>"
    And ingreso "<price2>"
    And ingreso "<cashback2>"
    And ingreso "<totalprice2>"
    When ejecuto ms "https:***************************************"
    Then obtengo status 201
    And campo identifier
    And campo totalcashback
    And valido en bbdd sales en la collections sales el estado de la compra WAITING

    Examples:
      |store|code|subtotal|price1|cashback1|totalprice1|price2|cashback2|totalprice2|
      |5f5bcfdd9d20fa001b0ebcd6|LK0R-KGJ5-BBD1|5000|5000|5500|0|0|0|0|


  Scenario Outline: Compra duplicada en monto comercio OC
    Given ingreso en el body parametro "<store>"
    And obtengo "<code>" de la bbdd
    And ingreso "<subtotal>"
    And obtengo "ordernumber de la bbdd
    And "<price1>"
    And "<totalprice1>"
    And "<price2>"
    And "<totalprice2>"
    When ejecuto ms "https:***************************************"
    Then obtengo status 201
    And campo identifier
    And campo totalcashback
    And valido en bbdd sales en la collections sales el estado de la compra CANCELED

    Examples:
      |store|code|subtotal|ordernumber|price1|totalprice1|price2|totalprice2|
      |5f5bcfdd9d20fa001b0ebcd6|LK0R-KGJ5-BBD1|5000|6ab98d5b-82af-4bcc-a194-dd7c9bef8c47|5000|0|0|0|

  Scenario Outline: Compra tiene el mismo monto comercio distinta OC
    Given ingreso en el body parametro "<store>"
    And obtengo "<code>" de la bbdd
    And ingreso "<subtotal>"
    And ingreso "<ordernumber>"
    And ingreso "<price1>"
    And ingreso "<totalprice1>"
    And ingreso "<ordernumber1>"
    And ingreso "<price2>"
    And ingreso "<totalprice2>"
    And ingreso "<ordernumber2>"
    When ejecuto ms "https:***************************************"
    Then obtengo status 201
    And campo identifier
    And campo totalcashback
    And valido en bbdd sales en la collections sales el estado de la compra PENDING
    And valido marca automatico

    Examples:
      |store|code|subtotal|ordernumber|price1|totalprice1|ordernumber1|price2|totalprice2|ordernumber2|
      |5f5bcfdd9d20fa001b0ebcd6|LK0R-KGJ5-BBD1|100000|oc33414131oc|20000|20000|oc33414131oc|40000|40000|oc33414131oc|


  Scenario Outline: Compra sin restriccion
    Given ingreso en el body parametro "<store>"
    And obtengo "<code>" de la bbdd
    And ingreso "<subtotal>"
    And ingreso "<ordernumber>"
    And ingreso "<price1>"
    And ingreso "<totalprice1>"
    And ingreso "<ordernumber1>"
    And ingreso "<price2>"
    And ingreso "<totalprice2>"
    And ingreso "<ordernumber2>"
    When ejecuto ms "https:***************************************"
    Then obtengo status 201
    And campo identifier
    And campo totalcashback
    And valido en bbdd sales en la collections sales el estado de la compra PENDING
    And valido marca automatico

    Examples:
      |store|code|subtotal|ordernumber|price1|totalprice1|ordernumber1|price2|totalprice2|ordernumber2|
      |5f5bcfdd9d20fa001b0ebcd6|LK0R-KGJ5-BBD1|1000|xxxxxx|200|200|xxxxxx|400|800|xxxxxx|


  Scenario Outline: Compra duplicada mismo dia sin OC
    Given ingreso en el body parametro "<store>"
    And obtengo "<code>" de la bbdd
    And ingreso "<subtotal>"
    And ingreso "<price1>"
    And ingreso "<totalprice1>"
    And ingreso "<price2>"
    And ingreso "<totalprice2>"
    When ejecuto ms "https:***************************************"
    Then obtengo status 201
    And campo identifier
    And campo totalcashback
    And valido en bbdd sales en la collections sales el estado de la compra WAITING


    Examples:
      |store|code|subtotal|price1|totalprice1|price2|totalprice2|
      |5f5bcfdd9d20fa001b0ebcd6|LK0R-KGJ5-BBD1|1000|200|200|400|800|]]>
