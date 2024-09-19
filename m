Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942A91B947
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Sep 2024 03:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726715050; cv=none; b=NH4l3G+6jItOSaOV+1V5BPj/61Yc2oZ+0gsg0sGzd87SpacUQxXCjU5CvvGkau9kO1eF7m+rrRM5T0SAUBFISyqlr1zegq26X9vt4ubT/iiyXPH5sf05arzfXi9Bz+uC4t2pFqT6CA1OFjyQbXvS7uF8eV7KyG63VUCBMoLqJmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726715050; c=relaxed/simple;
	bh=lMVwQj2Ndm2fHdDhIbrzfgewH7M0lJ+FTtXPPmrAF3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=njmP9OD1IEzXsHdptwQpGrKd1GhG6edfgPfETqN9bEy9mWnMxd9g/cMaFejQ6KQ1W24fvzKg98CvkolXBW2f9Sjp0dk2mtpKkrA6zdk2k6FVbUDAbKeCJyPDY2UhTtcTFW+CKHiX9SGyR0Q//oi2WnZ6LOuYFhI744afb+iqEM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L8WoPBBC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L8WoPBBC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726715049; x=1758251049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lMVwQj2Ndm2fHdDhIbrzfgewH7M0lJ+FTtXPPmrAF3w=;
  b=L8WoPBBCMg83wIf8UvtFnfi/mOq5PJcQihUd7LfKFEtZvi5LvgKqnjP7
   nWSWYFiYh/S8QYdBybHT01CxZyhnKRdT+FPoNl2o6BKt9aGUMTQb7CS0l
   Vd8h7BWFnHzGT4MkbkIsVVlWI5jisiTyjqU6pz1atuU7Hkaaamcv03W10
   4MaM4La5d754WUMs0wSQlyjRn4oL5/UgArY89S83EmbCZKXgiAlslax6m
   9EIpbkReTOhCN8M9Zu+Lc1Esl8THtL5X7p3tYk6laBWtzK1CjtcIEwHsj
   XMm/eEH3CCZXRYJkwCkXwZ/E37RBQDqZdSKLtuHzRLElGjQ4tXyiIImQW
   g==;
X-CSE-ConnectionGUID: 0cbpXyhQSEOtYxbLPbn/Hg==
X-CSE-MsgGUID: xgdQHYWESdmgaPWk5Dpa3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="37016517"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="37016517"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 20:04:08 -0700
X-CSE-ConnectionGUID: CQFdhy/BTRym3Ag0eL4ciA==
X-CSE-MsgGUID: WanGiBqsTF+BY3kiZPqu7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="74574783"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Sep 2024 20:04:07 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sr7Sf-000CqO-06;
	Thu, 19 Sep 2024 03:04:05 +0000
Date: Thu, 19 Sep 2024 11:03:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:5.15-r2pro 29/100]
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64-rtl8367.dts:15.29-22.4:
 Warning (unit_address_vs_reg): /rtkgswsys@1b100000: node has a unit name,
 but no reg or ranges property
Message-ID: <202409191005.xcJB20BD-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 5.15-r2pro
head:   b603f40b85f7cd8e92ed3ceefef5a0a3c4dec34b
commit: 384f0eb75d6fd529b1b892235d1d619b518ecd19 [29/100] dts64: add r64 variant with rtl8367 switch again
:::::: branch date: 2 years, 9 months ago
:::::: commit date: 2 years, 10 months ago
config: arm64-randconfig-001-20240919 (https://download.01.org/0day-ci/archive/20240919/202409191005.xcJB20BD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240919/202409191005.xcJB20BD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409191005.xcJB20BD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7622.dtsi:889.27-903.4: Warning (unit_address_vs_reg): /t-phy@1a243000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts:79.9-81.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64-rtl8367.dts:15.29-22.4: Warning (unit_address_vs_reg): /rtkgswsys@1b100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts:154.17-219.4: Warning (avoid_unnecessary_addr_size): /ethernet@1b100000/mdio-bus: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt7622.dtsi:923.25-952.4: Warning (unique_unit_address): /ethernet@1b100000: duplicate unit-address (also used in node /rtkgswsys@1b100000)

vim +15 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64-rtl8367.dts

384f0eb75d6fd5 Frank Wunderlich 2021-11-05  13  
384f0eb75d6fd5 Frank Wunderlich 2021-11-05  14  / {
384f0eb75d6fd5 Frank Wunderlich 2021-11-05 @15  	rtkgsw: rtkgswsys@1b100000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
