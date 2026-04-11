Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C81E18AE3
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Apr 2026 09:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775898200; cv=none; b=PZdj7J3aFUT/nmXiZkkLO6yCs5WszKK7vMyWqCM7I2l4IIBQLXDmHdE8WQfix/nyo+HnTOsqmmKobu2/Ii4oo62v4czRdS/8kSqelKvWjEAtt0qddzfJKvxsykamS8RyojFRbtru3srXX0lSkpP+n01Exg5mnG1aAPtYFWDYRnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775898200; c=relaxed/simple;
	bh=1kSvQAXS6NO10aHXxazST/IQsJWU90vGOJUtaQYhd/s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aMEyLdphpB0mxLNiDuuZ2CmJse1/8qyf8NuX5IMtlGpR8vbuexL0TWPQ1baPWpcwuOUoe2qcHZFQzoJwSPKQC3sUJPZ9vFc+bNwIhoanE7Yd3jZEdWb8CxJAjQcO9eLaVcyUzAadwXP51o6qxIx1mDIhlxjwlne8vFY/oo1lGkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mW3F9nCN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mW3F9nCN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775898199; x=1807434199;
  h=date:from:to:cc:subject:message-id;
  bh=1kSvQAXS6NO10aHXxazST/IQsJWU90vGOJUtaQYhd/s=;
  b=mW3F9nCNmTqOLZjyFH/VcLQtYZBYDtw3kz3uImdoaF3Pt4I83Rog4wr3
   oxJ7l91irq7ODnVuMF97V0DhtPA+Oj0eOK5rJ8958G/80Ha7t6hljfWS3
   XnyIJR5pD/E2TgmwQ02Z+wu6bpU1terGlu82oHxNhgaZt9FmLo3q4Uiif
   CNhuZ4n0+Aa0+GJcTxKupN7jfwLLUnCurDOOwl2j+kwoRpYaXZwPXEriq
   oJTA0c6t52c2KVlnmPW6UGYbEKTI0/AMx//Iz/i68C8MUtVs/XTfGT/+9
   bVD2m4CeORXF/FyWeR+9Tzxd47L2GbvaaJOc+A66Wr8udQoqv2T4BrDTn
   A==;
X-CSE-ConnectionGUID: 1lN6UxLBR3iGbP7rkxp7Pg==
X-CSE-MsgGUID: 4ykgxYRsQxKruA3uCTmvSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="94482689"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="94482689"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 02:03:18 -0700
X-CSE-ConnectionGUID: x1RkqYZ/QXetGIOjts0HWw==
X-CSE-MsgGUID: S3oFgSQ4T6SlB4mdmQMsnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="229197695"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 11 Apr 2026 02:03:18 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBUFH-00000000B2b-1QcM;
	Sat, 11 Apr 2026 09:03:15 +0000
Date: Sat, 11 Apr 2026 11:02:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sre-misc:thinkpad-t14s-x1e 87/106]
 arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: remoteproc@2400000
 (qcom,sc8280xp-slpi-pas): Unevaluated properties are not allowed
 ('qcom,broken-reset' was unexpected)
Message-ID: <202604111030.dN6Hyqt3-lkp@intel.com>
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
TO: Stephan Gerhold <stephan@gerhold.net>
CC: Sebastian Reichel <sre@kernel.org>
CC: Abel Vesa <abel.vesa@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   c368130866898c0f67e75fb8e36b0708e623553b
commit: 198e41e874892221d67a88dd83c827c565d45d3e [87/106] arm64: dts: qcom: sc8280xp-el2: Add qcom,broken-reset for remoteprocs
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-2052-20260410 (https://download.01.org/0day-ci/archive/20260411/202604111030.dN6Hyqt3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111030.dN6Hyqt3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604111030.dN6Hyqt3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: remoteproc@2400000 (qcom,sc8280xp-slpi-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8350-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: remoteproc@3000000 (qcom,sc8280xp-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: remoteproc@3000000 (qcom,sc8280xp-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: remoteproc@2400000 (qcom,sc8280xp-slpi-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8350-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: remoteproc@3000000 (qcom,sc8280xp-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: remoteproc@3000000 (qcom,sc8280xp-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: remoteproc@3000000 (qcom,sc8280xp-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
