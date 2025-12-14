Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B67BF4F1
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 06:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765693849; cv=none; b=D0ZtkPKtYm5z1z2tOieCjZ1ehzOMXjFy2TTQLyT362HOc9Y7pi+X0rvuTyqRWz6Tr1jYFHq9niCDGCL9sWnYz/GmBE+0lc6k3CtkBDBd2YLTtC7/3TrEVKhCyZVVN4SzEaZzEkgKq5CrIsINTgV5W9ww+e4/Zja2VRwTJyNzGOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765693849; c=relaxed/simple;
	bh=EjgC5RfyMhcJCEoPZmHT+HF2nWxIWthkNWTrtEmP2Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D93fnrJ92BX8c4+wHZKS03ffLeopfeGAu2M/gVxVi9rv+NbY55xzPX2OjeJ24lXKmCIFDphgIQBaWPQvyIXe3GXaLANNWLGIOsNAgcL+CbfOZulJ26mlnYvBWS1z5OeInmUkqcWvAL0g+GLTdxDir3c5/2bWH0cLbvuhCVcYAAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYVxrhVJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYVxrhVJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765693847; x=1797229847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EjgC5RfyMhcJCEoPZmHT+HF2nWxIWthkNWTrtEmP2Z4=;
  b=UYVxrhVJzKo8fdNc1aveB6gPjZ4zfVzl8ep5JbpjPcb0d3thBQoduaiY
   jGmfSzFfFXlCWQWqRbYMx90X7lfBJS6DEb9PSmiqmg1UgeebH4EJ6C7Px
   FLyczM8gqq99V4SzKNFTkUyzp2TpyKfoiNPUIQo0Le85OKW7PXl8pM6gp
   zgZ2lNDDXPruQK1f9fL99003J24DhZeOaNPzwbnB3Z1NeU5k53HrkLRPg
   cKznrizMNPzNj/XxOENppTnnQMb8T5ufiDSAVKDMt9ia1fyJDrwIhT/GR
   aprAVNR+nt2Rkz2uBiSFnTCYg49EX/owI3g9XMftJOxDgGqg+8IkL08Ax
   g==;
X-CSE-ConnectionGUID: WQW4AgWvTLKF74qTGFCREA==
X-CSE-MsgGUID: djZYpEoOS0ayciYUHxx5vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="79004955"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="79004955"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 22:30:46 -0800
X-CSE-ConnectionGUID: jLGBUossQ16whsARHFP8aw==
X-CSE-MsgGUID: yKRvo2yFRJ2gIj5P4lmEJQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Dec 2025 22:30:46 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUfcx-000000008g5-42DL;
	Sun, 14 Dec 2025 06:30:43 +0000
Date: Sun, 14 Dec 2025 14:30:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arc/boot/dts/haps_hs_idu.dtb: Warning (interrupt_map): Failed
 prerequisite 'interrupt_provider'
Message-ID: <202512141406.eQQUmyEv-lkp@intel.com>
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
head:   0dfb36b2dcb666f116ba314e631bd3bc632c44d1
commit: 3b7f793acc13b6108452271b306d4aa94a3c4940 ARC: migrate to the generic rule for built-in DTB
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: arc-defconfig (https://download.01.org/0day-ci/archive/20251214/202512141406.eQQUmyEv-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141406.eQQUmyEv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512141406.eQQUmyEv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/skeleton_hs_idu.dtsi:57.9-60.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/haps_hs_idu.dts:37.22-41.5: Warning (simple_bus_reg): /fpga/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/haps_hs_idu.dts:43.35-47.5: Warning (simple_bus_reg): /fpga/interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/haps_hs_idu.dts:49.38-54.5: Warning (simple_bus_reg): /fpga/idu-interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/haps_hs_idu.dts:68.16-72.5: Warning (simple_bus_reg): /fpga/pct: missing or empty reg/ranges property
   arch/arc/boot/dts/haps_hs_idu.dts:68.16-72.5: Warning (interrupt_provider): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/haps_hs_idu.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
