Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6F07E
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Mar 2023 15:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677942359; x=1709478359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+chufbpV6M+F9K2/xTG+/LomklHECA75rKD4RgCQYdo=;
  b=WWXzUL8En7YV6ploPxnHVUnfC/Ax87+WMKhf4V+1whfFQ1DrnNCuP7Ya
   vpxY4NNh7JbjYrFM+spjpKZuadVehHBNHpBTcQM5VqlbR4I9ckng2+SXf
   8gTa4xWKWiviJtfyv7dciLd2eYY7H8VfUDkDgbuOcKqOIGWa6WQvHJ/Ja
   9xLhftij3lMIu3gh4zWqocpvRAiIrMhEl8KGuDSa/Hz3QGrTHLxijZgXC
   dX5ATGgXOF9fKlGH5An3ii+9Y12+Gvg0unU94+sZKUD/e6kFt+1EjMy9Z
   2kgIEO3UVd/hLWf8qhopcxKeE+rsuvLxsfXXWm/z+W+c2dtDJh+GbWpZi
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="315662509"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="315662509"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 07:05:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="675677390"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="675677390"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Mar 2023 07:05:56 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYTSN-0002EI-1X;
	Sat, 04 Mar 2023 15:05:55 +0000
Date: Sat, 4 Mar 2023 23:05:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djwong-xfs:pptrs-vlookup 16/109]
 fs/xfs/libxfs/xfs_defer.c:846:24-25: WARNING opportunity for swap()
Message-ID: <202303042210.5AhZuT8f-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git pptrs-vlookup
head:   e8343bb4cef3cf7e95f4f36689db67d35a305d02
commit: 283b03908d8ade636f18c86f48cdef00dff0c9ec [16/109] xfs: Increase XFS_DEFER_OPS_NR_INODES to 5
:::::: branch date: 22 hours ago
:::::: commit date: 6 days ago
config: ia64-randconfig-c034-20230302 (https://download.01.org/0day-ci/archive/20230304/202303042210.5AhZuT8f-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202303042210.5AhZuT8f-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/libxfs/xfs_defer.c:846:24-25: WARNING opportunity for swap()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
