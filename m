Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618008;
	b=iCnWpZUSw0NaiCW3QE7+DtrklisZHViNw2jVJveF1LQg85pD2t56YzfbDWKOlYnbp4R5
	 4HONwFIRg6Mt3QkQx5sHTS3xHcqKLXE5/2IpcsvuR1AZXDhVEBC2pMSIusBYEvXv54VqU
	 X5xhjQ6X8/U+uv20E/2B5LKuct9nTrcoiD1a11URLFuGhAhy1S71CbCKNLWr9AQ+iTDcI
	 V6GOeOZGvOO+LWiMFdR6xlLEXqI+GhNWiMMai5sdZp4u/SqJ/l6/o+cZ1wsDg+44RPbSU
	 DBbBUjVITyNeZOyHhL8PdEk/kClJ9leyO6Sxa2Bi0TsLzPwpqBH4RNKJ9BBP+Aeh4IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618008;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=0MRh/ni/Qocdkrg5uj8qH6UoiosB5AgSERSFQdJ6+IY=;
	b=0dCuIKvi+S9wtyzf2qTgBFuUqCjdp3Fo3fsZDgvB6xISDwymY4T5/ze2qnxFzY0nfW/D
	 1CPa7/WBMnWQfP2JbUHk/Il5LJcTERpp2JksBZKfTbFr2uLaEQ2PH1Gshf51NBsUfVOAX
	 G7vgfvfIdHs46THOSSUlCetL1ouJNjqfpqOLZrcLI0DasEz4DjMTwVRn0frIimFqXf1Sw
	 R6h+V7aOFd/DV2KsyoBVF9YUBHanAuNsZg+TY209MRlzV3tyH6czc/1XOPGVQaMiRHfS5
	 8QIRtm0UbfFs8dWVaCprFvMxg84wvthQAxLCItesKUZDLeJ80JeYu0cs3MpYXWgprwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CkGnSMsj;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B3E606A327
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Nov 2026 14:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0B3E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CkGnSMsj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795618008; x=1827154008;
  h=date:from:to:cc:subject:message-id;
  bh=mUdk3XP4Zijrn5eqzS93Nv5qqqCsOZ83Z3OL/FXJtV0=;
  b=CkGnSMsjzyL4ULduYDNaPBwOKVYjlxL2wlfq0VXOBQFz02KF0sbVMWvt
   vdaVBoel5v89lc3X9JNS0JrSWoYBz9EE3ZxEFFABCPa9GIklISubuMIbF
   YHrWBucqqttFgxl1WfknonmV8IB2rWwQ/M8A+ZEhLHtiolFa+AZUidTXc
   lx6IkhIg8k3TijxDQf8SRP2dU1hboRHmo/zCvnP6hlzzImcaWHx02aeWm
   XAR+35j4gjVg3HhQUr8UzbQUzbfI88nB06Lda2ei66RDIPLJwuRBgsFVz
   002CZ2FyJrqDBB3pRMUJdkA+cCnCwmM6JaHua26UuHCzJUkvhbsslzcAF
   g==;
X-CSE-ConnectionGUID: L7TR2DR/SoavlPG9NJBQfQ==
X-CSE-MsgGUID: DKyUpqppRJGSw/fFTKZCMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4577763"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4577763"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 06:27:11 -0800
X-CSE-ConnectionGUID: 6V2+8fAlTx2kmbAYZvVTTQ==
X-CSE-MsgGUID: rrTTiGX5TJKY/wQI0HQB3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12167240"
Received: from igk-lkp-server01.igk.intel.com (HELO 99c479ab0aeb) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 25 Nov 2026 06:24:51 -0800
Received: from kbuild by 99c479ab0aeb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWDvU-0000000008x-0NEQ;
	Wed, 25 Nov 2026 14:24:48 +0000
Date: Wed, 25 Nov 2026 15:23:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [atorgue-stm32:stm32-next 12/12]
 arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dtb: timer@40060000
 (st,stm32mp25-timers): 'timer@b' does not match any of the regexes:
 '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
Message-ID: <20261125151353.aayKci5z-lkp@intel.com>
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
TO: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>

