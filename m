Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AB88BEB
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Apr 2023 20:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681762566; x=1713298566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qTXuNI42D1Tm5QXilsMunH5OVGC6tyKCmwbi30zUc2Y=;
  b=SoFcdepqaPoOvBLIxksAc8TB0U0GwQy46bGjXDWdOrkp9GlgBZ6XJGCQ
   wO/tcLdiyDvOCzrD4XTvE7q0afxfoWc/TzRNnoapFLwAt7ZDjI3kx/TSo
   W5k4Vs0orwiqe0Mx/KdTr6hDAx6JBhGdGuxO/x4VA1HVh4DY0lCQBBSHl
   fNaJYWh/e99FlUug9EBbZ3T/YvhRiH43lZxOmx/b7xZLawBAropV75/Ez
   ooWJRe/+Kleq7Uv+0y3I0ltDkQwsKVm2X6QvbRdRdP5eNmsa61ek77mEF
   vXkCx6R71KEp//80fknR57BhEw/acNDXuDIPvgLfLkIMd1CKHOPjy+uRo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="410215370"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="410215370"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 13:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="693357799"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="693357799"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 17 Apr 2023 13:16:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poVGd-000cf1-0D;
	Mon, 17 Apr 2023 20:16:03 +0000
Date: Tue, 18 Apr 2023 04:15:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ceph-client:testing 77/77] fs/ceph/mds_client.c:1957
 wake_up_session_cb() error: potentially dereferencing uninitialized 'cap'.
Message-ID: <202304180424.Dok2kyeU-lkp@intel.com>
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
CC: ceph-devel@vger.kernel.org
TO: Xiubo Li <xiubli@redhat.com>

tree:   https://github.com/ceph/ceph-client.git testing
head:   3fef7c3fd10c5f078e0f6ec8c683f2d1e14eb05d
commit: 3fef7c3fd10c5f078e0f6ec8c683f2d1e14eb05d [77/77] ceph: fix potential use-after-free bug when trimming caps
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: i386-randconfig-m021-20230417 (https://download.01.org/0day-ci/archive/20230418/202304180424.Dok2kyeU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304180424.Dok2kyeU-lkp@intel.com/

New smatch warnings:
fs/ceph/mds_client.c:1957 wake_up_session_cb() error: potentially dereferencing uninitialized 'cap'.

Old smatch warnings:
fs/ceph/mds_client.c:219 parse_reply_info_in() warn: missing unwind goto?

vim +/cap +1957 fs/ceph/mds_client.c

d2f8bb27c87945 Yan, Zheng  2018-12-10  1938  
2f2dc053404feb Sage Weil   2009-10-06  1939  /*
2f2dc053404feb Sage Weil   2009-10-06  1940   * wake up any threads waiting on this session's caps.  if the cap is
2f2dc053404feb Sage Weil   2009-10-06  1941   * old (didn't get renewed on the client reconnect), remove it now.
2f2dc053404feb Sage Weil   2009-10-06  1942   *
2f2dc053404feb Sage Weil   2009-10-06  1943   * caller must hold s_mutex.
2f2dc053404feb Sage Weil   2009-10-06  1944   */
3fef7c3fd10c5f Xiubo Li    2023-04-14  1945  static int wake_up_session_cb(struct inode *inode, struct rb_node *ci_node, void *arg)
2f2dc053404feb Sage Weil   2009-10-06  1946  {
0dc2570fab222a Sage Weil   2009-11-20  1947  	struct ceph_inode_info *ci = ceph_inode(inode);
d2f8bb27c87945 Yan, Zheng  2018-12-10  1948  	unsigned long ev = (unsigned long)arg;
3fef7c3fd10c5f Xiubo Li    2023-04-14  1949  	struct ceph_cap *cap;
0dc2570fab222a Sage Weil   2009-11-20  1950  
d2f8bb27c87945 Yan, Zheng  2018-12-10  1951  	if (ev == RECONNECT) {
be655596b3de58 Sage Weil   2011-11-30  1952  		spin_lock(&ci->i_ceph_lock);
0dc2570fab222a Sage Weil   2009-11-20  1953  		ci->i_wanted_max_size = 0;
0dc2570fab222a Sage Weil   2009-11-20  1954  		ci->i_requested_max_size = 0;
be655596b3de58 Sage Weil   2011-11-30  1955  		spin_unlock(&ci->i_ceph_lock);
d2f8bb27c87945 Yan, Zheng  2018-12-10  1956  	} else if (ev == RENEWCAPS) {
52d60f8e18b855 Jeff Layton 2021-06-04 @1957  		if (cap->cap_gen < atomic_read(&cap->session->s_cap_gen)) {
d2f8bb27c87945 Yan, Zheng  2018-12-10  1958  			/* mds did not re-issue stale cap */
d2f8bb27c87945 Yan, Zheng  2018-12-10  1959  			spin_lock(&ci->i_ceph_lock);
3fef7c3fd10c5f Xiubo Li    2023-04-14  1960  			cap = rb_entry(ci_node, struct ceph_cap, ci_node);
3fef7c3fd10c5f Xiubo Li    2023-04-14  1961  			if (cap)
d2f8bb27c87945 Yan, Zheng  2018-12-10  1962  				cap->issued = cap->implemented = CEPH_CAP_PIN;
d2f8bb27c87945 Yan, Zheng  2018-12-10  1963  			spin_unlock(&ci->i_ceph_lock);
d2f8bb27c87945 Yan, Zheng  2018-12-10  1964  		}
d2f8bb27c87945 Yan, Zheng  2018-12-10  1965  	} else if (ev == FORCE_RO) {
0dc2570fab222a Sage Weil   2009-11-20  1966  	}
e536030934aebf Yan, Zheng  2016-05-19  1967  	wake_up_all(&ci->i_cap_wq);
2f2dc053404feb Sage Weil   2009-10-06  1968  	return 0;
2f2dc053404feb Sage Weil   2009-10-06  1969  }
2f2dc053404feb Sage Weil   2009-10-06  1970  

:::::: The code at line 1957 was first introduced by commit
:::::: 52d60f8e18b855d67ecdc4fa34ae1b894d36c7b9 ceph: eliminate session->s_gen_ttl_lock

:::::: TO: Jeff Layton <jlayton@kernel.org>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
