<resource schema="onebigb">
  <meta name="title">First BIGB</meta>
  <meta name="creationDate">2018-04-23T17:05:03</meta>
  <meta name="description">
  The 1BIGB catalog.
  </meta>
  <meta name="creator.name">Bruno Arsioli, Ulisses B. de Almeida</meta>

  <meta name="subject">Catalogs</meta>
  <meta name="subject">gamma-ray sources</meta>
  <meta name="subject">VHE sources</meta>

  <meta name="coverage">
    <meta name="profile">AllSky ICRS</meta>
    <meta name="waveband">Gamma-ray</meta>
   </meta>

   <meta name="source">
    2018.inpress;
   </meta>

   <table id="main" onDisk="True" mixin="//scs#q3cindex">
    <index columns="ra,dec"/>

    <column name="id" type="text"
      ucd="meta.id;meta.main"
      tablehead="ID" verbLevel="20"
      description="Datapoint ID"
      required="True"/>
      
    <column name="ra" type="double precision"
      unit="deg" ucd="pos.eq.ra;meta.main"
      tablehead="R.A." verbLevel="1"
      description="Right Ascension"
      required="True"/>

    <column name="dec" type="double precision"
      unit="deg" ucd="pos.eq.dec;meta.main"
      tablehead="Dec." verbLevel="1"
      description="Declination"
      required="True"/>

    <column name="frequency" type="real"
      unit="Hz" ucd="em.freq"
      tablehead="Frequency" verbLevel="1"
      description="Flux measurement frequency"
      required="True"/>

    <column name="nufnu" type="real"
      unit="erg cm-2 s-1" ucd="phot.flux"
      tablehead="Flux" verbLevel="1"
      description="nuFnu Flux"
      required="True"/>

    <column name="nufnu_error" type="real"
      unit="erg cm-2 s-1" ucd="stat.error;phot.flux"
      tablehead="Flux error" verbLevel="1"
      description="nuFnu Flux error"
      required="True"/>

   <column name="upper_limit" type="text"
     ucd="meta.code"
     tablehead="upper-limit" verbLevel="1"
     description="Flux upper limit"
     required="False">
     <values nullLiteral=""/>
   </column>
  </table>

  <data id="import">
    <sources>data/1bigb.csv</sources>
    <csvGrammar/>
    <make table="main">
      <rowmaker simplemaps="nufnu:flux,nufnu_error:flux_err"
      		idmaps="id,ra,dec,frequency,upper_limit"/>
    </make>
  </data>

  <service id="cone" allowed="scs.xml,form">
    <meta name="title">1BIGB catalog</meta>
    <meta name="shortName">1BIGB cone</meta>
    <meta name="testQuery">
      <meta name="ra">20.02637</meta>
      <meta name="dec">21.98903</meta>
      <meta name="sr">1.0</meta>
    </meta>

    <dbCore queriedTable="main">
      <FEED source="//scs#coreDescs"/>
    </dbCore>

    <publish render="scs.xml" sets="ivo_managed"/>
    <publish render="form" sets="local"/>

    <outputTable verbLevel="20"/>
  </service>

</resource>

