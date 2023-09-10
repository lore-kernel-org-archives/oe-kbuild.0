Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2163A49
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Sep 2023 20:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694379331; x=1725915331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pfc+H9xRhrG2NObbm+50JaloSHuSmFvKzuOeRLX4Mio=;
  b=Hxe3eMls9gehy/Nt06mTquhScisR4/t6bR+nchCaQqyCbI4w518lN8Up
   oAPvVbUjPXUkFoDn0jTDvyw09ZHWIz6UZjw5Ikpb0lOySXaKr/LQWjimp
   4cEouYvqyK9i2aEeRLYBiifp9l+JpIl29Mq+yjsjKY9aJO+b3KemTX8Zh
   UiCoMgm5fxBB1xs5H3K9fm6quYdOq/xj93jyREuYz8f+g3b6+Gft+DlW3
   pwTmHzxfPNmZQsThDM5PKy9LUR/bTkuPkqdq+v0DFU5dMtjH273trR2GS
   kDoQvIruF6Q8W80yLNBMPQM2eodgrD3lIUa7sV7FNjx3M7IRg4kMqptq8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="362968513"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="362968513"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 13:55:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="916794383"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="916794383"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Sep 2023 13:55:22 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfRSi-0005Oi-1f;
	Sun, 10 Sep 2023 20:55:20 +0000
Date: Mon, 11 Sep 2023 04:55:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ardb:for-kernelci 49/61] checkpatch: ERROR: inline keyword should
 sit between storage class and type
Message-ID: <202309110423.Q59CypuP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "checkpatch"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ard Biesheuvel <ardb@kernel.org>
INFO skip CC for checkpatch warnings

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
head:   db76e5bf51cf1c2567eb2072035e29976d47b642
commit: 53d9aafc237825e552e77757127e4c679f50dc53 [49/61] arm64: Enable LPA2 at boot if supported by the system
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230911/202309110423.Q59CypuP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309110423.Q59CypuP-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR: inline keyword should sit between storage class and type
#168: arch/arm64/kernel/pi/map_kernel.c:136:
+static void noinline __section(".idmap.text") set_ttbr0_for_lpa2(u64 ttbr)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
