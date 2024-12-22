Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3C228E7
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 02:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734833056; cv=none; b=gFD00DzW9F2sYy4WnGtTDMaKjJ7/L3hHXt/w2nPQHQO+E+bfvaFotuxrky6l+yMWgwpjzyUY/rWMIzAy7/9ThZsXdk3exgLxmziAYJjGYL2VLDDUx7v+6Yd2V1ue/BwKsDWwjgyIqNuJMHMDeRgdIys97HGgFLZHRZFWy+W6Q4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734833056; c=relaxed/simple;
	bh=X75lk+16iyS0JI2EE9BrRfVLtY73cFf7VtIRA+7Jk7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lfQgUJiHfLuKwdAwnntvIqfGAJWF+yQLCsCtvhzbWMYVIRQxmnEy5jhEQG98zMiSP9rhicJ67J3zz2k+HEputXNb0eTzE/BBlmvDOBM61bhlkgv+V2MB7uJUt372SlcICPfVVY8lPmhUju6KPLgWhqP4MDi3odWf5fLMBKtNGdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lo0YWSOf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lo0YWSOf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734833054; x=1766369054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X75lk+16iyS0JI2EE9BrRfVLtY73cFf7VtIRA+7Jk7Q=;
  b=Lo0YWSOf5JtO9m4J+bx7QOEVexWsEb4CXCVvq2f/z+yzTp5ON5PzAvXa
   3SREbiBqSzVENXU30EWb5i7pc+Q7QgZumulDxx1p2XDY7lPhJWesiG5/Z
   CqdgsHvi4VE4TChGfZ3PYuCvdvwbSlhsBIzkuL8ZaK8lpir3eslDG6rea
   GKM+JK8us67nZWuP4GamTPNYa9J3B2mpVKNhpaM0Jxpzic/Qah0gcC1Rj
   gDPSGXaMSaR7P34Bhcluf3QVHn1yC6zTwFVlCMn9ciud5Y13j8zagbh8b
   sw3BbDbuyNnzcj5cN8NrIRcLwWkb5UNrmM05EyYPYQ1RlyjscjZwJZdef
   w==;
X-CSE-ConnectionGUID: VY0VDBGjRcSU/DhUoHiAtg==
X-CSE-MsgGUID: 2ezFNhFrTz+DkNfdJTkzxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="46756736"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="46756736"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 18:04:11 -0800
X-CSE-ConnectionGUID: CeAkm4UcSWeqsr9y6GPr+g==
X-CSE-MsgGUID: cgKDane5TD2maP7AUq5sJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="99396170"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Dec 2024 18:04:10 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPBKC-0002fD-0I;
	Sun, 22 Dec 2024 02:04:08 +0000
Date: Sun, 22 Dec 2024 10:03:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 5/7] arm64: dts: ti: k3-am62: Mark mcu_mcan0/1 as
 wakeup-source
Message-ID: <202412220937.8DqF2HMa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241219-topic-mcan-wakeup-source-v6-12-v6-5-1356c7f7cfda@baylibre.com>
References: <20241219-topic-mcan-wakeup-source-v6-12-v6-5-1356c7f7cfda@baylibre.com>
TO: "Markus Schneider-Pargmann" <msp@baylibre.com>

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 40384c840ea1944d7c5a392e8975ed088ecf0b37]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Schneider-Pargmann/dt-bindings-can-m_can-Add-wakeup-properties/20241220-040614
base:   40384c840ea1944d7c5a392e8975ed088ecf0b37
patch link:    https://lore.kernel.org/r/20241219-topic-mcan-wakeup-source-v6-12-v6-5-1356c7f7cfda%40baylibre.com
patch subject: [PATCH v6 5/7] arm64: dts: ti: k3-am62: Mark mcu_mcan0/1 as wakeup-source
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220937.8DqF2HMa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220937.8DqF2HMa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412220937.8DqF2HMa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am625-sk.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: can@4e08000: Unevaluated properties are not allowed ('wakeup-source' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: can@4e08000: Unevaluated properties are not allowed ('wakeup-source' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dtb: can@4e08000: Unevaluated properties are not allowed ('wakeup-source' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: can@4e08000: Unevaluated properties are not allowed ('wakeup-source' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: can@4e08000: Unevaluated properties are not allowed ('wakeup-source' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: can@4e08000: Unevaluated properties are not allowed ('wakeup-source' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: can@4e08000: Unevaluated properties are not allowed ('wakeup-source' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dtb: can@4e08000: Unevaluated properties are not allowed ('wakeup-source' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: can@4e08000: Unevaluated properties are not allowed ('wakeup-source' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: can@4e08000: Unevaluated properties are not allowed ('wakeup-source' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtb: camera@3c: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtb: camera@3c: 'DVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtb: camera@3c: 'DOVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtb: camera@3c: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtb: camera@3c: 'DVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtb: camera@3c: 'DOVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-imx219.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-imx219.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-imx219.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-imx219.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-imx219.dtb: i2c-switch@71: $nodename:0: 'i2c-switch@71' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-imx219.dtb: i2c-switch@71: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-imx219.dtb: camera@10: 'VANA-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-imx219.dtb: camera@10: 'VDIG-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-imx219.dtb: camera@10: 'VDDL-supply' is a required property
--
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: i2c-switch@71: $nodename:0: 'i2c-switch@71' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: i2c-switch@71: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: camera@3c: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: camera@3c: 'DVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: camera@3c: 'DOVDD-supply' is a required property
--
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-tevi-ov5640.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-tevi-ov5640.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-tevi-ov5640.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-tevi-ov5640.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-tevi-ov5640.dtb: i2c-switch@71: $nodename:0: 'i2c-switch@71' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-tevi-ov5640.dtb: i2c-switch@71: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-tevi-ov5640.dtb: camera@3c: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-tevi-ov5640.dtb: camera@3c: 'DVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-tevi-ov5640.dtb: camera@3c: 'DOVDD-supply' is a required property
--
>> arch/arm64/boot/dts/ti/k3-am625-sk-hdmi-audio.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-hdmi-audio.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-hdmi-audio.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-hdmi-audio.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
