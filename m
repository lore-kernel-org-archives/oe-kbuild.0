Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53541F1315
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Dec 2025 21:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765229412; cv=none; b=XEqRk4Js8um0J5QL+Bndp0Oky/lh5grmOMYWcDB8hfUl0g2xuyS+AHfiTwyOyd841CkcWBn5OAwPCpUN21a0XyIqxFJH6MIPrvlE85L4vK8YLG/LnQ6BF1F9OTLuI8bJtKtdgpzBoVQoh/GsZk3opqMzEkLkKRA8AkRb6ZG1aQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765229412; c=relaxed/simple;
	bh=POmdIVORW0Es22fRVRoCEcKiIo9q3BJJeRo1XRmYQGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UEwHHrDOzTHwFdr0bHJgW/R6HIzvuee9FGg/lq6FsDS+c0aOem3ew+o+FYeD7vge/mWx7eUtSDM+eyVbt8jny3V+6yHM+jnza9GT7WpXUXixORTV2o5jrQnMODpWz+xaaIlQtohrxiimsIYHppT/j/k1qkpARUda6WYVGpEyKf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c73mJ8Gs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c73mJ8Gs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765229410; x=1796765410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=POmdIVORW0Es22fRVRoCEcKiIo9q3BJJeRo1XRmYQGM=;
  b=c73mJ8GsSPsLBLTQXRm0b+QBJWe/Tz+VJACr5a5RM1YByE57PPI+NKDf
   TcpuxiQVQqbFUjWl7Ve+LKLUgLrnasKUMGSJFtF7elHTSOyozNGYDi6Im
   yZwTNVNVGeGpkxJLuT4/pApuTsX+HbkUO6lZ3Z2cmtkbWlBnMn48GHTGU
   RC5boo2LAfDbznA5JJr2sxOKmH7npUu98FThnS67NWnc71lJq4I4BTg0+
   NiNKblRmxRAe9nEWo7q0RdYuFBKRQYKW3mLoIEWL6aQZlOD7LTQ/dMh9Q
   dE6aovD6uWTyUkbL353LuJSEAVSDoxupgtBs982RP3lp15RjuWafhyJ1p
   w==;
X-CSE-ConnectionGUID: MF/rD47gTFqLDHvxL7irng==
X-CSE-MsgGUID: EFfP34IETBShMYvnWODoug==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="69771982"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="69771982"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 13:30:09 -0800
X-CSE-ConnectionGUID: gYH+tNDCSLuEfQc0zeecsg==
X-CSE-MsgGUID: ZvLx7g9iSeuM4vxejdQqEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="201163664"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Dec 2025 13:30:08 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSio1-000000000sN-2qbC;
	Mon, 08 Dec 2025 21:30:05 +0000
Date: Tue, 9 Dec 2025 05:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] scsi: scsi_dh: Return error pointer in
 scsi_dh_attached_handler_name
Message-ID: <202512090433.p58QdjEJ-lkp@intel.com>
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
In-Reply-To: <20251206010015.1595225-1-bmarzins@redhat.com>
References: <20251206010015.1595225-1-bmarzins@redhat.com>
TO: Benjamin Marzinski <bmarzins@redhat.com>
TO: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
TO: "Martin K . Petersen" <martin.petersen@oracle.com>
TO: Mikulas Patocka <mpatocka@redhat.com>
TO: Mike Snitzer <snitzer@kernel.org>
CC: linux-scsi@vger.kernel.org
CC: dm-devel@lists.linux.dev
CC: Martin Wilck <mwilck@suse.com>

