Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDA8234994
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jun 2026 01:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780707873; cv=none; b=M/82QTzD5HGE/GM7JSfNkOBQ72C933B21LNsZ7940xs+qv0tE4a0WsX8jBw+kV03I/iWw5UHprgmEGO6vsoCyhFJQmAZYfjrDXhqLH+M5XIk53b7j+96oQqi8PViIiz9p3Shha5ZmbLgCeY+4zWVNcwHopXdKloWKHUjQfpAk7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780707873; c=relaxed/simple;
	bh=YdZsj17eAUPUFuwMx0BXgxaJVG7zrW4D1NvOk9hsrpw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BUBEwLkZUTFH4GI9mpdurvxUsXwh68reDQCvoe7mO5jQmeYRUS0Y/AKvOYS8Bhud4JtMR82q+wEb3GJIEteuqZ1HrY1YzrJk0nltfJ/o46pftLxuJWA1cVJ015dqQq7DY4LUww6syT9qCU5vobTPFfJsZOaVhkosQVU9arqcaeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=akMZRb1I; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="akMZRb1I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780707871; x=1812243871;
  h=date:from:to:cc:subject:message-id;
  bh=YdZsj17eAUPUFuwMx0BXgxaJVG7zrW4D1NvOk9hsrpw=;
  b=akMZRb1IhiHfSeadWy55S11w1Fodh0JcGkbMqfnS7IKm5C+i9XMoN9aS
   gf/e8nv2C0FL69/RYzOGSlPb5A6w+ImaHkmHXfpMv8PwM6hjYKoXThEO4
   DHTfY+xhlB6a51iqIBHN+1YajzWUwWwty8W+tfXNV3kQJk9nPW+Q/tPIs
   q5YBsfKAc2FYgVLSyBwkX0KnrLB/48LU0d9vN4NMLyJg8rP3dZ1tCp/3+
   sRwqAtFX1FcwvKYK6PaKVz/MCNCCZMcYtY9jwOhl9ErNMRqNP8hCofx8h
   ge/lqwzq1D5aSwN6axDeA2lsTAg90hcAE4KS9t325b2ZLYea9nYYjb4cK
   w==;
X-CSE-ConnectionGUID: qXIwIo+DTS2UMQRwCe45Pg==
X-CSE-MsgGUID: JSvbxx2SQD+s/jYkiZHueg==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="80682004"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="80682004"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 18:04:30 -0700
X-CSE-ConnectionGUID: DzbvfpZOShKIdUnXXg4FJg==
X-CSE-MsgGUID: 833jmD6+RVORGoxYHwtncQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="244138766"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 05 Jun 2026 18:04:29 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVfSc-000000002iZ-1hdr;
	Sat, 06 Jun 2026 01:04:26 +0000
Date: Sat, 06 Jun 2026 03:03:50 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/st/stih410-b2260.dtb:
 /soc/display-controller@9d11000: failed to match any schema with compatible:
 ['st,stih407-compositor']
Message-ID: <202606060320.Sp4sbP5N-lkp@intel.com>
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
TO: "Raphael Gallais-Pou" <rgallaispou@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ddd664bbff63e09e7a7f9acae9c43605d4cf185f
commit: 7891011fbc9a5e0c07af7c032ba04a2e16587c2e ARM: dts: sti: extract display subsystem out of soc
date:   7 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-2055-20260603 (https://download.01.org/0day-ci/archive/20260606/202606060320.Sp4sbP5N-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260606/202606060320.Sp4sbP5N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7891011fbc9a ("ARM: dts: sti: extract display subsystem out of soc")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606060320.Sp4sbP5N-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/sti-uni-player@8d80000: failed to match any schema with compatible: ['st,stih407-uni-player-hdmi']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/sti-uni-player@8d81000: failed to match any schema with compatible: ['st,stih407-uni-player-pcm-out']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/sti-uni-player@8d82000: failed to match any schema with compatible: ['st,stih407-uni-player-dac']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/sti-uni-player@8d85000: failed to match any schema with compatible: ['st,stih407-uni-player-spdif']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/sti-uni-reader@8d83000: failed to match any schema with compatible: ['st,stih407-uni-reader-pcm_in']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/sti-uni-reader@8d84000: failed to match any schema with compatible: ['st,stih407-uni-reader-hdmi']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/usb@9a03c00: failed to match any schema with compatible: ['st,st-ohci-300x']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/usb@9a03e00: failed to match any schema with compatible: ['st,st-ehci-300x']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/usb@9a83c00: failed to match any schema with compatible: ['st,st-ohci-300x']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/usb@9a83e00: failed to match any schema with compatible: ['st,st-ehci-300x']
>> arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/display-controller@9d11000: failed to match any schema with compatible: ['st,stih407-compositor']
>> arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/encoder@8d08000: failed to match any schema with compatible: ['st,stih407-tvout']
>> arch/arm/boot/dts/st/stih410-b2260.dtb: encoder@8d08000 (st,stih407-tvout): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
>> arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/hdmi@8d04000: failed to match any schema with compatible: ['st,stih407-hdmi']
>> arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/analog@8d02000: failed to match any schema with compatible: ['st,stih407-hda']
>> arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/plane@9c00000: failed to match any schema with compatible: ['st,stih407-hqvdp']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/bdisp@9f10000: failed to match any schema with compatible: ['st,stih407-bdisp']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/hva@8c85000: failed to match any schema with compatible: ['st,st-hva']
   arch/arm/boot/dts/st/stih410-b2260.dtb: cpus: cpu@0: 'enable-method' is a dependency of 'cpu-release-addr'
   	from schema $id: http://devicetree.org/schemas/cpus.yaml
   arch/arm/boot/dts/st/stih410-b2260.dtb: cpus: cpu@1: 'enable-method' is a dependency of 'cpu-release-addr'
   	from schema $id: http://devicetree.org/schemas/cpus.yaml
   arch/arm/boot/dts/st/stih410-b2260.dtb: cpu@0 (arm,cortex-a9): 'enable-method' is a dependency of 'cpu-release-addr'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/st/stih410-b2260.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('#cooling-cells', 'clock-names', 'clocks', 'device_type', 'st,syscfg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/st/stih410-b2260.dtb: cpu@1 (arm,cortex-a9): 'enable-method' is a dependency of 'cpu-release-addr'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/st/stih410-b2260.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('#cooling-cells', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/st/stih410-b2260.dtb: /restart-controller: failed to match any schema with compatible: ['st,stih407-restart']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /softreset-controller: failed to match any schema with compatible: ['st,stih407-softreset']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /miphy28lp: failed to match any schema with compatible: ['st,miphy28lp-phy']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /st231-gp0: failed to match any schema with compatible: ['st,st231-rproc']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /st231-delta: failed to match any schema with compatible: ['st,st231-rproc']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /delta0: failed to match any schema with compatible: ['st,st-delta']
>> arch/arm/boot/dts/st/stih410-b2260.dtb: /display-subsystem: failed to match any schema with compatible: ['st,sti-display-subsystem']
>> arch/arm/boot/dts/st/stih410-b2260.dtb: display-subsystem (st,sti-display-subsystem): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
