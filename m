Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9488934CDA
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Sep 2023 17:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695748216; x=1727284216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kjPdS42JMU26CJh4ojHZOtNG43IU5FEU6zVJ38W0vm8=;
  b=L6q4miG4k2UIJeKh6r9NjFzw5eZHmrRhvq3vToTe6gtdUjwgWZNJRRjv
   /fcfo/jafEmTKS45985MciC7VcEm9rfQr5YVpCAqZ5RnyhOhcl2IIBBgd
   kowMtZ576B8oBkj3Jcaw64ctzzRS7yhXzBcP8ag3SOqXj0lPlVsBJaWK6
   ney6XvNbgAxuHxNC50EU/UaOocvDCm8XGuGZ8PifloPMafMjzKV9Y8qTI
   260JtkkrFj/jEDKLonMAH7vmpCEG0iWoW5kDamcVRBunC/A7vkbPiLq9V
   ea2DD0YcUu+s+C9LUe+74tXiGt6dCuD24IgC/Sntyv476N1FGnhuhRosl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="445750507"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="445750507"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 10:10:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="814549120"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="814549120"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 26 Sep 2023 10:10:12 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlBZa-00039K-23;
	Tue, 26 Sep 2023 17:10:10 +0000
Date: Wed, 27 Sep 2023 01:09:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [omap-audio:peter/linux-next-wip 11/48] dtbs_check:
 Documentation/devicetree/bindings/sound/simple-card.yaml:61:5: [warning]
 wrong indentation: expected 2 but found 4 (indentation)
Message-ID: <202309270144.c9b2pEPV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/sound/simple-card.yaml:61:5: [warning] wrong indentation: expected 2 but found 4 (indentation)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Ujfalusi <peter.ujfalusi@ti.com>

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   53915ce9abe60ba07d0e5456948553edefc6cbfb
commit: 8a7b40b7019c093728eb277a9c848369322c9413 [11/48] ASoC: simple-card: Support for selecting system clocks by ID
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309270144.c9b2pEPV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309270144.c9b2pEPV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/sound/simple-card.yaml:61:5: [warning] wrong indentation: expected 2 but found 4 (indentation)
>> Documentation/devicetree/bindings/sound/simple-card.yaml:65:3: [error] syntax error: expected <block end>, but found '<block mapping start>' (syntax)
--
>> Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml:
   while parsing a block mapping
     in "<unicode string>", line 4, column 1
   did not find expected key
     in "<unicode string>", line 65, column 3
>> Documentation/devicetree/bindings/sound/simple-card.yaml:65:3: did not find expected key
--
>> Documentation/devicetree/bindings/sound/simple-card.yaml: ignoring, error parsing file

vim +61 Documentation/devicetree/bindings/sound/simple-card.yaml

