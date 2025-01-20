Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0076A7E1
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Jan 2025 03:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737344464; cv=none; b=D8ai3QLdfW3CWzd+/g0SBMTE0JBd2mHWghd6tkvilQCvaEaLmBH4FIX95fYUyK7zevG18c5zCv4NfYo4LjkKNZ+mBsIpl+t92MAgNzVzw7dfMhbcfckZKV8NLWp1mRrKKwwDZEW7oBC5qceQyPKDSPYISIKNOnxVGZUjARxq56c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737344464; c=relaxed/simple;
	bh=whyND9Osw3IR5r2mZ9D/XajupUKypGfq1xVBuOUGxuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u8GAHiXuy9wVH0/hsUukiL/peZosR6xldJSFJeVTv+IZb91GkNdmGUgkp+e1f/yDvW0CVM/NsyB6QyIeqkuQGlTFIh9emLzIgHNLlGOc9ygfJKo1iJeufilAD/fMFzMHzJvfE6TE0EOx2ERhp9XQ1eQp1PJJK9pmgwCtUcnX+qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g8vyhMOM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g8vyhMOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737344462; x=1768880462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=whyND9Osw3IR5r2mZ9D/XajupUKypGfq1xVBuOUGxuc=;
  b=g8vyhMOMLG/lfiUWzpiGauL4yiuxMTSGjXj051ufdOZAvjQwMIOnm45n
   RfsRvY596YdiiScYx7/ap2GsbodSCV+ArXbCSLXM1gqeJGQVv+HN34nML
   /A2Ucp520jzUxFgJJ4nkYRqbi/X6hcvVI1yFJDs3p6BqcV9lgRHRib3LD
   moHQKxcjkVaIv29mplEEVwIiXfP8C0C3qbKeIk1QWFhZcDBzZ09pdPs9Q
   mJCUlVOKvxI0WYK4mdBybIiFtXmBkxH73U5rxo95IWnokfHOlw3wM0a4W
   fq1cAyA/cx6EVTFV3e5M/j05MTnIN4PGZkGF7MNLFIUDkiOINpZQpFWDy
   Q==;
X-CSE-ConnectionGUID: KX/LG5bKT9WVN0LuUPG00w==
X-CSE-MsgGUID: LnrgterJSZ21qaJRrwLwrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37581181"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="37581181"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 19:41:01 -0800
X-CSE-ConnectionGUID: 0h62mZDuTFydCXQYFJpc+g==
X-CSE-MsgGUID: n9TUUgzoSBW91fRnU1Z+/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="106376465"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Jan 2025 19:41:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZieo-000W8g-1G;
	Mon, 20 Jan 2025 03:40:58 +0000
Date: Mon, 20 Jan 2025 11:40:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/ralink/rt3052_eval.dtb: usb@101c0000: Unevaluated
 properties are not allowed ('compatible' was unexpected)
Message-ID: <202501201113.GfAD0YaV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ffd294d346d185b70e28b1a28abe367bbfe53c04
commit: b38aa697bcdc6529a912c18ddd093b1329b3d8b1 dt-bindings: usb: dwc2: switch to unevaluatedProperties
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: mips-randconfig-052-20250120 (https://download.01.org/0day-ci/archive/20250120/202501201113.GfAD0YaV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501201113.GfAD0YaV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501201113.GfAD0YaV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'st,stm32f7-hsotg' was expected
   	'st,stm32mp15-fsotg' was expected
   	'st,stm32mp15-hsotg' was expected
   	'samsung,s3c6400-hsotg' was expected
   	'intel,socfpga-agilex-hsotg' was expected
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: usb@101c0000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: usb@101c0000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
>> arch/mips/boot/dts/ralink/rt3052_eval.dtb: usb@101c0000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: /usb@101c0000: failed to match any schema with compatible: ['ralink,rt3050-usb', 'snps,dwc2']
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: cfi@1f000000: $nodename:0: 'cfi@1f000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
