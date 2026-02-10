Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF8F336EC9
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 07:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770710192; cv=none; b=BlTDEfIwKB0+y/vj9XF5Sp6Cjuy/w8zdOk7ZF95Q/Mo19V7QP3kCHS4qUZE/davdj/kSRRrlxTBHfBoqf0ErIdMIkG40F5zaxGoZPmHiiQ1EOfggn3h0UXA9J6jCmQyDckXKwSY2I8naAH5R0O2yQE1GaCNjT1/gf1fGnIN1Ih0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770710192; c=relaxed/simple;
	bh=5P05lw7pQErSFx1FtPlEdGytHLyZZGwWp58r7fCR6gw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bbHJdVF/Oyv7FG51HPcUtBOqHxFC/8dz4vIzmSCYGV3jIC1vG0NNXHqvssBeAdcwbjvcbjqUufdIJaciQx3WpeKN1I2pobBIYHokh5loarCy+DGUAOzxIytE0G9jGmOi2vaNxsEap/4TPgUaYjcOFN+VuhFPSEuiTTqUM3OnwRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kTToRlvo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kTToRlvo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770710191; x=1802246191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5P05lw7pQErSFx1FtPlEdGytHLyZZGwWp58r7fCR6gw=;
  b=kTToRlvo4Q60NpQuEbF1xMr9QlMiPcoqRsVVP2tDjUHS98Y6tzXmQSYk
   D8x6PXeO/KLcxYVxD3fXTTkHgy1PIBzYNM4gVIhTvm7CP0eLRYovGACKH
   K8uJnuq53kL2vsAgZVE6zUkO2Vcg/wajRor+I9BX1eikdoBp2+ndh4nAM
   KhwNaDS6tf9gC7REpP/zju9FUFnSIHvszI142GR2FwgLgWYIrcInuZD2M
   YjwUSPNbJKxRYWOXaeskY92/SlMcLIxrP44Hv5HBOYWBGxhjDP60jJIBd
   7It/2+5GY4iSrk0dfsSZhsuJbu83TmxkPblD7WBLZgHh0R3ssQrWeDcf/
   A==;
X-CSE-ConnectionGUID: SPKaiw9LTj+zvRGxR2nxBA==
X-CSE-MsgGUID: lRi4IZ4qR56Jp4vXRGWgjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="74435726"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="74435726"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 23:56:30 -0800
X-CSE-ConnectionGUID: 60XnyagIRhi+YFrA2GI6Wg==
X-CSE-MsgGUID: cTLn4Ro0T8OLla3/VvDgcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211680805"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Feb 2026 23:56:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpibj-00000000onI-2HoA;
	Tue, 10 Feb 2026 07:56:27 +0000
Date: Tue, 10 Feb 2026 15:55:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH v3 1/6] objtool/powerpc: Add build-time fixup of
 alternate feature branch targets
Message-ID: <202602101507.3iIWJO45-lkp@intel.com>
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
In-Reply-To: <20260209084820.57298-2-sv@linux.ibm.com>
References: <20260209084820.57298-2-sv@linux.ibm.com>
TO: Sathvika Vasireddy <sv@linux.ibm.com>

Hi Sathvika,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.19 next-20260209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sathvika-Vasireddy/objtool-powerpc-Add-build-time-fixup-of-alternate-feature-branch-targets/20260209-165156
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20260209084820.57298-2-sv%40linux.ibm.com
patch subject: [RFC PATCH v3 1/6] objtool/powerpc: Add build-time fixup of alternate feature branch targets
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: powerpc-randconfig-002-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101507.3iIWJO45-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101507.3iIWJO45-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602101507.3iIWJO45-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/special.c:289:9: error: variable 'n' set but not used [-Werror,-Wunused-but-set-variable]
     289 |         size_t n = 0;
         |                ^
   1 error generated.
   make[6]: *** [tools/build/Makefile.build:86: tools/objtool/arch/powerpc/special.o] Error 1 shuffle=3996209845
   make[6]: Target '__build' not remade because of errors.
   make[5]: *** [tools/build/Makefile.build:142: arch/powerpc] Error 2 shuffle=3996209845
   make[5]: Target '__build' not remade because of errors.
   make[4]: *** [Makefile:104: tools/objtool/objtool-in.o] Error 2 shuffle=3996209845
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:74: objtool] Error 2 shuffle=3996209845
   make[2]: *** [Makefile:1483: tools/objtool] Error 2 shuffle=3996209845
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3996209845
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3996209845
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
