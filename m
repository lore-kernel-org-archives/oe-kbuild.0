Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003302749FE
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 15:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766246246; cv=none; b=D/hK5dIvd6U/wuC5AN/JF3X+wzjFUk4jbXr1st7y2Z04ijFMFcq4+AxKlAuiUqdioUO0UEKCRzZlBbVJpmUnyHyPvhjmU60crI/pigg50/jtJ5GCMh2A0r6P/YEzdalXr6rmPaC3XKW5XrZiMfVBufMxghNuvgAIGi93dNuSmJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766246246; c=relaxed/simple;
	bh=BWZHwlgqfhNyXlyB21Ea6YhEN+3aGHUQY1XzIVqVrKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QcynqIQ6FxNX7080qs5Tj8wY503Vi9d0gIflar7LOuT1hyzspFd6s9CwIeuKibeOIc77q1tyGkVJJviWkMfM6nvPdKCwyWPJvEZM5fjes1U0mvJ16yGBrMn4yEUeAo1tYPiO/2tkqz95WUlmkVbJYhANPSBGIu1FehhTHQX5oCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gttu+yex; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gttu+yex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766246245; x=1797782245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BWZHwlgqfhNyXlyB21Ea6YhEN+3aGHUQY1XzIVqVrKU=;
  b=gttu+yexUSQfDljDPmblnO71wNKdp8qCgoA01pYYNu3HvvM3IvnsED0U
   1wCq6DQHa9U34df3mb5A1ifAMqt2QP5vUE1pJ8AZ7SHJ4WCMtrO/iAFqN
   I6CLjJ6AUiKV26dNqsUuZu+oPLhjUGwfxl0czfwOkNLhs8bMPj2GhkdAr
   zjRgZIjgdK5vZVS9CPu2S0wELJNQr2aZICQQbX/t03/qAAHAmIX6dGMLI
   Bne+HB0fDErluM4Q3plqh77Ax6bZ5ln5Ccka0yPe89SxGvfiw5JENTCJP
   58EdhN7v310HCrNHeyXZt6MjLX0nKVHa8rdUlGhVVKbOKud4C5EXN8xxL
   g==;
X-CSE-ConnectionGUID: qzqS37RXTBqbiLQrGpNizg==
X-CSE-MsgGUID: 9OsY2L/nSJGak+VpvUmiSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72037338"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72037338"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:57:22 -0800
X-CSE-ConnectionGUID: bbkgN8yKTL6yupa4l+vPrw==
X-CSE-MsgGUID: 9wgNOpjURNeKhY4Bcx420g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Dec 2025 07:57:21 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWzKZ-000000004oH-0QJd;
	Sat, 20 Dec 2025 15:57:19 +0000
Date: Sat, 20 Dec 2025 23:57:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arc/boot/dts/axs101.dtb: Warning (interrupt_map): Failed
 prerequisite 'interrupt_provider'
Message-ID: <202512202328.kcPi92LJ-lkp@intel.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 11 months ago
config: arc-axs101_defconfig (https://download.01.org/0day-ci/archive/20251220/202512202328.kcPi92LJ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202328.kcPi92LJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512202328.kcPi92LJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/axc001.dtsi:37.30-41.5: Warning (unit_address_vs_reg): /cpu_card/arc700-intc@cpu: node has a unit name, but no reg or ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:13.12-329.4: Warning (unit_address_vs_reg): /axs10x_mb: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/axc001.dtsi:25.22-29.5: Warning (simple_bus_reg): /cpu_card/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/axc001.dtsi:31.24-35.5: Warning (simple_bus_reg): /cpu_card/input-clk: missing or empty reg/ranges property
   arch/arc/boot/dts/axc001.dtsi:37.30-41.5: Warning (simple_bus_reg): /cpu_card/arc700-intc@cpu: missing or empty reg/ranges property
   arch/arc/boot/dts/axc001.dtsi:77.16-79.5: Warning (simple_bus_reg): /cpu_card/pct: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:33.10-64.5: Warning (simple_bus_reg): /axs10x_mb/clocks: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:233.20-241.5: Warning (simple_bus_reg): /axs10x_mb/connector: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:318.18-328.5: Warning (simple_bus_reg): /axs10x_mb/sound_playback: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:73.24-88.5: Warning (interrupt_provider): /axs10x_mb/ethernet@18000: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/axs101.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
