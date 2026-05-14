Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B583F4115
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 16:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778777763; cv=none; b=rdHv6sQkxRdquXRnNFE6Zf8F5Qw3DtscVK0/Il4nNKw4ekscFDrjP/jwNcuTZTskyky0xVvdGxpE6WVYs3FKjnn7+5EMGDa2TYM+WBG2IWExb0HbZiacY378dhoisSVN2wBK8cn6kHQsSxy8niXaOiqMlgCQ7yLewkVcJlusaiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778777763; c=relaxed/simple;
	bh=fNJpvoXO4UlrJ7kO/XjB1F9M4Qx73dMFjUYbXFSUj34=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GUoTtMJAGqbQmqFqzvP7oTrN7rNBa+dfrFYEEkszel0O2e/5djw/n61Li2vzetRzmLVO+GA4WqyiOv6TldAJW5j16+IHU3IIzF7IKZhkLcCsPQYPmkzZLG53XhdtPWG1jblWB/QZrn3ytTVm40O4GPbm/VkpmEGy7AKomOEfNQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EM8rDOI4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EM8rDOI4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778777761; x=1810313761;
  h=date:from:to:cc:subject:message-id;
  bh=fNJpvoXO4UlrJ7kO/XjB1F9M4Qx73dMFjUYbXFSUj34=;
  b=EM8rDOI4kpxGWhvIpZaUQj0mU/Eu/FcWpTJpJk6JT65Y0Cu2uDQZPObp
   3cler/rRvGIHk7dlO6xa7Jkdk+AWIeL3ZRzzlSoRPmMD32QEPinrINthS
   WlFOl9UhWrPA4FZIo5iTNm0mj1LrJxs8Jd3ZW19HI0jx76dlJ0PjWIBub
   P4WtiY1EgEDWUvSNwESXXUga3Ax2WrL8lwkUKW6Rx8uo/qq1a1BwIjIYQ
   QbranTjc7Donm/S5yOKPEFZX3dv4/xNziqEhFsw33iUMY/cQXiOB3qHb+
   A2L0OqMmQgA/ysjU5UHx2n4h/1EVXV0viwleEK1TNxz53xfNVCk9sa/Zx
   g==;
X-CSE-ConnectionGUID: TlRY47jHSSWct1QHHjZNNw==
X-CSE-MsgGUID: HoudLNrFRf22N63ZfUQPLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79619205"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79619205"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 09:56:01 -0700
X-CSE-ConnectionGUID: Vw1y93jESielymsyF1E4RA==
X-CSE-MsgGUID: IdKkjwMmS06KwnXHicPsNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="237451286"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 14 May 2026 09:56:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNZLp-000000008qZ-3oqp;
	Thu, 14 May 2026 16:55:57 +0000
Date: Thu, 14 May 2026 18:55:28 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/kaanapali-mtp.dtb: sram@14680000
 (qcom,kaanapali-imem): 'minidump-config@1c' does not match any of the
 regexes: '^([a-z0-9]+-)*sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
Message-ID: <202605141839.q6G2ohas-lkp@intel.com>
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
TO: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Mukesh-Ojha/dt-bindings-firmware-qcom-scm-Add-minidump-SRAM-property/20260513-190316
head:   80238724e5ab2cbb4b5730c194b217451e9bc9b3
commit: 80238724e5ab2cbb4b5730c194b217451e9bc9b3 arm64: dts: qcom: kaanapali: Add minidump SRAM config to SCM node
date:   30 hours ago
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm64-randconfig-2055-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141839.q6G2ohas-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141839.q6G2ohas-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605141839.q6G2ohas-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/kaanapali-mtp.dtb: sram@14680000 (qcom,kaanapali-imem): 'minidump-config@1c' does not match any of the regexes: '^([a-z0-9]+-)*sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
--
   arch/arm64/boot/dts/qcom/kaanapali.dtsi:3289.27-3376.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@9800000/dsi@9ac0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/kaanapali-qrd.dtb: sram@14680000 (qcom,kaanapali-imem): 'minidump-config@1c' does not match any of the regexes: '^([a-z0-9]+-)*sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
