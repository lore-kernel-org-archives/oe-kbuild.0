Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DE2215787
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Jun 2025 13:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750167819; cv=none; b=Eh++Xrzp2BVokRxA1yxW6LH7Kdz7WX+NlirN4OFVsBJHJGB0cGJtYH5ipTZf91p5w2oGnfvz1eQAV/H9xl5hV3WS6X2MV+jbuUlAvHrxQ7uFh/yURj42ZhO3SXDOKFAupTMH/ZDyReI9Uvp34JeAeHnigAD378uKO1tnFfFuoB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750167819; c=relaxed/simple;
	bh=3pLg8eIjhwvc92KPg3vT8rlkp/cc58kzTxjhTyJbnQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CIEnVLgVPUZsyWIUuoInY+BjfLoDWSd3Q2deS06rWfx6x7s4GOeLtIsjWWT0bmJ+jo1tlonDvn55xbWO/3yQryc0U3BYDxqxLnhLmnp776jNPDZKJrbtP+SDAtPN5PN7olmbFjTHB6+4BQpKO7FF5+ubIYBbZxLctn2R1M+N2wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSgvHG2h; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSgvHG2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750167817; x=1781703817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3pLg8eIjhwvc92KPg3vT8rlkp/cc58kzTxjhTyJbnQg=;
  b=VSgvHG2hR/XzRvL1E7rG9/RUL3Vu72nfTw52OWu9f7QE08ofDtJUaaJa
   EnU48rDxEy5r6ojQY30uL7YOD5uu7YjLSFPvfOjxm4dYAL630hiqjAznD
   9cz3P2bsEXy0xmB/IusOJpIPKJS8yVg+30YozDXtpuqMNZBwJ9um+8dd6
   bT1xzJsNAzV29zExw7m1VSONNxRYg1RLs+5TRlLAWDb3EgRD7buqQcDoO
   jWzPfpj4HqtmD/RaeeISZlQu7qa7wRI6IOwgRVGvTqUxS849T5djRP5bH
   6Ph7RrDtysdz9cLa3z43UEEh38zpJTpB7//BFDFwkWdUvVJLWVJWefUCK
   Q==;
X-CSE-ConnectionGUID: fEXQqNUpT4iEXJneyBl4Bw==
X-CSE-MsgGUID: gB9KJhlYSdeWnDfXEQmg9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="56155287"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="56155287"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 06:43:37 -0700
X-CSE-ConnectionGUID: NCxLczzVQoeGSkkLoIp7kA==
X-CSE-MsgGUID: JwijMJiJS4muQKmqAxkxZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="148773950"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jun 2025 06:43:36 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRWb7-000G2U-1H;
	Tue, 17 Jun 2025 13:43:33 +0000
Date: Tue, 17 Jun 2025 21:42:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 6/9] arm64: dts: freescale: add i.MX91 11x11 EVK basic
 support
Message-ID: <202506172147.kFG0HS69-lkp@intel.com>
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
In-Reply-To: <20250613100255.2131800-7-joy.zou@nxp.com>
References: <20250613100255.2131800-7-joy.zou@nxp.com>
TO: Joy Zou <joy.zou@nxp.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: shawnguo@kernel.org
TO: s.hauer@pengutronix.de
TO: catalin.marinas@arm.com
TO: will@kernel.org
TO: andrew+netdev@lunn.ch
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: mcoquelin.stm32@gmail.com
TO: alexandre.torgue@foss.st.com
TO: ulf.hansson@linaro.org
TO: richardcochran@gmail.com
TO: kernel@pengutronix.de
TO: festevam@gmail.com
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: netdev@vger.kernel.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: linux-pm@vger.kernel.org
CC: frank.li@nxp.com
CC: ye.li@nxp.com
CC: ping.bai@nxp.com
CC: peng.fan@nxp.com
CC: aisheng.dong@nxp.com

Hi Joy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on robh/for-next arm64/for-next/core linus/master v6.16-rc2 next-20250617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joy-Zou/dt-bindings-arm-fsl-add-i-MX91-11x11-evk-board/20250613-181010
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20250613100255.2131800-7-joy.zou%40nxp.com
patch subject: [PATCH v5 6/9] arm64: dts: freescale: add i.MX91 11x11 EVK basic support
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20250617 (https://download.01.org/0day-ci/archive/20250617/202506172147.kFG0HS69-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506172147.kFG0HS69-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506172147.kFG0HS69-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts:337.10-348.6: Warning (graph_child_address): /soc@0/bus@42000000/i2c@42530000/tcpc@50/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts:371.10-382.6: Warning (graph_child_address): /soc@0/bus@42000000/i2c@42530000/tcpc@51/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: /soc@0/bus@44000000/thermal-sensor@44482000: failed to match any schema with compatible: ['fsl,imx91-tmu']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
