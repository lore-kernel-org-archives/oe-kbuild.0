Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793441864;
	b=uM9KTRHb4CgpOY92eRzqzHW2kTVVqV5iLfdRDA/Alk0PtodZZ7lzAl6pUwatacjAjs7W
	 M2P7fgX4J7OOx2SPdPtD81O7Ia+dzrXxwHW9WbfhJuOWx/GT2dZpV2kpldUWYcPrIg45I
	 R+T7lqmUDfnbUtzE//3tD+ulACx+Zq0lKOV7axdXfmfTGi/r93RL5HaWOL4k+VZNtmAhT
	 TgA/CrD+bAZwqz/PxCjYiF+GU3Zq5PNgXO2gfJtz5Kd+mFJL08T7W5RntQJqH5NLGGygF
	 XUfiGUKQPkzsnNKuR5IyrQ7nxss4gGVizsoQdFAWzLqUxJyOzNGC2jqfDUSiZSW+HMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793441864;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=S2BZmUvW1GPbwvnHVv3ROHMyuwe0mlRrBwXd6Rbkz4g=;
	b=yFhwphowd8nKIiCCduxdlgxb1pM/sfdx/8PNm7msHalTbyQOJnlPzbKdnHehTc+NRII8
	 vmey1ozPm23DUB8IBEqwHVgxVDMbeIfYMv2vai4zO59Mzdv99JUqBWh0GNR3jX+kD9D82
	 bcgSdruy/EtbSI5O8PZnK8NHJCvUSGs3KqBw97wlGqo1N0M4MKwXjbTKSN/6w4kPn9CTQ
	 RCT4Od5PC27m1l32Qg8xqQu4xAwdtqHZkcldAAK2m9CsM5ucMVryQOimx6XWppN2w1Yvy
	 T9sVJnjgaND0LcZT0f6LWNz28PX3COznvXvjYP8QjZOhGTG5q1Tnr+wYfGcB3wr4tqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gfe7k5DS;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49330606A31A
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Oct 2026 10:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49330606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gfe7k5DS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793441864; x=1824977864;
  h=date:from:to:cc:subject:message-id;
  bh=gw7bSTVZIs2LSv08t4BWAVi9UwWap3DgUwgmzB5RFVI=;
  b=Gfe7k5DS2TVnJ9OgimO4GKiC8JqiADb8NSBCQiXvXsmZEcXsghfrXqzT
   PvS9kWik1lISHVZXIBmTT/TkryYZJMfdqHiAS54snCdMMlOS6O83w8we2
   GnuOt0KHzecqCZ41f3FcpOHLsgN3GiZlSTRSDixof0NhuMJRi8gE9Bara
   lCd8AL7E0tPyxiPbjBc1eQpLf5hA3eNc0NvC54Zmm7P6WpEO5cV+DVkJ9
   FbJfirnl5cMrDvtLGrsfvz62W3qSNj1sWzHIcrP3xXTKGdXUOtOg7UVg6
   ZqE2DzD+TeX/Umt2H4WuXXg0UAGgP9uC7V9KVoZLS1eQrho3VHnrGDq2z
   Q==;
X-CSE-ConnectionGUID: MAi7DbmMTFWDZraUfK2yUw==
X-CSE-MsgGUID: qZaW4zuSTL+85KCzA8CiQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2091174"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2091174"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 03:17:43 -0700
X-CSE-ConnectionGUID: fbLEVHfISgubqNss8yvdng==
X-CSE-MsgGUID: E1w3o5ImQ0WAZkzyUZQ4Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="5611462"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 31 Oct 2026 03:17:42 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xN69a-000000005xH-3N9X;
	Sat, 31 Oct 2026 10:17:38 +0000
Date: Sat, 31 Oct 2026 11:17:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 14/36]
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: thermal-zones:
 gpu-thermal: 'gpu-trips' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202610311143.SQBD0nHu-lkp@intel.com>
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
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261031/202610311143.SQBD0nHu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610311143.SQBD0nHu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610311143.SQBD0nHu-lkp@intel.com/

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
