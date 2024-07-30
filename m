Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DED36126
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jul 2024 23:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722381368; cv=none; b=ZCldihwLQQT77fww3VqkkBM9FjR/i/TWWsGA6UxgOD+oyfE42ysL3EBSu9q4rnsDTRvceX/SkSZ6E2pYPt/4dLUddHUCXbrLb7H7LudSAjG2HwBHOKqXju78MNvodu/RbRi1pST0PAlFxalm7FYYg+imLUt4cwuxAJVmFbF/TFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722381368; c=relaxed/simple;
	bh=pPaSz/H6gPkZAFnKqyT/G7BZLXjcTmXw8ODGhndyuI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NRUu5F2vUZ1bNbg+2kWo+FQ8PxADa7O+TJgK5AZVAD/uLQYGEtB+N+cQGv8mJQeeaCaPi/BOkYYV5hhusqTIAvucMeZ7zQEVKWKe56aO4fYzU6DqPD0OfzC4Jz1jKedH5V2GcANjpv3OFeYeRO2gIWYXAhw42TD34R6+Tx2xrl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHQ85AF0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHQ85AF0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722381366; x=1753917366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pPaSz/H6gPkZAFnKqyT/G7BZLXjcTmXw8ODGhndyuI8=;
  b=dHQ85AF0HeSH74T7vbR7GPh+v99VS+w2hqWdd/SDNq50BfOPFP94h27K
   1771vZsdJi2Sm2LizkDnQHi3dnPutWgDs+zAOHT+ScDIfBpcyFz44zXET
   phcEz0ZF1umxqAQ4l+ty1LdMmb+bAP17TV4YYBqMqnTTLktAYusoXmRd2
   whVYU4MeskhzBAQBkzq8fMqesgAbGN81HSdsV6fQJiXg57BmMvk71Nepx
   PYdSN6NmVX9wPNEx0cpGQ77Kk4cMBYRR6f73Pm0s0RSlKL/hNn+9ucZSF
   VCoQqDCvWlrqqMjVcZ4Ilh8RD30IRXsWcWsNtXO6b4KAligo+xJPDydgl
   g==;
X-CSE-ConnectionGUID: 1NZosbtPQ2WcR+tcIgtweA==
X-CSE-MsgGUID: LyaLiRowTZmS3lvsI0tPIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="30858692"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="30858692"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 16:16:06 -0700
X-CSE-ConnectionGUID: eP5YCOKzT/+rAcTgl0+GNg==
X-CSE-MsgGUID: rYwL9r9CTbGjv4dd+kZYQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="92004442"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Jul 2024 16:16:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYw4Y-000tUm-1D;
	Tue, 30 Jul 2024 23:16:02 +0000
Date: Wed, 31 Jul 2024 07:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.12 11/22]
 arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dtb: touchscreen@50:
 linux,keycodes: [580, 158] is too short
Message-ID: <202407310712.SwXCCkxB-lkp@intel.com>
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
TO: "Lin, Meng-Bo" <linmengbo06890@proton.me>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.12
head:   4e597323ef3d28441c792a00a1faddf71350f090
commit: 1e19ffdb780a43f34d5da28b7f84ae8c23b47451 [11/22] arm64: dts: qcom: msm8916-samsung-grandmax: Add touchscreen
:::::: branch date: 9 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20240731 (https://download.01.org/0day-ci/archive/20240731/202407310712.SwXCCkxB-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407310712.SwXCCkxB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407310712.SwXCCkxB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dtb: touchscreen@50: linux,keycodes: [580, 158] is too short
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/imagis,ist3038c.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dtb: touchscreen@50: linux,keycodes: False schema does not allow [580, 158]
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/imagis,ist3038c.yaml#
   arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-acc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
