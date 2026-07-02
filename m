Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2776522332E
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 05:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782969677; cv=none; b=HX6mVwaslRmVu9y87GI8YTBpQBbWsaHsQKNLXEQ7OKx4EsDMWrGG4BLkGUoQMd1qIEN5OX72rG6wDElGOudPEcvuZqdyA3y0JKNBo/kGRANDl1SKk8HfpTdQKfnqC54fMIHc3fs9DzxYHRXO9miyg8f12mFzsISGMFlHdg9FT6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782969677; c=relaxed/simple;
	bh=2OzrVgHU77DaKssXllbISU9FMc8xdAsUGmNkVcMm9Os=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=j/z34cXWhP2jFGTLLAYpwhp7HYJjNKJj8neLX6/WqQjvl09mez/6vfZDydzD4f7NQhBNPim2J5ZSIVzr/Vifg7akGRSA8rhcrWef4Qf6zcz+JzGy744srfPPj7Ia4kPwyaAXg6DGVbmzKk+ZfzF8xnwLwRnO3b1KN9FIPIzJrXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBcAK6aS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBcAK6aS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782969674; x=1814505674;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2OzrVgHU77DaKssXllbISU9FMc8xdAsUGmNkVcMm9Os=;
  b=mBcAK6aScOPJnpiraiejRgMcot82Q/dq3l97RKQTN4a4tLHU2YG5LNdI
   EeOntBDb1LC8Fo5Z80VU7TYjVfT+2w5OxT6t58ZqqPALqhjdlhO4KEgqA
   0Wp1tBVD8nydqBiEicUd0iuC6m9593yCJzlotkJSsLHXnB5hsj7EkZiB9
   TRLyKTYRIOKWzyGReFELzzdd61QtCHTOS6TxAmiO138RdGM32y0UMnASS
   HqrFIcpLEaHHXjjnPnBcqqsczxPDwCUmepsgsOGLtOMvERcBpDwqF2WQW
   U6SnRm9pf3MsQdl6tQD5Fe9UmE9ybRJBmWMArbBWx4dP0Td2vzmOsZ1Rg
   w==;
X-CSE-ConnectionGUID: z5AnjwDQQF2DqGuVboOHpA==
X-CSE-MsgGUID: njSTNQq3Q8qjMd2r2o+8oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="87543449"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="87543449"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 22:21:13 -0700
X-CSE-ConnectionGUID: vlG8pwiyQlK6bO0EWu3p7w==
X-CSE-MsgGUID: BsVOsKKhR8uTd/T//Cg+WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="254689661"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Jul 2026 22:21:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf9rK-00000000A0l-1yMN;
	Thu, 02 Jul 2026 05:21:10 +0000
Date: Thu, 02 Jul 2026 13:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/mgcoge.dtb: Warning (interrupt_map):
 Failed prerequisite 'interrupt_provider'
Message-ID: <202607021327.w3zAlxOt-lkp@intel.com>
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
head:   4a50a141f05a8d1737661b19ee22ff8455b94409
commit: 2442f10c6eae63392452ab84a813dbc1f87c724d powerpc: dts: Build device=
trees of enabled platforms
date:   4 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: powerpc-randconfig-002-20260702 (https://download.01.org/0day-ci/ar=
chive/20260702/202607021327.w3zAlxOt-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260702/202607021327.w3zAlxOt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 2442f10c6eae ("powerpc: dts: Build devicetrees of enabled platform=
s")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607021327.w3zAlxOt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/mgcoge.dts:91.9-94.4: Warning (unit_address_vs_reg=
): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/mgcoge.dts:114.10-124.6: Warning (unit_address_vs_=
reg): /soc@f0000000/cpm@119c0/muram: node has a reg or ranges property, but=
 no unit name
   arch/powerpc/boot/dts/mgcoge.dts:52.13-75.5: Warning (simple_bus_reg): /=
localbus@f0010100/flash@0,0: simple-bus unit address format error, expected=
 "0"
   arch/powerpc/boot/dts/mgcoge.dts:77.13-88.5: Warning (simple_bus_reg): /=
localbus@f0010100/flash@5,0: simple-bus unit address format error, expected=
 "500000000"
   arch/powerpc/boot/dts/mgcoge.dts:114.10-124.6: Warning (simple_bus_reg):=
 /soc@f0000000/cpm@119c0/muram: simple-bus unit address format error, expec=
ted "0"
   arch/powerpc/boot/dts/mgcoge.dts:170.15-185.6: Warning (simple_bus_reg):=
 /soc@f0000000/cpm@119c0/mdio@10d40: simple-bus unit address format error, =
expected "10d00"
   arch/powerpc/boot/dts/mgcoge.dts:221.14-228.6: Warning (simple_bus_reg):=
 /soc@f0000000/cpm@119c0/spi@11aa0: simple-bus unit address format error, e=
xpected "11a80"
   arch/powerpc/boot/dts/mgcoge.dts:105.13-230.5: Warning (interrupt_provid=
er): /soc@f0000000/cpm@119c0: '#interrupt-cells' found, but node is not an =
interrupt provider
>> arch/powerpc/boot/dts/mgcoge.dtb: Warning (interrupt_map): Failed prereq=
uisite 'interrupt_provider'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
