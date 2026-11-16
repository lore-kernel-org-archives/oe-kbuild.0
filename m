Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865096;
	b=WZWZLsjEnsCNvYSjtHmFCRfpimoNjpx4JZrNDQWM5ZOu5mUKXfN6RL9LCs7Zcd5dr571
	 CjGFtSUcWbKrcf3p1pjxIRUnbp2Yc7hm0soQcFWa5Ec/MVLnA/HLdw1hPwGZAQX4GViIr
	 FrwxUVZXhOiugBVZHn52QJ+WmAALUBlFOrHcqlvCDRtTFFjhJsxIdsLpsmsyS/lXzAGtV
	 JanKzfLV184jfZWTAA5b8fRy+MGs/n21LCo8S9us77xsZKIpXo3/6Dze7axiHqZGMWyL4
	 sD6Sl8v0N/W5L8TFIYXnbgrKVOp/7ThHCmXj5wW6JqhZHV4IfMc1bqsy+MFgh3bLgMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865096;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wXrB9tiN1pOadRCcevjBLQ+WoIc5IzyLJ9C92p5uvNQ=;
	b=chk/hffOh7Iq/B0duoG5xC6WprPd7Zj9b2vbX6j8Mb/0HQYwChYo8k8Q+oCkZlcq14dv
	 N2B4r79ObM8RWe4gn42+wGk5V7zBbx7eNU9lR4czKXh10DRx4B08k3Uqg9Vl0cjH3lwaR
	 uzAEU942ULqpfgOUh0q25B2d/QiTMs69iJAftkGi3JKROKQtbhy5cJA+1k4A4KGl1f2j+
	 PyAEsHMYBHNz3bqDoeff11jmab0Kunb0jokfkjdGHPYPjdLf1/BMpyIx1bg3gS3JQJsx+
	 r+00DNyMtvrRdcABXgu9YGCb9xU7NPiRCrB10dkXlKDRi591StWKilEGy24ORHip50Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="GSaD0mz/";
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C72606A88D
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 21:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8C72606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GSaD0mz/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794865094; x=1826401094;
  h=date:from:to:cc:subject:message-id;
  bh=FQzhQSLBQgrtbx9ju+vflE6M6kehMUobv3CuuuSZntQ=;
  b=GSaD0mz/nZCuGBCP76GxkiRkNP3D+MmighjRwgwTtxVJbqP/9OfVBQxg
   j9wXDybYZqy0cQ6JzXN+5qK6VqHOxaKEYOOmbjCOMmh4LA7zqWRGLzPsP
   KBCLif6mYc5/SGCKEQC2EoVdDA0ORjl/3qi5quReB9EKepc4wGNYQlxJI
   lxOvK4WdtHdieulDzXRVkt2p5aqXkTztWvgEzWKXTheqDsvwRhtxcxowP
   fRr7itUwfWb5CHMxFfxbhiQE+j9YSwLODnNhk/7safy3r/w6S+PmGptSd
   NAkC441SVCnBIin5/mRzWEvpMzW542gbj+dcdODrz8Qm1VuU7EfWowEKW
   A==;
X-CSE-ConnectionGUID: z+Ki/tbBREuLzmwRW6Lyqg==
X-CSE-MsgGUID: Ey/ekEv1Qsm6hNS0wjp5xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3646677"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3646677"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:38:14 -0800
X-CSE-ConnectionGUID: ZLmd6vC2S26WjvCOJHsLtQ==
X-CSE-MsgGUID: ehvkPWsdTLit04vtULcwhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9899431"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 16 Nov 2026 13:38:12 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT4Ov-000000002oY-2WV0;
	Mon, 16 Nov 2026 21:38:09 +0000
Date: Mon, 16 Nov 2026 22:37:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bvanassche:thread-safety 144/458] fs/afs/dir.c:307
 afs_read_dir() warn: impossible condition '(i_size > (((~0) >> 1))) =>
 (0-s64max > s64max)'
