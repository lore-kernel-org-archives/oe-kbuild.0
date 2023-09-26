Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317EF34CE3
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Sep 2023 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695748218; x=1727284218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d5DG9Tq9Jgv2a2XSTdF3qmQP1WZOVfhMFWMnHvsLv1Q=;
  b=eyXZObCnRrK8yWg7/wecLAvnhTFUPjuBK1viWoy5trAr9eR9+7y4q6MW
   bsjMsM5FxhF1xuAG/hT1mxMfH/LTigJu8HYEde8SFwqBWvc6fRc8qIoV3
   sZ+InmyNnzMk0v6s7Vzn60EOgigltilkbN6gWVrgjV9VxXthJ+Itl99MY
   sBa/pMyit5fCGXO3L5TNr5yVxAnQOZG3X/UCVFEFFTP4PP0Iiz/zVJcdu
   0WprqUtLmGxNV+qba9r6UQGET559K/lZFGf67JjziyXboqze9AKK55HSk
   p6L5ncF3xqPDVU7a49ie+OcgUNXnsC8ZmSbD4tCJBNwVeNkn5lzoFLpaS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="445750511"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="445750511"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 10:10:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="814549135"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="814549135"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 26 Sep 2023 10:10:13 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlBZb-00039O-1G;
	Tue, 26 Sep 2023 17:10:11 +0000
Date: Wed, 27 Sep 2023 01:09:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC net-next v1 1/2] dt-bindings: net: dsa: microchip: Update
 ksz device tree bindings for drive strength
Message-ID: <202309270045.gQJdIegS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml:54:9: [warning] wrong indentation: expected 6 but found 8 (indentation)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230905124340.4116542-1-o.rempel@pengutronix.de>
References: <20230905124340.4116542-1-o.rempel@pengutronix.de>
TO: Oleksij Rempel <o.rempel@pengutronix.de>

Hi Oleksij,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Oleksij-Rempel/net-dsa-microchip-ksz9477-Add-drive-strength-configuration/20230905-204634
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230905124340.4116542-1-o.rempel%40pengutronix.de
patch subject: [RFC net-next v1 1/2] dt-bindings: net: dsa: microchip: Update ksz device tree bindings for drive strength
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309270045.gQJdIegS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309270045.gQJdIegS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml:54:9: [warning] wrong indentation: expected 6 but found 8 (indentation)
   Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml:62:9: [warning] wrong indentation: expected 6 but found 8 (indentation)

vim +54 Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml

