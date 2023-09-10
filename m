Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D64D8469
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Sep 2023 20:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694376801; x=1725912801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n5z/uZQWX9xZckXzzwElivqAMYsH0z/wGkGPVygg2us=;
  b=IfGesC4+zqueFvAyscpZpBcvUkqy5uZwCpAeqeT/r1SYJBbeW8l0oPEs
   26f8LkKiJGZufsjRb/sOoDzdzX3dhL067OhQ2ZIZNnFgUV5h5xGZW7QbA
   zHrhNkfORdOr9YWuHHTO2/to0toEwkmRIIe4KG1mBkTV1US3WW+nxtudS
   jrrF6tmhU21jIm5aPVH2934P9KerUJSlbNIgtUT229a81MJgAR3jAPeQt
   nNIl1jY6tHE/SH49PKniYyJFtn+3oWRrl8XcVImQwcHQlVtG1J+H8erWC
   Ha6c73uh8PuPoX0CRIXNefYFuZ0DzIzeaIpf84wZvvOFCx+VHc7REuZFq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="376829595"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="376829595"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 13:13:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="1073888598"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="1073888598"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Sep 2023 13:13:19 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfQo1-0005M4-29;
	Sun, 10 Sep 2023 20:13:17 +0000
Date: Mon, 11 Sep 2023 04:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ardb:arm64-lpa2-v4 60/61] checkpatch: ERROR: inline keyword should
 sit between storage class and type
Message-ID: <202309110408.KvmMazDx-lkp@intel.com>
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
CC: Kees Cook <keescook@chromium.org>
INFO skip CC for checkpatch warnings

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-lpa2-v4
head:   db76e5bf51cf1c2567eb2072035e29976d47b642
commit: f6057ceb6fd2e1c41da233e17f3e267b5e6ab63d [60/61] arm64: mm: add support for WXN memory translation attribute
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230911/202309110408.KvmMazDx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309110408.KvmMazDx-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR: inline keyword should sit between storage class and type
#225: arch/arm64/kernel/pi/map_kernel.c:136:
+static void noinline __section(".idmap.text") disable_wxn(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
