Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F67DD50F
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Nov 2023 12:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VNN0ETn4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700225050; x=1731761050;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=65exnGZZNtCzpOfzolq5v4tnYJ2WE9urfIAHm2N+K4o=;
  b=VNN0ETn4SEKKRZx10wikEyT7cH4X+c5WAMO8SmaqTXQjXXzgWwuwsFf8
   msJeCQIyGiP+35CTZXIS8YhFYtJRmLQoZDSqbaXcsPGYzRXRDa7iyP6KD
   I8q3CKXf1kdWwghTHE08BVAmUo3lUaA9la/ch48Ga0dwZALzmnz4QdyAk
   RjOY2iITTqqwmZ7F7d+7KGbYx5H9XfgZfR5rKtyIcGpXX3ZK3iehYLV58
   aDuMp1xiP4QBw/mYjXQDfc53KOiRBv4sCeItq1ZsodUnE8BT+lvfVaoDl
   lffay8DpEUwE8/uKt5AK1wBEEFuUaeaqs3x2tVYe1M/bm2/nsAnoIyavS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="370646911"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="370646911"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 04:44:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="889232284"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="889232284"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Nov 2023 04:44:08 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3yCb-0002nJ-2h;
	Fri, 17 Nov 2023 12:44:05 +0000
Date: Fri, 17 Nov 2023 20:43:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 1/2] dt-bindings: adc: add AD7173
Message-ID: <202311172002.BPSsTFRY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml:109:10: [error] empty value in block mapping (empty-values)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231116134655.21052-1-user@HYB-hhAwRlzzMZb>
References: <20231116134655.21052-1-user@HYB-hhAwRlzzMZb>
TO: mitrutzceclan <mitrutzceclan@gmail.com>
CC: linus.walleij@linaro.org
CC: brgl@bgdev.pl
CC: andy@kernel.org
CC: linux-gpio@vger.kernel.org
CC: "Lars-Peter Clausen" <lars@metafoo.de>
CC: Jonathan Cameron <jic23@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Michael Walle <michael@walle.cc>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: Arnd Bergmann <arnd@arndb.de>
CC: ChiaEn Wu <chiaen_wu@richtek.com>
CC: Niklas Schnelle <schnelle@linux.ibm.com>
CC: "Leonard Göhrs" <l.goehrs@pengutronix.de>
CC: Mike Looijmans <mike.looijmans@topic.nl>
CC: Haibo Chen <haibo.chen@nxp.com>
CC: Hugo Villeneuve <hvilleneuve@dimonoff.com>
CC: Ceclan Dumitru <dumitru.ceclan@analog.com>
CC: linux-iio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Dumitru Ceclan <mitrutzceclan@gmail.com>

Hi mitrutzceclan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v6.7-rc1 next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mitrutzceclan/iio-adc-ad7173-add-AD7173-driver/20231116-214919
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20231116134655.21052-1-user%40HYB-hhAwRlzzMZb
patch subject: [PATCH v4 1/2] dt-bindings: adc: add AD7173
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231117/202311172002.BPSsTFRY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311172002.BPSsTFRY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml:109:10: [error] empty value in block mapping (empty-values)
--
>> Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml: properties:required: ['compatible', 'reg', 'interrupts'] is not of type 'object', 'boolean'
   	from schema $id: http://json-schema.org/draft-07/schema#
>> Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml: allOf:1:then: None is not of type 'object', 'boolean'
   	from schema $id: http://json-schema.org/draft-07/schema#
>> Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml: allOf:1:else:patternProperties:^channel@[0-9a-f]$:properties:enum: [0, 2, 3] is not of type 'object', 'boolean'
   	from schema $id: http://json-schema.org/draft-07/schema#
>> Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml: allOf:1:else:patternProperties:^channel@[0-9a-f]$:properties: 'enum' should not be valid under {'$ref': '#/definitions/json-schema-prop-names'}
   	hint: A json-schema keyword was found instead of a DT property name.
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml: allOf:1:else:patternProperties:^channel@[0-9a-f]$:properties:enum: [0, 2, 3] is not of type 'object', 'boolean'
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml: properties: 'dependencies' should not be valid under {'$ref': '#/definitions/json-schema-prop-names'}
   	hint: A json-schema keyword was found instead of a DT property name.
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml: properties: 'required' should not be valid under {'$ref': '#/definitions/json-schema-prop-names'}
   	hint: A json-schema keyword was found instead of a DT property name.
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml: properties:dependencies: 'anyOf' conditional failed, one must be fixed:
   	'refin2-supply' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
   	'type' was expected
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml: properties:required: ['compatible', 'reg', 'interrupts'] is not of type 'object', 'boolean'
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
--
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/framebuffer.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/memory-region.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/memory-region.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/reserved-memory.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/shared-dma-pool.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml#'
   Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml: i2c-alias: missing type definition
>> Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml: dependencies: missing type definition
   Documentation/devicetree/bindings/sound/audio-graph.yaml: convert-sample-format: missing type definition
   Documentation/devicetree/bindings/serial/8250_omap.yaml: rs485-rts-active-high: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-odd-pixels: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-even-pixels: missing type definition

vim +109 Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml

6817f96dd6ee22 Dumitru Ceclan 2023-11-16   @1  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
6817f96dd6ee22 Dumitru Ceclan 2023-11-16    2  # Copyright 2023 Analog Devices Inc.
6817f96dd6ee22 Dumitru Ceclan 2023-11-16    3  %YAML 1.2
6817f96dd6ee22 Dumitru Ceclan 2023-11-16    4  ---
6817f96dd6ee22 Dumitru Ceclan 2023-11-16    5  $id: http://devicetree.org/schemas/iio/adc/adi,ad7173.yaml#
6817f96dd6ee22 Dumitru Ceclan 2023-11-16    6  $schema: http://devicetree.org/meta-schemas/core.yaml#
6817f96dd6ee22 Dumitru Ceclan 2023-11-16    7  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16    8  title: Analog Devices AD7173 ADC device driver
6817f96dd6ee22 Dumitru Ceclan 2023-11-16    9  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   10  maintainers:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   11    - Ceclan Dumitru <dumitru.ceclan@analog.com>
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   12  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   13  description: |
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   14    Bindings for the Analog Devices AD717X ADC's. Datasheets for supported chips:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   15      https://www.analog.com/media/en/technical-documentation/data-sheets/AD7172-2.pdf
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   16      https://www.analog.com/media/en/technical-documentation/data-sheets/AD7173-8.pdf
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   17      https://www.analog.com/media/en/technical-documentation/data-sheets/AD7175-2.pdf
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   18      https://www.analog.com/media/en/technical-documentation/data-sheets/AD7176-2.pdf
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   19  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   20  properties:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   21    compatible:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   22      enum:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   23        - adi,ad7172-2
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   24        - adi,ad7173-8
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   25        - adi,ad7175-2
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   26        - adi,ad7176-2
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   27  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   28    reg:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   29      maxItems: 1
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   30  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   31    interrupts:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   32      maxItems: 1
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   33  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   34    '#address-cells':
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   35      const: 1
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   36  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   37    '#size-cells':
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   38      const: 0
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   39  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   40    spi-max-frequency:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   41      maximum: 20000000
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   42  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   43    refin-supply:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   44      description: external reference supply, can be used as reference for conversion.
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   45  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   46    refin2-supply:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   47      description: external reference supply, can be used as reference for conversion.
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   48  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   49    avdd-supply:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   50      description: avdd supply, can be used as reference for conversion.
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   51  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   52    dependencies:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   53      refin2-supply:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   54        properties:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   55          compatible:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   56            adi,ad7173-8
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   57  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   58    required:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   59      - compatible
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   60      - reg
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   61      - interrupts
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   62  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   63  patternProperties:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   64    "^channel@[0-9a-f]$":
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   65      type: object
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   66      $ref: adc.yaml
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   67      unevaluatedProperties: false
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   68  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   69      properties:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   70        reg:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   71          minimum: 0
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   72          maximum: 15
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   73  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   74        diff-channels:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   75          items:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   76            minimum: 0
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   77            maximum: 31
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   78  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   79        adi,reference-select:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   80          description: |
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   81            Select the reference source to use when converting on
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   82            the specific channel. Valid values are:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   83            0: REFIN(+)/REFIN(−).
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   84            1: REFIN2(+)/REFIN2(−)
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   85            2: REFOUT/AVSS (Internal reference)
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   86            3: AVDD
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   87  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   88            External reference 2 only available on ad7173-8.
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   89            If not specified, internal reference used.
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   90          $ref: /schemas/types.yaml#/definitions/uint32
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   91          enum: [0, 1, 2, 3]
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   92          default: 2
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   93  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   94        bipolar:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   95          type: boolean
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   96  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   97      required:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   98        - reg
6817f96dd6ee22 Dumitru Ceclan 2023-11-16   99        - diff-channels
6817f96dd6ee22 Dumitru Ceclan 2023-11-16  100  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16  101  allOf:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16  102    - $ref: /schemas/spi/spi-peripheral-props.yaml#
6817f96dd6ee22 Dumitru Ceclan 2023-11-16  103  
6817f96dd6ee22 Dumitru Ceclan 2023-11-16  104    - if:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16  105        properties:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16  106          compatible:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16  107            contains:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16  108              const: adi,ad7173-8
6817f96dd6ee22 Dumitru Ceclan 2023-11-16 @109      then:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16  110      else:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16  111        patternProperties:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16  112          "^channel@[0-9a-f]$":
6817f96dd6ee22 Dumitru Ceclan 2023-11-16  113            properties:
6817f96dd6ee22 Dumitru Ceclan 2023-11-16  114              enum: [0, 2, 3]
6817f96dd6ee22 Dumitru Ceclan 2023-11-16  115  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
