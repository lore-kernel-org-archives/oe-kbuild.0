Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251820;
	b=5q299e4QHGk633U/Yr6qpxVRhLk2rHrPWdcrz1x8UQgSdC+CxjTfkRTQ9dRl/x6mMcHc
	 t1lxPEXq6BSh/u2r9nuH6PLuOEIYuhSOsIZ6o51BYPCOD6zX+qJI/kdWpgVpsrtYFTuxc
	 3pPUJ2ymIeUSfpQ/FiRSn9qIXjCx/dC120Zgf8+ISPOy2rWJIYFfUqbr26GhbgpGf7YsX
	 NsAIdz9/n3JAzac+1CDGQe21E2Ki6H+0N9gMYPn8/IXtnbB8bTRfQHQPRpwnxZa+UkTXr
	 6mI2iIFVMgn2wG40r/2OZFMts2VHz5tZYVkhhgiTo12dSimNyokZcx627gUDWHMytrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251820;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=GkYuN5juj+v82YZToN6CBV1zAePN1vk3AnfUGR8sGX8=;
	b=LXf2lwKqfKfX1dXFBFkPXfNyG5ts6JJx6NAbhYMX+afngbGYNrjb+SR+lMy/3k4OF0Ss
	 QiD/Pb7sCzim3u5zRd7pG0QmQzDlAskRxowF9Goi99Mg/y0V5f65sf7KVDRFNWZWHmfly
	 pBrDtyCZAv4C1J0bP2+8m5KGWVfjPQv0kELiWa2Mx0LscctmU3ijcLu4U+9jB/KhlFfcr
	 4CTPvk+f8Inq7pfUOS3rpY09IP4TkSJ1DdbBfPm5lxztfBdJOtR5EfGSREC+/2eQGovI4
	 3WPprriXNQGlJg7LKVPk1HqmGPckK5fUWQKhYM8ucRSMskq4JIgvjyTZqgaXOZoqCUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S32Fmug6;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A1C606A325
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Nov 2026 19:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3A1C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S32Fmug6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794251819; x=1825787819;
  h=date:from:to:cc:subject:message-id;
  bh=O0ia/BDSozKcYgO/UcJ3s7FT29memKAKaMxQhBNHbhE=;
  b=S32Fmug6CXedHDIfcn1J6PnhDhJkMLSTa1qfhdlOOEWLk/xKnKccpDAm
   vOKYdLHrKWWnxO3Slec6BWljkQIROKrzmvMmIEs9NAoSLp/njQFLdnCyr
   0Z/vNkilPP/c0kIA0IwDhta2Dc7dyE8tF8NjzHN+ZjCXXK22dJBgCbqNm
   junivZLnf+82h+qRntVmsVq+jwZ1GNVaFkefQQMXTQJygX9qWmOm+ww1D
   30Ceh97PpNGyZJBbCMDEgO/YhfTUuDOLYvOJV6/cI56ADiwiUJt0RQOF5
   ZKP1YzojKaaPMSOAHf4YJcjFM4Ed0R/qgiH03Il31x+uV1tSNfpHpOnkX
   w==;
X-CSE-ConnectionGUID: 0G3g5AwGSCu0lZLU/yMtJA==
X-CSE-MsgGUID: VHP9x04PS1q0RwrjWg8RJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2873050"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2873050"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 11:16:59 -0800
X-CSE-ConnectionGUID: Ve36mBvSTXeYPD8hrxA7ag==
X-CSE-MsgGUID: 09y3OCg5T6G47si8xeFTkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8001826"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 09 Nov 2026 11:16:57 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQUrP-000000000SF-0goF;
	Mon, 09 Nov 2026 19:16:55 +0000
Date: Mon, 09 Nov 2026 20:16:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.5 155/161]
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dtb: / (qcom,eliza-cqs-evk):
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202611092005.hOEJNdF1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Abel Vesa <abel.vesa@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.5
head:   9ad33b312eb123e9a2e4e86f8849fa59db290226
commit: 14120bce2899a8736934018f9817c23b95b8a073 [155/161] dt-bindings: arm: qcom: Describe Eliza CQS eMMC and UFS variants
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261109/202611092005.hOEJNdF1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611092005.hOEJNdF1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611092005.hOEJNdF1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/eliza.dtsi:3025.27-3111.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/eliza.dtsi:3133.27-3195.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/eliza-cqs-evk.dtb: / (qcom,eliza-cqs-evk): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-cqs-evk', 'qcom,eliza-cqs-som', 'qcom,eliza'] is too long
   	['qcom,eliza-cqs-evk', 'qcom,eliza-cqs-som', 'qcom,eliza'] is too short
   	'qcom,eliza-cqs-evk' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
   	'qcom,eliza-cqs-evk' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
   	'qcom,eliza-cqs-evk' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
   	'qcom,eliza-cqs-evk' is not one of ['qcom,apq8074-dragonboard']
   	'qcom,eliza-cqs-evk' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
   	'qcom,eliza-cqs-evk-emmc' was expected
   	'qcom,eliza-cqs-evk-ufs' was expected
   	'qcom,eliza-cqs-evk' is not one of ['sony,karin_windy']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
