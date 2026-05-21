Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BF372617
	for <oe-kbuild@lists.linux.dev>; Thu, 21 May 2026 20:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779395774; cv=none; b=FhJq59sTllPGed7whRxpAxjxpJ0QGIKYWDEdC+TCUQ1jUy38bWPdFLeupBqNeHixEOHLZFCCq4FsNxYbnoCWejpZXeFXXFFMHSVdlY4M5pK8XCfOu3g/R5KdcsZg083vrU8aAr3AgwgHBGWPOTtsDXwsA7TAQbrFxHtwsVCGFCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779395774; c=relaxed/simple;
	bh=3DEsN/s6ybteOklAnuK5QY2eo99RF6y4hwfAR19HcMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=C7TYDUhFBh70FAR8QrTYv++1wqsV5RlIuyw9Zx6ykJutUavel+j1amZ5L3EJtCA3ZPtURXcCsAoUqa43BvLTi1oORnosyNVDHXIdZuH5P/sAesSPGfo1E0r4F3OKEGPEzW0uGrxPgjNbG0z/fWT8mMoWG2PxkfgvSv17bADJoFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WkHoqYSA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WkHoqYSA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779395773; x=1810931773;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3DEsN/s6ybteOklAnuK5QY2eo99RF6y4hwfAR19HcMs=;
  b=WkHoqYSAhq6RuI58r6jLRXzpBvFQHhIX9vBv0JCXio9R/G8U2SvAP9F+
   wqbeWUK6Tp61FDdos613mOYIKqEBG0kNah+f62170xtryo/RkVkDEEQxV
   ePWwf4OV1LMxM5CQLzFESO9MTmI6j3yDR2f32O9iEfzv2q00UpzfNubt/
   y1A3dpdk1ry4zFhAQsSLZy0mldCREpN8wgDSs39OrOyHVQCUs+ze85VoG
   T9v6/E9vkSpe6RUU1hVpZ2CmlX4UoRzhXJOlxdyGruraYHLtrobmNybbA
   o3eHm8JMTPVSBuqSuFddB3SW/toSDh5Qcn9LdWmxOj51B7Thr8l26fNwI
   A==;
X-CSE-ConnectionGUID: rrjTjT8PQ9qXX4SIl0ewmw==
X-CSE-MsgGUID: 19i5SwpFQbOjknjhwxLrMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="90900258"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="90900258"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 13:36:12 -0700
X-CSE-ConnectionGUID: EjPKwWtQRl6T8zmvnmxxyw==
X-CSE-MsgGUID: aVlRpooXQZCo/ZarvIqdqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="244675228"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 21 May 2026 13:36:11 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQA7k-00000000B4V-1s9p;
	Thu, 21 May 2026 20:36:08 +0000
Date: Thu, 21 May 2026 22:35:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/mpc8313erdb.dtb: timer@500
 (fsl,mpc8313-gtm): 'clock-frequency' is a required property
Message-ID: <202605212248.AAIP3y7S-lkp@intel.com>
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
CC: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   758c807bb943138f887d42d986b645e12446ba9c
commit: eb7bc6920153a7d025c0b0001d5a6462fe08034f dt-bindings: timer: Conver=
t fsl,gtm to YAML
date:   1 year ago
:::::: branch date: 5 hours ago
:::::: commit date: 1 year ago
config: powerpc-randconfig-2051-20260521 (https://download.01.org/0day-ci/a=
rchive/20260521/202605212248.AAIP3y7S-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43=
d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260521/202605212248.AAIP3y7S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: eb7bc6920153 ("dt-bindings: timer: Convert fsl,gtm to YAML")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605212248.AAIP3y7S-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/mpc8313erdb.dtb: ethernet@24000 (gianfar): Unevalu=
ated properties are not allowed ('sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/mpc8313erdb.dtb: ethernet@25000 (gianfar): Unevalu=
ated properties are not allowed ('sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/mpc8313erdb.dtb: serial@4500 (fsl,ns16550): Uneval=
uated properties are not allowed ('cell-index', 'device_type' were unexpect=
ed)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/mpc8313erdb.dtb: serial@4600 (fsl,ns16550): Uneval=
uated properties are not allowed ('cell-index', 'device_type' were unexpect=
ed)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /soc8313@e0000000/power@b00: fail=
ed to match any schema with compatible: ['fsl,mpc8313-pmc', 'fsl,mpc8349-pm=
c']
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /soc8313@e0000000/power@b00: fail=
ed to match any schema with compatible: ['fsl,mpc8313-pmc', 'fsl,mpc8349-pm=
c']
>> arch/powerpc/boot/dts/mpc8313erdb.dtb: timer@500 (fsl,mpc8313-gtm): 'clo=
ck-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/timer/fsl,gtm.yaml
   arch/powerpc/boot/dts/mpc8313erdb.dtb: timer@600 (fsl,mpc8313-gtm): 'clo=
ck-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/timer/fsl,gtm.yaml
   arch/powerpc/boot/dts/mpc8313erdb.dtb: sleep-nexus (simple-bus): $nodena=
me:0: 'sleep-nexus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|so=
c|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/mpc8313erdb.dtb: pci@e0008500 (fsl,mpc8349-pci): U=
nevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/mpc8313erdb.dtb: dma@82a8 (fsl,mpc8313-dma): dma-c=
hannel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8313-dma-channel', 'fsl,elo-dma-channel'] is too long
   	'fsl,mpc8313-dma-channel' is not one of ['fsl,mpc8315-dma-channel', 'fs=
l,mpc8323-dma-channel', 'fsl,mpc8347-dma-channel', 'fsl,mpc8349-dma-channel=
', 'fsl,mpc8360-dma-channel', 'fsl,mpc8377-dma-channel', 'fsl,mpc8378-dma-c=
hannel', 'fsl,mpc8379-dma-channel']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
