Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B011D86F1
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Dec 2024 22:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733092249; cv=none; b=FTKjyk7/piBNo8XhGiVmb/j9AiXAWgufnkbPTMvVr7qfLEz4X6ya55/NjYiyIFwhGQBPVAAr3QWCR3u8FmhVWqwnMsa8fscGo3jeBbF+UHBbpzhDbBSx4zLKCoVOc0Gz6ymleBQ9zmjIx9OWXrOqN+OMc8ycUKjdqHRw1HccWto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733092249; c=relaxed/simple;
	bh=D7ERiOqIe4UOV1bPqEhjawK5eXS3n7lhFRMrGtZXVBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jXGLWao86C9wo8zA/FpYtNnLSvm/8Ieetm6qGLBwUSjivLTtW/YaemZsr7hjOw0nY7IkVikEBw0zKosKe0wFjKatP6ib0UA+Ih80FLDkQgtpWGh+++LN9prbkpxyRy7bH1AnsNbKt/KhGuWL9hBxAqLN6ABE0T6Pb9CKu0Gt8h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ejalfuwL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ejalfuwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733092246; x=1764628246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D7ERiOqIe4UOV1bPqEhjawK5eXS3n7lhFRMrGtZXVBs=;
  b=ejalfuwLg8+NDGvdJemI5kSfGJ+DGK/m5yHbBYNvt2HdSUO4KwWYIIhQ
   fzYb/p+UcqjnC6hWHZNwIDQchvGUOxP7vBbMYy4P4kuWCspDQsxTXyf4e
   jdZOuJNPmN+9gJIgKOYU1HpiQdHXW7C1biC2mD6fdQqoroTccJaW7U0kz
   mjpnn6Lai2ApalqaXkSmTAbuadHR8v4SH2+q1tjcUZ73AQy0OGGDNnrrY
   gMT4d9By4Vh3vSexf+7S+rdJTnrrdI/u3l8ZD/wQSOp94GE3pFBdeskut
   6WVC/755pnhFBVtu52GPzZ62ly0V/slIuUyGRNewrcVKJEOl2zbGwHPGC
   w==;
X-CSE-ConnectionGUID: go4Sfl0DTyG4gZtm7Xefyg==
X-CSE-MsgGUID: AnjzaY9RTQKDa0vJghQHhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="55739889"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="55739889"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 14:30:46 -0800
X-CSE-ConnectionGUID: 0UW+bh7uRGmVgUAdnII3sg==
X-CSE-MsgGUID: Xn2WzoqIS6qinqd+MsXVSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="98062890"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Dec 2024 14:30:45 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHsSg-0001tU-2h;
	Sun, 01 Dec 2024 22:30:42 +0000
Date: Mon, 2 Dec 2024 06:30:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/aio.c:1655:3-9: preceding lock on line 1653
Message-ID: <202412020616.l5tT3rpu-lkp@intel.com>
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
TO: Eric Biggers <ebiggers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f788b5ef1ca9b1c2f8d4e1beb2b25edc2db43ef4
commit: 50252e4b5e989ce64555c7aef7516bdefc2fea72 aio: fix use-after-free due to missing POLLFREE handling
date:   3 years ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 years ago
config: i386-randconfig-053-20241118 (https://download.01.org/0day-ci/archive/20241202/202412020616.l5tT3rpu-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412020616.l5tT3rpu-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/aio.c:1655:3-9: preceding lock on line 1653

vim +1655 fs/aio.c

01d7a356872eec Jens Axboe   2020-02-03  1622  
50252e4b5e989c Eric Biggers 2021-12-08  1623  /*
50252e4b5e989c Eric Biggers 2021-12-08  1624   * Safely lock the waitqueue which the request is on, synchronizing with the
50252e4b5e989c Eric Biggers 2021-12-08  1625   * case where the ->poll() provider decides to free its waitqueue early.
50252e4b5e989c Eric Biggers 2021-12-08  1626   *
50252e4b5e989c Eric Biggers 2021-12-08  1627   * Returns true on success, meaning that req->head->lock was locked, req->wait
50252e4b5e989c Eric Biggers 2021-12-08  1628   * is on req->head, and an RCU read lock was taken.  Returns false if the
50252e4b5e989c Eric Biggers 2021-12-08  1629   * request was already removed from its waitqueue (which might no longer exist).
50252e4b5e989c Eric Biggers 2021-12-08  1630   */
50252e4b5e989c Eric Biggers 2021-12-08  1631  static bool poll_iocb_lock_wq(struct poll_iocb *req)
50252e4b5e989c Eric Biggers 2021-12-08  1632  {
50252e4b5e989c Eric Biggers 2021-12-08  1633  	wait_queue_head_t *head;
50252e4b5e989c Eric Biggers 2021-12-08  1634  
50252e4b5e989c Eric Biggers 2021-12-08  1635  	/*
50252e4b5e989c Eric Biggers 2021-12-08  1636  	 * While we hold the waitqueue lock and the waitqueue is nonempty,
50252e4b5e989c Eric Biggers 2021-12-08  1637  	 * wake_up_pollfree() will wait for us.  However, taking the waitqueue
50252e4b5e989c Eric Biggers 2021-12-08  1638  	 * lock in the first place can race with the waitqueue being freed.
50252e4b5e989c Eric Biggers 2021-12-08  1639  	 *
50252e4b5e989c Eric Biggers 2021-12-08  1640  	 * We solve this as eventpoll does: by taking advantage of the fact that
50252e4b5e989c Eric Biggers 2021-12-08  1641  	 * all users of wake_up_pollfree() will RCU-delay the actual free.  If
50252e4b5e989c Eric Biggers 2021-12-08  1642  	 * we enter rcu_read_lock() and see that the pointer to the queue is
50252e4b5e989c Eric Biggers 2021-12-08  1643  	 * non-NULL, we can then lock it without the memory being freed out from
50252e4b5e989c Eric Biggers 2021-12-08  1644  	 * under us, then check whether the request is still on the queue.
50252e4b5e989c Eric Biggers 2021-12-08  1645  	 *
50252e4b5e989c Eric Biggers 2021-12-08  1646  	 * Keep holding rcu_read_lock() as long as we hold the queue lock, in
50252e4b5e989c Eric Biggers 2021-12-08  1647  	 * case the caller deletes the entry from the queue, leaving it empty.
50252e4b5e989c Eric Biggers 2021-12-08  1648  	 * In that case, only RCU prevents the queue memory from being freed.
50252e4b5e989c Eric Biggers 2021-12-08  1649  	 */
50252e4b5e989c Eric Biggers 2021-12-08  1650  	rcu_read_lock();
50252e4b5e989c Eric Biggers 2021-12-08  1651  	head = smp_load_acquire(&req->head);
50252e4b5e989c Eric Biggers 2021-12-08  1652  	if (head) {
50252e4b5e989c Eric Biggers 2021-12-08 @1653  		spin_lock(&head->lock);
50252e4b5e989c Eric Biggers 2021-12-08  1654  		if (!list_empty(&req->wait.entry))
50252e4b5e989c Eric Biggers 2021-12-08 @1655  			return true;
50252e4b5e989c Eric Biggers 2021-12-08  1656  		spin_unlock(&head->lock);
50252e4b5e989c Eric Biggers 2021-12-08  1657  	}
50252e4b5e989c Eric Biggers 2021-12-08  1658  	rcu_read_unlock();
50252e4b5e989c Eric Biggers 2021-12-08  1659  	return false;
50252e4b5e989c Eric Biggers 2021-12-08  1660  }
50252e4b5e989c Eric Biggers 2021-12-08  1661  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