Message-ID: <202611162206.fI8onuRg-lkp@intel.com>
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
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux thread-safety
head:   0e6b6b4005f8a398c95e4d8bdf0bdbb9aed73729
commit: 2b6d53024265496437c9ad315c0cda69125bb96a [144/458] treewide: Disable context analysis instead of using wrong annotations
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-2200-20261115 (https://download.01.org/0day-ci/archive/20261116/202611162206.fI8onuRg-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611162206.fI8onuRg-lkp@intel.com/

New smatch warnings:
fs/afs/dir.c:307 afs_read_dir() warn: impossible condition '(i_size > (((~0) >> 1))) => (0-s64max > s64max)'

Old smatch warnings:
fs/afs/dir.c:502 afs_dir_iterate_contents() warn: 'i_size' unsigned <= 0

vim +307 fs/afs/dir.c

6dd80936618c4f David Howells   2024-12-16  295  
6dd80936618c4f David Howells   2024-12-16  296  /*
6dd80936618c4f David Howells   2024-12-16  297   * Read the directory into a folio_queue buffer in one go, scrubbing the
6dd80936618c4f David Howells   2024-12-16  298   * previous contents.  We return -ESTALE if the caller needs to call us again.
^1da177e4c3f41 Linus Torvalds  2005-04-16  299   */
a5b5beebcf96d5 David Howells   2024-12-16  300  ssize_t afs_read_dir(struct afs_vnode *dvnode, struct file *file)
2b6d5302426549 Bart Van Assche 2026-10-21  301  	__cond_acquires_shared_range(0, SSIZE_MAX, &dvnode->validate_lock)
6dd80936618c4f David Howells   2024-12-16  302  {
6dd80936618c4f David Howells   2024-12-16  303  	ssize_t ret;
6dd80936618c4f David Howells   2024-12-16  304  	loff_t i_size;
6dd80936618c4f David Howells   2024-12-16  305  
6dd80936618c4f David Howells   2024-12-16  306  	i_size = i_size_read(&dvnode->netfs.inode);
2b6d5302426549 Bart Van Assche 2026-10-21 @307  	if (i_size < 0 || i_size > SSIZE_MAX)
2b6d5302426549 Bart Van Assche 2026-10-21  308  		return -EFBIG;
6dd80936618c4f David Howells   2024-12-16  309  
f3ddee8dc4e2cf David Howells   2018-04-06  310  	ret = -ERESTARTSYS;
b61f7dcf4eb265 David Howells   2018-04-27  311  	if (down_read_killable(&dvnode->validate_lock) < 0)
b61f7dcf4eb265 David Howells   2018-04-27  312  		goto error;
^1da177e4c3f41 Linus Torvalds  2005-04-16  313  
6dd80936618c4f David Howells   2024-12-16  314  	/* We only need to reread the data if it became invalid - or if we
6dd80936618c4f David Howells   2024-12-16  315  	 * haven't read it yet.
6dd80936618c4f David Howells   2024-12-16  316  	 */
6dd80936618c4f David Howells   2024-12-16  317  	if (test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags) &&
e2d46f2ec33253 David Howells   2024-12-16  318  	    test_bit(AFS_VNODE_DIR_READ, &dvnode->flags)) {
e2d46f2ec33253 David Howells   2024-12-16  319  		ret = i_size;
6dd80936618c4f David Howells   2024-12-16  320  		goto valid;
e2d46f2ec33253 David Howells   2024-12-16  321  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  322  
b61f7dcf4eb265 David Howells   2018-04-27  323  	up_read(&dvnode->validate_lock);
b61f7dcf4eb265 David Howells   2018-04-27  324  	if (down_write_killable(&dvnode->validate_lock) < 0)
b61f7dcf4eb265 David Howells   2018-04-27  325  		goto error;
b61f7dcf4eb265 David Howells   2018-04-27  326  
6dd80936618c4f David Howells   2024-12-16  327  	if (!test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags))
6dd80936618c4f David Howells   2024-12-16  328  		afs_invalidate_cache(dvnode, 0);
f3ddee8dc4e2cf David Howells   2018-04-06  329  
6dd80936618c4f David Howells   2024-12-16  330  	if (!test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags) ||
6dd80936618c4f David Howells   2024-12-16  331  	    !test_bit(AFS_VNODE_DIR_READ, &dvnode->flags)) {
6dd80936618c4f David Howells   2024-12-16  332  		trace_afs_reload_dir(dvnode);
6dd80936618c4f David Howells   2024-12-16  333  		ret = afs_read_single(dvnode, file);
c450846461f88b David Howells   2020-02-06  334  		if (ret < 0)
b61f7dcf4eb265 David Howells   2018-04-27  335  			goto error_unlock;
f3ddee8dc4e2cf David Howells   2018-04-06  336  
f3ddee8dc4e2cf David Howells   2018-04-06  337  		// TODO: Trim excess pages
f3ddee8dc4e2cf David Howells   2018-04-06  338  
f3ddee8dc4e2cf David Howells   2018-04-06  339  		set_bit(AFS_VNODE_DIR_VALID, &dvnode->flags);
6dd80936618c4f David Howells   2024-12-16  340  		set_bit(AFS_VNODE_DIR_READ, &dvnode->flags);
e2d46f2ec33253 David Howells   2024-12-16  341  	} else {
e2d46f2ec33253 David Howells   2024-12-16  342  		ret = i_size;
f3ddee8dc4e2cf David Howells   2018-04-06  343  	}
f3ddee8dc4e2cf David Howells   2018-04-06  344  
b61f7dcf4eb265 David Howells   2018-04-27  345  	downgrade_write(&dvnode->validate_lock);
6dd80936618c4f David Howells   2024-12-16  346  valid:
2b6d5302426549 Bart Van Assche 2026-10-21  347  	if (ret < 0)
2b6d5302426549 Bart Van Assche 2026-10-21  348  		unreachable();
e2d46f2ec33253 David Howells   2024-12-16  349  	return ret;
f3ddee8dc4e2cf David Howells   2018-04-06  350  
f3ddee8dc4e2cf David Howells   2018-04-06  351  error_unlock:
b61f7dcf4eb265 David Howells   2018-04-27  352  	up_write(&dvnode->validate_lock);
f3ddee8dc4e2cf David Howells   2018-04-06  353  error:
6dd80936618c4f David Howells   2024-12-16  354  	_leave(" = %zd", ret);
6dd80936618c4f David Howells   2024-12-16  355  	return ret;
ec26815ad847db David Howells   2007-04-26  356  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  357  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
