Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AD3111B0
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Aug 2023 14:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692108238; x=1723644238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Z+jtwVKUkm+O4jrk1r3o+5QE/JXuctt6xgpS1yRTh4=;
  b=A3gVvMsMU1ZnjQ9imyPikUIZZfhxPObbXBzmFY6gNxo1hQtlyqc/5Sv/
   hpLkkDEvEOf7SbZZrnQhmQtP8jzgVKW5/89+ckeHr1/Yf2ED8iSTEttMu
   7IhZ9Noak6Iot9TIpHBtFLk9Iy1HmKnAb7BW+nDaBXiO8+Mzv43PE0ZLj
   hOhjbO1CqjnBAJBzFo46ff7g0B4mo1kZ06Iajj/VjhaHMIH2CfJLKZPW6
   nWOrEDxFk0gtEV/iZqP+i0mnKcQPStyGMfF3vcOMaBpp8aQUsQeHwtJ36
   S7A8Drcj3SFGpgzS9HEfgGGUOv48+321xruWwfaKyVja85hUdC4wyGokZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436174296"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="436174296"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 07:03:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="877341715"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2023 07:03:14 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVudZ-00010l-3C;
	Tue, 15 Aug 2023 14:03:09 +0000
Date: Tue, 15 Aug 2023 22:03:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [mcgrof-next:large-block-20230806-nobdev-hacks 28/38]
 mm/readahead.c:386:18-20: WARNING opportunity for min()
Message-ID: <202308152229.kwjZWouf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Luis Chamberlain <mcgrof@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230806-nobdev-hacks
head:   1bbfc68d17806f44123a1ea283cf7c2f505533cb
commit: ae5ab921a075272a97e76862b844c8c96e5f6250 [28/38] mm/readahead.c: adjust readahead window to account for min order
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: sh-randconfig-r053-20230815 (https://download.01.org/0day-ci/archive/20230815/202308152229.kwjZWouf-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308152229.kwjZWouf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308152229.kwjZWouf-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/readahead.c:386:18-20: WARNING opportunity for min()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
