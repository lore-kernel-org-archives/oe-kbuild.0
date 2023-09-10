Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FFD257E
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Sep 2023 18:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694370557; x=1725906557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tBxkhlivXtygnGP9zGcybaARJJpFulL2u8vDZxK5agE=;
  b=A5We9mfV1pkb1OAIZ73fMhpVGti5QSzmzHY/ny87asrXVUUmGVloc/SQ
   DCM215qmMqWyt6TMzZg/Yj2r8ZzhR1CfZ0RKZtDQ+Qp+nllFTJzqbWlgv
   QSe97hhUmK8PQJCwq4ZfgcS2cwC/qZJYaWTbemU+7Q7/nMxmNXBhYOyWX
   Mjh15CTYva/IYJ2A0TiJBPPIZgTuNvEYsii7MNNn+nL4I8qzvd5ouLnhp
   cbi4BwZ0roIzsNTds3Qr7oJm4a0MQG7MiVnR5ffx/Icr4e9At0Ao+uTpC
   bP4CnM4/Q+XH1OURST9YjOyehaA5UOVuK9B0n2zCdi+wqO1T16zyXn/5Y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="441932681"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="441932681"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 11:29:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="743080661"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="743080661"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Sep 2023 11:29:15 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfPBJ-0005GE-0h;
	Sun, 10 Sep 2023 18:29:13 +0000
Date: Mon, 11 Sep 2023 02:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ardb:arm64-lpa2-v4 49/61] checkpatch: ERROR: inline keyword should
 sit between storage class and type
Message-ID: <202309110235.oBv0hiDl-lkp@intel.com>
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

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-lpa2-v4
head:   db76e5bf51cf1c2567eb2072035e29976d47b642
commit: 53d9aafc237825e552e77757127e4c679f50dc53 [49/61] arm64: Enable LPA2 at boot if supported by the system
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230911/202309110235.oBv0hiDl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309110235.oBv0hiDl-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR: inline keyword should sit between storage class and type
#168: arch/arm64/kernel/pi/map_kernel.c:136:
+static void noinline __section(".idmap.text") set_ttbr0_for_lpa2(u64 ttbr)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