Hi Benjamin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jejb-scsi/for-next]
[also build test WARNING on mkp-scsi/for-next device-mapper-dm/for-next linus/master v6.18 next-20251208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Marzinski/scsi-scsi_dh-Return-error-pointer-in-scsi_dh_attached_handler_name/20251206-090603
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20251206010015.1595225-1-bmarzins%40redhat.com
patch subject: [PATCH v2] scsi: scsi_dh: Return error pointer in scsi_dh_attached_handler_name
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20251208 (https://download.01.org/0day-ci/archive/20251209/202512090433.p58QdjEJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512090433.p58QdjEJ-lkp@intel.com/

smatch warnings:
drivers/md/dm-mpath.c:997 parse_path() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +997 drivers/md/dm-mpath.c

848b8aefd44df9 Mike Snitzer        2017-12-10  936  
848b8aefd44df9 Mike Snitzer        2017-12-10  937  static struct pgpath *parse_path(struct dm_arg_set *as, struct path_selector *ps,
848b8aefd44df9 Mike Snitzer        2017-12-10  938  				 struct dm_target *ti)
848b8aefd44df9 Mike Snitzer        2017-12-10  939  {
848b8aefd44df9 Mike Snitzer        2017-12-10  940  	int r;
848b8aefd44df9 Mike Snitzer        2017-12-10  941  	struct pgpath *p;
848b8aefd44df9 Mike Snitzer        2017-12-10  942  	struct multipath *m = ti->private;
e8f74a0f00113d Mike Snitzer        2018-03-12  943  	struct request_queue *q;
b592211c33f745 Mike Snitzer        2018-09-17  944  	const char *attached_handler_name = NULL;
848b8aefd44df9 Mike Snitzer        2017-12-10  945  
848b8aefd44df9 Mike Snitzer        2017-12-10  946  	/* we need at least a path arg */
848b8aefd44df9 Mike Snitzer        2017-12-10  947  	if (as->argc < 1) {
848b8aefd44df9 Mike Snitzer        2017-12-10  948  		ti->error = "no device given";
848b8aefd44df9 Mike Snitzer        2017-12-10  949  		return ERR_PTR(-EINVAL);
848b8aefd44df9 Mike Snitzer        2017-12-10  950  	}
848b8aefd44df9 Mike Snitzer        2017-12-10  951  
848b8aefd44df9 Mike Snitzer        2017-12-10  952  	p = alloc_pgpath();
848b8aefd44df9 Mike Snitzer        2017-12-10  953  	if (!p)
848b8aefd44df9 Mike Snitzer        2017-12-10  954  		return ERR_PTR(-ENOMEM);
848b8aefd44df9 Mike Snitzer        2017-12-10  955  
848b8aefd44df9 Mike Snitzer        2017-12-10  956  	r = dm_get_device(ti, dm_shift_arg(as), dm_table_get_mode(ti->table),
848b8aefd44df9 Mike Snitzer        2017-12-10  957  			  &p->path.dev);
848b8aefd44df9 Mike Snitzer        2017-12-10  958  	if (r) {
848b8aefd44df9 Mike Snitzer        2017-12-10  959  		ti->error = "error getting device";
2bfd2e1337f0d8 Chandra Seetharaman 2009-08-03  960  		goto bad;
2bfd2e1337f0d8 Chandra Seetharaman 2009-08-03  961  	}
848b8aefd44df9 Mike Snitzer        2017-12-10  962  
e8f74a0f00113d Mike Snitzer        2018-03-12  963  	q = bdev_get_queue(p->path.dev->bdev);
e8f74a0f00113d Mike Snitzer        2018-03-12  964  	attached_handler_name = scsi_dh_attached_handler_name(q, GFP_KERNEL);
1d31c0d9c94dbd Benjamin Marzinski  2025-12-05  965  	if (IS_ERR(attached_handler_name)) {
1d31c0d9c94dbd Benjamin Marzinski  2025-12-05  966  		if (PTR_ERR(attached_handler_name) == -ENODEV) {
1d31c0d9c94dbd Benjamin Marzinski  2025-12-05  967  			if (m->hw_handler_name) {
1d31c0d9c94dbd Benjamin Marzinski  2025-12-05  968  				DMERR("hardware handlers are only allowed for scsi devices");
1d31c0d9c94dbd Benjamin Marzinski  2025-12-05  969  				kfree(m->hw_handler_name);
1d31c0d9c94dbd Benjamin Marzinski  2025-12-05  970  				m->hw_handler_name = NULL;
1d31c0d9c94dbd Benjamin Marzinski  2025-12-05  971  			}
1d31c0d9c94dbd Benjamin Marzinski  2025-12-05  972  			attached_handler_name = NULL;
1d31c0d9c94dbd Benjamin Marzinski  2025-12-05  973  		} else {
1d31c0d9c94dbd Benjamin Marzinski  2025-12-05  974  			r = PTR_ERR(attached_handler_name);
1d31c0d9c94dbd Benjamin Marzinski  2025-12-05  975  			goto bad;
1d31c0d9c94dbd Benjamin Marzinski  2025-12-05  976  		}
1d31c0d9c94dbd Benjamin Marzinski  2025-12-05  977  	}
e457edf0b21c87 Mike Snitzer        2018-03-29  978  	if (attached_handler_name || m->hw_handler_name) {
848b8aefd44df9 Mike Snitzer        2017-12-10  979  		INIT_DELAYED_WORK(&p->activate_path, activate_path_work);
b592211c33f745 Mike Snitzer        2018-09-17  980  		r = setup_scsi_dh(p->path.dev->bdev, m, &attached_handler_name, &ti->error);
940bc471780b00 Martin Wilck        2019-04-29  981  		kfree(attached_handler_name);
848b8aefd44df9 Mike Snitzer        2017-12-10  982  		if (r) {
848b8aefd44df9 Mike Snitzer        2017-12-10  983  			dm_put_device(ti, p->path.dev);
848b8aefd44df9 Mike Snitzer        2017-12-10  984  			goto bad;
2bfd2e1337f0d8 Chandra Seetharaman 2009-08-03  985  		}
ae11b1b36da726 Hannes Reinecke     2008-07-17  986  	}
ae11b1b36da726 Hannes Reinecke     2008-07-17  987  
^1da177e4c3f41 Linus Torvalds      2005-04-16  988  	r = ps->type->add_path(ps, &p->path, as->argc, as->argv, &ti->error);
^1da177e4c3f41 Linus Torvalds      2005-04-16  989  	if (r) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  990  		dm_put_device(ti, p->path.dev);
^1da177e4c3f41 Linus Torvalds      2005-04-16  991  		goto bad;
^1da177e4c3f41 Linus Torvalds      2005-04-16  992  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  993  
^1da177e4c3f41 Linus Torvalds      2005-04-16  994  	return p;
^1da177e4c3f41 Linus Torvalds      2005-04-16  995   bad:
^1da177e4c3f41 Linus Torvalds      2005-04-16  996  	free_pgpath(p);
01460f3520c100 Benjamin Marzinski  2008-10-10 @997  	return ERR_PTR(r);
^1da177e4c3f41 Linus Torvalds      2005-04-16  998  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  999  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
