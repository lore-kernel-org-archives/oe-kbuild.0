Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C54138D
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Jan 2023 08:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672733626; x=1704269626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ik/hY5V9m74UnlVMOClFyb9ijKzwspaCcLII2BTauZA=;
  b=S2QV3O5LFNoh2JmG5qHZBMI7n8ZYuqB66NFwZ1Cx5GX+Li1i7tWHhgy9
   FWn38L+JhMxTBvbkhl0cmU9rcWsaJzMMHVjTVgPNEKkVDtnwkVj9/SvEs
   wdRm+MmHe6zJibJg9Rxm6tYANTvNeSNTOxt3vfhTR8BPdn9XOgRfs5hGL
   UprTTKI7qpxpqJuCaOy8QsFBpMTB6NEuZnhmlchdq74koRQZ3lJafd803
   Rjzz4V9wzLrz3hUE0fzCl0O4XYWhIEwDV6fCUVa/qI8CSUmC2MTXL/uCx
   kQDLr2SyiqsGbM/dBA/lxzsEqcCzs+us0NfEjljU1keD3N1hAcmCUPrNT
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="309378593"
X-IronPort-AV: E=Sophos;i="5.96,296,1665471600"; 
   d="scan'208";a="309378593"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 00:13:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="685306976"
X-IronPort-AV: E=Sophos;i="5.96,296,1665471600"; 
   d="scan'208";a="685306976"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Jan 2023 00:13:30 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pCcQL-000RyA-36;
	Tue, 03 Jan 2023 08:13:29 +0000
Date: Tue, 3 Jan 2023 16:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/damon/sysfs.c:1277:63: warning: Parameter 'c' can be declared as
 pointer to const [constParameter]
Message-ID: <202301031613.424amznO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/damon/sysfs.c:1277:63: warning: Parameter 'c' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: SeongJae Park <sj@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   69b41ac87e4a664de78a395ff97166f0b2943210
commit: c8e7b4d0ba348a8ef14956a80c780f152f433764 mm/damon/sysfs: split out schemes directory implementation to separate file
date:   5 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 weeks ago
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout c8e7b4d0ba348a8ef14956a80c780f152f433764
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> mm/damon/sysfs.c:1277:63: warning: Parameter 'c' can be declared as pointer to const [constParameter]
   static int damon_sysfs_cmd_request_callback(struct damon_ctx *c)
                                                                 ^

vim +/c +1277 mm/damon/sysfs.c

da87878010e598 SeongJae Park 2022-05-09  1269  
01538719c098f5 SeongJae Park 2022-05-09  1270  /*
01538719c098f5 SeongJae Park 2022-05-09  1271   * damon_sysfs_cmd_request_callback() - DAMON callback for handling requests.
01538719c098f5 SeongJae Park 2022-05-09  1272   * @c:	The DAMON context of the callback.
01538719c098f5 SeongJae Park 2022-05-09  1273   *
01538719c098f5 SeongJae Park 2022-05-09  1274   * This function is periodically called back from the kdamond thread for @c.
01538719c098f5 SeongJae Park 2022-05-09  1275   * Then, it checks if there is a waiting DAMON sysfs request and handles it.
01538719c098f5 SeongJae Park 2022-05-09  1276   */
01538719c098f5 SeongJae Park 2022-05-09 @1277  static int damon_sysfs_cmd_request_callback(struct damon_ctx *c)
01538719c098f5 SeongJae Park 2022-05-09  1278  {
01538719c098f5 SeongJae Park 2022-05-09  1279  	struct damon_sysfs_kdamond *kdamond;
01538719c098f5 SeongJae Park 2022-05-09  1280  	int err = 0;
01538719c098f5 SeongJae Park 2022-05-09  1281  
01538719c098f5 SeongJae Park 2022-05-09  1282  	/* avoid deadlock due to concurrent state_store('off') */
01538719c098f5 SeongJae Park 2022-05-09  1283  	if (!mutex_trylock(&damon_sysfs_lock))
01538719c098f5 SeongJae Park 2022-05-09  1284  		return 0;
01538719c098f5 SeongJae Park 2022-05-09  1285  	kdamond = damon_sysfs_cmd_request.kdamond;
01538719c098f5 SeongJae Park 2022-05-09  1286  	if (!kdamond || kdamond->damon_ctx != c)
01538719c098f5 SeongJae Park 2022-05-09  1287  		goto out;
01538719c098f5 SeongJae Park 2022-05-09  1288  	switch (damon_sysfs_cmd_request.cmd) {
01538719c098f5 SeongJae Park 2022-05-09  1289  	case DAMON_SYSFS_CMD_UPDATE_SCHEMES_STATS:
01538719c098f5 SeongJae Park 2022-05-09  1290  		err = damon_sysfs_upd_schemes_stats(kdamond);
01538719c098f5 SeongJae Park 2022-05-09  1291  		break;
da87878010e598 SeongJae Park 2022-05-09  1292  	case DAMON_SYSFS_CMD_COMMIT:
da87878010e598 SeongJae Park 2022-05-09  1293  		err = damon_sysfs_commit_input(kdamond);
da87878010e598 SeongJae Park 2022-05-09  1294  		break;
01538719c098f5 SeongJae Park 2022-05-09  1295  	default:
01538719c098f5 SeongJae Park 2022-05-09  1296  		break;
01538719c098f5 SeongJae Park 2022-05-09  1297  	}
01538719c098f5 SeongJae Park 2022-05-09  1298  	/* Mark the request as invalid now. */
01538719c098f5 SeongJae Park 2022-05-09  1299  	damon_sysfs_cmd_request.kdamond = NULL;
01538719c098f5 SeongJae Park 2022-05-09  1300  out:
01538719c098f5 SeongJae Park 2022-05-09  1301  	mutex_unlock(&damon_sysfs_lock);
01538719c098f5 SeongJae Park 2022-05-09  1302  	return err;
01538719c098f5 SeongJae Park 2022-05-09  1303  }
01538719c098f5 SeongJae Park 2022-05-09  1304  

:::::: The code at line 1277 was first introduced by commit
:::::: 01538719c098f51ac0742ef610d127ba3e3d1e03 mm/damon/sysfs: update schemes stat in the kdamond context

:::::: TO: SeongJae Park <sj@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
