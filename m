Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E723921C160
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 18:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765736499; cv=none; b=KwJfEp76cCn4pOAb0a2d0uRfBM0ss7y9mYDUSH2mq9KxEG5PjKvU82eabT/g7NG1IO8CMUGF+9m5pw2A8jau6xPzLF6AI5xMX9f7MZLPmM4LIcKMVuP3sIdW9SnZscBvVP6XDB9uFc0ONEUm8JfimAkRfi/NtHoatI7FwitNrnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765736499; c=relaxed/simple;
	bh=0XE/yDmNOk0jvQPsEqCHlrZRSi97B8dyTxNUTSklyh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X0uQ82LwuSIpSBL5cQMcUybsbx39gLlcf2bcD+wCeaTwn5gEbP+iBriW8LmEC06uW4ECm2UedxzJ7rqMe3SsAFyyzMfZuzevZQadQkFFwB+w77Wc53oc7XhWWquS+NTm9kHEDpVElOEtF+euI9PDcVu0R52mWMTRWYTN7AKzHh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dvaS/UZA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvaS/UZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765736498; x=1797272498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0XE/yDmNOk0jvQPsEqCHlrZRSi97B8dyTxNUTSklyh0=;
  b=dvaS/UZALcTCs+i0PUaCky9s+cbGa7c6l/5xx/K+P9Kwh4Y6oJ1ziFKT
   SK1Gihpkv62OD+HTj18L0niPF9AGUCGOUqrSg2H1Wi4LW5Dj5KBzUMrVw
   ogpz6+9/Ly6kmKW6eQJNwO09v7MnOIiEqNZ1r4ZlSLOxRhfIRyIanXBYP
   GNr5zMtndqc9uVIY8V0HRbiiXxbf+amce9n7XwLsE8xkUnFWei9PSHj0D
   QfBOKRqqHyS5M6B31Qv/3jBM7iOse+DymwYiC+lKdjPREXgxBdp1j+7zM
   /cyrZm31REjAe8bIR9VbaaOSxAZr97kh/kqS4zDYYyamoa1Hg/SQrVPMu
   Q==;
X-CSE-ConnectionGUID: WWoByBY4SC+NPmNUhIQuzQ==
X-CSE-MsgGUID: nVmRJqFtSLW04b7CP7uRRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67614476"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="67614476"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 10:21:38 -0800
X-CSE-ConnectionGUID: FHDLGxHeTP2bkarI6cf6xg==
X-CSE-MsgGUID: BRhpX3EhTKe9CwyzTu0vGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="201959931"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Dec 2025 10:21:36 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUqis-000000009GY-232O;
	Sun, 14 Dec 2025 18:21:34 +0000
Date: Mon, 15 Dec 2025 02:20:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arc/boot/dts/axs103.dtb: Warning (interrupt_map): Failed
 prerequisite 'interrupt_provider'
Message-ID: <202512150219.JyuOaBhh-lkp@intel.com>
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
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 3b7f793acc13b6108452271b306d4aa94a3c4940 ARC: migrate to the generic rule for built-in DTB
date:   11 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 11 months ago
config: arc-axs103_defconfig (https://download.01.org/0day-ci/archive/20251215/202512150219.JyuOaBhh-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150219.JyuOaBhh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512150219.JyuOaBhh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/axc003.dtsi:24.24-28.5: Warning (simple_bus_reg): /cpu_card/input-clk: missing or empty reg/ranges property
   arch/arc/boot/dts/axc003.dtsi:45.29-49.5: Warning (simple_bus_reg): /cpu_card/archs-intc@cpu: missing or empty reg/ranges property
   arch/arc/boot/dts/axc003.dtsi:85.16-90.5: Warning (simple_bus_reg): /cpu_card/pct: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:33.10-64.5: Warning (simple_bus_reg): /axs10x_mb/clocks: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:233.20-241.5: Warning (simple_bus_reg): /axs10x_mb/connector: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:318.18-328.5: Warning (simple_bus_reg): /axs10x_mb/sound_playback: missing or empty reg/ranges property
   arch/arc/boot/dts/axc003.dtsi:85.16-90.5: Warning (interrupt_provider): /cpu_card/pct: '#interrupt-cells' found, but node is not an interrupt provider
   arch/arc/boot/dts/axc003.dtsi:102.18-104.5: Warning (interrupt_provider): /axs10x_mb/ethernet@18000: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/axs103.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
