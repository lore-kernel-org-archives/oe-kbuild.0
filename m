Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134D835979
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Apr 2026 23:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777590449; cv=none; b=K1XYi30ChR060pYoyZWBe1L4g5yPJ47JiESLnz/Nw00EuTNyFkapbl0XGSFVRF/eOzCBJ95lYfOIixm1Mxsovm+kQRP/1uTyJcOzo7Ho9jXbGrJKyTwrwRx49ZLQfE8ef6IFY0VRNVrKt4MWnbFLQNQQEylVz5OFivpY4xuPFAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777590449; c=relaxed/simple;
	bh=z7TwO0Ci2V0+XWOTFUbt5UxEPVqnJiYxlz+8iF3ZIbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L3fUToKaa0EcVbelqGoX7rfxmXRMTX94mqyZZc2WKhByFcbFQ9OVPvaZzUNPLpwUIRGOfYxSoUAsMLQNvmZUg9ahAjRj6bEWPIwUVxL5Cq4QLvFka7V76yUCd4z8KQ2ii8hNmoOLnSw055unAap1um954jDA9bBXu2sTlTBPZAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eje0R/FE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eje0R/FE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777590447; x=1809126447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z7TwO0Ci2V0+XWOTFUbt5UxEPVqnJiYxlz+8iF3ZIbs=;
  b=eje0R/FE6vq7pCAMyhTPBo/GA53ZUOgFHxoAKufIjPWh7+u5iQdhBikq
   7PIT4O4TSIWjnAxlGGvqOjErnwyz8hpXU/e279/qETJE49d/bkO9OJaVQ
   S4gM7lLn27oua/cKpa5A6Ons+dzxkuk2fy7Qa77HXZ2j5BN4t6TWAYgM7
   HEO/bgOfiW/LoVApmg0hT3KID6LxvuhPoBODboIMKb147uk8BSYRxpC1C
   ZgEk9jfr8JBZan1un9SsQUCwdp7bIUIkpdn95gUiBQlEF/zN7PomP+XSi
   zzCo7M9JYt2hfEutp0TJU9x5Pn/R86tXLy5WESa/hyIq3aKWiJpgG6xGR
   w==;
X-CSE-ConnectionGUID: iWhz8j+IQpSE0V0B6fPNbA==
X-CSE-MsgGUID: bpJw4evnQcWWsd6jttz1QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="66093391"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="66093391"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 16:07:26 -0700
X-CSE-ConnectionGUID: RhqKIO2lQaSdJF6EsETcNQ==
X-CSE-MsgGUID: 1zYENTnPQRaYCp4Dsh6XEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="239043645"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Apr 2026 16:07:25 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIaTb-00000000D4G-0ZEM;
	Thu, 30 Apr 2026 23:07:23 +0000
Date: Fri, 1 May 2026 07:06:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] LoongArch: Specify -m32/-m64 explicitly for 32BIT/64BIT
Message-ID: <202605010656.OcyU0Dmb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260428070658.1740856-1-chenhuacai@loongson.cn>
References: <20260428070658.1740856-1-chenhuacai@loongson.cn>
TO: Huacai Chen <chenhuacai@loongson.cn>
TO: Huacai Chen <chenhuacai@kernel.org>
CC: loongarch@lists.linux.dev
CC: Xuefeng Li <lixuefeng@loongson.cn>
CC: Guo Ren <guoren@kernel.org>
CC: Xuerui Wang <kernel@xen0n.name>
CC: Jiaxun Yang <jiaxun.yang@flygoat.com>
CC: linux-kernel@vger.kernel.org
CC: kernel test robot <lkp@intel.com>

Hi Huacai,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.1-rc1]
[cannot apply to next-20260430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huacai-Chen/LoongArch-Specify-m32-m64-explicitly-for-32BIT-64BIT/20260428-202228
base:   linus/master
patch link:    https://lore.kernel.org/r/20260428070658.1740856-1-chenhuacai%40loongson.cn
patch subject: [PATCH] LoongArch: Specify -m32/-m64 explicitly for 32BIT/64BIT
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-r073-20260501 (https://download.01.org/0day-ci/archive/20260501/202605010656.OcyU0Dmb-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
smatch: v0.5.0-9065-ge9cc34fd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605010656.OcyU0Dmb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605010656.OcyU0Dmb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: unknown target CPU 'la32v1.0'
   note: valid target CPU values are: loongarch64, la464, la664
>> error: unknown target CPU 'la32v1.0'
   note: valid target CPU values are: loongarch64, la464, la664
   make[3]: *** [scripts/Makefile.build:289: scripts/mod/empty.o] Error 1
>> error: unknown target CPU 'la32v1.0'
   note: valid target CPU values are: loongarch64, la464, la664
   make[3]: *** [scripts/Makefile.build:184: scripts/mod/devicetable-offsets.s] Error 1
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1372: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
