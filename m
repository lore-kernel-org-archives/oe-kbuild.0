Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792458233;
	b=Lyrr+vQPQxWXo3b2GR3PbkNOZB7VMJ/dRTPlOLVtcDTtK7WcamwvXCegyLFjrfLj6/Rr
	 OIxMN18yvFihVC9/zTLKsCMvZjNx1DVAkO45liW1Cs1EGn4waJ1x+u7lkbNv23XIXiPba
	 8zhTzeClogRpZJjIw/Ei+dV36Fk+lIhA50cK9sEO+bzxLwQ1R9duMX5iDs3uSg6W7m5jC
	 6wsU3kx0tA5Xl1kjSWjCxmYodXY1HYTrXwACE4YH8VUEsVrOzrCTAW93RFuDEzZVLXy0X
	 oYPSnbjwW87+ecTjmCucf1o3ClETGr7WJPX0y23IcXpw/WvBwDfIZjU+wJv730ZE3zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792458233;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=N83IJHdcbF6+abMkQpUSiH11sdxnftTC0ZbioiiLJcE=;
	b=fE35HVQntjQMzSI+MN4LrwZeiZ89iwaqjPIoIonmEQEfczwVffLRzfAdOit/cAJKWoqA
	 g5aybVVTRG3VNKVmgRpv/ff9oxmssyVrZWKg7/0XPpxWZxcQ2Lc/XRezZgV3lMA4ereSq
	 9L4/D5Ry2RmWQxuP0ajAPvTfkCDfH5A6fLDw0aTB7TT94x3bcuKgfft6pcyS1qrHfHWL6
	 s7MAAvRm/eriAUCs5kZSbOnoY1SsjyYqhxzdu7r6FKfL58gQcocykRuW77T25eljU90U4
	 48uUNOA94SmOhefGZfGzVCllQ87y658o0BiSHOQzh0vpxKP2+jvrDuTbewpv4x/yr6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="O/5gs+Q5";
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F57606A31A
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Oct 2026 01:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F57606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O/5gs+Q5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792458232; x=1823994232;
  h=date:from:to:cc:subject:message-id;
  bh=s924tC8l6laPyEinnAJ8gfFpP0UkSDuP7ZMRncZqeZA=;
  b=O/5gs+Q5ivODh4XcAe49YElC0wqQTImbsyfQn3X0Kpou+bCddTMfhRuF
   GXzeESxrIsQoeOtQ+/gvMZ2BelghB/yC5vE5tCIDeEeqDWQ6ht5wTYW8O
   7Si9o2Tf/7QBtb9kZQVeG7T6mLbE4qFZu+aHGKPd7E33OiFSP2tHKG5xy
   Z1+Y3CEAG8KR+fUhvVTA3OXyGqmwWEY7cqzN5XbxG8FIXJXtA4fyK+lS0
   Ncdyd86Z371bapw6uZxl3mwZqpT/WJb9ZrqFv2KlAiTpkTaRXen0X3Da0
   Nc6k/lOYZ5+GNRgqxPZUNxeZw39B9jkNHYCbgrVlqm+cwnzY+2ZIrLY9D
   g==;
X-CSE-ConnectionGUID: WWpXkpOUQLuAPB8ZEAcRKQ==
X-CSE-MsgGUID: +nlFCbBBTHGV+wp6X5vyoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1051012"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1051012"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 18:03:52 -0700
X-CSE-ConnectionGUID: UgeABSRNS+OAja6/9Ed3ZA==
X-CSE-MsgGUID: xPiDvFggQnyi2wtGun9BtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2748735"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 19 Oct 2026 18:03:50 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIyGZ-0000000061P-2m3A;
	Tue, 20 Oct 2026 01:03:47 +0000
Date: Tue, 20 Oct 2026 03:03:03 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android13-5.15 8/8] fs/kernfs/dir.c:1340
 __kernfs_remove() warn: variable dereferenced before check 'kn' (see line
 1333)
