Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794129456;
	b=HC/UfgxH9HG+K++sf10F+fzbw5Q7hrsf7Kx26EJkP5qjjKVaK9RPio1fqXN6/0zn/6Nv
	 XIeZlP1Ljvy4WPzY3ov3WMFI2LIQ2eJ0anCaYxJg0dsKWBQ14MaO30QjnWAodZ8aIq+vw
	 Z5SKLJFh0XGMdhSx5lwsbe+LyIlsChQEO2KCWp27k0s1SEGJNgl8RJ+9VyvvjDPsY9aHg
	 XA9T82MJatYYqBCDJLXybAtsoJJRYz2dEjePF8OfhOs5iBKSOGKnDRHZ65I6u2SABsp2v
	 Dfq88pWyf0HSft2cBrLjbfjbLAnpmiak+VpVowwoEIoVtslPHpQMlhEewbQ/Sw+xKlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794129456;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kvRg+hvNpA2sk6ukhDRy0KYEWf1x+4JPvpirqT2ucGY=;
	b=lSDPjXOwbTZgw5yeqxSW5WcWnGSIqkSYZmAQMN0z1TcG/tRC6Ztd+wCqSEJjvoYlfWJW
	 FGFIM+f9avynY9/G6+yRrubAMzvFAYFe/aTTK9uiAF7rkg1u0m2J1VoBZq6QaddmcHfBx
	 yjVLWZJgJxcZ3WBLfI/lrCSIha9D3Qafowe6GI0O3AypplgWqPHcgfdf7BxUaZMvuZO8R
	 v2j3ukxJJbejSdN31cYUyV6VaonQPIoGTkb+gFw0pFHQ2qiRAwDt7HXLyQ/RM5zIg6kmN
	 CmSnkuhPwZbU7P8GFRWO+YrthklhOOdDsxWU1h7u51WP64W+pjJOAxI7OR4DlrziRPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VSSrEGHg;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1988606A320
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Nov 2026 09:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1988606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VSSrEGHg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794129455; x=1825665455;
  h=date:from:to:cc:subject:message-id;
  bh=r+ddBDhb1tc+BTd+UaB93IjEtbaWBtqEX3URpKyktgc=;
  b=VSSrEGHgiy2StuG/SwmpsxUydNhhdyLX9XPIZXCDkNUNOH3ssS/iv/o2
   LpDws9twbRDmyWYq8foLYmkXRONcRhYiIPoi3Niau8rN7d6wBaglBR4Mr
   KIg7J0yz1AZZhRRXqSoCLhX3mA4sqiW0REaUUPNZR8W+jQ6wA28WnqWmQ
   QHAfaBye61EOUVbZGDAyyGzQA9+VnUYBWiFtmRAtlrCYeAOrLNRT+JQYi
   YLaPH7QSEtX4mP0vEnxglGK8yWv9ipSxgTQI7gIglytqHQeJuKkl3kABT
   9dn9nSTECkcfSnALGzbOEs97PFnGS5NDLnnKPbnGHj4UXUHCcPk+4hZ4o
   A==;
X-CSE-ConnectionGUID: P1Car909RJ25lAwphuyLng==
X-CSE-MsgGUID: OXc42pUJQnaahK6W1971ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2768630"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2768630"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 01:17:35 -0800
X-CSE-ConnectionGUID: ux/UcCPoT76oqHTkOc6mOw==
X-CSE-MsgGUID: rofo0HiXSU6UQxW48jitvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7508132"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 08 Nov 2026 01:17:34 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPz1o-00000000BNV-0TGh;
	Sun, 08 Nov 2026 09:17:32 +0000
Date: Sun, 08 Nov 2026 10:16:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 14/36]
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: thermal-zones:
 gpu-thermal: 'gpu-trips' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202611081054.xqHCqNNf-lkp@intel.com>
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
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261108/202611081054.xqHCqNNf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611081054.xqHCqNNf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611081054.xqHCqNNf-lkp@intel.com/

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
