Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F831AF0D3
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Feb 2025 10:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739010584; cv=none; b=BANwJRZIldYz34vLrscQLJ+fK/m8Le1grF3fgJREMzo5D9eStt//zaJG8wnCYKow9yeyR/fWmm4XEUbuTykmaiXM/GLKgNQJS+jyz4AuhADaVXJQLNnUrHhgBKk4a0sh8eOJeUYWAaGuUJNhl8huQrzHMFqeW9oxTMfyeEnfYac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739010584; c=relaxed/simple;
	bh=RqtBNKXZevX01lpOoYLCNBmPIyZ/vABK/6pI9aJct7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=crCcfUZ5X7llTfHOGHIwm+C4eVzTRbIqE6/o0NlOqWpGzPOeUU0lcRbdJMsG3zDL8iFVOHEPPiCJcD3EFElvAMxcAL1T9+kejdeSAS/cz+Pi0BAyTvQ/9bh0LGWLXIvbGmp1ntSuHMNzc/wnoqZkEhKZUvcnlKhjdknalTL1HmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYcYPB5g; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYcYPB5g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739010583; x=1770546583;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RqtBNKXZevX01lpOoYLCNBmPIyZ/vABK/6pI9aJct7I=;
  b=PYcYPB5gKKPSUURo5LLWzVFUg6Re6geEHdPM24BHV8ktWnG/BOeubaHW
   kjJ8UTpCOpyGVhUGWS8NIncc5rdZi1uTblFDMZTv2k2PKYWmt38XBPwSV
   o6JO3MMRXM8M5JhCAHRUr3joP6xY249817XWujHlZqdwNHBThdKCjnHbb
   COWqZplGSGluvMoNPOvfCT/P/Nc83PETDWyuR5iNLH4r3vaQJbdHcP0lj
   NdXZVRHhR3ir9rG2Oh48HWgKvY7E3HqvDrKQkA3A/uncxZmoryxlGZjQ8
   s35n/uir5HDLtSTrgap1IFhb996BxlNqXhVCmTrKG2ZQusebDh6rVUsRm
   A==;
X-CSE-ConnectionGUID: D+C+BoK1S5yFFTZ5ivOGhQ==
X-CSE-MsgGUID: PMAD2G8WSLegqffb2RSadA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="38847596"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="38847596"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 02:29:40 -0800
X-CSE-ConnectionGUID: P/+dpxO8QOmbxb3F3WvNdQ==
X-CSE-MsgGUID: w2oorpJgSgOYMoDyiAdZCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116957732"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Feb 2025 02:29:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgi5g-000zr3-0H;
	Sat, 08 Feb 2025 10:29:36 +0000
