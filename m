Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03F6242D79
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Dec 2025 20:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766953260; cv=none; b=V9ioH/4OoPOSmzRfqB7owWbxgEJA6cNw6LM/uXEpVPxCoNBUJO7vacInOmcE+j7UitVk3cE3Os60tL4wdB5Je9NgM8gmQKsZQMxd4+tcZlrmd+isdzY6dlKVh8+mXEgVZ+omwZh0TDKyRbMQ7j0eMP2wHMmd3vUSnS6D17kwwVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766953260; c=relaxed/simple;
	bh=5qAtkZfWfSoztR/ZdmzD1aLTbSIJPnc0KbI9Utm5IFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uwA4uhN6VVkjdzwufWB5rMj6Jn6joqaaDF5YcOPK1Z1MTzCxSz8y0Ye9ZlfkyeAzmW4s4toDAlLgKA17nUhBDeZtnWPYLxDQJR3kuJlW1pALpzf5VdsPT4rguVCS5pfue+Sv1QFx5uLhQ+t19vG00+PVMD67ujL9MqpMy5KdvEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCoyjJlk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCoyjJlk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766953258; x=1798489258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5qAtkZfWfSoztR/ZdmzD1aLTbSIJPnc0KbI9Utm5IFo=;
  b=lCoyjJlkhyoJBg1GapLNIaIeCZCI06nqb1GJpUKlPRni/91HAhFePtu3
   JTRkCXPckmm1EmC2f1EBhANjFsfiER1ZZHeYhQtcRtRy61yG3S1IuRxxl
   0bBhbAdTxsxbMcXTXFBryrnKc5Sa36Z6EFogaY+sl8F20uhjnQJDtp7nF
   SVla2mBFPPa1j2Amlffcl0HONvepLWCh9x61Q7B7lwfT4sGIwbVF5otcJ
   tONJqE5O/y/r+XCaVJ5vYMLC/8M8O9cfNgJJMnMPHu3cshIoTDPi4/eJl
   HOpVOnotFLJViH2pNsnjncaT+CAcRTGvsm1tpe0A32DJOyvg2VRxJ15QA
   w==;
X-CSE-ConnectionGUID: arxK6ivCQgGS6HfJyzaZdA==
X-CSE-MsgGUID: +R3mPn3TTHOwOKUPGmyiaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="72208136"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="72208136"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 12:20:58 -0800
X-CSE-ConnectionGUID: EuS9hayqQ1q5tJExczYPtg==
X-CSE-MsgGUID: arq5MNv8QkKzYyGhEV8/NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="201694319"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 28 Dec 2025 12:20:57 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZxG2-000000007aa-3bwK;
	Sun, 28 Dec 2025 20:20:54 +0000
Date: Sun, 28 Dec 2025 21:20:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 1/2] media: dt-bindings: i2c: toshiba,et8ek8: Convert
 to DT schema
Message-ID: <202512282121.NnXOE2cL-lkp@intel.com>
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
In-Reply-To: <20251225-dt-bindings-et8ek8-omap3isp-v3-1-b027e0db69a5@gmail.com>
References: <20251225-dt-bindings-et8ek8-omap3isp-v3-1-b027e0db69a5@gmail.com>
TO: Alex Tran <alex.t.tran@gmail.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Pavel Machek <pavel@kernel.org>
TO: Sakari Ailus <sakari.ailus@linux.intel.com>
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Alex Tran <alex.t.tran@gmail.com>

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fa084c35afa13ab07a860ef0936cd987f9aa0460]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Tran/media-dt-bindings-i2c-toshiba-et8ek8-Convert-to-DT-schema/20251226-050407
base:   fa084c35afa13ab07a860ef0936cd987f9aa0460
patch link:    https://lore.kernel.org/r/20251225-dt-bindings-et8ek8-omap3isp-v3-1-b027e0db69a5%40gmail.com
patch subject: [PATCH v3 1/2] media: dt-bindings: i2c: toshiba,et8ek8: Convert to DT schema
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-2052-20251227 (https://download.01.org/0day-ci/archive/20251228/202512282121.NnXOE2cL-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512282121.NnXOE2cL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512282121.NnXOE2cL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/serial@4806c000/bluetooth: failed to match any schema with compatible: ['brcm,bcm2048-nokia', 'nokia,h4p-bluetooth']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/serial@4806c000/bluetooth: failed to match any schema with compatible: ['brcm,bcm2048-nokia', 'nokia,h4p-bluetooth']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48072000/led-controller@30: failed to match any schema with compatible: ['adi,adp1653']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48072000/si4713@63: failed to match any schema with compatible: ['silabs,si4713']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: camera@3e (toshiba,et8ek8): port:endpoint: Unevaluated properties are not allowed ('clock-inv', 'crc' were unexpected)
   	from schema $id: http://devicetree.org/schemas/media/i2c/toshiba,et8ek8.yaml
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: camera@3e (toshiba,et8ek8): 'reset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/toshiba,et8ek8.yaml
>> arch/arm/boot/dts/ti/omap/omap3-n900.dtb: camera@3e (toshiba,et8ek8): Unevaluated properties are not allowed ('clock-frequency', 'clock-names', 'reset-gpio' were unexpected)
   	from schema $id: http://devicetree.org/schemas/media/i2c/toshiba,et8ek8.yaml
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: tsc2005@0 (ti,tsc2005): $nodename:0: 'tsc2005@0' does not match '^touchscreen(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/spi@480ba000/wl1251@0: failed to match any schema with compatible: ['ti,wl1251']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
