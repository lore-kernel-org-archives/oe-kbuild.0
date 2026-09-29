Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12222D0620
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Sep 2026 15:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790696173; cv=none; b=AMYooDKyK0wQMBMVBJ2SczEKSmT1gT5LR2S4r2mhKdPPYQO+55XLX5SKaLsTZ6RD9jBOL3DsfGIi3F5eAFdtud83dQgSYTu3HEsjI89wN8TbRGfZlTOD84dGM47BEk7R84NO5rCfGe+hmBA7Tu0t1erWXMLzjUBDBJzzbmQCjqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790696173; c=relaxed/simple;
	bh=TVv8/a0n0A8rL0YWq8YHiIVeCtNMNBwDTy9w5pwmu+E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qk4qEDg7dNVfFFYvDZ8+AVvBXw+/m6wyOd2v9z+WA03NCQaltl1ZIw9lI8/hTgjtbKvc/pMsiIsdSdjI0HlY5TMnaFUKLeKXV8z6GQCTVleSCWbCu0MTrHC8DLyJeZPFf5EU0WUqM46rA+rznicrbz+0mykE6n4/339CQyZVj4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKeFMLO0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKeFMLO0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790696169; x=1822232169;
  h=date:from:to:cc:subject:message-id;
  bh=TVv8/a0n0A8rL0YWq8YHiIVeCtNMNBwDTy9w5pwmu+E=;
  b=FKeFMLO056WcTOeIOJYOnQYuGyRFinYx86/YRpsflHjMhmx5nqrlWhA7
   CwSRTqtFLCEZq/bzk8BtVc6t9SPcEEI6MBpHNYG61U+kEYXkjmFSg6n6i
   YBqHlQTWL98qlI946O2QoNeE6NVES1Ft0a+l33v9hkQQCX8qbfy49OB9r
   Pje/c6k78rV805yKsCPZH7qFDfvmvJGcSe2tgsFaF+n1iQY2uSvcmRZFH
   G+gXwXMA98AQI7//sAbgIKxyfzcEmcBfE3A068GAbLcyX+DmtOn+H161K
   yKD6+caZopGzBWs6HdEsI48mZawui9sCEEOih0A6G6BHN7028xhwFoP4A
   w==;
X-CSE-ConnectionGUID: /gmeSfj5TPiYCeqw6xuc1w==
X-CSE-MsgGUID: I1ckGAaRQIK9CpcNXRCijw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="78983712"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="78983712"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 08:36:08 -0700
X-CSE-ConnectionGUID: w2hUaHiuQfC/m6Zyb5E6Ig==
X-CSE-MsgGUID: zMqt9f41RF6LsiBTN/TR6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="274951391"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 29 Sep 2026 08:36:07 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBZsD-000000001St-1Uhw;
	Tue, 29 Sep 2026 15:36:05 +0000
Date: Tue, 29 Sep 2026 17:36:04 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-li:imx/dt64 65/103]
 arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtb: gpio@2310000
 (fsl,ls2080a-gpio): 'pltrst-hog' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202609291726.iogWKGg7-lkp@intel.com>
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
TO: Vincent Jardin <vjardin@free.fr>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/dt64
head:   8c40f32361d566c0882e9d92abab36256b268291
commit: 565b6713a460126874d15654fe24d995a57c822b [65/103] arm64: dts: freescale: add Nodebox v3 CPU Module
:::::: branch date: 20 hours ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2402-20260929 (https://download.01.org/0day-ci/archive/20260929/202609291726.iogWKGg7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609291726.iogWKGg7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609291726.iogWKGg7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi:1534.34-1697.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtb: gpio@2310000 (fsl,ls2080a-gpio): 'pltrst-hog' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
