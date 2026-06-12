Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378F439184F
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 16:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781282475; cv=none; b=qAmPgTe0y/EMtlkCv1VuqSYhptuAOEBsaWRusFRtDACEHmUCtL7cEmS7ztz06ST6nSHSNmGH6/Hq0z0ZTH5/f8DsrWwu2bGWn0UcRoPkFPLRnIv5HghVWT/sxr4BsMhEhmRsA06mP/a2PmVx4lvOLk/H5ffGAZauHFbHkFvHNCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781282475; c=relaxed/simple;
	bh=XjoBmlPbb3rMbBmDrcUsYM9y9BScIut/d/FMluVFL3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WnSSyWZ1rPpGqfPsOB6OyQDRHmeSm+9DRnMwVlhDaXyOlYEpvyseQW5rBPxYa9tt48mDPae35mbQx+/aH44AdllBM+YWbsLTlW3fRgIIr1yDZMLS67Mj/XOPuTEAWiN2DxQmRc304R57ZegjGQBVUQWApQ3ONdG1opuNHgrY/3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=afYZFdDF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="afYZFdDF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781282473; x=1812818473;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XjoBmlPbb3rMbBmDrcUsYM9y9BScIut/d/FMluVFL3Q=;
  b=afYZFdDFdBRCRoxICK7iuVsVgLfRPfjmOQDS6BvE4hudalsDIilIih/k
   AOQXoCGNJGFTEwq6p5nkO8AujGPSPHnU7fwKQiFVlWmb2ipVy1nYvAT9l
   yMf2bsFcmjNWjIfa/28OoJHuYqfT5zd11UxXCae0Wn+JwNP9w/c4KPZ0H
   vkSEh2FaBt2Ur4YDFk89AyKPcCW4cVkvVRD93H7HKfoGGgU4GUEyeoxsJ
   qv8jYDfk7ETIEDROXIwfn2WCbrS3fdzVtDhkJuLsH5hOq3MTuvRifdrqK
   RCRPnkqksujp2MIxW6TI4xYLiVfw7d3c68sSJFmCo4bvR+n+v3Lo6rxc/
   A==;
X-CSE-ConnectionGUID: MG9PKjEDS+W5YI9fvVxF9w==
X-CSE-MsgGUID: zCWrw74UTPuviof9LJxvRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="93609225"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="93609225"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 09:41:09 -0700
X-CSE-ConnectionGUID: P5kGOAfMSV++j/aiIASHpQ==
X-CSE-MsgGUID: 5k1KZvGdSH2tzQnInh2iDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="246924234"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 12 Jun 2026 09:41:08 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY4wM-000000004Hd-0yrz;
	Fri, 12 Jun 2026 16:41:06 +0000
Date: Fri, 12 Jun 2026 18:40:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/fsl/ge_imp3a.dtb:
 /localbus@fef05000/watchdog@4,800: failed to match any schema with
 compatible: ['ge,imp3a-fpga-wdt', 'gef,fpga-wdt-1.00', 'gef,fpga-wdt']
Message-ID: <202606121833.ywJUGKXv-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
commit: af6850ac9ef3c98e6e8f2929e24ed6fd154fa39e powerpc: p2020: Rename wdt=
@ nodes to watchdog@
date:   7 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 7 months ago
config: powerpc-randconfig-2051-20260611 (https://download.01.org/0day-ci/a=
rchive/20260612/202606121833.ywJUGKXv-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
dtschema: 2026.5.dev10+g5d839523d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260612/202606121833.ywJUGKXv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: af6850ac9ef3 ("powerpc: p2020: Rename wdt@ nodes to watchdog@")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606121833.ywJUGKXv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000: failed to ma=
tch any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: nor@1,0 (ge,imp3a-paged-flash): =
$nodename:0: 'nor@1,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: nor@1,0 (ge,imp3a-paged-flash): =
Unevaluated properties are not allowed ('partition@0', 'partition@7800000' =
were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/nvram@3,0: fa=
iled to match any schema with compatible: ['simtek,stk14ca8']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/fpga@4,0: fai=
led to match any schema with compatible: ['ge,imp3a-fpga-regs']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/pic@4,20: fai=
led to match any schema with compatible: ['ge,imp3a-fpga-pic', 'gef,fpga-pi=
c-1.00']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/pic@4,20: fai=
led to match any schema with compatible: ['ge,imp3a-fpga-pic', 'gef,fpga-pi=
c-1.00']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/gpio@4,400: f=
ailed to match any schema with compatible: ['ge,imp3a-gpio']
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/watchdog@4,80=
0: failed to match any schema with compatible: ['ge,imp3a-fpga-wdt', 'gef,f=
pga-wdt-1.00', 'gef,fpga-wdt']
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/watchdog@4,80=
0: failed to match any schema with compatible: ['ge,imp3a-fpga-wdt', 'gef,f=
pga-wdt-1.00', 'gef,fpga-wdt']
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/watchdog@4,80=
0: failed to match any schema with compatible: ['ge,imp3a-fpga-wdt', 'gef,f=
pga-wdt-1.00', 'gef,fpga-wdt']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/nand@6,0: fai=
led to match any schema with compatible: ['fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/nand@7,0: fai=
led to match any schema with compatible: ['fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000: failed to match a=
ny schema with compatible: ['fsl,p2020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: i2c@3000 (fsl-i2c): compatible: =
'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: i2c@3000 (fsl-i2c): Unevaluated =
properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
