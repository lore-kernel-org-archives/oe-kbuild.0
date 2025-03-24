Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF561DB933
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Mar 2025 23:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742857386; cv=none; b=EtYGojwWSmQ2Eo8w5z2EUB5MmDfvMuKlXWEH6zS7lRQ9R/3I7tL2AUJfMWb9aNfaslaboPA3sLoCvCdteIxdKsqGl/d7JSD9DbrbW863AzhJUWmSGFvAGpPpRYwmYcwnvoGLNilVhWLDuih0wlpJbNR1jc5GkuAVoWjajSmg0K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742857386; c=relaxed/simple;
	bh=0u59y3AAE5eTQ+S8FN6L0ZvUSxk+RXV8zdvtLqWwWec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XVav36zUEFW8WsBKHoPztk6wnqQqTLJCa6pts7ttPrUiChHqmCQnGaTH8zl9O1jnEJhyafmKbBDLwQAm+UCpcVv+TSSx6n4poxDjFo3a6Wf46lEmXPUWPzdDb494OP1jdOr8iXaVjMRpLNx9n5ImLD98L8aEOEwtiWM/rs5xQFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CiGtZYRh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CiGtZYRh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742857383; x=1774393383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0u59y3AAE5eTQ+S8FN6L0ZvUSxk+RXV8zdvtLqWwWec=;
  b=CiGtZYRh1EXnDNUTOXEXoxvnN3dGTw/UUXkJ14+iLrUjKU7v10ERUdBy
   lTbpWoRn1fkOkkbDmsuyn/rVBxcTeB45QUdvIH4CbF0IogzUVLJDIVzCF
   +d5jDZs5ePd6uvbCaWc3HXTUl7cjNhK+LNL7/4OtcxAkZGd/hpYvAGSW5
   Qyave9OEb1ZGRi5FzwvqHTB5H0jVOmsFQE6720A87RbSbvUrcF9wiF877
   ZWaEyCQp2X/P2Fa++eWhPER+WOiOc6UbWkNDpZOS6GoD+NXLR06bmkAPT
   sQ7RvBryTS7B9xVO94EdHD4KyeSLe9j9SBtBxv5lB6/7nM2m+k0wd4/bW
   w==;
X-CSE-ConnectionGUID: 4Y/gD40STpS265GpNXQwQA==
X-CSE-MsgGUID: Kc0HJBgcTzmGmyoUuhMFvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="55081881"
X-IronPort-AV: E=Sophos;i="6.14,273,1736841600"; 
   d="scan'208";a="55081881"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 16:03:00 -0700
X-CSE-ConnectionGUID: DKs78ruuQ5CpAQPGaJnXJg==
X-CSE-MsgGUID: 660zDmnISeal2Vbq+rR96Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,273,1736841600"; 
   d="scan'208";a="125130174"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 24 Mar 2025 16:02:58 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twqop-000407-2B;
	Mon, 24 Mar 2025 23:02:55 +0000
Date: Tue, 25 Mar 2025 07:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [net-next 1/4] ARM: dts: aspeed-g6:add scu to mac for RGMII delay
Message-ID: <202503250509.XoABmMln-lkp@intel.com>
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
In-Reply-To: <20250317025922.1526937-2-jacky_chou@aspeedtech.com>
References: <20250317025922.1526937-2-jacky_chou@aspeedtech.com>
TO: Jacky Chou <jacky_chou@aspeedtech.com>
TO: andrew+netdev@lunn.ch
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: joel@jms.id.au
TO: andrew@codeconstruct.com.au
TO: ratbert@faraday-tech.com
TO: netdev@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-aspeed@lists.ozlabs.org
CC: BMC-SW@aspeedtech.com