Message-ID: <202610200244.ab5KlXOz-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   0bb006856b8d8b803fde48d026d89a5fafcd5263
commit: f2242c11be4d1f16e95a87896fd955876db37d1e [8/8] UPSTREAM: kernfs: switch global kernfs_rwsem lock to per-fs lock
:::::: branch date: 10 hours ago
:::::: commit date: 2 years, 9 months ago
config: arm-randconfig-r2200-20261019 (https://download.01.org/0day-ci/archive/20261020/202610200244.ab5KlXOz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610200244.ab5KlXOz-lkp@intel.com/

smatch warnings:
fs/kernfs/dir.c:1340 __kernfs_remove() warn: variable dereferenced before check 'kn' (see line 1333)

vim +/kn +1340 fs/kernfs/dir.c

d35258ef702cca0 Tejun Heo          2014-02-03  1328  
988cd7afb3f3759 Tejun Heo          2014-02-03  1329  static void __kernfs_remove(struct kernfs_node *kn)
fd7b9f7b9776b11 Tejun Heo          2013-11-28  1330  {
35beab0635f3cdd Tejun Heo          2014-02-03  1331  	struct kernfs_node *pos;
35beab0635f3cdd Tejun Heo          2014-02-03  1332  
f2242c11be4d1f1 Minchan Kim        2021-11-18 @1333  	lockdep_assert_held_write(&kernfs_root(kn)->kernfs_rwsem);
fd7b9f7b9776b11 Tejun Heo          2013-11-28  1334  
6b0afc2a21726b2 Tejun Heo          2014-02-03  1335  	/*
6b0afc2a21726b2 Tejun Heo          2014-02-03  1336  	 * Short-circuit if non-root @kn has already finished removal.
6b0afc2a21726b2 Tejun Heo          2014-02-03  1337  	 * This is for kernfs_remove_self() which plays with active ref
6b0afc2a21726b2 Tejun Heo          2014-02-03  1338  	 * after removal.
6b0afc2a21726b2 Tejun Heo          2014-02-03  1339  	 */
6b0afc2a21726b2 Tejun Heo          2014-02-03 @1340  	if (!kn || (kn->parent && RB_EMPTY_NODE(&kn->rb)))
ce9b499c9f58d7f Greg Kroah-Hartman 2014-01-13  1341  		return;
ce9b499c9f58d7f Greg Kroah-Hartman 2014-01-13  1342  
c637b8acbe079ed Tejun Heo          2013-12-11  1343  	pr_debug("kernfs %s: removing\n", kn->name);
fd7b9f7b9776b11 Tejun Heo          2013-11-28  1344  
81c173cb5e87fbb Tejun Heo          2014-02-03  1345  	/* prevent any new usage under @kn by deactivating all nodes */
35beab0635f3cdd Tejun Heo          2014-02-03  1346  	pos = NULL;
35beab0635f3cdd Tejun Heo          2014-02-03  1347  	while ((pos = kernfs_next_descendant_post(pos, kn)))
81c173cb5e87fbb Tejun Heo          2014-02-03  1348  		if (kernfs_active(pos))
81c173cb5e87fbb Tejun Heo          2014-02-03  1349  			atomic_add(KN_DEACTIVATED_BIAS, &pos->active);
35beab0635f3cdd Tejun Heo          2014-02-03  1350  
35beab0635f3cdd Tejun Heo          2014-02-03  1351  	/* deactivate and unlink the subtree node-by-node */
fd7b9f7b9776b11 Tejun Heo          2013-11-28  1352  	do {
35beab0635f3cdd Tejun Heo          2014-02-03  1353  		pos = kernfs_leftmost_descendant(kn);
35beab0635f3cdd Tejun Heo          2014-02-03  1354  
35beab0635f3cdd Tejun Heo          2014-02-03  1355  		/*
7ba0273b2f34a55 Ian Kent           2021-07-16  1356  		 * kernfs_drain() drops kernfs_rwsem temporarily and @pos's
81c173cb5e87fbb Tejun Heo          2014-02-03  1357  		 * base ref could have been put by someone else by the time
81c173cb5e87fbb Tejun Heo          2014-02-03  1358  		 * the function returns.  Make sure it doesn't go away
81c173cb5e87fbb Tejun Heo          2014-02-03  1359  		 * underneath us.
35beab0635f3cdd Tejun Heo          2014-02-03  1360  		 */
35beab0635f3cdd Tejun Heo          2014-02-03  1361  		kernfs_get(pos);
35beab0635f3cdd Tejun Heo          2014-02-03  1362  
d35258ef702cca0 Tejun Heo          2014-02-03  1363  		/*
d35258ef702cca0 Tejun Heo          2014-02-03  1364  		 * Drain iff @kn was activated.  This avoids draining and
d35258ef702cca0 Tejun Heo          2014-02-03  1365  		 * its lockdep annotations for nodes which have never been
d35258ef702cca0 Tejun Heo          2014-02-03  1366  		 * activated and allows embedding kernfs_remove() in create
d35258ef702cca0 Tejun Heo          2014-02-03  1367  		 * error paths without worrying about draining.
d35258ef702cca0 Tejun Heo          2014-02-03  1368  		 */
d35258ef702cca0 Tejun Heo          2014-02-03  1369  		if (kn->flags & KERNFS_ACTIVATED)
81c173cb5e87fbb Tejun Heo          2014-02-03  1370  			kernfs_drain(pos);
d35258ef702cca0 Tejun Heo          2014-02-03  1371  		else
d35258ef702cca0 Tejun Heo          2014-02-03  1372  			WARN_ON_ONCE(atomic_read(&kn->active) != KN_DEACTIVATED_BIAS);
35beab0635f3cdd Tejun Heo          2014-02-03  1373  
35beab0635f3cdd Tejun Heo          2014-02-03  1374  		/*
35beab0635f3cdd Tejun Heo          2014-02-03  1375  		 * kernfs_unlink_sibling() succeeds once per node.  Use it
35beab0635f3cdd Tejun Heo          2014-02-03  1376  		 * to decide who's responsible for cleanups.
35beab0635f3cdd Tejun Heo          2014-02-03  1377  		 */
35beab0635f3cdd Tejun Heo          2014-02-03  1378  		if (!pos->parent || kernfs_unlink_sibling(pos)) {
35beab0635f3cdd Tejun Heo          2014-02-03  1379  			struct kernfs_iattrs *ps_iattr =
35beab0635f3cdd Tejun Heo          2014-02-03  1380  				pos->parent ? pos->parent->iattr : NULL;
35beab0635f3cdd Tejun Heo          2014-02-03  1381  
35beab0635f3cdd Tejun Heo          2014-02-03  1382  			/* update timestamps on the parent */
35beab0635f3cdd Tejun Heo          2014-02-03  1383  			if (ps_iattr) {
05895219627c416 Ondrej Mosnacek    2019-02-22  1384  				ktime_get_real_ts64(&ps_iattr->ia_ctime);
05895219627c416 Ondrej Mosnacek    2019-02-22  1385  				ps_iattr->ia_mtime = ps_iattr->ia_ctime;
35beab0635f3cdd Tejun Heo          2014-02-03  1386  			}
35beab0635f3cdd Tejun Heo          2014-02-03  1387  
988cd7afb3f3759 Tejun Heo          2014-02-03  1388  			kernfs_put(pos);
35beab0635f3cdd Tejun Heo          2014-02-03  1389  		}
35beab0635f3cdd Tejun Heo          2014-02-03  1390  
35beab0635f3cdd Tejun Heo          2014-02-03  1391  		kernfs_put(pos);
35beab0635f3cdd Tejun Heo          2014-02-03  1392  	} while (pos != kn);
fd7b9f7b9776b11 Tejun Heo          2013-11-28  1393  }
fd7b9f7b9776b11 Tejun Heo          2013-11-28  1394  

:::::: The code at line 1340 was first introduced by commit
:::::: 6b0afc2a21726b2d6b6aa441af40cafaf5405cc8 kernfs, sysfs, driver-core: implement kernfs_remove_self() and its wrappers

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
