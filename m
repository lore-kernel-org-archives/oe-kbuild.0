Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6204D8AB
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Jun 2024 12:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718020962; cv=none; b=OV7tfzsCDHxkf6pLbQtd/WWjOIbc/3wSdSbE3YUzCYHjaUQZwBlEKjdDdNEHLKFRaeKqU3Y8mr0WoMnYx0BK84msT9Q3PEsswKbZbQOX4h58yT4IWv+n1pFGR214y/ZnKl/XSyWgcRQgCjtoNL3gua+T5AF/QOMu1NNigyIbiZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718020962; c=relaxed/simple;
	bh=I4kJf6IS7bxPUHek2qnxiQxrxOsrRQVftiM+RCmGBM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TskQnS4XBuBk4l/hhHyQ8GZFAol4XFpYPTnq1uFvwlS5yjiMmeRyTFl8ts03FXilMigI1VQpCcWJYPBI1RQvEYIGIGVyArddKK13rDyegxIkdI4NMP8W7i3owTNm/XtrllLLbX72tD843O1GnoUB8cseLObPQolHK3N6sAZkUTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C7oE6fVe; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C7oE6fVe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718020960; x=1749556960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I4kJf6IS7bxPUHek2qnxiQxrxOsrRQVftiM+RCmGBM4=;
  b=C7oE6fVepiql7N3UuoBFdCghaB+y5K9I8ovmnD/Y/jGH5+w/edFOEAuL
   IOHod+aPjcAGKS/Vt4dYkoMZYezkR/C8XGMXq8I8g6tUBy+kR1J8sixPB
   D35BCq7/Aeq2riQKaFmtA4Z4ij9y4lCYoirSMCrVR8s1lbbZLhYSM/+j1
   ih8cq53TQ4u42LCzfRjw77hLHWIniTFIudi9WZTQQAm2+K4xU/8o5ZVKF
   eeCQnKg4Oebyu+DsvLA0Es+Ep61eeGXVL96GokQHalFz6cse53712x3Ss
   jEVJYBFDBmSUjY1GosgkmCyC9KY/Yt7HWNrE3OEhwiCNYMkO6of1uwn9n
   Q==;
X-CSE-ConnectionGUID: OgtGDAv+Q5uamzwag4hCkQ==
X-CSE-MsgGUID: K+sF19/hR3iHarmkH/rd+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14408039"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14408039"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 05:02:39 -0700
X-CSE-ConnectionGUID: 2z0A+FdhTVmhUFZee/e1Cg==
X-CSE-MsgGUID: W3poNIxoTpa4W68RGcdejw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="62211372"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Jun 2024 05:02:38 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGdjP-00027p-2Z;
	Mon, 10 Jun 2024 12:02:35 +0000
Date: Mon, 10 Jun 2024 20:01:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-4.19.y-cip 3959/9999]
 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202406101948.25usuOkE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
TO: Pavel Machek <pavel@denx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   80b2464ae89aaaa73b7a2daa3526c1ed9971ab5a
commit: b99c0f465b6398b36ed3bef6fac8ad2078cd3bfc [3959/9999] arm64: dts: renesas: r8a774a1: Add PCIe EP nodes
:::::: branch date: 4 days ago
:::::: commit date: 3 years, 7 months ago
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240610/202406101948.25usuOkE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406101948.25usuOkE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406101948.25usuOkE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
