Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793508235;
	b=0YvClQ0zQIf5ZzEwCWJwr6CEbPW/GHTm5VEpaIyWX9XppbIqig0upoE1BrZL8b5mhHHP
	 wSM3mkCCBeeqVJoKRYJXTn0C32LyV/Il5CzeSu/kTO65s0TdgR0/NTfPzB89aGQGngFkW
	 Dh/j4kNw0ZX4/Fmge6J+cxeeTqRxhTsPhe2smZDq0nAvdR+mEudls5o2PMOB2XuetCTch
	 0aFp6B0o97uiBSCRmBO8ygwKkcSztkP0fSCvhLQwIh4EKJ5RqoPAhOAxld8t60fEG0CrS
	 OyEHRJFHA0z25r4XYEIZYYb+kelXiu7/3gd6RfgJrylx/npiBAIG8Wbcwlvva/0uc5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793508235;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=GIiUbUTT/f/GiiOCbGmO5s3WKWrqSiNPoDxGjPDLC7Y=;
	b=A8nebPAf+U2y2o4Td/tIkhAr/JC0pwmJAstNk0Xzf48f/Dcysxix0kEdd0QGh0LpR1ky
	 AyKfFuy/Ji1Zeh2SFsW0pG6qDcS/765lhEEnOHthhJUaO/n/L1zFiI3N4kbxkCFYSk0aR
	 kfTRLrldDwXxxGDf1zYmPoqDxCNRDWSdOSskYtY1Z64LwB94KYSlkibOKDsn+DvMvjbSJ
	 Dy2RjdEtpCNjtLmtjSSZCHKFN6a3qpaY5FZ1sx0J1PKinnkzbyo4wxkhXWzPurbqwcZNZ
	 chPKoBkl0WlZXmaWAGYMe6X48TlGzUCOrnJ6ytfKGcjGMvFsyUwdY9+YfuOLIw7DZHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W0DY25Lf;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18C2606A325
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Nov 2026 04:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A18C2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W0DY25Lf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793508234; x=1825044234;
  h=date:from:to:cc:subject:message-id;
  bh=3t3HyXrYw+lYg2dvcj+UhtNRBg2Ja6uY99nB5jkXCdE=;
  b=W0DY25LfPCxw4VRaq0YQ8LHgyKwGOp6zAT5Ojk136fxDGj3DWQFk9mO5
   foMIncqUK29tOYZR+gZnGZmQJoibWC0mVsRFV+ByznIcegVJdEWwPtAy5
   gE2xwZhWTs/BzMkvqakTkBHYw9klT2vDqeTRmlTpj+dsRdC9wwVDhHPqR
   WINDLdBcE4jn0x3AeTvcqIgr14hQ2SLK9IXQUNpYsNAe7wBQSKeMXyAIO
   wVyuYsozs3iYaH/OQmQB6nOtmzT3GSOymW4z3zTGY3lK4tPIX7mGzzEpV
   exMlIFfg0NBSvJa+bdOiyWekkYpyTxSzLGags83Xev4Xsh1lvk6+7DSWz
   A==;
X-CSE-ConnectionGUID: MlyzY/ZMQJux/GWPqXWCPA==
X-CSE-MsgGUID: TG2RY6wrSNW1J7jqXdGS5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2239208"
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="2239208"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 21:43:53 -0700
X-CSE-ConnectionGUID: gfBfMuacTJWMCK5RRJ30xQ==
X-CSE-MsgGUID: 5lPFSA3IT3WfZ+5KBqKGFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="5896768"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 31 Oct 2026 21:43:52 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNNQ5-000000006L1-4ApZ;
	Sun, 01 Nov 2026 04:43:50 +0000
Date: Sun, 01 Nov 2026 05:43:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 24/36]
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: codec@7110000
 (allwinner,sun55i-a523-codec): Unevaluated properties are not allowed
 ('audio-routing', 'widgets' were unexpected)
Message-ID: <202611010511.vSHJDGRL-lkp@intel.com>
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
TO: "Chen-Yu Tsai" <wens@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git sunxi-wip
head:   e8e10ee67982c55fd3900953641c680a2fbef1c6
commit: c790c92683a4515ea55fcbdab4ba6e59551b6f21 [24/36] arm64: dts: allwinner: t527: orangepi-4a: Enable audio codec
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261101/202611010511.vSHJDGRL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261101/202611010511.vSHJDGRL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611010511.vSHJDGRL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1227.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: codec@7110000 (allwinner,sun55i-a523-codec): #sound-dai-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: codec@7110000 (allwinner,sun55i-a523-codec): Unevaluated properties are not allowed ('audio-routing', 'widgets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml
   arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
