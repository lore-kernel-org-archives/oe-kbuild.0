Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D3A2144C7
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 05:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766121357; cv=none; b=mOPlySR0mElXHny4fbi/kQC0vXlgUxwHLLZMY7FqeJ6CiqTEeshwIgzsjZg9GogC/KWVLNVqrOymfA7Jf85pi0lrP4r3Uxar4LwQ44s1E+7pe5i2XQ0jya6Qldh3NKyk3J8JXrYvhb131gvy9g6NJjO2lmFSGwAWcL4Ffuv/l/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766121357; c=relaxed/simple;
	bh=QTPD6ybasyKMTm9o9dDTNZhHpNKRPmXyB2GJxdroFp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uZVwIMs89m/lmsxTVkfxAgc041H7zP80/DhKbMOBz8HotzXgnHn2sDHBLXWIyk4kGaoPcFMg4cy4sDP4gPNeGqLzjXqhpJa26ZrqWTorlutiHZ+yY4FYMz1/j5kHY5lRxbDeTvMLtwOzZkxQeGVuSqx9nAYZb/5SiZZMT8WyW+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivb07BD1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivb07BD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766121356; x=1797657356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QTPD6ybasyKMTm9o9dDTNZhHpNKRPmXyB2GJxdroFp4=;
  b=ivb07BD1Goo6R18pJoOuyf2S6AAcqBPSGV/JbT7jX6Xk8PCSzQQp6J+x
   4Aku+oUuJldOo1c8Sfmrr3O1yzOEFmlV+X7IgKfX3Mced2bD3Ww9juE1n
   Cg0rPj2w+MRwCXC1DPYQhauynNPNNQdI3QHOq87ePtkVGFlEQr9wETr7j
   9/Kshp4BOabDgz4/zdn037OCEo4DctJW8tN3ev3VVX6bp1WlNaWqORA3j
   ytDTXQx/o2hiZ+d3uoMaQm8uA8JS/hBNmjKcVeezRWIDMs0ic12B+cjQK
   BS7Sc6Tk/LHB6AjRvH2wmszjpcsSRHlSxD35zHB8MDNOQahXacpafKcDJ
   A==;
X-CSE-ConnectionGUID: XlbaFDj7RE6HkXvcWTkb0g==
X-CSE-MsgGUID: PYmcYl1ZQNO8YSIrwkvgig==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71942715"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="71942715"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 21:15:53 -0800
X-CSE-ConnectionGUID: 7irTHMqDSFyxzO55DsIV/A==
X-CSE-MsgGUID: nOlqDwNBRP2oxUlL0eJlUQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Dec 2025 21:15:52 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWSqE-0000000033d-2uii;
	Fri, 19 Dec 2025 05:15:50 +0000
Date: Fri, 19 Dec 2025 13:15:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arc/boot/dts/axs103_idu.dtb: Warning (interrupt_map): Failed
 prerequisite 'interrupt_provider'
Message-ID: <202512191308.ru6gC902-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: linux-snps-arc@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
commit: 3b7f793acc13b6108452271b306d4aa94a3c4940 ARC: migrate to the generic rule for built-in DTB
date:   11 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 11 months ago
config: arc-axs103_smp_defconfig (https://download.01.org/0day-ci/archive/20251219/202512191308.ru6gC902-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191308.ru6gC902-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512191308.ru6gC902-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/axc003_idu.dtsi:24.24-28.5: Warning (simple_bus_reg): /cpu_card/input-clk: missing or empty reg/ranges property
   arch/arc/boot/dts/axc003_idu.dtsi:45.29-49.5: Warning (simple_bus_reg): /cpu_card/archs-intc@cpu: missing or empty reg/ranges property
   arch/arc/boot/dts/axc003_idu.dtsi:51.38-56.5: Warning (simple_bus_reg): /cpu_card/idu-interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/axc003_idu.dtsi:92.16-97.5: Warning (simple_bus_reg): /cpu_card/pct: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:33.10-64.5: Warning (simple_bus_reg): /axs10x_mb/clocks: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:233.20-241.5: Warning (simple_bus_reg): /axs10x_mb/connector: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:318.18-328.5: Warning (simple_bus_reg): /axs10x_mb/sound_playback: missing or empty reg/ranges property
   arch/arc/boot/dts/axc003_idu.dtsi:92.16-97.5: Warning (interrupt_provider): /cpu_card/pct: '#interrupt-cells' found, but node is not an interrupt provider
   arch/arc/boot/dts/axc003_idu.dtsi:109.18-111.5: Warning (interrupt_provider): /axs10x_mb/ethernet@18000: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/axs103_idu.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
