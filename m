Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BE61E2602
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Mar 2025 09:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741686583; cv=none; b=Z4EKa5LsakNAZnAJlZ/PdmFsKRdcNxL2rwt6NMwsitBUNEg4d1IgGI7leywfRu2rZglyL4AujXnemMNHHLHOoBHZxmMgZBZao57b6zIn22XB6wtWA3+ZUc8cFr5r+YqQlA/mapLvGRW0CqNlTYd07XLOIzGcjEWCQGHzwWjc32k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741686583; c=relaxed/simple;
	bh=FqwK4WzVydu7dcfSVjeWNom8heKdTrNlq0Lzw5G0k48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QF+wtafwHvHORqDF4hAskiTUESbyd1Uef0PmxQJJING5SWQeqdeg66JHDPbZHD470rwsRm+tUdCsE6rLEfIfsHAOnImarkIteSMA+Z4IkIsGKLhTS/MXDFUhAFwsQ7vrl0Rp4cHeq6Yf6eA0eDh2IBSK8weu0gvbEdDF5Tw+UQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ty6wh8jE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ty6wh8jE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741686582; x=1773222582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FqwK4WzVydu7dcfSVjeWNom8heKdTrNlq0Lzw5G0k48=;
  b=Ty6wh8jESuRhL6nx0En9SlDHZpe6TArhEJMmLjq0AKoX5gxmIx9Zd3Ju
   fQxgvKSszm3wWr9T8R7w+eQxgMGwPjJD9WGHxAs4qHfUCFNekDtHjWXfQ
   zXISI2Lpl8sQo21f2odTG1SIED/39JtIo4qva1ppZk9l+hzvQkSfqgX3X
   Qg4NCFZSmN+n1kKTjKGD2Y3y8DurMJTCvqq+KKv16NvNa5hZxFRoRf45a
   ut/Y0ouW7ZIjDTj9ZVSWmh23VWJ/oAqBdxEKBPDHKsTypndUUXbd4o3ZI
   XvNOAPrhG9DPSbQkb9qpKxgnCDRQUS1D/hAlcbMx2vVDy8X5HKFWwa5hk
   A==;
X-CSE-ConnectionGUID: KfBiE3QxSTqkZMFe+gYEYA==
X-CSE-MsgGUID: UWYluUouR4Wvef6p7eUlQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="41968141"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="41968141"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 02:49:41 -0700
X-CSE-ConnectionGUID: 19QsMMU+RLqgDh8yUamvsQ==
X-CSE-MsgGUID: VXPiHiEXSlyClcPB5Vle0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="151069101"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 11 Mar 2025 02:49:39 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trwEn-0006Y0-1a;
	Tue, 11 Mar 2025 09:49:29 +0000
Date: Tue, 11 Mar 2025 17:48:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.15-armsoc/dts64 70/89]
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/vop@27d00000: failed
 to match any schema with compatible: ['rockchip,rk3576-vop']
Message-ID: <202503111717.5qBIaxpv-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Andy Yan <andy.yan@rock-chips.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.15-armsoc/dts64
head:   ba82f56bbf20e4166c988621cd0507509872848e
commit: d74b842cab0860e41a45df0dac41e4e56202c766 [70/89] arm64: dts: rockchip: Add vop for rk3576
:::::: branch date: 3 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-051-20250310 (https://download.01.org/0day-ci/archive/20250311/202503111717.5qBIaxpv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503111717.5qBIaxpv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503111717.5qBIaxpv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1884.20-1950.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/vop@27d00000: failed to match any schema with compatible: ['rockchip,rk3576-vop']
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/otp@2a580000: failed to match any schema with compatible: ['rockchip,rk3576-otp']
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1884.20-1950.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/vop@27d00000: failed to match any schema with compatible: ['rockchip,rk3576-vop']
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/otp@2a580000: failed to match any schema with compatible: ['rockchip,rk3576-otp']
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1884.20-1950.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/vop@27d00000: failed to match any schema with compatible: ['rockchip,rk3576-vop']
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/otp@2a580000: failed to match any schema with compatible: ['rockchip,rk3576-otp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
