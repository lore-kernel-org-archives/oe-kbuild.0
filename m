Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D185A37F8C2
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 09:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134890; cv=none; b=JlPYA2nTe56+p+t0CaV1fVPZh6yvL3xPAgAUe8lpHQeQEKifkHHlTPO4rjuH5osTST0GRszoJdZAJItE7OUNfbbEl3Jx3KE+MYt2Wf3y1fdrxq0YMhJmI27yKiPNvrg+7lz5lsVPbtxtiOE+i9SBtpfoJ/8tzkT7byjaOFVmb04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134890; c=relaxed/simple;
	bh=gYnjmmFijS6BOuZZyZaUzdYHX675E3RA7N7Y4P62qb0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J5d4ysqtlttxIM5tX3kB9W4QfwlI7W2II1gDN44hxP0n0DgfPZIuUDjfJMhlCSe/txMEco+qYgisooLklgEBOt9XiiA6vShpZHwt/eu9QhuYsFMa1V5cfGVLOztCSHaVVN9nU7iDzBGLr8x7ofEDVs+od5HbFHp1szWOG8nTorE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hV1C2+h2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hV1C2+h2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780134889; x=1811670889;
  h=date:from:to:cc:subject:message-id;
  bh=gYnjmmFijS6BOuZZyZaUzdYHX675E3RA7N7Y4P62qb0=;
  b=hV1C2+h2vPOY4ArB71i+MELgzIiy4DHFvwN073EwEJMTatRAdjcMAZya
   NMhFFYhYsAZaaIZ4mE060I+Uad5HwqSQCjaGTVFmXFWoBkbTcmKRBj8T1
   jElUIHTzpUKFw8RgWaV8eE1WHNOqev0YD2xcalWIfkvWvqeT6khtXKanb
   y0mU2n5Nw7/hxcGazhl3dq2C+y54CRHn/mKtlTUc1pRbY6PuKEVBBpzjh
   3g8uOv5u7fdeAwT31kb8jdpzh6JVDA+SDeB3GLYSkW8KpEn//OZ5E2Fpc
   nRCNICvXxT2bi7tpH2QGJcKCx0ajMU2pxiOIJcwrjWLj2l8C8555KMuyH
   w==;
X-CSE-ConnectionGUID: +njiaYUzQnyfVukcp3BlSA==
X-CSE-MsgGUID: 5X03e2p5TFqoFMC0UsR3dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="68506016"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="68506016"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 02:54:48 -0700
X-CSE-ConnectionGUID: ofeyfO1xSKqDb41YALjBUA==
X-CSE-MsgGUID: 8v31/knuTSGTTomuLFt3Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="248171904"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 30 May 2026 02:54:47 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTGOz-0000000016X-224w;
	Sat, 30 May 2026 09:54:45 +0000
Date: Sat, 30 May 2026 11:54:29 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dtb:
 ipa@1e40000 (qcom,sc7280-ipa): 'memory-region' is a required property
Message-ID: <202605301108.JsY4IhvV-lkp@intel.com>
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
TO: Stanislav Zaikin <zstaseg@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Stanislav-Zaikin/dt-bindings-arm-qcom-Add-SM7325-Xiaomi-12-Lite-5G-taoyao/20260528-235043
head:   6fa3a6c415f738db48b34942a5c339ddd727a7ac
commit: 6fa3a6c415f738db48b34942a5c339ddd727a7ac arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao) DTS
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260529 (https://download.01.org/0day-ci/archive/20260530/202605301108.JsY4IhvV-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301108.JsY4IhvV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605301108.JsY4IhvV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5463.26-5538.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dtb: ipa@1e40000 (qcom,sc7280-ipa): 'memory-region' is a required property
   	from schema $id: http://devicetree.org/schemas/net/qcom,ipa.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
