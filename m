Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B77301038
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Oct 2025 14:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761404194; cv=none; b=SXSuanl4VENkqhbQ9InRx1eXQWvOIcWi34M5jOLf3ycGWaR6mW8nc0j/YrqJF518lLOlnjc32yMiLLy15iiiRkyl8M7t4pIJajtZYk+RPsFu2ZQMxq3wGCemgi+wdNkw5denaf3JjKfcqlmlCqRwl/l3s/POlCM/fFFQkw96mMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761404194; c=relaxed/simple;
	bh=T3YtIaQbsYRjkLIXAqL1kNl5k0wbB7wRDYGC2QhJjBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Px1zyAr7dhhxf1Ly0VUy5YkSsAoWYXm9q/7eYjz2zm6eHBIXqB/SmgeOF4GZvL1JYli9/rV89N2Ae0uSghaNa34xxRjN9lAstBB8gdmVU0cCaQhQQD/6W+HXP80DI7QSdwjx0Owhq+K/8nS9CyZxz2e7rEwDLCtG0663uC8Bvz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eRkWqVM3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eRkWqVM3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761404191; x=1792940191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T3YtIaQbsYRjkLIXAqL1kNl5k0wbB7wRDYGC2QhJjBE=;
  b=eRkWqVM3+q8Pg7ZiXzTu2UCyQ2zp1FfXmluYUGUI3+s0tUY3OHfG9K60
   zLogdkcPJJ+k6lniPWRjDOqXNrNPvswLB/tbQWMdllXvwIsuKJILFgwTj
   Ikha6XsnzI95W4QHzhnn8AmApj9+64OJkd6g4E9pl2G3Jv9nikTetMy7I
   e9sC6VxDDYKfLWVbm6MSLJgWY5cekzRE2RIfoZyDQ41NZyiumRMdsYbFY
   o3v3ChnuML9qXBDHnbu32EfAI3GUXPUUtSVGTei4BmjDtz6/LlOMiPM/l
   BQcd6J2xxsLzIpSlF2/3jUyFDbhokT/piVIBM+dAtU+eLvDsuvmyno9bg
   A==;
X-CSE-ConnectionGUID: tHNUsE2jS8S8StIFJnPrwA==
X-CSE-MsgGUID: 1ADLCQN9SdGBVKG6sIy+Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73844132"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="73844132"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 07:56:31 -0700
X-CSE-ConnectionGUID: LOu+jtTwSbqelawms65fQA==
X-CSE-MsgGUID: saPBhdhKQEa3jAEMVP5d/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="185024038"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 25 Oct 2025 07:56:30 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vCfgy-0000000009p-1VXB;
	Sat, 25 Oct 2025 14:56:28 +0000
Date: Sat, 25 Oct 2025 16:55:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [omap-audio:peter/linux-next-wip 8/39]
 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dtb:
 /dmic-sound: failed to match any schema with compatible:
 ['simple-audio-card']
Message-ID: <202510251615.OJRLgCKU-lkp@intel.com>
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
TO: Peter Ujfalusi <peter.ujfalusi@ti.com>

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   afaa11afb19194ab185bd6dc6674bb42af42e59f
commit: a00547a3d28f0c0c83cae73c54f82a569898abd2 [8/39] ASoC: simple-card: Support for selecting system clocks by ID
:::::: branch date: 19 hours ago
:::::: commit date: 20 hours ago
config: riscv-randconfig-2052-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251615.OJRLgCKU-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251615.OJRLgCKU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510251615.OJRLgCKU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dtb: /dmic-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dtb: /dmic-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dtb: /dmic-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: sound (simple-audio-card): simple-audio-card,routing: b'L2\x00Mic Bias\x00R2\x00Mic Bias\x00Mic Bias\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
