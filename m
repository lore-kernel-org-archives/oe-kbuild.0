Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7127E539B
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Jun 2023 07:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685604803; x=1717140803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KMvN2c2k+8ncE5XL/TDrVVZmOzb7LKKoDnbmkKOwi3w=;
  b=F39NSKjeP7g7xczyM+MtHUrhk5HgkfY9LBStfzAHTM8u6MoETo16d7Ja
   8dWA3uXdf8tnP1T/9x3thMbOAngy+esGxlQ4/M7Q345cwM2Iv3/QPpfKo
   5U9GF41frRrvN9VFHyJkdd+4566AxF+fZ9n1DQEqx+926SAkmHaQ2Cviq
   84VXS8dkd+psw0g9jOtdQ5eI1czQXDTwmO15pf7e546nSixbD/O83Rx2F
   YvyuQmd65H5kYF+Lbrqk27yWOmusdnGvXF+IEqgmGQ4KUtAfat53+PnW/
   NxS/zxa8MqdAcPMhYMjuUBLDPBbfvmQkbYnl80T7hIrQOjdk8w/3eS+NN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="421262772"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="421262772"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 00:33:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="657654517"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="657654517"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Jun 2023 00:33:21 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4coD-00023X-0O;
	Thu, 01 Jun 2023 07:33:21 +0000
Date: Thu, 1 Jun 2023 15:32:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rppt:jitalloc/v0.1 3/15] mm/jitalloc.c:68 jit_alloc_init() warn:
 variable dereferenced before check 'p' (see line 65)
Message-ID: <202306011556.s47JJtQ2-lkp@intel.com>
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
CC: Mike Rapoport <rppt@kernel.org>
TO: "Mike Rapoport (IBM)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git jitalloc/v0.1
head:   ee9292c97c0c221b03b6a12402596b1829dd2bd0
commit: 35563a849dd19012dc61857c76d4ec617e6f6096 [3/15] mm/jitalloc, arch: convert simple overrides of module_alloc to jitalloc
:::::: branch date: 12 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021-20230531 (https://download.01.org/0day-ci/archive/20230601/202306011556.s47JJtQ2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306011556.s47JJtQ2-lkp@intel.com/

smatch warnings:
mm/jitalloc.c:68 jit_alloc_init() warn: variable dereferenced before check 'p' (see line 65)

vim +/p +68 mm/jitalloc.c

35563a849dd190 Mike Rapoport (IBM  2023-05-28  60) 
35563a849dd190 Mike Rapoport (IBM  2023-05-28  61) void jit_alloc_init(void)
35563a849dd190 Mike Rapoport (IBM  2023-05-28  62) {
35563a849dd190 Mike Rapoport (IBM  2023-05-28  63) 	struct jit_alloc_params *p = jit_alloc_arch_params();
35563a849dd190 Mike Rapoport (IBM  2023-05-28  64) 
35563a849dd190 Mike Rapoport (IBM  2023-05-28 @65) 	if (!jit_alloc_validate_params(p))
35563a849dd190 Mike Rapoport (IBM  2023-05-28  66) 		return;
35563a849dd190 Mike Rapoport (IBM  2023-05-28  67) 
35563a849dd190 Mike Rapoport (IBM  2023-05-28 @68) 	if (p)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
