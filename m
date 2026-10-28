Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793155642;
	b=oaFNvprV+wwkdk0b9Mpae60uU0uftxtEYV9gJ6+crZNsIIGwh5FwF2TTIX9HghoOsoBt
	 +Bevo6oYlehP3VnhM6lLPUtRDI+a1hw7iuzbbWStFyCuEKAcjogNgkRK0Zzf0kf2BP/TJ
	 IBJg/tYSoXO6u6oKVgwiWKoOrTP57bQpr+kVka60tQ6qtpeEVfZVScCHVdfGnSfUuYmbf
	 vVSh/v5ZmZ+Ieou2RT+wSq8r8V/xlZARLWa38M1PiyotrdE+Z5dFrsFig7SNcE3XNG1zE
	 xEjOJbOF4WeZnf/I+8qgG3YJn3iYVgVXpGpDNorbAvL5OCYl5HMj+RmOYurb4RV4WQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793155642;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=J9mD2572uozl8LfXM83XdWMApKtgAl+7gPjIjxd1Pac=;
	b=u5ug2bOl9tg337TBhYTlOGd9xJEuhe2SdBwkdSuaNa2ankDd24TqOsuBgj/uTv6vcnNj
	 k7EgRmLUWPtIDM72fObuQGECb1/JsZ78A2kwr3CcRr3ArxkkmQ5ve31rSEfwXOqXsiU8S
	 vfe6mBhjURbpY2zHCG6R1w2HFpkIdRG9fExxHJpdXfiwzQORfvtOghZh/c0F+W6+yZyXc
	 rMGFWzn9QvTF8D2K+muHtZzThkLVzs5ZohHUc3eCcsHN8bzmhOWJpYRft0+0QEp0/ds/8
	 Ot5qMjoRpguQrjKffG+Qlgv4dZwhorK5oTdxvzMCYm21oL4sYKjTj4RjKJvth4SA09A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vl4dPykY;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174D8606A31E
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Oct 2026 02:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 174D8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vl4dPykY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793155641; x=1824691641;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Qwoyti03U3hmqvtls0ddHJYt2veWCVElAsXaNJ00AjI=;
  b=Vl4dPykY7O07205Sg6VR+zBLvDMX84MYEqcqW2+VkxRJnbLOrUXJl/qu
   E5F+F/d8ul72th2h+hipYKcxEHOx2uPD+DXYCj4u2CQozsuDp2QWT01oM
   b2SWrJqEe+QkScgv4yBIDL0PqY03RYKnafH+Qb8GhBvgoefELUYI1ms42
   B3l3by66NktZnIJ02TpKsrlj4wCrMiW/lDSWMV2PzRIwMGub5WCGWndgo
   7ft5TxVR7MuZoem5JTO/3RfzK2dJupoA2ZsVwG+udciLUYGliLQi/3mf1
   2M6n/4ynJlEzjtiGvDcPkdjZ0xPUVZ2AsFPfWV1+3gXtOyCkaFd2wo9H4
   w==;
X-CSE-ConnectionGUID: YeG0x3uDSbqzyqj1HSOcXQ==
X-CSE-MsgGUID: YsXLJgvMRl6OsE/0Vlae8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1879673"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1879673"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 19:47:15 -0700
X-CSE-ConnectionGUID: eJUHmHyiQHuQM3ePZxklHA==
X-CSE-MsgGUID: gVIGUpPaQcy+gLSqcgzklg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4662723"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 27 Oct 2026 19:47:14 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLth1-000000004jf-1hQj;
	Wed, 28 Oct 2026 02:47:11 +0000
