Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC46817BB21
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 22:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768256184; cv=none; b=nn4Flb/ThgEyB1q/vjbfRX39OS5eNJv6hzgFCb7DAzKMHR7SSStMAFWKVmUau0mtM2xoBD4CaWLOaVBjGZGzP8f8S/OF4MbWhf012NgyeEivzS9z3K4FbLYqHzrhS4NxrhYK3pnF933z+Si1Oj74EwRUhWJhbOOBuYUWc+08Zi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768256184; c=relaxed/simple;
	bh=dzic9aHHCBU9kAqMXcLSoLdG+gFhEoH3UuPFUiulXjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Crj/UwpiiAQw6bsOrhEL8pIg8s5MJ0Vv1BfczEJoQKhsJeFGX1R0CQm0h/2pq3dihwXrgeRnU+kCpRz/MZ2i/FNAzuDJvto742gF+7MWrAGauVKJpG6azkDuiZY2DIAhUH7xMU15ISFH3UEtcccWM+jOP6cOKhL+MF19zg7qP+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bNleag/Y; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bNleag/Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768256182; x=1799792182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dzic9aHHCBU9kAqMXcLSoLdG+gFhEoH3UuPFUiulXjo=;
  b=bNleag/YIE65nqphJsNI4uSmNwTpZS5eH4qi5HfONAbKftRQgvAxwn+L
   t8bERbi6LtHooYr6hgdTC7mWO57JyRyYNRpcvWy+qvnlqF+3bzqFqmsJa
   Qaf54XvVu0t7lWvWYsxDrBuiEnHaOiVyrHrj0PEPcKaoMYq8UVMjzl7nu
   wVKXMnF85Z5pUY0jPZlYSmYl/X3RQ9Q43JnaLnzAQhGHHl0M8d/0IDoLG
   eQqOEy0/ayoEhDhWTMnXkBpG5H5wCG0rZatIb/cxpyqKP9hNKfyBR76sC
   ym/v+PROYdSAWhlLe8ZJMGD0+TEaoyjuTIiTCXnr6uNcDAalGLsdymteu
   Q==;
X-CSE-ConnectionGUID: ELSEIkl7TO6rYSJOlLndcA==
X-CSE-MsgGUID: 77FhhhOJQQS80oMgurkTnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73390370"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73390370"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 14:16:21 -0800
X-CSE-ConnectionGUID: 6+1cou33TcWOiWnLTFjhCA==
X-CSE-MsgGUID: cakEH76DTLC+olmEA4rKcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="209040747"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jan 2026 14:16:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfQCv-00000000Dvo-3B0q;
	Mon, 12 Jan 2026 22:16:17 +0000
Date: Tue, 13 Jan 2026 06:15:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 05/11] md/raid5: make sure max_sectors is not less
 than io_opt
Message-ID: <202601130531.LGfcZsa4-lkp@intel.com>
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
In-Reply-To: <20260112042857.2334264-6-yukuai@fnnas.com>
References: <20260112042857.2334264-6-yukuai@fnnas.com>
TO: Yu Kuai <yukuai@fnnas.com>
TO: linux-raid@vger.kernel.org
TO: linan122@huawei.com
CC: yukuai@fnnas.com