Date: Sat, 8 Feb 2025 18:29:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mtd:mtd/next 15/18] arch/microblaze/boot/dts/system.dtb:
 flash@a0000000: Unevaluated properties are not allowed ('xlnx,family',
 'xlnx,include-datawidth-matching-0', 'xlnx,include-datawidth-matching-1',
 'xlnx,include-datawidth-matching-2', 'xlnx,include-datawidth-matching-3',...
Message-ID: <202502081823.VfcZZab9-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/n=
ext
head:   3f930a52d7151addefa6d5ba9f7f2c17dc52db1d
commit: 038e2ba01cf5ff94dc8f740328ec565d18bb764e [15/18] dt-bindings: mtd: =
physmap: Ensure all properties are defined
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: microblaze-randconfig-051-20250208 (https://download.01.org/0day-ci=
/archive/20250208/202502081823.VfcZZab9-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250208/202502081823.VfcZZab9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502081823.VfcZZab9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/microblaze/boot/dts/system.dtb: /: failed to match any schema with =
compatible: ['xlnx,microblaze']
   arch/microblaze/boot/dts/system.dtb: /cpus/cpu@0: failed to match any sc=
hema with compatible: ['xlnx,microblaze-7.10.d']
   arch/microblaze/boot/dts/system.dtb: plb@0: $nodename:0: 'plb@0' does no=
t match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/microblaze/boot/dts/system.dtb: plb@0: gpio-restart: 'ranges' is a =
required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/microblaze/boot/dts/system.dtb: plb@0: gpio-leds: 'ranges' is a req=
uired property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/microblaze/boot/dts/system.dtb: /plb@0: failed to match any schema =
with compatible: ['xlnx,plb-v46-1.03.a', 'xlnx,plb-v46-1.00.a', 'simple-bus=
']
   arch/microblaze/boot/dts/system.dtb: /plb@0: failed to match any schema =
with compatible: ['xlnx,plb-v46-1.03.a', 'xlnx,plb-v46-1.00.a', 'simple-bus=
']
>> arch/microblaze/boot/dts/system.dtb: flash@a0000000: Unevaluated propert=
ies are not allowed ('xlnx,family', 'xlnx,include-datawidth-matching-0', 'x=
lnx,include-datawidth-matching-1', 'xlnx,include-datawidth-matching-2', 'xl=
nx,include-datawidth-matching-3', 'xlnx,include-negedge-ioregs', 'xlnx,incl=
ude-plb-ipif', 'xlnx,include-wrbuf', 'xlnx,max-mem-width', 'xlnx,mch-native=
-dwidth', 'xlnx,mch-plb-clk-period-ps', 'xlnx,mch-splb-awidth', 'xlnx,mch0-=
accessbuf-depth', 'xlnx,mch0-protocol', 'xlnx,mch0-rddatabuf-depth', 'xlnx,=
mch1-accessbuf-depth', 'xlnx,mch1-protocol', 'xlnx,mch1-rddatabuf-depth', '=
xlnx,mch2-accessbuf-depth', 'xlnx,mch2-protocol', 'xlnx,mch2-rddatabuf-dept=
h', 'xlnx,mch3-accessbuf-depth', 'xlnx,mch3-protocol', 'xlnx,mch3-rddatabuf=
-depth', 'xlnx,mem0-width', 'xlnx,mem1-width', 'xlnx,mem2-width', 'xlnx,mem=
3-width', 'xlnx,num-banks-mem', 'xlnx,num-channels', 'xlnx,priority-mode', =
'xlnx,synch-mem-0', 'xlnx,synch-mem-1', 'xlnx,synch-mem-2', 'xlnx,synch-mem=
-3', 'xlnx,synch-pipedelay-0', 'xlnx,synch-pipedelay-1', 'xlnx,synch-pipede=
lay-2', 'xlnx,synch-pipedelay-3', 'xlnx,tavdv-ps-mem-0', 'xlnx,tavdv-ps-mem=
-1', 'xlnx,tavdv-ps-mem-2', 'xlnx,tavdv-ps-mem-3', 'xlnx,tcedv-ps-mem-0', '=
xlnx,tcedv-ps-mem-1', 'xlnx,tcedv-ps-mem-2', 'xlnx,tcedv-ps-mem-3', 'xlnx,t=
hzce-ps-mem-0', 'xlnx,thzce-ps-mem-1', 'xlnx,thzce-ps-mem-2', 'xlnx,thzce-p=
s-mem-3', 'xlnx,thzoe-ps-mem-0', 'xlnx,thzoe-ps-mem-1', 'xlnx,thzoe-ps-mem-=
2', 'xlnx,thzoe-ps-mem-3', 'xlnx,tlzwe-ps-mem-0', 'xlnx,tlzwe-ps-mem-1', 'x=
lnx,tlzwe-ps-mem-2', 'xlnx,tlzwe-ps-mem-3', 'xlnx,twc-ps-mem-0', 'xlnx,twc-=
ps-mem-1', 'xlnx,twc-ps-mem-2', 'xlnx,twc-ps-mem-3', 'xlnx,twp-ps-mem-0', '=
xlnx,twp-ps-mem-1', 'xlnx,twp-ps-mem-2', 'xlnx,twp-ps-mem-3', 'xlnx,xcl0-li=
nesize', 'xlnx,xcl0-writexfer', 'xlnx,xcl1-linesize', 'xlnx,xcl1-writexfer'=
, 'xlnx,xcl2-linesize', 'xlnx,xcl2-writexfer', 'xlnx,xcl3-linesize', 'xlnx,=
xcl3-writexfer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/microblaze/boot/dts/system.dtb: /plb@0/xps-ll-temac@81c00000: faile=
d to match any schema with compatible: ['xlnx,compound']
   arch/microblaze/boot/dts/system.dtb: /plb@0/xps-ll-temac@81c00000/ethern=
et@81c00000: failed to match any schema with compatible: ['xlnx,xps-ll-tema=
c-1.01.b', 'xlnx,xps-ll-temac-1.00.a']
   arch/microblaze/boot/dts/system.dtb: /plb@0/xps-ll-temac@81c00000/ethern=
et@81c00000: failed to match any schema with compatible: ['xlnx,xps-ll-tema=
c-1.01.b', 'xlnx,xps-ll-temac-1.00.a']
   arch/microblaze/boot/dts/system.dtb: i2c@81600000: 'clocks' is a require=
d property
   	from schema $id: http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.=
yaml#
   arch/microblaze/boot/dts/system.dtb: i2c@81600000: Unevaluated propertie=
s are not allowed ('xlnx,clk-freq', 'xlnx,family', 'xlnx,gpo-width', 'xlnx,=
iic-freq', 'xlnx,scl-inertial-delay', 'xlnx,sda-inertial-delay', 'xlnx,ten-=
bit-adr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.=
yaml#
   arch/microblaze/boot/dts/system.dtb: gpio@81400000: Unevaluated properti=
es are not allowed ('xlnx,family', 'xlnx,is-bidir', 'xlnx,is-bidir-2' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/xlnx,gpio-xilinx.ya=
ml#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
