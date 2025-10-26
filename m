Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BD4264A86
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Oct 2025 04:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761454463; cv=none; b=XWDEztUc6TSlZ56PyAShYjtNmX2HroAKq3HwBsUo4mWGUa/fgvYtvKd2m4NvrZF+8IcczhGQTUH8z8I6fFCnHvNFB2qff4w3tZQlyXEVa8zpk58XJTO3acb3maO1ha8Yar9F9Pk0Ziy8O/Ig2HtShO4dK2H7quDty1//RTC/3h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761454463; c=relaxed/simple;
	bh=rAd5HyIi/U5I31HVNn/XuBbmVkINfIngsMTqr8qAm+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DUKS2Vc7vSQfrt3qMoXuR8u82aEZNtMqPK4P+cW8xK94kb4AEyUVXqwaq/yUDGvJQfS/NRun6o4nT2blLUWLwnXuDR+Bp0uKqF5G7bISc1DaA8zbFBLBTFEn+ggfrW9UfqOrAmqZ/fPCrjskV9OiLJ8IqHeyaOvCVCevs8RUBtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ho3nJqEF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ho3nJqEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761454461; x=1792990461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rAd5HyIi/U5I31HVNn/XuBbmVkINfIngsMTqr8qAm+8=;
  b=Ho3nJqEF17DiLIBPCWTbJFU4xVFHyQWhkh5vu3lsrwFm5akDh6J8Gwxs
   b/f7S4ShyBkK2Fi6e5hXJRvnRWf+ZO/6y519ibHItDqXAQfEmuhy9uoAh
   IbXpNkzKpNdBJWiDZfI0T0UssaX1wKZCgpZWX18xzYK5GqNiLsE0DgbKd
   dDBWcc3L+Abe35ITwjv+XAFGGRJJymn7ahT1z99VIkxy7edSwGEE1sg7w
   oegbHIwADATTaODfg1tnx1D/zDlviFQawlFUbiGExnqlrQM54QrQCHdtP
   Cvjykdg9059PYbQajCNaLPmndc4nSWxpEnvA/gEjTRei+YCW0nuhUvHol
   g==;
X-CSE-ConnectionGUID: x7TCutNhQeS74XyuSBeWCQ==
X-CSE-MsgGUID: P/gLajVaRTCKxJmScno7Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81204873"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="81204873"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 21:54:21 -0700
X-CSE-ConnectionGUID: hGPisDc8R2mG1N7kYbv0Qg==
X-CSE-MsgGUID: Zg7lvsj4TdKqNfAJpkkilA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="215660509"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 Oct 2025 21:54:20 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCslQ-000FtB-1k;
	Sun, 26 Oct 2025 04:54:06 +0000
Date: Sun, 26 Oct 2025 12:53:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/ixp4xx-netgear-wgr826v 3/8]
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: gpio@c8004000
 (intel,ixp4xx-gpio): 'clock-hog', 'unknown-hog' do not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202510261243.kAchfW0K-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/ixp4xx-netgear-wgr826v
head:   82097c6ad45f556e517b1b4199582fd6d24c03e4
commit: 2003e8d748fbb6faf3ce7809cedc486fa0a7c30f [3/8] ARM: dts: Add Netgear WGR826V Device Tree
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-052-20251024 (https://download.01.org/0day-ci/archive/20251026/202510261243.kAchfW0K-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261243.kAchfW0K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510261243.kAchfW0K-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: gpio@c8004000 (intel,ixp4xx-gpio): 'clock-hog', 'unknown-hog' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/intel,ixp4xx-gpio.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
