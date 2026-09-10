Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2B349E12C
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Sep 2026 22:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789081185; cv=none; b=tVw2lj/Mo1hgGJCPpfgYnKxWXHxURB9Jmf05iK8SBmDx3Pd/jj29YujguQ5IiRPZW3anX+WxPbnoz6qMsaVFZ7be1cUapvcoBmZj5vdup6QgjgLG+g092hyPBC1+9mdtEK8nBgpdm+Fc7+c0Efskj5SUXLhsactDWCIO7dNDErw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789081185; c=relaxed/simple;
	bh=arllPB13JhTxSEf5hEW7HDwxtboataN6m7lL/Or4QBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IR2JHw/wFqT1sHUbhmT90KDwYFpz+7opQNSZPu5lLg7joMMu+gVTy0fWA1mcDuThGaNerRwAK5JNFUOziF8s+uOadnGucr/beZGCYmGZ07ybqY31sffbyQk1HaUQ/u4ejr5Dnfh4DdQVxEV1VEES3L1/u2vtbNRRhPGh9uSyxNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnxUh3VX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnxUh3VX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789081183; x=1820617183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=arllPB13JhTxSEf5hEW7HDwxtboataN6m7lL/Or4QBg=;
  b=VnxUh3VXp05f0sTHm8bKNTj3mayWyv2c20oEAoKKPiXl6RYYvOs308pE
   ZxgGoVHP9I/Y5Jt6/UIYVApUCrg5tL1/DtY+28zO1bqxovmk5DluMoCM/
   hqW1AEdwddvSLR8qxGFui0nLO2Kc2FhabM09gUwkLXfM3vU2dG8aTyCA4
   UeaEsAkka6wHxVcQqf3Wowv+aBTC0jW8+6IwGEIWGdWKeXF4p72ftF9XB
   DZarsumM8wDnXbhxwKKxHJMv9OUWkuXXfYNNHzl4kDL8l4N7PH1ByCp/I
   iw00n9O45gXnOlmLTsYzEy58UjlZfSIZ58vvzGNFtPnaMs6ERbpPlvOd1
   w==;
X-CSE-ConnectionGUID: Ono90DpYR/2IgKy/cHWrRg==
X-CSE-MsgGUID: FJJCknulQGy8ng4ZX5wD/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89574177"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89574177"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 15:59:42 -0700
X-CSE-ConnectionGUID: FEI94Rx3RySdFsgV6lSaEA==
X-CSE-MsgGUID: E9AtpKxFQ1i8ZzS7VcEgmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="271741640"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 10 Sep 2026 15:59:42 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4nk3-000000000WV-1wJX;
	Thu, 10 Sep 2026 22:59:39 +0000
Date: Fri, 11 Sep 2026 00:58:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm: sunplus: add Tibbo LTPP3G2 board support;
 update defconfig
Message-ID: <202609110010.imLkdJ1s-lkp@intel.com>
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
In-Reply-To: <20260902104545.67794-3-ag@ffroot.co.za>
References: <20260902104545.67794-3-ag@ffroot.co.za>
TO: Andrew Gaylard <ag@ffroot.co.za>
TO: qinjian@cqplus1.com
TO: linux-arm-kernel@lists.infradead.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: linux@armlinux.org.uk
CC: devicetree@vger.kernel.org
CC: Andrew Gaylard <ag@ffroot.co.za>

Hi Andrew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on arm/for-next arm/fixes arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next soc/for-next linus/master shawnguo/for-next v7.3-rc2 next-20260909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Gaylard/arm-dts-sunplus-add-peripheral-device-nodes-to-sp7021-dtsi/20260902-124544
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260902104545.67794-3-ag%40ffroot.co.za
patch subject: [PATCH 2/2] arm: sunplus: add Tibbo LTPP3G2 board support; update defconfig
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm-randconfig-2053-20260907 (https://download.01.org/0day-ci/archive/20260911/202609110010.imLkdJ1s-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110010.imLkdJ1s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609110010.imLkdJ1s-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/sunplus/sunplus-sp7021-demo-v3.dtb: otp@af00 (sunplus,sp7021-ocotp): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/sunplus,sp7021-ocotp.yaml
>> arch/arm/boot/dts/sunplus/sunplus-sp7021-demo-v3.dtb: ethernet@108000 (sunplus,sp7021-emac): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/sunplus,sp7021-emac.yaml
>> arch/arm/boot/dts/sunplus/sunplus-sp7021-demo-v3.dtb: ethernet@108000 (sunplus,sp7021-emac): clocks: [[4, 61], [4, 67], [4, 66], [4, 68]] is too long
   	from schema $id: http://devicetree.org/schemas/net/sunplus,sp7021-emac.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
