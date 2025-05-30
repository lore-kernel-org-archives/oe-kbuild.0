Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F72A2E628
	for <oe-kbuild@lists.linux.dev>; Fri, 30 May 2025 05:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748583116; cv=none; b=i7SGY5A3YGl+mVCxgaZjQkXzqkuY76Ov9eN8w95pG3IwGRdIErLceoSoVAGJz0EEZD1n2lwBlcSyQuA1fqEDwjpsRyCujYCB4+VL742qAtli7j0169Wdx6XGApnS+eoYVs+jGVhuLME+OHS5ASopudUy0sDqaJPwqkgqQggKaxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748583116; c=relaxed/simple;
	bh=jfGVc7EiZH5/DMB6HFWQtdg+6ocqQ9Mm0v5wgZc5a7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M/X3uIhpLALMyVuZyshAqLphEkWokUmPqvxnXm/xc/qp9RBSP77LspmU+g1ljUl+cytttdPzvoDe9s2SnMflWXWxjlRhTvFKYJCLAohp3ith3zuwKOCqnLQqw9QYmKkIu3jrWsEMoexIyXSfQQtVwcORMTmhk4NKPSKAJ6Dalwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5uASPRk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5uASPRk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748583114; x=1780119114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jfGVc7EiZH5/DMB6HFWQtdg+6ocqQ9Mm0v5wgZc5a7s=;
  b=P5uASPRkE3ypPcuyBFW6LTFdpiOHndmr/exuBEhnt1Hy9ARdBG3A5G6p
   uHfASL37jG7rXR6Cz03O8S/L0h++aQ5N7mO9umUQMgXV3VKqUnrg2eFmd
   CYeXPTI9iNAlFZdVLjOlNFmQUL9T9tDBCS8v4zJj5ayaWykIPwyrNVVUS
   QQ2uWUNLqxo6Ob9dEUh8blzB+1K4yxWZ//2Xu3vAh8uWFHjhBXoTOoijb
   +YxHa6VK20Zvh249KrJzLOwQ6xeqNTjwfghDA2qAmQhOFW/o15gSRHfVc
   Z2dzjSeSaV23zTW1dfh+xRTF56hcLebqvXw8uX35SkY8BgLB9uVMMhfgs
   w==;
X-CSE-ConnectionGUID: dr6vy4r1TIGWdkDo5qJKdQ==
X-CSE-MsgGUID: clbOwCl4Q6uGZp7msGeLng==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="54466076"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="54466076"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 22:31:54 -0700
X-CSE-ConnectionGUID: gidEiYKBS32rcm+YkCZoYA==
X-CSE-MsgGUID: 3SYW4ZyQRiujllMrux1FyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="149048022"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 May 2025 22:31:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKsLA-000XMa-2x;
	Fri, 30 May 2025 05:31:36 +0000
Date: Fri, 30 May 2025 13:31:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arch: arm64: dts: add big-endian property back into
 watchdog node
Message-ID: <202505301320.KRZCLfUq-lkp@intel.com>
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
In-Reply-To: <20250528111751.3505224-1-Meng.Li@windriver.com>
References: <20250528111751.3505224-1-Meng.Li@windriver.com>
TO: Meng Li <Meng.Li@windriver.com>
TO: shawnguo@kernel.org
TO: robh@kernel.org
TO: conor+dt@kernel.org
TO: Frank.Li@nxp.com
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: meng.li@windriver.com

Hi Meng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.15 next-20250529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Meng-Li/arch-arm64-dts-add-big-endian-property-back-into-watchdog-node/20250528-192045
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20250528111751.3505224-1-Meng.Li%40windriver.com
patch subject: [PATCH] arch: arm64: dts: add big-endian property back into watchdog node
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250530 (https://download.01.org/0day-ci/archive/20250530/202505301320.KRZCLfUq-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505301320.KRZCLfUq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505301320.KRZCLfUq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi:17.19-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@1550000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
