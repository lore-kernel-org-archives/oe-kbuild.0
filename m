Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0A6361DDE
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jun 2026 20:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782161507; cv=none; b=lCmAiEjOuMKAhywQno7bEk6XMOyuXyOpVfMbWSIvvmpV69MqbbQ+VBgWisew0IcU6kS09bPm44LiQRSxpeqiX4eJIor12Si1ezR1BfCVjJg/PK9rYb/5oJg04EKS8YwtzGsFOTu89GX+9WXlnqqNt2vXuwyyfjM8Fykz8H714wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782161507; c=relaxed/simple;
	bh=I63lq5yM6LqBaQtikEEMCyHnLqnPKyP/cn8SCHoiWmg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=n9Bh3hsWA5/dIBYDP4dFHw2yeXH06wyHoocNrnG5ROx5vTTmqc+VBJauh4oPb/IlIYCvv5iIhFBFi4KcHbdSxV8k2keNpm9+Kn6DF/l00mhfPaVp3nI3uD9tJOSXtsXpTW/IlNQeYhqKy5CzqnWfyoZrcddYm1sJi6Dq65+rhSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ld9HMou9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ld9HMou9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782161506; x=1813697506;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=I63lq5yM6LqBaQtikEEMCyHnLqnPKyP/cn8SCHoiWmg=;
  b=Ld9HMou9d0eYcDgsDXMS0QB4beMZ8TS9zNnlNQYCLsazfVUB+M/tcbpy
   N9YqGRdxOGT8A2X57gpenl53stEt5R/wzdgcv9RBj1ErrCDf/Tyg4qFx1
   qIlLHMdyRmzoKXeFNkAnNrouwv/e+dPgArbpAQEq57M/BhWOOGFk3AzIs
   aPPCA4p2YXsEh6f2pzxKV0Q5lWab6hs45nvJ9cvlqTlUQEHlGG9mCLiVh
   ipiLPCdAlcUbL2TJniqKIrhY0eg4BamsJ/eonzlIT7ECEvZAKDFtZLvzq
   rTRW1kU3bSShKkmsawovoodwUvMGmX/KVzcEBlqbVLcUif2JU2tEVKaAm
   Q==;
X-CSE-ConnectionGUID: Gb7aPKj5Twyd/SJVeevvfg==
X-CSE-MsgGUID: dLrTctQNTgKsaVk5rMEU2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82769776"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="82769776"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 13:51:45 -0700
X-CSE-ConnectionGUID: bFJmWxpDTF+MiW7dYm56JQ==
X-CSE-MsgGUID: b9TXXmWiTUq2m/hKskYd0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="273395579"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jun 2026 13:51:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wblcA-000000001uZ-0h97;
	Mon, 22 Jun 2026 20:51:35 +0000
Date: Tue, 23 Jun 2026 04:50:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/fsl/kmcoge4.dtb: Warning
 (unit_address_format): Failed prerequisite 'pci_bridge'