Hi Fabrice,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
head:   491a11f03340483ad696f7c5d9e5d879a389f642
commit: 491a11f03340483ad696f7c5d9e5d879a389f642 [12/12] arm64: dts: stm32: Use hex timer addresses on stm32mp251
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261125/20261125151353.aayKci5z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev9+g7453fd0b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125151353.aayKci5z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261125151353.aayKci5z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dtb: timer@40060000 (st,stm32mp25-timers): 'timer@b' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dtb: timer@40070000 (st,stm32mp25-timers): 'timer@c' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dtb: timer@40080000 (st,stm32mp25-timers): 'timer@d' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dtb: timer@401d0000 (st,stm32mp25-timers): 'timer@a' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dtb: timer@40250000 (st,stm32mp25-timers): 'timer@e' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dtb: timer@40260000 (st,stm32mp25-timers): 'timer@f' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dtb: timer@40060000 (st,stm32mp25-timers): 'timer@b' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dtb: timer@40070000 (st,stm32mp25-timers): 'timer@c' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dtb: timer@40080000 (st,stm32mp25-timers): 'timer@d' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dtb: timer@401d0000 (st,stm32mp25-timers): 'timer@a' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dtb: timer@40250000 (st,stm32mp25-timers): 'timer@e' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dtb: timer@40260000 (st,stm32mp25-timers): 'timer@f' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dtb: timer@40060000 (st,stm32mp25-timers): 'timer@b' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dtb: timer@40070000 (st,stm32mp25-timers): 'timer@c' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dtb: timer@40080000 (st,stm32mp25-timers): 'timer@d' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dtb: timer@401d0000 (st,stm32mp25-timers): 'timer@a' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dtb: timer@40250000 (st,stm32mp25-timers): 'timer@e' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dtb: timer@40260000 (st,stm32mp25-timers): 'timer@f' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: timer@40060000 (st,stm32mp25-timers): 'timer@b' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: timer@40070000 (st,stm32mp25-timers): 'timer@c' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: timer@40080000 (st,stm32mp25-timers): 'timer@d' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: timer@401d0000 (st,stm32mp25-timers): 'timer@a' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: timer@40250000 (st,stm32mp25-timers): 'timer@e' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: timer@40260000 (st,stm32mp25-timers): 'timer@f' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: timer@40060000 (st,stm32mp25-timers): 'timer@b' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: timer@40070000 (st,stm32mp25-timers): 'timer@c' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: timer@40080000 (st,stm32mp25-timers): 'timer@d' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: timer@401d0000 (st,stm32mp25-timers): 'timer@a' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: timer@40250000 (st,stm32mp25-timers): 'timer@e' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: timer@40260000 (st,stm32mp25-timers): 'timer@f' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtb: timer@40060000 (st,stm32mp25-timers): 'timer@b' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtb: timer@40070000 (st,stm32mp25-timers): 'timer@c' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtb: timer@40080000 (st,stm32mp25-timers): 'timer@d' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtb: timer@401d0000 (st,stm32mp25-timers): 'timer@a' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtb: timer@40250000 (st,stm32mp25-timers): 'timer@e' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtb: timer@40260000 (st,stm32mp25-timers): 'timer@f' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtb: timer@40060000 (st,stm32mp25-timers): 'timer@b' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtb: timer@40070000 (st,stm32mp25-timers): 'timer@c' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtb: timer@40080000 (st,stm32mp25-timers): 'timer@d' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtb: timer@401d0000 (st,stm32mp25-timers): 'timer@a' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtb: timer@40250000 (st,stm32mp25-timers): 'timer@e' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtb: timer@40260000 (st,stm32mp25-timers): 'timer@f' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtb: timer@40060000 (st,stm32mp25-timers): 'timer@b' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtb: timer@40070000 (st,stm32mp25-timers): 'timer@c' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtb: timer@40080000 (st,stm32mp25-timers): 'timer@d' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtb: timer@401d0000 (st,stm32mp25-timers): 'timer@a' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtb: timer@40250000 (st,stm32mp25-timers): 'timer@e' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
>> arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtb: timer@40260000 (st,stm32mp25-timers): 'timer@f' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
