Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7036B134D4
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Dec 2024 01:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735609100; cv=none; b=RX3Khxah0hL+o4fylnfzKVE6dFWfTvW+eXo33dcTmcEJ/NyneKgagW0zIo/+Un9Gr0yXE8CatNTwpE17x0dZu+jopPhj/b2uJd+YRh7pYxBuPMsMLruGifKwtOqkA/suDVL1k5NvVO9PInBmoWD58+QU/PBp6Ocald7rHGVfFcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735609100; c=relaxed/simple;
	bh=Jv5vz2QIpj4bGt2BZFwVTNUh56f+tFwXy70gAnVLP5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jAqMRmL79Xtb2BGtfEudR3POuPe3ZRV3RQEwXvHGG43EION/9ba2nIFX619KVRKN1ZsqjNA8zPf5bRRuUl0kR3BZpWRsLD/RLPYO3bQNJNOOAu2Dd0U3kLUGVqEj7dojbNB6NQbCkpt1nM1mhdZU6iW/cPwBcJgYTGY4KSpUhH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aztZ5jnv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aztZ5jnv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735609097; x=1767145097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jv5vz2QIpj4bGt2BZFwVTNUh56f+tFwXy70gAnVLP5A=;
  b=aztZ5jnvBGZyPt8LUbtbf26ZlsylfWWpef9MrT/Ui5w6QOJOhV0/DiLU
   h7KbUEjmrL3IQiXFOcNHgj7y8FIqEmv5FiYx2P8onvE3wA3M65x7J+IGZ
   xIEJXH0asriaoq6QpLmlG7CJil6QrftM9KruMJptnlw8tst47tUyhX0+o
   UkX2MoSFXZn3hUdFNOrwkYFZzrX/wzc/VJ7d72IhHNxoAeT4uP90r62gz
   accvYtIh7NEvSwuPOoDxJeg1cV0VWoXMLYJlFzf88nxcrEHK76SbxO7ZI
   9NVGpCyl35JZsRlb6e7IiKmGUWINzAjwYKIilkF0bpYvqMSl9AKhl2Y65
   w==;
X-CSE-ConnectionGUID: ZTCOsFJtTc2aXyrDGrePDA==
X-CSE-MsgGUID: 4/lnGWnaQLqD7i1uY0g+XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="36035062"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="36035062"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 17:38:17 -0800
X-CSE-ConnectionGUID: y4a93SW7RZekvr/pvh9Fgg==
X-CSE-MsgGUID: XnHLRCL6T96QMYWVev5ROQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100757376"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Dec 2024 17:38:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSRD3-0006YW-33;
	Tue, 31 Dec 2024 01:38:13 +0000
Date: Tue, 31 Dec 2024 09:37:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shawnguo:imx/dt64 10/16]
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb:
 /soc@0/bus@44000000/i2c@44350000/pmic@25: failed to match any schema with
 compatible: ['nxp,pca9452']
Message-ID: <202412310933.y5tAcfaE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
TO: Joy Zou <joy.zou@nxp.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/dt64
head:   bd38fa3aaaceb371cf92f115c905579024b9feac
commit: 3fea8d144923857a99f4f22d264cc26008d04969 [10/16] arm64: dts: imx93: add pca9452 support
:::::: branch date: 17 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-051-20241231 (https://download.01.org/0day-ci/archive/20241231/202412310933.y5tAcfaE-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 319b89197348b7cad1215e235bdc7b5ec8f9b72c)
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310933.y5tAcfaE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412310933.y5tAcfaE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: /soc@0/bus@44000000/i2c@44350000/pmic@25: failed to match any schema with compatible: ['nxp,pca9452']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
