Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79FD376
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Mar 2025 02:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742092879; cv=none; b=VphAGOXsgpx5q1e4klDupXgypwfwvZpXPBUTx5ykUOkRED6Tlc0qiDA7if03ga8Tz6YAfFwfaU2D3qbfOKowrjrauSkfa2LYz4CfrXHSjWHTHykjLN7jRS0PXFW/Hl7IlCxSo8XAUAnm2+6v/atiVuy8EupytsBRYkNK9MzOIq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742092879; c=relaxed/simple;
	bh=jpUIYeLtIR91spTuUBM+jR4kOLaQRLSDtNpQwx9YNFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Js2Oe+ISVcjyMZLNKrPdHyBdtAHXuaZfoO2Badv/eoa0lZ/MgZDI10eSEERj8ngEPDFJb09DzVhe0vnRi8pTrkMBWjmfu2ylr9Rcc9Wr633GEXhIpnPFbIFh9H7vb4VfLcp4pC+EFN3bdC+i2EsQqxXIhFY3wVYxvY9RYbIGoRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBHYOb7p; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBHYOb7p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742092877; x=1773628877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jpUIYeLtIR91spTuUBM+jR4kOLaQRLSDtNpQwx9YNFE=;
  b=OBHYOb7p+BIzB9yz1xziSrFw7n7J6ErFQExFV4Co844TsBjnIftS03FU
   Zz64ha6ggf8QWRzV4vYvIF1aV6XNb79tCAdk19lEKlU+y4/zIgIm77WKx
   k8GpBdyYdgxYEpq+raaKPj2ODgcDiBqCaDc6Nkvag5PDB04PYi/7pjMxr
   zftbpqC7EyargrQsQNberqnzTZGcXqRC2w4fOre6pRGvt2LuxWA9CCNjW
   sj0ukq2IcYxkWqn6PfHCfdaN2lReAYEYGtm5q43m5PuRld/t2HHANTg/a
   qAUetjZxa5IjYqHj6tJWiDm3m24SSPtPerkpRpHsqIhkI41AP8OOdV0ib
   Q==;
X-CSE-ConnectionGUID: RcPgn2FMSCeekE4XIAfUIQ==
X-CSE-MsgGUID: bMrspzUDRGyOez0ufjjLmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="53876079"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="53876079"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 19:41:16 -0700
X-CSE-ConnectionGUID: hsxnA9CeRDmUrVlFD30Plw==
X-CSE-MsgGUID: u7onzwudRb+brnWjgcWEAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="126660955"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 15 Mar 2025 19:41:15 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttdw8-000Bn9-0t;
	Sun, 16 Mar 2025 02:41:12 +0000
Date: Sun, 16 Mar 2025 10:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.15 123/172]
 arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23000000: Unevaluated
 properties are not allowed ('interconnect-names', 'interconnects' were
 unexpected)
Message-ID: <202503161013.zMipToL0-lkp@intel.com>
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
TO: Lad Prabhakar <prabhakar.csengg@gmail.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.15
head:   27b85be287f96180de2499b981eec83850df0da9
commit: df52f9ab185e91886c8fb0660a0768d29b4cc379 [123/172] arm64: dts: qcom: Drop `tx-sched-sp` property
:::::: branch date: 23 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250315 (https://download.01.org/0day-ci/archive/20250316/202503161013.zMipToL0-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 87916f8c32ebd8e284091db9b70339df57fd1e90)
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503161013.zMipToL0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503161013.zMipToL0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('phy@aec2a00', 'phy@aec5a00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: display-controller@ae01000: clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: display-controller@ae01000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23040000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: wifi@0: 'qcom,calibration-variant' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: wcn6855-pmu: 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: wcn6855-pmu: 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
--
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('phy@aec2a00', 'phy@aec5a00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: display-controller@ae01000: clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: display-controller@ae01000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23040000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: wifi@0: 'qcom,calibration-variant' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: wcn6855-pmu: 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: wcn6855-pmu: 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
--
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('phy@aec2a00', 'phy@aec5a00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: display-controller@ae01000: clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: display-controller@ae01000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: wifi@0: 'qcom,calibration-variant' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: wcn6855-pmu: 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: wcn6855-pmu: 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
--
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('phy@aec2a00', 'phy@aec5a00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: display-controller@ae01000: clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: display-controller@ae01000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: wifi@0: 'qcom,calibration-variant' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: wcn6855-pmu: 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: wcn6855-pmu: 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
