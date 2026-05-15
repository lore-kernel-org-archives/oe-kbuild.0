Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DC11E511
	for <oe-kbuild@lists.linux.dev>; Fri, 15 May 2026 00:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778804648; cv=none; b=IMuJdmxXtZsdionoz8ZTlbJM2hKu7ZtWWi6CukKmESI+WvQC+b+c8PHkW/uBvSm14Nmfg6GirA5pWWBEwTVOrBsyVxHecfErDcrJKLSUwtvNt0GUJYA9hqQYDynX8wpgL08Eni8rcVXm089whTti9YY4lWjqDnNEU3YjAQSZ5rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778804648; c=relaxed/simple;
	bh=+AKQ8NvpyBo4rsPJmH8T+7jiyBsmS9YanX7JcD9QtJI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HNHSVv3mdT08vM6IVg9moiy0+JPN4vQfN6XENZjICt5SkLk3nQGbcy1FF3wmUI5/oI9AEMFlhdPLLcszQxHzvxbiqehuYS7h5QU1D+xiO0bvchswBb9X3JgX5d0fjd1r4CLmmj8b/ohwdMsEeX4aixtmHtTU+py7dJ/D12CT1PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CpO4e8bM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CpO4e8bM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778804646; x=1810340646;
  h=date:from:to:cc:subject:message-id;
  bh=+AKQ8NvpyBo4rsPJmH8T+7jiyBsmS9YanX7JcD9QtJI=;
  b=CpO4e8bMY1p16yfI2Axz6AbXHEsIddThJsl0jKIiD17Nbp0R1DmGztbT
   RY8GSouxXqCAfDTzl9HXc7UhcmwoVdFsGE/GUnOCldCWAm9Z+SMtf7ExN
   5uReCgil7y5MoJJqyJ93SVuOS+SNrnIE3VrqZgHAduxqcnISWjRLgOynK
   bN3BItO/vdc4UTQvxdZlGMhX9VergfAdnJTycy5WOixPihy3P9hUmQmMN
   xgvrnYiLW3EKKcez01RuXVIDYx1UCQwZYKyl2zuiLurUS+BNbfNNBERt3
   8NesMn+rHeYscJFaG8HLOao2xAn36q3F4WLu0P+z9+fwgrKKzld9BPIX/
   A==;
X-CSE-ConnectionGUID: 7Wlf+2xQSw6agFU4C/5VYw==
X-CSE-MsgGUID: 89I0l08BT1WDMUWGFp535Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="102432909"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="102432909"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 17:24:05 -0700
X-CSE-ConnectionGUID: 7t0ajDXSSdKhEixnvypiRA==
X-CSE-MsgGUID: ixhQ4qoQQFGg2+/BNKxr2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="235495257"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 14 May 2026 17:24:04 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNgLS-000000008uX-0jfZ;
	Fri, 15 May 2026 00:24:02 +0000
Date: Fri, 15 May 2026 02:23:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/nspire/nspire-tp.dtb: timer@900d0000
 (lsi,zevio-timer): 'clock-names' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202605150225.stfZ4P8u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e1914add2799225a87502051415fc5c32aeb02ae
commit: e1e9fad1499c029e6052b13e9974f5cc2ccf7c89 dt-bindings: timer: Convert lsi,zevio-timer to DT schema
date:   12 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-2052-20260506 (https://download.01.org/0day-ci/archive/20260515/202605150225.stfZ4P8u-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150225.stfZ4P8u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e1e9fad1499c ("dt-bindings: timer: Convert lsi,zevio-timer to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605150225.stfZ4P8u-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nspire/nspire.dtsi:44.21-47.4: Warning (unit_address_vs_reg): /base_clk: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/nspire/nspire.dtsi:49.19-53.4: Warning (unit_address_vs_reg): /ahb_clk: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/nspire/nspire.dtsi:130.16-220.5: Warning (unit_address_vs_reg): /ahb/apb@90000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nspire/nspire-tp.dtb: /base_clk: failed to match any schema with compatible: ['lsi,nspire-classic-clock']
   arch/arm/boot/dts/nspire/nspire-tp.dtb: /ahb_clk: failed to match any schema with compatible: ['lsi,nspire-classic-ahb-divider']
   arch/arm/boot/dts/nspire/nspire-tp.dtb: apb@90000000 (simple-bus): 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
>> arch/arm/boot/dts/nspire/nspire-tp.dtb: timer@900d0000 (lsi,zevio-timer): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/lsi,zevio-timer.yaml
>> arch/arm/boot/dts/nspire/nspire-tp.dtb: timer@900d0000 (lsi,zevio-timer): clocks: [[9], [9], [9]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/lsi,zevio-timer.yaml
   arch/arm/boot/dts/nspire/nspire-tp.dtb: /ahb/interrupt-controller@dc000000: failed to match any schema with compatible: ['lsi,zevio-intc']
--
   arch/arm/boot/dts/nspire/nspire.dtsi:44.21-47.4: Warning (unit_address_vs_reg): /base_clk: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/nspire/nspire.dtsi:49.19-53.4: Warning (unit_address_vs_reg): /ahb_clk: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/nspire/nspire.dtsi:130.16-220.5: Warning (unit_address_vs_reg): /ahb/apb@90000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nspire/nspire-clp.dtb: /base_clk: failed to match any schema with compatible: ['lsi,nspire-classic-clock']
   arch/arm/boot/dts/nspire/nspire-clp.dtb: /ahb_clk: failed to match any schema with compatible: ['lsi,nspire-classic-ahb-divider']
   arch/arm/boot/dts/nspire/nspire-clp.dtb: apb@90000000 (simple-bus): 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
>> arch/arm/boot/dts/nspire/nspire-clp.dtb: timer@900d0000 (lsi,zevio-timer): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/lsi,zevio-timer.yaml
>> arch/arm/boot/dts/nspire/nspire-clp.dtb: timer@900d0000 (lsi,zevio-timer): clocks: [[9], [9], [9]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/lsi,zevio-timer.yaml
   arch/arm/boot/dts/nspire/nspire-clp.dtb: /ahb/interrupt-controller@dc000000: failed to match any schema with compatible: ['lsi,zevio-intc']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
