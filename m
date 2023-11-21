Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A56D51018
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Nov 2023 23:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+N/xGoE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700609258; x=1732145258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+HrK+xh/g+ijrpANRo08TxXIZJHkD2p/NEq2KXBRGAw=;
  b=T+N/xGoEsXFlOTidVjrio2MjMkbwiaME5PNVe2VnFLYAjzqwuOIWx/gw
   RyFcQ6BcCbB/SrQ3Fe3aDnFwTwdhArLMRczopZihi8uSD8rX7e8lmXsUO
   S3figg/6XfqjtNAWqLpQHLZaFczfXbS9kfpBirMQTZsUcP8H0jtLr4zaV
   lg3TJXC8qBUR3zEpfVgCAszSHpIfOOIU1JLlcaKR9qp3Xb6gCQqEvBqnA
   gnDoWhRhBvd7Y2R+AevHjVOq9QwcJwNiz6K/HDw0UPodt1t3bPphWkzeN
   0vTMocG+fcduF+2Ub2/sHaL6fNnl/kZ0Qxc1ihdtOGryFw0YicSEzfl+P
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="13493310"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="13493310"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 15:27:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="884357696"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="884357696"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 21 Nov 2023 15:27:36 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5a9W-0008OO-1L;
	Tue, 21 Nov 2023 23:27:34 +0000
Date: Wed, 22 Nov 2023 07:27:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-misc:clone3-shadow-stack 6/6] clone3.c:436:13: error:
 redefinition of 'enable_shadow_stack'
Message-ID: <202311220742.p4XRRRV2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git clone3-shadow-stack
head:   d258fafd976a560832c8193aceac1209aa362600
commit: d258fafd976a560832c8193aceac1209aa362600 [6/6] kselftest/clone3: Test shadow stack support
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311220742.p4XRRRV2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311220742.p4XRRRV2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clone3.c:436:13: error: redefinition of 'enable_shadow_stack'
     436 | static void enable_shadow_stack(void)
         |             ^~~~~~~~~~~~~~~~~~~
   clone3.c:426:20: note: previous definition of 'enable_shadow_stack' with type 'void(void)'
     426 | static inline void enable_shadow_stack(void)
         |                    ^~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
