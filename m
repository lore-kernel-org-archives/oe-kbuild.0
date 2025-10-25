Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12C127453
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Oct 2025 05:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761370274; cv=none; b=INjmuhXrXnM5smWA8gnVPOL5yPUMtb2HKRdqTTKNEwL2zO6hXh4sc5qPqh2CPSQkiXhU3sTKAwEwOUNS19mEd80bJafo+6J1UZX8pVHBC0Qw4kRDJkg31Sp5AKDwX3/S9jxuvRJpMUqOeaObbdznaDCpLyodQXfXYLFkI78Webk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761370274; c=relaxed/simple;
	bh=fGPutgDQvQcYFtZ6tsqUK61Kb6DvuMHE1JZyrddsCvo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ek+VnBuGEAh8yFhhOj35az21SS00Wmx6mL21rZrhM8G3iESJ0Sqipf0azvUSgsSVfmlzkedSDhctTK/ZpdhRRop7VXpArN1AdqEyFnXcfR9U3jvVCqtmbirr6TOsm/K4+vg3s/vqrj5sWfP8IJDzC1dbMbLAk6516dEVrsNDD7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XY+SPB2Z; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XY+SPB2Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761370272; x=1792906272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fGPutgDQvQcYFtZ6tsqUK61Kb6DvuMHE1JZyrddsCvo=;
  b=XY+SPB2Z/MXQgPDjACZpcf895lmL2NtW45HbxqJa3utQnDI/vemOCYaw
   gZWRGl1eEGjo0bKO9m081T1z5BOiFlJEu125RPurv53ilt4WoJSGA8I7M
   Ye6skwwhXOtj7JuCpNlBPQRVnZNTl48ndhRK62RXYvzqVX1o2GWD/adbM
   BpN5QM6MCnuHU8yfIJ9TYN1ddTg9TGK7qNtO/h+m3w2eKNhhEoQvJc4zp
   bvb3jnHlcGrBRMaHXWsmcEcPk1geGyZA9Au5NFopJryW5X32xBd1wn6Lo
   EiOwmwpK7HWavMQW4SC8/AfwQQYxfc5EdXUor7RXjks52gpxWWhtwRYbW
   Q==;
X-CSE-ConnectionGUID: AS+8wTLQS4GKzNJWkR5m+Q==
X-CSE-MsgGUID: itEBG2xDSLytbwT+m2Xgvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63434781"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="63434781"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 22:31:11 -0700
X-CSE-ConnectionGUID: w06OfLPEQlqkgRUYbozCQQ==
X-CSE-MsgGUID: hoRwx7GEQeqytVBpPn07UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="184202041"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 Oct 2025 22:31:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCWrr-000F7t-2z;
	Sat, 25 Oct 2025 05:31:07 +0000
Date: Sat, 25 Oct 2025 13:30:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/ixp4xx-netgear-wgr826v 3/8]
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: gpio@c8004000
 (intel,ixp4xx-gpio): 'clock-hog', 'unknown-hog' do not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202510251307.tGcT9Vt5-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/ixp4xx-netgear-wgr826v
head:   82097c6ad45f556e517b1b4199582fd6d24c03e4
commit: 2003e8d748fbb6faf3ce7809cedc486fa0a7c30f [3/8] ARM: dts: Add Netgear WGR826V Device Tree
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: arm-randconfig-052-20251024 (https://download.01.org/0day-ci/archive/20251025/202510251307.tGcT9Vt5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251307.tGcT9Vt5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510251307.tGcT9Vt5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: gpio@c8004000 (intel,ixp4xx-gpio): 'clock-hog', 'unknown-hog' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/intel,ixp4xx-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
