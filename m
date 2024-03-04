Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14413A31
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Mar 2024 01:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709516262; cv=none; b=SEK5TOICs7qQ46ED2054nwfObjqkl2a8Dp98IW262+/pYDDm+sZvanZaJVBpXfhfNPa0rPxotNe9TjkwtahsztOB2UUa7dsyNLUsDgEdxic/+PTVidzfsd/T+0NGVYbNiW4iO9QyUNS2f/8TnK8h+AyRwTATk98oAZ2LslOQDtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709516262; c=relaxed/simple;
	bh=tUas6u5sLJy35s5cn2I4WT/A1pX36xE4u0klw2Lzy5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B3c9wiCsFou2r7UFdMh0QaWKAhsEMvgNSbtTJy1jIo3Vz9fE47JXDt5yU6zisx+D4fRx7zClzfC1TaHICQnYqDHa/jQbehgNuWsb2IAD3RpCQGE6FxoPy5vacc8uCIGHNL1DkEPpLSPGcL1Zi4VfpcMpNf5zJPFM4pJz8LbVR84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Is2rydBb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Is2rydBb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709516261; x=1741052261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tUas6u5sLJy35s5cn2I4WT/A1pX36xE4u0klw2Lzy5k=;
  b=Is2rydBbz05oSx8gx+nx2LwjoUirmEHPtK7RWBlicdCn4Wl76I4u8TwO
   AeB+HvBSTr8kV6D79aUvpsJe4H8NwE9oRsvv4mwKxWKgmq7EzI23EQBdq
   KS6VWw4gGUngZAlOg3nLIgmENV9WLdD5eBjLD4Nh+mHJnhNmL1fGAdDvX
   nJMaaTXi0LtSb6N/zEArSzxh4tzq5KHLL8VE6/9Gwx34Vc/ZiBIeN4qdM
   iGYnF+v5XpEp0xkOaWpGfuSPsuFg82RQpig93CmEx184wkNGzaOkp180A
   2GUxpgJHm7D+sHo+YICYcnm5tdS7R50im9t+Qng2b66x9OJrpg38Kzqbi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4115975"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="4115975"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 17:37:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="13321590"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Mar 2024 17:37:37 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgxGo-0002FX-2h;
	Mon, 04 Mar 2024 01:37:34 +0000
Date: Mon, 4 Mar 2024 09:37:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-block:drbd-blk-limits 7/16] drivers/md/raid10.c:4093
 raid10_run() warn: missing error code 'ret'