Hi Yu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19-rc5 next-20260109]
[cannot apply to song-md/md-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/md-merge-mddev-has_superblock-into-mddev_flags/20260112-123233
base:   linus/master
patch link:    https://lore.kernel.org/r/20260112042857.2334264-6-yukuai%40fnnas.com
patch subject: [PATCH v4 05/11] md/raid5: make sure max_sectors is not less than io_opt
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: i386-randconfig-141-20260113 (https://download.01.org/0day-ci/archive/20260113/202601130531.LGfcZsa4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601130531.LGfcZsa4-lkp@intel.com/

New smatch warnings:
drivers/md/raid5.c:8100 raid5_run() warn: missing error code 'ret'

Old smatch warnings:
drivers/md/raid5.c:2880 raid5_end_write_request() error: uninitialized symbol 'rdev'.
drivers/md/raid5.c:2885 raid5_end_write_request() error: uninitialized symbol 'rdev'.
drivers/md/raid5.c:8580 raid5_start_reshape() warn: mixing irq and irqsave

vim +/ret +8100 drivers/md/raid5.c

16ef510139315a Christoph Hellwig    2020-09-24  7829  
849674e4fb175e Shaohua Li           2016-01-20  7830  static int raid5_run(struct mddev *mddev)
91adb56473febe NeilBrown            2009-03-31  7831  {
d1688a6d5515f1 NeilBrown            2011-10-11  7832  	struct r5conf *conf;
c148ffdcda00b6 NeilBrown            2009-11-13  7833  	int dirty_parity_disks = 0;
3cb03002000f13 NeilBrown            2011-10-11  7834  	struct md_rdev *rdev;
713cf5a63954bd Shaohua Li           2015-08-13  7835  	struct md_rdev *journal_dev = NULL;
c148ffdcda00b6 NeilBrown            2009-11-13  7836  	sector_t reshape_offset = 0;
c567c86b90d471 Yu Kuai              2023-06-22  7837  	int i;
b5254dd5fdd9ab NeilBrown            2012-05-21  7838  	long long min_offset_diff = 0;
b5254dd5fdd9ab NeilBrown            2012-05-21  7839  	int first = 1;
f63f17350e5373 Christoph Hellwig    2024-03-03  7840  	int ret = -EIO;
91adb56473febe NeilBrown            2009-03-31  7841  
907a99c314a5a6 Li Nan               2025-07-22  7842  	if (mddev->resync_offset != MaxSector)
cc6167b4f3b3ca NeilBrown            2016-11-02  7843  		pr_notice("md/raid:%s: not clean -- starting background reconstruction\n",
8c6ac868b107ed Andre Noll           2009-06-18  7844  			  mdname(mddev));
b5254dd5fdd9ab NeilBrown            2012-05-21  7845  
b5254dd5fdd9ab NeilBrown            2012-05-21  7846  	rdev_for_each(rdev, mddev) {
b5254dd5fdd9ab NeilBrown            2012-05-21  7847  		long long diff;
713cf5a63954bd Shaohua Li           2015-08-13  7848  
f2076e7d0643d1 Shaohua Li           2015-10-08  7849  		if (test_bit(Journal, &rdev->flags)) {
713cf5a63954bd Shaohua Li           2015-08-13  7850  			journal_dev = rdev;
f2076e7d0643d1 Shaohua Li           2015-10-08  7851  			continue;
f2076e7d0643d1 Shaohua Li           2015-10-08  7852  		}
b5254dd5fdd9ab NeilBrown            2012-05-21  7853  		if (rdev->raid_disk < 0)
b5254dd5fdd9ab NeilBrown            2012-05-21  7854  			continue;
b5254dd5fdd9ab NeilBrown            2012-05-21  7855  		diff = (rdev->new_data_offset - rdev->data_offset);
b5254dd5fdd9ab NeilBrown            2012-05-21  7856  		if (first) {
b5254dd5fdd9ab NeilBrown            2012-05-21  7857  			min_offset_diff = diff;
b5254dd5fdd9ab NeilBrown            2012-05-21  7858  			first = 0;
b5254dd5fdd9ab NeilBrown            2012-05-21  7859  		} else if (mddev->reshape_backwards &&
b5254dd5fdd9ab NeilBrown            2012-05-21  7860  			 diff < min_offset_diff)
b5254dd5fdd9ab NeilBrown            2012-05-21  7861  			min_offset_diff = diff;
b5254dd5fdd9ab NeilBrown            2012-05-21  7862  		else if (!mddev->reshape_backwards &&
b5254dd5fdd9ab NeilBrown            2012-05-21  7863  			 diff > min_offset_diff)
b5254dd5fdd9ab NeilBrown            2012-05-21  7864  			min_offset_diff = diff;
b5254dd5fdd9ab NeilBrown            2012-05-21  7865  	}
b5254dd5fdd9ab NeilBrown            2012-05-21  7866  
230b55fa8d6400 NeilBrown            2017-10-17  7867  	if ((test_bit(MD_HAS_JOURNAL, &mddev->flags) || journal_dev) &&
230b55fa8d6400 NeilBrown            2017-10-17  7868  	    (mddev->bitmap_info.offset || mddev->bitmap_info.file)) {
230b55fa8d6400 NeilBrown            2017-10-17  7869  		pr_notice("md/raid:%s: array cannot have both journal and bitmap\n",
230b55fa8d6400 NeilBrown            2017-10-17  7870  			  mdname(mddev));
c567c86b90d471 Yu Kuai              2023-06-22  7871  		return -EINVAL;
230b55fa8d6400 NeilBrown            2017-10-17  7872  	}
230b55fa8d6400 NeilBrown            2017-10-17  7873  
91adb56473febe NeilBrown            2009-03-31  7874  	if (mddev->reshape_position != MaxSector) {
91adb56473febe NeilBrown            2009-03-31  7875  		/* Check that we can continue the reshape.
b5254dd5fdd9ab NeilBrown            2012-05-21  7876  		 * Difficulties arise if the stripe we would write to
b5254dd5fdd9ab NeilBrown            2012-05-21  7877  		 * next is at or after the stripe we would read from next.
b5254dd5fdd9ab NeilBrown            2012-05-21  7878  		 * For a reshape that changes the number of devices, this
b5254dd5fdd9ab NeilBrown            2012-05-21  7879  		 * is only possible for a very short time, and mdadm makes
b5254dd5fdd9ab NeilBrown            2012-05-21  7880  		 * sure that time appears to have past before assembling
b5254dd5fdd9ab NeilBrown            2012-05-21  7881  		 * the array.  So we fail if that time hasn't passed.
b5254dd5fdd9ab NeilBrown            2012-05-21  7882  		 * For a reshape that keeps the number of devices the same
b5254dd5fdd9ab NeilBrown            2012-05-21  7883  		 * mdadm must be monitoring the reshape can keeping the
b5254dd5fdd9ab NeilBrown            2012-05-21  7884  		 * critical areas read-only and backed up.  It will start
b5254dd5fdd9ab NeilBrown            2012-05-21  7885  		 * the array in read-only mode, so we check for that.
91adb56473febe NeilBrown            2009-03-31  7886  		 */
91adb56473febe NeilBrown            2009-03-31  7887  		sector_t here_new, here_old;
91adb56473febe NeilBrown            2009-03-31  7888  		int old_disks;
18b0033491f584 Andre Noll           2009-03-31  7889  		int max_degraded = (mddev->level == 6 ? 2 : 1);
05256d9884d327 NeilBrown            2015-07-15  7890  		int chunk_sectors;
05256d9884d327 NeilBrown            2015-07-15  7891  		int new_data_disks;
91adb56473febe NeilBrown            2009-03-31  7892  
713cf5a63954bd Shaohua Li           2015-08-13  7893  		if (journal_dev) {
cc6167b4f3b3ca NeilBrown            2016-11-02  7894  			pr_warn("md/raid:%s: don't support reshape with journal - aborting.\n",
713cf5a63954bd Shaohua Li           2015-08-13  7895  				mdname(mddev));
c567c86b90d471 Yu Kuai              2023-06-22  7896  			return -EINVAL;
713cf5a63954bd Shaohua Li           2015-08-13  7897  		}
713cf5a63954bd Shaohua Li           2015-08-13  7898  
88ce4930e2b803 NeilBrown            2009-03-31  7899  		if (mddev->new_level != mddev->level) {
cc6167b4f3b3ca NeilBrown            2016-11-02  7900  			pr_warn("md/raid:%s: unsupported reshape required - aborting.\n",
91adb56473febe NeilBrown            2009-03-31  7901  				mdname(mddev));
c567c86b90d471 Yu Kuai              2023-06-22  7902  			return -EINVAL;
91adb56473febe NeilBrown            2009-03-31  7903  		}
91adb56473febe NeilBrown            2009-03-31  7904  		old_disks = mddev->raid_disks - mddev->delta_disks;
91adb56473febe NeilBrown            2009-03-31  7905  		/* reshape_position must be on a new-stripe boundary, and one
91adb56473febe NeilBrown            2009-03-31  7906  		 * further up in new geometry must map after here in old
91adb56473febe NeilBrown            2009-03-31  7907  		 * geometry.
05256d9884d327 NeilBrown            2015-07-15  7908  		 * If the chunk sizes are different, then as we perform reshape
05256d9884d327 NeilBrown            2015-07-15  7909  		 * in units of the largest of the two, reshape_position needs
05256d9884d327 NeilBrown            2015-07-15  7910  		 * be a multiple of the largest chunk size times new data disks.
91adb56473febe NeilBrown            2009-03-31  7911  		 */
91adb56473febe NeilBrown            2009-03-31  7912  		here_new = mddev->reshape_position;
05256d9884d327 NeilBrown            2015-07-15  7913  		chunk_sectors = max(mddev->chunk_sectors, mddev->new_chunk_sectors);
05256d9884d327 NeilBrown            2015-07-15  7914  		new_data_disks = mddev->raid_disks - max_degraded;
05256d9884d327 NeilBrown            2015-07-15  7915  		if (sector_div(here_new, chunk_sectors * new_data_disks)) {
cc6167b4f3b3ca NeilBrown            2016-11-02  7916  			pr_warn("md/raid:%s: reshape_position not on a stripe boundary\n",
cc6167b4f3b3ca NeilBrown            2016-11-02  7917  				mdname(mddev));
c567c86b90d471 Yu Kuai              2023-06-22  7918  			return -EINVAL;
91adb56473febe NeilBrown            2009-03-31  7919  		}
05256d9884d327 NeilBrown            2015-07-15  7920  		reshape_offset = here_new * chunk_sectors;
91adb56473febe NeilBrown            2009-03-31  7921  		/* here_new is the stripe we will write to */
91adb56473febe NeilBrown            2009-03-31  7922  		here_old = mddev->reshape_position;
05256d9884d327 NeilBrown            2015-07-15  7923  		sector_div(here_old, chunk_sectors * (old_disks-max_degraded));
91adb56473febe NeilBrown            2009-03-31  7924  		/* here_old is the first stripe that we might need to read
91adb56473febe NeilBrown            2009-03-31  7925  		 * from */
67ac6011db5d2b NeilBrown            2009-08-13  7926  		if (mddev->delta_disks == 0) {
67ac6011db5d2b NeilBrown            2009-08-13  7927  			/* We cannot be sure it is safe to start an in-place
b5254dd5fdd9ab NeilBrown            2012-05-21  7928  			 * reshape.  It is only safe if user-space is monitoring
67ac6011db5d2b NeilBrown            2009-08-13  7929  			 * and taking constant backups.
67ac6011db5d2b NeilBrown            2009-08-13  7930  			 * mdadm always starts a situation like this in
67ac6011db5d2b NeilBrown            2009-08-13  7931  			 * readonly mode so it can take control before
67ac6011db5d2b NeilBrown            2009-08-13  7932  			 * allowing any writes.  So just check for that.
67ac6011db5d2b NeilBrown            2009-08-13  7933  			 */
b5254dd5fdd9ab NeilBrown            2012-05-21  7934  			if (abs(min_offset_diff) >= mddev->chunk_sectors &&
b5254dd5fdd9ab NeilBrown            2012-05-21  7935  			    abs(min_offset_diff) >= mddev->new_chunk_sectors)
b5254dd5fdd9ab NeilBrown            2012-05-21  7936  				/* not really in-place - so OK */;
b5254dd5fdd9ab NeilBrown            2012-05-21  7937  			else if (mddev->ro == 0) {
cc6167b4f3b3ca NeilBrown            2016-11-02  7938  				pr_warn("md/raid:%s: in-place reshape must be started in read-only mode - aborting\n",
0c55e02259115c NeilBrown            2010-05-03  7939  					mdname(mddev));
c567c86b90d471 Yu Kuai              2023-06-22  7940  				return -EINVAL;
67ac6011db5d2b NeilBrown            2009-08-13  7941  			}
2c810cddc44d6f NeilBrown            2012-05-21  7942  		} else if (mddev->reshape_backwards
05256d9884d327 NeilBrown            2015-07-15  7943  		    ? (here_new * chunk_sectors + min_offset_diff <=
05256d9884d327 NeilBrown            2015-07-15  7944  		       here_old * chunk_sectors)
05256d9884d327 NeilBrown            2015-07-15  7945  		    : (here_new * chunk_sectors >=
05256d9884d327 NeilBrown            2015-07-15  7946  		       here_old * chunk_sectors + (-min_offset_diff))) {
91adb56473febe NeilBrown            2009-03-31  7947  			/* Reading from the same stripe as writing to - bad */
cc6167b4f3b3ca NeilBrown            2016-11-02  7948  			pr_warn("md/raid:%s: reshape_position too early for auto-recovery - aborting.\n",
0c55e02259115c NeilBrown            2010-05-03  7949  				mdname(mddev));
c567c86b90d471 Yu Kuai              2023-06-22  7950  			return -EINVAL;
91adb56473febe NeilBrown            2009-03-31  7951  		}
cc6167b4f3b3ca NeilBrown            2016-11-02  7952  		pr_debug("md/raid:%s: reshape will continue\n", mdname(mddev));
91adb56473febe NeilBrown            2009-03-31  7953  		/* OK, we should be able to continue; */
91adb56473febe NeilBrown            2009-03-31  7954  	} else {
91adb56473febe NeilBrown            2009-03-31  7955  		BUG_ON(mddev->level != mddev->new_level);
91adb56473febe NeilBrown            2009-03-31  7956  		BUG_ON(mddev->layout != mddev->new_layout);
664e7c413f1e90 Andre Noll           2009-06-18  7957  		BUG_ON(mddev->chunk_sectors != mddev->new_chunk_sectors);
91adb56473febe NeilBrown            2009-03-31  7958  		BUG_ON(mddev->delta_disks != 0);
91adb56473febe NeilBrown            2009-03-31  7959  	}
245f46c2c221ef NeilBrown            2009-03-31  7960  
3418d036c81dcb Artur Paszkiewicz    2017-03-09  7961  	if (test_bit(MD_HAS_JOURNAL, &mddev->flags) &&
3418d036c81dcb Artur Paszkiewicz    2017-03-09  7962  	    test_bit(MD_HAS_PPL, &mddev->flags)) {
3418d036c81dcb Artur Paszkiewicz    2017-03-09  7963  		pr_warn("md/raid:%s: using journal device and PPL not allowed - disabling PPL\n",
3418d036c81dcb Artur Paszkiewicz    2017-03-09  7964  			mdname(mddev));
3418d036c81dcb Artur Paszkiewicz    2017-03-09  7965  		clear_bit(MD_HAS_PPL, &mddev->flags);
ddc088238cd698 Pawel Baldysiak      2017-08-16  7966  		clear_bit(MD_HAS_MULTIPLE_PPLS, &mddev->flags);
3418d036c81dcb Artur Paszkiewicz    2017-03-09  7967  	}
3418d036c81dcb Artur Paszkiewicz    2017-03-09  7968  
245f46c2c221ef NeilBrown            2009-03-31  7969  	if (mddev->private == NULL)
91adb56473febe NeilBrown            2009-03-31  7970  		conf = setup_conf(mddev);
245f46c2c221ef NeilBrown            2009-03-31  7971  	else
245f46c2c221ef NeilBrown            2009-03-31  7972  		conf = mddev->private;
91adb56473febe NeilBrown            2009-03-31  7973  
c567c86b90d471 Yu Kuai              2023-06-22  7974  	if (IS_ERR(conf))
c567c86b90d471 Yu Kuai              2023-06-22  7975  		return PTR_ERR(conf);
91adb56473febe NeilBrown            2009-03-31  7976  
486b0f7bcd64be Song Liu             2016-08-19  7977  	if (test_bit(MD_HAS_JOURNAL, &mddev->flags)) {
486b0f7bcd64be Song Liu             2016-08-19  7978  		if (!journal_dev) {
cc6167b4f3b3ca NeilBrown            2016-11-02  7979  			pr_warn("md/raid:%s: journal disk is missing, force array readonly\n",
7dde2ad3c5b4af Shaohua Li           2015-10-08  7980  				mdname(mddev));
7dde2ad3c5b4af Shaohua Li           2015-10-08  7981  			mddev->ro = 1;
7dde2ad3c5b4af Shaohua Li           2015-10-08  7982  			set_disk_ro(mddev->gendisk, 1);
907a99c314a5a6 Li Nan               2025-07-22  7983  		} else if (mddev->resync_offset == MaxSector)
486b0f7bcd64be Song Liu             2016-08-19  7984  			set_bit(MD_JOURNAL_CLEAN, &mddev->flags);
7dde2ad3c5b4af Shaohua Li           2015-10-08  7985  	}
7dde2ad3c5b4af Shaohua Li           2015-10-08  7986  
b5254dd5fdd9ab NeilBrown            2012-05-21  7987  	conf->min_offset_diff = min_offset_diff;
44693154398272 Yu Kuai              2023-05-23  7988  	rcu_assign_pointer(mddev->thread, conf->thread);
44693154398272 Yu Kuai              2023-05-23  7989  	rcu_assign_pointer(conf->thread, NULL);
91adb56473febe NeilBrown            2009-03-31  7990  	mddev->private = conf;
91adb56473febe NeilBrown            2009-03-31  7991  
17045f52ac76d9 NeilBrown            2011-12-23  7992  	for (i = 0; i < conf->raid_disks && conf->previous_raid_disks;
17045f52ac76d9 NeilBrown            2011-12-23  7993  	     i++) {
ad8606702f2689 Yu Kuai              2023-11-25  7994  		rdev = conf->disks[i].rdev;
17045f52ac76d9 NeilBrown            2011-12-23  7995  		if (!rdev)
c148ffdcda00b6 NeilBrown            2009-11-13  7996  			continue;
ad8606702f2689 Yu Kuai              2023-11-25  7997  		if (conf->disks[i].replacement &&
17045f52ac76d9 NeilBrown            2011-12-23  7998  		    conf->reshape_progress != MaxSector) {
17045f52ac76d9 NeilBrown            2011-12-23  7999  			/* replacements and reshape simply do not mix. */
cc6167b4f3b3ca NeilBrown            2016-11-02  8000  			pr_warn("md: cannot handle concurrent replacement and reshape.\n");
17045f52ac76d9 NeilBrown            2011-12-23  8001  			goto abort;
17045f52ac76d9 NeilBrown            2011-12-23  8002  		}
7bc436121e557b Tom Rix              2023-03-27  8003  		if (test_bit(In_sync, &rdev->flags))
2f115882499f3e NeilBrown            2010-06-17  8004  			continue;
c148ffdcda00b6 NeilBrown            2009-11-13  8005  		/* This disc is not fully in-sync.  However if it
c148ffdcda00b6 NeilBrown            2009-11-13  8006  		 * just stored parity (beyond the recovery_offset),
c148ffdcda00b6 NeilBrown            2009-11-13  8007  		 * when we don't need to be concerned about the
c148ffdcda00b6 NeilBrown            2009-11-13  8008  		 * array being dirty.
c148ffdcda00b6 NeilBrown            2009-11-13  8009  		 * When reshape goes 'backwards', we never have
c148ffdcda00b6 NeilBrown            2009-11-13  8010  		 * partially completed devices, so we only need
c148ffdcda00b6 NeilBrown            2009-11-13  8011  		 * to worry about reshape going forwards.
c148ffdcda00b6 NeilBrown            2009-11-13  8012  		 */
c148ffdcda00b6 NeilBrown            2009-11-13  8013  		/* Hack because v0.91 doesn't store recovery_offset properly. */
c148ffdcda00b6 NeilBrown            2009-11-13  8014  		if (mddev->major_version == 0 &&
c148ffdcda00b6 NeilBrown            2009-11-13  8015  		    mddev->minor_version > 90)
c148ffdcda00b6 NeilBrown            2009-11-13  8016  			rdev->recovery_offset = reshape_offset;
c148ffdcda00b6 NeilBrown            2009-11-13  8017  
c148ffdcda00b6 NeilBrown            2009-11-13  8018  		if (rdev->recovery_offset < reshape_offset) {
c148ffdcda00b6 NeilBrown            2009-11-13  8019  			/* We need to check old and new layout */
c148ffdcda00b6 NeilBrown            2009-11-13  8020  			if (!only_parity(rdev->raid_disk,
c148ffdcda00b6 NeilBrown            2009-11-13  8021  					 conf->algorithm,
c148ffdcda00b6 NeilBrown            2009-11-13  8022  					 conf->raid_disks,
c148ffdcda00b6 NeilBrown            2009-11-13  8023  					 conf->max_degraded))
c148ffdcda00b6 NeilBrown            2009-11-13  8024  				continue;
c148ffdcda00b6 NeilBrown            2009-11-13  8025  		}
c148ffdcda00b6 NeilBrown            2009-11-13  8026  		if (!only_parity(rdev->raid_disk,
c148ffdcda00b6 NeilBrown            2009-11-13  8027  				 conf->prev_algo,
c148ffdcda00b6 NeilBrown            2009-11-13  8028  				 conf->previous_raid_disks,
c148ffdcda00b6 NeilBrown            2009-11-13  8029  				 conf->max_degraded))
c148ffdcda00b6 NeilBrown            2009-11-13  8030  			continue;
c148ffdcda00b6 NeilBrown            2009-11-13  8031  		dirty_parity_disks++;
c148ffdcda00b6 NeilBrown            2009-11-13  8032  	}
91adb56473febe NeilBrown            2009-03-31  8033  
17045f52ac76d9 NeilBrown            2011-12-23  8034  	/*
17045f52ac76d9 NeilBrown            2011-12-23  8035  	 * 0 for a fully functional array, 1 or 2 for a degraded array.
17045f52ac76d9 NeilBrown            2011-12-23  8036  	 */
2e38a37f23c98d Song Liu             2017-01-24  8037  	mddev->degraded = raid5_calc_degraded(conf);
91adb56473febe NeilBrown            2009-03-31  8038  
674806d62fb02a NeilBrown            2010-06-16  8039  	if (has_failed(conf)) {
cc6167b4f3b3ca NeilBrown            2016-11-02  8040  		pr_crit("md/raid:%s: not enough operational devices (%d/%d failed)\n",
02c2de8cc83588 NeilBrown            2006-10-03  8041  			mdname(mddev), mddev->degraded, conf->raid_disks);
^1da177e4c3f41 Linus Torvalds       2005-04-16  8042  		goto abort;
^1da177e4c3f41 Linus Torvalds       2005-04-16  8043  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  8044  
91adb56473febe NeilBrown            2009-03-31  8045  	/* device size must be a multiple of chunk size */
c5eec74f252dfb Guoqing Jiang        2020-12-16  8046  	mddev->dev_sectors &= ~((sector_t)mddev->chunk_sectors - 1);
91adb56473febe NeilBrown            2009-03-31  8047  	mddev->resync_max_sectors = mddev->dev_sectors;
91adb56473febe NeilBrown            2009-03-31  8048  
c148ffdcda00b6 NeilBrown            2009-11-13  8049  	if (mddev->degraded > dirty_parity_disks &&
907a99c314a5a6 Li Nan               2025-07-22  8050  	    mddev->resync_offset != MaxSector) {
4536bf9ba2d034 Artur Paszkiewicz    2017-03-09  8051  		if (test_bit(MD_HAS_PPL, &mddev->flags))
4536bf9ba2d034 Artur Paszkiewicz    2017-03-09  8052  			pr_crit("md/raid:%s: starting dirty degraded array with PPL.\n",
4536bf9ba2d034 Artur Paszkiewicz    2017-03-09  8053  				mdname(mddev));
4536bf9ba2d034 Artur Paszkiewicz    2017-03-09  8054  		else if (mddev->ok_start_degraded)
cc6167b4f3b3ca NeilBrown            2016-11-02  8055  			pr_crit("md/raid:%s: starting dirty degraded array - data corruption possible.\n",
6ff8d8ec06690f NeilBrown            2006-01-06  8056  				mdname(mddev));
6ff8d8ec06690f NeilBrown            2006-01-06  8057  		else {
cc6167b4f3b3ca NeilBrown            2016-11-02  8058  			pr_crit("md/raid:%s: cannot start dirty degraded array.\n",
^1da177e4c3f41 Linus Torvalds       2005-04-16  8059  				mdname(mddev));
^1da177e4c3f41 Linus Torvalds       2005-04-16  8060  			goto abort;
^1da177e4c3f41 Linus Torvalds       2005-04-16  8061  		}
6ff8d8ec06690f NeilBrown            2006-01-06  8062  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  8063  
cc6167b4f3b3ca NeilBrown            2016-11-02  8064  	pr_info("md/raid:%s: raid level %d active with %d out of %d devices, algorithm %d\n",
cc6167b4f3b3ca NeilBrown            2016-11-02  8065  		mdname(mddev), conf->level,
^1da177e4c3f41 Linus Torvalds       2005-04-16  8066  		mddev->raid_disks-mddev->degraded, mddev->raid_disks,
e183eaedd53807 NeilBrown            2009-03-31  8067  		mddev->new_layout);
^1da177e4c3f41 Linus Torvalds       2005-04-16  8068  
^1da177e4c3f41 Linus Torvalds       2005-04-16  8069  	print_raid5_conf(conf);
^1da177e4c3f41 Linus Torvalds       2005-04-16  8070  
fef9c61fdfabf9 NeilBrown            2009-03-31  8071  	if (conf->reshape_progress != MaxSector) {
fef9c61fdfabf9 NeilBrown            2009-03-31  8072  		conf->reshape_safe = conf->reshape_progress;
f67055780caac6 NeilBrown            2006-03-27  8073  		atomic_set(&conf->reshape_stripes, 0);
f67055780caac6 NeilBrown            2006-03-27  8074  		clear_bit(MD_RECOVERY_SYNC, &mddev->recovery);
f67055780caac6 NeilBrown            2006-03-27  8075  		clear_bit(MD_RECOVERY_CHECK, &mddev->recovery);
f67055780caac6 NeilBrown            2006-03-27  8076  		set_bit(MD_RECOVERY_RESHAPE, &mddev->recovery);
ad39c08186f8a0 Yu Kuai              2024-02-01  8077  		set_bit(MD_RECOVERY_NEEDED, &mddev->recovery);
f67055780caac6 NeilBrown            2006-03-27  8078  	}
f67055780caac6 NeilBrown            2006-03-27  8079  
^1da177e4c3f41 Linus Torvalds       2005-04-16  8080  	/* Ok, everything is just fine now */
a64c876fd35790 NeilBrown            2010-04-14  8081  	if (mddev->to_remove == &raid5_attrs_group)
a64c876fd35790 NeilBrown            2010-04-14  8082  		mddev->to_remove = NULL;
00bcb4ac7ee7e5 NeilBrown            2010-06-01  8083  	else if (mddev->kobj.sd &&
00bcb4ac7ee7e5 NeilBrown            2010-06-01  8084  	    sysfs_create_group(&mddev->kobj, &raid5_attrs_group))
cc6167b4f3b3ca NeilBrown            2016-11-02  8085  		pr_warn("raid5: failed to create sysfs attributes for %s\n",
5e55e2f5fc95b3 NeilBrown            2007-03-26  8086  			mdname(mddev));
4a5add49951e69 NeilBrown            2010-06-01  8087  	md_set_array_sectors(mddev, raid5_size(mddev, 0, 0));
7a5febe9ffeecd NeilBrown            2005-05-16  8088  
176df894d79741 Christoph Hellwig    2024-03-03  8089  	if (!mddev_is_dm(mddev)) {
f63f17350e5373 Christoph Hellwig    2024-03-03  8090  		ret = raid5_set_limits(mddev);
f63f17350e5373 Christoph Hellwig    2024-03-03  8091  		if (ret)
f63f17350e5373 Christoph Hellwig    2024-03-03  8092  			goto abort;
9f7c2220017771 NeilBrown            2010-07-26  8093  	}
23032a0eb97c8e Raz Ben-Jehuda(caro  2006-12-10  8094) 
585d578974395f Yu Kuai              2026-01-12  8095  	ret = raid5_create_ctx_pool(conf);
585d578974395f Yu Kuai              2026-01-12  8096  	if (ret)
01fce9e38c0e92 Yu Kuai              2026-01-12  8097  		goto abort;
01fce9e38c0e92 Yu Kuai              2026-01-12  8098  
845b9e229fe071 Artur Paszkiewicz    2017-04-04  8099  	if (log_init(conf, journal_dev, raid5_has_ppl(conf)))
5aabf7c49d9ebe Song Liu             2016-11-17 @8100  		goto abort;
5c7e81c3de9eb3 Shaohua Li           2015-08-13  8101  
^1da177e4c3f41 Linus Torvalds       2005-04-16  8102  	return 0;
^1da177e4c3f41 Linus Torvalds       2005-04-16  8103  abort:
7eb8ff02c1df27 Li Lingfeng          2023-08-03  8104  	md_unregister_thread(mddev, &mddev->thread);
^1da177e4c3f41 Linus Torvalds       2005-04-16  8105  	print_raid5_conf(conf);
95fc17aac45300 Dan Williams         2009-07-31  8106  	free_conf(conf);
^1da177e4c3f41 Linus Torvalds       2005-04-16  8107  	mddev->private = NULL;
cc6167b4f3b3ca NeilBrown            2016-11-02  8108  	pr_warn("md/raid:%s: failed to run raid set.\n", mdname(mddev));
f63f17350e5373 Christoph Hellwig    2024-03-03  8109  	return ret;
^1da177e4c3f41 Linus Torvalds       2005-04-16  8110  }
^1da177e4c3f41 Linus Torvalds       2005-04-16  8111  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
