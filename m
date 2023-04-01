Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7CA3236
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Apr 2023 12:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680353191; x=1711889191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JTzcAk7b86lG7GQNqxii+kUt+fy11RxFEOOwHTu1EEI=;
  b=VtyJuhxfv0db+/ZWw1YmF4ClRVY4tH04mf76OeFVe0UTRGRlS9NZRQgz
   jfYcfjM84I8+8WCwpsLzyCz5er3Vqn+4nQw5Tr2IX5tKf+E7kWAiRymYl
   fNZ1+0sv1uRznYvwlWpcEiF4g+/AXMQBtVHLb2D/7NvahCZz9I9RWS/9U
   BwFzH5OWH2foEvRh1AGipkJ7LMiQLiwdNqIXGH9gLA+Q5ecJVTv/W6bLm
   ldHlFeSYK0qwE2zq/4Pcdg6T1r1eqyW5FdUsKuCb2nE14Rhv80cnJLL+E
   TYiOaDIF1j+vEJBFRQH2uP93kepniMHLL5wY8igIY3ZnbwFhqh8VDZ1dW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="339145482"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="339145482"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 05:46:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="635592977"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="635592977"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Apr 2023 05:46:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piack-000Mlx-1h;
	Sat, 01 Apr 2023 12:46:26 +0000
Date: Sat, 1 Apr 2023 20:46:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android13-5.15 1/2]
 fs/notify/inotify/inotify_user.c:389:12-13: WARNING opportunity for min()
Message-ID: <202304012037.Z4a85OxY-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   7516b4d0ff7ef0aa4ba5abd0a6c51775f33d47f3
commit: f3a30a028ef9a46f55b3e087854833426619e02c [1/2] ANDROID: fuse: fix struct path zero initialization
:::::: branch date: 17 hours ago
:::::: commit date: 18 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20230401/202304012037.Z4a85OxY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202304012037.Z4a85OxY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/notify/inotify/inotify_user.c:389:12-13: WARNING opportunity for min()

vim +389 fs/notify/inotify/inotify_user.c

63c882a05416e1 Eric Paris  2009-05-21  371  
b7ba8371531700 Eric Paris  2009-12-17  372  static int inotify_add_to_idr(struct idr *idr, spinlock_t *idr_lock,
000285deb99a5e Eric Paris  2009-12-17  373  			      struct inotify_inode_mark *i_mark)
b7ba8371531700 Eric Paris  2009-12-17  374  {
b7ba8371531700 Eric Paris  2009-12-17  375  	int ret;
b7ba8371531700 Eric Paris  2009-12-17  376  
4542da631ad210 Tejun Heo   2013-02-27  377  	idr_preload(GFP_KERNEL);
b7ba8371531700 Eric Paris  2009-12-17  378  	spin_lock(idr_lock);
4542da631ad210 Tejun Heo   2013-02-27  379  
a66c04b4534f9b Jeff Layton 2013-04-29  380  	ret = idr_alloc_cyclic(idr, i_mark, 1, 0, GFP_NOWAIT);
4542da631ad210 Tejun Heo   2013-02-27  381  	if (ret >= 0) {
b7ba8371531700 Eric Paris  2009-12-17  382  		/* we added the mark to the idr, take a reference */
4542da631ad210 Tejun Heo   2013-02-27  383  		i_mark->wd = ret;
000285deb99a5e Eric Paris  2009-12-17  384  		fsnotify_get_mark(&i_mark->fsn_mark);
7050c48826d5ad Eric Paris  2009-12-17  385  	}
b7ba8371531700 Eric Paris  2009-12-17  386  
4542da631ad210 Tejun Heo   2013-02-27  387  	spin_unlock(idr_lock);
4542da631ad210 Tejun Heo   2013-02-27  388  	idr_preload_end();
4542da631ad210 Tejun Heo   2013-02-27 @389  	return ret < 0 ? ret : 0;
b7ba8371531700 Eric Paris  2009-12-17  390  }
b7ba8371531700 Eric Paris  2009-12-17  391  

:::::: The code at line 389 was first introduced by commit
:::::: 4542da631ad210716d097aa803a0828f9fed5e87 inotify: convert to idr_alloc()

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
