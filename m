Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B149C2C8
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Mar 2025 01:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741482436; cv=none; b=FXK+bEPblIGJ6muPAz5ockMh0F+WFPhUPptFv0NCa+LV6mOqWS268i4t7x51lrSfxix5ZDWrxpJAl74Be3Ru61kjZChfGa5Llvspw4R+lul0CpvoxVNJ5eCUiUJny5fQlYE6QCtJRwuOwFbmkFDudOFiHemBMJIHcmEnWte+dUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741482436; c=relaxed/simple;
	bh=LrGXxA6B/WulJkR6FeGm5vHLEmX2nYwxm3cYqR4T0yU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ngqz0cdLTHl5C3Jw8bw8DZK6i9MfM+zP888BpMhxp/WAKLRORGHX6GXiRG+oEFPvxDv+wmoGcRJPCGRLiSjWgPuSIHDoTnrjO6sNHx+6JrgJP6N0QexRrLXCB2nS6wjss8n1kx5kFrDyd5a4OFKfRiGDwQ7p5K+mUXi1jWXmIm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IURp9NM3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IURp9NM3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741482432; x=1773018432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LrGXxA6B/WulJkR6FeGm5vHLEmX2nYwxm3cYqR4T0yU=;
  b=IURp9NM3b0a6UFcoyHYgjyzH/398YKoZmj/lfujdofYTAMoOnYkM09lE
   DUOqwmRiVfsUIBoQspWB0bnGPNOGBMAu9LLRQwrH0opGfqrZoZEtn9lNK
   PQ1zrhb5ygJGPtN32OBGzhyK4hCxt6qmw7YF+5KV2XqiHVZOJ+Mv4DJVl
   Fd8sHYjVpLJJbLcwNXXpJdGv40v8kj75bL53/j1rSHF5Q7wl2QgEdlTrZ
   EjnidGvtk3OhFalMopfbs9BR08b6A4+M6feWKfdXLqAIH3T9m4h0UbCDi
   mYtgx3UJch41hZ8Vvmy4n5n3BE64ba+mxoU9s0C/nKWkBi5OyOzjKtZxH
   Q==;
X-CSE-ConnectionGUID: h3HXwwkjSSy0JcSEzfWGSw==
X-CSE-MsgGUID: DTBNfptwQ16O1dslLLCskw==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="41754289"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="41754289"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 17:07:11 -0800
X-CSE-ConnectionGUID: 3pG19ZYYQoy2Z5TmKVJHeg==
X-CSE-MsgGUID: gPWRe+mnQ2yych8UMaBH0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="124741189"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 08 Mar 2025 17:07:10 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tr58F-0002Vc-2Y;
	Sun, 09 Mar 2025 01:07:07 +0000
Date: Sun, 9 Mar 2025 09:06:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: clock: ti: Convert ti-clkctrl.txt to
 json-schema
Message-ID: <202503090807.S1GLjdG8-lkp@intel.com>
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
In-Reply-To: <20250305224722.66360-1-andreas@kemnade.info>
References: <20250305224722.66360-1-andreas@kemnade.info>
TO: Andreas Kemnade <andreas@kemnade.info>
TO: mturquette@baylibre.com
TO: sboyd@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: tony@atomide.com
TO: linux-clk@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-omap@vger.kernel.org
CC: Andreas Kemnade <andreas@kemnade.info>

