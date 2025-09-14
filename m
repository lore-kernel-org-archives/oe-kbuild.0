Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0F01E8322
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Sep 2025 09:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757843658; cv=none; b=QSniomDdnloooBOenvB0a8RkSHmZK28WWlQRVudD/PtERIsmlCx+nbZkGhZZ9mSFFNF9nViHuisxqToAYntxJk6EyOia2K5X2pcZrv/t23ojUS3aMjkwHWK0bKyXiMAELLOYuwyLQNS8B/KUq4pwEsRNgRTVsqzRzRFLUxbEdnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757843658; c=relaxed/simple;
	bh=/y6BRvLdbVL6F4QT/mCRY5g2ObqnPBB8FeJIji99JLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B6oPn09jxga9r7xtS5XAZ0TkqJgERPorZGwCgZDOwztAyn/jfxVGxYfYxhNVWlve51H7+tJRsgSecIw/+/3xE5rDWHR6/u3wUZ78mvAFV2tfbBt5YGJkK0cYT/T+AvsBI2qCDMJzo8GkGy1hfTdjHT8Ff5q6BJdIS4O9vWvD/oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BDukeaeX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BDukeaeX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757843655; x=1789379655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/y6BRvLdbVL6F4QT/mCRY5g2ObqnPBB8FeJIji99JLg=;
  b=BDukeaeXiE5fCJ4UGnywwoQrJMkUegAFPdZlLQqmTdkgDuD/PROTllpj
   FO+VUfdePpExSny86hjNcgvARiB1GAUoNP7Af7GmBuktVAlRymvUDPcIN
   bO2m0odLOfjxHX1tPXWYE7xxOE/ZSWOcdwU6c8jLhwNr4kE3ysqSjlJVm
   nHBIVfWlojVHLFBPbZU21YdMlsF8M28cHuDJA5OnuGc51lYrc1m1vQmTG
   cDoi3PG+3l/udib1ftQEm93yd3ZvGlRsfHjyjaNpcgp687ngAUvl/qw7v
   Px58aRb8sTd7Wl1PmqaeAU5OhWxxbH40FwvfWYy1cH8LyjJtpVGZ66Zgh
   Q==;
X-CSE-ConnectionGUID: U20H/59RSpiHt30PPRJamA==
X-CSE-MsgGUID: a+RNddOBQUO3MyHSPQfNkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="77734610"
X-IronPort-AV: E=Sophos;i="6.18,263,1751266800"; 
   d="scan'208";a="77734610"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 02:54:15 -0700
X-CSE-ConnectionGUID: gFmplkfyRyWRw8D6jrItHg==
X-CSE-MsgGUID: X2A6dX6WQaKtx2f/CrpZ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,263,1751266800"; 
   d="scan'208";a="211524591"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 14 Sep 2025 02:54:14 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxjQx-0002Ii-15;
	Sun, 14 Sep 2025 09:54:11 +0000
Date: Sun, 14 Sep 2025 17:54:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: leds: as3645: Convert to DT schema
Message-ID: <202509141751.v85VqbzA-lkp@intel.com>
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
In-Reply-To: <20250909-ams-txt-to-dt-schema-v1-1-8a30c25c8295@thegoodpenguin.co.uk>
References: <20250909-ams-txt-to-dt-schema-v1-1-8a30c25c8295@thegoodpenguin.co.uk>
TO: Harrison Carter <hcarter@thegoodpenguin.co.uk>
TO: Lee Jones <lee@kernel.org>
TO: Pavel Machek <pavel@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: linux-leds@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Harrison Carter <hcarter@thegoodpenguin.co.uk>

Hi Harrison,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9]

url:    https://github.com/intel-lab-lkp/linux/commits/Harrison-Carter/dt-bindings-leds-as3645-Convert-to-DT-schema/20250909-165436
base:   c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
patch link:    https://lore.kernel.org/r/20250909-ams-txt-to-dt-schema-v1-1-8a30c25c8295%40thegoodpenguin.co.uk
patch subject: [PATCH] dt-bindings: leds: as3645: Convert to DT schema
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-051-20250910 (https://download.01.org/0day-ci/archive/20250914/202509141751.v85VqbzA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509141751.v85VqbzA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509141751.v85VqbzA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/serial@4806c000/bluetooth: failed to match any schema with compatible: ['ti,wl1271-bluetooth-nokia', 'nokia,h4p-bluetooth']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/serial@4806c000/bluetooth: failed to match any schema with compatible: ['ti,wl1271-bluetooth-nokia', 'nokia,h4p-bluetooth']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/i2c@48070000/twl@48: failed to match any schema with compatible: ['ti,twl5031']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power']
>> arch/arm/boot/dts/ti/omap/omap3-n9.dtb: as3645a@30 (ams,as3645a): 'flash@0', 'indicator@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/ams,as3645a.yaml#
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: camera@10 (nokia,smia): port:endpoint: 'bus-type' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/mipi-ccs.yaml#
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: lis302@1d (st,lis3lv02d): 'Vdd-supply', 'Vdd_IO-supply', 'st,axis-x', 'st,axis-y', 'st,axis-z', 'st,click-latency', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-threshold-x', 'st,click-threshold-y', 'st,click-threshold-z', 'st,click-time-limit', 'st,highpass-cutoff-hz', 'st,irq1-ff-wu-1', 'st,irq1-ff-wu-2', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-threshold', 'st,wakeup-x-hi', 'st,wakeup-y-hi', 'st,wakeup2-threshold', 'st,wakeup2-z-hi', 'st,wu-duration-1', 'st,wu-duration-2' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
--
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/serial@4806c000/bluetooth: failed to match any schema with compatible: ['ti,wl1271-bluetooth-nokia', 'nokia,h4p-bluetooth']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/serial@4806c000/bluetooth: failed to match any schema with compatible: ['ti,wl1271-bluetooth-nokia', 'nokia,h4p-bluetooth']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/i2c@48070000/twl@48: failed to match any schema with compatible: ['ti,twl5031']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
>> arch/arm/boot/dts/ti/omap/omap3-n950.dtb: as3645a@30 (ams,as3645a): 'flash@0', 'indicator@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/ams,as3645a.yaml#
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: camera@10 (nokia,smia): port:endpoint: 'bus-type' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/mipi-ccs.yaml#
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: lis302@1d (st,lis3lv02d): 'Vdd-supply', 'Vdd_IO-supply', 'st,axis-x', 'st,axis-y', 'st,axis-z', 'st,click-latency', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-threshold-x', 'st,click-threshold-y', 'st,click-threshold-z', 'st,click-time-limit', 'st,highpass-cutoff-hz', 'st,irq1-ff-wu-1', 'st,irq1-ff-wu-2', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-threshold', 'st,wakeup-x-hi', 'st,wakeup-y-hi', 'st,wakeup2-threshold', 'st,wakeup2-z-hi', 'st,wu-duration-1', 'st,wu-duration-2' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
