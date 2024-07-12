Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C45C14D432
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jul 2024 14:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720794646; cv=none; b=ok9jTcHruTb/BNrnz20RIkfHpG2LFq3Gpc1DcJ3x+27Ph1jN3P2Mw29+gaK+Nby6mW30xrgu6WCpVGKo/MRP1lVDmYnP0JnnpoF7b2SER5J8WJHcMke9bnWb1UGO44C/Ki0jNdwBtCH4++62M8YzihJgxmC7BmJp69I1zIqLJ1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720794646; c=relaxed/simple;
	bh=/3a3cJF/oGg6oIfg9XcmQWgRmz5gEntq9IXVCKfljLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AL3mDCp1JTvUStjWwM9DDvbWpiMaszsAIhOVY57/ZG+xICvNKpbGzG0Kw00WK9kzMPwnBolpP3MURZ1NteQyPSCDgAxBNXDwSOnahC4onKHoJrgH/d1285WxwW5FOjGmkW4hMGS/HmxpeVaINEJHy4k7Y/ox7v+NccQJqg5M0Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=byd46uhC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="byd46uhC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720794645; x=1752330645;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/3a3cJF/oGg6oIfg9XcmQWgRmz5gEntq9IXVCKfljLs=;
  b=byd46uhC2o4zTey2qjm41QvCIACiA5Nhm9GwHPsUgqk6tTyHpWDZUkBR
   1d69Yyy7v4oF5b7sh1XxkvZaDFwMMZdH8rv/m3wzT/farCd7vTeelMAko
   bD4XDl+K0aY9m1myJb1cgaoEnGv06pKF1CLH5UMGPkcvYcfS1Bq3vCoc9
   gJ9v1AUGUOhSDNUHEioKkmIy75sil3ofvuKk49i5HKKJxgvw6xuyY73T6
   E1Viojp8kLt/zmcH2vj+22IHVS8rlZqjSa5eKNDMg7/TMWaZrGrJtREV+
   0C8Et9FdHUl6VB5WZVNi2FadXs+jn6vOwkQAhm9jIgFvcHDmGvtMwu6sg
   Q==;
X-CSE-ConnectionGUID: GmPkG/IpRXO16KijWHm+GA==
X-CSE-MsgGUID: HOEpLMhNQ3e0Bcv6yryt9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="43650006"
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; 
   d="scan'208";a="43650006"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 07:30:28 -0700
X-CSE-ConnectionGUID: xw8fK/1uSMOAgEVLvwcrWg==
X-CSE-MsgGUID: N+M5yQJ2R4GWQx8IpT+llg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; 
   d="scan'208";a="53220620"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jul 2024 07:30:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSHI1-000arA-0z;
	Fri, 12 Jul 2024 14:30:25 +0000
Date: Fri, 12 Jul 2024 22:29:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dtb: pmic@0:
 mpps@a000:mpp4-state: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202407122204.QzyMtObH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "André Apitzsch" <git@apitzsch.eu>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   43db1e03c086ed20cc75808d3f45e780ec4ca26e
commit: 27da4fd325c371e1ddbb4fc46629e2caf8f73f07 arm64: dts: qcom: msm8939-longcheer-l9100: Add initial device tree
date:   10 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-051-20240712 (https://download.01.org/0day-ci/archive/20240712/202407122204.QzyMtObH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407122204.QzyMtObH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407122204.QzyMtObH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:475.26-478.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s6-p1@a1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s6-p2@a1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:495.26-498.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s8-p1@a4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s8-p2@a4)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:520.24-523.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/mode@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:530.26-533.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s0-p1@d1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p1@d1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:550.26-553.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s3-p1@d4)
   arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dtb: iommu@1f08000: clocks: [[31, 129], [31, 140], [31, 175]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
   arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dtb: iommu@1f08000: clock-names: ['iface', 'bus', 'tbu'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
>> arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dtb: pmic@0: mpps@a000:mpp4-state: 'oneOf' conditional failed, one must be fixed:
   	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	[1] is not of type 'integer'
   	[1] is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dtb: mpps@a000: mpp4-state: 'oneOf' conditional failed, one must be fixed:
   	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	[1] is not of type 'integer'
   	[1] is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-mpp.yaml#
   arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dtb: pmic@1: audio-codec@f000: 'clock-names', 'clocks', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dtb: audio-codec@f000: 'clock-names', 'clocks', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
   arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dtb: /soc@0/audio-codec@771c000: failed to match any schema with compatible: ['qcom,msm8916-wcd-digital-codec']
   arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dtb: /usb-id: failed to match any schema with compatible: ['linux,extcon-usb-gpio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