Message-ID: <202606230418.jxTMjQpC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4708cac0e22cfd217f48f7cec3c35e5922efcccd
commit: 2442f10c6eae63392452ab84a813dbc1f87c724d powerpc: dts: Build device=
trees of enabled platforms
date:   3 weeks ago
:::::: branch date: 57 minutes ago
:::::: commit date: 3 weeks ago
config: powerpc-randconfig-001-20260622 (https://download.01.org/0day-ci/ar=
chive/20260623/202606230418.jxTMjQpC-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260623/202606230418.jxTMjQpC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 2442f10c6eae ("powerpc: dts: Build devicetrees of enabled platform=
s")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606230418.jxTMjQpC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/p2041si-post.dtsi:179.11-182.4: Warning (unit_=
address_vs_reg): /dcsr@f00000000/dcsr-npc: node has a reg or ranges propert=
y, but no unit name
   arch/powerpc/boot/dts/fsl/p2041si-post.dtsi:187.15-190.4: Warning (unit_=
address_vs_reg): /dcsr@f00000000/dcsr-corenet: node has a reg or ranges pro=
perty, but no unit name
   arch/powerpc/boot/dts/fsl/kmcoge4.dts:148.25-150.4: Warning (unit_addres=
s_vs_reg): /rapidio@ffe0c0000: node has a unit name, but no reg or ranges p=
roperty
   arch/powerpc/boot/dts/fsl/kmcoge4.dts:196.23-198.4: Warning (unit_addres=
s_vs_reg): /pcie@ffe201000: node has a unit name, but no reg or ranges prop=
erty
   arch/powerpc/boot/dts/fsl/kmcoge4.dts:196.23-198.4: Warning (pci_bridge)=
: /pcie@ffe201000: missing ranges for PCI bridge (or not a bridge)
   arch/powerpc/boot/dts/fsl/p2041si-post.dtsi:97.9-112.4: Warning (pci_bri=
dge): /pcie@ffe201000/pcie@0: missing ranges for PCI bridge (or not a bridg=
e)
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: Warning (unit_address_format): Fa=
iled prerequisite 'pci_bridge'
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: Warning (pci_device_reg): Failed =
prerequisite 'pci_bridge'
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: Warning (pci_device_bus_num): Fai=
led prerequisite 'pci_bridge'
   arch/powerpc/boot/dts/fsl/p2041si-post.dtsi:179.11-182.4: Warning (simpl=
e_bus_reg): /dcsr@f00000000/dcsr-npc: simple-bus unit address format error,=
 expected "1000"
   arch/powerpc/boot/dts/fsl/p2041si-post.dtsi:187.15-190.4: Warning (simpl=
e_bus_reg): /dcsr@f00000000/dcsr-corenet: simple-bus unit address format er=
ror, expected "8000"
   arch/powerpc/boot/dts/fsl/p2041si-post.dtsi:244.17-247.4: Warning (simpl=
e_bus_reg): /soc@ffe000000/soc-sram-error: missing or empty reg/ranges prop=
erty
   arch/powerpc/boot/dts/fsl/kmcoge4.dts:159.12-164.5: Warning (simple_bus_=
reg): /localbus@ffe124000/nand@0,0: simple-bus unit address format error, e=
xpected "0"
   arch/powerpc/boot/dts/fsl/kmcoge4.dts:166.21-169.5: Warning (simple_bus_=
reg): /localbus@ffe124000/board-control@1,0: simple-bus unit address format=
 error, expected "100000000"
   arch/powerpc/boot/dts/fsl/kmcoge4.dts:171.20-178.5: Warning (simple_bus_=
reg): /localbus@ffe124000/chassis-mgmt@3,0: simple-bus unit address format =
error, expected "300000000"
   arch/powerpc/boot/dts/fsl/p2041si-pre.dtsi:45.10-83.4: Warning (alias_pa=
ths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p2041si-pre.dtsi:45.10-83.4: Warning (alias_pa=
ths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p2041si-pre.dtsi:45.10-83.4: Warning (alias_pa=
ths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p2041si-pre.dtsi:45.10-83.4: Warning (alias_pa=
ths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/powerpc/boot/dts/fsl/oca4080.dts:132.23-134.4: Warning (pci_bridge)=
: /pcie@ffe200000: missing ranges for PCI bridge (or not a bridge)
   arch/powerpc/boot/dts/fsl/p4080si-post.dtsi:68.9-83.4: Warning (pci_brid=
ge): /pcie@ffe200000/pcie@0: missing ranges for PCI bridge (or not a bridge)
   arch/powerpc/boot/dts/fsl/oca4080.dts:136.23-138.4: Warning (pci_bridge)=
: /pcie@ffe201000: missing ranges for PCI bridge (or not a bridge)
   arch/powerpc/boot/dts/fsl/p4080si-post.dtsi:97.9-112.4: Warning (pci_bri=
dge): /pcie@ffe201000/pcie@0: missing ranges for PCI bridge (or not a bridg=
e)
   arch/powerpc/boot/dts/fsl/oca4080.dts:140.23-142.4: Warning (pci_bridge)=
: /pcie@ffe202000: missing ranges for PCI bridge (or not a bridge)
   arch/powerpc/boot/dts/fsl/p4080si-post.dtsi:126.9-141.4: Warning (pci_br=
idge): /pcie@ffe202000/pcie@0: missing ranges for PCI bridge (or not a brid=
ge)
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: Warning (unit_address_format): Fa=
iled prerequisite 'pci_bridge'
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: Warning (pci_device_reg): Failed =
prerequisite 'pci_bridge'
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: Warning (pci_device_bus_num): Fai=
led prerequisite 'pci_bridge'
   arch/powerpc/boot/dts/fsl/p4080si-post.dtsi:180.11-183.4: Warning (simpl=
e_bus_reg): /dcsr@f00000000/dcsr-npc: simple-bus unit address format error,=
 expected "1000"
   arch/powerpc/boot/dts/fsl/p4080si-post.dtsi:188.15-191.4: Warning (simpl=
e_bus_reg): /dcsr@f00000000/dcsr-corenet: simple-bus unit address format er=
ror, expected "8000"
   arch/powerpc/boot/dts/fsl/p4080si-post.dtsi:271.17-274.4: Warning (simpl=
e_bus_reg): /soc@ffe000000/soc-sram-error: missing or empty reg/ranges prop=
erty
   arch/powerpc/boot/dts/fsl/oca4080.dts:124.13-129.5: Warning (simple_bus_=
reg): /localbus@ffe124000/flash@0,0: simple-bus unit address format error, =
expected "0"
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_pa=
ths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_pa=
ths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_pa=
ths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_pa=
ths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_pa=
ths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_pa=
ths): /aliases: aliases property name must include only lowercase and '-'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
