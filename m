Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6263A2248B0
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Sep 2025 15:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758383839; cv=none; b=trlgepcenxSVtRoa8zy45g2zRd2mteUo09kly01cfH3tethgSmzwxHzsjeuRURYyLDap8SAha4LroNGWkYLgk8CjEK/GNwWzrRYqX2Etrpd56c0Te5Ju/YhSme9wBDOi5etb1tn6Whzx4h99qrpLJ0xvwC/OymmNaACTH74eQyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758383839; c=relaxed/simple;
	bh=xATz/WZVwgj0l+wX/YgVAhU2Ur0JJYkN3LdaMGI3fTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gKsONaM72FxzTwjlcpzMPvaMoqWTuOEubDDHeUDVH8ReKhHUdkXfx04ghKB3xo2L1ob8Og8/RjtW3DqwDtaME+VNo3Uhac1U1ApEcOjq41lsEdFfrBqG7XqfG5b+YaAYt1CbFEXk+zLXONtQBfuzCbFUIQrhB/Tnjc45Xt94G/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZ4hj42m; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZ4hj42m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758383837; x=1789919837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xATz/WZVwgj0l+wX/YgVAhU2Ur0JJYkN3LdaMGI3fTo=;
  b=OZ4hj42myKrAuGbOtSyfaZkYVG4psth185fV08gbSW5YD0Tr2CG9xpRW
   s1IFT1usFP715KgFSEUFI0fb+ZQEhDTHLvUTPO5XC1OERBJRoJzcuseLo
   8Ib6CmuhJuqMnt8vIcl1ky1K5bl2HAG8aUkg9qpsKxzu9+YmwzInu4v8j
   i8d/xMH1SOv/BXzdbGvITrWLncNmg6NW0SwB+9Lx3+Uhab3+ljnLzG9KF
   grrGh2n54G9SjQjcsPejGiIXUsLiAArTbdrO/M5wavy5zo/lyV8g1s7V+
   PsewaRQUBrGjU3A7Nu7D9LqLqsQm3mNNgp0Lp/sutRw1LAsPJHdGjkd7x
   Q==;
X-CSE-ConnectionGUID: Sa8PueEPQlmCRSz8NPnmmQ==
X-CSE-MsgGUID: oyQ68KXGQdGO5pMkgxuNLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="83314360"
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="83314360"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 08:57:17 -0700
X-CSE-ConnectionGUID: uZRsfXFdSI2JKAyYObTxhg==
X-CSE-MsgGUID: PrX2uys3RUiZvMRyl+CsPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="176143412"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Sep 2025 08:57:16 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzzxZ-0005TZ-25;
	Sat, 20 Sep 2025 15:57:13 +0000
Date: Sat, 20 Sep 2025 23:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.18 246/265]
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: cci@5c1b000 (qcom,qcm2290-cci):
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202509202359.quLslV3u-lkp@intel.com>
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
TO: Loic Poulain <loic.poulain@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.18
head:   2f695d3eac36601d383155e3bba189f06a0f750c
commit: e645096d1f6dadcead09c722a3fbc6c44a45fece [246/265] arm64: dts: qcom: qcm2290: Add CCI node
:::::: branch date: 13 hours ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20250919 (https://download.01.org/0day-ci/archive/20250920/202509202359.quLslV3u-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509202359.quLslV3u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509202359.quLslV3u-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1891.27-1964.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1849.11-1859.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: cci@5c1b000 (qcom,qcm2290-cci): clock-names: ['ahb', 'cci'] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: cci@5c1b000 (qcom,qcm2290-cci): clocks: [[29, 62], [29, 29]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: cci@5c1b000 (qcom,qcm2290-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,qcm2290-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,qcm2290-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,qcm2290-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,qcm2290-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /soc@0/cci@5c1b000: failed to match any schema with compatible: ['qcom,qcm2290-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /soc@0/camss@5c6e000: failed to match any schema with compatible: ['qcom,qcm2290-camss']
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /soc@0/video-codec@5a00000: failed to match any schema with compatible: ['qcom,qcm2290-venus']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
