Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD09032ED2A
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Sep 2025 14:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757516129; cv=none; b=Z7S8yt6u/JICnLqfnLeY+NLaYYjjP+XBKcLUdFl6rFYLQzLg5pVyZqyctNItErNuGBBzu3t9wsIGZQ3hQydl43XcmcOdCQUChb7t54XJbCXt+HpcVyrZfK8dMT55FIHBJ0xDtwTlwmrgjRoL+0gdIfkyiea1dEsY5UlvK2tg3To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757516129; c=relaxed/simple;
	bh=810Q8bFc7CeHxiCqEpwOK6dp7r5Y3CntcNvrvw1YWiw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ihcZG13zkjihkkjUo60Bewu+6fMDII5yT3YHQCv87ytB7giN1uR2tctjOwaUBEG/Rb9NOjShGJGTDVBTPnbZyUpG0+rDQykp9IH/8ChUkejcIUo4u1U2EK0y0Myeo76xkNxyLKPKAdnGIL+4Ae/DJ0y38767WHmQNJbqnXtUceA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ICBBBWfN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ICBBBWfN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757516128; x=1789052128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=810Q8bFc7CeHxiCqEpwOK6dp7r5Y3CntcNvrvw1YWiw=;
  b=ICBBBWfNxi5FsVaS0OT6pSL0CHR1HTty3YFvk/ph4m2iUjijtpe0M1HM
   P2O8+wRPFzfhPRgkjxt1ITSh7pyIaMWX/05t09oXwKBcdvPqPVJ5X87b2
   QwBpiHyZO1MgvKrp4kBRSz02gt5bOaDUueEkIXPylcFsoT13rftRBP1HF
   02/UZHtRXyf+u5AWIuZdMDoxUIXNLv2asfe/KxQpm2ihTiTWYK2Vw6GZC
   PUz8q9ianbxF2RKEEer6cB1ThyVZ+MdAyB1zrdROf/JupqIgfzH/IIKxz
   3G1MqnL6AhsadcJcEwnZ/aTU8LyUxKgR+WC3LeJBGn87/16F4E5QliPcP
   Q==;
X-CSE-ConnectionGUID: WPSjZMx4QAi1QKTjtpg58w==
X-CSE-MsgGUID: 0QmLFEoRSMSq8Ja/lLu3iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="70929282"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="70929282"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 07:55:27 -0700
X-CSE-ConnectionGUID: 1rpAPTpzTb26UIztJ6zTbw==
X-CSE-MsgGUID: 6QKIDwveQFmV3ZxlSyTBtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="177694313"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Sep 2025 07:55:27 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwMEF-00061v-30;
	Wed, 10 Sep 2025 14:55:23 +0000
Date: Wed, 10 Sep 2025 22:54:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 4/4] ARM: tegra: add support for ASUS Eee Pad Slider
 SL101
Message-ID: <202509102256.wLYWpjrs-lkp@intel.com>
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
In-Reply-To: <20250906062934.6637-5-clamor95@gmail.com>
References: <20250906062934.6637-5-clamor95@gmail.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Maxim Schwalm <maxim.schwalm@gmail.com>
TO: Ion Agorria <ion@agorria.com>
CC: devicetree@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.17-rc5 next-20250909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/ARM-tegra-transformer-20-add-missing-magnetometer-interrupt/20250906-143259
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250906062934.6637-5-clamor95%40gmail.com
patch subject: [PATCH v1 4/4] ARM: tegra: add support for ASUS Eee Pad Slider SL101
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-053-20250907 (https://download.01.org/0day-ci/archive/20250910/202509102256.wLYWpjrs-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509102256.wLYWpjrs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509102256.wLYWpjrs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi:52.22-58.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@30000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra20.dtsi:847.15-860.4: Warning (unique_unit_address_if_enabled): /usb@c5000000: duplicate unit-address (also used in node /usb-phy@c5000000)
   arch/arm/boot/dts/nvidia/tegra20.dtsi:919.15-931.4: Warning (unique_unit_address_if_enabled): /usb@c5008000: duplicate unit-address (also used in node /usb-phy@c5008000)
   arch/arm/boot/dts/nvidia/tegra20.dtsi:793.3-42: Warning (interrupt_map): /pcie@80003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
>> arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dtb: /nand-controller@70008000: failed to match any schema with compatible: ['nvidia,tegra20-nand']
>> arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra20-gmi']
>> arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dtb: /i2c@7000d000/pmic@34: failed to match any schema with compatible: ['ti,tps6586x']
>> arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra20-kbc']
>> arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dtb: /pcie@80003000: failed to match any schema with compatible: ['nvidia,tegra20-pcie']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
