Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794373269;
	b=BFCjfZkmqeYjC1uqGeSKYnZZveN2xQcVVHyJb3dlNaNTlgcFsGsIqtLm2NL49gpCvUJI
	 /bnqUWq8R4UwGGJuv54ook4Y2lemiFB1mFrg037Os6+I9JhcJEfK2DESsAhmm6wUifzrj
	 EBY1zqdnujdOT60U0fsW0y9frkaj0GGD939GvhS27zAak2JNnnPDghD7rJEi9cfMHSgn1
	 /ypFPWxtt5XxBnJi6F9dHfvLNQyHHkEN18zxsi16j2LP5jdUq7HVbF3qumgkmCra95X+W
	 A1cTefibysvCZV+tG8YKqWoSv7j4wffltGZ+7lJwljHi+EwfOcyE/ivo3UBeBQTePWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794373269;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=MP6JjJJz8viB3Ds/0uvrZLc1qxVYh63Cx1xwV/r8adU=;
	b=qCrbYubmNVubPE1EvKrFsFKal61ClYjgK0tyHph85Txn/KvnhUqyPOlbNl6idAh1E/TJ
	 7RVYuGvwWt+PoQn9OQXvM3nnuxnElnGSOmLgljlrqYPcPGqAiNcWd8Jb+2y/KO9hGe1AF
	 fggcjiu1ACOT9EdaVZl+dNkOgRfssz+NJr1itujpsxkx2ZeNBelZEKbSzXgGTkYpZ7NZG
	 kuNhTYg2Fl0jhuQit4KPzmOCSrEUWVm1+aw3UYn/KbQCGdIKRbHrqmuf/SSHsfrssQ46a
	 u5Wqk9UVwdeYx34Kwgug/U83jdemnJVY0tgPtDgMX4YE9irr/D9ooY4LbJJxmIV+z/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aKylR9qJ;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8D9606A31C
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Nov 2026 05:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A8D9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aKylR9qJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794373269; x=1825909269;
  h=date:from:to:cc:subject:message-id;
  bh=FnaT0dlmwaJAMlFD2IKYVNGjsAurhyapEdsKZbhbdsU=;
  b=aKylR9qJM59Xg9jBUEX/ZMWlG8DE3T9vjTuICAkP2tniz08BZv74IlZX
   WDS1BdQwO3cwc8o50Hbnj6lVYlDPszrzykMuspEFuGwe7E9bvkOE5xQSi
   V67KkRtVGrwfF87aFN4dtZZ/0oOIM9tW6E7e1DMySjGsbOu2JtxsRXl/z
   DSqnFXXTfEh0yJ7zUgLViApZlYm0PBnpAGzFy3x9HD8ulzTXPONH49+Eh
   DFTXb2Pi9Ej0EtzSz78ri9++My2sUXBeB6qj4ryj+a119+i/g0vbKdstK
   Es/IA75FrWfHpoxwsi6ObLPED5O89c4ZLNljmRA9nZ00eqPip16ic+WJw
   g==;
X-CSE-ConnectionGUID: Io7lkm6cTyyZti9rEGB3yQ==
X-CSE-MsgGUID: pMNZF8CHSeG+HQ5MnJCDDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3023367"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3023367"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 21:01:08 -0800
X-CSE-ConnectionGUID: LH8J4AGBRtCzrWkwGoRW/g==
X-CSE-MsgGUID: 2NeIDEi0Rbut5yTshOtzMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8667892"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 10 Nov 2026 21:01:06 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xR0SG-000000000WD-1FGK;
	Wed, 11 Nov 2026 05:01:04 +0000
Date: Wed, 11 Nov 2026 06:00:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 34/36]
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: video-codec@1c0e000
 (allwinner,sun50i-h616-video-engine): 'power-domains' does not match any of
 the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202611110554.inl0bw0R-lkp@intel.com>
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
commit: 1f2645ff1b73b21378959b4ac68aa83605ec7005 [34/36] WIP: 8250_dw allwinner DMA support
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261111/202611110554.inl0bw0R-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611110554.inl0bw0R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611110554.inl0bw0R-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1281.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: video-codec@1c0e000 (allwinner,sun50i-h616-video-engine): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/allwinner,sun4i-a10-video-engine.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: video-codec@1c0e000 (allwinner,sun50i-h616-video-engine): 'allwinner,sram' is a required property
   	from schema $id: http://devicetree.org/schemas/media/allwinner,sun4i-a10-video-engine.yaml
   arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: codec@7110000 (allwinner,sun55i-a523-codec): #sound-dai-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml
   arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1281.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: video-codec@1c0e000 (allwinner,sun50i-h616-video-engine): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/allwinner,sun4i-a10-video-engine.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: video-codec@1c0e000 (allwinner,sun50i-h616-video-engine): 'allwinner,sram' is a required property
   	from schema $id: http://devicetree.org/schemas/media/allwinner,sun4i-a10-video-engine.yaml
   arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: codec@7110000 (allwinner,sun55i-a523-codec): #sound-dai-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml
   arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1281.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: video-codec@1c0e000 (allwinner,sun50i-h616-video-engine): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/allwinner,sun4i-a10-video-engine.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: video-codec@1c0e000 (allwinner,sun50i-h616-video-engine): 'allwinner,sram' is a required property
   	from schema $id: http://devicetree.org/schemas/media/allwinner,sun4i-a10-video-engine.yaml
   arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: codec@7110000 (allwinner,sun55i-a523-codec): #sound-dai-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml
   arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: codec@7110000 (allwinner,sun55i-a523-codec): Unevaluated properties are not allowed ('audio-routing', 'widgets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml
   arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1281.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: video-codec@1c0e000 (allwinner,sun50i-h616-video-engine): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/allwinner,sun4i-a10-video-engine.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: video-codec@1c0e000 (allwinner,sun50i-h616-video-engine): 'allwinner,sram' is a required property
   	from schema $id: http://devicetree.org/schemas/media/allwinner,sun4i-a10-video-engine.yaml
   arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: codec@7110000 (allwinner,sun55i-a523-codec): #sound-dai-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml
   arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: codec@7110000 (allwinner,sun55i-a523-codec): Unevaluated properties are not allowed ('audio-routing', 'widgets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml
   arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
