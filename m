Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6819036124
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Jul 2025 11:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752234327; cv=none; b=QGMm4pWQaBpUpBQidXJzmznAshM7B05X3s+42dPPJSVUx9kFvDfseB/deN+dk2dTZ+G8ipXW0Ld1J3TakyVuhEOFZfGaEM/7WdiL5ZpICpK9p8ZAi8jODuiI48Ue6+PZqK5wIzYzlY6hYKZvTO5+4upbrWqFL3kBBt4FIslm+YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752234327; c=relaxed/simple;
	bh=0iwXJihOEx8lzUxP9c5CB1PDNGC8t8yx/Oo1MFIe9aM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KpbqvMaPVIiPbDeMIEhe7qU4HNQZr4aPO43HIwPkBtrrymlNNybtem3g0xazn/xrW0DMtZDHpVvGyRp44UJue1m/NMvruVXRvYS0G4Kq93VO+yLLFgZ85D4ckJQPOf0glEum8sQ9he4PktmBCh1J8HlGh5NUwQQVz33+YBemyJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bg/qyKSM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bg/qyKSM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752234326; x=1783770326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0iwXJihOEx8lzUxP9c5CB1PDNGC8t8yx/Oo1MFIe9aM=;
  b=Bg/qyKSMycCiDzDko7LqHH0dSj9YkOOpFZIlZdf/xFN6I4yqKDTdzczO
   RHHhZHjuyaGwD36ZT/l9eSoD46Pi9snwU+HK5dzzGWfrqOqqWyv/EpJEm
   yGaiiI8PhhvsNxs0BhMJCKbiKIzC7sMRBjfgBIwQ154ussOZlv7dvvuGZ
   Fr4e1Ln+53vuGBrP3FIs/H35GV3G/N0ctXWx/M0c6MhDpBiULJpSQq1hb
   kXOdN9D7r7Uuh/zTuaqayFknfSwk349Ya362FQrtK5+zRdpMWrZIaYAhA
   I/hKOh4dx9HH21cZYkK0VwYtNqcskgjLhl3P6ZTknEY75MMuOOGRzj5AD
   w==;
X-CSE-ConnectionGUID: 0J2zrSCiR1WeQ64H6zktWw==
X-CSE-MsgGUID: oasDHlmJSOKY4wBvz4ZFaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="71980548"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="71980548"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 04:45:25 -0700
X-CSE-ConnectionGUID: zyxWRLY+RmuDVJTdhFkLkQ==
X-CSE-MsgGUID: mxOZoarSSDq+agHjfIeFig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="156684502"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jul 2025 04:45:24 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaCBt-0006Jb-1k;
	Fri, 11 Jul 2025 11:45:21 +0000
Date: Fri, 11 Jul 2025 19:44:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: exynos: add abox generic for ExynosAutov920
Message-ID: <202507111938.mcpaMLv7-lkp@intel.com>
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
In-Reply-To: <20250709001210.379418-1-ew.kim@samsung.com>
References: <20250709001210.379418-1-ew.kim@samsung.com>
TO: ew kim <ew.kim@samsung.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: alim.akhtar@samsung.com
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: ew kim <ew.kim@samsung.com>

Hi ew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on linus/master v6.16-rc5 next-20250710]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ew-kim/arm64-dts-exynos-add-abox-generic-for-ExynosAutov920/20250709-082511
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20250709001210.379418-1-ew.kim%40samsung.com
patch subject: [PATCH] arm64: dts: exynos: add abox generic for ExynosAutov920
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250711 (https://download.01.org/0day-ci/archive/20250711/202507111938.mcpaMLv7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507111938.mcpaMLv7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507111938.mcpaMLv7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/exynos/exynosautov920-audio.dtsi:18.3-10: Warning (ranges_format): /abox_generic@generic:ranges: empty "ranges" property but its #size-cells (1) differs from / (2)
   arch/arm64/boot/dts/exynos/exynosautov920-audio.dtsi:10.37-19.4: Warning (unit_address_vs_reg): /abox_generic@generic: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: / (samsung,exynosautov920-sadk): 'abox_generic@generic' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /abox_generic@generic: failed to match any schema with compatible: ['samsung,abox_generic']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
