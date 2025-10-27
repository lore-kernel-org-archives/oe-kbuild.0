Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B4C2D640D
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Oct 2025 17:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761587511; cv=none; b=G8DSgfDUq79dM+dreShH1gR7MyXyh9rbDnFsM0CyNl8I2fHomsAbbRqHf26zvBr/V0335Z7SHh/A9OGL0zNKup/GeGlxfFCfYbK37Kn+ir0Fihpp/oeOUJvmPMZd9f1TIMtFzS3ZDhAG+vBuG2deIifU7JMDJgLYrJYpW0Vrl1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761587511; c=relaxed/simple;
	bh=NG7hpc/KP1xP60TYX2EeMWEIv8lpFm5Y0mRzBMN26V4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BB1hb15/m1wvHxpyABLtWCZlZLDFawdCTePea5Ntr79HyrR7R/O7KHef6fBTKT/hxRIgjTfUx8+7X+78tbCP+F1HVwn2MJIcyyiAcRlH7Mrwu588tt7hOgBJD54kVkLlvfYjp2GqzlHzFphvk8BOg5lUefr+ZT9xjq8TAzrEbf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e3otapUq; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3otapUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761587509; x=1793123509;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NG7hpc/KP1xP60TYX2EeMWEIv8lpFm5Y0mRzBMN26V4=;
  b=e3otapUqM0vyGC5MXlFpek9EYsPOxeZJOqPL2jXK6TA13rtr9GnQ2W1Y
   F0DJIQrHeh60Ad5kTvCdbOhuPKBT4LGf8nCf4Yp+5psovKf9XVHZ0jFYS
   Kf5CIJShyV0qQ6UJgoMRpQwicHSE6JAPGbe9xYQ51NCp6Rn+oGfSxZ0Nq
   6/qs7UEDBozp+3qUbIcD9zDTu11xvufNwmDB4gkcCTmHrx1IQ72UUeP3b
   QgPNly0b+p7LRlU4yzgEgHcjjIMXtbbwxXCJnBY5+kZULcNpabOgPdr6J
   u1Jqx/m4MO26NKYI7GhdmRww9fahWbhG7T8qu9t8g9eVLszxuB1kzFzRc
   g==;
X-CSE-ConnectionGUID: LJwnOM+zR1yRcWOIdA8RTA==
X-CSE-MsgGUID: Oo0KWCqpRimOUK9f7eMV2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89147425"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="89147425"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 10:51:45 -0700
X-CSE-ConnectionGUID: VdwQCHaHTyOhFs4j8vkMnQ==
X-CSE-MsgGUID: hyS+xLLCQB6PjZECV4qGnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="189485074"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 27 Oct 2025 10:51:44 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vDRNe-000000000NN-21JI;
	Mon, 27 Oct 2025 17:51:42 +0000
Date: Mon, 27 Oct 2025 18:51:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/microblaze/boot/dts/system.dtb: gpio@81400000
 (xlnx,xps-gpio-1.00.a): 'clocks' is a required property