4f36d97786c6ab Christian Eggers  2020-11-20   8  
4f36d97786c6ab Christian Eggers  2020-11-20   9  maintainers:
4f36d97786c6ab Christian Eggers  2020-11-20  10    - Marek Vasut <marex@denx.de>
4f36d97786c6ab Christian Eggers  2020-11-20  11    - Woojung Huh <Woojung.Huh@microchip.com>
4f36d97786c6ab Christian Eggers  2020-11-20  12  
4f36d97786c6ab Christian Eggers  2020-11-20  13  allOf:
3cec368a8beca1 Colin Foster      2023-01-12  14    - $ref: dsa.yaml#/$defs/ethernet-ports
bbba69ef4795c4 Rob Herring       2022-05-31  15    - $ref: /schemas/spi/spi-peripheral-props.yaml#
4f36d97786c6ab Christian Eggers  2020-11-20  16  
4f36d97786c6ab Christian Eggers  2020-11-20  17  properties:
4f36d97786c6ab Christian Eggers  2020-11-20  18    # See Documentation/devicetree/bindings/net/dsa/dsa.yaml for a list of additional
4f36d97786c6ab Christian Eggers  2020-11-20  19    # required and optional properties.
4f36d97786c6ab Christian Eggers  2020-11-20  20    compatible:
4f36d97786c6ab Christian Eggers  2020-11-20  21      enum:
4f36d97786c6ab Christian Eggers  2020-11-20  22        - microchip,ksz8765
4f36d97786c6ab Christian Eggers  2020-11-20  23        - microchip,ksz8794
4f36d97786c6ab Christian Eggers  2020-11-20  24        - microchip,ksz8795
61df0e7bbb90fa Michael Grzeschik 2021-04-27  25        - microchip,ksz8863
61df0e7bbb90fa Michael Grzeschik 2021-04-27  26        - microchip,ksz8873
4f36d97786c6ab Christian Eggers  2020-11-20  27        - microchip,ksz9477
4f36d97786c6ab Christian Eggers  2020-11-20  28        - microchip,ksz9897
4f36d97786c6ab Christian Eggers  2020-11-20  29        - microchip,ksz9896
4f36d97786c6ab Christian Eggers  2020-11-20  30        - microchip,ksz9567
4f36d97786c6ab Christian Eggers  2020-11-20  31        - microchip,ksz8565
4f36d97786c6ab Christian Eggers  2020-11-20  32        - microchip,ksz9893
4f36d97786c6ab Christian Eggers  2020-11-20  33        - microchip,ksz9563
4f36d97786c6ab Christian Eggers  2020-11-20  34        - microchip,ksz8563
4f36d97786c6ab Christian Eggers  2020-11-20  35  
4f36d97786c6ab Christian Eggers  2020-11-20  36    reset-gpios:
4f36d97786c6ab Christian Eggers  2020-11-20  37      description:
4f36d97786c6ab Christian Eggers  2020-11-20  38        Should be a gpio specifier for a reset line.
4f36d97786c6ab Christian Eggers  2020-11-20  39      maxItems: 1
4f36d97786c6ab Christian Eggers  2020-11-20  40  
4f36d97786c6ab Christian Eggers  2020-11-20  41    microchip,synclko-125:
4f36d97786c6ab Christian Eggers  2020-11-20  42      $ref: /schemas/types.yaml#/definitions/flag
4f36d97786c6ab Christian Eggers  2020-11-20  43      description:
4f36d97786c6ab Christian Eggers  2020-11-20  44        Set if the output SYNCLKO frequency should be set to 125MHz instead of 25MHz.
4f36d97786c6ab Christian Eggers  2020-11-20  45  
eccfecfe587b49 Robert Hancock    2022-01-27  46    microchip,synclko-disable:
eccfecfe587b49 Robert Hancock    2022-01-27  47      $ref: /schemas/types.yaml#/definitions/flag
eccfecfe587b49 Robert Hancock    2022-01-27  48      description:
eccfecfe587b49 Robert Hancock    2022-01-27  49        Set if the output SYNCLKO clock should be disabled. Do not mix with
eccfecfe587b49 Robert Hancock    2022-01-27  50        microchip,synclko-125.
eccfecfe587b49 Robert Hancock    2022-01-27  51  
8a2ddd3e164cf1 Oleksij Rempel    2023-09-05  52    microchip,hi-drive-strength-microamp:
8a2ddd3e164cf1 Oleksij Rempel    2023-09-05  53      description:
8a2ddd3e164cf1 Oleksij Rempel    2023-09-05 @54          High Speed Drive Strength. Controls drive strength of GMII / RGMII /
8a2ddd3e164cf1 Oleksij Rempel    2023-09-05  55          MII / RMII (except TX_CLK/REFCLKI, COL and CRS) and CLKO_25_125 lines.
8a2ddd3e164cf1 Oleksij Rempel    2023-09-05  56      minimum: 2000
8a2ddd3e164cf1 Oleksij Rempel    2023-09-05  57      maximum: 28000
8a2ddd3e164cf1 Oleksij Rempel    2023-09-05  58      default: 24000
8a2ddd3e164cf1 Oleksij Rempel    2023-09-05  59  
8a2ddd3e164cf1 Oleksij Rempel    2023-09-05  60    microchip,lo-drive-strength-microamp:
8a2ddd3e164cf1 Oleksij Rempel    2023-09-05  61      description:
8a2ddd3e164cf1 Oleksij Rempel    2023-09-05  62          Low Speed Drive Strength. Controls drive strength of TX_CLK / REFCLKI,
8a2ddd3e164cf1 Oleksij Rempel    2023-09-05  63          COL, CRS, LEDs, PME_N, NTRP_N, SDO and SDI/SDA/MDIO lines.
8a2ddd3e164cf1 Oleksij Rempel    2023-09-05  64      minimum: 2000
8a2ddd3e164cf1 Oleksij Rempel    2023-09-05  65      maximum: 28000
8a2ddd3e164cf1 Oleksij Rempel    2023-09-05  66      default: 8000
8a2ddd3e164cf1 Oleksij Rempel    2023-09-05  67  
4f36d97786c6ab Christian Eggers  2020-11-20  68  required:
4f36d97786c6ab Christian Eggers  2020-11-20  69    - compatible
4f36d97786c6ab Christian Eggers  2020-11-20  70    - reg
4f36d97786c6ab Christian Eggers  2020-11-20  71  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
