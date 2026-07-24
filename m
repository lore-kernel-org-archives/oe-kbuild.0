Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F59D36B928
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Jul 2026 03:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784863621; cv=none; b=YzbNSWa3nQgz0E4En2Yy7S0abYwm7wA4gUD/8SKOPcGg04zkNYEaR8qTrkv020ld9UVxWWdV75W2kfhAQBeC4NAzU32vVY1wzFHDny36KKSLeHig7IILqiT8gcNIY9p+15u9J/PkjzBpwdyUZ3Fb8V4Snzdg+mZ3O4Ryb8SR1Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784863621; c=relaxed/simple;
	bh=9EB/Tfl7iJBsjsQlVya/lzXK6fycpw4EujejBeweFAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hXXQixryr4vZVXhL67fhpl4ebzz0gmb5ysMWvJWvK3jVSU6fULZzM2Mzmq0WwaX8U9eQn1C0JTaOa+3ni1iKQfpt6r93qEbewYD4+ytTML7uWfA9GFAMaYJd0t8C3Z126KDsSnfHnLWbisIICfLRU0qYHCMJ+ZG/g2fEBr4esRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJE7DIrt; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJE7DIrt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784863619; x=1816399619;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9EB/Tfl7iJBsjsQlVya/lzXK6fycpw4EujejBeweFAk=;
  b=bJE7DIrtoqMnqPk3ZCUtm2zNqDpeo/DhwSGlVAev7OH3tTzH9C1L1F90
   Nq36rByUX+wdj5LMjKHNsU19KGqsJPC9WZioT10cqZRpKNjEg0yRUJuyS
   H/4poiFigCKMMiL0+yevQ2y52tRGLtgbYC8ZK0jyXJG2Ybx28heEBlce9
   mog9k8t4AYM+W4f8yqe54oTVcsi+fhYQAfM3aVeoe49aHM/rXY1J4bAml
   Xun48TIE6RUc25xuffvWcNRM6/QTYajpPbOwvDslQtsNEGf4QDyNALbvY
   EOvgmN45eFoL1A9Demyfb2fpFgV9Mh9aoSzZxqThNmX+6TEnPivin38Tb
   g==;
X-CSE-ConnectionGUID: YMw7sCh1Sq2C5yxCH2KGaQ==
X-CSE-MsgGUID: dYIberTLStylW6KulcDHrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85617988"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; 
   d="scan'208";a="85617988"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 20:26:58 -0700
X-CSE-ConnectionGUID: 9TwVPovET5qqxN6RSaHv2Q==
X-CSE-MsgGUID: uGfcVl1iQSK8W7JhrOmj/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; 
   d="scan'208";a="254264769"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jul 2026 20:26:57 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wn6Yp-00000000aSw-0HnV;
	Fri, 24 Jul 2026 03:26:55 +0000
Date: Fri, 24 Jul 2026 11:25:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/amigaone.dtb: Warning (interrupt_map):
 Failed prerequisite 'interrupt_provider'
Message-ID: <202607241115.zWCXyW0t-lkp@intel.com>
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
head:   4539944e515183668109bdf4d0c3d7d228383d88
commit: 2442f10c6eae63392452ab84a813dbc1f87c724d powerpc: dts: Build device=
trees of enabled platforms
date:   7 weeks ago
:::::: branch date: 32 hours ago
:::::: commit date: 7 weeks ago
config: powerpc-randconfig-002-20260724 (https://download.01.org/0day-ci/ar=
chive/20260724/202607241115.zWCXyW0t-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260724/202607241115.zWCXyW0t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 2442f10c6eae ("powerpc: dts: Build devicetrees of enabled platform=
s")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607241115.zWCXyW0t-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/amigaone.dts:35.9-38.4: Warning (unit_address_vs_r=
eg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/amigaone.dts:57.9-163.5: Warning (interrupt_provid=
er): /pci@80000000/isa@7: '#interrupt-cells' found, but node is not an inte=
rrupt provider
>> arch/powerpc/boot/dts/amigaone.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
