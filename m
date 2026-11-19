Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087274;
	b=wnzwLp3f5j3fn4izFqaSqlUGDMXbM3uhiJTKCnSxPXoiLFhKsn2GXmVT/hxu+lPSc3hM
	 +MvdpiGH9TPrW3EEIDJlnYtBRD6sJi+oU3SjSNXQIeeM/9eA/QFUsm+mphnJd9NIID7A7
	 m/gEgUQlMmZ6vqXN/P2Zcb/VrTKmPyJX3/Qb0tqvVkoyfycNsu9LEY+RLgxn8zEE0sHf/
	 pb40WEQU8s7PVpxm5oEI8m064uG+U7ZN9vAKyFwi3RNel19PRcWLWiavjCZSYKddXBVCD
	 bfMgbFnc1YuQnJk4EL2ZSuNYkjCXwBbDTCJ7FmYpZo08j6TBP0Qv7Ra0xTz2UsxZSdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087274;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=BCeGGzD90AV9YkrPiqIm7dJBg9/F/hWlMlzJZK4wA/o=;
	b=aGG2/tIpcw06z3u4Tu6azcyIvFLfblOVyciYaTWDJ8RAfpZkY+MM3Zaax+op4E4+Jcer
	 1jRNHCqmwxe0iTamIcsv/UaNHJ3Q3nkLkdmqlsUAjNhU42W2QNOoFwTzZZGx7FHKHx5aR
	 u6YQu6Owgy0urmzZXt6FVPAwpeBbYzelCHVQ9CBseQjNRaXDn3bSYTlG3agSOHXVnrK7h
	 tM2R5yVAiqI2HJxqN3G5nf0zRxQ9N3TCflKfPH6iGbEVI3NqFs1sGN/SbNVz3ECc6nCyM
	 aVqIu23zI84YGyx7bGQQEZrKTyLDw2ybRhJDwwMWUO9OJq9X266sCRFsCFQq6/cgXTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z7LSD0pR;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F882606A320
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 11:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F882606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z7LSD0pR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795087274; x=1826623274;
  h=date:from:to:cc:subject:message-id;
  bh=ht4QQnOkdoAPCcjw85/7EmRS+jfb/lgpX5yJNgrcci4=;
  b=Z7LSD0pRLIu7EKrzDo4kuPb6f4ywsBXQcFHzjoli3XaT2QQ89V1x37kA
   btc7pPoFVelFaQ3IThE3S+xZRXftTPvah52JZvonCdVcmqB5Y29vdOtU0
   LnXL6XJ/UdnBEUpzpv2FctiZKSWfhmoCFzdAQqPmMHQmAOuVcleDJ6K2U
   k0/65EOA3BYsJJa0NArAEZTVg5MzOToAu1ITs51TmwHs/XoAHEKFdt4Ip
   +h7RkE/ePalmshAzFCxpLIPZYpxO2z3EajR8dQtmc1h2TuraE7Ff19kbm
   q90kwfyswBFO5qwTShMMrDydmZ6TbkCOXViDiksFgsSOTzPv3OVbEtLv5
   w==;
X-CSE-ConnectionGUID: DAiDO8YmTg6OSxwAn/eVnA==
X-CSE-MsgGUID: tMsSYEHqTeiTqVChgKdcdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3961891"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3961891"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 03:21:13 -0800
X-CSE-ConnectionGUID: 3lpgypXIRjSzPXDQ85Evrw==
X-CSE-MsgGUID: Tbp5FxctR9ydxJmztw9ozA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="12362408"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 19 Nov 2026 03:21:12 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU0CU-000000003lH-1HC5;
	Thu, 19 Nov 2026 11:21:10 +0000
Date: Thu, 19 Nov 2026 12:20:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [superna9999:topic/sm8650/el2-integ 25/36]
 arch/arm64/boot/dts/qcom/sm8650-hdk-el2.dtb: codec@6b00000
 (qcom,sm8650-lpass-wsa-macro): Unevaluated properties are not allowed
 ('power-domain-names', 'power-domains' were unexpected)
Message-ID: <20261119121652.VSErQjtc-lkp@intel.com>
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
TO: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://github.com/superna9999/linux topic/sm8650/el2-integ
head:   237d9f2f9294f587cd9e1ce7fd5124d71ea60d12
commit: bc9e829fb75069cc5c6dae658ad714828e84645a [25/36] DT: sm8650-hdk-el2: add audio with lpass-cpu
:::::: branch date: 18 hours ago
:::::: commit date: 21 hours ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261119/20261119121652.VSErQjtc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119121652.VSErQjtc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261119121652.VSErQjtc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5233.27-5308.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5330.27-5386.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8650-hdk-el2.dtb: codec@6b00000 (qcom,sm8650-lpass-wsa-macro): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
