Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AE3228CB0
	for <oe-kbuild@lists.linux.dev>; Thu, 21 May 2026 22:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779404295; cv=none; b=CLzahss0RDmE9MISD46KEwC1CIBEdY2kMxRcBxZHiWJY5RajR6nIfuNujnZ0J0Zo7ocyxEOzgz8/QyZRBxd6luJJdiRoXWPQeDm0yk6kU98zMR1k/lFrZdFv92TGq34VU9WSRsW4+UEraSM6eUj3EOp1XJ1/CHSmExdMmzarv+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779404295; c=relaxed/simple;
	bh=lvJg2kvvFXkhGXtshI0GLbIqyToQF7is6diBFmvefYk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ANnoV1CUAi0+GIToUsiOtOM+70VzYsBbiA5N17WVG/YXdpBPMusIq0Yb8NLnddRD9Dvsf2U79yy9EKYVuDqYHf03M2wNYVS4JV9WKY3VFwZdUhPH5+e6grbopTdTyh/gvm24ASUGURZlNU7l/6Tw7K61s1vJjMpaFNpB6l7eTEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lk/eoUZL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lk/eoUZL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779404294; x=1810940294;
  h=date:from:to:cc:subject:message-id;
  bh=lvJg2kvvFXkhGXtshI0GLbIqyToQF7is6diBFmvefYk=;
  b=Lk/eoUZLfMpx+pZ945xcMPmH7mvvOkAJfGe1pQxhQ+n/9bWT3dimjqCd
   sE7lhPeKlYyi4jJLk/PDmxNXealon/CHJCmgAuLQ76USM0eaOX8RP2ala
   aWDxY+EaPfW6ojLX5YTevJfXhZmTLhdYP19/ZvR5XHXNEjOnF12TLa9Vo
   swE+xXOQEKQuAidvRty1tihJFcjmybyB/CQBn8WUOA22KpWdTltICOa+9
   roHD8WGwYJp6aCinWu6NQ5i1dhSbB3VXW1ERX+aap7bM0ToiHdObwciit
   ebGraIzHK5w/DmHw0XfRlYSZQu7ZwuxYRdgFgss/OKQQk9H92IWJ6ZCbb
   g==;
X-CSE-ConnectionGUID: bXEDl6gFR8m3PX+a1mwsFQ==
X-CSE-MsgGUID: G3QYqrBHTdSsMlOABUbHsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80366915"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="80366915"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 15:58:14 -0700
X-CSE-ConnectionGUID: KD13DaP3SAiY8XR+XTz8hA==
X-CSE-MsgGUID: i/5G6CuTT4+HwC46xxu4jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="236273968"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 21 May 2026 15:58:13 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQCLC-00000000B6b-2a0N;
	Thu, 21 May 2026 22:58:10 +0000
Date: Fri, 22 May 2026 00:57:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 18/114]
 arch/arm64/boot/dts/apple/t6001-j375c.dtb: pinctrl@39b028000
 (apple,t6000-pinctrl): 'usb_hub_oe-hog', 'usb_hub_rst-hog' do not match any
 of the regexes: '-pins$', '^pinctrl-[0-9]+$'
Message-ID: <202605220026.ILKC4EbX-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   2d563843e07af55de0249a409021af705f586961
commit: 2018d483c33b7863aaccac24dec45003091743cb [18/114] arm64: dts: apple: t6001-j375c: Add USB3 hub GPIO initialization
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260522/202605220026.ILKC4EbX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220026.ILKC4EbX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605220026.ILKC4EbX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-controller@288 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-controller@290 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-controller@298 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-controller@2a0 (apple,t6000-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: pinctrl@39b028000 (apple,t6000-pinctrl): 'usb_hub_oe-hog', 'usb_hub_rst-hog' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /sound: failed to match any schema with compatible: ['apple,j375-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /sound: failed to match any schema with compatible: ['apple,j375-macaudio', 'apple,macaudio']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
