Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71B4145FEF
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jul 2024 21:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722375603; cv=none; b=PDCH08KySkOZdj//oeUD1aIaoG21VmWIj5ABGg1wlLrkHrb0u+gSiehOq5ghJ2e6DSBI0yckoy98whXCCC/Y6lLpQsg1nCeKJ4f3lpSYrmbROCHXkC8k2GV0nXj7fsPNwS2oadHRgcH/wWTbfbARo1jbH5clfkVsUC7UU9j29e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722375603; c=relaxed/simple;
	bh=1RibluZKYnHf9oZhhBtuBht90xbMMNC1i0Fx6idb510=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FWCGA0aK+lXKsOIbF51jlyO2KAcLp6y3qxEKAchfOfkVe/fNqoYohFeB85YtECqhXH2q+1sr2TM5NhbturawA+so29vUtvbjA10lHQzMTw4jUv1EU0xmTaIqvr8xPVoltJ+CMrYNf+NJecBUntIIx3vS/BLKtwb/23zs9OzyfPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YOi5wIEO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YOi5wIEO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722375602; x=1753911602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1RibluZKYnHf9oZhhBtuBht90xbMMNC1i0Fx6idb510=;
  b=YOi5wIEO9J73cKNW/FHeSBDh/djaA6K5QGpF3WjODumO6anszB7hJUcI
   AU3MIsOortl2HZvPuMTAk5o4FndUEalxWnG8cgg4tK0jkSDXKFrSM66OQ
   GTJE+UrosccN3ycFNlwsbgUZWWbbQyM6psje6SBLNkbv79jvjTiRM1iBp
   yZCVYZ5m5/eipbGwllK+FniWqeSS5ch1YWMcYTe1V9baHBgz3cOuvjDLg
   Z5EZ6XPmuJw5vDkRM4wzrq/ZR8hIDDa5Fd2lVgVb6b3BeNH82GOR35+CX
   Nd5HreWAmnRbFuSZ1YAbq8LSr1fsusNNGZHL/4WDnxZ+InlT6RlujMif7
   g==;
X-CSE-ConnectionGUID: AWcxTrF3StKEiwv1MHg0Kg==
X-CSE-MsgGUID: kIv1J+wgS6+gCgkSoFF+Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20067172"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="20067172"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 14:40:01 -0700
X-CSE-ConnectionGUID: Go+Bl7U1SneSRUeirWaARA==
X-CSE-MsgGUID: 3JYuhWGvSB6Z19O/qQ7AMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="58796331"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jul 2024 14:39:59 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYuZZ-000tOA-1h;
	Tue, 30 Jul 2024 21:39:57 +0000
Date: Wed, 31 Jul 2024 05:39:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-fixes-for-6.11 1/21]
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0:
 'vddaon-supply' is a required property
Message-ID: <202407310507.Z3uCGC6z-lkp@intel.com>
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
TO: Patrick Wildt <patrick@blueri.se>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-fixes-for-6.11
head:   a0e6fbf22439f796b51ea583a68eb763b0a99393
commit: 8bc7cb73df8644423758c79d4504d501c8ef3854 [1/21] arm64: dts: qcom: x1e80100-yoga: add wifi calibration variant
:::::: branch date: 8 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20240731 (https://download.01.org/0day-ci/archive/20240731/202407310507.Z3uCGC6z-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407310507.Z3uCGC6z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407310507.Z3uCGC6z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:3883.11-3893.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pci@1bf8000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddrfacmn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'qcom,ath12k-calibration-variant' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
