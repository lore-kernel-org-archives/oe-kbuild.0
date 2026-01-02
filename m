Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AAB1A08BC
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Jan 2026 23:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767397032; cv=none; b=HLHj9JWepVETDIi80v/K9ZdEsYqdA3IzlrYIfanmRRL2BUeuvLKE7UlfDxJEKYujmvIFVk+lhxBx6BSQ6r/OrnECmL0OSAYG9iAMiKQA2TjD967DJZ9Tw9JBePMMrpgPBOySYT+9w8VkV8zapI1cvE2pI+/8XOTAfeZ5g2fpG0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767397032; c=relaxed/simple;
	bh=bKBwFc/soBM1dekxAJ4oZpX4fdxksg7H5AEgIraqZXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UiSi/KBodudmLZOpFCru+9AsdYELpIc+Djeo5d1scgFvU80Ghr8DK45l8pnvpIEsyzotUMFQlDEoDvzgwz0fGeZN5hY65SH13YoDdm5FGle7fuOSQquMTHY5HD3Ck9GULS8fMLNb5yodZ0Ra0guSttissh89c2IZkqK183xWNJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyTzILZx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyTzILZx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767397031; x=1798933031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bKBwFc/soBM1dekxAJ4oZpX4fdxksg7H5AEgIraqZXc=;
  b=fyTzILZxXAToiRtzhfdWxEpBjEfHrev4OqM3l7L+bmNr4oJmG9orKlpz
   2TRoUjRHktj57DNYbeuF3v+5T3LC+feZXlgdD6edjVsvuq8WZwdc7tTwV
   mOHHf6itxc1UgPti+9XK5wGPlQEN93Jcv3I29vtgHQyqKZ9YZxBYCdDyB
   Sh2fPOk1ldMhMxSLSRCNhFMCslc/yFi6Jr6ospdtcEEDpyFIdblDT9RCC
   pxMj6N+2v8fGLyhSr2Vr4x5ZRLJfGDApWPPp1D42H4H354JYBjUxdNTMD
   UVBJQXGrAb4u013egM130RRs4jgiHEe5MWMHB8YvCZRYy+edNtpetyVhf
   A==;
X-CSE-ConnectionGUID: sD6zPMwnQeuFl3EYmOG+WA==
X-CSE-MsgGUID: IFvLevk9T2e/NEQo6E2A3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="80325334"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="80325334"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 15:37:10 -0800
X-CSE-ConnectionGUID: Sa+Ys6l2SXmqU8w+kvsUQA==
X-CSE-MsgGUID: wTdV/ktuSnOlByQauiqh1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="232592516"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 02 Jan 2026 15:37:09 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbohe-000000000U9-3rB7;
	Fri, 02 Jan 2026 23:37:06 +0000
Date: Sat, 3 Jan 2026 00:36:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1] arm64: dts: rockchip: Add USB Type-C support for
 Radxa ZERO 3W
Message-ID: <202601030020.dsPqijIp-lkp@intel.com>
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
In-Reply-To: <20260101083415.1327341-1-sunke@kylinos.cn>
References: <20260101083415.1327341-1-sunke@kylinos.cn>
TO: Ke Sun <sunke@kylinos.cn>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
TO: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: Alvin Sun <sk.alvin.x@gmail.com>
CC: Ke Sun <sunke@kylinos.cn>

Hi Ke,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next linus/master v6.19-rc3 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ke-Sun/arm64-dts-rockchip-Add-USB-Type-C-support-for-Radxa-ZERO-3W/20260101-163608
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20260101083415.1327341-1-sunke%40kylinos.cn
patch subject: [PATCH v1] arm64: dts: rockchip: Add USB Type-C support for Radxa ZERO 3W
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2052-20260102 (https://download.01.org/0day-ci/archive/20260103/202601030020.dsPqijIp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260103/202601030020.dsPqijIp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601030020.dsPqijIp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3w.dtb: fusb302@22 (fcs,fusb302): 'sel-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3w.dtb: fusb302@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
