Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9003723AB90
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Oct 2025 17:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761585887; cv=none; b=gDTU6f7KMV4opJ5v+55gTpBTmuOT5V9cAeLkO71uUp9T9txANX8nKzqL5LhE8HBPrbMrGRu4uv2ljqqxgmnpQ4Pwq1senZnwVxJAb/shPmCrtqqJKMcwouMAKBew3bTMWtN3jInXWQBP9HI7utRSwEu0NDeubreAdBwk7fGTghw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761585887; c=relaxed/simple;
	bh=IZQpK9RW6CzgS8C0lRe4gW0hsf7ybM1t77bDGi8BuNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kgRNwmI4kZU4uWVqJpw3YpjhLCubLyvvhmKiRP+mU20f2stc3s0WzoQOxMID8+MfHIzU6wTU2ukSG3ABe0XE1hZFx2UViPH6IO8yexcsKoGgDVOD3qB7P/9C//T/D+VghcG5L/uDlk+6LJWkg1rmXfWJihZyIg9hu12vAnGJ0h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g6BLh5it; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g6BLh5it"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761585886; x=1793121886;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IZQpK9RW6CzgS8C0lRe4gW0hsf7ybM1t77bDGi8BuNQ=;
  b=g6BLh5itXgu9gZU7+4xbsrGCZPMZnk7Xh30ZhfT+ju/XT3zdjLANKf1d
   VSHv9sMrOVC0l80iXtI87yd7pMIRfejgWHM4/8T6i+0/WNrL8IbM2s+vv
   EjRdDTUq5I39trEOOODoT2I6/d6feYB7Cr/V+MwK/9aOD3LGRiMGKT+cc
   MegLN7sHxDje/aaZBWGSkD05ceNfSorJyYiuhUbqKP6u02YTnKvkyMSKl
   /Mb2/8Ipd3itfk5yN1m8aZ8VguKUvL1znwqNi1ahIFQ3eKgIiuyMtBo7k
   xdnaAzRhVYvVYL1LwY33IloqfQvw8EQM3tVqOeKAlFCHshvcBcxHVOZ0t
   w==;
X-CSE-ConnectionGUID: CAnZ4Sx5QnGMkiZaQSN89Q==
X-CSE-MsgGUID: HFP/3J0sSnOQ3obK5Snjaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63563606"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="63563606"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 10:24:45 -0700
X-CSE-ConnectionGUID: k0QoT2ANRay3uWHRHjYEUQ==
X-CSE-MsgGUID: A0Nu+ePuSYGkXy/9VJjO3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="184283373"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 27 Oct 2025 10:24:44 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vDQxW-000000000Mn-0AaH;
	Mon, 27 Oct 2025 17:24:42 +0000
Date: Mon, 27 Oct 2025 18:23:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/microblaze/boot/dts/system.dtb: flash@a0000000
 (xlnx,xps-mch-emc-2.00.a): Unevaluated properties are not allowed
 ('xlnx,family', 'xlnx,include-datawidth-matching-0',
 'xlnx,include-datawidth-matching-1', 'xlnx,include-datawidth-matching-2',
 'xlnx,incl...
Message-ID: <202510271829.uZ7uIhas-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
commit: 9ea13d9e40cfb6675a299147bb89d6ca9e7aad9a dt-bindings: mtd: physmap:=
 Ensure all properties are defined
date:   8 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 8 months ago
config: microblaze-randconfig-2052-20251024 (https://download.01.org/0day-c=
i/archive/20251027/202510271829.uZ7uIhas-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20251027/202510271829.uZ7uIhas-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510271829.uZ7uIhas-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/microblaze/boot/dts/system.dtb: /: failed to match any schema with =
compatible: ['xlnx,microblaze']
   arch/microblaze/boot/dts/system.dtb: /cpus/cpu@0: failed to match any sc=
hema with compatible: ['xlnx,microblaze-7.10.d']
   arch/microblaze/boot/dts/system.dtb: plb@0 (xlnx,plb-v46-1.03.a): gpio-l=
eds: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/microblaze/boot/dts/system.dtb: plb@0 (xlnx,plb-v46-1.03.a): gpio-r=
estart: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/microblaze/boot/dts/system.dtb: plb@0 (xlnx,plb-v46-1.03.a): $noden=
ame:0: 'plb@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi=
|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/microblaze/boot/dts/system.dtb: /plb@0: failed to match any schema =
with compatible: ['xlnx,plb-v46-1.03.a', 'xlnx,plb-v46-1.00.a', 'simple-bus=
']
   arch/microblaze/boot/dts/system.dtb: /plb@0: failed to match any schema =
with compatible: ['xlnx,plb-v46-1.03.a', 'xlnx,plb-v46-1.00.a', 'simple-bus=
']
>> arch/microblaze/boot/dts/system.dtb: flash@a0000000 (xlnx,xps-mch-emc-2.=
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
   arch/microblaze/boot/dts/system.dtb: gpio@81400000 (xlnx,xps-gpio-1.00.a=
): Unevaluated properties are not allowed ('xlnx,family', 'xlnx,is-bidir', =
'xlnx,is-bidir-2' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/xlnx,gpio-xilinx.ya=
ml

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
