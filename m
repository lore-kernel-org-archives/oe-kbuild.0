Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930B615CE
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jun 2023 11:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687089257; x=1718625257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4YCx40ZOa7QnhU8Nw3QVRRic+B4drItFCt0yZuFyWvg=;
  b=UdR1pjC0IaIvpGVzQLZL317MJwpYrTTsMqPaTxXRHXVmH9pV22VI/Gaz
   eWnfQo33Kh8koodWuHaQQ5cy1a/l5GOJRHHpcN30NvuHII43gj5GzG0yf
   SEaN1pcXq7FhEeNyG4AW0fcaDdzUflytdwC+tNoOfzfOuGlU5Xv7LjRMi
   soHrMFLw27GWzLtWG115gYvXG+797Nf4UiKBCHCmaSFLp5zKhW6UUYWyQ
   ZtjrEY1sY3ZCBJQOcv5vp6M/L5dwMrOkvfKOvnZP6Yn6bK8u1z859fNpO
   ahnuwudAXrXTEI1HjqAduT5y8bvLqXeg3ckIMwhidBBNYGXrQO11kvRw5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="344213552"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="344213552"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 04:54:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="837577022"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="837577022"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 18 Jun 2023 04:54:15 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAqz0-0003gm-39;
	Sun, 18 Jun 2023 11:54:14 +0000
Date: Sun, 18 Jun 2023 19:53:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mcgrof-next:large-block-20230618-hacks 13/45] /usr/bin/ld:
 fops.c:undefined reference to `iomap_file_buffered_write'
Message-ID: <202306181938.ffFgWsGl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "um arch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>
CC: Luis Chamberlain <mcgrof@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230618-hacks
head:   d17988fe31ebdd87d8d375a54d9e94ac79252b03
commit: 3bda730e3543cbce9a2da5a6bae492e592322905 [13/45] block: use iomap for writes to block devices
:::::: branch date: 2 hours ago
:::::: commit date: 3 hours ago
config: um-alldefconfig (https://download.01.org/0day-ci/archive/20230618/202306181938.ffFgWsGl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306181938.ffFgWsGl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306181938.ffFgWsGl-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: block/fops.o: in function `blkdev_write_iter':
   fops.c:(.text+0x10de): undefined reference to `iomap_file_buffered_write'
>> /usr/bin/ld: fops.c:(.text+0x111a): undefined reference to `iomap_file_buffered_write'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
