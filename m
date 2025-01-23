Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A50C1EEE0
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jan 2025 08:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737621329; cv=none; b=jIjab1Emy43v9PZQp743FCyb5ig2mBs/2z7NstTS8his5orrDuYx5Wn5BpEkFdouLEg47COCQGhLieow9xikEd/zEFxgT2AEtmjzdr0kOdLTCPVuNgANp2Tize1HA07PGT9OdBkwa1AOJsC52HHdX3cflIGEJoQD7ZzP1QEDojI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737621329; c=relaxed/simple;
	bh=PYfr1+WcYkWOFmGdLHWBU67sW1pb9U4FrxrUjquamwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ExJxAl1lTTCkvYyA8NK64vNQOrJl9GMn7YGaYZqGcxFlXzyYVTIfp+ncZDDbaSwY375wv6I8vHs6xcM4QzWNNgZVc3nJElbXfNN/LA7UBKKR+s1Snh2fdcvlXKupxTA6EBQmzhRyAs2Lc3dZ+T7GNyZCr4xvDL67lK4iJLfe2+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bk9u+vPp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bk9u+vPp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737621327; x=1769157327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PYfr1+WcYkWOFmGdLHWBU67sW1pb9U4FrxrUjquamwY=;
  b=bk9u+vPpSzx60vmb3IOxN3igYbMxOxdf6NH81jlqTzik9OuPZzNMu8IV
   fxyQ4N/JnnmYtxXpYyNg8+NE2ZBeebhHJ7Ujbdbllx+9/yoBl+EEwom8s
   dHPZmQLN8GMliIZ80hTVYV0F8JMb/1ncBRC5SiNMY5N0rzc1X6utiHAgs
   LMg/wCZF0MZd8htAHICmzlSxQS/o0EhvA52MCq2umBGSonCh/66Gs92Kd
   6tMocdEXSk8H0Rbmz3ejE/R27cT+3XwdOtLZ7xIcI51flf3AXWBTcvJG8
   n0QeE5xAQOFvRg/rwGuOPt0MhYIoANXceTgE/gibwY8wZmwVT9AdhtdIQ
   Q==;
X-CSE-ConnectionGUID: REKgH31iTvS9dMu4/fgd4g==
X-CSE-MsgGUID: 5ti/sK7AQPu21o+NSCg21Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="55525302"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="55525302"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 00:35:26 -0800
X-CSE-ConnectionGUID: mi7p48FGT3CSB83aNpmaWA==
X-CSE-MsgGUID: mzgZ7xgZRQGeVEtoMzQpKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107825844"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Jan 2025 00:35:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tasgN-000awb-1N;
	Thu, 23 Jan 2025 08:35:23 +0000
Date: Thu, 23 Jan 2025 16:35:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/sm8750-display-dts-and-panel 72/74]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts:869.9-880.5: Warning
 (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports:
 graph node has single child node 'port@0', #address-cells/#size-cells are
 not necessary
Message-ID: <202501231644.hfHqOaWT-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux b4/sm8750-display-dts-and-panel
head:   3d4ec7553fa4310579528818ee68ffff4b614b66
commit: 5b9b0229fdbed87aae73a347dab2ca7ed434852a [72/74] WIP: DTS: sm8750 audio wcd USB
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-004-20250122 (https://download.01.org/0day-ci/archive/20250123/202501231644.hfHqOaWT-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501231644.hfHqOaWT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501231644.hfHqOaWT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2926.27-2982.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dts:869.9-880.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +869 arch/arm64/boot/dts/qcom/sm8750-mtp.dts

6a02becf4b42f1 Melody Olvera       2024-12-04  855  
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  856  &i2c3 {
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  857         status = "okay";
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  858  
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  859         wcd_usbss: typec-mux@e {
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  860  		compatible = "qcom,wcd9395-usbss", "qcom,wcd9390-usbss";
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  861  		reg = <0xe>;
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  862  
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  863  		vdd-supply = <&vreg_l15b_1p8>;
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  864  		reset-gpios = <&tlmm 152 GPIO_ACTIVE_HIGH>;
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  865  
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  866  		mode-switch;
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  867  		orientation-switch;
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  868  
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31 @869  		ports {
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  870  			#address-cells = <1>;
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  871  			#size-cells = <0>;
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  872  
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  873  			port@0 {
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  874  				reg = <0>;
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  875  
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  876  				wcd_usbss_sbu_mux: endpoint {
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  877  					remote-endpoint = <&pmic_glink_sbu>;
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  878  				};
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  879  			};
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  880  		};
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  881         };
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  882  };
5b9b0229fdbed8 Krzysztof Kozlowski 2024-12-31  883  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