79149fb835d762 Kuninori Morimoto   2020-04-01    8  
79149fb835d762 Kuninori Morimoto   2020-04-01    9  maintainers:
79149fb835d762 Kuninori Morimoto   2020-04-01   10    - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
79149fb835d762 Kuninori Morimoto   2020-04-01   11  
79149fb835d762 Kuninori Morimoto   2020-04-01   12  definitions:
79149fb835d762 Kuninori Morimoto   2020-04-01   13  
79149fb835d762 Kuninori Morimoto   2020-04-01   14    frame-master:
79149fb835d762 Kuninori Morimoto   2020-04-01   15      description: Indicates dai-link frame master.
251bf658558f9f Rob Herring         2020-11-16   16      $ref: /schemas/types.yaml#/definitions/phandle
79149fb835d762 Kuninori Morimoto   2020-04-01   17  
79149fb835d762 Kuninori Morimoto   2020-04-01   18    bitclock-master:
79149fb835d762 Kuninori Morimoto   2020-04-01   19      description: Indicates dai-link bit clock master
251bf658558f9f Rob Herring         2020-11-16   20      $ref: /schemas/types.yaml#/definitions/phandle
79149fb835d762 Kuninori Morimoto   2020-04-01   21  
79149fb835d762 Kuninori Morimoto   2020-04-01   22    frame-inversion:
79149fb835d762 Kuninori Morimoto   2020-04-01   23      description: dai-link uses frame clock inversion
79149fb835d762 Kuninori Morimoto   2020-04-01   24      $ref: /schemas/types.yaml#/definitions/flag
79149fb835d762 Kuninori Morimoto   2020-04-01   25  
79149fb835d762 Kuninori Morimoto   2020-04-01   26    bitclock-inversion:
79149fb835d762 Kuninori Morimoto   2020-04-01   27      description: dai-link uses bit clock inversion
79149fb835d762 Kuninori Morimoto   2020-04-01   28      $ref: /schemas/types.yaml#/definitions/flag
79149fb835d762 Kuninori Morimoto   2020-04-01   29  
79149fb835d762 Kuninori Morimoto   2020-04-01   30    dai-tdm-slot-num:
79149fb835d762 Kuninori Morimoto   2020-04-01   31      description: see tdm-slot.txt.
79149fb835d762 Kuninori Morimoto   2020-04-01   32      $ref: /schemas/types.yaml#/definitions/uint32
79149fb835d762 Kuninori Morimoto   2020-04-01   33  
79149fb835d762 Kuninori Morimoto   2020-04-01   34    dai-tdm-slot-width:
79149fb835d762 Kuninori Morimoto   2020-04-01   35      description: see tdm-slot.txt.
79149fb835d762 Kuninori Morimoto   2020-04-01   36      $ref: /schemas/types.yaml#/definitions/uint32
79149fb835d762 Kuninori Morimoto   2020-04-01   37  
79149fb835d762 Kuninori Morimoto   2020-04-01   38    system-clock-frequency:
79149fb835d762 Kuninori Morimoto   2020-04-01   39      description: |
79149fb835d762 Kuninori Morimoto   2020-04-01   40        If a clock is specified and a multiplication factor is given with
79149fb835d762 Kuninori Morimoto   2020-04-01   41        mclk-fs, the clock will be set to the calculated mclk frequency
79149fb835d762 Kuninori Morimoto   2020-04-01   42        when the stream starts.
79149fb835d762 Kuninori Morimoto   2020-04-01   43      $ref: /schemas/types.yaml#/definitions/uint32
79149fb835d762 Kuninori Morimoto   2020-04-01   44  
79149fb835d762 Kuninori Morimoto   2020-04-01   45    system-clock-direction-out:
79149fb835d762 Kuninori Morimoto   2020-04-01   46      description: |
79149fb835d762 Kuninori Morimoto   2020-04-01   47        specifies clock direction as 'out' on initialization.
79149fb835d762 Kuninori Morimoto   2020-04-01   48        It is useful for some aCPUs with fixed clocks.
79149fb835d762 Kuninori Morimoto   2020-04-01   49      $ref: /schemas/types.yaml#/definitions/flag
79149fb835d762 Kuninori Morimoto   2020-04-01   50  
e9fed03aebacb8 Robert Hancock      2022-01-20   51    system-clock-fixed:
e9fed03aebacb8 Robert Hancock      2022-01-20   52      description: |
e9fed03aebacb8 Robert Hancock      2022-01-20   53        Specifies that the clock frequency should not be modified.
e9fed03aebacb8 Robert Hancock      2022-01-20   54        Implied when system-clock-frequency is specified, but can be used when
e9fed03aebacb8 Robert Hancock      2022-01-20   55        a clock is mapped to the device whose frequency cannot or should not be
e9fed03aebacb8 Robert Hancock      2022-01-20   56        changed. When mclk-fs is also specified, this restricts the device to a
e9fed03aebacb8 Robert Hancock      2022-01-20   57        single fixed sampling rate.
e9fed03aebacb8 Robert Hancock      2022-01-20   58      $ref: /schemas/types.yaml#/definitions/flag
e9fed03aebacb8 Robert Hancock      2022-01-20   59  
8a7b40b7019c09 Jyri Sarha          2016-01-18   60  system-clock-id:
8a7b40b7019c09 Jyri Sarha          2016-01-18  @61      description: |
8a7b40b7019c09 Jyri Sarha          2016-01-18   62        Numberic ID of the system clock to select within the dai, default is 0.
8a7b40b7019c09 Jyri Sarha          2016-01-18   63      $ref: /schemas/types.yaml#/definitions/uint32
8a7b40b7019c09 Jyri Sarha          2016-01-18   64  
79149fb835d762 Kuninori Morimoto   2020-04-01  @65    mclk-fs:
79149fb835d762 Kuninori Morimoto   2020-04-01   66      description: |
79149fb835d762 Kuninori Morimoto   2020-04-01   67        Multiplication factor between stream rate and codec mclk.
79149fb835d762 Kuninori Morimoto   2020-04-01   68        When defined, mclk-fs property defined in dai-link sub nodes are ignored.
79149fb835d762 Kuninori Morimoto   2020-04-01   69      $ref: /schemas/types.yaml#/definitions/uint32
79149fb835d762 Kuninori Morimoto   2020-04-01   70  
79149fb835d762 Kuninori Morimoto   2020-04-01   71    aux-devs:
79149fb835d762 Kuninori Morimoto   2020-04-01   72      description: |
79149fb835d762 Kuninori Morimoto   2020-04-01   73        List of phandles pointing to auxiliary devices, such
79149fb835d762 Kuninori Morimoto   2020-04-01   74        as amplifiers, to be added to the sound card.
79149fb835d762 Kuninori Morimoto   2020-04-01   75      $ref: /schemas/types.yaml#/definitions/phandle-array
79149fb835d762 Kuninori Morimoto   2020-04-01   76  
79149fb835d762 Kuninori Morimoto   2020-04-01   77    convert-rate:
79149fb835d762 Kuninori Morimoto   2020-04-01   78      description: CPU to Codec rate convert.
79149fb835d762 Kuninori Morimoto   2020-04-01   79      $ref: /schemas/types.yaml#/definitions/uint32
79149fb835d762 Kuninori Morimoto   2020-04-01   80  
79149fb835d762 Kuninori Morimoto   2020-04-01   81    convert-channels:
79149fb835d762 Kuninori Morimoto   2020-04-01   82      description: CPU to Codec rate channels.
79149fb835d762 Kuninori Morimoto   2020-04-01   83      $ref: /schemas/types.yaml#/definitions/uint32
79149fb835d762 Kuninori Morimoto   2020-04-01   84  
79149fb835d762 Kuninori Morimoto   2020-04-01   85    prefix:
d9e909e219a843 Rob Herring         2023-03-17   86      description: device name prefix
79149fb835d762 Kuninori Morimoto   2020-04-01   87      $ref: /schemas/types.yaml#/definitions/string
79149fb835d762 Kuninori Morimoto   2020-04-01   88  
79149fb835d762 Kuninori Morimoto   2020-04-01   89    label:
79149fb835d762 Kuninori Morimoto   2020-04-01   90      maxItems: 1
79149fb835d762 Kuninori Morimoto   2020-04-01   91  
79149fb835d762 Kuninori Morimoto   2020-04-01   92    routing:
79149fb835d762 Kuninori Morimoto   2020-04-01   93      description: |
79149fb835d762 Kuninori Morimoto   2020-04-01   94        A list of the connections between audio components.
79149fb835d762 Kuninori Morimoto   2020-04-01   95        Each entry is a pair of strings, the first being the
79149fb835d762 Kuninori Morimoto   2020-04-01   96        connection's sink, the second being the connection's source.
79149fb835d762 Kuninori Morimoto   2020-04-01   97      $ref: /schemas/types.yaml#/definitions/non-unique-string-array
79149fb835d762 Kuninori Morimoto   2020-04-01   98  
79149fb835d762 Kuninori Morimoto   2020-04-01   99    widgets:
79149fb835d762 Kuninori Morimoto   2020-04-01  100      description: User specified audio sound widgets.
79149fb835d762 Kuninori Morimoto   2020-04-01  101      $ref: /schemas/types.yaml#/definitions/non-unique-string-array
79149fb835d762 Kuninori Morimoto   2020-04-01  102  
79149fb835d762 Kuninori Morimoto   2020-04-01  103    pin-switches:
79149fb835d762 Kuninori Morimoto   2020-04-01  104      description: the widget names for which pin switches must be created.
79149fb835d762 Kuninori Morimoto   2020-04-01  105      $ref: /schemas/types.yaml#/definitions/string-array
79149fb835d762 Kuninori Morimoto   2020-04-01  106  
79149fb835d762 Kuninori Morimoto   2020-04-01  107    format:
79149fb835d762 Kuninori Morimoto   2020-04-01  108      description: audio format.
79149fb835d762 Kuninori Morimoto   2020-04-01  109      items:
79149fb835d762 Kuninori Morimoto   2020-04-01  110        enum:
79149fb835d762 Kuninori Morimoto   2020-04-01  111          - i2s
79149fb835d762 Kuninori Morimoto   2020-04-01  112          - right_j
79149fb835d762 Kuninori Morimoto   2020-04-01  113          - left_j
79149fb835d762 Kuninori Morimoto   2020-04-01  114          - dsp_a
79149fb835d762 Kuninori Morimoto   2020-04-01  115          - dsp_b
79149fb835d762 Kuninori Morimoto   2020-04-01  116          - ac97
79149fb835d762 Kuninori Morimoto   2020-04-01  117          - pdm
79149fb835d762 Kuninori Morimoto   2020-04-01  118          - msb
79149fb835d762 Kuninori Morimoto   2020-04-01  119          - lsb
79149fb835d762 Kuninori Morimoto   2020-04-01  120  
79149fb835d762 Kuninori Morimoto   2020-04-01  121    dai:
79149fb835d762 Kuninori Morimoto   2020-04-01  122      type: object
79149fb835d762 Kuninori Morimoto   2020-04-01  123      properties:
79149fb835d762 Kuninori Morimoto   2020-04-01  124        sound-dai:
79149fb835d762 Kuninori Morimoto   2020-04-01  125          maxItems: 1
79149fb835d762 Kuninori Morimoto   2020-04-01  126  
79149fb835d762 Kuninori Morimoto   2020-04-01  127        # common properties
79149fb835d762 Kuninori Morimoto   2020-04-01  128        mclk-fs:
79149fb835d762 Kuninori Morimoto   2020-04-01  129          $ref: "#/definitions/mclk-fs"
79149fb835d762 Kuninori Morimoto   2020-04-01  130        prefix:
79149fb835d762 Kuninori Morimoto   2020-04-01  131          $ref: "#/definitions/prefix"
79149fb835d762 Kuninori Morimoto   2020-04-01  132        frame-inversion:
79149fb835d762 Kuninori Morimoto   2020-04-01  133          $ref: "#/definitions/frame-inversion"
79149fb835d762 Kuninori Morimoto   2020-04-01  134        bitclock-inversion:
79149fb835d762 Kuninori Morimoto   2020-04-01  135          $ref: "#/definitions/bitclock-inversion"
79149fb835d762 Kuninori Morimoto   2020-04-01  136        frame-master:
79149fb835d762 Kuninori Morimoto   2020-04-01  137          $ref: /schemas/types.yaml#/definitions/flag
79149fb835d762 Kuninori Morimoto   2020-04-01  138        bitclock-master:
79149fb835d762 Kuninori Morimoto   2020-04-01  139          $ref: /schemas/types.yaml#/definitions/flag
79149fb835d762 Kuninori Morimoto   2020-04-01  140  
79149fb835d762 Kuninori Morimoto   2020-04-01  141        dai-tdm-slot-num:
79149fb835d762 Kuninori Morimoto   2020-04-01  142          $ref: "#/definitions/dai-tdm-slot-num"
79149fb835d762 Kuninori Morimoto   2020-04-01  143        dai-tdm-slot-width:
79149fb835d762 Kuninori Morimoto   2020-04-01  144          $ref: "#/definitions/dai-tdm-slot-width"
79149fb835d762 Kuninori Morimoto   2020-04-01  145        clocks:
79149fb835d762 Kuninori Morimoto   2020-04-01  146          maxItems: 1
79149fb835d762 Kuninori Morimoto   2020-04-01  147        system-clock-frequency:
79149fb835d762 Kuninori Morimoto   2020-04-01  148          $ref: "#/definitions/system-clock-frequency"
79149fb835d762 Kuninori Morimoto   2020-04-01  149        system-clock-direction-out:
79149fb835d762 Kuninori Morimoto   2020-04-01  150          $ref: "#/definitions/system-clock-direction-out"
e9fed03aebacb8 Robert Hancock      2022-01-20  151        system-clock-fixed:
e9fed03aebacb8 Robert Hancock      2022-01-20  152          $ref: "#/definitions/system-clock-fixed"
79149fb835d762 Kuninori Morimoto   2020-04-01  153      required:
79149fb835d762 Kuninori Morimoto   2020-04-01  154        - sound-dai
79149fb835d762 Kuninori Morimoto   2020-04-01  155  
b5f3484117b86c Herve Codina        2023-06-23  156    additional-devs:
b5f3484117b86c Herve Codina        2023-06-23  157      type: object
b5f3484117b86c Herve Codina        2023-06-23  158      description:
b5f3484117b86c Herve Codina        2023-06-23  159        Additional devices used by the simple audio card.
b5f3484117b86c Herve Codina        2023-06-23  160      patternProperties:
b5f3484117b86c Herve Codina        2023-06-23  161        '^iio-aux(-.+)?$':
b5f3484117b86c Herve Codina        2023-06-23  162          type: object
b5f3484117b86c Herve Codina        2023-06-23  163          $ref: audio-iio-aux.yaml#
b5f3484117b86c Herve Codina        2023-06-23  164  
79149fb835d762 Kuninori Morimoto   2020-04-01  165  properties:
79149fb835d762 Kuninori Morimoto   2020-04-01  166    compatible:
79149fb835d762 Kuninori Morimoto   2020-04-01  167      contains:
79149fb835d762 Kuninori Morimoto   2020-04-01  168        enum:
79149fb835d762 Kuninori Morimoto   2020-04-01  169          - simple-audio-card
79149fb835d762 Kuninori Morimoto   2020-04-01  170          - simple-scu-audio-card
79149fb835d762 Kuninori Morimoto   2020-04-01  171  
79149fb835d762 Kuninori Morimoto   2020-04-01  172    "#address-cells":
79149fb835d762 Kuninori Morimoto   2020-04-01  173      const: 1
79149fb835d762 Kuninori Morimoto   2020-04-01  174    "#size-cells":
79149fb835d762 Kuninori Morimoto   2020-04-01  175      const: 0
79149fb835d762 Kuninori Morimoto   2020-04-01  176  
79149fb835d762 Kuninori Morimoto   2020-04-01  177    label:
79149fb835d762 Kuninori Morimoto   2020-04-01  178      $ref: "#/definitions/label"
79149fb835d762 Kuninori Morimoto   2020-04-01  179  
79149fb835d762 Kuninori Morimoto   2020-04-01  180    simple-audio-card,name:
79149fb835d762 Kuninori Morimoto   2020-04-01  181      description: User specified audio sound card name.
79149fb835d762 Kuninori Morimoto   2020-04-01  182      $ref: /schemas/types.yaml#/definitions/string
79149fb835d762 Kuninori Morimoto   2020-04-01  183  
910f42bfe96783 Rob Herring         2022-03-11  184    simple-audio-card,widgets:
79149fb835d762 Kuninori Morimoto   2020-04-01  185      $ref: "#/definitions/widgets"
910f42bfe96783 Rob Herring         2022-03-11  186    simple-audio-card,routing:
79149fb835d762 Kuninori Morimoto   2020-04-01  187      $ref: "#/definitions/routing"
79149fb835d762 Kuninori Morimoto   2020-04-01  188  
79149fb835d762 Kuninori Morimoto   2020-04-01  189    # common properties
910f42bfe96783 Rob Herring         2022-03-11  190    simple-audio-card,frame-master:
79149fb835d762 Kuninori Morimoto   2020-04-01  191      $ref: "#/definitions/frame-master"
910f42bfe96783 Rob Herring         2022-03-11  192    simple-audio-card,bitclock-master:
79149fb835d762 Kuninori Morimoto   2020-04-01  193      $ref: "#/definitions/bitclock-master"
910f42bfe96783 Rob Herring         2022-03-11  194    simple-audio-card,frame-inversion:
79149fb835d762 Kuninori Morimoto   2020-04-01  195      $ref: "#/definitions/frame-inversion"
910f42bfe96783 Rob Herring         2022-03-11  196    simple-audio-card,bitclock-inversion:
79149fb835d762 Kuninori Morimoto   2020-04-01  197      $ref: "#/definitions/bitclock-inversion"
910f42bfe96783 Rob Herring         2022-03-11  198    simple-audio-card,format:
79149fb835d762 Kuninori Morimoto   2020-04-01  199      $ref: "#/definitions/format"
910f42bfe96783 Rob Herring         2022-03-11  200    simple-audio-card,mclk-fs:
79149fb835d762 Kuninori Morimoto   2020-04-01  201      $ref: "#/definitions/mclk-fs"
910f42bfe96783 Rob Herring         2022-03-11  202    simple-audio-card,aux-devs:
79149fb835d762 Kuninori Morimoto   2020-04-01  203      $ref: "#/definitions/aux-devs"
b5f3484117b86c Herve Codina        2023-06-23  204    simple-audio-card,additional-devs:
b5f3484117b86c Herve Codina        2023-06-23  205      $ref: "#/definitions/additional-devs"
910f42bfe96783 Rob Herring         2022-03-11  206    simple-audio-card,convert-rate:
79149fb835d762 Kuninori Morimoto   2020-04-01  207      $ref: "#/definitions/convert-rate"
910f42bfe96783 Rob Herring         2022-03-11  208    simple-audio-card,convert-channels:
79149fb835d762 Kuninori Morimoto   2020-04-01  209      $ref: "#/definitions/convert-channels"
910f42bfe96783 Rob Herring         2022-03-11  210    simple-audio-card,prefix:
79149fb835d762 Kuninori Morimoto   2020-04-01  211      $ref: "#/definitions/prefix"
910f42bfe96783 Rob Herring         2022-03-11  212    simple-audio-card,pin-switches:
79149fb835d762 Kuninori Morimoto   2020-04-01  213      $ref: "#/definitions/pin-switches"
910f42bfe96783 Rob Herring         2022-03-11  214    simple-audio-card,hp-det-gpio:
79149fb835d762 Kuninori Morimoto   2020-04-01  215      maxItems: 1
910f42bfe96783 Rob Herring         2022-03-11  216    simple-audio-card,mic-det-gpio:
79149fb835d762 Kuninori Morimoto   2020-04-01  217      maxItems: 1
79149fb835d762 Kuninori Morimoto   2020-04-01  218  
910f42bfe96783 Rob Herring         2022-03-11  219  patternProperties:
910f42bfe96783 Rob Herring         2022-03-11  220    "^simple-audio-card,cpu(@[0-9a-f]+)?$":
910f42bfe96783 Rob Herring         2022-03-11  221      $ref: "#/definitions/dai"
910f42bfe96783 Rob Herring         2022-03-11  222    "^simple-audio-card,codec(@[0-9a-f]+)?$":
910f42bfe96783 Rob Herring         2022-03-11  223      $ref: "#/definitions/dai"
e7e2b92e609f82 Faiz Abbas          2023-01-17  224    "^simple-audio-card,plat(@[0-9a-f]+)?$":
e7e2b92e609f82 Faiz Abbas          2023-01-17  225      $ref: "#/definitions/dai"
910f42bfe96783 Rob Herring         2022-03-11  226  
79149fb835d762 Kuninori Morimoto   2020-04-01  227    "^simple-audio-card,dai-link(@[0-9a-f]+)?$":
79149fb835d762 Kuninori Morimoto   2020-04-01  228      description: |
79149fb835d762 Kuninori Morimoto   2020-04-01  229        Container for dai-link level properties and the CPU and CODEC sub-nodes.
79149fb835d762 Kuninori Morimoto   2020-04-01  230        This container may be omitted when the card has only one DAI link.
79149fb835d762 Kuninori Morimoto   2020-04-01  231      type: object
79149fb835d762 Kuninori Morimoto   2020-04-01  232      properties:
79149fb835d762 Kuninori Morimoto   2020-04-01  233        reg:
79149fb835d762 Kuninori Morimoto   2020-04-01  234          maxItems: 1
79149fb835d762 Kuninori Morimoto   2020-04-01  235  
9e8593ec9ef74a Kuninori Morimoto   2023-01-23  236        "#address-cells":
9e8593ec9ef74a Kuninori Morimoto   2023-01-23  237          const: 1
9e8593ec9ef74a Kuninori Morimoto   2023-01-23  238        "#size-cells":
9e8593ec9ef74a Kuninori Morimoto   2023-01-23  239          const: 0
79149fb835d762 Kuninori Morimoto   2020-04-01  240        # common properties
79149fb835d762 Kuninori Morimoto   2020-04-01  241        frame-master:
79149fb835d762 Kuninori Morimoto   2020-04-01  242          $ref: "#/definitions/frame-master"
79149fb835d762 Kuninori Morimoto   2020-04-01  243        bitclock-master:
79149fb835d762 Kuninori Morimoto   2020-04-01  244          $ref: "#/definitions/bitclock-master"
79149fb835d762 Kuninori Morimoto   2020-04-01  245        frame-inversion:
79149fb835d762 Kuninori Morimoto   2020-04-01  246          $ref: "#/definitions/frame-inversion"
79149fb835d762 Kuninori Morimoto   2020-04-01  247        bitclock-inversion:
79149fb835d762 Kuninori Morimoto   2020-04-01  248          $ref: "#/definitions/bitclock-inversion"
79149fb835d762 Kuninori Morimoto   2020-04-01  249        format:
79149fb835d762 Kuninori Morimoto   2020-04-01  250          $ref: "#/definitions/format"
79149fb835d762 Kuninori Morimoto   2020-04-01  251        mclk-fs:
79149fb835d762 Kuninori Morimoto   2020-04-01  252          $ref: "#/definitions/mclk-fs"
79149fb835d762 Kuninori Morimoto   2020-04-01  253        aux-devs:
79149fb835d762 Kuninori Morimoto   2020-04-01  254          $ref: "#/definitions/aux-devs"
79149fb835d762 Kuninori Morimoto   2020-04-01  255        convert-rate:
79149fb835d762 Kuninori Morimoto   2020-04-01  256          $ref: "#/definitions/convert-rate"
79149fb835d762 Kuninori Morimoto   2020-04-01  257        convert-channels:
79149fb835d762 Kuninori Morimoto   2020-04-01  258          $ref: "#/definitions/convert-channels"
79149fb835d762 Kuninori Morimoto   2020-04-01  259        prefix:
79149fb835d762 Kuninori Morimoto   2020-04-01  260          $ref: "#/definitions/prefix"
79149fb835d762 Kuninori Morimoto   2020-04-01  261        pin-switches:
79149fb835d762 Kuninori Morimoto   2020-04-01  262          $ref: "#/definitions/pin-switches"
79149fb835d762 Kuninori Morimoto   2020-04-01  263        hp-det-gpio:
79149fb835d762 Kuninori Morimoto   2020-04-01  264          maxItems: 1
79149fb835d762 Kuninori Morimoto   2020-04-01  265        mic-det-gpio:
79149fb835d762 Kuninori Morimoto   2020-04-01  266          maxItems: 1
79149fb835d762 Kuninori Morimoto   2020-04-01  267  
79149fb835d762 Kuninori Morimoto   2020-04-01  268      patternProperties:
cbf74baf022199 Krzysztof Kozlowski 2023-01-09  269        "^cpu(-[0-9]+)?$":
79149fb835d762 Kuninori Morimoto   2020-04-01  270          $ref: "#/definitions/dai"
cbf74baf022199 Krzysztof Kozlowski 2023-01-09  271        "^codec(-[0-9]+)?$":
79149fb835d762 Kuninori Morimoto   2020-04-01  272          $ref: "#/definitions/dai"
79149fb835d762 Kuninori Morimoto   2020-04-01  273      additionalProperties: false
79149fb835d762 Kuninori Morimoto   2020-04-01  274  
79149fb835d762 Kuninori Morimoto   2020-04-01  275  required:
79149fb835d762 Kuninori Morimoto   2020-04-01  276    - compatible
79149fb835d762 Kuninori Morimoto   2020-04-01  277  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
