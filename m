Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5CD47A0B2
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 07:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769068004; cv=none; b=Mw6yEywpnGj3AbO+yyImd2NG1J7XynP4DsyCpV+1M2JS1aHhfoTubCSx3qmHGeWTi0a3etzXZEWhSgBF+gzGDWkAKMy2F4cT6HbWkiyrtFCPi5Wh0GkbPBup1Nz8Rh8YB/EqCP/4YcN60DxthDzSn0ofCDoH7MCfSxTUC7hRv5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769068004; c=relaxed/simple;
	bh=EtrAYuF9Ake1PEOh3eMCl16wZ/Dsek0xV8OXJCvqtuA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Lhhh9JqX0dwjjrMiHyC9xlqJEJ07c5XeIN+yT5ftj7slf9jt4r88ik1oGPNzUke9YyLCUSbXPKXoePkxZl/f1CZlmMaaLnC7CaK020FsxabnooT2zWPmOUF//C4is2vMMw6Kd9w7lidH1RRT9bCCV0Jf0FfgBgcLdQE/gJlrhnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ewzoQ2JL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ewzoQ2JL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769067997; x=1800603997;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EtrAYuF9Ake1PEOh3eMCl16wZ/Dsek0xV8OXJCvqtuA=;
  b=ewzoQ2JLzkW5z0bilgJ2qQQPlTw5Vog0CCxd+4gKZljtbCOuo4jXryQN
   8k3oQzHdnbS2vbauzd9gQh0Ymp/C8IVlTwAFbKyxMG41FPF/bS2sBFvVT
   D6B06Zr0BPfc//O+j3rx17Gaf6R6Y3FOBaCMcwqnpWGyJtAgxMu30pemg
   xLB3w7QND3jU0xVMn5bNZwvoyOA2+x3ni9FlQtlpqhQLZQzVO9RyqKsS7
   qA5Of+J662NTMcQTqRXuxI4V5fG4HXHvmv6xcx5w4dBoNIN19Fs1TBkA5
   OOK8XRkYS8JeEapX6StC/0gq1w1JhGitwS7V/IfxBQ0yrQsTfcMFWkPMs
   Q==;
X-CSE-ConnectionGUID: jHkJybudRwyQRk0ZzQKaJg==
X-CSE-MsgGUID: xcDH9d8cSSmsDkdFpEORJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="72895672"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="72895672"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 23:46:34 -0800
X-CSE-ConnectionGUID: 9ABT2HqXR+O0KmtxPeHd/A==
X-CSE-MsgGUID: In+/Q3J8Qt+WWKxLZ3mEGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="229638658"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 21 Jan 2026 23:46:33 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vipOg-000000000S9-3vpW;
	Thu, 22 Jan 2026 07:46:30 +0000
