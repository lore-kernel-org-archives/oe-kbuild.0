Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77442156EE
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Jan 2024 00:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705797661; cv=none; b=B5NYJHGyzahVoB4ktjyHZrM6AYpMf8wGwaIJZLq85fCYPmcSATc7kduc4nnaAEt2Kv9oe0OCvvz7gXfVH17lLiMLAO8j76IsVMqnMjQPxWpn3/VFGmLsk02X0/Juk1r4SCLVnkHB3B8w2U8zoO0uADO8nHbH0kK+6qHOABz1hl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705797661; c=relaxed/simple;
	bh=CTRYGBcb64U1jdUcWFnGEtC0NX71qReY+4eGuqZaoqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CY8oNyYZE7/iKeNdd1PFlc1zoKN2VfdurM3vQXlNBdSzsWHhbzrgbFnUfzx3gEgy0QOeS3UpZmrDo1lg/E2ySBmKon3yeahf5T/Edzs7sWEAbJbBsTg6wLYGcez2tYuhD2h7a1z5yUUAy26RH0cxEhr1xljAd90s6Qf7JnDVWW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g8z4T/We; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g8z4T/We"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705797659; x=1737333659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CTRYGBcb64U1jdUcWFnGEtC0NX71qReY+4eGuqZaoqA=;
  b=g8z4T/We5rLlOpHS8Hu8+gw3OmrMshOBEleAaQ8zi3HAMAJUboFKpYiM
   gW1qKa0MMVi0nD26T+xVsBwAFy9wF4GFe54Z/MD2sGuMMtkqhRPV2jfiL
   smNzeG09WRWgaLx3oeHHvyy77siWk1oPs7ocZbtwob0pQduBQUCfxf7xK
   xTMcteWtz3xeq1iyEv9lDvdgOfETVnvD7gcjz84DO83NO6pl5T3vgTc0G
   Gmcea6pMGTsHqm6tBr9x89QhIujHRLgs4ARlrm+5nU8AwRtWwa3I0DVTm
   82Sa+cmdWz5pEMFHDkgQVwgM+icBQVlesuiYdl27m4YdJZSsisxP/MZIQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="874953"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="874953"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 16:40:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="904493137"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="904493137"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2024 16:40:57 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRLtP-0005Yo-1Y;
	Sun, 21 Jan 2024 00:40:55 +0000
Date: Sun, 21 Jan 2024 08:40:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/arm32-cfi 2/7] ld.lld: error: undefined symbol:
 ftrace_stub_graph
Message-ID: <202401210856.0896ZDdB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/arm32-cfi
head:   f86148141d17044a48dc056cc4fe3bbcf946d5a5
commit: 5747dede14e284bef1e345fdd628fa22f7d83dbc [2/7] ARM: Support CLANG CFI
:::::: branch date: 35 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-004-20240120 (https://download.01.org/0day-ci/archive/20240121/202401210856.0896ZDdB-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d92ce344bf641e6bb025b41b3f1a77dd25e2b3e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401210856.0896ZDdB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401210856.0896ZDdB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ftrace_stub_graph
   >>> referenced by fgraph.c
   >>>               kernel/trace/fgraph.o:(unregister_ftrace_graph) in archive vmlinux.a
   >>> referenced by fgraph.c
   >>>               kernel/trace/fgraph.o:(ftrace_graph_return) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
