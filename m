Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BF53803C7
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 21:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783026807; cv=none; b=FD3n+P68Hnfr7dfcexExOw5jtlcS/mFf1XX/va7EK5HV/9MkJIFbC0Y3t3gsYqHbTW89+9Bc+2j8LvNF9c2HuzzxvwEB/RfrFL784ywCKEQLaABWETEgwKMi4DVGcwTL2tHsJuZQVVGd7Cj8t45zlKfry3vA5M+McfwsIZMsyxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783026807; c=relaxed/simple;
	bh=YNDRXs2Vz9c7F+39of3P1kWBR3sKD+i7spjFiy7B7RU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u6l4TFm22SB5zGain0gom2js9AT97/vBOk3/AmGvc1AJCk3UNbVQBaTDLl6ebSGOKRmztaDnol7tu7d+wSLCiqdVjy5sTqKlVrWTrL/oCHBGrEof0dPy5UHq+KVA6IQL2Mu7gPa4/HPi0MsN+kWc3n7SDyCsLMiXoImONIv8T00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j8bbMdsV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8bbMdsV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783026805; x=1814562805;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YNDRXs2Vz9c7F+39of3P1kWBR3sKD+i7spjFiy7B7RU=;
  b=j8bbMdsV6UmHBusVr3rslYm0SVpatZgf7tnUoTJeP2Oh8eGcj6elFNZ7
   P+7OXjvc9rrep0E4xkg3itivT7/03BiWqYz2Ms/9VtiRmYoPKBaBY2IwL
   wV133TIVmagk45R6VGR471Pflpz/Aoj0qlWqQ2/sFN0xemRF9AydnYQgy
   tloBeLDu7C6COEoKb4hOMCZFLOkIZMSj9XHlGPsvN1vjKyKrEoluq4+8/
   Uocytt/yvwk5UJOv/R0buQGVLYgqgzH80lPCsb4DzTGpCSJJSQLY684vH
   974vI/y4JGrKJBamxzwavyHM4TttnHR3CwDHLQkCvyF4FXnNwJh/ga9kC
   A==;
X-CSE-ConnectionGUID: MKacjBjASDaWlnM5uqcYLw==
X-CSE-MsgGUID: nJQqmEUbRNS7I+GysjZKIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="86326528"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="86326528"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 14:13:24 -0700
X-CSE-ConnectionGUID: E28N4zQXTjau8hHWhsWr5g==
X-CSE-MsgGUID: vwBTA+45Tp6kUeP+mlng7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="249607934"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jul 2026 14:13:23 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfOin-000000001IL-18yw;
	Thu, 02 Jul 2026 21:13:21 +0000
Date: Thu, 2 Jul 2026 23:12:22 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] rtc: s35390a: make use of interrupt signal 1
Message-ID: <202607022332.TCDi7Xuj-lkp@intel.com>
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
In-Reply-To: <20260630-rtc_s35390a_int1-v1-3-1b2239e16be2@posteo.de>
References: <20260630-rtc_s35390a_int1-v1-3-1b2239e16be2@posteo.de>
TO: Markus Probst <markus.probst@posteo.de>
TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Uwe Kleine-König" <uwe@kleine-koenig.org>
TO: Andrew Lunn <andrew@lunn.ch>
TO: Gregory Clement <gregory.clement@bootlin.com>
TO: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rtc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Markus Probst <markus.probst@posteo.de>

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 728e68a889bcf257b1e67298b12c360e5c3a13e0]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Probst/dt-bindings-rtc-Add-sii-wakealarm-output-pin-property-for-S35390A/20260701-032724
base:   728e68a889bcf257b1e67298b12c360e5c3a13e0
patch link:    https://lore.kernel.org/r/20260630-rtc_s35390a_int1-v1-3-1b2239e16be2%40posteo.de
patch subject: [PATCH 3/3] rtc: s35390a: make use of interrupt signal 1
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2051-20260701 (https://download.01.org/0day-ci/archive/20260702/202607022332.TCDi7Xuj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607022332.TCDi7Xuj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607022332.TCDi7Xuj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000/clockdomains/dss_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000/clockdomains/core_l4_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: s35390a@30 (sii,s35390a): $nodename:0: 's35390a@30' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/sii,s35390a.yaml
>> arch/arm/boot/dts/ti/omap/am3517-evm.dtb: s35390a@30 (sii,s35390a): Unevaluated properties are not allowed ('interrupts-extended' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/sii,s35390a.yaml
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/i2c@48070000/tps65023@48: failed to match any schema with compatible: ['ti,tps65023']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: tsc2004@4b (ti,tsc2004): $nodename:0: 'tsc2004@4b' does not match '^touchscreen(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/i2c@48060000/tvp5146@5c: failed to match any schema with compatible: ['ti,tvp5146m2']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
