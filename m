Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C6E273D6D
	for <oe-kbuild@lists.linux.dev>; Sat, 23 May 2026 16:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779553853; cv=none; b=glvxss7MEy/TQrV8CauulKueUHxtPobL39xrGWdgl6BiY7jSMC1H5+r1bmf/sOTkTSS1PXG+xFbpD6dt/1LG4UjiTZof4MSTFheg2WIopxO9wDT+5sCGSOpzSPL9MW+TK2FeUia9k8zjyB2knOIPj39ogrSo9uYz2RIy7jl9S58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779553853; c=relaxed/simple;
	bh=mS9y081sem4feoxR4fzajD2hOowdTV2xu7pDw2g4zPM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TjdU0jAlwNNCVH9zVUIIZqk87nAdGX/GjelgWbkI2yTuhi65vA4Si514wQp72jxb99XftX0LwdEZmv2RXXDAZkiLUn440/nP/z2dcnUSsmZQThXVCr3eh53ExPuteypVxEjqVqFgdvZMV3evJOc2pdDRI16YLO2Gyv8DlD4cKk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XN6ypAi6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XN6ypAi6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779553852; x=1811089852;
  h=date:from:to:cc:subject:message-id;
  bh=mS9y081sem4feoxR4fzajD2hOowdTV2xu7pDw2g4zPM=;
  b=XN6ypAi6zkLp+LDFSC1QSuLIdFtLQG8LIEVdGkik7EpLSgqRkVzW5j17
   y1VOlfrfrEJ9ljvfVEimqzudeph25q60SwjiJBeh2g6sqjzZmL70h2eZP
   jyIjOWQPwWe5dp4kDQu7h3bpaMuJsR9Gc+Kj6LrboCDyD+EiCzGtvkYMO
   jC6j1ePeXqI+vEDxyDs7QmgvfZUT80JICzae2AoajL8oLsjl5nf6XzyY5
   CiTH3tuPHXZEEh2Q+V23yWD9WKQpW/Z7AhXETAnC4unjSeV6CkTZ1SBJM
   QEHN0nElGRQmU5b18gOfc6DHrmZxo6VolbjR5OCP6VwbLMV19xrPD+Rqq
   w==;
X-CSE-ConnectionGUID: gf0+SH2PQKK3cbyZ4cattQ==
X-CSE-MsgGUID: w5IDERPlQTSYOhU2OgGTWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="91021991"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="91021991"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 09:30:52 -0700
X-CSE-ConnectionGUID: nyV2tFsnSii9iyRrYdGF/g==
X-CSE-MsgGUID: vtwfvdIVR4SEK73720U4Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="236971363"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 23 May 2026 09:30:51 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQpFQ-00000000Biz-2dvj;
	Sat, 23 May 2026 16:30:48 +0000
Date: Sat, 23 May 2026 18:30:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 9/114]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb:
 /soc/spi@39b10c000/hid-transport@0: failed to match any schema with
 compatible: ['apple,spi-hid-transport']
Message-ID: <202605231845.MiTFRsCB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   2d563843e07af55de0249a409021af705f586961
commit: 8889bf8cff77db2d9655f7f54bbc363c6b4d8895 [9/114] arm64: dts: apple: j31[46]: Add keyboard nodes
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260523/202605231845.MiTFRsCB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605231845.MiTFRsCB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605231845.MiTFRsCB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
--
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
--
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
--
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
