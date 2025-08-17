Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B5B7081F
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Aug 2025 08:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755419640; cv=none; b=Ah4C3xxFfBgUxAROe8D429CzVH7v2GFL0cx9QqJyZ5ylcNWu8iMzUDMlLqvkBciXzF7Z5rFWrbVPyKWsacLOGGXPjKgolGc5JB0DK+VhbJ1McO8mfWJD2NEaMEQyZxGxaWc34bRzRUBNR9QVrYiUmzUuNHLw3BhMj7ltamijyeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755419640; c=relaxed/simple;
	bh=ZlMsx2FcGulyIyLUxQQPXqUVdEr4VcS6Ucki96Ch71U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nh05lW9r5fR+/SYafqL7G0/rMWvsm0nJtUo8qZGVpYoOdLjy68glnNAkEMqlOUC3OtlxzggN2NEuqwAgZ8AWOqvn9Y1rrM3gRE1c9ViRd3mtu2TnLE9jfQi40gd2a31xk1UEflC5Z+TNyR4DDN2A5SCPStd/o2I1UXzodtl1wh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4rn03nk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4rn03nk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755419638; x=1786955638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZlMsx2FcGulyIyLUxQQPXqUVdEr4VcS6Ucki96Ch71U=;
  b=a4rn03nk38ALtci3dRrncXOh3GaE7rJiHvsArAgrayycGEPSPg/8wu2/
   VOqkYnRMvZfw2w+aas7ZW3raOSxL4+Z41xixyVrSwlB6uYYJy1Hn0Dvjx
   X9P77Rf34YLK9y1u4ulinNr/hnd0Ja9+GgSW4/nVNppgwbUkXI5+FMhIl
   CDJwZWgo5PHb06SzAhYSI2HE+y4n1ml1RCNrFh5hIsSSzdp7ohqktxXIH
   HKbcRaWo4kjuOK9iGPZGe+9/Ws/3BOKaCR+Bdi5zgE8sCdVDU7PHvH91G
   TrQz8jBzGc8Dd+umeYAJfBsdPu1Ps7dU8i4dElV8tic1CKAPbQB/iUCUD
   Q==;
X-CSE-ConnectionGUID: v0OkefEzSCKcL0ZpLHx1Tg==
X-CSE-MsgGUID: 64nZqhh2TV2p7fPF6Vl+QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57388969"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57388969"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 01:33:57 -0700
X-CSE-ConnectionGUID: eAbOqavKQqmdn2jOmNvP1w==
X-CSE-MsgGUID: 82mp6bv+QNyYdd4zvxDiRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="172551204"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 17 Aug 2025 01:33:55 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unYpt-000DQd-0t;
	Sun, 17 Aug 2025 08:33:53 +0000
Date: Sun, 17 Aug 2025 16:33:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: s32g: Add device tree information for
 the OCOTP driver
Message-ID: <202508171655.xtAenNxa-lkp@intel.com>
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
In-Reply-To: <9b3874c6aedf87f78cc6438fe840433162b06445.1755341000.git.dan.carpenter@linaro.org>
References: <9b3874c6aedf87f78cc6438fe840433162b06445.1755341000.git.dan.carpenter@linaro.org>
TO: Dan Carpenter <error27@gmail.com>
TO: Chester Lin <chester62515@gmail.com>
CC: Matthias Brugger <mbrugger@suse.com>
CC: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
CC: NXP S32 Linux Team <s32@nxp.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Fabio Estevam <festevam@gmail.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: imx@lists.linux.dev
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linaro-s32@linaro.org
CC: Srinivas Kandagatla <srini@kernel.org>

Hi Dan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ciprian-Costea/dt-bindings-nvmem-Add-the-nxp-s32g-ocotp-yaml-file/20250816-185123
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/9b3874c6aedf87f78cc6438fe840433162b06445.1755341000.git.dan.carpenter%40linaro.org
patch subject: [PATCH 3/3] arm64: dts: s32g: Add device tree information for the OCOTP driver
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-051-20250817 (https://download.01.org/0day-ci/archive/20250817/202508171655.xtAenNxa-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250817/202508171655.xtAenNxa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508171655.xtAenNxa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: /soc@0/spi@401d4000: failed to match any schema with compatible: ['nxp,s32g2-dspi']
   arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: /soc@0/spi@401d8000: failed to match any schema with compatible: ['nxp,s32g2-dspi']
   arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: /soc@0/spi@401dc000: failed to match any schema with compatible: ['nxp,s32g2-dspi']
   arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: /soc@0/spi@402c8000: failed to match any schema with compatible: ['nxp,s32g2-dspi']
   arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: /soc@0/spi@402cc000: failed to match any schema with compatible: ['nxp,s32g2-dspi']
   arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: /soc@0/spi@402d0000: failed to match any schema with compatible: ['nxp,s32g2-dspi']
>> arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: ocotp@400a4000 (nxp,s32g2-ocotp): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nxp,s32g2-ocotp'] is too short
   	'nxp,s32g2-ocotp' is not one of ['nxp,s32g3-ocotp', 'nxp,s32r45-ocotp']
   	from schema $id: http://devicetree.org/schemas/nvmem/nxp,s32g-ocotp-nvmem.yaml#
>> arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: ocotp@400a4000 (nxp,s32g2-ocotp): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/nxp,s32g-ocotp-nvmem.yaml#
--
   arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: /soc@0/spi@401d4000: failed to match any schema with compatible: ['nxp,s32g2-dspi']
   arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: /soc@0/spi@401d8000: failed to match any schema with compatible: ['nxp,s32g2-dspi']
   arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: /soc@0/spi@401dc000: failed to match any schema with compatible: ['nxp,s32g2-dspi']
   arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: /soc@0/spi@402c8000: failed to match any schema with compatible: ['nxp,s32g2-dspi']
   arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: /soc@0/spi@402cc000: failed to match any schema with compatible: ['nxp,s32g2-dspi']
   arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: /soc@0/spi@402d0000: failed to match any schema with compatible: ['nxp,s32g2-dspi']
>> arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: ocotp@400a4000 (nxp,s32g2-ocotp): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nxp,s32g2-ocotp'] is too short
   	'nxp,s32g2-ocotp' is not one of ['nxp,s32g3-ocotp', 'nxp,s32r45-ocotp']
   	from schema $id: http://devicetree.org/schemas/nvmem/nxp,s32g-ocotp-nvmem.yaml#
>> arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: ocotp@400a4000 (nxp,s32g2-ocotp): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/nxp,s32g-ocotp-nvmem.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
