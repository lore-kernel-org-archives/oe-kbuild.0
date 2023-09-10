Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10741A49
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Sep 2023 20:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694379324; x=1725915324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fGJrOTH4fYFLXMjWNRFrbf3IPnQD5N4Z9xzUrXjDJl4=;
  b=m2jZX8dhEEOjNO0aAqScso+VDnosyImaf/Pzw35wiapztICQx2yKz83y
   TD2AfIUmnklYz+QtdjDoA9MDiID2AV3xKOvIARZHCD2+gdzKbEGJs09gN
   1KhAbfLuioM+hmORGkn4aHOp8+/BoXdmNcRhRi1Pzn/Fb0I2m1qxt8hCH
   A8Ync2X2zL/8U9gVQ74Op3P/3WzdTDWLDNmbUQmSXUdXzR88enBqOtz+k
   dtvy1RyfNnQj3y5kz59V3OC8Jago+PziiQ3agoD4FF6sa4rs6FI/GKvCs
   pDJmXtyDseF9B4F4rESla+B1EcUOb6StQtMJ8vAxWekEh0lROnLMGvJaJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="381744821"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="381744821"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 13:55:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="989847926"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="989847926"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Sep 2023 13:55:22 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfRSi-0005Oa-1B;
	Sun, 10 Sep 2023 20:55:20 +0000
Date: Mon, 11 Sep 2023 04:55:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ardb:for-kernelci 60/61] checkpatch: ERROR: inline keyword should
 sit between storage class and type
Message-ID: <202309110439.yMvmufhF-lkp@intel.com>
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

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
head:   db76e5bf51cf1c2567eb2072035e29976d47b642
commit: f6057ceb6fd2e1c41da233e17f3e267b5e6ab63d [60/61] arm64: mm: add support for WXN memory translation attribute
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230911/202309110439.yMvmufhF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309110439.yMvmufhF-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR: inline keyword should sit between storage class and type
#225: arch/arm64/kernel/pi/map_kernel.c:136:
+static void noinline __section(".idmap.text") disable_wxn(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
