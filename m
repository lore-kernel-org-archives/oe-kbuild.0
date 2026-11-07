Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794055164;
	b=kyOPfRXcC+4s4ZD7pPdzVRDauB2/21JI1A02rUhObyqoyvM0ds2W5eyuKxmTXuk5qOja
	 gObzj58Go1Ldf8/IKiB1HcK8taf6Q/BZEP94C2t3AaDK11kiK2C41beZ+3i7cylADwaYR
	 k0tprwFQoTETFtKAEkCSFU7EpCcfQ5sglzqxKUNumrDf6NkNvN0HraC3jD3l/9k1wpkb6
	 VtkZozfqQbOWs1XLIT1bA3/x+0IBNpNw4HdV33EnAtBnpjN3q+Ttet5qzMgzXoK14P0m9
	 db2UeuEYcPasSPuazOKw73DO5XE7QkzuTrIp6kVKn+mk7ZuF0SNiNA2TGGb1Ir3RUXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794055164;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=YfG1jxQZRHkbI/70j+gG7+2M1y2wYbgnBA2u/5BqsnY=;
	b=AF/57rDGSC0u3ZFz71L7V9N/+VYH4IpHZa3qwM/kHobRQ3qsA2gX007dKnbTW13bwdck
	 joS2wDYCVZJUN4ap7tV7uW/pju5AVRT1r8fWGPvOFhNEGKVJDtLHA52rktQ+/Db5HQnbh
	 xBmc1hqqoVvBhn2u1o9yAuepvQjmhHk+qvJzqYQr8IgPT0S6MDGeYOCxIdi4JT2bjsF5b
	 9RA2mXgeinTR34cOYzhJLngrIQFLwOCzQGC7wg1vA9w6zcyeYbGnpuzf1YNKfwnvMHKZE
	 fSAGuRijQyH8pp8xZd5Hw9UU3m0bUmba7Inc6kQ/zSvvyEDjd7CJjMCIl5d/TngD9KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kdplj6KM;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA17606A326
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Nov 2026 12:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DA17606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kdplj6KM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794055162; x=1825591162;
  h=date:from:to:cc:subject:message-id;
  bh=O0LOIdoZ5JOEszpFwLKGi4MoCS92fg0JolyCaKJp3Is=;
  b=kdplj6KMB1Fgo5rPYpR2kgaNKGuQDbM+MzOANAuU88Q8FREA9Uw7satD
   LO6dESbP1XafFMe3Eo9k8ieiFQLOgFpUWbr3v+pQsGnsJfoTgpbrE2GFf
   L4XZpJDACJtrmWG01ypQsEWezPKKKGYwQ1br6xJY6k1jyqQwaZ+Sppat8
   WyTe15obJDvBgYMlQ00aDczc10ArAChVqFIXDUtmc/B+ipu29EXdvn1Ht
   MOALAjWqLAvaZu3ZqnHqgAzekKrnNC/sCjAWgruvWuZqVTem4Osw54Pbg
   BUuDRkQbIA/e3gq3M5zZzbqAZI/4vSGpK5M0DeeXWBIEF1uxio6GO6jBi
   w==;
X-CSE-ConnectionGUID: J2s49Bm4TCGl9H7NmoTsxQ==
X-CSE-MsgGUID: gzzDxgXpRKO1FlZI0/HR+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2896252"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2896252"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 04:39:21 -0800
X-CSE-ConnectionGUID: hOWL/xOuTtyEMBPgtMzh+g==
X-CSE-MsgGUID: wDVO2OeGQkKLi0o1RAh9rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="9267738"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 07 Nov 2026 04:39:20 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPfhV-00000000Af1-3oNj;
	Sat, 07 Nov 2026 12:39:17 +0000
Date: Sat, 07 Nov 2026 13:39:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 23/36]
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: codec@7110000
 (allwinner,sun55i-a523-codec): #sound-dai-cells: 0 was expected
Message-ID: <202611071356.CjbXfwc4-lkp@intel.com>
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
commit: 6755898ee7c90fe59112bfdfaa83760abb765b0c [23/36] arm64: dts: allwinner: a523: Add audio codec
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261107/202611071356.CjbXfwc4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611071356.CjbXfwc4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611071356.CjbXfwc4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1227.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: codec@7110000 (allwinner,sun55i-a523-codec): #sound-dai-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml
   arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1227.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: codec@7110000 (allwinner,sun55i-a523-codec): #sound-dai-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml
   arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1227.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: codec@7110000 (allwinner,sun55i-a523-codec): #sound-dai-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml
   arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1227.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: codec@7110000 (allwinner,sun55i-a523-codec): #sound-dai-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml
   arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
