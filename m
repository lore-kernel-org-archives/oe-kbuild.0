Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD267307AF4
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jul 2026 16:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783096518; cv=none; b=AuV3pZT0RU5eSeQknSzMRA9Sr7tX4BOXb6eBQ//RZ6funlpBGNhKULwQdK9Uc2kvXPkYL48B92YRMU4dZJq73oUIVdnA8mdyTTHXQJNEMWBGhGRIto0WAxHjoud0khUUb2mzSRIpCvCSjTg5IAMa97wfGxoeVCL+d8MiSzV/FDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783096518; c=relaxed/simple;
	bh=nXQGZPinjXMaIAXUy5XzQEEB19m28JjYfRk715IFF8w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XJHggNAd492R5jn6On42SWoM3a2bbyP1WlLWmscemzlT+6+sIcC7ZI3PhV7VyEUycYQ8h1zES2v1kaW/eNvTNLoKye7yUuznSK+rviq9L5PB9aCxebKnTYNQTcAqA4CwvIO6vAgCftcNLYnmgTWhcNqXd+iRniPB4QFaG0JRRvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1TQQ74s; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1TQQ74s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783096516; x=1814632516;
  h=date:from:to:cc:subject:message-id;
  bh=nXQGZPinjXMaIAXUy5XzQEEB19m28JjYfRk715IFF8w=;
  b=m1TQQ74sEh9qKGrcpqOwM+wVEn4jAFYXymoy7SVbkAZCXvVcMoNj84no
   IC6Cy/Q/wp1c76N6CVqBO+kxrxeA47pEqNhvOmEn/R0zKCQxQp3aWCaVh
   J6dqm6kHDUkD8UN95AVFxNsADMKBR+dptuIYDg4sPl2/kAMV4zm2Wukja
   cb0lfdR65WuJHf2HjF01Pa4CisoLXhtIkqzl3Z175gFKF28Yfxaxni5Ot
   AnL1hJMIgRibw+wP7OS3+n0bOnYVKLYIV/0HUT2gjzxwDy6OOt1nLEGO2
   ZeMnI/qbsyyAWHwzzMJtI1bglO24QQZkllvmQJ7RwTVHBm8a7EvR6bb8x
   w==;
X-CSE-ConnectionGUID: 08T6blAmRYaheIusnpJtnA==
X-CSE-MsgGUID: QcAhy6hFRf6VJVbULnbHnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="109396497"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="109396497"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 09:35:16 -0700
X-CSE-ConnectionGUID: c6fd5nOGSSe4nJqdK2yHew==
X-CSE-MsgGUID: s0wL1V2GSdGZw10S357CjQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 03 Jul 2026 09:35:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfgrA-00000000CMv-41Oh;
	Fri, 03 Jul 2026 16:35:12 +0000
Date: Sat, 04 Jul 2026 00:34:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/md/dm-mpath.c:997 parse_path() warn: passing zero to
 'ERR_PTR'
Message-ID: <202607040054.qr0AdRcK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Benjamin Marzinski <bmarzins@redhat.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Martin Wilck <mwilck@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2c9a99135da931377240942d44f3dea104cedb8
commit: fd81bc5cca8fc6936a8988de6b5d4c5693b6587e scsi: device_handler: Return error pointer in scsi_dh_attached_handler_name()
date:   7 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-r073-20260703 (https://download.01.org/0day-ci/archive/20260704/202607040054.qr0AdRcK-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: fd81bc5cca8f ("scsi: device_handler: Return error pointer in scsi_dh_attached_handler_name()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607040054.qr0AdRcK-lkp@intel.com/

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
fd81bc5cca8fc6 Benjamin Marzinski  2025-12-05  965  	if (IS_ERR(attached_handler_name)) {
fd81bc5cca8fc6 Benjamin Marzinski  2025-12-05  966  		if (PTR_ERR(attached_handler_name) == -ENODEV) {
fd81bc5cca8fc6 Benjamin Marzinski  2025-12-05  967  			if (m->hw_handler_name) {
fd81bc5cca8fc6 Benjamin Marzinski  2025-12-05  968  				DMERR("hardware handlers are only allowed for SCSI devices");
fd81bc5cca8fc6 Benjamin Marzinski  2025-12-05  969  				kfree(m->hw_handler_name);
fd81bc5cca8fc6 Benjamin Marzinski  2025-12-05  970  				m->hw_handler_name = NULL;
fd81bc5cca8fc6 Benjamin Marzinski  2025-12-05  971  			}
fd81bc5cca8fc6 Benjamin Marzinski  2025-12-05  972  			attached_handler_name = NULL;
fd81bc5cca8fc6 Benjamin Marzinski  2025-12-05  973  		} else {
fd81bc5cca8fc6 Benjamin Marzinski  2025-12-05  974  			r = PTR_ERR(attached_handler_name);
fd81bc5cca8fc6 Benjamin Marzinski  2025-12-05  975  			goto bad;
fd81bc5cca8fc6 Benjamin Marzinski  2025-12-05  976  		}
fd81bc5cca8fc6 Benjamin Marzinski  2025-12-05  977  	}
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

:::::: The code at line 997 was first introduced by commit
:::::: 01460f3520c100010aacc8f8500cafcb17ce4665 dm mpath: use more error codes

:::::: TO: Benjamin Marzinski <bmarzins@redhat.com>
:::::: CC: Alasdair G Kergon <agk@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
