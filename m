Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FF22494FF
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 04:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772773139; cv=none; b=QyG6t++IhNLu+V5QJrHCOG1duq4wHgzio/hXSfVOx9v/UcsA8zrpRYUNIJwiEZCDXgpwcdKOpbpziblk+TGVNKIZJzhJEIT8VI/Is/tq40O8DnwW5wxan/8d0hVc0GDxhlISQdUH2BjL939C6aIohfsyuXaw0sG5qG11CgftRP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772773139; c=relaxed/simple;
	bh=j0Bn4I3h+euTkEl57G1j+84GOhuItssBhxg/zM3bmlI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I+dzgbQXJLPk+jkV2FJDM1tSaSAN5J/JXIrrGokXq9IfLopaiPwrDKMj2rHLe2kCSIzozibh0pbDFa/xhNkbEe55QNA3ZmdPf8AEB9NemLaKUVwcNTlVJY/oNZO2gwSijxJDOv+w9F9vxdEcFawYI9JFWpBOVWysnRzKOFpqTVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hynd4MiO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hynd4MiO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772773136; x=1804309136;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=j0Bn4I3h+euTkEl57G1j+84GOhuItssBhxg/zM3bmlI=;
  b=hynd4MiOLS3PitKk/4ENVu1pfS6vY1XjaRC88pPKwwGNhIAHheKRW8nQ
   LWYU8fD7YDjjuH7h2e9n9sFRo0Z4zqxKLyScIcvV694ljFYbY/0zkKE7d
   NCnB2rvan2WEDldYkHj3gceoLpNiOBF4wypWKX5/nvZvhpkwdfm9C35fO
   iLoWXnT5i9wt6KgcFlGOuImdFscUQB30tyuYgTnKCXMM8fZCav4ua1gDL
   X3LeOTZYtrz/OtSZElmGnSFhXDf4DDbVtnK9DuFMgL5LREU6zwpF9bHpT
   ou5RH+jVheEsRXC6jUiambs+7zNAvHUXCeEKk/6moL/2z0UUbphhwnpgl
   A==;
X-CSE-ConnectionGUID: 1mNrYf9DR22EoDotHzy1Og==
X-CSE-MsgGUID: dPkR6vZHTUSENGb8xgy5nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="99347195"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="99347195"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 20:58:56 -0800
X-CSE-ConnectionGUID: kK5ei7lvSaCR8DYqPfUZZg==
X-CSE-MsgGUID: k42tiY8zTkaT6wewSVVo3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="218898175"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Mar 2026 20:58:54 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyNH1-000000000Nh-2nr2;
	Fri, 06 Mar 2026 04:58:51 +0000
Date: Fri, 6 Mar 2026 12:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH 05/14] drbd: Make the lock context annotations compatible
 with Clang
Message-ID: <202603061238.WbZr6WGt-lkp@intel.com>
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
In-Reply-To: <20260304194843.760669-6-bvanassche@acm.org>
References: <20260304194843.760669-6-bvanassche@acm.org>
TO: Bart Van Assche <bvanassche@acm.org>
TO: Jens Axboe <axboe@kernel.dk>
CC: Christoph Hellwig <hch@lst.de>
CC: Damien Le Moal <dlemoal@kernel.org>
CC: Marco Elver <elver@google.com>
CC: linux-block@vger.kernel.org
CC: Bart Van Assche <bvanassche@acm.org>
CC: Philipp Reisner <philipp.reisner@linbit.com>
CC: Lars Ellenberg <lars.ellenberg@linbit.com>
CC: "Christoph Böhmwalder" <christoph.boehmwalder@linbit.com>
CC: Nathan Chancellor <nathan@kernel.org>

