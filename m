Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309033;
	b=AXImRS+HE6QM2w6FVwHzHMH2WJUzdBNsc+R+GCCLG0uGZadzlhlL6Zc7voIbg4qkV89o
	 JJ6St5yvZEh6HwfZ1yLXxlITI7AXdp7RkDuUEpYAN8YJ2UYQj09pIJ6mybEN6nzzQau+5
	 xSVqaYxq8XaOUs3bSSC1u3/SnLHB+79aIv9y8mH1BDZd8YY/VvJ7Jrd8NgMlW4zuuIDEA
	 BevUMKxbrjP7icV03jTMv/Ib00m1MQpLGs9lrSidbzTgsBO81ODJBD+SregmPWUXuOsLF
	 uE1/23LPZiH1IMm/qBTqYMYE3sPzljkSauQs6Qk59mtjQ8N6emXZbqmdoIZxEuAByUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309033;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+BnCysU1ej+fAz2sUZye3256gRc3RpbPK2u7PKk4ljo=;
	b=nLLxuyfK2ecXzT+KK/VWP08OCcdjf1Jgb0U5UqnMScKjqAztgOdl/yBdLt31/P3HGc0m
	 b8JU85R2L2A6eS+Ddu+t/ikaSd9SsdDNvXh6IbwRTfwNhg1fepL3qCAIIsHGxmx12QhyN
	 RwVoLczqVHjZNrwqM/feC0nlBADQxd2ynfTQyBpfAQ4irwaGedkxypkGUuOl3Vl0m7nH6
	 UB3gqyVa5C7eT4RafYKVaT2jAFrx5dGKssZfCXN8eiTAMGgNicEffWRYrGlpWjzcnJZXS
	 e2wTqDMkfAvgEvrZ3bKGNAleRrZ1W98lPwTPdFfOeDlpf2efwvsebIcK3YQ0FbAIeMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ErVTKdtx;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02525606A32A
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Nov 2026 11:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02525606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ErVTKdtx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794309032; x=1825845032;
  h=date:from:to:cc:subject:message-id;
  bh=pNGexL/Uc/ry7QD77Z+MXqAWFBYTxGP4miwBPfdjraA=;
  b=ErVTKdtxzRSV4u0WzWUbIzdXqB29JuBKsfOHvIv1vdMImB6cTDn1Gib3
   1pYdfWyGVNu721CUkxqaylhSGfyvRngXSE1IVMXCaJ95tPhPlWXQB1XOZ
   uF3DlWHdGJR0DzYzPRH0nyPKFCmunTOlfa+33p4DiMcQvaPp0U6m/MaDG
   cI0Dq2Iz3bKcPravwyytGJwFc/kzxr/AvZH/QbOZ37MpYRyfgHCLfOqqH
   d2vPbyU/qRCIz550C0hvekPFV2R5nI1wuPerz2xlY+6P1JSDymS79YGWp
   ni9hyGYw48gzyS7+aXIAaghmMhkaAvuAoIS+kEy5rVuzfM65gnk6/0+X5
   g==;
X-CSE-ConnectionGUID: oJdcs9oPQJubcYZJKpd0Tg==
X-CSE-MsgGUID: GUQFleCOSo6CCQGfWp2ghQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2957154"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2957154"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 03:10:31 -0800
X-CSE-ConnectionGUID: KibCpA8nTTC8XAF/1XfAfQ==
X-CSE-MsgGUID: uPm5DG09RcSxrvSO35atmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8275012"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 10 Nov 2026 03:10:31 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQjkB-000000000GR-3yZQ;
	Tue, 10 Nov 2026 11:10:27 +0000
Date: Tue, 10 Nov 2026 12:09:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 25/36]
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: codec@7110000
 (allwinner,sun55i-a523-codec): Unevaluated properties are not allowed
 ('audio-routing', 'widgets' were unexpected)
Message-ID: <202611101235.xcgXBQjp-lkp@intel.com>
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
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261110/202611101235.xcgXBQjp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611101235.xcgXBQjp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611101235.xcgXBQjp-lkp@intel.com/

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
