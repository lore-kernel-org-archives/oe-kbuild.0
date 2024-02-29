Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0830D446C9
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Feb 2024 23:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709248869; cv=none; b=SWX8eH5Wh798EODeUIn2/qU39VBxzujTgP3LZ1mVtZ+ykhOZKzBFHV7iCCS2j7y15mE5l92UK9oV1I/FxyK+uG+GKHodrUOJKaBbVAqdHuIE2kABbrzFn2JmX8rWjOXMlrYj/uTi3Jg6eINzQ6k4az4G9jAiDz7qU7zqMlNoFt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709248869; c=relaxed/simple;
	bh=/UIu2oNqdVr9EMyuUk3xyXK287IizmHM8GJ1Y5lcMcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xu0P82kVm7St6gjLIzYd6KYjaJVAvY0ajgSzI2ZVMxNYLr2nXoPted9PRI0PuJVpejC9uGX60DlDWzxpjqAJGHNkaUHoHD27vJ8vPDLvytaRUmR03+zPt/6eWk1EMQDpSz2kdx8mdGzJz9b8YA8BN0nypIwy94Ke4EBXa8ED17Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hyp+FkQW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hyp+FkQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709248867; x=1740784867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/UIu2oNqdVr9EMyuUk3xyXK287IizmHM8GJ1Y5lcMcg=;
  b=Hyp+FkQWsXVISTtLHfwaHxc2L9mrzgGcYC5OaASCdEc2Gc5IWK23mYNp
   ts/e0G/T8pwTfv2U1GdP6qLGqPl1sEiyYzun/GGWbivEAYI98Ld+w7Cqr
   hRFYoNsMSojLgJTKe6AwVaY/PJwv/cJtNpcTXIVA8giQVrJ46nFaq5/6x
   +RF5Ej8TkHEmHIWycZu1x1SI7edYjJKNX7aTvE7BsJJ7WKKa/q9uNKEF1
   8URpJj+03uuPzSjBnra32unEPFZCYfIVxsGqjtzCX6TdI/F8vsnLYOS2v
   R+3KLTBRhJH5FUghOPUXqXScUlIwupRmFR+9zYO5dcrdBn0cNdbsjwTNk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14468405"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="14468405"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 15:20:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="12687284"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Feb 2024 15:20:50 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfpg8-000DLr-0s;
	Thu, 29 Feb 2024 23:19:19 +0000
Date: Fri, 1 Mar 2024 07:17:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:card2-trigger-order-2023-02-28 33/33] dtbs_check:
 Documentation/devicetree/bindings/sound/audio-graph-port.yaml:30:10:
 [warning] too many spaces before colon (colons)
Message-ID: <202403010750.AulDCY96-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/sound/audio-graph-port.yaml:30:10: [warning] too many spaces before colon (colons)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/morimoto/linux card2-trigger-order-2023-02-28
head:   7954e5e1bfde7e92159d3cc1922b94fbd5957915
commit: 7954e5e1bfde7e92159d3cc1922b94fbd5957915 [33/33] ASoC: audio-graph-port: add link-trigger-order
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240301/202403010750.AulDCY96-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202403010750.AulDCY96-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/sound/audio-graph-port.yaml:30:10: [warning] too many spaces before colon (colons)
   Documentation/devicetree/bindings/sound/audio-graph-port.yaml:31:10: [warning] too many spaces before colon (colons)
>> Documentation/devicetree/bindings/sound/audio-graph-port.yaml:34:9: [error] syntax error: could not find expected ':' (syntax)
--
>> Documentation/devicetree/bindings/sound/audio-graph-port.yaml:34:9: could not find expected ':'
>> Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml:
   while scanning a simple key
     in "<unicode string>", line 33, column 9
   could not find expected ':'
     in "<unicode string>", line 34, column 9
>> Documentation/devicetree/bindings/sound/sgtl5000.yaml:
   while scanning a simple key
     in "<unicode string>", line 33, column 9
   could not find expected ':'
     in "<unicode string>", line 34, column 9
>> Documentation/devicetree/bindings/sound/ak4613.yaml:
   while scanning a simple key
     in "<unicode string>", line 33, column 9
   could not find expected ':'
     in "<unicode string>", line 34, column 9
>> Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml:
   while scanning a simple key
     in "<unicode string>", line 33, column 9
   could not find expected ':'
     in "<unicode string>", line 34, column 9
>> Documentation/devicetree/bindings/sound/st,stm32-sai.yaml:
   while scanning a simple key
     in "<unicode string>", line 33, column 9
   could not find expected ':'
     in "<unicode string>", line 34, column 9
>> Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml:
   while scanning a simple key
     in "<unicode string>", line 33, column 9
   could not find expected ':'
     in "<unicode string>", line 34, column 9
>> Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml:
   while scanning a simple key
     in "<unicode string>", line 33, column 9
   could not find expected ':'
     in "<unicode string>", line 34, column 9
>> Documentation/devicetree/bindings/sound/rockchip-i2s.yaml:
   while scanning a simple key
     in "<unicode string>", line 33, column 9
   could not find expected ':'
     in "<unicode string>", line 34, column 9
>> Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml:
   while scanning a simple key
     in "<unicode string>", line 33, column 9
   could not find expected ':'
     in "<unicode string>", line 34, column 9
>> Documentation/devicetree/bindings/sound/socionext,uniphier-aio.yaml:
   while scanning a simple key
     in "<unicode string>", line 33, column 9
   could not find expected ':'
     in "<unicode string>", line 34, column 9
>> Documentation/devicetree/bindings/sound/wlf,wm8962.yaml:
   while scanning a simple key
     in "<unicode string>", line 33, column 9
   could not find expected ':'
     in "<unicode string>", line 34, column 9
>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:
   while scanning a simple key
     in "<unicode string>", line 33, column 9
   could not find expected ':'
     in "<unicode string>", line 34, column 9
>> Documentation/devicetree/bindings/sound/everest,es8316.yaml:
   while scanning a simple key
     in "<unicode string>", line 33, column 9
   could not find expected ':'
     in "<unicode string>", line 34, column 9
>> Documentation/devicetree/bindings/sound/socionext,uniphier-evea.yaml:
   while scanning a simple key
     in "<unicode string>", line 33, column 9
   could not find expected ':'
     in "<unicode string>", line 34, column 9
>> Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml:
   while scanning a simple key
     in "<unicode string>", line 33, column 9
   could not find expected ':'
     in "<unicode string>", line 34, column 9
--
>> Documentation/devicetree/bindings/sound/audio-graph-port.yaml: ignoring, error parsing file

vim +30 Documentation/devicetree/bindings/sound/audio-graph-port.yaml