Hi Jacky,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacky-Chou/ARM-dts-aspeed-g6-add-scu-to-mac-for-RGMII-delay/20250317-110446
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250317025922.1526937-2-jacky_chou%40aspeedtech.com
patch subject: [net-next 1/4] ARM: dts: aspeed-g6:add scu to mac for RGMII delay
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm-randconfig-052-20250318 (https://download.01.org/0day-ci/archive/20250325/202503250509.XoABmMln-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503250509.XoABmMln-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503250509.XoABmMln-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'aspeed,ast2600-evb-a1' is not one of ['amd,daytonax-bmc', 'amd,ethanolx-bmc', 'ampere,mtjade-bmc', 'aspeed,ast2500-evb', 'asrock,e3c246d4i-bmc', 'asrock,e3c256d4i-bmc', 'asrock,romed8hm3-bmc', 'asrock,spc621d8hm3-bmc', 'asrock,x570d4u-bmc', 'bytedance,g220a-bmc', 'facebook,cmm-bmc', 'facebook,minipack-bmc', 'facebook,tiogapass-bmc', 'facebook,yamp-bmc', 'facebook,yosemitev2-bmc', 'facebook,wedge400-bmc', 'hxt,stardragon4800-rep2-bmc', 'ibm,mihawk-bmc', 'ibm,mowgli-bmc', 'ibm,romulus-bmc', 'ibm,swift-bmc', 'ibm,witherspoon-bmc', 'ingrasys,zaius-bmc', 'inspur,fp5280g2-bmc', 'inspur,nf5280m6-bmc', 'inspur,on5263m5-bmc', 'intel,s2600wf-bmc', 'inventec,lanyang-bmc', 'lenovo,hr630-bmc', 'lenovo,hr855xg2-bmc', 'portwell,neptune-bmc', 'qcom,centriq2400-rep-bmc', 'supermicro,x11spi-bmc', 'tyan,s7106-bmc', 'tyan,s8036-bmc', 'yadro,nicole-bmc', 'yadro,vegman-n110-bmc', 'yadro,vegman-rx20-bmc', 'yadro,vegman-sx20-bmc']
   	'aspeed,ast2400' was expected
   	'aspeed,ast2500' was expected
   	'aspeed,ast2600' was expected
   	from schema $id: http://devicetree.org/schemas/arm/aspeed/aspeed.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: ethernet@1e660000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: ethernet@1e680000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: ethernet@1e670000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: ethernet@1e660000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: ethernet@1e680000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: ethernet@1e670000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: ethernet@1e660000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts:672.10-692.4: Warning (avoid_unnecessary_addr_size): /ahb/apb/bus@1e78a000/i2c@480/gpio@77: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: ethernet@1e660000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:638.36-642.7: Warning (unique_unit_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicate unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: ethernet@1e670000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: adc@1e6e9000: 'interrupts', 'vref' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: adc@1e6e9100: 'interrupts', 'vref' do not match any of the regexes: 'pinctrl-[0-9]+'
--
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /: spi1-gpio: {'compatible': ['spi-gpio'], '#address-cells': 1, '#size-cells': 0, 'gpio-sck': [51, 203, 0], 'gpio-mosi': [51, 204, 0], 'gpio-miso': [51, 205, 0], 'num-chipselects': 1, 'cs-gpios': [[51, 200, 1]], 'tpm@0': {'compatible': ['infineon,slb9670', 'tcg,tpm_tis-spi'], 'spi-max-frequency': 33000000, 'reg': [[0]]}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: ethernet@1e670000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: adc@1e6e9000: 'interrupts', 'vref' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: adc@1e6e9100: 'interrupts', 'vref' do not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: ethernet@1e670000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi:12.11-15.4: Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partitions/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/flash@0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi:12.11-15.4: Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partitions/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/flash@0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:638.36-642.7: Warning (unique_unit_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicate unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: ethernet@1e670000: Unevaluated properties are not allowed ('mellanox,multi-host', 'scu' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('mellanox,multi-host', 'scu' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: ethernet@1e670000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	'ibm,bonnell-bmc' is not one of ['ampere,mtjefferson-bmc', 'ampere,mtmitchell-bmc', 'aspeed,ast2600-evb', 'aspeed,ast2600-evb-a1', 'asus,x4tf-bmc', 'facebook,bletchley-bmc', 'facebook,catalina-bmc', 'facebook,cloudripper-bmc', 'facebook,elbert-bmc', 'facebook,fuji-bmc', 'facebook,greatlakes-bmc', 'facebook,harma-bmc', 'facebook,minerva-cmc', 'facebook,yosemite4-bmc', 'ibm,blueridge-bmc', 'ibm,everest-bmc', 'ibm,fuji-bmc', 'ibm,rainier-bmc', 'ibm,sbp1-bmc', 'ibm,system1-bmc', 'ibm,tacoma-bmc', 'inventec,starscream-bmc', 'inventec,transformer-bmc', 'jabil,rbp-bmc', 'qcom,dc-scm-v1-bmc', 'quanta,s6q-bmc', 'ufispace,ncplite-bmc']
   	'aspeed,ast2400' was expected
   	'aspeed,ast2500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/aspeed/aspeed.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /: failed to match any schema with compatible: ['ibm,bonnell-bmc', 'aspeed,ast2600']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: ethernet@1e670000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts:3629.18-3636.6: Warning (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@6,0/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts:4002.18-4009.6: Warning (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@7,0/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: ethernet@1e670000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: ethernet@1e670000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi:808.18-815.6: Warning (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi:1181.18-1188.6: Warning (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: ethernet@1e670000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi:808.18-815.6: Warning (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi:1181.18-1188.6: Warning (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: ethernet@1e670000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi:808.18-815.6: Warning (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi:1181.18-1188.6: Warning (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: ethernet@1e670000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: ethernet@1e670000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:618.27-623.7: Warning (unique_unit_address_if_enabled): /ahb/apb/lpc@1e789000/lpc-ctrl@80: duplicate unit-address (also used in node /ahb/apb/lpc@1e789000/lpc-snoop@80)
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: ethernet@1e670000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts:283.18-285.6: Warning (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts:384.18-386.6: Warning (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: ethernet@1e670000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: ethernet@1e670000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:638.36-642.7: Warning (unique_unit_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicate unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: ethernet@1e670000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: adc@1e6e9000: 'interrupts', 'vref' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: adc@1e6e9100: 'interrupts', 'vref' do not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:638.36-642.7: Warning (unique_unit_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicate unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: ethernet@1e670000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: ethernet@1e690000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dts:105.19-134.4: Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:638.36-642.7: Warning (unique_unit_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicate unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: ethernet@1e670000: Unevaluated properties are not allowed ('scu' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: adc@1e6e9000: 'interrupts', 'vref' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: adc@1e6e9100: 'interrupts', 'vref' do not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
