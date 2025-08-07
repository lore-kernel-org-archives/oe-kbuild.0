Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24306217701
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 18:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754592074; cv=none; b=EsR/HbzqB8+PXqriGM2FRgqp4Cc5CRy8f0+HOqUsIHgF4Hmjv4nsAilOzIlrcYiKMJvvOTiX3YOu5lEBlGtbqg8Pnq7MbNI3lvLvcMMWV2/XITPsu8jybrHAPJgLe+HL23hHgS5lkGU1LtGH21zPP82xAO/7e+t+5AKkfIWgsU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754592074; c=relaxed/simple;
	bh=5feczDMK5UoC+RRaqw8fWQFr/A+0HOchRb8p+lEmyNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GZmM9ZjjQdTiGnap2lymxQkuHiQ5HC3ASvp9BjeIlUdZ0YcpWJkJYbchWUivfk8QX23bYCIUx0ah0BeyvsI+80paAPv2dpFZwgwjuv4pGpAvGC6p8z3k/1ZyeDDVEL7UO1gbTPwm9PneF4vTCWogspg5tcuQz5Om2weD5acLe5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lmWR229H; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lmWR229H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754592073; x=1786128073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5feczDMK5UoC+RRaqw8fWQFr/A+0HOchRb8p+lEmyNs=;
  b=lmWR229HynkT3ILoXZoGA5e27f6Rs8qu4hJpkxC4QYRKkqn3j3dGMCKr
   +EPne78wPEMCxrUHbrmJbHIGGH/t9Ezap+/7DfI6ox5VPYIEDpIulmSno
   TveHqKIdXdNi80wJnvlh73IoxEfcgcAO/Og2orAmgEhAVVeNnRGhqAsQm
   RqqLbhgLsEcD7EY70ZjdYhCDzbmduDK3YnHgXTFYh2FHhZ6uoG50sv2+e
   +9BLWH1ffm9RlV96dtztPTXfrgu8OyC2jreCspfAZz7MkDE4FLX3lrVWY
   gWgtyvIE9o/qO2TQSw4VE7wAXA+5ncI5Heq4d5Bfp24idk6+YE9QUx2JV
   A==;
X-CSE-ConnectionGUID: 1TC1HwTNS7a11tfGprDJWA==
X-CSE-MsgGUID: CWWa0d1TSoqnRJkJR241wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56145724"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56145724"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 11:41:11 -0700
X-CSE-ConnectionGUID: lvqhTJz8R7m+u6Y82sadzQ==
X-CSE-MsgGUID: VTro3tahSIqyL8NuS/3rfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169366527"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 07 Aug 2025 11:41:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk5Y3-000370-0n;
	Thu, 07 Aug 2025 18:41:07 +0000
Date: Fri, 8 Aug 2025 02:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 349/801]
 Documentation/devicetree/bindings/mmc/cavium,octeon-6130-mmc.yaml:
 cavium,bus-max-width: missing type definition
Message-ID: <202508080243.GkJiuUTU-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 9ea2852da48eda381a3ae09b3b25622e337bf3a6 [349/801] dt-bindings: mmc: Convert cavium,octeon-6130-mmc to DT schema
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250808/202508080243.GkJiuUTU-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080243.GkJiuUTU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508080243.GkJiuUTU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/iommu/nvidia,tegra30-smmu.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,tptcs: missing type definition
   Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,edma-reserved-slot-ranges: missing type definition
   Documentation/devicetree/bindings/memory-controllers/atmel,ebi.yaml: atmel,smc-page-mode: missing type definition
   Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-devbus.yaml: devbus,bus-width: missing type definition
>> Documentation/devicetree/bindings/mmc/cavium,octeon-6130-mmc.yaml: cavium,bus-max-width: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: isel: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: fdim: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,short-detection-threshold-volt: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,current-limit-mA: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: bright-addr: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: gpio-ext: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: timers: missing type definition
   Documentation/devicetree/bindings/display/smi-sm501.yaml: edid: missing type definition
   Documentation/devicetree/bindings/cpufreq/operating-points-v2.yaml: opp-supported-hw: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/opp/opp-v2-base.yaml: opp-supported-hw: multiple incompatible types: uint32-matrix

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
