<resource schema="onebigb">
  <meta name="title">First BIGB</meta>
  <meta name="creationDate">2018-04-23T17:05:03</meta>
  <meta name="description">
  This catalog presents the 1-100 GeV spectral energy distribution (SED) 
  for a population of 148 high-synchrotron-peaked blazars (HSPs) recently 
  detected with Fermi-LAT as part of the 
  First Brazil-ICRANet Gamma-ray Blazar catalogue (1BIGB). 
  A series of two works describe details on the broadband analysis 
  https://arxiv.org/abs/1609.08501 (paper 1), and the calculation of the 
  gamma-ray SEDs https://arxiv.org/abs/1804.08801 (paper 2). 
  Most of the 1BIGB sources do not appear in previous Fermi-LAT catalogues 
  and their gamma-ray spectral properties are presented here for the first time, 
  representing a significant new extension of the gamma-ray blazar population. 
  Since the 1BIGB sample was originally selected from an excess signal in 
  the 0.3-500 GeV band, the sources stand out as promising TeV blazar candidates, 
  potentially in reach of the forthcoming very-high-energy (VHE) gamma-ray observatory, CTA. 
  The flux estimates presented here are derived considering PASS8 data, integrating 
  over more than 9 years of Fermi-LAT observations. The full broadband fit 
  between 0.3-500 GeV presented in paper 1 for all sources was reevaluated in paper 2, 
  updating the power-law parameters with currently available Fermi-LAT dataset. 
  The importance of these sources in the context of VHE population studies with both 
  current instruments and the future CTA is evaluated in paper 2. To do so, a subsample of 
  1BIGB sources was selected and had their gamma-ray SEDs extrapolated to the highest energies, 
  properly accounting for absorption due to the extragalactic background light. 
  Those extrapolations were compared to the published CTA sensitivity curves and their 
  detectability by CTA was estimated. Two notable sources from our sample, namely 
  1BIGB J224910.6-130002 and 1BIGB J194356.2+211821, are discussed in greater detail in paper 2. 
  All gamma-ray SEDs, which are shown here for the first time, are made publicly available via 
  the Brazilian Science Data Center (BSDC) service, maintained at CBPF, in Rio de Janeiro.
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

