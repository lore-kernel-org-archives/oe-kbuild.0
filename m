Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F3A7E0FF
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Nov 2025 00:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763167259; cv=none; b=YvMlpCUcn5zB66V2sJ7+Xx7NVlZZq8qUTpQV7oUO0QAbubbhZBEWyTkqSoYHY8tyU6SwUwVcP0pynGPKA8A/Zt0Fw/vXThM/qJ1u+Jeuc0MCYwg4Z8p+yFeNRy/lKTE+37+iBW9r11FV2T6fphK1jcsVECZldNm5608ZT/50NpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763167259; c=relaxed/simple;
	bh=T8kppD3GXtSP65VXWJcmS+kU1ZfZoFIuyl60eeAyXgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a7P834Hw53bCh8S4StMdW4vx/fjKt18Mf4wBfURZ7nb/9n0wo+zEeP8MmmsWcG0NJuAWmwkJu3+2wyJ+b7J/zr7VG3kSV1xmBUqX8Er5EUUvs/zoub77bpnk1r2trdrDupQtXbgIOnP05dNJ7+lRVSX0phR6Iv1ZiEwv4HDsXbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHZqlVHB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHZqlVHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763167257; x=1794703257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T8kppD3GXtSP65VXWJcmS+kU1ZfZoFIuyl60eeAyXgU=;
  b=JHZqlVHBnynwA5EiWoHsTUqXAIyw/DlNIa5mRNZrwjPr8RxlO79jNNdj
   /1O6GFC6SqFBduNAPwRZkSk3Je5z6kaEKVADmB58p7n+ch3vbrlAAFZ+a
   xwLW+RI1r9m0SoDWuO7FNYQOKhoKSJH7RUFUBiu7rXLT8nf3i0EA32JcJ
   iDX8c7d81CpEGkTlw7XsGFGdL1wZUCMUob2ypPkYdE1Yje8aLZCtiBDoo
   JCunBUT1vlFTFtl1ZWdtsAZEGbvQnY2lhLFZC/w4wvEj5kG7KHXbsQzDK
   8OUWvvCYsIaPew0R8f8/eRHxzk130Jx7R0ZSW37MVCH+cPk7TIXjRF0O8
   g==;
X-CSE-ConnectionGUID: oVPioJ3DSo6mXr/a+ZAitQ==
X-CSE-MsgGUID: y/sXgXLSQm685ZOvioKT0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65421736"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="65421736"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 16:40:56 -0800
X-CSE-ConnectionGUID: RzzMKlnWRgGMLQrXsMZAhA==
X-CSE-MsgGUID: RMDx+9EySrC4tvXfZbXWng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="189198168"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Nov 2025 16:40:56 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vK4LV-0007Xb-1I;
	Sat, 15 Nov 2025 00:40:53 +0000
Date: Sat, 15 Nov 2025 08:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 27/28] objtool: Improve the disassembly of the pv_ops
 call
Message-ID: <202511150854.iDlHBWI5-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251113164917.2563486-28-alexandre.chartre@oracle.com>
References: <20251113164917.2563486-28-alexandre.chartre@oracle.com>
TO: Alexandre Chartre <alexandre.chartre@oracle.com>
TO: linux-kernel@vger.kernel.org
TO: mingo@kernel.org
TO: jpoimboe@kernel.org
TO: peterz@infradead.org
CC: alexandre.chartre@oracle.com

Hi Alexandre,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.18-rc5]
[cannot apply to next-20251114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Chartre/objtool-Move-disassembly-functions-to-a-separated-file/20251114-020940
base:   linus/master
patch link:    https://lore.kernel.org/r/20251113164917.2563486-28-alexandre.chartre%40oracle.com
patch subject: [PATCH v4 27/28] objtool: Improve the disassembly of the pv_ops call
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: loongarch-randconfig-001-20251115 (https://download.01.org/0day-ci/archive/20251115/202511150854.iDlHBWI5-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511150854.iDlHBWI5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511150854.iDlHBWI5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> disas.c:15:10: fatal error: 'asm/cpufeatures.h' file not found
      15 | #include <asm/cpufeatures.h>
         |          ^~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:85: tools/objtool/disas.o] Error 1 shuffle=3303159566
   make[5]: Target '__build' not remade because of errors.
   make[4]: *** [Makefile:87: tools/objtool/objtool-in.o] Error 2 shuffle=3303159566
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:73: objtool] Error 2 shuffle=3303159566
   make[2]: *** [Makefile:1449: tools/objtool] Error 2 shuffle=3303159566
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3303159566
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3303159566
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
