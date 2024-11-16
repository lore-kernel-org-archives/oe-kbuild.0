Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FCA2942A
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Nov 2024 14:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731768575; cv=none; b=n7UOfqXoFHH0d3ILqm8n7jq+ZFGOinM2MU/MvFhvIAn4O0gRlS5hZQzLBtPuKt/iIDaXpH2SUCMOt7UuodcwO3YDMyWbCftWXxUGWbdVHsFVYTYXghoxe6WOGbLA+74+fMh/8s1g5VtLa5aFvB06fPtbBIA76xUDi/h86M5NeQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731768575; c=relaxed/simple;
	bh=jFTlQuj74uyCTTuprAWVv1+yoHW+GdQzhUayTX6Xz0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aQvkplWN+7KTvErELz0f3LWn5OHWiC+m5ghi4trxzVv3s5Be/zIUuAyyGf8vyQiVsNXTIJH0OhEC/m3glL99zpbkIc2IXOpiFlP/37CTwbqSj4X6vVfidiXTrvF/B/h9E19919/TnqL3BD9B3ORtjdbK+XxvrJnAc5Ujlcr44qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KA5EFNMy; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KA5EFNMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731768573; x=1763304573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jFTlQuj74uyCTTuprAWVv1+yoHW+GdQzhUayTX6Xz0c=;
  b=KA5EFNMy5i5TEvYg2N/dQeacUFOEm5PpQLr9kIgg0raKzhOa4xw6CwHl
   aYXQSY2Gb64qqIEZOSmtOvwvp446j4zc5vmyQsaeejUqcwVHko7lqyIND
   0E0pL9RPa0H/Pu1ZgtsClZM5o0unfi2KEZ/P3L5Arw5FBQyGKtJEaXRyO
   BpnMKrpa4K+76f9Kj/QhOdIGLBhHBumO7ToDyFwdTzIwhHcaulMD3PHhx
   F6iBetf7YZnb3BHVAp1iT6EskmWUIX9DSW4mYucjiwQduqF7E5Kigk1aR
   oCkB1A7sLolNB62OK3DoSjgh7AFTO5QaQK/yZhH9I+NzOrTuucvrxN94U
   w==;
X-CSE-ConnectionGUID: fKJwuTn8SZO3OvUQqkEYVw==
X-CSE-MsgGUID: R0v5XXMmRa6AfU/olH3v5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="42294838"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="42294838"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 06:49:31 -0800
X-CSE-ConnectionGUID: rMiPL+2VSWKiVZmvIvJapg==
X-CSE-MsgGUID: qIOEPwTRQlKbTzNGCxXvVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="89209808"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Nov 2024 06:49:30 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCK76-0000hB-1B;
	Sat, 16 Nov 2024 14:49:28 +0000
Date: Sat, 16 Nov 2024 22:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/ralink/rt3052_eval.dtb: usb@101c0000: Unevaluated
 properties are not allowed ('compatible' was unexpected)
Message-ID: <202411161046.XOLtnTbA-lkp@intel.com>
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
head:   cfaaa7d010d1fc58f9717fcc8591201e741d2d49
commit: b38aa697bcdc6529a912c18ddd093b1329b3d8b1 dt-bindings: usb: dwc2: switch to unevaluatedProperties
date:   5 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 5 months ago
config: mips-randconfig-051-20241116 (https://download.01.org/0day-ci/archive/20241116/202411161046.XOLtnTbA-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.11
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241116/202411161046.XOLtnTbA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411161046.XOLtnTbA-lkp@intel.com/

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
