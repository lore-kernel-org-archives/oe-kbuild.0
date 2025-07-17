Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1F5224AFA
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Jul 2025 20:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752784174; cv=none; b=kLkyTgT8tplvId1u1AP0tW85ZNr3JBJHsPh232siRYoHnOg04yfrLQEuyAGGK6Jqq4lK0t72w5SSWUW0Smc833GiNRYYQI3OGFQRenAvbfm8ioUw2poG/CPKziRqiFooDsDHL59EPi6tRMrI7WauYIGUqU5yTs3Y05sjoK+46xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752784174; c=relaxed/simple;
	bh=UJ5Wx+fcVX5naYGK9btu1aEOrDiX4H3mBs6UIv5EOxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ck7OgqvZf5+DpqtYDT+3NsjJ3DNN56o4uAMD7Z/MuGzqcrX5iuZW79p5qfIr0nPnqTVCVQ+b/xcsAcN0LTMFnQfq+GAlN7YGRQ5ilxsaPkj+LuULxjkc8KEpuP9ZpjpCuFFElf97kOb6zXcXxub4bkxBBC3U1DiRp4H7V9Hzjlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FDxRvqMU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDxRvqMU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752784172; x=1784320172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UJ5Wx+fcVX5naYGK9btu1aEOrDiX4H3mBs6UIv5EOxI=;
  b=FDxRvqMU+kzucRnhTrTVqdkwx3KrnVRObkd6OYx8adaevRdjrSbDWWY9
   IecmzBBB7pKc7ZMaYdItHVWtreHheP56uyRV/MsGyq6nj8WjuapYePTN0
   qoJjXBZr/YU+cziJgt+Zav5YLLx/XgcyLU97vEEuds23UyDrOayOKVHFx
   qsB3KBLtuAxW+KvAj4pMGn8M2cqJElxc/87jjHQCwuq5rdcL5edrnLYep
   G8rGEbVsVRDCffNS0wxhOHT2Eh4i4Y+TBhSbl9y5+fYo8zcv0DdQcnTOP
   +1qGxez9tQXRHsNUFFep3IzZYMVNMnWtQo3K0xhJgOuefzIqvJQ0oiCfe
   w==;
X-CSE-ConnectionGUID: 6isJMLw8Ro+RLDPels6ntw==
X-CSE-MsgGUID: OiU9WmruT9+DL/Brrami5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55199011"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="55199011"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 13:29:30 -0700
X-CSE-ConnectionGUID: FNPsICN+QxC0yItJp2547w==
X-CSE-MsgGUID: vxrQ2FdKR4uzC0mr7ELmwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="158583076"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jul 2025 13:29:28 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucVEM-000E05-0w;
	Thu, 17 Jul 2025 20:29:26 +0000
Date: Fri, 18 Jul 2025 04:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v9 2/2] ARM: dts: aspeed: ventura: add Meta Ventura BMC
Message-ID: <202507180344.EYoIXU72-lkp@intel.com>
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
In-Reply-To: <20250716094329.1069203-3-pkleequanta@gmail.com>
References: <20250716094329.1069203-3-pkleequanta@gmail.com>
TO: "P.K. Lee" <pkleequanta@gmail.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: joel@jms.id.au
TO: andrew@codeconstruct.com.au
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-aspeed@lists.ozlabs.org
TO: linux-kernel@vger.kernel.org
TO: patrick@stwcx.xyz
CC: Jerry.Lin@quantatw.com
CC: Jason-Hsu@quantatw.com
CC: yang.chen@quantatw.com
CC: p.k.lee@quantatw.com

Hi Lee,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc6]
[cannot apply to next-20250717]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/P-K-Lee/dt-bindings-arm-aspeed-add-Meta-Ventura-board/20250716-174440
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250716094329.1069203-3-pkleequanta%40gmail.com
patch subject: [PATCH v9 2/2] ARM: dts: aspeed: ventura: add Meta Ventura BMC
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm-randconfig-052-20250717 (https://download.01.org/0day-ci/archive/20250718/202507180344.EYoIXU72-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507180344.EYoIXU72-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507180344.EYoIXU72-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: kcs@114 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: /ahb/apb/bus@1e78a000/i2c@200/i2c-mux@77/i2c@5/pwm@20: failed to match any schema with compatible: ['max31790']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: /ahb/apb/bus@1e78a000/i2c@400/ipmb@10: failed to match any schema with compatible: ['ipmb-dev']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: /ahb/apb/bus@1e78a000/i2c@580/power-monitor@69: failed to match any schema with compatible: ['pmbus']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: fsi@1e79b000 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: fsi@1e79b100 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
