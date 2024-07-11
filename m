Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74F78479
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jul 2024 15:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720712794; cv=none; b=PRAdLtC8mBDt18K93TEx3qUkpLgcCivrICIbOsHSuOsDg/kK0VUj/2+1eEVaLPKbYFneOjjXVj0iRrRs1Se8YxFrMwb03ikQN9XPXNxBDbLjW5kQ663OankdlQWfSRsFtDrBPruOcdKjtfPyduO4NiW5rHuhLYrA/2zJQUh062c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720712794; c=relaxed/simple;
	bh=FtcbNkQ0Jd9Eo00BTyCYneYHpsGGScRradd/XnaSQhE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SxSe3xEwL/NS6K4VxOhWmHG0sopIQFIadKJdLEtlcNVLODOCB6MgES7DAIKdrv2Sr6MfBz9jUtHve8TOiAYu9tw+2ypHIAiwZQ2BNSDceD9b0/x/D8WSCXcKps1ueQg/5Q2HaqvjSNpKi14b0pcHeXuJ2vPbAcu9slz5SmVEvrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I//pP55s; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I//pP55s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720712792; x=1752248792;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FtcbNkQ0Jd9Eo00BTyCYneYHpsGGScRradd/XnaSQhE=;
  b=I//pP55scmNi1vkHh2WfrHNuMEaixmrUdpAabccfBGoFRhbVBozy2FKT
   ah6VGR992nh8uOY/zys34qo/wIkg4fHJX0RHVeEWGFwYxKI+n9tmfeUQP
   VNWGn7RM++jKdQsS4EsqZnBPqsajoeMaPPJEkn9Z1+ckPGwHmfBIqC6su
   fN19X3ZY8pJJOVBvR57Js5r1eQfffIxfV87/epZQcjhcHlrZ+kLRptM3C
   Dk3OHwf3APvmJ13+pBCHxeKhb1xvxGUe9NrYcmVMmc1aaj+b5lXswQqF1
   TohWElJEfChj3W+Jq1e20v1BJAyqP8AYx0GvQrPC2bOLgSEDkMuk+l+nW
   g==;
X-CSE-ConnectionGUID: mIh2nkTGRcGEUaiuCjcIJw==
X-CSE-MsgGUID: lwdRYu9cQl+gbRvVw6NI7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17924803"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="17924803"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 08:46:31 -0700
X-CSE-ConnectionGUID: hK4uYLWmRP+XenlvcrXwew==
X-CSE-MsgGUID: TzoXfKJHRMmbIeRHjzyguQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="52916286"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jul 2024 08:46:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRw04-000ZS1-0U;
	Thu, 11 Jul 2024 15:46:28 +0000
Date: Thu, 11 Jul 2024 23:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 3/6] dt-bindings: iio: dac: Generalize DAC common
 properties
Message-ID: <202407112353.CAZ5Jz40-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240711114221.62386-4-kimseer.paller@analog.com>
References: <20240711114221.62386-4-kimseer.paller@analog.com>
TO: Kim Seer Paller <kimseer.paller@analog.com>
TO: linux-kernel@vger.kernel.org
TO: linux-iio@vger.kernel.org
TO: devicetree@vger.kernel.org
CC: Jonathan Cameron <jic23@kernel.org>
CC: David Lechner <dlechner@baylibre.com>
CC: "Lars-Peter Clausen" <lars@metafoo.de>
CC: Liam Girdwood <lgirdwood@gmail.com>
CC: Mark Brown <broonie@kernel.org>
CC: Dimitri Fedrau <dima.fedrau@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Michael Hennerich <michael.hennerich@analog.com>
CC: "Nuno Sá" <noname.nuno@gmail.com>
CC: Kim Seer Paller <kimseer.paller@analog.com>

Hi Kim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1ebab783647a9e3bf357002d5c4ff060c8474a0a]

url:    https://github.com/intel-lab-lkp/linux/commits/Kim-Seer-Paller/iio-ABI-Generalize-ABI-documentation-for-DAC/20240711-214749
base:   1ebab783647a9e3bf357002d5c4ff060c8474a0a
patch link:    https://lore.kernel.org/r/20240711114221.62386-4-kimseer.paller%40analog.com
patch subject: [PATCH v6 3/6] dt-bindings: iio: dac: Generalize DAC common properties
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: arm-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407112353.CAZ5Jz40-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407112353.CAZ5Jz40-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407112353.CAZ5Jz40-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: kcs@28: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: kcs@2c: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: kcs@114: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2500-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2500-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: /ahb/apb/bus@1e78a000/interrupt-controller@0: failed to match any schema with compatible: ['aspeed,ast2500-i2c-ic']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: channel@0: 'oneOf' conditional failed, one must be fixed:
   	'output-range-microamp' is a required property
   	'output-range-microvolt' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/dac/dac.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: channel@1: 'oneOf' conditional failed, one must be fixed:
   	'output-range-microamp' is a required property
   	'output-range-microvolt' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/dac/dac.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: channel@2: 'oneOf' conditional failed, one must be fixed:
   	'output-range-microamp' is a required property
   	'output-range-microvolt' is a required property
--
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: kcs@2c: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: kcs@114: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2500-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2500-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/apb/bus@1e78a000/interrupt-controller@0: failed to match any schema with compatible: ['aspeed,ast2500-i2c-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/apb/bus@1e78a000/i2c-bus@100/power-supply@58: failed to match any schema with compatible: ['pmbus']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/apb/bus@1e78a000/i2c-bus@100/power-supply@59: failed to match any schema with compatible: ['pmbus']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: channel@0: 'oneOf' conditional failed, one must be fixed:
   	'output-range-microamp' is a required property
   	'output-range-microvolt' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/dac/dac.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: channel@1: 'oneOf' conditional failed, one must be fixed:
   	'output-range-microamp' is a required property
   	'output-range-microvolt' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/dac/dac.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: channel@2: 'oneOf' conditional failed, one must be fixed:
   	'output-range-microamp' is a required property
   	'output-range-microvolt' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
