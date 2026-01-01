Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706AE1885A5
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Jan 2026 22:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767307084; cv=none; b=rBhYCYBGrpq/FODHWBJSg7ZncBvyGYsAekFNXlUx2ayJQCn6A79gONI1KCAiVyBwuHCEVk7YrjEgTdkGfHar/KnPWmH4PXfONKXT3WnaEegD1Mxe8xew0PFE+eLl1bsyI5DyAyA/1FHh/Lp7t6xCD8ObjPRAXQzdImASfb43I+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767307084; c=relaxed/simple;
	bh=1G8zsU3gymWKj7dZm8o5WNQaUgu8kGKbKYdr9RpCdpU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=flRw5o3idhchK3YkodA0inwK/aK5FoqNAUUFljdl9F+zPK7CRfMnhPclgxuEC5WqTe85VmScRLUfUqGA3EG4FH2CVr9c0ZD9Eg3K/1052bhkjtz2LTNKLRpAwt/zCdfR9DkNGybqJRj155gcScQgrDYzzSWI1BM0A9Ns3QLc+3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D5j94z6C; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D5j94z6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767307082; x=1798843082;
  h=date:from:to:cc:subject:message-id;
  bh=1G8zsU3gymWKj7dZm8o5WNQaUgu8kGKbKYdr9RpCdpU=;
  b=D5j94z6CsjicJ+O68uB5nBX1JwaiU96qKox4ae+b64cYDSSOwWlR3rCi
   KZ5fULp7yW0M2omv2t5/sMxMMWQ4Xo/QPMB2vWmH8AQ4VTHdbMUcECqJH
   eVYfEB0s2up0Vq3CE0ZDJQireREldjmEDkvUJ7wtW9S6Ki25rmscxotVA
   WDwY60iUT2Iacwp6FrGc1Q4AXihkq0QAgmo3UIs9IYt3anMIEKb7AHzEr
   lisFjGibE9e2bTUS6BQInHjyQeVnitYazfYNNkjUXeHha9V46uoO/VRaV
   oM7199NJr8xp9b4J3zGXQr47XVPGh2z0cXBD/EOUZbz1e2vSfwuZ1FaMm
   Q==;
X-CSE-ConnectionGUID: LEpLaqUQTeeLMw0/AN3JjA==
X-CSE-MsgGUID: xnXgH4HUThC+aiH+hBbKfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68867622"
X-IronPort-AV: E=Sophos;i="6.21,195,1763452800"; 
   d="scan'208";a="68867622"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 14:38:01 -0800
X-CSE-ConnectionGUID: OgYJI8bgSxSlwLasXbXdKQ==
X-CSE-MsgGUID: n4J8Ql/MTvmYIjwuxgLTog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,195,1763452800"; 
   d="scan'208";a="232801994"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jan 2026 14:38:01 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbRIs-000000000Jp-3LgR;
	Thu, 01 Jan 2026 22:37:58 +0000
Date: Thu, 01 Jan 2026 23:37:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shawnguo:imx/dt64 67/80]
 arch/arm64/boot/dts/freescale/imx943-evk.dtb: /soc/bus@42800000/spi@42b90000:
 failed to match any schema with compatible: ['nxp,imx94-xspi']
Message-ID: <202601012359.tpUeMECa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
TO: Haibo Chen <haibo.chen@nxp.com>
CC: Shawn Guo <shawnguo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/dt64
head:   b4bf5e55899e8c2662a6f0e221128f590ac5f331
commit: c8614121539494c6dad84df074aa5d89e2d845f7 [67/80] arm64: dts: imx94: add xspi device node
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2051-20260101 (https://download.01.org/0day-ci/archive/20260101/202601012359.tpUeMECa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601012359.tpUeMECa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601012359.tpUeMECa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx943-evk.dtb: /soc/bus@42800000/spi@42b90000: failed to match any schema with compatible: ['nxp,imx94-xspi']
>> arch/arm64/boot/dts/freescale/imx943-evk.dtb: /soc/bus@42800000/spi@42be0000: failed to match any schema with compatible: ['nxp,imx94-xspi']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