Message-ID: <202510271820.ZMaqEg8E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Michal Simek <monstr@monstr.eu>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Xu Yilun <yilun.xu@intel.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
commit: d03b53c9139352b744ed007bf562bd35517bacff dt-bindings: gpio: gpio-xi=
linx: Mark clocks as required property
date:   4 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 4 months ago
config: microblaze-randconfig-2052-20251024 (https://download.01.org/0day-c=
i/archive/20251027/202510271820.ZMaqEg8E-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20251027/202510271820.ZMaqEg8E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510271820.ZMaqEg8E-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/microblaze/boot/dts/system.dtb: /plb@0: failed to match any schema =
with compatible: ['xlnx,plb-v46-1.03.a', 'xlnx,plb-v46-1.00.a', 'simple-bus=
']
   arch/microblaze/boot/dts/system.dtb: flash@a0000000 (xlnx,xps-mch-emc-2.=
00.a): Unevaluated properties are not allowed ('xlnx,family', 'xlnx,include=
-datawidth-matching-0', 'xlnx,include-datawidth-matching-1', 'xlnx,include-=
datawidth-matching-2', 'xlnx,include-datawidth-matching-3', 'xlnx,include-n=
egedge-ioregs', 'xlnx,include-plb-ipif', 'xlnx,include-wrbuf', 'xlnx,max-me=
m-width', 'xlnx,mch-native-dwidth', 'xlnx,mch-plb-clk-period-ps', 'xlnx,mch=
-splb-awidth', 'xlnx,mch0-accessbuf-depth', 'xlnx,mch0-protocol', 'xlnx,mch=
0-rddatabuf-depth', 'xlnx,mch1-accessbuf-depth', 'xlnx,mch1-protocol', 'xln=
x,mch1-rddatabuf-depth', 'xlnx,mch2-accessbuf-depth', 'xlnx,mch2-protocol',=
 'xlnx,mch2-rddatabuf-depth', 'xlnx,mch3-accessbuf-depth', 'xlnx,mch3-proto=
col', 'xlnx,mch3-rddatabuf-depth', 'xlnx,mem0-width', 'xlnx,mem1-width', 'x=
lnx,mem2-width', 'xlnx,mem3-width', 'xlnx,num-banks-mem', 'xlnx,num-channel=
s', 'xlnx,priority-mode', 'xlnx,synch-mem-0', 'xlnx,synch-mem-1', 'xlnx,syn=
ch-mem-2', 'xlnx,synch-mem-3', 'xlnx,synch-pipedelay-0', 'xlnx,synch-pipede=
lay-1', 'xlnx,synch-pipedelay-2', 'xlnx,synch-pipedelay-3', 'xlnx,tavdv-ps-=
mem-0', 'xlnx,tavdv-ps-mem-1', 'xlnx,tavdv-ps-mem-2', 'xlnx,tavdv-ps-mem-3'=
, 'xlnx,tcedv-ps-mem-0', 'xlnx,tcedv-ps-mem-1', 'xlnx,tcedv-ps-mem-2', 'xln=
x,tcedv-ps-mem-3', 'xlnx,thzce-ps-mem-0', 'xlnx,thzce-ps-mem-1', 'xlnx,thzc=
e-ps-mem-2', 'xlnx,thzce-ps-mem-3', 'xlnx,thzoe-ps-mem-0', 'xlnx,thzoe-ps-m=
em-1', 'xlnx,thzoe-ps-mem-2', 'xlnx,thzoe-ps-mem-3', 'xlnx,tlzwe-ps-mem-0',=
 'xlnx,tlzwe-ps-mem-1', 'xlnx,tlzwe-ps-mem-2', 'xlnx,tlzwe-ps-mem-3', 'xlnx=
,twc-ps-mem-0', 'xlnx,twc-ps-mem-1', 'xlnx,twc-ps-mem-2', 'xlnx,twc-ps-mem-=
3', 'xlnx,twp-ps-mem-0', 'xlnx,twp-ps-mem-1', 'xlnx,twp-ps-mem-2', 'xlnx,tw=
p-ps-mem-3', 'xlnx,xcl0-linesize', 'xlnx,xcl0-writexfer', 'xlnx,xcl1-linesi=
ze', 'xlnx,xcl1-writexfer', 'xlnx,xcl2-linesize', 'xlnx,xcl2-writexfer', 'x=
lnx,xcl3-linesize', 'xlnx,xcl3-writexfer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/microblaze/boot/dts/system.dtb: /plb@0/xps-ll-temac@81c00000: faile=
d to match any schema with compatible: ['xlnx,compound']
   arch/microblaze/boot/dts/system.dtb: /plb@0/xps-ll-temac@81c00000/ethern=
et@81c00000: failed to match any schema with compatible: ['xlnx,xps-ll-tema=
c-1.01.b', 'xlnx,xps-ll-temac-1.00.a']
   arch/microblaze/boot/dts/system.dtb: /plb@0/xps-ll-temac@81c00000/ethern=
et@81c00000: failed to match any schema with compatible: ['xlnx,xps-ll-tema=
c-1.01.b', 'xlnx,xps-ll-temac-1.00.a']
   arch/microblaze/boot/dts/system.dtb: i2c@81600000 (xlnx,xps-iic-2.00.a):=
 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.=
yaml
   arch/microblaze/boot/dts/system.dtb: i2c@81600000 (xlnx,xps-iic-2.00.a):=
 Unevaluated properties are not allowed ('xlnx,clk-freq', 'xlnx,family', 'x=
lnx,gpo-width', 'xlnx,iic-freq', 'xlnx,scl-inertial-delay', 'xlnx,sda-inert=
ial-delay', 'xlnx,ten-bit-adr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.=
yaml
>> arch/microblaze/boot/dts/system.dtb: gpio@81400000 (xlnx,xps-gpio-1.00.a=
): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/xlnx,gpio-xilinx.ya=
ml
   arch/microblaze/boot/dts/system.dtb: gpio@81400000 (xlnx,xps-gpio-1.00.a=
): Unevaluated properties are not allowed ('xlnx,family', 'xlnx,is-bidir', =
'xlnx,is-bidir-2' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/xlnx,gpio-xilinx.ya=
ml
   arch/microblaze/boot/dts/system.dtb: gpio-leds (gpio-leds): 'green', 'he=
artbeat', 'red', 'yellow' do not match any of the regexes: '(^led-[0-9a-f]$=
|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
   arch/microblaze/boot/dts/system.dtb: serial@84000000 (xlnx,xps-uartlite-=
1.00.a): Unevaluated properties are not allowed ('clock-frequency', 'device=
_type', 'xlnx,baudrate', 'xlnx,family' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/xlnx,opb-uartlite=
=2Eyaml
   arch/microblaze/boot/dts/system.dtb: /plb@0/debug@84400000: failed to ma=
tch any schema with compatible: ['xlnx,mdm-1.00.d']
   arch/microblaze/boot/dts/system.dtb: /plb@0/mpmc@90000000: failed to mat=
ch any schema with compatible: ['xlnx,mpmc-4.02.a']
   arch/microblaze/boot/dts/system.dtb: /plb@0/mpmc@90000000/sdma@84600180:=
 failed to match any schema with compatible: ['xlnx,ll-dma-1.00.a']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
