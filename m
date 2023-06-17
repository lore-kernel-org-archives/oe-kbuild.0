Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21F41117
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jun 2023 19:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687031091; x=1718567091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cNZ9kMq+M52e3A6iQNRAE6+9ynlJcMJPpuJO1H0Cyv8=;
  b=jgFgIVKscM3RmhTqY+IHKjodYgTDrmaJZUeM2uSfmExrqGg6N0fI3Gee
   Erb+fZtYPKlVbSp/ZFBRA6IrkcrUxQh5dHvw5YSU29ySfg0ypZEGCgKNY
   xqrko2YuOlVHzQ2mrlxXNSSpN1AwsQkgCUNr7YgSwC2bW7YaBy5tWYX5x
   juF9a17bi8b7wdd/Qutbie0L3GSNuv41uXlEFjvCFrSYj2BeB1wnfpBH+
   WN0AOO3+w3kPY4ZO0HX0e0UT9DosUgdYQmZ6UZ/W36veDsC0M4aNwwSYR
   AUrtFygKOmxiCpmo9NB6rRNqJGcsHgXAqwZMd9jBYcBb6DVGmeKnIY0qv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="339755779"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="339755779"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 12:44:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="778528986"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="778528986"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 Jun 2023 12:44:49 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAbqq-00033o-1f;
	Sat, 17 Jun 2023 19:44:48 +0000
Date: Sun, 18 Jun 2023 03:44:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/smb/server/smbacl.c:100:23-24: WARNING opportunity for min()
Message-ID: <202306180302.fiOZ9Q4I-lkp@intel.com>
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
TO: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1b29d271614abd97cc39782daa9d6dd70e98609f
commit: 38c8a9a52082579090e34c033d439ed2cd1a462d smb: move client and server files to common directory fs/smb
date:   3 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
config: arc-randconfig-c034-20230614 (https://download.01.org/0day-ci/archive/20230618/202306180302.fiOZ9Q4I-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180302.fiOZ9Q4I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306180302.fiOZ9Q4I-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/smb/server/smbacl.c:100:23-24: WARNING opportunity for min()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
