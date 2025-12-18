Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2405C2DAFA4
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 12:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766061125; cv=none; b=eyOqJ15/Fx5pLUrP3e6RmgefkoxiBgABm4MrQ7lC2xSdY5b/whMejw2DskYOry4vvwsi3AmzOt9PJNp4RKd4RMlEKrI1Ci017bYS+S34HPyjXKJWk+hpKUkeVkBxtmiVidsshoIDbm5ZMgHLC6807S+on8HwruukypegnjRDp84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766061125; c=relaxed/simple;
	bh=VHVLG3ELS4Mf5D5dh1GLBRkqBDWxzIFVcAkoPi6w/Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SzCcUobiWR4ik+ceBIIHc49UWrlGERVsgUqCDqBdy/pxVaE7vqaXR5P/otwL0uSzjBhENJUicE/OG2KN6XWi+EQtGmHq39ty9Pw3JIEPqNmeWafy6KwvCqDvmC6qBzy73Zx1X9a96CJLFSpc9/1QFV0CfdSbLo6JcaPQuW1AcMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TdF4zJWJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TdF4zJWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766061123; x=1797597123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VHVLG3ELS4Mf5D5dh1GLBRkqBDWxzIFVcAkoPi6w/Pk=;
  b=TdF4zJWJSh6vEVsYNWikan8IJqQTyvLAWborbRiVpS9xTXYu3oL+N1gY
   ujIh3ondbF5mHqcYm+wCYP/J7U01sGbxjR6tjdFS2OsuTlN7d7PMSWbwf
   8NnCdN60S4/Tm423+NyJ75Z//mGEOjLORUWJpl9q6pmAH5DIrmZ6mJ4V1
   kejSGGFpNLkigkWaLb+NCPQSGslqV0gS57huJVpD9UH4F5EjKeKzJBMYT
   +PCmMp2lXZEFjNo0O9mLsuj81jFLk7lUql3VqnraavAWfw1HYZPWxSoKd
   MB+aXxulMZhgVDWgqfFFObVafjtLpJakWSoU04RXpZQkKTX/lD07iz6h0
   g==;
X-CSE-ConnectionGUID: DL5tzgLcTW6Bk8rmoQOiFQ==
X-CSE-MsgGUID: fOLghOnBR467w5Q1h7kslw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="55587785"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="55587785"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 04:32:02 -0800
X-CSE-ConnectionGUID: 0OR5dDyfQ+emammThX/8Rg==
X-CSE-MsgGUID: tJKR6bU5SPqeVEz8XqobjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="203469727"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Dec 2025 04:32:01 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWDAl-0000000024J-18Vg;
	Thu, 18 Dec 2025 12:31:59 +0000
Date: Thu, 18 Dec 2025 20:31:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arc/boot/dts/vdk_hs38_smp.dtb: Warning (interrupt_map): Failed
 prerequisite 'interrupt_provider'
Message-ID: <202512182018.u3GH4ETA-lkp@intel.com>
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
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: 3b7f793acc13b6108452271b306d4aa94a3c4940 ARC: migrate to the generic rule for built-in DTB
date:   11 months ago
:::::: branch date: 33 hours ago
:::::: commit date: 11 months ago
config: arc-vdk_hs38_smp_defconfig (https://download.01.org/0day-ci/archive/20251218/202512182018.u3GH4ETA-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512182018.u3GH4ETA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512182018.u3GH4ETA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/vdk_axc003_idu.dtsi:18.11-55.4: Warning (unit_address_vs_reg): /cpu_card: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/vdk_axc003_idu.dtsi:31.29-35.5: Warning (unit_address_vs_reg): /cpu_card/archs-intc@cpu: node has a unit name, but no reg or ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:9.16-111.4: Warning (unit_address_vs_reg): /axs10x_mb_vdk: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/vdk_axc003_idu.dtsi:25.22-29.5: Warning (simple_bus_reg): /cpu_card/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axc003_idu.dtsi:31.29-35.5: Warning (simple_bus_reg): /cpu_card/archs-intc@cpu: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axc003_idu.dtsi:37.38-42.5: Warning (simple_bus_reg): /cpu_card/idu-interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:16.10-34.5: Warning (simple_bus_reg): /axs10x_mb_vdk/clocks: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:94.21-99.5: Warning (simple_bus_reg): /axs10x_mb_vdk/ps2@e0017400: simple-bus unit address format error, expected "17400"
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:36.18-47.5: Warning (interrupt_provider): /axs10x_mb_vdk/ethernet@18000: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
