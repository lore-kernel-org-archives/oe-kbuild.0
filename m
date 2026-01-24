Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA5C1C01
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 20:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769285882; cv=none; b=uBYL3gNM+3p9kNwXY2RvQtz3slOZtllcdmeNFovZw7O/lcjQu2NHzbvaf1AiaGWYZw0p7kYfZLq7FSleVlq/qxHX4oRd8gcME2pq/03VGamhhCyC6bFRbxUWgc/7zifnL2QtGUmgyt8OEXA5odP2fRoaPloBHvsgCEocrZXyDzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769285882; c=relaxed/simple;
	bh=rXR7xENc8BR589MHzPmzQYnQywgndHT9e4K7wOPyAUs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t/5uFmubB0grjkeG4JqC2x99F+E23AxS7xTgwZi7vwXbmpSzHBUurs83OLJXKBo6JPmR+lWlaQMDm5UbhNr99SUYzOcvJPBYaPr302lhIzldn4TkXl/kCFW1KMg6lJATtdrkXn99Vq6+ibgo2TWSjMdTiT+GZ3s2w3fQ0cUORaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWMk9BMD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWMk9BMD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769285881; x=1800821881;
  h=date:from:to:cc:subject:message-id;
  bh=rXR7xENc8BR589MHzPmzQYnQywgndHT9e4K7wOPyAUs=;
  b=NWMk9BMDj3Z25Micd35sawgu/bVoXV3x41RkjEFEYt7jGQOkObSz02GV
   M6bhqsgJLW8NHo5D2Jlbn6HPNghid8/Sg6cf0Am9smc9JcedeXSFB/G+h
   x5MCibNMCyXQOFQDl3Xt9ecmOvF6659xFgQMY+ZbM13DW3fm4R77IlvVG
   C9riSUAGXj6BmRT/P58F3UHfMKgwM3r1STNiV/2ouEBrDTB8smEbmg0kG
   pkYDRjYcAqtVWloqGdfPOk8GoOrOfLf9sV/jgEqB+ZA9WMM5gLSuMAilv
   dScJ5CLcq2gu6WK3AKw/Lzh4DdsYyMR/7dD2f7njipNhYa1LNQ9fAEXgQ
   Q==;
X-CSE-ConnectionGUID: T2cv/+csTGe1SH7WK5C+tA==
X-CSE-MsgGUID: +/RmRSvmRaOxRcDr2us1bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="70668573"
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="70668573"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 12:18:00 -0800
X-CSE-ConnectionGUID: 4p9gcdVpRMiidhnmdh7JeQ==
X-CSE-MsgGUID: pTblbIWBRgyl7wHXB8760A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="212308870"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 24 Jan 2026 12:17:59 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjk4z-0000000013x-0hAD;
	Sat, 24 Jan 2026 20:17:57 +0000
Date: Sat, 24 Jan 2026 21:17:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb:
 wifi@0 (pci17cb,1103): 'vddwlmx-supply' is a required property
Message-ID: <202601242112.7E2bqvaF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nikita Travkin <nikita@trvn.ru>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   12a0094839d095e6cfd23dc5f5336d260a363331
commit: 263780f3189730f2efa511181c3970384e54afde arm64: dts: qcom: sc8280xp: Add EL2 overlay for WoA devices
date:   9 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-2052-20260123 (https://download.01.org/0day-ci/archive/20260124/202601242112.7E2bqvaF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601242112.7E2bqvaF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601242112.7E2bqvaF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddbtcmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfacmn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
