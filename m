Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE8418BBB9
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 03:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754537381; cv=none; b=N92kY+HxPZwSRMGyobLSUeduQ6gbAiKdFm1KDvMSJALB8pYY1DkURaRn6VCQjo74RfHg0LgAPooKDMKmbWpoQxsTuXCs+VTfgH1g1+DIERteBi+cmHPDM5EM0PEXPlZHiiwzsKWpecNVV824640Z/ZPHn5igEi4KpcM8Wqzw9aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754537381; c=relaxed/simple;
	bh=t9s+cP5VaMXiG238zRAmS4ukgT3R6SqgABEtOGg5rB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z+W3qALoQ3Pg15921P9QAWKtReCFn+GGr5ToJdK4w1+X2ElI5HYMzqz6bI1Lopihc9NOqFHhdkHSyerH+Jb11OUz2DGQOuacrYzJtQrH83wi1B6n9Eyyfnit2AC5jOSS9/Ri0OgYw47hVhPIQOS/B4lgdtUvI9V1EMO6f+M+rD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iT8UhByA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iT8UhByA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754537380; x=1786073380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t9s+cP5VaMXiG238zRAmS4ukgT3R6SqgABEtOGg5rB4=;
  b=iT8UhByAMenUtqEVPxTfp7BUHxF1iF7v6j1G1bPkP6w5Jgg96v/tctzq
   SItioKmSOvExJQI21Nt8oxKBvqB2TUZgoXduSaiHswwlKUM5WCNOLcy9X
   jeAeb/ETzmHnqWs6ywfgQlCVRj8nTdb0hQrooDwMA3/MG+5aWWgf7/PH+
   cDcjzCDhNay+fxVgDnbYFM9rfdSGPRbL6z77fSK1LkvUB3ZHg1xQm5FjK
   YOBOHMXob1GnWNM1+KVSN8o77iu0pFGC9TMQYzApIyoqKadF6W5mqjpqa
   RfrwgLMgnP2w1Vu46Mv2RWlCmANGLPNqH6wSsvbiB7RexSoO+BbJ8SRwd
   Q==;
X-CSE-ConnectionGUID: mEHCY+zCSTGAOk4BRKsxUQ==
X-CSE-MsgGUID: uWL10kPrRG2LGuuDldS29g==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56941611"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56941611"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 20:29:39 -0700
X-CSE-ConnectionGUID: wr5/vfkDSSuUMf335dn2zg==
X-CSE-MsgGUID: 0PXqWxBERoisM5V1mXv7zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="195926447"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 06 Aug 2025 20:29:38 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujrJv-0002Ks-30;
	Thu, 07 Aug 2025 03:29:35 +0000
Date: Thu, 7 Aug 2025 11:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:vsrv 3/7] arch/riscv/boot/dts/vlsi/vsrvse01-catboard.dtb:
 /soc/ethernet@17000000: failed to match any schema with compatible:
 ['vlsi,vsrves01-mac']
Message-ID: <202508071101.du9Z4BDe-lkp@intel.com>
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
TO: Emil Renner Berthing <kernel@esmil.dk>

tree:   https://github.com/esmil/linux vsrv
head:   667b581295c8391a1198783c5473eec7cc9c564a
commit: 9a23110a7f2a221521e6c8b176cad7af3c7442db [3/7] riscv: Add VLSI CAT Board device tree
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: riscv-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071101.du9Z4BDe-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071101.du9Z4BDe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508071101.du9Z4BDe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/vlsi/vsrvse01-catboard.dtb: /soc/interrupt-controller@10000000: failed to match any schema with compatible: ['xlnx,xps-intc-1.00.a']
>> arch/riscv/boot/dts/vlsi/vsrvse01-catboard.dtb: /soc/ethernet@17000000: failed to match any schema with compatible: ['vlsi,vsrves01-mac']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
