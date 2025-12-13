Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C7A1946DF
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 21:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765661005; cv=none; b=NvVJM23j9KRqxIY7k5ekI02y7IrsYJzcmyoPxd17/+GnH0/PSQZIBeKnie8xCXqNriBBzTrt5znNran9aJ8zxL5Ke3PIzJFliFLeo6xuLg/E/59+8qXJ64Eh/2YbD1st/jaTMM6kR+ryQRu3Q6lSdIHIf5H5abRJxHj8tc07r/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765661005; c=relaxed/simple;
	bh=Aih9Q1F5MTENPXTCW5HJza34Rm/TFI0EFNH7+x6Ij9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HPJhHlQAG+lomVlucX8EN1YdiqtKqTEueGNRNcCzRzPIvilxwQA6JY+GGmc2L8TqbT/CzcmMGHWY/Axug2naE9c5hfIS0slGE/eQVl8cy4AYzJ+yDOTyvUzp/rOjVxFmz6CSZcaABBj6tbFK1bwioGO8RDAsm/Fwo8Btq+j0i/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0dQmtgS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0dQmtgS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765661003; x=1797197003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Aih9Q1F5MTENPXTCW5HJza34Rm/TFI0EFNH7+x6Ij9U=;
  b=e0dQmtgSlbIKHhZP2/9Iaxq+vv0v7akD3v4tkWF3TaSDVl+God9CQZnv
   Q2pSb04IpZUvfj90Xqy2gtJK+dTpZY7l3MW/QOcubhpyYXca+QXm9d/lg
   Grv+jymww2KpC7+suIf9IPQcLL0J6SVUc3gwkuSOb+8ygDchQjGg1lIZ1
   r8L9Y3m+O2oVxXmv8h2l4mFAOfJJoMPw+BoPG3eB4mQaG3PYL0wPOuEIB
   obJT7LwaHnJ4dsxuW2z4eXchhjDb8PGj0kXoMywR7MEsBzW2gYZbgAjVJ
   riXP5h05gbJZmVuBWt8HJEqXugRPb6baLPhP7Vd2JcvZL4JYlVLz5SWTz
   A==;
X-CSE-ConnectionGUID: 7c9Rg6FrQDqQ3Hpfzrdq/A==
X-CSE-MsgGUID: f/wCBcKvRRKrVwcab+BRSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="55185848"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="55185848"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 13:23:22 -0800
X-CSE-ConnectionGUID: zpee1kcuSyGXh3jJ4jtbjw==
X-CSE-MsgGUID: qNUCJy5pS0aAWNBM2P5VrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="201795425"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Dec 2025 13:23:22 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUX5E-000000008EB-0VvH;
	Sat, 13 Dec 2025 21:23:20 +0000
Date: Sun, 14 Dec 2025 05:22:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arc/boot/dts/nsimosci_hs_idu.dtb: Warning (interrupt_map):
 Failed prerequisite 'interrupt_provider'
Message-ID: <202512140545.81j0qVgw-lkp@intel.com>
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
head:   4a298a43f5e339f48d2dda0665c02b88ee9a4e03
commit: 3b7f793acc13b6108452271b306d4aa94a3c4940 ARC: migrate to the generic rule for built-in DTB
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: arc-nsimosci_hs_smp_defconfig (https://download.01.org/0day-ci/archive/20251214/202512140545.81j0qVgw-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140545.81j0qVgw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512140545.81j0qVgw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/skeleton_hs_idu.dtsi:57.9-60.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/nsimosci_hs_idu.dts:33.22-37.5: Warning (simple_bus_reg): /fpga/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs_idu.dts:39.40-43.5: Warning (simple_bus_reg): /fpga/core-interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs_idu.dts:45.38-50.5: Warning (simple_bus_reg): /fpga/idu-interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs_idu.dts:64.18-68.5: Warning (simple_bus_reg): /fpga/pguclk: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs_idu.dts:77.21-83.5: Warning (simple_bus_reg): /fpga/ps2@f9001000: simple-bus unit address format error, expected "f9000400"
   arch/arc/boot/dts/nsimosci_hs_idu.dts:92.16-96.5: Warning (simple_bus_reg): /fpga/pct: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs_idu.dts:92.16-96.5: Warning (interrupt_provider): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
