Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45098355F28
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Apr 2026 17:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776014796; cv=none; b=t+kg194lgUvolWwSDhPbbaTl+osjJ7Yhw1Osny9IIOsPJtZM6wDgHV4IPNqhaCh7ctQMCtfi0UNX2sTQgAbRGAAtqWB6OM4sCIEHwjroqi86BNSU2y6gJHwgsYQtc/cSLKUPUP2ahqQssrjxYoo9xJEHWoiIrT0dA7fx6aToVis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776014796; c=relaxed/simple;
	bh=mcFmQEhgMo5grV+o2Cj5L71pvCDFpTXiYuOE10GeSP0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mHO/hnsjnG18/Luudtu7Ag/C9S9YDslvKVSc65SukALiKFYNpTOCMfEIs2LTov1xd2uj+siUT8qGrk4pIUVagqP1IoMY1TtzDQwhSOypTEb/H/rdnDyi2vVL5J7n1TXQocr2x0uiDs4CFaQe4ELUVElCT6iiT0tvtsZmnAGTiuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UqG+umfd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UqG+umfd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776014794; x=1807550794;
  h=date:from:to:cc:subject:message-id;
  bh=mcFmQEhgMo5grV+o2Cj5L71pvCDFpTXiYuOE10GeSP0=;
  b=UqG+umfdD7y7X2B0eFWqMxadGvU+5T9o4vyhQwORFhr45u6BmDjx05Ah
   +A1zUZsbGkq+vByUhCimIJeeW0ZFxGyFIgtdvZf0EwF6DpjW7rCdguyJA
   HO/RaL+877tTi3nIQWnYGUrsQsrwpukL3ctkgxnm5Y60ymQUY5Q52mFFY
   x+wVx+VpMlDz9VE+A6/lUFzHq5btpLJvpqVlUxB593ZfRYQ3St0T1w+Kg
   hjpFTPK7uc/ZyxkIdQLkqq3gZ2ip8uLESsJRqNnLHBUZylkX/W78qFqPf
   uIonpB+96VhVwA1xhi5+C11C7r1XJ1Xmx6GdHPUMsf90AKRBnThetVrF5
   w==;
X-CSE-ConnectionGUID: HGWUpnX/QtOIHAVYfDsMaA==
X-CSE-MsgGUID: WufyDueBQaqkwEBhc9FvQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="87589909"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="87589909"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 10:26:33 -0700
X-CSE-ConnectionGUID: M2y7lPKgSTq4IUIQs4VJsA==
X-CSE-MsgGUID: 4XqKwLxJS26ZA0Q0DjWpTw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 12 Apr 2026 10:26:33 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wByZr-00000000BKb-01nE;
	Sun, 12 Apr 2026 17:26:31 +0000
Date: Sun, 12 Apr 2026 19:26:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dtb: ipa@3f40000
 (qcom,sm8550-ipa): 'sram' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202604121930.GuxKrkU6-lkp@intel.com>
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
TO: Joe Sandom <jsandom@axon.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Joe-Sandom-via-B4-Relay/arm64-dts-qcom-sm8550-add-PCIe-MHI-register-regions-and-port-labels/20260411-123735
head:   7e5ebf063fe41d871797ec6c5d83238ed388513b
commit: 7e5ebf063fe41d871797ec6c5d83238ed388513b arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2 board support
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260411 (https://download.01.org/0day-ci/archive/20260412/202604121930.GuxKrkU6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260412/202604121930.GuxKrkU6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604121930.GuxKrkU6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3894.27-3968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3989.27-4044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dtb: ipa@3f40000 (qcom,sm8550-ipa): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ipa.yaml
>> arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dtb: sram@14680000 (qcom,sm8550-imem): 'modem-tables@8000' does not match any of the regexes: '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
