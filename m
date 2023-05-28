Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CFC7C
	for <oe-kbuild@lists.linux.dev>; Sun, 28 May 2023 06:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685255878; x=1716791878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fGT9tsvJxYCmZ7PazIwb2E4jInPPGmazzyP/BmD7quE=;
  b=Hh1crt4e6zAdK8ibRCCpuRWOEHb88knMb5odWcvaj7tEzviu7Bgv1Y73
   qef88luwVwjL44GWNEy2X4wWBE0kJZWD61nEzM+EpwNb7dc3CE6ZFccl5
   Bsy2GQvxPINB8ZGA6nUZNp1b/PmuZ6HHta7AH3kJA1N+CpkEfIaHcbypi
   UldxLT7l/aRyDZOIAGNtUDlQ9EFlpKF1E3AOzylU3/R7HyrNrrZNAfEtN
   bLWdNL5UnfHRqCb0BU0h25tQLpfFeoBS3TY2GWjN9Y4+jdI68eVqBoDKm
   WYJ74MaaPPiz2wdmZ+LIACtifen6889ZLOYyET1nqOzNKCD79GJ+i9Vjg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="334844960"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="334844960"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 23:37:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="849993208"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="849993208"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 May 2023 23:37:56 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3A2O-000KTG-0t;
	Sun, 28 May 2023 06:37:56 +0000
Date: Sun, 28 May 2023 14:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/wireless/legacy/ray_cs.c:2115:2-4: WARNING: possible
 condition with no effect (if == else)
Message-ID: <202305281428.rBPZ7Fn1-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Kalle Valo <kvalo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   416839029e3858f61dc7dd346559c03e74ed8380
commit: 298e50ad8eb8fa12ea68bb2da45bb8ef4edcd0ec wifi: move raycs, wl3501 and rndis_wlan to legacy directory
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
config: xtensa-randconfig-c44-20230528 (https://download.01.org/0day-ci/archive/20230528/202305281428.rBPZ7Fn1-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202305281428.rBPZ7Fn1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/legacy/ray_cs.c:2115:2-4: WARNING: possible condition with no effect (if == else)
--
>> drivers/net/wireless/legacy/ray_cs.c:2084:13-14: WARNING opportunity for min()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
