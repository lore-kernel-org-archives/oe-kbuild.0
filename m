Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7132664C6
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Mar 2025 05:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741324107; cv=none; b=pADhoXEWakBV5/8r1EYxNh1+hsDgHXXnnntFm+6j3VrcfjMFRQc8jvIiLDavqzRcSpMdtqwda2uXoHZ++xGQTs7PKQJCGEphlpH5S3ovP4OQp9eLreizsqCSN5ib676HqeyvOgKgwZ20Za0E9dqXun41whES2X/stWqdVgttg7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741324107; c=relaxed/simple;
	bh=rIlRNXtE7VgG1fBqnqiMD715eRPRiqm6BVNOjUjmuwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WM11l4JsKGmlGTQhj2lLeMLO3F2O277widrg/+Dgls4j97XD55UhkCF1vLbtd5zu+uKOp2pEcY/Sn0HIJhDbCypoO8uEA6SEVaBHFmMW3uZy/FZyHpW1UdfIavnZimMuyxOpCzALbfJmyji9WBGG3FxVGgVop/D5LR7CQbppVWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/ymj405; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/ymj405"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741324106; x=1772860106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rIlRNXtE7VgG1fBqnqiMD715eRPRiqm6BVNOjUjmuwM=;
  b=B/ymj405vw8dC4/kKBvYt30RzOnK9m2JSULNP1/kpBR2XzFjOt8PefMo
   KqextH+xwmUkpKf6i1RTzQR11sIw6xgV7x3kroxpGlpP9ErWEoH4QFY3y
   JRC93MgyVcTnR8QFeWDNNcIv6SYpiV6yeX32Zo97CYF5qPqJkGCKO+rGH
   mI63ng67n39/5Zj62S+bg07H4+IAPw3isWyQ4lJ9L8IFsHVVVoG8t1jC8
   ZKB0JMN0OqxQg47/RYDlb+PBsTG47vlKQBKEFhzwwBDTXJozB0Bnzv028
   FeZnkaxDZ/f6JCNv+QQeFP9MrRmO72cgxaVgOgEPCyx+yatFi61vJ4ADg
   w==;
X-CSE-ConnectionGUID: 9qPT5cs/SkisqBN3w/1H2w==
X-CSE-MsgGUID: hFdGvDZqTgGsKI4TH90tQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53001694"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="53001694"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 21:08:25 -0800
X-CSE-ConnectionGUID: JxqJM+JwTlyASs+09VJZZQ==
X-CSE-MsgGUID: LLAFE7mrSR6AklAeo+zGjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123409100"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 06 Mar 2025 21:08:24 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqPwZ-000OaC-1e;
	Fri, 07 Mar 2025 05:08:20 +0000
Date: Fri, 7 Mar 2025 13:06:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.15-armsoc/dts64 68/77]
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388@11: compatible:
 ['everest,es8388', 'everest,es8328'] is too long
Message-ID: <202503071311.cyrGPtqX-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.15-armsoc/dts64
head:   5324af2d029d47a39ce22ae1613e2753e5e372a2
commit: d83f6c32d70f96037cb187e63785e7a58f9e751b [68/77] arm64: dts: rockchip: Add ES8388 audio codec fallback on RK3399 ROC PC PLUS
:::::: branch date: 15 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250307 (https://download.01.org/0day-ci/archive/20250307/202503071311.cyrGPtqX-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503071311.cyrGPtqX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503071311.cyrGPtqX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1356.21-1369.4: Warning (avoid_unnecessary_addr_size): /i2c@ff3d0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
>> arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388@11: compatible: ['everest,es8388', 'everest,es8328'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388@11: 'DVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388@11: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388@11: 'PVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388@11: 'HPVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: usb-typec@22: 'connector' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