Date: Wed, 28 Oct 2026 03:46:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [spacemit-com:k3/hmp-on-7.3 5/5]
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: cpu@8 (spacemit,a100):
 riscv,isa-extensions:73: 'sdtrig' is not one of ['i', 'm', 'a', 'f', 'd',
 'q', 'c', 'b', 'v', 'h', 'sha', 'shcounterenw', 'shgatpa', 'shtvala',
 'shvsatpa', 'shvstvala', 'shvstvecd', 's...
Message-ID: <202610280327.LguaYuTA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Chunyan Zhang <chunyan.zhang@spacemit.com>

tree:   https://github.com/spacemit-com/linux k3/hmp-on-7.3
head:   558f896383b50843c09a8d229a0cb40fa9d4dc41
commit: 558f896383b50843c09a8d229a0cb40fa9d4dc41 [5/5] riscv: dts: spacemit=
: Add A100 cpu nodes for K3
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20261028=
/202610280327.LguaYuTA-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261028/202610280327.LguaYuTA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610280327.LguaYuTA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: cpu@8 (spacemit,a100): r=
iscv,isa-extensions:73: 'sdtrig' is not one of ['i', 'm', 'a', 'f', 'd', 'q=
', 'c', 'b', 'v', 'h', 'sha', 'shcounterenw', 'shgatpa', 'shtvala', 'shvsat=
pa', 'shvstvala', 'shvstvecd', 'smaia', 'smcdeleg', 'smcntrpmf', 'smcsrind'=
, 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'ssccfg', 'ssccptr', 'sscofpmf', =
'sscounterenw', 'sscsrind', 'ssnpm', 'ssqosid', 'ssstateen', 'sstc', 'sstva=
la', 'sstvecd', 'ssu64xl', 'supm', 'svade', 'svadu', 'svinval', 'svnapot', =
'svpbmt', 'svrsw60t59b', 'svvptc', 'za64rs', 'zaamo', 'zabha', 'zacas', 'za=
lasr', 'zalrsc', 'zawrs', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs=
', 'zca', 'zcb', 'zcd', 'zcf', 'zclsd', 'zcmop', 'zfa', 'zfbfmin', 'zfh', '=
zfhmin', 'zicbom', 'zicbop', 'zicboz', 'ziccamoa', 'ziccif', 'zicclsm', 'zi=
ccrse', 'zicfilp', 'zicfiss', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zih=
intntl', 'zihintpause', 'zihpm', 'zilsd', 'zimop', 'zk', 'zkn', 'zknd', 'zk=
ne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', 'zkt', 'ztso', 'zvbb', 'zvbc', =
'zve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', '=
zvfh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvkn=
ha', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksg', 'zvksh', 'zvkt', 'xandes=
pmu', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfv=
qmaccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvecto=
r']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: cpu@8 (spacemit,a100): c=
ompatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,a100', 'riscv'] is too short
   	['spacemit,a100', 'riscv'] is too long
   	'spacemit,a100' is not one of ['amd,mbv32', 'amd,mbv64', 'andestech,ax4=
5mp', 'canaan,k210', 'nuclei,ux900', 'sifive,bullet0', 'sifive,e5', 'sifive=
,e7', 'sifive,e71', 'sifive,p550', 'sifive,rocket0', 'sifive,s7', 'sifive,u=
5', 'sifive,u54', 'sifive,u7', 'sifive,u74', 'sifive,u74-mc', 'spacemit,x10=
0', 'spacemit,x60', 'thead,c906', 'thead,c908', 'thead,c910', 'thead,c920']
   	'spacemit,a100' is not one of ['sifive,e51', 'sifive,u54-mc', 'sifive,x=
280']
   	'riscv' was expected
   	'sifive,rocket0' was expected
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: cpu@8 (spacemit,a100): U=
nevaluated properties are not allowed ('cpu-ai', 'riscv,isa-base', 'riscv,i=
sa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /cpus/cpu@8: failed to m=
atch any schema with compatible: ['spacemit,a100', 'riscv']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: cpu@8 (spacemit,a100): c=
pu-ai: b'true\x00' is not of type 'object', 'integer', 'array', 'boolean', =
'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: cpu@9 (spacemit,a100): r=
iscv,isa-extensions:73: 'sdtrig' is not one of ['i', 'm', 'a', 'f', 'd', 'q=
', 'c', 'b', 'v', 'h', 'sha', 'shcounterenw', 'shgatpa', 'shtvala', 'shvsat=
pa', 'shvstvala', 'shvstvecd', 'smaia', 'smcdeleg', 'smcntrpmf', 'smcsrind'=
, 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'ssccfg', 'ssccptr', 'sscofpmf', =
'sscounterenw', 'sscsrind', 'ssnpm', 'ssqosid', 'ssstateen', 'sstc', 'sstva=
la', 'sstvecd', 'ssu64xl', 'supm', 'svade', 'svadu', 'svinval', 'svnapot', =
'svpbmt', 'svrsw60t59b', 'svvptc', 'za64rs', 'zaamo', 'zabha', 'zacas', 'za=
lasr', 'zalrsc', 'zawrs', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs=
', 'zca', 'zcb', 'zcd', 'zcf', 'zclsd', 'zcmop', 'zfa', 'zfbfmin', 'zfh', '=
zfhmin', 'zicbom', 'zicbop', 'zicboz', 'ziccamoa', 'ziccif', 'zicclsm', 'zi=
ccrse', 'zicfilp', 'zicfiss', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zih=
intntl', 'zihintpause', 'zihpm', 'zilsd', 'zimop', 'zk', 'zkn', 'zknd', 'zk=
ne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', 'zkt', 'ztso', 'zvbb', 'zvbc', =
'zve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', '=
zvfh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvkn=
ha', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksg', 'zvksh', 'zvkt', 'xandes=
pmu', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfv=
qmaccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvecto=
r']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: cpu@9 (spacemit,a100): c=
ompatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,a100', 'riscv'] is too short
   	['spacemit,a100', 'riscv'] is too long
   	'spacemit,a100' is not one of ['amd,mbv32', 'amd,mbv64', 'andestech,ax4=
5mp', 'canaan,k210', 'nuclei,ux900', 'sifive,bullet0', 'sifive,e5', 'sifive=
,e7', 'sifive,e71', 'sifive,p550', 'sifive,rocket0', 'sifive,s7', 'sifive,u=
5', 'sifive,u54', 'sifive,u7', 'sifive,u74', 'sifive,u74-mc', 'spacemit,x10=
0', 'spacemit,x60', 'thead,c906', 'thead,c908', 'thead,c910', 'thead,c920']
   	'spacemit,a100' is not one of ['sifive,e51', 'sifive,u54-mc', 'sifive,x=
280']
   	'riscv' was expected
   	'sifive,rocket0' was expected
--
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: cpu@8 (space=
mit,a100): riscv,isa-extensions:73: 'sdtrig' is not one of ['i', 'm', 'a', =
'f', 'd', 'q', 'c', 'b', 'v', 'h', 'sha', 'shcounterenw', 'shgatpa', 'shtva=
la', 'shvsatpa', 'shvstvala', 'shvstvecd', 'smaia', 'smcdeleg', 'smcntrpmf'=
, 'smcsrind', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'ssccfg', 'ssccptr', =
'sscofpmf', 'sscounterenw', 'sscsrind', 'ssnpm', 'ssqosid', 'ssstateen', 's=
stc', 'sstvala', 'sstvecd', 'ssu64xl', 'supm', 'svade', 'svadu', 'svinval',=
 'svnapot', 'svpbmt', 'svrsw60t59b', 'svvptc', 'za64rs', 'zaamo', 'zabha', =
'zacas', 'zalasr', 'zalrsc', 'zawrs', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', =
'zbkx', 'zbs', 'zca', 'zcb', 'zcd', 'zcf', 'zclsd', 'zcmop', 'zfa', 'zfbfmi=
n', 'zfh', 'zfhmin', 'zicbom', 'zicbop', 'zicboz', 'ziccamoa', 'ziccif', 'z=
icclsm', 'ziccrse', 'zicfilp', 'zicfiss', 'zicntr', 'zicond', 'zicsr', 'zif=
encei', 'zihintntl', 'zihintpause', 'zihpm', 'zilsd', 'zimop', 'zk', 'zkn',=
 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', 'zkt', 'ztso', 'zvb=
b', 'zvbc', 'zve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', '=
zvfbfwma', 'zvfh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'z=
vkng', 'zvknha', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksg', 'zvksh', 'zv=
kt', 'xandespmu', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushd=
lone', 'xsfvqmaccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', =
'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: cpu@8 (space=
mit,a100): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,a100', 'riscv'] is too short
   	['spacemit,a100', 'riscv'] is too long
   	'spacemit,a100' is not one of ['amd,mbv32', 'amd,mbv64', 'andestech,ax4=
5mp', 'canaan,k210', 'nuclei,ux900', 'sifive,bullet0', 'sifive,e5', 'sifive=
,e7', 'sifive,e71', 'sifive,p550', 'sifive,rocket0', 'sifive,s7', 'sifive,u=
5', 'sifive,u54', 'sifive,u7', 'sifive,u74', 'sifive,u74-mc', 'spacemit,x10=
0', 'spacemit,x60', 'thead,c906', 'thead,c908', 'thead,c910', 'thead,c920']
   	'spacemit,a100' is not one of ['sifive,e51', 'sifive,u54-mc', 'sifive,x=
280']
   	'riscv' was expected
   	'sifive,rocket0' was expected
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: cpu@8 (space=
mit,a100): Unevaluated properties are not allowed ('cpu-ai', 'riscv,isa-bas=
e', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /cpus/cpu@8:=
 failed to match any schema with compatible: ['spacemit,a100', 'riscv']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: cpu@8 (space=
mit,a100): cpu-ai: b'true\x00' is not of type 'object', 'integer', 'array',=
 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: cpu@9 (space=
mit,a100): riscv,isa-extensions:73: 'sdtrig' is not one of ['i', 'm', 'a', =
'f', 'd', 'q', 'c', 'b', 'v', 'h', 'sha', 'shcounterenw', 'shgatpa', 'shtva=
la', 'shvsatpa', 'shvstvala', 'shvstvecd', 'smaia', 'smcdeleg', 'smcntrpmf'=
, 'smcsrind', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'ssccfg', 'ssccptr', =
'sscofpmf', 'sscounterenw', 'sscsrind', 'ssnpm', 'ssqosid', 'ssstateen', 's=
stc', 'sstvala', 'sstvecd', 'ssu64xl', 'supm', 'svade', 'svadu', 'svinval',=
 'svnapot', 'svpbmt', 'svrsw60t59b', 'svvptc', 'za64rs', 'zaamo', 'zabha', =
'zacas', 'zalasr', 'zalrsc', 'zawrs', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', =
'zbkx', 'zbs', 'zca', 'zcb', 'zcd', 'zcf', 'zclsd', 'zcmop', 'zfa', 'zfbfmi=
n', 'zfh', 'zfhmin', 'zicbom', 'zicbop', 'zicboz', 'ziccamoa', 'ziccif', 'z=
icclsm', 'ziccrse', 'zicfilp', 'zicfiss', 'zicntr', 'zicond', 'zicsr', 'zif=
encei', 'zihintntl', 'zihintpause', 'zihpm', 'zilsd', 'zimop', 'zk', 'zkn',=
 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', 'zkt', 'ztso', 'zvb=
b', 'zvbc', 'zve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', '=
zvfbfwma', 'zvfh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'z=
vkng', 'zvknha', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksg', 'zvksh', 'zv=
kt', 'xandespmu', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushd=
lone', 'xsfvqmaccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', =
'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: cpu@9 (space=
mit,a100): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,a100', 'riscv'] is too short
   	['spacemit,a100', 'riscv'] is too long
   	'spacemit,a100' is not one of ['amd,mbv32', 'amd,mbv64', 'andestech,ax4=
5mp', 'canaan,k210', 'nuclei,ux900', 'sifive,bullet0', 'sifive,e5', 'sifive=
,e7', 'sifive,e71', 'sifive,p550', 'sifive,rocket0', 'sifive,s7', 'sifive,u=
5', 'sifive,u54', 'sifive,u7', 'sifive,u74', 'sifive,u74-mc', 'spacemit,x10=
0', 'spacemit,x60', 'thead,c906', 'thead,c908', 'thead,c910', 'thead,c920']
   	'spacemit,a100' is not one of ['sifive,e51', 'sifive,u54-mc', 'sifive,x=
280']
   	'riscv' was expected
   	'sifive,rocket0' was expected
--
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: cpu@8 (spacemit,a100): ris=
cv,isa-extensions:73: 'sdtrig' is not one of ['i', 'm', 'a', 'f', 'd', 'q',=
 'c', 'b', 'v', 'h', 'sha', 'shcounterenw', 'shgatpa', 'shtvala', 'shvsatpa=
', 'shvstvala', 'shvstvecd', 'smaia', 'smcdeleg', 'smcntrpmf', 'smcsrind', =
'smmpm', 'smnpm', 'smstateen', 'ssaia', 'ssccfg', 'ssccptr', 'sscofpmf', 's=
scounterenw', 'sscsrind', 'ssnpm', 'ssqosid', 'ssstateen', 'sstc', 'sstvala=
', 'sstvecd', 'ssu64xl', 'supm', 'svade', 'svadu', 'svinval', 'svnapot', 's=
vpbmt', 'svrsw60t59b', 'svvptc', 'za64rs', 'zaamo', 'zabha', 'zacas', 'zala=
sr', 'zalrsc', 'zawrs', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs',=
 'zca', 'zcb', 'zcd', 'zcf', 'zclsd', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zf=
hmin', 'zicbom', 'zicbop', 'zicboz', 'ziccamoa', 'ziccif', 'zicclsm', 'zicc=
rse', 'zicfilp', 'zicfiss', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihin=
tntl', 'zihintpause', 'zihpm', 'zilsd', 'zimop', 'zk', 'zkn', 'zknd', 'zkne=
', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', 'zkt', 'ztso', 'zvbb', 'zvbc', 'z=
ve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zv=
fh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha=
', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksg', 'zvksh', 'zvkt', 'xandespm=
u', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqm=
accdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: cpu@8 (spacemit,a100): com=
patible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,a100', 'riscv'] is too short
   	['spacemit,a100', 'riscv'] is too long
   	'spacemit,a100' is not one of ['amd,mbv32', 'amd,mbv64', 'andestech,ax4=
5mp', 'canaan,k210', 'nuclei,ux900', 'sifive,bullet0', 'sifive,e5', 'sifive=
,e7', 'sifive,e71', 'sifive,p550', 'sifive,rocket0', 'sifive,s7', 'sifive,u=
5', 'sifive,u54', 'sifive,u7', 'sifive,u74', 'sifive,u74-mc', 'spacemit,x10=
0', 'spacemit,x60', 'thead,c906', 'thead,c908', 'thead,c910', 'thead,c920']
   	'spacemit,a100' is not one of ['sifive,e51', 'sifive,u54-mc', 'sifive,x=
280']
   	'riscv' was expected
   	'sifive,rocket0' was expected
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: cpu@8 (spacemit,a100): Une=
valuated properties are not allowed ('cpu-ai', 'riscv,isa-base', 'riscv,isa=
-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /cpus/cpu@8: failed to mat=
ch any schema with compatible: ['spacemit,a100', 'riscv']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: cpu@8 (spacemit,a100): cpu=
-ai: b'true\x00' is not of type 'object', 'integer', 'array', 'boolean', 'n=
ull'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: cpu@9 (spacemit,a100): ris=
cv,isa-extensions:73: 'sdtrig' is not one of ['i', 'm', 'a', 'f', 'd', 'q',=
 'c', 'b', 'v', 'h', 'sha', 'shcounterenw', 'shgatpa', 'shtvala', 'shvsatpa=
', 'shvstvala', 'shvstvecd', 'smaia', 'smcdeleg', 'smcntrpmf', 'smcsrind', =
'smmpm', 'smnpm', 'smstateen', 'ssaia', 'ssccfg', 'ssccptr', 'sscofpmf', 's=
scounterenw', 'sscsrind', 'ssnpm', 'ssqosid', 'ssstateen', 'sstc', 'sstvala=
', 'sstvecd', 'ssu64xl', 'supm', 'svade', 'svadu', 'svinval', 'svnapot', 's=
vpbmt', 'svrsw60t59b', 'svvptc', 'za64rs', 'zaamo', 'zabha', 'zacas', 'zala=
sr', 'zalrsc', 'zawrs', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs',=
 'zca', 'zcb', 'zcd', 'zcf', 'zclsd', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zf=
hmin', 'zicbom', 'zicbop', 'zicboz', 'ziccamoa', 'ziccif', 'zicclsm', 'zicc=
rse', 'zicfilp', 'zicfiss', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihin=
tntl', 'zihintpause', 'zihpm', 'zilsd', 'zimop', 'zk', 'zkn', 'zknd', 'zkne=
', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', 'zkt', 'ztso', 'zvbb', 'zvbc', 'z=
ve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zv=
fh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha=
', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksg', 'zvksh', 'zvkt', 'xandespm=
u', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqm=
accdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: cpu@9 (spacemit,a100): com=
patible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,a100', 'riscv'] is too short
   	['spacemit,a100', 'riscv'] is too long
   	'spacemit,a100' is not one of ['amd,mbv32', 'amd,mbv64', 'andestech,ax4=
5mp', 'canaan,k210', 'nuclei,ux900', 'sifive,bullet0', 'sifive,e5', 'sifive=
,e7', 'sifive,e71', 'sifive,p550', 'sifive,rocket0', 'sifive,s7', 'sifive,u=
5', 'sifive,u54', 'sifive,u7', 'sifive,u74', 'sifive,u74-mc', 'spacemit,x10=
0', 'spacemit,x60', 'thead,c906', 'thead,c908', 'thead,c910', 'thead,c920']
   	'spacemit,a100' is not one of ['sifive,e51', 'sifive,u54-mc', 'sifive,x=
280']
   	'riscv' was expected
   	'sifive,rocket0' was expected

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