e52f3f29115204 Sameer Pujar       2020-11-16   13  
bbda859e02a4df Kuninori Morimoto  2023-01-23   14  definitions:
bbda859e02a4df Kuninori Morimoto  2023-01-23   15    port-base:
967dad97757057 Rob Herring        2023-09-28   16      allOf:
967dad97757057 Rob Herring        2023-09-28   17        - $ref: /schemas/graph.yaml#/$defs/port-base
967dad97757057 Rob Herring        2023-09-28   18        - $ref: /schemas/sound/dai-params.yaml#
e52f3f29115204 Sameer Pujar       2020-11-16   19      properties:
a2fabeaaf5e29d Kuninori Morimoto  2023-01-23   20        mclk-fs:
d9e909e219a843 Rob Herring        2023-03-17   21          $ref: simple-card.yaml#/definitions/mclk-fs
af29e51bee8223 Daniel Baluta      2023-11-28   22        playback-only:
af29e51bee8223 Daniel Baluta      2023-11-28   23          description: port connection used only for playback
af29e51bee8223 Daniel Baluta      2023-11-28   24          $ref: /schemas/types.yaml#/definitions/flag
af29e51bee8223 Daniel Baluta      2023-11-28   25        capture-only:
af29e51bee8223 Daniel Baluta      2023-11-28   26          description: port connection used only for capture
af29e51bee8223 Daniel Baluta      2023-11-28   27          $ref: /schemas/types.yaml#/definitions/flag
7954e5e1bfde7e Kuninori Morimoto  2024-02-28   28        link-trigger-order:
7954e5e1bfde7e Kuninori Morimoto  2024-02-28   29          description: indicates trigger order for both start/stop
7954e5e1bfde7e Kuninori Morimoto  2024-02-28  @30          0 : LINK
7954e5e1bfde7e Kuninori Morimoto  2024-02-28   31          1 : COMPONENT
7954e5e1bfde7e Kuninori Morimoto  2024-02-28   32          2 : DAI
7954e5e1bfde7e Kuninori Morimoto  2024-02-28   33          for example <0 1 2> means LINK -> COMPONENT -> DAI
7954e5e1bfde7e Kuninori Morimoto  2024-02-28  @34          $ref: /schemas/types.yaml#/definitions/uint32-array
7954e5e1bfde7e Kuninori Morimoto  2024-02-28   35        link-trigger-order-start:
7954e5e1bfde7e Kuninori Morimoto  2024-02-28   36          description: indicates trigger order for start
7954e5e1bfde7e Kuninori Morimoto  2024-02-28   37          $ref: /schemas/types.yaml#/definitions/uint32-array
7954e5e1bfde7e Kuninori Morimoto  2024-02-28   38        link-trigger-order-stop:
7954e5e1bfde7e Kuninori Morimoto  2024-02-28   39          description: indicates trigger order for stop
7954e5e1bfde7e Kuninori Morimoto  2024-02-28   40          $ref: /schemas/types.yaml#/definitions/uint32-array
b79b6220a75399 Sameer Pujar       2022-08-08   41  
bbda859e02a4df Kuninori Morimoto  2023-01-23   42    endpoint-base:
967dad97757057 Rob Herring        2023-09-28   43      allOf:
967dad97757057 Rob Herring        2023-09-28   44        - $ref: /schemas/graph.yaml#/$defs/endpoint-base
967dad97757057 Rob Herring        2023-09-28   45        - $ref: /schemas/sound/dai-params.yaml#
e52f3f29115204 Sameer Pujar       2020-11-16   46      properties:
e52f3f29115204 Sameer Pujar       2020-11-16   47        mclk-fs:
d9e909e219a843 Rob Herring        2023-03-17   48          $ref: simple-card.yaml#/definitions/mclk-fs
e52f3f29115204 Sameer Pujar       2020-11-16   49        frame-inversion:
e52f3f29115204 Sameer Pujar       2020-11-16   50          description: dai-link uses frame clock inversion
e52f3f29115204 Sameer Pujar       2020-11-16   51          $ref: /schemas/types.yaml#/definitions/flag
e52f3f29115204 Sameer Pujar       2020-11-16   52        bitclock-inversion:
e52f3f29115204 Sameer Pujar       2020-11-16   53          description: dai-link uses bit clock inversion
e52f3f29115204 Sameer Pujar       2020-11-16   54          $ref: /schemas/types.yaml#/definitions/flag
e52f3f29115204 Sameer Pujar       2020-11-16   55        frame-master:
e52f3f29115204 Sameer Pujar       2020-11-16   56          description: Indicates dai-link frame master.
9b3c847b5fa036 Kuninori Morimoto  2021-12-16   57          oneOf:
9b3c847b5fa036 Kuninori Morimoto  2021-12-16   58            - $ref: /schemas/types.yaml#/definitions/flag
9b3c847b5fa036 Kuninori Morimoto  2021-12-16   59            - $ref: /schemas/types.yaml#/definitions/phandle
e52f3f29115204 Sameer Pujar       2020-11-16   60        bitclock-master:
e52f3f29115204 Sameer Pujar       2020-11-16   61          description: Indicates dai-link bit clock master
9b3c847b5fa036 Kuninori Morimoto  2021-12-16   62          oneOf:
9b3c847b5fa036 Kuninori Morimoto  2021-12-16   63            - $ref: /schemas/types.yaml#/definitions/flag
9b3c847b5fa036 Kuninori Morimoto  2021-12-16   64            - $ref: /schemas/types.yaml#/definitions/phandle
2f0be75c9ff935 Kuninori Morimoto  2023-01-23   65        clocks:
2f0be75c9ff935 Kuninori Morimoto  2023-01-23   66          description: Indicates system clock
2f0be75c9ff935 Kuninori Morimoto  2023-01-23   67          $ref: /schemas/types.yaml#/definitions/phandle
2f0be75c9ff935 Kuninori Morimoto  2023-01-23   68        system-clock-frequency:
d9e909e219a843 Rob Herring        2023-03-17   69          $ref: simple-card.yaml#/definitions/system-clock-frequency
2f0be75c9ff935 Kuninori Morimoto  2023-01-23   70        system-clock-direction-out:
d9e909e219a843 Rob Herring        2023-03-17   71          $ref: simple-card.yaml#/definitions/system-clock-direction-out
2f0be75c9ff935 Kuninori Morimoto  2023-01-23   72        system-clock-fixed:
d9e909e219a843 Rob Herring        2023-03-17   73          $ref: simple-card.yaml#/definitions/system-clock-fixed
9b3c847b5fa036 Kuninori Morimoto  2021-12-16   74  
e52f3f29115204 Sameer Pujar       2020-11-16   75        dai-format:
e52f3f29115204 Sameer Pujar       2020-11-16   76          description: audio format.
e52f3f29115204 Sameer Pujar       2020-11-16   77          items:
e52f3f29115204 Sameer Pujar       2020-11-16   78            enum:
e52f3f29115204 Sameer Pujar       2020-11-16   79              - i2s
e52f3f29115204 Sameer Pujar       2020-11-16   80              - right_j
e52f3f29115204 Sameer Pujar       2020-11-16   81              - left_j
e52f3f29115204 Sameer Pujar       2020-11-16   82              - dsp_a
e52f3f29115204 Sameer Pujar       2020-11-16   83              - dsp_b
e52f3f29115204 Sameer Pujar       2020-11-16   84              - ac97
e52f3f29115204 Sameer Pujar       2020-11-16   85              - pdm
e52f3f29115204 Sameer Pujar       2020-11-16   86              - msb
e52f3f29115204 Sameer Pujar       2020-11-16   87              - lsb
e52f3f29115204 Sameer Pujar       2020-11-16   88  
853110992cfefe Marek Vasut        2022-09-27   89        dai-tdm-slot-num:
853110992cfefe Marek Vasut        2022-09-27   90          description: Number of slots in use.
853110992cfefe Marek Vasut        2022-09-27   91          $ref: /schemas/types.yaml#/definitions/uint32
853110992cfefe Marek Vasut        2022-09-27   92        dai-tdm-slot-width:
853110992cfefe Marek Vasut        2022-09-27   93          description: Width in bits for each slot.
853110992cfefe Marek Vasut        2022-09-27   94          $ref: /schemas/types.yaml#/definitions/uint32
26e5366dd30569 Richard Fitzgerald 2022-02-28   95        dai-tdm-slot-width-map:
26e5366dd30569 Richard Fitzgerald 2022-02-28   96          description: Mapping of sample widths to slot widths. For hardware
26e5366dd30569 Richard Fitzgerald 2022-02-28   97            that cannot support a fixed slot width or a slot width always
26e5366dd30569 Richard Fitzgerald 2022-02-28   98            equal to sample width. A matrix of one or more 3-tuples.
26e5366dd30569 Richard Fitzgerald 2022-02-28   99          $ref: /schemas/types.yaml#/definitions/uint32-matrix
26e5366dd30569 Richard Fitzgerald 2022-02-28  100          items:
26e5366dd30569 Richard Fitzgerald 2022-02-28  101            items:
26e5366dd30569 Richard Fitzgerald 2022-02-28  102              -
26e5366dd30569 Richard Fitzgerald 2022-02-28  103                description: Sample width in bits
26e5366dd30569 Richard Fitzgerald 2022-02-28  104                minimum: 8
26e5366dd30569 Richard Fitzgerald 2022-02-28  105                maximum: 64
26e5366dd30569 Richard Fitzgerald 2022-02-28  106              -
26e5366dd30569 Richard Fitzgerald 2022-02-28  107                description: Slot width in bits
26e5366dd30569 Richard Fitzgerald 2022-02-28  108                minimum: 8
26e5366dd30569 Richard Fitzgerald 2022-02-28  109                maximum: 256
26e5366dd30569 Richard Fitzgerald 2022-02-28  110              -
26e5366dd30569 Richard Fitzgerald 2022-02-28  111                description: Slot count
26e5366dd30569 Richard Fitzgerald 2022-02-28  112                minimum: 1
26e5366dd30569 Richard Fitzgerald 2022-02-28  113                maximum: 64
26e5366dd30569 Richard Fitzgerald 2022-02-28  114  
6a7216db63c884 Kuninori Morimoto  2023-01-23  115    ports:
6a7216db63c884 Kuninori Morimoto  2023-01-23  116      $ref: "#/definitions/port-base"
6a7216db63c884 Kuninori Morimoto  2023-01-23  117      unevaluatedProperties: false
6a7216db63c884 Kuninori Morimoto  2023-01-23  118      patternProperties:
6a7216db63c884 Kuninori Morimoto  2023-01-23  119        "^port(@[0-9a-f]+)?$":
6a7216db63c884 Kuninori Morimoto  2023-01-23  120          $ref: "#/definitions/port-base"
6a7216db63c884 Kuninori Morimoto  2023-01-23  121          unevaluatedProperties: false
6a7216db63c884 Kuninori Morimoto  2023-01-23  122          patternProperties:
6a7216db63c884 Kuninori Morimoto  2023-01-23  123            "^endpoint(@[0-9a-f]+)?":
6a7216db63c884 Kuninori Morimoto  2023-01-23  124              $ref: "#/definitions/endpoint-base"
6a7216db63c884 Kuninori Morimoto  2023-01-23  125              unevaluatedProperties: false
6a7216db63c884 Kuninori Morimoto  2023-01-23  126  
bbda859e02a4df Kuninori Morimoto  2023-01-23  127  allOf:
bbda859e02a4df Kuninori Morimoto  2023-01-23  128    - $ref: "#/definitions/port-base"
bbda859e02a4df Kuninori Morimoto  2023-01-23  129  
bbda859e02a4df Kuninori Morimoto  2023-01-23  130  patternProperties:
bbda859e02a4df Kuninori Morimoto  2023-01-23  131    "^endpoint(@[0-9a-f]+)?":
bbda859e02a4df Kuninori Morimoto  2023-01-23  132      $ref: "#/definitions/endpoint-base"
bbda859e02a4df Kuninori Morimoto  2023-01-23  133      unevaluatedProperties: false
bbda859e02a4df Kuninori Morimoto  2023-01-23  134  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
