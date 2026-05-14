Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E21833F58A
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 19:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778785683; cv=none; b=ILi6NBs+ufYPTdFVBZyCafrvDf59IcDbZhA2aGkcMOZ0IjWxK78+ooCvsaGUJFJJZQmw0BcHbtP0pIwDNC/1MN0xYR52o6HhREaU1HRidfUx5mOPT6t0JPsw+SLFQh4JSYqwgv8n3CWr8RQcT/qD1niFhD+pvtxmeMom6HbXoA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778785683; c=relaxed/simple;
	bh=EEifvzQ07L7GIAoAHv061D1g20uENVG1MI19PhgG3ag=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZftUapXQI2akx1TNvdiQebcfHWEjPxOYYUcg9WIVMsA1fY5DCeaXMbkjVBlFCuuhA2LQlsVHhJr3w1LavcQkqmP+4kIV1YBn3nwg3AnZEDhlZKwEHMKRvfW0mL206ROG1hi1Ptv1X+dtwguAuWQlMi22TyL69j5NaXGRFnIEph8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMqrFLMl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMqrFLMl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778785683; x=1810321683;
  h=date:from:to:cc:subject:message-id;
  bh=EEifvzQ07L7GIAoAHv061D1g20uENVG1MI19PhgG3ag=;
  b=gMqrFLMlmI7JngG94qP26JQ2VELAlqUxap1HcjubuSstjz4yU4QJJmOb
   xMlD3ehw3TPOBO9D4CvB9Cf7mZclbJX6a4rvzIEsQLLZ2+1HqJy26Crdj
   0fKQDmqBmzUK76SfddkvrIEA4FqjjeLRJVEXVakHjjj7UGS30x9DwmYgF
   27AXIVPsXRiXgRrY31h7mWy1Kf03JFi4jPbpa1mxCIQRvbcsafp9YYZC8
   y8rbNFt6lmgABhNhE68diAgn4LIFF95p4BOS+qS51o5dVp4ETlbHcmE6G
   Vl62cwjM/+yRi5joDmeiFUkzcTx4Lz0mMgOsOXlHcYQof6/LRxtZeCtC9
   g==;
X-CSE-ConnectionGUID: s2gDcCe9RSyjRxEnASi2mQ==
X-CSE-MsgGUID: Q82AQ9eQSSOeYhrKJzgYRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91201751"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="91201751"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 12:08:02 -0700
X-CSE-ConnectionGUID: OA5gCkA7TBaw73RnetgFTA==
X-CSE-MsgGUID: zawp1hFRTbWeNT+j/PBTTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="235832029"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 14 May 2026 12:08:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNbPa-000000008rL-3Dy3;
	Thu, 14 May 2026 19:07:58 +0000
Date: Thu, 14 May 2026 21:07:22 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.2 71/90]
 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb:
 /soc@0/pinctrl@33c0000: failed to match any schema with compatible:
 ['qcom,sm6350-lpass-lpi-pinctrl']
Message-ID: <202605142112.KIbGTmhL-lkp@intel.com>
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
TO: Luca Weiss <luca.weiss@fairphone.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.2
head:   c4b423835ee7529854ab39b50cf766bc4c6b4d66
commit: 630398127110753474576cbc0cd4ad102b18005e [71/90] arm64: dts: qcom: sm6350: add LPASS LPI pin controller
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2055-20260514 (https://download.01.org/0day-ci/archive/20260514/202605142112.KIbGTmhL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605142112.KIbGTmhL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605142112.KIbGTmhL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm6350.dtsi:2439.27-2516.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb: /soc@0/pinctrl@33c0000: failed to match any schema with compatible: ['qcom,sm6350-lpass-lpi-pinctrl']
--
>> arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: /soc@0/pinctrl@33c0000: failed to match any schema with compatible: ['qcom,sm6350-lpass-lpi-pinctrl']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
