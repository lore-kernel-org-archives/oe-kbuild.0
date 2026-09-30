Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778144825AF
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Sep 2026 10:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764481; cv=none; b=ffFfeXSzwPFW8Zc5sppyxYnXXraffvtSApSX1+WaLVGDfeEDr3GjpJeE8aGVFOTiaC2B9tzc577gdrgxsahFGOYCTNfEVZNLKcshN7qJIPANAYZ91ejgUbOQaAruqLf53W7EXN7jnro/Jv4g8LA5FSiwaUEYyFPnoGduqX6QAcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764481; c=relaxed/simple;
	bh=vA/fVbtgwYIS0bZWwL4ZzxwTM3uOdcs1x2EvpZOGm7Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=acnSQFpQRSfldwxTkm19d9WbGiNay3gXAcrFGlA61ZMbSSUAStGlA73qwtdXhGEWljFq2fj6cqYYNmJ4zspmXlPmlJBhclK7biMnfkPAKvQc0b/3L9DbtduFVv2Bo726IGx6RM9v9+LsfK86jeJ2gIkIB2VHwhM0+g4JE+AcwTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B7U5sqTV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B7U5sqTV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790764479; x=1822300479;
  h=date:from:to:cc:subject:message-id;
  bh=vA/fVbtgwYIS0bZWwL4ZzxwTM3uOdcs1x2EvpZOGm7Y=;
  b=B7U5sqTVOvzoPv+/QiaFjuAdS8/5hSuLzM4d71cU9bKPWCDWj5wXee7b
   JpRj2eFUlrMvBDqr+q2Ee1Tq5Ljb+bER3EvA0aNJL/jhBhZC7NpwYdJfE
   kq5PTfnrElKwBETiAHnu2/0+Q69qyPGHaNjiI7Bq+S7EcQrcPhdTW8UaP
   lmo1juBchasRZJUNhnuw/KJTJwaP3ucTNOF44PZ1XLFXMD1/TwUScXqO1
   9AsE7oOwYOE9+PNZKRDolosLtiLOF4ZfJujLjdK33MTgyISXAqG+bzFyJ
   Ma47xcqnQlcy1sA2gcmxvOQHrm9EQnEg6U8Qi+2MfoWt39YEtrL1lzy8C
   w==;
X-CSE-ConnectionGUID: bTproRMnSl+D0a1hnvS10w==
X-CSE-MsgGUID: /FhchT3nS/CPjeas56kQZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="107884549"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="107884549"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 03:34:38 -0700
X-CSE-ConnectionGUID: h5JnZ0IURICbsP+lQhKTCg==
X-CSE-MsgGUID: +NqWFbWORoGF8ktMivzuAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="274775695"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 30 Sep 2026 03:34:38 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBre0-000000001pb-00Rt;
	Wed, 30 Sep 2026 10:34:36 +0000
Date: Wed, 30 Sep 2026 12:33:55 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:clk-for-7.4 40/149]
 arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dtb:
 clock-controller@100000 (qcom,gcc-sdm670): 'power-domains' is a required
 property
Message-ID: <202609301237.0VyyaibG-lkp@intel.com>
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
TO: Abel Vesa <abel.vesa@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux clk-for-7.4
head:   4ba7bf34e60fec198b1b76470ba02b495c45788e
commit: 55388f587b3301dffdb30074d00f069d80d29341 [40/149] dt-bindings: clock: qcom: gcc-sdm845: Require CX power domain
:::::: branch date: 14 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2404-20260927 (https://download.01.org/0day-ci/archive/20260930/202609301237.0VyyaibG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301237.0VyyaibG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609301237.0VyyaibG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi:45.37-52.5: Warning (unit_address_vs_reg): /chosen/framebuffer@9c000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm670.dtsi:2011.27-2066.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dtb: clock-controller@100000 (qcom,gcc-sdm670): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sdm845.yaml
--
   arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi:45.37-52.5: Warning (unit_address_vs_reg): /chosen/framebuffer@9c000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm670.dtsi:2011.27-2066.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: clock-controller@100000 (qcom,gcc-sdm670): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sdm845.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
