Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215252;
	b=yBAxE0YY3SKDtmdxJ3RkwWdbqHWBCcK7Gq8cZy6rBbFtwGATrTjZQlExe5T0Ptxo8RZN
	 krG/1Lj9AdLaazx5dBDmuYvksRgw1n8R8xQlWeq/ZyMQPEEzMOMgHVgo4fJo3v9fABdL3
	 Bj+/ajDvNG8sS3wRwHqOa1wILfo4zpi6bVs2fKe4KNAixsfTzDP52iGNXdE0lF8Mev+f8
	 ECOXDYfrw6ngXSAhUC9hyWUIyUSy65P29SmifRL+FXCVOVYv5YO0L6vnKgc/UURo/WdWY
	 Pp4LThmuaefFhbrBms/seNY7VMFvLSZclrkF9yxPxvKMrrlT1uZr3RZyDu0QkluPipQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215252;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=H0/4EywfJub9RESKERItAFuCQf3JIIQoa9wkl2rTq64=;
	b=tr8kCP1krjUG7dgkdYRR/fdL33LIoRPljac6nCc/9XOkuPTQk1+X1uLEsyRr5YEDSz2G
	 bOOst4pV2F5Lne/ndD419xvUI8oZI/odafEK1TmiYoLELvD8g+8TpVrqfuAayAumeei/b
	 voRZPIBeEX0z4Jf2rJ1F2rvRwr9Y/C1Pcnic9rJC/mezcx2r8lLRoPfku7ZVwAn9/PmYi
	 O2pRjPv/jiPKFJXTLjy0tjsQa9qJTYoUCUTQku/YZCvVbFvRBjhItfssOVzblDp7QVa9W
	 wChByBUxmRJE54/nDk1otMMt+HKCqMTKIkHHm2QD3JnHHQYXVv2lxDnlBmTdyeza9fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DBaNn8hK;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6DF606A323
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Nov 2026 09:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B6DF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DBaNn8hK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794215251; x=1825751251;
  h=date:from:to:cc:subject:message-id;
  bh=ajS05si04aSXVQQAKfW9ak7S1roWXlcet+itPorULAY=;
  b=DBaNn8hKbcndHJPW1JX0FpQBW4cuR5gALNIp7rsywEPSsRHGLonQmKmW
   mT4GsMjDTd8cglV3xYOGYh2I1onX65qYJAz2z6GPdocJi8EGdS0I3OWOR
   2dYld3KrjopwEurZkyXWKg4+8TqcVk7kTwwtaK3iGo/9EJtJniyI7cYCW
   /dAHGpd3paohjL4utOrwC6OI7s8WArxhPKrCiE8IzE14uzKkNCjnKvanj
   k7kcqibp1r4XdadISaOgGzy1smhHMOEhN66X8K73VgVPBLS3Ac0CEBsEz
   IKJkOFQydTNoH5ByhGNvmU1joPOxuzBr5Who6CsL+w2/Pn8tbXZ/5GTO0
   w==;
X-CSE-ConnectionGUID: AjcSmPiAR+OLIvWbSxFLGg==
X-CSE-MsgGUID: WbHrNw9nTFOKLcYnmQlCTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2801374"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2801374"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 01:07:30 -0800
X-CSE-ConnectionGUID: Klrat6qrSNmf/Bn9EWuMPw==
X-CSE-MsgGUID: dzAXtm+JQrWuyo31kikVvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8158894"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 09 Nov 2026 01:07:29 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQLLX-000000000Hf-3Y2o;
	Mon, 09 Nov 2026 09:07:23 +0000
Date: Mon, 09 Nov 2026 10:07:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 14/36]
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: thermal-zones:
 gpu-thermal: 'gpu-trips' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202611091027.ZSUq4R1B-lkp@intel.com>
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
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261109/202611091027.ZSUq4R1B-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091027.ZSUq4R1B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611091027.ZSUq4R1B-lkp@intel.com/

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
