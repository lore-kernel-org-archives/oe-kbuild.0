Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794025063;
	b=FaV5Du9IWIhRlhcCpPmkcfG9DYanEsDAMTBJh1X1iE4KGvD17FQAuWU8CNXjhZfoEPSg
	 bSUZe09Xd1gi4BP2dZEgROztUKcpVqcfytDcOVRDLg3PyoDexVhrft+Qa9cYaNsn+mmfc
	 Yde51RAG0DbxNCW9aEJROvkQjGobAg54Q8+SXaKK3Polk4CkvPeLooC+tWwMiLsVUenh3
	 tjMrREWyEuwouULr4f26tkZHuAZ5dfM23SOCKFNh0fjHMfzuhkTTCy7SR5q3QQOrCNgko
	 OKPnBWwsPdaakf7kqQ0/ki2oUnSgTQicbL+hF2jZueLPPDMN+btKm+Ix/3Xl8QlsOMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794025063;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Yd4ivBjoKE3hfSOY3OcHS8zyCm8powm4QfCP2GbFEdo=;
	b=DXQ97Gx/9FBSh7t5v3Er5CP0rlH9m2UII0wBsfWVROqEv70BCZHoiOFY5Ee+Uh2EADvg
	 9xRwJednieChLdXCGHUSPm5ioA7ISEcLErT4+aSlu7fvWmkHzKzFvGVbCJamTrRVvwo8G
	 oRo8OEBocmGcPLqUs5HN49iVK3WweGVl7Bt7cAFAhJ6GoQX82zVkFB0Ft4opS9TZKvOaw
	 zsu0pvxU8VesxSkM5z5g2Gav20tLiZ8LBDhu2w9Ko3IvZgaCeadR3aQ5cqin3HjrG20AT
	 HD0P43RVeSlju1qcJhB/phsYkdggjQyGbrM/sFLkFzX5ucgC8mOOJQt/EsqvP0HsMdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WdJWIMQT;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D60606A326
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Nov 2026 04:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9D60606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WdJWIMQT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794025061; x=1825561061;
  h=date:from:to:cc:subject:message-id;
  bh=2k7YeF6I2Zk2AkxqUtNps0VyueP/kjpntDcuR2Y7/cU=;
  b=WdJWIMQTlFfQieyFkp49aG0L2YrauvfN/HnPT5sy7JlpTMwx62yfX6GB
   8tuo8LXw8kpXXHr+yf4nKVBbZ43K0Um+3eVlXlaAlcld5wUGTnTo5oIxe
   vkbUhtdMiwazYk8ajSX8G1FVuAm8k/4nWIgYxVpjuaVB71ILcXfMi/lRN
   3OLLXwDF7Ij+nNJ4c5H45XqKYgiR+RvWNF7J48z2rdJ9HwrxKIzaN7Us3
   Z2zXLH3knMyJJc9P2+vZ8ynarkyTt0IP/J2waHV2YIu1iQLIzXPYXd2K7
   LB+i92zqk+S0UBCfDl6Vcw7wuuMKECxU6WPSeGh7yW4OC5guca0euFelG
   A==;
X-CSE-ConnectionGUID: vm4BjVV/QrK9QYFkLCMW1w==
X-CSE-MsgGUID: Hre67iwITm6SufCV8Gy55g==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2939998"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2939998"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 20:17:40 -0800
X-CSE-ConnectionGUID: ssTofysBQHmuxYlZV3CdZQ==
X-CSE-MsgGUID: A9mFVv4uR+Web7w0y4eUDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7290342"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 06 Nov 2026 20:17:39 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPXs0-00000000AXX-2SRL;
	Sat, 07 Nov 2026 04:17:36 +0000
Date: Sat, 07 Nov 2026 05:17:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 14/36]
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: thermal-zones:
 gpu-thermal: 'gpu-trips' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202611070531.JNIsb00i-lkp@intel.com>
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
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261107/202611070531.JNIsb00i-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611070531.JNIsb00i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611070531.JNIsb00i-lkp@intel.com/

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