Date: Thu, 22 Jan 2026 08:45:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [fustini:ssqosid-cbqri-rfc-v1 20/20]
 arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv):
 riscv,isa-extensions:7: 'zic64b' is not one of ['i', 'm', 'a', 'f', 'd', 'q',
 'c', 'v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf',
 'ssnpm', 'ssqosid', 'sstc', 'svade', 'sv...
Message-ID: <202601220826.ma6iRqsx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Drew Fustini <fustini@kernel.org>
CC: Adrien Ricciardi <aricciardi@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git s=
sqosid-cbqri-rfc-v1
head:   e1cbc7e54be8f4280653a376d8bd8b47fadea6fc
commit: e1cbc7e54be8f4280653a376d8bd8b47fadea6fc [20/20] [NFU] riscv: dts: =
build qemu dtb for CONFIG_ARCH_VIRT
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-2051-20260122 (https://download.01.org/0day-ci/arc=
hive/20260122/202601220826.ma6iRqsx-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.5.0
dtschema version: 2025.12
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260122/202601220826.ma6iRqsx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601220826.ma6iRqsx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts:379.4-188: Warning (interru=
pts_extended_property): /soc/clint@2000000:interrupts-extended: cell 14 is =
not a phandle reference
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts:379.4-188: Warning (interru=
pts_extended_property): /soc/clint@2000000:interrupts-extended: cell 16 is =
not a phandle reference
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts:379.4-188: Warning (interru=
pts_extended_property): /soc/clint@2000000:interrupts-extended: cell 18 is =
not a phandle reference
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts:379.4-188: Warning (interru=
pts_extended_property): /soc/clint@2000000:interrupts-extended: cell 20 is =
not a phandle reference
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts:379.4-188: Warning (interru=
pts_extended_property): /soc/clint@2000000:interrupts-extended: cell 22 is =
not a phandle reference
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts:379.4-188: Warning (interru=
pts_extended_property): /soc/clint@2000000:interrupts-extended: cell 24 is =
not a phandle reference
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts:379.4-188: Warning (interru=
pts_extended_property): /soc/clint@2000000:interrupts-extended: cell 26 is =
not a phandle reference
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts:379.4-188: Warning (interru=
pts_extended_property): /soc/clint@2000000:interrupts-extended: cell 28 is =
not a phandle reference
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts:379.4-188: Warning (interru=
pts_extended_property): /soc/clint@2000000:interrupts-extended: cell 30 is =
not a phandle reference
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: /: failed to match any sch=
ema with compatible: ['riscv-virtio']
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:7: 'zic64b' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', 'v'=
, 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnpm'=
, 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 'svr=
sw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawrs'=
, 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd', =
'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'zcl=
sd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', 'z=
kt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei',=
 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'zve=
32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zvfh=
', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha',=
 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespmu'=
, 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqmac=
cdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:11: 'ziccamoa' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', =
'v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssn=
pm', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', '=
svrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zaw=
rs', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd=
', 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', '=
zclsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh',=
 'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifence=
i', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', '=
zve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'z=
vfh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknh=
a', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandesp=
mu', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvq=
maccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector=
']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:12: 'ziccif' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', 'v=
', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnpm=
', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 'sv=
rsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawrs=
', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd',=
 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'zc=
lsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', '=
zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei'=
, 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'zv=
e32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zvf=
h', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha'=
, 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespmu=
', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqma=
ccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:13: 'zicclsm' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', '=
v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnp=
m', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 's=
vrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawr=
s', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd'=
, 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'z=
clsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', =
'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei=
', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'z=
ve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zv=
fh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha=
', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespm=
u', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqm=
accdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:21: 'zmmul' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', 'v'=
, 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnpm'=
, 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 'svr=
sw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawrs'=
, 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd', =
'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'zcl=
sd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', 'z=
kt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei',=
 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'zve=
32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zvfh=
', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha',=
 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespmu'=
, 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqmac=
cdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:22: 'za64rs' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', 'v=
', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnpm=
', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 'sv=
rsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawrs=
', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd',=
 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'zc=
lsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', '=
zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei'=
, 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'zv=
e32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zvf=
h', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha'=
, 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespmu=
', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqma=
ccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:33: 'sdtrig' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', 'v=
', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnpm=
', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 'sv=
rsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawrs=
', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd',=
 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'zc=
lsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', '=
zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei'=
, 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'zv=
e32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zvf=
h', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha'=
, 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespmu=
', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqma=
ccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:34: 'shcounterenw' is not one of ['i', 'm', 'a', 'f', 'd', 'q', '=
c', 'v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', =
'ssnpm', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt=
', 'svrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', =
'zawrs', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', =
'zcd', 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd=
', 'zclsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zk=
sh', 'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zif=
encei', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc=
', 'zve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma'=
, 'zvfh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'z=
vknha', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xan=
despmu', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'x=
sfvqmaccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadve=
ctor']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:35: 'shgatpa' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', '=
v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnp=
m', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 's=
vrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawr=
s', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd'=
, 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'z=
clsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', =
'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei=
', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'z=
ve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zv=
fh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha=
', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespm=
u', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqm=
accdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:36: 'shtvala' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', '=
v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnp=
m', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 's=
vrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawr=
s', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd'=
, 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'z=
clsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', =
'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei=
', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'z=
ve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zv=
fh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha=
', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespm=
u', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqm=
accdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:37: 'shvsatpa' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', =
'v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssn=
pm', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', '=
svrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zaw=
rs', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd=
', 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', '=
zclsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh',=
 'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifence=
i', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', '=
zve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'z=
vfh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknh=
a', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandesp=
mu', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvq=
maccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector=
']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:38: 'shvstvala' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c',=
 'v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ss=
npm', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', =
'svrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'za=
wrs', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zc=
d', 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', =
'zclsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh'=
, 'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifenc=
ei', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', =
'zve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', '=
zvfh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvkn=
ha', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandes=
pmu', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfv=
qmaccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvecto=
r']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:39: 'shvstvecd' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c',=
 'v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ss=
npm', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', =
'svrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'za=
wrs', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zc=
d', 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', =
'zclsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh'=
, 'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifenc=
ei', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', =
'zve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', '=
zvfh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvkn=
ha', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandes=
pmu', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfv=
qmaccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvecto=
r']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:40: 'ssccptr' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', '=
v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnp=
m', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 's=
vrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawr=
s', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd'=
, 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'z=
clsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', =
'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei=
', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'z=
ve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zv=
fh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha=
', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespm=
u', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqm=
accdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:41: 'sscounterenw' is not one of ['i', 'm', 'a', 'f', 'd', 'q', '=
c', 'v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', =
'ssnpm', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt=
', 'svrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', =
'zawrs', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', =
'zcd', 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd=
', 'zclsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zk=
sh', 'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zif=
encei', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc=
', 'zve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma'=
, 'zvfh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'z=
vknha', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xan=
despmu', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'x=
sfvqmaccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadve=
ctor']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:43: 'ssstrict' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', =
'v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssn=
pm', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', '=
svrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zaw=
rs', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd=
', 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', '=
zclsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh',=
 'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifence=
i', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', '=
zve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'z=
vfh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknh=
a', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandesp=
mu', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvq=
maccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector=
']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:45: 'sstvala' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', '=
v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnp=
m', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 's=
vrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawr=
s', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd'=
, 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'z=
clsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', =
'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei=
', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'z=
ve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zv=
fh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha=
', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespm=
u', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqm=
accdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:46: 'sstvecd' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', '=
v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnp=
m', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 's=
vrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawr=
s', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd'=
, 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'z=
clsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', =
'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei=
', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'z=
ve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zv=
fh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha=
', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespm=
u', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqm=
accdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:47: 'ssu64xl' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', '=
v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnp=
m', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 's=
vrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawr=
s', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd'=
, 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'z=
clsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', =
'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei=
', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'z=
ve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zv=
fh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha=
', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespm=
u', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqm=
accdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): Unevaluated=
 properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-exte=
nsions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:7: 'zic64b' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', 'v'=
, 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnpm'=
, 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 'svr=
sw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawrs'=
, 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd', =
'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'zcl=
sd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', 'z=
kt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei',=
 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'zve=
32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zvfh=
', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha',=
 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespmu'=
, 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqmac=
cdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:11: 'ziccamoa' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', =
'v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssn=
pm', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', '=
svrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zaw=
rs', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd=
', 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', '=
zclsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh',=
 'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifence=
i', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', '=
zve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'z=
vfh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknh=
a', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandesp=
mu', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvq=
maccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector=
']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:12: 'ziccif' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', 'v=
', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnpm=
', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 'sv=
rsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawrs=
', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd',=
 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'zc=
lsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', '=
zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei'=
, 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'zv=
e32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zvf=
h', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha'=
, 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespmu=
', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqma=
ccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:13: 'zicclsm' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', '=
v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnp=
m', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 's=
vrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawr=
s', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd'=
, 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'z=
clsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', =
'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei=
', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'z=
ve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zv=
fh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha=
', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespm=
u', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqm=
accdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:21: 'zmmul' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', 'v'=
, 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnpm'=
, 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 'svr=
sw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawrs'=
, 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd', =
'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'zcl=
sd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', 'z=
kt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei',=
 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'zve=
32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zvfh=
', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha',=
 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespmu'=
, 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqmac=
cdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:22: 'za64rs' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', 'v=
', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnpm=
', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 'sv=
rsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawrs=
', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd',=
 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'zc=
lsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', '=
zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei'=
, 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'zv=
e32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zvf=
h', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha'=
, 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespmu=
', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqma=
ccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:33: 'sdtrig' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', 'v=
', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnpm=
', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 'sv=
rsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawrs=
', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd',=
 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'zc=
lsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', '=
zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei'=
, 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'zv=
e32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zvf=
h', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha'=
, 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespmu=
', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqma=
ccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:34: 'shcounterenw' is not one of ['i', 'm', 'a', 'f', 'd', 'q', '=
c', 'v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', =
'ssnpm', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt=
', 'svrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', =
'zawrs', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', =
'zcd', 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd=
', 'zclsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zk=
sh', 'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zif=
encei', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc=
', 'zve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma'=
, 'zvfh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'z=
vknha', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xan=
despmu', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'x=
sfvqmaccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadve=
ctor']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:35: 'shgatpa' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', '=
v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnp=
m', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 's=
vrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawr=
s', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd'=
, 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'z=
clsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', =
'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei=
', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'z=
ve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zv=
fh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha=
', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespm=
u', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqm=
accdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:36: 'shtvala' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', '=
v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnp=
m', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 's=
vrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawr=
s', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd'=
, 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'z=
clsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', =
'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei=
', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'z=
ve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zv=
fh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha=
', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespm=
u', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqm=
accdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:37: 'shvsatpa' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', =
'v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssn=
pm', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', '=
svrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zaw=
rs', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd=
', 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', '=
zclsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh',=
 'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifence=
i', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', '=
zve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'z=
vfh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknh=
a', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandesp=
mu', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvq=
maccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector=
']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:38: 'shvstvala' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c',=
 'v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ss=
npm', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', =
'svrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'za=
wrs', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zc=
d', 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', =
'zclsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh'=
, 'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifenc=
ei', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', =
'zve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', '=
zvfh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvkn=
ha', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandes=
pmu', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfv=
qmaccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvecto=
r']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:39: 'shvstvecd' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c',=
 'v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ss=
npm', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', =
'svrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'za=
wrs', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zc=
d', 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', =
'zclsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh'=
, 'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifenc=
ei', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', =
'zve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', '=
zvfh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvkn=
ha', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandes=
pmu', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfv=
qmaccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvecto=
r']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:40: 'ssccptr' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', '=
v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnp=
m', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 's=
vrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawr=
s', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd'=
, 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'z=
clsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', =
'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei=
', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'z=
ve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zv=
fh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha=
', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespm=
u', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqm=
accdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:41: 'sscounterenw' is not one of ['i', 'm', 'a', 'f', 'd', 'q', '=
c', 'v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', =
'ssnpm', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt=
', 'svrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', =
'zawrs', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', =
'zcd', 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd=
', 'zclsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zk=
sh', 'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zif=
encei', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc=
', 'zve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma'=
, 'zvfh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'z=
vknha', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xan=
despmu', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'x=
sfvqmaccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadve=
ctor']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:43: 'ssstrict' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', =
'v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssn=
pm', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', '=
svrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zaw=
rs', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd=
', 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', '=
zclsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh',=
 'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifence=
i', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', '=
zve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'z=
vfh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknh=
a', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandesp=
mu', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvq=
maccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector=
']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:45: 'sstvala' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', '=
v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnp=
m', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 's=
vrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawr=
s', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd'=
, 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'z=
clsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', =
'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei=
', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'z=
ve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zv=
fh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha=
', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespm=
u', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqm=
accdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:46: 'sstvecd' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', '=
v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnp=
m', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 's=
vrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawr=
s', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd'=
, 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'z=
clsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', =
'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei=
', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'z=
ve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zv=
fh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha=
', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespm=
u', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqm=
accdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@0 (riscv): riscv,isa-e=
xtensions:47: 'ssu64xl' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', '=
v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnp=
m', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 's=
vrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawr=
s', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd'=
, 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'z=
clsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', =
'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei=
', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'z=
ve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zv=
fh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha=
', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespm=
u', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqm=
accdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@1 (riscv): riscv,isa-e=
xtensions:7: 'zic64b' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', 'v'=
, 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnpm'=
, 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 'svr=
sw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawrs'=
, 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd', =
'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'zcl=
sd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', 'z=
kt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei',=
 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'zve=
32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zvfh=
', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha',=
 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespmu'=
, 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqmac=
cdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@1 (riscv): riscv,isa-e=
xtensions:11: 'ziccamoa' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', =
'v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssn=
pm', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', '=
svrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zaw=
rs', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd=
', 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', '=
zclsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh',=
 'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifence=
i', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', '=
zve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'z=
vfh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknh=
a', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandesp=
mu', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvq=
maccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector=
']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@1 (riscv): riscv,isa-e=
xtensions:12: 'ziccif' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', 'v=
', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnpm=
', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 'sv=
rsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawrs=
', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd',=
 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'zc=
lsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', '=
zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei'=
, 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'zv=
e32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zvf=
h', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha'=
, 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespmu=
', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqma=
ccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@1 (riscv): riscv,isa-e=
xtensions:13: 'zicclsm' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', '=
v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnp=
m', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 's=
vrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawr=
s', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd'=
, 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'z=
clsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', =
'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei=
', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'z=
ve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zv=
fh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha=
', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespm=
u', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqm=
accdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@1 (riscv): riscv,isa-e=
xtensions:21: 'zmmul' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', 'v'=
, 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnpm'=
, 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 'svr=
sw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawrs'=
, 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd', =
'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'zcl=
sd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', 'z=
kt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei',=
 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'zve=
32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zvfh=
', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha',=
 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespmu'=
, 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqmac=
cdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
--
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@7 (riscv): riscv,isa-e=
xtensions:43: 'ssstrict' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', =
'v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssn=
pm', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', '=
svrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zaw=
rs', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd=
', 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', '=
zclsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh',=
 'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifence=
i', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', '=
zve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'z=
vfh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknh=
a', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandesp=
mu', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvq=
maccdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector=
']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@7 (riscv): riscv,isa-e=
xtensions:45: 'sstvala' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', '=
v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnp=
m', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 's=
vrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawr=
s', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd'=
, 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'z=
clsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', =
'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei=
', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'z=
ve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zv=
fh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha=
', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespm=
u', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqm=
accdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@7 (riscv): riscv,isa-e=
xtensions:46: 'sstvecd' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', '=
v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnp=
m', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 's=
vrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawr=
s', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd'=
, 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'z=
clsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', =
'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei=
', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'z=
ve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zv=
fh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha=
', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespm=
u', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqm=
accdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: cpu@7 (riscv): riscv,isa-e=
xtensions:47: 'ssu64xl' is not one of ['i', 'm', 'a', 'f', 'd', 'q', 'c', '=
v', 'h', 'smaia', 'smmpm', 'smnpm', 'smstateen', 'ssaia', 'sscofpmf', 'ssnp=
m', 'ssqosid', 'sstc', 'svade', 'svadu', 'svinval', 'svnapot', 'svpbmt', 's=
vrsw60t59b', 'svvptc', 'zaamo', 'zabha', 'zacas', 'zalasr', 'zalrsc', 'zawr=
s', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', 'zbkx', 'zbs', 'zca', 'zcb', 'zcd'=
, 'zcf', 'zcmop', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'ziccrse', 'zilsd', 'z=
clsd', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', 'zkr', 'zks', 'zksed', 'zksh', =
'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei=
', 'zihintpause', 'zihintntl', 'zihpm', 'zimop', 'ztso', 'zvbb', 'zvbc', 'z=
ve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvfbfmin', 'zvfbfwma', 'zv=
fh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zvkned', 'zvkng', 'zvknha=
', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zvksg', 'zvkt', 'xandespm=
u', 'xmipsexectl', 'xsfcease', 'xsfcflushdlone', 'xsfpgflushdlone', 'xsfvqm=
accdod', 'xsfvqmaccqoq', 'xsfvfnrclipxfqf', 'xsfvfwmaccqqq', 'xtheadvector']
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: /soc/test@100000: failed t=
o match any schema with compatible: ['sifive,test1', 'sifive,test0', 'sysco=
n']
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: /soc/test@100000: failed t=
o match any schema with compatible: ['sifive,test1', 'sifive,test0', 'sysco=
n']
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: /soc/controller@4820000: f=
ailed to match any schema with compatible: ['riscv,cbqri-cache']
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: /soc/controller@4821000: f=
ailed to match any schema with compatible: ['riscv,cbqri-cache']
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: /soc/controller@482b000: f=
ailed to match any schema with compatible: ['riscv,cbqri-cache']
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: /soc/controller@4828000: f=
ailed to match any schema with compatible: ['riscv,cbqri-bandwidth']
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: /soc/controller@4829000: f=
ailed to match any schema with compatible: ['riscv,cbqri-bandwidth']
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: /soc/controller@482a000: f=
ailed to match any schema with compatible: ['riscv,cbqri-bandwidth']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
