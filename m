Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728905;
	b=H5YoDK8Lo6KYideDwYM3w9hWHAwb09KXjU1DumTqFrWSIFY7zLB5Gm7sM/YxxkGpmgOV
	 MZTIZe3RNW+reH9dt3PiyzBIXjiUFnrlF8c6FVS3TRIki0vFao+FOAM8cUmA/lfWws1Zo
	 MCST8ozRW+PRwSqlembcz7q2K0TXbcqq59/DUnDPiPg9QJIOobI86/zIu+Oeuc6+efs1u
	 sqiviIr8dvIwezdxJdX3/r8+oZiQ+/bE0KGL9brmWFdeNSU4/MVb+JoJTOCCogju3UK2C
	 +Q/hbVQgEx71Xbk5KKpKW7RrfZWr/lcZmfnbGgzwp/8rYCnJk8Usq1/OwTQG9wYSt7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728905;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=zTuhmaZZwGmiApwwf7CRmsKlxDLFS/Dke8AzNKA+GWY=;
	b=s7rMOudHM4RiC6+Vf8XdaNn7C8SZ8IEpT2Rx0UaZUCV7EgpvDJTZT/TamK9mMOVNWhSS
	 w+oDnj0Mw1akVUFzqCIbggXCUFerGD5kCp6MirJcBHF4M/dXhA8z+JpIBhmTJzRsdSlY2
	 7wVN28vE4E4vLwKjmh8tzf0qzWR0DlL215gflmhYYKyfDLniNq1xDRn3gNjFJ2oknQTj1
	 PwNQHMsyZwQSyhgQff2Vt0gs+umpvDzGpvFIxv05IcPh0BFwKo56O8kl0BrlAZOAiVc8z
	 gvDjUTVfkAnf3j/uip7auylqa4LVC0O8GAHlk598YOnQY8DJc4UPZw9fCD9mtAEBlyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KRvcNf1g;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFFF606A324
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Nov 2026 18:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DFFF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KRvcNf1g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793728904; x=1825264904;
  h=date:from:to:cc:subject:message-id;
  bh=lvDNvbDUirv+SqOneQamzuiGOcpcVlCzASRkerGNyOE=;
  b=KRvcNf1gRsy+hNWPqI9vsQRgEHKbQumMHLpLr0e4tnrUWD/amd0rGHfQ
   oBdIkh7D9RkSlOwsVbSJKioVIVd6D/dRkRZELOkmTr+cZO0Lf9crdojBQ
   wZUFqSCw34ONPMoAtlqwxLmErzhm+TqvHsL/tqC/NUN8vxeqyTVe2/en+
   Iogq5hQOov49cf1A59fUHufc7tkkK+rINLGb0QnAU4O94NWTM+y264Jcp
   UlgQxuvBq9bnKVSuHNH9X0xChcms7T5xXU1uigitdzhVY3ZzcrOgBI8Ua
   Ti77ypLREqV2joUgU0Tejq7MONr29mBGWErZbzscSTiyeiiEoB+3cZsui
   g==;
X-CSE-ConnectionGUID: 9bYcpCWQQ2mfNXA3+seURQ==
X-CSE-MsgGUID: QJJUojGqTlun8XHK7PPG3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2464706"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2464706"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 10:01:43 -0800
X-CSE-ConnectionGUID: oQvAz4NHScarr5BaI9hDTA==
X-CSE-MsgGUID: R1dMIkJ5QMWbijuFTMFY4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6502360"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 03 Nov 2026 10:01:42 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOIpI-000000008yp-0K3E;
	Tue, 03 Nov 2026 18:01:40 +0000
Date: Tue, 03 Nov 2026 19:00:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 14/36]
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: thermal-zones:
 gpu-thermal: 'gpu-trips' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202611031852.EZ5wwhS8-lkp@intel.com>
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
TO: Mikhail Kalashnikov <iuncuim@gmail.com>
CC: "Chen-Yu Tsai" <wens@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git sunxi-wip
head:   e8e10ee67982c55fd3900953641c680a2fbef1c6
commit: 836aa9a16eef4207c85cc11171fb74b28bdccaeb [14/36] Allwinner: A523: add support for A523 THS0/1 controllers
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261103/202611031852.EZ5wwhS8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611031852.EZ5wwhS8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611031852.EZ5wwhS8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1212.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1212.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1212.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1212.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