Hi Andreas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.14-rc5 next-20250306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Kemnade/dt-bindings-clock-ti-Convert-ti-clkctrl-txt-to-json-schema/20250306-064856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20250305224722.66360-1-andreas%40kemnade.info
patch subject: [PATCH] dt-bindings: clock: ti: Convert ti-clkctrl.txt to json-schema
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-053-20250307 (https://download.01.org/0day-ci/archive/20250309/202503090807.S1GLjdG8-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503090807.S1GLjdG8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503090807.S1GLjdG8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-gmac-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@300: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@300: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@400: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@500: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@20: 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@600: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@700: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@700: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@760: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
--
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-gmac-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: clock@300: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@300: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: clock@400: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: clock@500: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/am572x-idk.dtb: clock@20: 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: clock@600: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: clock@700: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@700: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: clock@760: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-gmac-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: clock@300: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@300: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: clock@400: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: clock@500: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: clock@20: 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: clock@600: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: clock@700: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@700: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: clock@760: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-gmac-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: clock@300: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@300: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: clock@400: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: clock@500: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: clock@20: 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: clock@600: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: clock@700: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@700: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: clock@760: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-gmac-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: clock@300: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@300: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: clock@400: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: clock@500: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: clock@20: 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: clock@600: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: clock@700: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@700: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: clock@760: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
--
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-gmac-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: clock@300: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@300: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: clock@400: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: clock@500: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: clock@20: 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: clock@600: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: clock@700: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@700: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: clock@760: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
--
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-gmac-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: clock@300: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@300: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: clock@400: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: clock@500: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: clock@20: 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: clock@600: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: clock@700: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@700: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: clock@760: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
--
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-gmac-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: clock@300: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@300: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: clock@400: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: clock@500: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: clock@20: 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: clock@600: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: clock@700: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@700: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: clock@760: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
--
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-gmac-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: clock@300: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@300: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: clock@400: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: clock@500: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/am574x-idk.dtb: clock@20: 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: clock@600: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: clock@700: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@700: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: clock@760: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
--
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-gmac-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: clock@300: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@300: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: clock@400: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: clock@500: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/dra7-evm.dtb: clock@20: 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: clock@600: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: clock@700: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@700: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: clock@760: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
--
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-gmac-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: clock@300: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@300: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: clock@400: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: clock@500: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/dra72-evm.dtb: clock@20: 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: clock@600: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: clock@700: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@700: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: clock@760: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
--
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-gmac-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: clock@300: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@300: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: clock@400: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: clock@500: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: clock@20: 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: clock@600: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: clock@700: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@700: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: clock@760: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
--
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-gmac-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: clock@300: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@300: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: clock@400: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: clock@500: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/dra71-evm.dtb: clock@20: 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: clock@600: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: clock@700: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@700: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: clock@760: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
--
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-gmac-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: clock@300: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@300: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: clock@400: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: clock@500: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/dra76-evm.dtb: clock@20: 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: clock@600: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: clock@700: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@700: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: clock@760: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
--
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: prcm@180000: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: prcm@180000: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/l4ls@48000000/prcm@180000: failed to match any schema with compatible: ['ti,dm814-prcm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/l4ls@48000000/prcm@180000/clocks/sysclk4_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/l4ls@48000000/prcm@180000/clocks/sysclk5_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/l4ls@48000000/prcm@180000/clocks/sysclk6_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/l4ls@48000000/prcm@180000/clocks/sysclk8_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/l4ls@48000000/prcm@180000/default_cm@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: clk@0: 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/l4ls@48000000/prcm@180000/alwon_cm@1400: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: clk@0: 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/l4ls@48000000/prcm@180000/alwon_ethernet_cm@15d4: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: clk@0: 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: pllss@1c5000: $nodename:0: 'pllss@1c5000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: pllss@1c5000: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: pllss@1c5000: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/l4ls@48000000/pllss@1c5000: failed to match any schema with compatible: ['ti,dm814-pllss', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@40: failed to match any schema with compatible: ['ti,dm814-adpll-s-clock']
   arch/arm/boot/dts/ti/omap/am3874-iceboard.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@80: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
--
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: prcm@180000: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: prcm@180000: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/l4ls@48000000/prcm@180000: failed to match any schema with compatible: ['ti,dm814-prcm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/l4ls@48000000/prcm@180000/clocks/sysclk4_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/l4ls@48000000/prcm@180000/clocks/sysclk5_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/l4ls@48000000/prcm@180000/clocks/sysclk6_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/l4ls@48000000/prcm@180000/clocks/sysclk8_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/l4ls@48000000/prcm@180000/default_cm@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: clk@0: 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/l4ls@48000000/prcm@180000/alwon_cm@1400: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: clk@0: 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/l4ls@48000000/prcm@180000/alwon_ethernet_cm@15d4: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: clk@0: 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: pllss@1c5000: $nodename:0: 'pllss@1c5000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: pllss@1c5000: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: pllss@1c5000: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000: failed to match any schema with compatible: ['ti,dm814-pllss', 'simple-bus']
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@40: failed to match any schema with compatible: ['ti,dm814-adpll-s-clock']
   arch/arm/boot/dts/ti/omap/dm8148-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@80: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
--
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: prcm@180000: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: prcm@180000: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/l4ls@48000000/prcm@180000: failed to match any schema with compatible: ['ti,dm814-prcm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/l4ls@48000000/prcm@180000/clocks/sysclk4_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/l4ls@48000000/prcm@180000/clocks/sysclk5_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/l4ls@48000000/prcm@180000/clocks/sysclk6_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/l4ls@48000000/prcm@180000/clocks/sysclk8_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/l4ls@48000000/prcm@180000/default_cm@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: clk@0: 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/l4ls@48000000/prcm@180000/alwon_cm@1400: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: clk@0: 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/l4ls@48000000/prcm@180000/alwon_ethernet_cm@15d4: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: clk@0: 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: pllss@1c5000: $nodename:0: 'pllss@1c5000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: pllss@1c5000: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: pllss@1c5000: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/l4ls@48000000/pllss@1c5000: failed to match any schema with compatible: ['ti,dm814-pllss', 'simple-bus']
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@40: failed to match any schema with compatible: ['ti,dm814-adpll-s-clock']
   arch/arm/boot/dts/ti/omap/dm8148-t410.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@80: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
--
   arch/arm/boot/dts/ti/omap/dm8168-evm.dtb: ocp: $nodename:0: 'ocp' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dm8168-evm.dtb: prcm@48180000: $nodename:0: 'prcm@48180000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dm8168-evm.dtb: prcm@48180000: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dm8168-evm.dtb: prcm@48180000: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dm8168-evm.dtb: /ocp/prcm@48180000: failed to match any schema with compatible: ['ti,dm816-prcm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/dm8168-evm.dtb: /ocp/prcm@48180000/default_cm@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/dm8168-evm.dtb: clk@0: 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/dm8168-evm.dtb: /ocp/prcm@48180000/alwon_cm@1400: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/dm8168-evm.dtb: clk@0: 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/dm8168-evm.dtb: scrm@48140000: $nodename:0: 'scrm@48140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dm8168-evm.dtb: scrm@48140000: audio_fapll: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dm8168-evm.dtb: scrm@48140000: ddr_fapll: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dm8168-evm.dtb: scrm@48140000: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dm8168-evm.dtb: scrm@48140000: video_fapll: 'ranges' is a required property
--
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: prcm@180000: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: prcm@180000: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/l4ls@48000000/prcm@180000: failed to match any schema with compatible: ['ti,dm814-prcm', 'simple-bus']
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/l4ls@48000000/prcm@180000/clocks/sysclk4_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/l4ls@48000000/prcm@180000/clocks/sysclk5_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/l4ls@48000000/prcm@180000/clocks/sysclk6_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/l4ls@48000000/prcm@180000/clocks/sysclk8_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/l4ls@48000000/prcm@180000/default_cm@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: clk@0: 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/l4ls@48000000/prcm@180000/alwon_cm@1400: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: clk@0: 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/l4ls@48000000/prcm@180000/alwon_ethernet_cm@15d4: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: clk@0: 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: pllss@1c5000: $nodename:0: 'pllss@1c5000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: pllss@1c5000: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: pllss@1c5000: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000: failed to match any schema with compatible: ['ti,dm814-pllss', 'simple-bus']
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@40: failed to match any schema with compatible: ['ti,dm814-adpll-s-clock']
   arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dtb: /ocp/l4ls@48000000/pllss@1c5000/adpll@80: failed to match any schema with compatible: ['ti,dm814-adpll-lj-clock']
--
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-gmac-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: clock@300: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@300: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: clock@400: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: clock@500: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: clock@20: 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: clock@600: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: clock@700: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@700: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: clock@760: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
--
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-gmac-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: clock@300: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@300: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: clock@400: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: clock@500: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: clock@20: 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: clock@600: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: clock@700: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@700: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: clock@760: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
--
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-gmac-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: clock@300: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@300: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: clock@400: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: clock@500: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: clock@20: 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: clock@600: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: clock@700: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@700: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: clock@760: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
--
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-gmac-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: clock@300: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@300: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: clock@400: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: clock@500: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@500: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: clock@20: 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: clock@600: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: clock@700: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@700: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: clock@760: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
