Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122FE270552
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Sep 2026 03:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789528903; cv=none; b=IiZz0DV9aQdZeCbkMXaBmyMjbzjOexQ1xxIzsL6p6VyDq7qoNKBLZxdKP3wGkEpmYllWlC7y4+i3MTcO3RH4z8cM2ayKq4g9rHclCBhtdQL9G8oxlVEEbeMP0sTeO6IIjWEw0TaxTLthyAemkcaSeJjtPXA0f4NccE3qjOisx3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789528903; c=relaxed/simple;
	bh=3ihrsGfCVSZmVp6OKEo9FlWdYmWdCwN/j5Iu3XOgyDw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jrRDkiMmPUHUoKTKsos4q7sUpr4Jw3XoC3fXU8U24lP+xc4eS66o+NYvxOC4ECmtJYs44VsXoNDwmA6XOSHR6ITyNxfJ8cfZd4z5q2ftcUqFHfBZSmPbGVPu9Uz7UrDr+B1k/AG3kYrAU9i+nJAR9j90mpQ3vaJqfhN6LGLKtSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCp5KTxy; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCp5KTxy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789528902; x=1821064902;
  h=date:from:to:cc:subject:message-id;
  bh=3ihrsGfCVSZmVp6OKEo9FlWdYmWdCwN/j5Iu3XOgyDw=;
  b=RCp5KTxy6CJXJZJe2PJbVMTglKTnTXlDlDG0gZcEDp/dyS5Rzh9WtVby
   Oyk952SZI8DxvGeQsi5hn0fQoK17LnX8jq9qNi22cZrg+KgwiH2od3dyJ
   5+TTe053qZuEzad3Irw7usqB0ldVRwNHrnR1Uk8StbUqtYcw6n5TE1zli
   FCmdmjdNYby67VvRvRPspOx/1Zvtk130xHmKnV3/TPbkIVtyARyPKLbGM
   0iVOEfkLVYz662dwQCLZSJB5q0nU9HjzASdHhLqnXiNqx5ynK52PTdEHn
   Hms/DrDQSfUmNM+5LrV7Noa+kz0bKDRC5BCcmO6QQC9/TbQ4g7aGv6KF4
   A==;
X-CSE-ConnectionGUID: 3TGqwe2LRSK6BDUZpP2xFA==
X-CSE-MsgGUID: 0DnhO2TIRNyVA3W0Dw0QTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100499737"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100499737"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 20:21:41 -0700
X-CSE-ConnectionGUID: 9/SrwDR9ShKOh00pftcycw==
X-CSE-MsgGUID: 2xgFFxL7R4C7upfwLqLwgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="311476282"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 15 Sep 2026 20:21:40 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6gDJ-000000000tf-1UIG;
	Wed, 16 Sep 2026 03:21:37 +0000
Date: Wed, 16 Sep 2026 05:21:24 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:socfpga_dts_for_v7.4 2/5]
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb:
 /soc@0/mmc@10808000: failed to match any schema with compatible:
 ['altr,agilex5-sd6hc', 'cdns,sd6hc']
Message-ID: <202609160341.9tN6h0Sq-lkp@intel.com>
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
TO: Tanmay Kathpalia <tanmay.kathpalia@altera.com>
CC: Dinh Nguyen <dinguyen@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_dts_for_v7.4
head:   0199e7aaa990971c62dd48e55e879b66d842d511
commit: 149e151f8c5144004d9299ae63f405eeacaf2894 [2/5] arm64: dts: agilex5: add SD/eMMC host controller
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-2055-20260915 (https://download.01.org/0day-ci/archive/20260916/202609160341.9tN6h0Sq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609160341.9tN6h0Sq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609160341.9tN6h0Sq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: /soc@0/mmc@10808000: failed to match any schema with compatible: ['altr,agilex5-sd6hc', 'cdns,sd6hc']
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: /soc@0/mmc@10808000: failed to match any schema with compatible: ['altr,agilex5-sd6hc', 'cdns,sd6hc']
--
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: /soc@0/mmc@10808000: failed to match any schema with compatible: ['altr,agilex5-sd6hc', 'cdns,sd6hc']
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: /soc@0/mmc@10808000: failed to match any schema with compatible: ['altr,agilex5-sd6hc', 'cdns,sd6hc']
--
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: /soc@0/mmc@10808000: failed to match any schema with compatible: ['altr,agilex5-sd6hc', 'cdns,sd6hc']
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: /soc@0/mmc@10808000: failed to match any schema with compatible: ['altr,agilex5-sd6hc', 'cdns,sd6hc']
--
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: /soc@0/mmc@10808000: failed to match any schema with compatible: ['altr,agilex5-sd6hc', 'cdns,sd6hc']
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: /soc@0/mmc@10808000: failed to match any schema with compatible: ['altr,agilex5-sd6hc', 'cdns,sd6hc']
--
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: /soc@0/mmc@10808000: failed to match any schema with compatible: ['altr,agilex5-sd6hc', 'cdns,sd6hc']
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: /soc@0/mmc@10808000: failed to match any schema with compatible: ['altr,agilex5-sd6hc', 'cdns,sd6hc']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
