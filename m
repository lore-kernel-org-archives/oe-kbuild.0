Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553120;
	b=SfMUF9xi7B0lazSYS2gwJnsugNJHYHZUm6e1qjQIlCPONAkoPY4yu9uKcsC8tNs3eW0B
	 2xUsNjRxyH3Kh9w2AyTtx76lgqSDT5rO+WZfqIEcD3g5bxJdpiGrDvtVzxBLKgwcLnMjn
	 CTaW/Pe5gaHIZF2Y4MxFeR/EXZj7oTnMM/yWyURUG6XPO1H2Bs1CVABfYSLhn0Cuwfyhj
	 eECAtE5TV1rMLsy1zOkJGFLgoJGoZ0t7lt4VZZicEJGvAVAFeCwy5mzmC1t5AZPtdvnsQ
	 /3YXltQ/cFa+CobFBMAilTyK/+KUWQrSITeLplXEQKnC/J5QB3J1ugd4K+gCuM7FazA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553120;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=GQnEcaQKyyewIaJYZFZKOb5OlKOazfK0UfbysfydXKY=;
	b=cxOMCgCNEFAHlxI3LhSVoAatqIDtSKeIQCL/2g7GpcWDRXpd3prJeXTnZEJJhFkKvFUh
	 FsoJ+5YcupHCfeykDjbqjULhnsWQ6WdODy02pexM1MzWM2IXO+O6gxFlbqPnV33Rz0/Hq
	 R86ltn8dpOFe8AQEJkvVpOK6wQm/bSTghu+EGW4bTmVlO76XtQCOnF867S5oBvKqKw1NW
	 XsRAxEsHXBGu2i/5IOwEsQbP4fji6CHg9W/cZG/ZhJEtmUpZqVkWtVRymzBPuA4N9MfRG
	 7WXunxr8wyQ4Yb3csjqmW83teNO2RgBzQfCT+cFVZNzNUND3Z5kqLpMdKZah8e7LOVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MKa9WMq8;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3784606A327
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Nov 2026 17:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3784606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MKa9WMq8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793553118; x=1825089118;
  h=date:from:to:cc:subject:message-id;
  bh=43cAAJBuc4mxSFUDAY97gPwodeMK6YJC8NgTMbLrf2Q=;
  b=MKa9WMq8U01DWpslQXKUKU0VfzvDzea2VuETmjRJOGGjBzc5MLa/zhOo
   f7S7pTjtAKaX+J9g89phkFM8EBP9yJL66cPtrt0UB1cFbPpjS32OstMUq
   Fu8K8SHQ2zshgdKq/ZiUZM58bBBdrQ7ZNNR8i32y/I0VQJeVh+QHmHIoN
   krJJkPH1ehZrkZSUhU5ZEhZNls3cbdtvI2KFvx4VJinpYEGJRmUFqbhmT
   S+pHUnczOF9fnyvSXFHoUUHWtFcGklwQDByyQ7G/oDy1X0lrIBf8Tp1uS
   Cy6lvK+B134Fz3Q70/DVLU382mcolK1RbOFE4grePcRqC59ZyzOYFjqDz
   g==;
X-CSE-ConnectionGUID: LtvsfAnUQNiPW22IuNgKOQ==
X-CSE-MsgGUID: FPJ3leoCQp+y+YZwR52Ggg==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2261421"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2261421"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 09:11:58 -0800
X-CSE-ConnectionGUID: qSef3OL7SeaEIbBTT+12lw==
X-CSE-MsgGUID: jQfplxrRQ/mkTyCF7jBmkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="6453351"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 01 Nov 2026 09:11:57 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNZ62-000000007z1-14I6;
	Sun, 01 Nov 2026 17:11:54 +0000
Date: Sun, 01 Nov 2026 18:11:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 25/36]
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: codec@7110000
 (allwinner,sun55i-a523-codec): Unevaluated properties are not allowed
 ('audio-routing', 'widgets' were unexpected)
Message-ID: <202611011820.NtP51DoA-lkp@intel.com>
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
commit: 23317bce122160c9918e6f1ad94b2301ff4af137 [25/36] arm64: dts: allwinner: t527: avaota-a1: Enable audio codec
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261101/202611011820.NtP51DoA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261101/202611011820.NtP51DoA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611011820.NtP51DoA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1227.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: codec@7110000 (allwinner,sun55i-a523-codec): #sound-dai-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: codec@7110000 (allwinner,sun55i-a523-codec): Unevaluated properties are not allowed ('audio-routing', 'widgets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml
   arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
