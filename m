Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6569C4644E
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Jan 2025 18:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737914644; cv=none; b=We3VMz7Wvht+M9EVV2lA54a+9pXz8EGAoWmLZylVfUVkKu8uzqpRh6W6Y7/NkL+J9rrYaFtAL+FuYyCqHguh0HQ5AwNf/dPtejIMNnt/fL2sfEUXf4KwgR3+p7LTw1ZLhd93+6wzfeSeHotjeIy3wPwAsa6hlDAAK2tm5fMhMWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737914644; c=relaxed/simple;
	bh=Gz9e6/S7lY302DHAbSLEPeJ7qNexnQe4KsubXfcaeBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cBhElP1+S3mA6ZLzjGC3qJMxSqmr1A03jJaA3sUtDAg4PUj5CrvbWXzQ80ZzsZmiiNbMdzYPlQFneargwcY70pDPpZjiSQvsnNyWa1imwsQxnFYFgMYU9YEMR6gN5Rud6R4bqaWefX78hWJIy6NGvhceWEiQquV2/Udj2xi73aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJp9STHN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJp9STHN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737914642; x=1769450642;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Gz9e6/S7lY302DHAbSLEPeJ7qNexnQe4KsubXfcaeBY=;
  b=jJp9STHNNxNm3xF6/57U/j1qeWfDrAMj+3AURHk+eNPvOgn0Xby+siMl
   H+We8zWbAQAeWf+Jis8+RMdiTanyrDzVQWNWgYS/QBMowV+EAU4iRM9u0
   v50s8Auj+3yyxif0K9NLvo0NXjemoi00cl5UbVLr40a9Kv7UDgm4/4yOV
   RYCPgxe/CEtEyGYoCwESfMEAPY9ZaidO7R2KWt33BRdAx/283ey81BSdW
   tvHlon48luFbIWINbZYUbSM7mYSbMnNDWAOKHTOyuSpjNfbfo0oXWf2+F
   Ww1lXbpQXUHPmrywvddBhYy9fTq25h7EXqYjrkAYndKQc1i101YKcxOlw
   g==;
X-CSE-ConnectionGUID: bASnR+39Q8S+mNQfv/PzLw==
X-CSE-MsgGUID: TqV+39zfQNevXlGpdl2MGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="63738917"
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="63738917"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 10:04:02 -0800
X-CSE-ConnectionGUID: OpMJ92g7T7O829QjPftDAA==
X-CSE-MsgGUID: Laj+KyFYRdavj9pNSTRosg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131550908"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Jan 2025 10:04:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tc6zG-000fbv-1q;
	Sun, 26 Jan 2025 18:03:58 +0000
Date: Mon, 27 Jan 2025 02:03:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-5.15 2/2] kernel/futex/core.c:1688
 futex_wake() error: uninitialized symbol 'target_nr'.
