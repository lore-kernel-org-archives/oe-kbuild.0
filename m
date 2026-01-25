Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9600E14BF92
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 14:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769353153; cv=none; b=Ol4u+6e0GIC/OTB0kT1lMsPFvQib/ccvmj3FbXubYSZGYQps3kaiqA4UBLtEnn4f8kl24VA1/we3cpQNlZHFORnT/kG5u61SjuzPXsVY2LrCJEv/pNtfMVe8o22cU7DSpjAHSbNRqcwDvZAz/ubX1UOOjQPptR7kbNOA6cs3np0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769353153; c=relaxed/simple;
	bh=vTfi9Hk2Nf+M9qFTTweYTzGQQjqJrnFSSrn8PgZzNv8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cCK7gjpaMUZA545iGUMRGrjaUf3sBKop2ZiADd0RsFOByIWbiJD8X/t8LC2hZnx5kABRKkvuBCGQuamvXNgpHTsZ7sKwjvNlMP4WHkMnI5PyFUzb2hFWJdC+xOLo3hUeAyuWnDntL7wliBIwXhLm/pStWRUcgOvJTNQwFrUpzag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQx5itjt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQx5itjt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769353152; x=1800889152;
  h=date:from:to:cc:subject:message-id;
  bh=vTfi9Hk2Nf+M9qFTTweYTzGQQjqJrnFSSrn8PgZzNv8=;
  b=dQx5itjtKyHgy/NSRq6ubZKPkUmFRTchJUdhfHR21ancAhRYueZThgjm
   xJsmMDOaIEh145w72YQ+q1nwRUNKQqdRw3J/fe5HZ9vIjvjmO41HerjXX
   JVmcbOcCgqcB6tFxoFdDdVjSwDaz4Y0G7NYR2u2DUSqfs1BVNltT8+Blj
   dyHCU5VMfpm+V8lFN+ClEYwHsH5uUienegguXJqbQRtfM2xsgkFjQpMIS
   AWSK9vpDx/xVJWD1tl4Q0nu4seRs/ig/4HUtYaal/t6gwZ7Br6ZQLGMje
   Ykc0hsu6MpsJr8FTY+hiMXqgP5to/+wPw6oJhKBq83qQeZ0w83MlqSqu9
   g==;
X-CSE-ConnectionGUID: pzt3TpBvQgS8MWCopPO8rA==
X-CSE-MsgGUID: TiFJy0ToRDS6ovMoGePmHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70262500"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="70262500"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 06:59:12 -0800
X-CSE-ConnectionGUID: lZnDZh1ISTW7bs1QNNVRqg==
X-CSE-MsgGUID: 0R3rN9NZR8uWu1qnaeQBOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="245086679"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 25 Jan 2026 06:59:10 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk1Zz-000000001Ht-3WYJ;
	Sun, 25 Jan 2026 14:59:07 +0000
Date: Sun, 25 Jan 2026 15:58:30 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: spi@700680
 (marvell,armada-380-spi): Unevaluated properties are not allowed
 ('spi-max-frequency' was unexpected)
Message-ID: <202601251557.OcPLqjR9-lkp@intel.com>
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
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d91a46d6805af41e7f2286e0fc22d498f45a682b
commit: 7105fdd54a14bee49371b39374a61b3c967d74cb spi: dt-bindings: Convert marvell,orion-spi to DT schema
date:   7 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-2052-20260123 (https://download.01.org/0day-ci/archive/20260125/202601251557.OcPLqjR9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601251557.OcPLqjR9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601251557.OcPLqjR9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'vbus-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: spi@700680 (marvell,armada-380-spi): Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/marvell,orion-spi.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