Hi Bart,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe/for-next]
[also build test WARNING on bpf-next/net bpf-next/master bpf/master linus/master v7.0-rc2 next-20260305]
[cannot apply to ceph-client/testing ceph-client/for-linus hch-configfs/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/drbd-Balance-RCU-calls-in-drbd_adm_dump_devices/20260305-035510
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20260304194843.760669-6-bvanassche%40acm.org
patch subject: [PATCH 05/14] drbd: Make the lock context annotations compatible with Clang
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: openrisc-randconfig-r053-20260306 (https://download.01.org/0day-ci/archive/20260306/202603061238.WbZr6WGt-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603061238.WbZr6WGt-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/block/drbd/drbd_bitmap.c:132:16-25: ERROR: b is NULL but dereferenced.
   drivers/block/drbd/drbd_bitmap.c:159:16-25: ERROR: b is NULL but dereferenced.

vim +132 drivers/block/drbd/drbd_bitmap.c

b411b3637fa71fc Philipp Reisner     2009-09-25  123  
b30ab7913b0a7b1 Andreas Gruenbacher 2011-07-03  124  void drbd_bm_lock(struct drbd_device *device, char *why, enum bm_flag flags)
9c640e625a48df2 Bart Van Assche     2026-03-04  125  	__acquires(&device->bitmap->bm_change)
b411b3637fa71fc Philipp Reisner     2009-09-25  126  {
b30ab7913b0a7b1 Andreas Gruenbacher 2011-07-03  127  	struct drbd_bitmap *b = device->bitmap;
b411b3637fa71fc Philipp Reisner     2009-09-25  128  	int trylock_failed;
b411b3637fa71fc Philipp Reisner     2009-09-25  129  
b411b3637fa71fc Philipp Reisner     2009-09-25  130  	if (!b) {
d01801710265cfb Andreas Gruenbacher 2011-07-03  131  		drbd_err(device, "FIXME no bitmap in drbd_bm_lock!?\n");
9c640e625a48df2 Bart Van Assche     2026-03-04 @132  		__acquire(&b->bm_change);
b411b3637fa71fc Philipp Reisner     2009-09-25  133  		return;
b411b3637fa71fc Philipp Reisner     2009-09-25  134  	}
b411b3637fa71fc Philipp Reisner     2009-09-25  135  
8a03ae2a5baed3d Thomas Gleixner     2010-01-29  136  	trylock_failed = !mutex_trylock(&b->bm_change);
b411b3637fa71fc Philipp Reisner     2009-09-25  137  
b411b3637fa71fc Philipp Reisner     2009-09-25  138  	if (trylock_failed) {
c60b0251d9d3501 Andreas Gruenbacher 2011-08-10  139  		drbd_warn(device, "%s[%d] going to '%s' but bitmap already locked for '%s' by %s[%d]\n",
c60b0251d9d3501 Andreas Gruenbacher 2011-08-10  140  			  current->comm, task_pid_nr(current),
b411b3637fa71fc Philipp Reisner     2009-09-25  141  			  why, b->bm_why ?: "?",
c60b0251d9d3501 Andreas Gruenbacher 2011-08-10  142  			  b->bm_task->comm, task_pid_nr(b->bm_task));
8a03ae2a5baed3d Thomas Gleixner     2010-01-29  143  		mutex_lock(&b->bm_change);
b411b3637fa71fc Philipp Reisner     2009-09-25  144  	}
20ceb2b22edaf51 Lars Ellenberg      2011-01-21  145  	if (BM_LOCKED_MASK & b->bm_flags)
d01801710265cfb Andreas Gruenbacher 2011-07-03  146  		drbd_err(device, "FIXME bitmap already locked in bm_lock\n");
20ceb2b22edaf51 Lars Ellenberg      2011-01-21  147  	b->bm_flags |= flags & BM_LOCKED_MASK;
b411b3637fa71fc Philipp Reisner     2009-09-25  148  
b411b3637fa71fc Philipp Reisner     2009-09-25  149  	b->bm_why  = why;
b411b3637fa71fc Philipp Reisner     2009-09-25  150  	b->bm_task = current;
b411b3637fa71fc Philipp Reisner     2009-09-25  151  }
b411b3637fa71fc Philipp Reisner     2009-09-25  152  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