Message-ID: <202501270227.yGDem2Zo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   49bd830ea5e30f59495e703aae18331882b76760
commit: e5d032fb33baca48e1f0bdbf0f71ba74017dddeb [2/2] ANDROID: vendor_hooks: Add hooks for oem futex optimization
:::::: branch date: 24 hours ago
:::::: commit date: 1 year, 9 months ago
config: i386-randconfig-141-20250126 (https://download.01.org/0day-ci/archive/20250127/202501270227.yGDem2Zo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501270227.yGDem2Zo-lkp@intel.com/

smatch warnings:
kernel/futex/core.c:1688 futex_wake() error: uninitialized symbol 'target_nr'.

vim +/target_nr +1688 kernel/futex/core.c

5eb3dc62fc5986 kernel/futex.c      Darren Hart     2009-03-12  1647  
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16  1648  /*
b2d0994b1301fc kernel/futex.c      Darren Hart     2009-03-12  1649   * Wake up waiters matching bitset queued on this futex (uaddr).
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16  1650   */
b41277dc7a18ee kernel/futex.c      Darren Hart     2010-11-08  1651  static int
b41277dc7a18ee kernel/futex.c      Darren Hart     2010-11-08  1652  futex_wake(u32 __user *uaddr, unsigned int flags, int nr_wake, u32 bitset)
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16  1653  {
e2970f2fb69501 kernel/futex.c      Ingo Molnar     2006-06-27  1654  	struct futex_hash_bucket *hb;
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16  1655  	struct futex_q *this, *next;
38d47c1b7075bd kernel/futex.c      Peter Zijlstra  2008-09-26  1656  	union futex_key key = FUTEX_KEY_INIT;
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16  1657  	int ret;
e5d032fb33baca kernel/futex/core.c xieliujie       2023-04-24  1658  	int target_nr;
194a6b5b9cb6b9 kernel/futex.c      Waiman Long     2016-11-17  1659  	DEFINE_WAKE_Q(wake_q);
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16  1660  
cd689985cf49f6 kernel/futex.c      Thomas Gleixner 2008-02-01  1661  	if (!bitset)
cd689985cf49f6 kernel/futex.c      Thomas Gleixner 2008-02-01  1662  		return -EINVAL;
cd689985cf49f6 kernel/futex.c      Thomas Gleixner 2008-02-01  1663  
96d4f267e40f95 kernel/futex.c      Linus Torvalds  2019-01-03  1664  	ret = get_futex_key(uaddr, flags & FLAGS_SHARED, &key, FUTEX_READ);
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16  1665  	if (unlikely(ret != 0))
d7c5ed73b19c46 kernel/futex.c      André Almeida   2020-07-02  1666  		return ret;
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16  1667  
e2970f2fb69501 kernel/futex.c      Ingo Molnar     2006-06-27  1668  	hb = hash_futex(&key);
b0c29f79ecea0b kernel/futex.c      Davidlohr Bueso 2014-01-12  1669  
b0c29f79ecea0b kernel/futex.c      Davidlohr Bueso 2014-01-12  1670  	/* Make sure we really have tasks to wakeup */
b0c29f79ecea0b kernel/futex.c      Davidlohr Bueso 2014-01-12  1671  	if (!hb_waiters_pending(hb))
d7c5ed73b19c46 kernel/futex.c      André Almeida   2020-07-02  1672  		return ret;
b0c29f79ecea0b kernel/futex.c      Davidlohr Bueso 2014-01-12  1673  
e2970f2fb69501 kernel/futex.c      Ingo Molnar     2006-06-27  1674  	spin_lock(&hb->lock);
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16  1675  
e5d032fb33baca kernel/futex/core.c xieliujie       2023-04-24  1676  	trace_android_vh_futex_wake_traverse_plist(&hb->chain, &target_nr, key, bitset);
0d00c7b20c7716 kernel/futex.c      Jason Low       2014-01-12  1677  	plist_for_each_entry_safe(this, next, &hb->chain, list) {
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16  1678  		if (match_futex (&this->key, &key)) {
52400ba946759a kernel/futex.c      Darren Hart     2009-04-03  1679  			if (this->pi_state || this->rt_waiter) {
ed6f7b10e657b9 kernel/futex.c      Ingo Molnar     2006-07-01  1680  				ret = -EINVAL;
ed6f7b10e657b9 kernel/futex.c      Ingo Molnar     2006-07-01  1681  				break;
ed6f7b10e657b9 kernel/futex.c      Ingo Molnar     2006-07-01  1682  			}
cd689985cf49f6 kernel/futex.c      Thomas Gleixner 2008-02-01  1683  
cd689985cf49f6 kernel/futex.c      Thomas Gleixner 2008-02-01  1684  			/* Check if one of the bits is set in both bitsets */
cd689985cf49f6 kernel/futex.c      Thomas Gleixner 2008-02-01  1685  			if (!(this->bitset & bitset))
cd689985cf49f6 kernel/futex.c      Thomas Gleixner 2008-02-01  1686  				continue;
cd689985cf49f6 kernel/futex.c      Thomas Gleixner 2008-02-01  1687  
e5d032fb33baca kernel/futex/core.c xieliujie       2023-04-24 @1688  			trace_android_vh_futex_wake_this(ret, nr_wake, target_nr, this->task);
1d0dcb3ad9d336 kernel/futex.c      Davidlohr Bueso 2015-05-01  1689  			mark_wake_futex(&wake_q, this);
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16  1690  			if (++ret >= nr_wake)
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16  1691  				break;
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16  1692  		}
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16  1693  	}
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16  1694  
e2970f2fb69501 kernel/futex.c      Ingo Molnar     2006-06-27  1695  	spin_unlock(&hb->lock);
1d0dcb3ad9d336 kernel/futex.c      Davidlohr Bueso 2015-05-01  1696  	wake_up_q(&wake_q);
e5d032fb33baca kernel/futex/core.c xieliujie       2023-04-24  1697  	trace_android_vh_futex_wake_up_q_finish(nr_wake, target_nr);
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16  1698  	return ret;
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16  1699  }
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16  1700  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