Message-ID: <202403040910.goLgb8oF-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/block.git drbd-blk-limits
head:   952f67c787298e616a8aa5acc3f881d267e6c7b5
commit: 313650e376b1a47160c38cf100308664af4fb7fa [7/16] md/raid10: use the atomic queue limit update APIs
:::::: branch date: 8 days ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-161-20240301 (https://download.01.org/0day-ci/archive/20240304/202403040910.goLgb8oF-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403040910.goLgb8oF-lkp@intel.com/

New smatch warnings:
drivers/md/raid10.c:4093 raid10_run() warn: missing error code 'ret'

Old smatch warnings:
drivers/md/raid10.c:860 read_balance() error: uninitialized symbol 'best_pending_slot'.
drivers/md/raid10.c:3484 raid10_sync_request() error: we previously assumed 'bio' could be null (see line 3476)

vim +/ret +4093 drivers/md/raid10.c

16ef510139315a Christoph Hellwig  2020-09-24  4010  
849674e4fb175e Shaohua Li         2016-01-20  4011  static int raid10_run(struct mddev *mddev)
dab8b29248b3f1 Trela, Maciej      2010-03-08  4012  {
313650e376b1a4 Christoph Hellwig  2024-02-23  4013  	struct queue_limits lim;
e879a8793f915a NeilBrown          2011-10-11  4014  	struct r10conf *conf;
16ef510139315a Christoph Hellwig  2020-09-24  4015  	int i, disk_idx;
dc280d987f039e Jonathan Brassow   2012-07-31  4016  	struct raid10_info *disk;
3cb03002000f13 NeilBrown          2011-10-11  4017  	struct md_rdev *rdev;
dab8b29248b3f1 Trela, Maciej      2010-03-08  4018  	sector_t size;
3ea7daa5d7fde4 NeilBrown          2012-05-22  4019  	sector_t min_offset_diff = 0;
3ea7daa5d7fde4 NeilBrown          2012-05-22  4020  	int first = 1;
313650e376b1a4 Christoph Hellwig  2024-02-23  4021  	int ret = -EIO;
dab8b29248b3f1 Trela, Maciej      2010-03-08  4022  
dab8b29248b3f1 Trela, Maciej      2010-03-08  4023  	if (mddev->private == NULL) {
dab8b29248b3f1 Trela, Maciej      2010-03-08  4024  		conf = setup_conf(mddev);
dab8b29248b3f1 Trela, Maciej      2010-03-08  4025  		if (IS_ERR(conf))
dab8b29248b3f1 Trela, Maciej      2010-03-08  4026  			return PTR_ERR(conf);
dab8b29248b3f1 Trela, Maciej      2010-03-08  4027  		mddev->private = conf;
dab8b29248b3f1 Trela, Maciej      2010-03-08  4028  	}
dab8b29248b3f1 Trela, Maciej      2010-03-08  4029  	conf = mddev->private;
dab8b29248b3f1 Trela, Maciej      2010-03-08  4030  	if (!conf)
dab8b29248b3f1 Trela, Maciej      2010-03-08  4031  		goto out;
dab8b29248b3f1 Trela, Maciej      2010-03-08  4032  
44693154398272 Yu Kuai            2023-05-23  4033  	rcu_assign_pointer(mddev->thread, conf->thread);
44693154398272 Yu Kuai            2023-05-23  4034  	rcu_assign_pointer(conf->thread, NULL);
f0ddb83da3cbbf Yu Kuai            2023-03-10  4035  
8db87912c9a877 Guoqing Jiang      2017-10-24  4036  	if (mddev_is_clustered(conf->mddev)) {
8db87912c9a877 Guoqing Jiang      2017-10-24  4037  		int fc, fo;
8db87912c9a877 Guoqing Jiang      2017-10-24  4038  
8db87912c9a877 Guoqing Jiang      2017-10-24  4039  		fc = (mddev->layout >> 8) & 255;
8db87912c9a877 Guoqing Jiang      2017-10-24  4040  		fo = mddev->layout & (1<<16);
8db87912c9a877 Guoqing Jiang      2017-10-24  4041  		if (fc > 1 || fo > 0) {
8db87912c9a877 Guoqing Jiang      2017-10-24  4042  			pr_err("only near layout is supported by clustered"
8db87912c9a877 Guoqing Jiang      2017-10-24  4043  				" raid10\n");
43a521238aca0e Lidong Zhong       2018-01-23  4044  			goto out_free_conf;
8db87912c9a877 Guoqing Jiang      2017-10-24  4045  		}
8db87912c9a877 Guoqing Jiang      2017-10-24  4046  	}
8db87912c9a877 Guoqing Jiang      2017-10-24  4047  
dafb20fa34320a NeilBrown          2012-03-19  4048  	rdev_for_each(rdev, mddev) {
3ea7daa5d7fde4 NeilBrown          2012-05-22  4049  		long long diff;
34b343cff4354a NeilBrown          2011-07-28  4050  
^1da177e4c3f41 Linus Torvalds     2005-04-16  4051  		disk_idx = rdev->raid_disk;
f8c9e74ff0832f NeilBrown          2012-05-21  4052  		if (disk_idx < 0)
f8c9e74ff0832f NeilBrown          2012-05-21  4053  			continue;
f8c9e74ff0832f NeilBrown          2012-05-21  4054  		if (disk_idx >= conf->geo.raid_disks &&
f8c9e74ff0832f NeilBrown          2012-05-21  4055  		    disk_idx >= conf->prev.raid_disks)
^1da177e4c3f41 Linus Torvalds     2005-04-16  4056  			continue;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4057  		disk = conf->mirrors + disk_idx;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4058  
56a2559bb654ae NeilBrown          2011-12-23  4059  		if (test_bit(Replacement, &rdev->flags)) {
56a2559bb654ae NeilBrown          2011-12-23  4060  			if (disk->replacement)
56a2559bb654ae NeilBrown          2011-12-23  4061  				goto out_free_conf;
56a2559bb654ae NeilBrown          2011-12-23  4062  			disk->replacement = rdev;
56a2559bb654ae NeilBrown          2011-12-23  4063  		} else {
56a2559bb654ae NeilBrown          2011-12-23  4064  			if (disk->rdev)
56a2559bb654ae NeilBrown          2011-12-23  4065  				goto out_free_conf;
56a2559bb654ae NeilBrown          2011-12-23  4066  			disk->rdev = rdev;
56a2559bb654ae NeilBrown          2011-12-23  4067  		}
3ea7daa5d7fde4 NeilBrown          2012-05-22  4068  		diff = (rdev->new_data_offset - rdev->data_offset);
3ea7daa5d7fde4 NeilBrown          2012-05-22  4069  		if (!mddev->reshape_backwards)
3ea7daa5d7fde4 NeilBrown          2012-05-22  4070  			diff = -diff;
3ea7daa5d7fde4 NeilBrown          2012-05-22  4071  		if (diff < 0)
3ea7daa5d7fde4 NeilBrown          2012-05-22  4072  			diff = 0;
3ea7daa5d7fde4 NeilBrown          2012-05-22  4073  		if (first || diff < min_offset_diff)
3ea7daa5d7fde4 NeilBrown          2012-05-22  4074  			min_offset_diff = diff;
56a2559bb654ae NeilBrown          2011-12-23  4075  
^1da177e4c3f41 Linus Torvalds     2005-04-16  4076  		disk->head_position = 0;
6f287ca6046edd Guoqing Jiang      2017-04-06  4077  		first = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4078  	}
3ea7daa5d7fde4 NeilBrown          2012-05-22  4079  
313650e376b1a4 Christoph Hellwig  2024-02-23  4080  	blk_set_stacking_limits(&lim);
313650e376b1a4 Christoph Hellwig  2024-02-23  4081  	lim.max_write_zeroes_sectors = 0;
313650e376b1a4 Christoph Hellwig  2024-02-23  4082  	lim.io_min = mddev->chunk_sectors << 9;
313650e376b1a4 Christoph Hellwig  2024-02-23  4083  	lim.io_opt = lim.io_min * raid10_nr_stripes(conf);
313650e376b1a4 Christoph Hellwig  2024-02-23  4084  	mddev_stack_rdev_limits(mddev, &lim);
313650e376b1a4 Christoph Hellwig  2024-02-23  4085  	ret = queue_limits_set(mddev->queue, &lim);
313650e376b1a4 Christoph Hellwig  2024-02-23  4086  	if (ret)
313650e376b1a4 Christoph Hellwig  2024-02-23  4087  		goto out_free_conf;
313650e376b1a4 Christoph Hellwig  2024-02-23  4088  
6d508242b231cb NeilBrown          2005-09-09  4089  	/* need to check that every block has at least one working mirror */
700c72138938cf NeilBrown          2011-07-27  4090  	if (!enough(conf, -1)) {
08464e0926402a NeilBrown          2016-11-02  4091  		pr_err("md/raid10:%s: not enough operational mirrors.\n",
^1da177e4c3f41 Linus Torvalds     2005-04-16  4092  		       mdname(mddev));
^1da177e4c3f41 Linus Torvalds     2005-04-16 @4093  		goto out_free_conf;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4094  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  4095  
3ea7daa5d7fde4 NeilBrown          2012-05-22  4096  	if (conf->reshape_progress != MaxSector) {
3ea7daa5d7fde4 NeilBrown          2012-05-22  4097  		/* must ensure that shape change is supported */
3ea7daa5d7fde4 NeilBrown          2012-05-22  4098  		if (conf->geo.far_copies != 1 &&
3ea7daa5d7fde4 NeilBrown          2012-05-22  4099  		    conf->geo.far_offset == 0)
3ea7daa5d7fde4 NeilBrown          2012-05-22  4100  			goto out_free_conf;
3ea7daa5d7fde4 NeilBrown          2012-05-22  4101  		if (conf->prev.far_copies != 1 &&
78eaa0d4cbcdb3 NeilBrown          2013-07-02  4102  		    conf->prev.far_offset == 0)
3ea7daa5d7fde4 NeilBrown          2012-05-22  4103  			goto out_free_conf;
3ea7daa5d7fde4 NeilBrown          2012-05-22  4104  	}
3ea7daa5d7fde4 NeilBrown          2012-05-22  4105  
^1da177e4c3f41 Linus Torvalds     2005-04-16  4106  	mddev->degraded = 0;
f8c9e74ff0832f NeilBrown          2012-05-21  4107  	for (i = 0;
f8c9e74ff0832f NeilBrown          2012-05-21  4108  	     i < conf->geo.raid_disks
f8c9e74ff0832f NeilBrown          2012-05-21  4109  		     || i < conf->prev.raid_disks;
f8c9e74ff0832f NeilBrown          2012-05-21  4110  	     i++) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  4111  
^1da177e4c3f41 Linus Torvalds     2005-04-16  4112  		disk = conf->mirrors + i;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4113  
56a2559bb654ae NeilBrown          2011-12-23  4114  		if (!disk->rdev && disk->replacement) {
56a2559bb654ae NeilBrown          2011-12-23  4115  			/* The replacement is all we have - use it */
56a2559bb654ae NeilBrown          2011-12-23  4116  			disk->rdev = disk->replacement;
56a2559bb654ae NeilBrown          2011-12-23  4117  			disk->replacement = NULL;
56a2559bb654ae NeilBrown          2011-12-23  4118  			clear_bit(Replacement, &disk->rdev->flags);
56a2559bb654ae NeilBrown          2011-12-23  4119  		}
56a2559bb654ae NeilBrown          2011-12-23  4120  
5fd6c1dce06ec2 NeilBrown          2006-06-26  4121  		if (!disk->rdev ||
2e333e89860431 NeilBrown          2006-10-21  4122  		    !test_bit(In_sync, &disk->rdev->flags)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  4123  			disk->head_position = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4124  			mddev->degraded++;
0b59bb6422e43a NeilBrown          2014-01-14  4125  			if (disk->rdev &&
0b59bb6422e43a NeilBrown          2014-01-14  4126  			    disk->rdev->saved_raid_disk < 0)
8c2e870a625bd3 Neil Brown         2008-06-28  4127  				conf->fullsync = 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4128  		}
bda3153998f3eb BingJing Chang     2018-06-28  4129  
bda3153998f3eb BingJing Chang     2018-06-28  4130  		if (disk->replacement &&
bda3153998f3eb BingJing Chang     2018-06-28  4131  		    !test_bit(In_sync, &disk->replacement->flags) &&
bda3153998f3eb BingJing Chang     2018-06-28  4132  		    disk->replacement->saved_raid_disk < 0) {
bda3153998f3eb BingJing Chang     2018-06-28  4133  			conf->fullsync = 1;
bda3153998f3eb BingJing Chang     2018-06-28  4134  		}
bda3153998f3eb BingJing Chang     2018-06-28  4135  
d890fa2b0586b6 NeilBrown          2011-10-26  4136  		disk->recovery_disabled = mddev->recovery_disabled - 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4137  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  4138  
8c6ac868b107ed Andre Noll         2009-06-18  4139  	if (mddev->recovery_cp != MaxSector)
08464e0926402a NeilBrown          2016-11-02  4140  		pr_notice("md/raid10:%s: not clean -- starting background reconstruction\n",
8c6ac868b107ed Andre Noll         2009-06-18  4141  			  mdname(mddev));
08464e0926402a NeilBrown          2016-11-02  4142  	pr_info("md/raid10:%s: active with %d out of %d devices\n",
5cf00fcd3c98d2 NeilBrown          2012-05-21  4143  		mdname(mddev), conf->geo.raid_disks - mddev->degraded,
5cf00fcd3c98d2 NeilBrown          2012-05-21  4144  		conf->geo.raid_disks);
^1da177e4c3f41 Linus Torvalds     2005-04-16  4145  	/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  4146  	 * Ok, everything is just fine now
^1da177e4c3f41 Linus Torvalds     2005-04-16  4147  	 */
dab8b29248b3f1 Trela, Maciej      2010-03-08  4148  	mddev->dev_sectors = conf->dev_sectors;
dab8b29248b3f1 Trela, Maciej      2010-03-08  4149  	size = raid10_size(mddev, 0, 0);
dab8b29248b3f1 Trela, Maciej      2010-03-08  4150  	md_set_array_sectors(mddev, size);
dab8b29248b3f1 Trela, Maciej      2010-03-08  4151  	mddev->resync_max_sectors = size;
46533ff7fefb7e NeilBrown          2016-11-18  4152  	set_bit(MD_FAILFAST_SUPPORTED, &mddev->flags);
^1da177e4c3f41 Linus Torvalds     2005-04-16  4153  
a91a2785b20086 Martin K. Petersen 2011-03-17  4154  	if (md_integrity_register(mddev))
a91a2785b20086 Martin K. Petersen 2011-03-17  4155  		goto out_free_conf;
a91a2785b20086 Martin K. Petersen 2011-03-17  4156  
3ea7daa5d7fde4 NeilBrown          2012-05-22  4157  	if (conf->reshape_progress != MaxSector) {
3ea7daa5d7fde4 NeilBrown          2012-05-22  4158  		unsigned long before_length, after_length;
3ea7daa5d7fde4 NeilBrown          2012-05-22  4159  
3ea7daa5d7fde4 NeilBrown          2012-05-22  4160  		before_length = ((1 << conf->prev.chunk_shift) *
3ea7daa5d7fde4 NeilBrown          2012-05-22  4161  				 conf->prev.far_copies);
3ea7daa5d7fde4 NeilBrown          2012-05-22  4162  		after_length = ((1 << conf->geo.chunk_shift) *
3ea7daa5d7fde4 NeilBrown          2012-05-22  4163  				conf->geo.far_copies);
3ea7daa5d7fde4 NeilBrown          2012-05-22  4164  
3ea7daa5d7fde4 NeilBrown          2012-05-22  4165  		if (max(before_length, after_length) > min_offset_diff) {
3ea7daa5d7fde4 NeilBrown          2012-05-22  4166  			/* This cannot work */
08464e0926402a NeilBrown          2016-11-02  4167  			pr_warn("md/raid10: offset difference not enough to continue reshape\n");
3ea7daa5d7fde4 NeilBrown          2012-05-22  4168  			goto out_free_conf;
3ea7daa5d7fde4 NeilBrown          2012-05-22  4169  		}
3ea7daa5d7fde4 NeilBrown          2012-05-22  4170  		conf->offset_diff = min_offset_diff;
3ea7daa5d7fde4 NeilBrown          2012-05-22  4171  
3ea7daa5d7fde4 NeilBrown          2012-05-22  4172  		clear_bit(MD_RECOVERY_SYNC, &mddev->recovery);
3ea7daa5d7fde4 NeilBrown          2012-05-22  4173  		clear_bit(MD_RECOVERY_CHECK, &mddev->recovery);
3ea7daa5d7fde4 NeilBrown          2012-05-22  4174  		set_bit(MD_RECOVERY_RESHAPE, &mddev->recovery);
3ea7daa5d7fde4 NeilBrown          2012-05-22  4175  		set_bit(MD_RECOVERY_RUNNING, &mddev->recovery);
44693154398272 Yu Kuai            2023-05-23  4176  		rcu_assign_pointer(mddev->sync_thread,
44693154398272 Yu Kuai            2023-05-23  4177  			md_register_thread(md_do_sync, mddev, "reshape"));
e406f12dde1a83 Aditya Pakki       2019-03-04  4178  		if (!mddev->sync_thread)
e406f12dde1a83 Aditya Pakki       2019-03-04  4179  			goto out_free_conf;
3ea7daa5d7fde4 NeilBrown          2012-05-22  4180  	}
3ea7daa5d7fde4 NeilBrown          2012-05-22  4181  
^1da177e4c3f41 Linus Torvalds     2005-04-16  4182  	return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4183  
^1da177e4c3f41 Linus Torvalds     2005-04-16  4184  out_free_conf:
7eb8ff02c1df27 Li Lingfeng        2023-08-03  4185  	md_unregister_thread(mddev, &mddev->thread);
c9ac2acde53f53 Yu Kuai            2023-03-10  4186  	raid10_free_conf(conf);
^1da177e4c3f41 Linus Torvalds     2005-04-16  4187  	mddev->private = NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4188  out:
313650e376b1a4 Christoph Hellwig  2024-02-23  4189  	return ret;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4190  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  4191  

:::::: The code at line 4093 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
