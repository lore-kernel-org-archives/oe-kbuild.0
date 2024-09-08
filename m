Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE58212B17C
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Sep 2024 21:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725830088; cv=none; b=g86dEnRBHBiMJVJ9dDlQC7XOzYQD+c3FmGeQruV3UvkhRUpI5n8Ro3dxQ79Sd70XfBFfqinvWz9QQE+N6DkiA0Jg9JQEick+6rjyIUJY8HNvIpO12cfQyPcY9xqwyxxEVJwZpaD97pRWQyR1x9UdFsn+ec/hk+dQtrxvU/jEOVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725830088; c=relaxed/simple;
	bh=j2ceceRRu7WC5Y2xTbq/W90yiBMaAoamdulu8KHiQMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qw489bQszLFLWiIDuHqOoEgPVN7Xy6mpq44I/WZaDpogjxV7O9+fxOOdzkkJzIQ4BqEjD3pFa62bP6vsyZb7z97JFu6JyME/KcpExLRsf6NCVa6WyUDIR1uqZ8RnbBmPQnEB2OCZf5arSOqQfkblT8JY7ZfF/xAKpzQ0/Jp0DJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IRtYQWcn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IRtYQWcn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725830085; x=1757366085;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=j2ceceRRu7WC5Y2xTbq/W90yiBMaAoamdulu8KHiQMI=;
  b=IRtYQWcnHT26KgPbU19HCmaebYs3E78Vm53GyQ3i069OHxtBgSYRTCd2
   JyhKNUfBr3aOULf4s5drCbc9XxDik1wbQ8EKdj/pgIJ2+hHeXPKlW8RDP
   aWhmGOIA5U9IeYwPAf2SuxbS/7Hb5kkENDHuJY5fKIdPU373OisAwAaML
   4ZBw7ZulKaODyFArWokfnacvNvS5UNKS5FlgJ4pWL5m5vp1x6eT7ChYs+
   8i05GiBV/JtDs42TZr2ee8tDzmEv/k+sl+/JqeB3zFYXg+TMDvj8Kv/yY
   Rumke3y3H3U7lynKoD9hqPfQrH3ftsyLlP7M3fF2YIhW1A+TxjOaBZuYD
   g==;
X-CSE-ConnectionGUID: r7dtZZpIRqiCkQRZJ05L+Q==
X-CSE-MsgGUID: ZRkLLKeYSdKJ8H9FnS6/Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35888285"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="35888285"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 14:14:42 -0700
X-CSE-ConnectionGUID: PCJsrx+QQo62HBrxlJ6B+g==
X-CSE-MsgGUID: 3crONtg7TaiBep6wD3DE8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="66265819"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Sep 2024 14:14:41 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snPEz-000DyV-2C;
	Sun, 08 Sep 2024 21:14:37 +0000
Date: Mon, 9 Sep 2024 05:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/md/dm-integrity.c:4905 dm_integrity_ctr() warn: Function too
 hairy.  No more merges.
Message-ID: <202409090533.HVLLaJup-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mikulas Patocka <mpatocka@redhat.com>
CC: Mike Snitzer <snitzer@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89f5e14d05b4852db5ecdf222dc6a13edc633658
commit: fb0987682c629c1d2c476f35f6fde405a5e304a4 dm-integrity: introduce the Inline mode
date:   7 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-161-20240908 (https://download.01.org/0day-ci/archive/20240909/202409090533.HVLLaJup-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409090533.HVLLaJup-lkp@intel.com/

New smatch warnings:
drivers/md/dm-integrity.c:4905 dm_integrity_ctr() warn: Function too hairy.  No more merges.

Old smatch warnings:
drivers/md/dm-integrity.c:515 sb_mac() error: memcmp() 'actual_mac' too small (64 vs 448)
drivers/md/dm-integrity.c:4718 dm_integrity_ctr() warn: add some parenthesis here?

vim +4905 drivers/md/dm-integrity.c

7eada909bfd7ac Mikulas Patocka    2017-01-04  4329  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4330  	if (argc <= DIRECT_ARGUMENTS) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4331  		ti->error = "Invalid argument count";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4332  		return -EINVAL;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4333  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4334  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4335  	ic = kzalloc(sizeof(struct dm_integrity_c), GFP_KERNEL);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4336  	if (!ic) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4337  		ti->error = "Cannot allocate integrity context";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4338  		return -ENOMEM;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4339  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4340  	ti->private = ic;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4341  	ti->per_io_data_size = sizeof(struct dm_integrity_io);
adc0daad366b62 Mikulas Patocka    2020-02-24  4342  	ic->ti = ti;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4343  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4344  	ic->in_progress = RB_ROOT;
724376a04d1a63 Mikulas Patocka    2018-07-03  4345  	INIT_LIST_HEAD(&ic->wait_list);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4346  	init_waitqueue_head(&ic->endio_wait);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4347  	bio_list_init(&ic->flush_bio_list);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4348  	init_waitqueue_head(&ic->copy_to_journal_wait);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4349  	init_completion(&ic->crypto_backoff);
3f2e539359bd0e Mikulas Patocka    2017-07-21  4350  	atomic64_set(&ic->number_of_mismatches, 0);
468dfca38b1a6f Mikulas Patocka    2019-04-29  4351  	ic->bitmap_flush_interval = BITMAP_FLUSH_INTERVAL;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4352  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4353  	r = dm_get_device(ti, argv[0], dm_table_get_mode(ti->table), &ic->dev);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4354  	if (r) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4355  		ti->error = "Device lookup failed";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4356  		goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4357  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4358  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4359  	if (sscanf(argv[1], "%llu%c", &start, &dummy) != 1 || start != (sector_t)start) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4360  		ti->error = "Invalid starting offset";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4361  		r = -EINVAL;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4362  		goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4363  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4364  	ic->start = start;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4365  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4366  	if (strcmp(argv[2], "-")) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4367  		if (sscanf(argv[2], "%u%c", &ic->tag_size, &dummy) != 1 || !ic->tag_size) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4368  			ti->error = "Invalid tag size";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4369  			r = -EINVAL;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4370  			goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4371  		}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4372  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4373  
05d6909ea9d62b Mike Snitzer       2019-05-09  4374  	if (!strcmp(argv[3], "J") || !strcmp(argv[3], "B") ||
fb0987682c629c Mikulas Patocka    2024-07-10  4375  	    !strcmp(argv[3], "D") || !strcmp(argv[3], "R") ||
fb0987682c629c Mikulas Patocka    2024-07-10  4376  	    !strcmp(argv[3], "I")) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4377  		ic->mode = argv[3][0];
468dfca38b1a6f Mikulas Patocka    2019-04-29  4378  	} else {
fb0987682c629c Mikulas Patocka    2024-07-10  4379  		ti->error = "Invalid mode (expecting J, B, D, R, I)";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4380  		r = -EINVAL;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4381  		goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4382  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4383  
356d9d52e1221b Mikulas Patocka    2018-07-03  4384  	journal_sectors = 0;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4385  	interleave_sectors = DEFAULT_INTERLEAVE_SECTORS;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4386  	buffer_sectors = DEFAULT_BUFFER_SECTORS;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4387  	journal_watermark = DEFAULT_JOURNAL_WATERMARK;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4388  	sync_msec = DEFAULT_SYNC_MSEC;
9d609f85b7eb96 Mikulas Patocka    2017-04-18  4389  	ic->sectors_per_block = 1;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4390  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4391  	as.argc = argc - DIRECT_ARGUMENTS;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4392  	as.argv = argv + DIRECT_ARGUMENTS;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4393  	r = dm_read_arg_group(_args, &as, &extra_args, &ti->error);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4394  	if (r)
7eada909bfd7ac Mikulas Patocka    2017-01-04  4395  		goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4396  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4397  	while (extra_args--) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4398  		const char *opt_string;
86a3238c7b9b75 Heinz Mauelshagen  2023-01-25  4399  		unsigned int val;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4400  		unsigned long long llval;
0ef0b4717aa684 Heinz Mauelshagen  2023-02-01  4401  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4402  		opt_string = dm_shift_arg(&as);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4403  		if (!opt_string) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4404  			r = -EINVAL;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4405  			ti->error = "Not enough feature arguments";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4406  			goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4407  		}
56b67a4f292f14 Mikulas Patocka    2017-04-18  4408  		if (sscanf(opt_string, "journal_sectors:%u%c", &val, &dummy) == 1)
356d9d52e1221b Mikulas Patocka    2018-07-03  4409  			journal_sectors = val ? val : 1;
56b67a4f292f14 Mikulas Patocka    2017-04-18  4410  		else if (sscanf(opt_string, "interleave_sectors:%u%c", &val, &dummy) == 1)
7eada909bfd7ac Mikulas Patocka    2017-01-04  4411  			interleave_sectors = val;
56b67a4f292f14 Mikulas Patocka    2017-04-18  4412  		else if (sscanf(opt_string, "buffer_sectors:%u%c", &val, &dummy) == 1)
7eada909bfd7ac Mikulas Patocka    2017-01-04  4413  			buffer_sectors = val;
56b67a4f292f14 Mikulas Patocka    2017-04-18  4414  		else if (sscanf(opt_string, "journal_watermark:%u%c", &val, &dummy) == 1 && val <= 100)
7eada909bfd7ac Mikulas Patocka    2017-01-04  4415  			journal_watermark = val;
56b67a4f292f14 Mikulas Patocka    2017-04-18  4416  		else if (sscanf(opt_string, "commit_time:%u%c", &val, &dummy) == 1)
7eada909bfd7ac Mikulas Patocka    2017-01-04  4417  			sync_msec = val;
0d74e6a3b6421d Mikulas Patocka    2019-03-13  4418  		else if (!strncmp(opt_string, "meta_device:", strlen("meta_device:"))) {
356d9d52e1221b Mikulas Patocka    2018-07-03  4419  			if (ic->meta_dev) {
356d9d52e1221b Mikulas Patocka    2018-07-03  4420  				dm_put_device(ti, ic->meta_dev);
356d9d52e1221b Mikulas Patocka    2018-07-03  4421  				ic->meta_dev = NULL;
356d9d52e1221b Mikulas Patocka    2018-07-03  4422  			}
05d6909ea9d62b Mike Snitzer       2019-05-09  4423  			r = dm_get_device(ti, strchr(opt_string, ':') + 1,
05d6909ea9d62b Mike Snitzer       2019-05-09  4424  					  dm_table_get_mode(ti->table), &ic->meta_dev);
356d9d52e1221b Mikulas Patocka    2018-07-03  4425  			if (r) {
356d9d52e1221b Mikulas Patocka    2018-07-03  4426  				ti->error = "Device lookup failed";
356d9d52e1221b Mikulas Patocka    2018-07-03  4427  				goto bad;
356d9d52e1221b Mikulas Patocka    2018-07-03  4428  			}
356d9d52e1221b Mikulas Patocka    2018-07-03  4429  		} else if (sscanf(opt_string, "block_size:%u%c", &val, &dummy) == 1) {
9d609f85b7eb96 Mikulas Patocka    2017-04-18  4430  			if (val < 1 << SECTOR_SHIFT ||
9d609f85b7eb96 Mikulas Patocka    2017-04-18  4431  			    val > MAX_SECTORS_PER_BLOCK << SECTOR_SHIFT ||
9d609f85b7eb96 Mikulas Patocka    2017-04-18  4432  			    (val & (val - 1))) {
9d609f85b7eb96 Mikulas Patocka    2017-04-18  4433  				r = -EINVAL;
9d609f85b7eb96 Mikulas Patocka    2017-04-18  4434  				ti->error = "Invalid block_size argument";
9d609f85b7eb96 Mikulas Patocka    2017-04-18  4435  				goto bad;
9d609f85b7eb96 Mikulas Patocka    2017-04-18  4436  			}
9d609f85b7eb96 Mikulas Patocka    2017-04-18  4437  			ic->sectors_per_block = val >> SECTOR_SHIFT;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4438  		} else if (sscanf(opt_string, "sectors_per_bit:%llu%c", &llval, &dummy) == 1) {
468dfca38b1a6f Mikulas Patocka    2019-04-29  4439  			log2_sectors_per_bitmap_bit = !llval ? 0 : __ilog2_u64(llval);
468dfca38b1a6f Mikulas Patocka    2019-04-29  4440  		} else if (sscanf(opt_string, "bitmap_flush_interval:%u%c", &val, &dummy) == 1) {
8e91c2342351e0 Arnd Bergmann      2024-03-28  4441  			if ((uint64_t)val >= (uint64_t)UINT_MAX * 1000 / HZ) {
468dfca38b1a6f Mikulas Patocka    2019-04-29  4442  				r = -EINVAL;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4443  				ti->error = "Invalid bitmap_flush_interval argument";
17e9e134a8efab Tian Tao           2021-04-14  4444  				goto bad;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4445  			}
468dfca38b1a6f Mikulas Patocka    2019-04-29  4446  			ic->bitmap_flush_interval = msecs_to_jiffies(val);
0d74e6a3b6421d Mikulas Patocka    2019-03-13  4447  		} else if (!strncmp(opt_string, "internal_hash:", strlen("internal_hash:"))) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4448  			r = get_alg_and_key(opt_string, &ic->internal_hash_alg, &ti->error,
56b67a4f292f14 Mikulas Patocka    2017-04-18  4449  					    "Invalid internal_hash argument");
7eada909bfd7ac Mikulas Patocka    2017-01-04  4450  			if (r)
7eada909bfd7ac Mikulas Patocka    2017-01-04  4451  				goto bad;
0d74e6a3b6421d Mikulas Patocka    2019-03-13  4452  		} else if (!strncmp(opt_string, "journal_crypt:", strlen("journal_crypt:"))) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4453  			r = get_alg_and_key(opt_string, &ic->journal_crypt_alg, &ti->error,
56b67a4f292f14 Mikulas Patocka    2017-04-18  4454  					    "Invalid journal_crypt argument");
7eada909bfd7ac Mikulas Patocka    2017-01-04  4455  			if (r)
7eada909bfd7ac Mikulas Patocka    2017-01-04  4456  				goto bad;
0d74e6a3b6421d Mikulas Patocka    2019-03-13  4457  		} else if (!strncmp(opt_string, "journal_mac:", strlen("journal_mac:"))) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4458  			r = get_alg_and_key(opt_string, &ic->journal_mac_alg, &ti->error,
56b67a4f292f14 Mikulas Patocka    2017-04-18  4459  					    "Invalid journal_mac argument");
7eada909bfd7ac Mikulas Patocka    2017-01-04  4460  			if (r)
7eada909bfd7ac Mikulas Patocka    2017-01-04  4461  				goto bad;
a3fcf725313960 Mikulas Patocka    2018-07-03  4462  		} else if (!strcmp(opt_string, "recalculate")) {
468dfca38b1a6f Mikulas Patocka    2019-04-29  4463  			ic->recalculate_flag = true;
db7b93e38106e5 Mikulas Patocka    2021-03-23  4464  		} else if (!strcmp(opt_string, "reset_recalculate")) {
db7b93e38106e5 Mikulas Patocka    2021-03-23  4465  			ic->recalculate_flag = true;
db7b93e38106e5 Mikulas Patocka    2021-03-23  4466  			ic->reset_recalculate_flag = true;
84597a44a9d86a Mikulas Patocka    2020-03-22  4467  		} else if (!strcmp(opt_string, "allow_discards")) {
84597a44a9d86a Mikulas Patocka    2020-03-22  4468  			ic->discard = true;
d537858ac8aaf4 Mikulas Patocka    2019-11-13  4469  		} else if (!strcmp(opt_string, "fix_padding")) {
d537858ac8aaf4 Mikulas Patocka    2019-11-13  4470  			ic->fix_padding = true;
09d85f8d8909ec Mikulas Patocka    2021-01-21  4471  		} else if (!strcmp(opt_string, "fix_hmac")) {
09d85f8d8909ec Mikulas Patocka    2021-01-21  4472  			ic->fix_hmac = true;
5c02406428d521 Mikulas Patocka    2021-01-20  4473  		} else if (!strcmp(opt_string, "legacy_recalculate")) {
5c02406428d521 Mikulas Patocka    2021-01-20  4474  			ic->legacy_recalculate = true;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4475  		} else {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4476  			r = -EINVAL;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4477  			ti->error = "Invalid argument";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4478  			goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4479  		}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4480  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4481  
6dcbb52cddd9e5 Christoph Hellwig  2021-10-18  4482  	ic->data_device_sectors = bdev_nr_sectors(ic->dev->bdev);
356d9d52e1221b Mikulas Patocka    2018-07-03  4483  	if (!ic->meta_dev)
356d9d52e1221b Mikulas Patocka    2018-07-03  4484  		ic->meta_device_sectors = ic->data_device_sectors;
356d9d52e1221b Mikulas Patocka    2018-07-03  4485  	else
6dcbb52cddd9e5 Christoph Hellwig  2021-10-18  4486  		ic->meta_device_sectors = bdev_nr_sectors(ic->meta_dev->bdev);
356d9d52e1221b Mikulas Patocka    2018-07-03  4487  
356d9d52e1221b Mikulas Patocka    2018-07-03  4488  	if (!journal_sectors) {
356d9d52e1221b Mikulas Patocka    2018-07-03  4489  		journal_sectors = min((sector_t)DEFAULT_MAX_JOURNAL_SECTORS,
356d9d52e1221b Mikulas Patocka    2018-07-03  4490  				      ic->data_device_sectors >> DEFAULT_JOURNAL_SIZE_FACTOR);
356d9d52e1221b Mikulas Patocka    2018-07-03  4491  	}
356d9d52e1221b Mikulas Patocka    2018-07-03  4492  
356d9d52e1221b Mikulas Patocka    2018-07-03  4493  	if (!buffer_sectors)
356d9d52e1221b Mikulas Patocka    2018-07-03  4494  		buffer_sectors = 1;
356d9d52e1221b Mikulas Patocka    2018-07-03  4495  	ic->log2_buffer_sectors = min((int)__fls(buffer_sectors), 31 - SECTOR_SHIFT);
356d9d52e1221b Mikulas Patocka    2018-07-03  4496  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4497  	r = get_mac(&ic->internal_hash, &ic->internal_hash_alg, &ti->error,
7eada909bfd7ac Mikulas Patocka    2017-01-04  4498  		    "Invalid internal hash", "Error setting internal hash key");
7eada909bfd7ac Mikulas Patocka    2017-01-04  4499  	if (r)
7eada909bfd7ac Mikulas Patocka    2017-01-04  4500  		goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4501  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4502  	r = get_mac(&ic->journal_mac, &ic->journal_mac_alg, &ti->error,
7eada909bfd7ac Mikulas Patocka    2017-01-04  4503  		    "Invalid journal mac", "Error setting journal mac key");
7eada909bfd7ac Mikulas Patocka    2017-01-04  4504  	if (r)
7eada909bfd7ac Mikulas Patocka    2017-01-04  4505  		goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4506  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4507  	if (!ic->tag_size) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4508  		if (!ic->internal_hash) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4509  			ti->error = "Unknown tag size";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4510  			r = -EINVAL;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4511  			goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4512  		}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4513  		ic->tag_size = crypto_shash_digestsize(ic->internal_hash);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4514  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4515  	if (ic->tag_size > MAX_TAG_SIZE) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4516  		ti->error = "Too big tag size";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4517  		r = -EINVAL;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4518  		goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4519  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4520  	if (!(ic->tag_size & (ic->tag_size - 1)))
7eada909bfd7ac Mikulas Patocka    2017-01-04  4521  		ic->log2_tag_size = __ffs(ic->tag_size);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4522  	else
7eada909bfd7ac Mikulas Patocka    2017-01-04  4523  		ic->log2_tag_size = -1;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4524  
fb0987682c629c Mikulas Patocka    2024-07-10  4525  	if (ic->mode == 'I') {
fb0987682c629c Mikulas Patocka    2024-07-10  4526  		struct blk_integrity *bi;
fb0987682c629c Mikulas Patocka    2024-07-10  4527  		if (ic->meta_dev) {
fb0987682c629c Mikulas Patocka    2024-07-10  4528  			r = -EINVAL;
fb0987682c629c Mikulas Patocka    2024-07-10  4529  			ti->error = "Metadata device not supported in inline mode";
fb0987682c629c Mikulas Patocka    2024-07-10  4530  			goto bad;
fb0987682c629c Mikulas Patocka    2024-07-10  4531  		}
fb0987682c629c Mikulas Patocka    2024-07-10  4532  		if (!ic->internal_hash_alg.alg_string) {
fb0987682c629c Mikulas Patocka    2024-07-10  4533  			r = -EINVAL;
fb0987682c629c Mikulas Patocka    2024-07-10  4534  			ti->error = "Internal hash not set in inline mode";
fb0987682c629c Mikulas Patocka    2024-07-10  4535  			goto bad;
fb0987682c629c Mikulas Patocka    2024-07-10  4536  		}
fb0987682c629c Mikulas Patocka    2024-07-10  4537  		if (ic->journal_crypt_alg.alg_string || ic->journal_mac_alg.alg_string) {
fb0987682c629c Mikulas Patocka    2024-07-10  4538  			r = -EINVAL;
fb0987682c629c Mikulas Patocka    2024-07-10  4539  			ti->error = "Journal crypt not supported in inline mode";
fb0987682c629c Mikulas Patocka    2024-07-10  4540  			goto bad;
fb0987682c629c Mikulas Patocka    2024-07-10  4541  		}
fb0987682c629c Mikulas Patocka    2024-07-10  4542  		if (ic->discard) {
fb0987682c629c Mikulas Patocka    2024-07-10  4543  			r = -EINVAL;
fb0987682c629c Mikulas Patocka    2024-07-10  4544  			ti->error = "Discards not supported in inline mode";
fb0987682c629c Mikulas Patocka    2024-07-10  4545  			goto bad;
fb0987682c629c Mikulas Patocka    2024-07-10  4546  		}
fb0987682c629c Mikulas Patocka    2024-07-10  4547  		bi = blk_get_integrity(ic->dev->bdev->bd_disk);
fb0987682c629c Mikulas Patocka    2024-07-10  4548  		if (!bi || bi->csum_type != BLK_INTEGRITY_CSUM_NONE) {
fb0987682c629c Mikulas Patocka    2024-07-10  4549  			r = -EINVAL;
fb0987682c629c Mikulas Patocka    2024-07-10  4550  			ti->error = "Integrity profile not supported";
fb0987682c629c Mikulas Patocka    2024-07-10  4551  			goto bad;
fb0987682c629c Mikulas Patocka    2024-07-10  4552  		}
fb0987682c629c Mikulas Patocka    2024-07-10  4553  		/*printk("tag_size: %u, tuple_size: %u\n", bi->tag_size, bi->tuple_size);*/
fb0987682c629c Mikulas Patocka    2024-07-10  4554  		if (bi->tuple_size < ic->tag_size) {
fb0987682c629c Mikulas Patocka    2024-07-10  4555  			r = -EINVAL;
fb0987682c629c Mikulas Patocka    2024-07-10  4556  			ti->error = "The integrity profile is smaller than tag size";
fb0987682c629c Mikulas Patocka    2024-07-10  4557  			goto bad;
fb0987682c629c Mikulas Patocka    2024-07-10  4558  		}
fb0987682c629c Mikulas Patocka    2024-07-10  4559  		if ((unsigned long)bi->tuple_size > PAGE_SIZE / 2) {
fb0987682c629c Mikulas Patocka    2024-07-10  4560  			r = -EINVAL;
fb0987682c629c Mikulas Patocka    2024-07-10  4561  			ti->error = "Too big tuple size";
fb0987682c629c Mikulas Patocka    2024-07-10  4562  			goto bad;
fb0987682c629c Mikulas Patocka    2024-07-10  4563  		}
fb0987682c629c Mikulas Patocka    2024-07-10  4564  		ic->tuple_size = bi->tuple_size;
fb0987682c629c Mikulas Patocka    2024-07-10  4565  		if (1 << bi->interval_exp != ic->sectors_per_block << SECTOR_SHIFT) {
fb0987682c629c Mikulas Patocka    2024-07-10  4566  			r = -EINVAL;
fb0987682c629c Mikulas Patocka    2024-07-10  4567  			ti->error = "Integrity profile sector size mismatch";
fb0987682c629c Mikulas Patocka    2024-07-10  4568  			goto bad;
fb0987682c629c Mikulas Patocka    2024-07-10  4569  		}
fb0987682c629c Mikulas Patocka    2024-07-10  4570  	}
fb0987682c629c Mikulas Patocka    2024-07-10  4571  
468dfca38b1a6f Mikulas Patocka    2019-04-29  4572  	if (ic->mode == 'B' && !ic->internal_hash) {
468dfca38b1a6f Mikulas Patocka    2019-04-29  4573  		r = -EINVAL;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4574  		ti->error = "Bitmap mode can be only used with internal hash";
468dfca38b1a6f Mikulas Patocka    2019-04-29  4575  		goto bad;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4576  	}
468dfca38b1a6f Mikulas Patocka    2019-04-29  4577  
84597a44a9d86a Mikulas Patocka    2020-03-22  4578  	if (ic->discard && !ic->internal_hash) {
84597a44a9d86a Mikulas Patocka    2020-03-22  4579  		r = -EINVAL;
84597a44a9d86a Mikulas Patocka    2020-03-22  4580  		ti->error = "Discard can be only used with internal hash";
84597a44a9d86a Mikulas Patocka    2020-03-22  4581  		goto bad;
84597a44a9d86a Mikulas Patocka    2020-03-22  4582  	}
84597a44a9d86a Mikulas Patocka    2020-03-22  4583  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4584  	ic->autocommit_jiffies = msecs_to_jiffies(sync_msec);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4585  	ic->autocommit_msec = sync_msec;
8376d3c1f98988 Kees Cook          2017-10-16  4586  	timer_setup(&ic->autocommit_timer, autocommit_fn, 0);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4587  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4588  	ic->io = dm_io_client_create();
7eada909bfd7ac Mikulas Patocka    2017-01-04  4589  	if (IS_ERR(ic->io)) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4590  		r = PTR_ERR(ic->io);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4591  		ic->io = NULL;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4592  		ti->error = "Cannot allocate dm io";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4593  		goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4594  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4595  
6f1c819c219f78 Kent Overstreet    2018-05-20  4596  	r = mempool_init_slab_pool(&ic->journal_io_mempool, JOURNAL_IO_MEMPOOL, journal_io_cache);
6f1c819c219f78 Kent Overstreet    2018-05-20  4597  	if (r) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4598  		ti->error = "Cannot allocate mempool";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4599  		goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4600  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4601  
fb0987682c629c Mikulas Patocka    2024-07-10  4602  	r = mempool_init_page_pool(&ic->recheck_pool, 1, ic->mode == 'I' ? 1 : 0);
c88f5e553fe38b Mikulas Patocka    2024-02-19  4603  	if (r) {
c88f5e553fe38b Mikulas Patocka    2024-02-19  4604  		ti->error = "Cannot allocate mempool";
c88f5e553fe38b Mikulas Patocka    2024-02-19  4605  		goto bad;
c88f5e553fe38b Mikulas Patocka    2024-02-19  4606  	}
c88f5e553fe38b Mikulas Patocka    2024-02-19  4607  
fb0987682c629c Mikulas Patocka    2024-07-10  4608  	if (ic->mode == 'I') {
fb0987682c629c Mikulas Patocka    2024-07-10  4609  		r = bioset_init(&ic->recheck_bios, RECHECK_POOL_SIZE, 0, BIOSET_NEED_BVECS);
fb0987682c629c Mikulas Patocka    2024-07-10  4610  		if (r) {
fb0987682c629c Mikulas Patocka    2024-07-10  4611  			ti->error = "Cannot allocate bio set";
fb0987682c629c Mikulas Patocka    2024-07-10  4612  			goto bad;
fb0987682c629c Mikulas Patocka    2024-07-10  4613  		}
fb0987682c629c Mikulas Patocka    2024-07-10  4614  		r = bioset_integrity_create(&ic->recheck_bios, RECHECK_POOL_SIZE);
fb0987682c629c Mikulas Patocka    2024-07-10  4615  		if (r) {
fb0987682c629c Mikulas Patocka    2024-07-10  4616  			ti->error = "Cannot allocate bio integrity set";
fb0987682c629c Mikulas Patocka    2024-07-10  4617  			r = -ENOMEM;
fb0987682c629c Mikulas Patocka    2024-07-10  4618  			goto bad;
fb0987682c629c Mikulas Patocka    2024-07-10  4619  		}
fb0987682c629c Mikulas Patocka    2024-07-10  4620  	}
fb0987682c629c Mikulas Patocka    2024-07-10  4621  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4622  	ic->metadata_wq = alloc_workqueue("dm-integrity-metadata",
7eada909bfd7ac Mikulas Patocka    2017-01-04  4623  					  WQ_MEM_RECLAIM, METADATA_WORKQUEUE_MAX_ACTIVE);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4624  	if (!ic->metadata_wq) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4625  		ti->error = "Cannot allocate workqueue";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4626  		r = -ENOMEM;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4627  		goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4628  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4629  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4630  	/*
57bbf99ce9639c Tejun Heo          2023-05-25  4631  	 * If this workqueue weren't ordered, it would cause bio reordering
7eada909bfd7ac Mikulas Patocka    2017-01-04  4632  	 * and reduced performance.
7eada909bfd7ac Mikulas Patocka    2017-01-04  4633  	 */
57bbf99ce9639c Tejun Heo          2023-05-25  4634  	ic->wait_wq = alloc_ordered_workqueue("dm-integrity-wait", WQ_MEM_RECLAIM);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4635  	if (!ic->wait_wq) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4636  		ti->error = "Cannot allocate workqueue";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4637  		r = -ENOMEM;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4638  		goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4639  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4640  
53770f0ec5fd41 Mikulas Patocka    2020-02-17  4641  	ic->offload_wq = alloc_workqueue("dm-integrity-offload", WQ_MEM_RECLAIM,
53770f0ec5fd41 Mikulas Patocka    2020-02-17  4642  					  METADATA_WORKQUEUE_MAX_ACTIVE);
53770f0ec5fd41 Mikulas Patocka    2020-02-17  4643  	if (!ic->offload_wq) {
53770f0ec5fd41 Mikulas Patocka    2020-02-17  4644  		ti->error = "Cannot allocate workqueue";
53770f0ec5fd41 Mikulas Patocka    2020-02-17  4645  		r = -ENOMEM;
53770f0ec5fd41 Mikulas Patocka    2020-02-17  4646  		goto bad;
53770f0ec5fd41 Mikulas Patocka    2020-02-17  4647  	}
53770f0ec5fd41 Mikulas Patocka    2020-02-17  4648  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4649  	ic->commit_wq = alloc_workqueue("dm-integrity-commit", WQ_MEM_RECLAIM, 1);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4650  	if (!ic->commit_wq) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4651  		ti->error = "Cannot allocate workqueue";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4652  		r = -ENOMEM;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4653  		goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4654  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4655  	INIT_WORK(&ic->commit_work, integrity_commit);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4656  
468dfca38b1a6f Mikulas Patocka    2019-04-29  4657  	if (ic->mode == 'J' || ic->mode == 'B') {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4658  		ic->writer_wq = alloc_workqueue("dm-integrity-writer", WQ_MEM_RECLAIM, 1);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4659  		if (!ic->writer_wq) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4660  			ti->error = "Cannot allocate workqueue";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4661  			r = -ENOMEM;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4662  			goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4663  		}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4664  		INIT_WORK(&ic->writer_work, integrity_writer);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4665  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4666  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4667  	ic->sb = alloc_pages_exact(SB_SECTORS << SECTOR_SHIFT, GFP_KERNEL);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4668  	if (!ic->sb) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4669  		r = -ENOMEM;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4670  		ti->error = "Cannot allocate superblock area";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4671  		goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4672  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4673  
c9154a4cb8dc6a Bart Van Assche    2022-07-14  4674  	r = sync_rw_sb(ic, REQ_OP_READ);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4675  	if (r) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4676  		ti->error = "Error reading superblock";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4677  		goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4678  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4679  	should_write_sb = false;
c2bcb2b702e468 Mikulas Patocka    2017-03-17  4680  	if (memcmp(ic->sb->magic, SB_MAGIC, 8)) {
c2bcb2b702e468 Mikulas Patocka    2017-03-17  4681  		if (ic->mode != 'R') {
56b67a4f292f14 Mikulas Patocka    2017-04-18  4682  			if (memchr_inv(ic->sb, 0, SB_SECTORS << SECTOR_SHIFT)) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4683  				r = -EINVAL;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4684  				ti->error = "The device is not initialized";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4685  				goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4686  			}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4687  		}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4688  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4689  		r = initialize_superblock(ic, journal_sectors, interleave_sectors);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4690  		if (r) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4691  			ti->error = "Could not initialize superblock";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4692  			goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4693  		}
c2bcb2b702e468 Mikulas Patocka    2017-03-17  4694  		if (ic->mode != 'R')
7eada909bfd7ac Mikulas Patocka    2017-01-04  4695  			should_write_sb = true;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4696  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4697  
fb0987682c629c Mikulas Patocka    2024-07-10  4698  	if (!ic->sb->version || ic->sb->version > SB_VERSION_6) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4699  		r = -EINVAL;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4700  		ti->error = "Unknown version";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4701  		goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4702  	}
fb0987682c629c Mikulas Patocka    2024-07-10  4703  	if (!!(ic->sb->flags & cpu_to_le32(SB_FLAG_INLINE)) != (ic->mode == 'I')) {
fb0987682c629c Mikulas Patocka    2024-07-10  4704  		r = -EINVAL;
fb0987682c629c Mikulas Patocka    2024-07-10  4705  		ti->error = "Inline flag mismatch";
fb0987682c629c Mikulas Patocka    2024-07-10  4706  		goto bad;
fb0987682c629c Mikulas Patocka    2024-07-10  4707  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4708  	if (le16_to_cpu(ic->sb->integrity_tag_size) != ic->tag_size) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4709  		r = -EINVAL;
9d609f85b7eb96 Mikulas Patocka    2017-04-18  4710  		ti->error = "Tag size doesn't match the information in superblock";
9d609f85b7eb96 Mikulas Patocka    2017-04-18  4711  		goto bad;
9d609f85b7eb96 Mikulas Patocka    2017-04-18  4712  	}
9d609f85b7eb96 Mikulas Patocka    2017-04-18  4713  	if (ic->sb->log2_sectors_per_block != __ffs(ic->sectors_per_block)) {
9d609f85b7eb96 Mikulas Patocka    2017-04-18  4714  		r = -EINVAL;
9d609f85b7eb96 Mikulas Patocka    2017-04-18  4715  		ti->error = "Block size doesn't match the information in superblock";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4716  		goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4717  	}
fb0987682c629c Mikulas Patocka    2024-07-10  4718  	if (!le32_to_cpu(ic->sb->journal_sections) != (ic->mode == 'I')) {
bc86a41e96c5b6 Mikulas Patocka    2017-07-21  4719  		r = -EINVAL;
fb0987682c629c Mikulas Patocka    2024-07-10  4720  		if (ic->mode != 'I')
bc86a41e96c5b6 Mikulas Patocka    2017-07-21  4721  			ti->error = "Corrupted superblock, journal_sections is 0";
fb0987682c629c Mikulas Patocka    2024-07-10  4722  		else
fb0987682c629c Mikulas Patocka    2024-07-10  4723  			ti->error = "Corrupted superblock, journal_sections is not 0";
bc86a41e96c5b6 Mikulas Patocka    2017-07-21  4724  		goto bad;
bc86a41e96c5b6 Mikulas Patocka    2017-07-21  4725  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4726  	/* make sure that ti->max_io_len doesn't overflow */
356d9d52e1221b Mikulas Patocka    2018-07-03  4727  	if (!ic->meta_dev) {
56b67a4f292f14 Mikulas Patocka    2017-04-18  4728  		if (ic->sb->log2_interleave_sectors < MIN_LOG2_INTERLEAVE_SECTORS ||
56b67a4f292f14 Mikulas Patocka    2017-04-18  4729  		    ic->sb->log2_interleave_sectors > MAX_LOG2_INTERLEAVE_SECTORS) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4730  			r = -EINVAL;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4731  			ti->error = "Invalid interleave_sectors in the superblock";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4732  			goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4733  		}
356d9d52e1221b Mikulas Patocka    2018-07-03  4734  	} else {
356d9d52e1221b Mikulas Patocka    2018-07-03  4735  		if (ic->sb->log2_interleave_sectors) {
356d9d52e1221b Mikulas Patocka    2018-07-03  4736  			r = -EINVAL;
356d9d52e1221b Mikulas Patocka    2018-07-03  4737  			ti->error = "Invalid interleave_sectors in the superblock";
356d9d52e1221b Mikulas Patocka    2018-07-03  4738  			goto bad;
356d9d52e1221b Mikulas Patocka    2018-07-03  4739  		}
356d9d52e1221b Mikulas Patocka    2018-07-03  4740  	}
1ac2c15a7bf859 Mikulas Patocka    2020-03-22  4741  	if (!!(ic->sb->flags & cpu_to_le32(SB_FLAG_HAVE_JOURNAL_MAC)) != !!ic->journal_mac_alg.alg_string) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4742  		r = -EINVAL;
1ac2c15a7bf859 Mikulas Patocka    2020-03-22  4743  		ti->error = "Journal mac mismatch";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4744  		goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4745  	}
1ac2c15a7bf859 Mikulas Patocka    2020-03-22  4746  
1ac2c15a7bf859 Mikulas Patocka    2020-03-22  4747  	get_provided_data_sectors(ic);
1ac2c15a7bf859 Mikulas Patocka    2020-03-22  4748  	if (!ic->provided_data_sectors) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4749  		r = -EINVAL;
1ac2c15a7bf859 Mikulas Patocka    2020-03-22  4750  		ti->error = "The device is too small";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4751  		goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4752  	}
356d9d52e1221b Mikulas Patocka    2018-07-03  4753  
356d9d52e1221b Mikulas Patocka    2018-07-03  4754  try_smaller_buffer:
7eada909bfd7ac Mikulas Patocka    2017-01-04  4755  	r = calculate_device_limits(ic);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4756  	if (r) {
356d9d52e1221b Mikulas Patocka    2018-07-03  4757  		if (ic->meta_dev) {
356d9d52e1221b Mikulas Patocka    2018-07-03  4758  			if (ic->log2_buffer_sectors > 3) {
356d9d52e1221b Mikulas Patocka    2018-07-03  4759  				ic->log2_buffer_sectors--;
356d9d52e1221b Mikulas Patocka    2018-07-03  4760  				goto try_smaller_buffer;
356d9d52e1221b Mikulas Patocka    2018-07-03  4761  			}
356d9d52e1221b Mikulas Patocka    2018-07-03  4762  		}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4763  		ti->error = "The device is too small";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4764  		goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4765  	}
468dfca38b1a6f Mikulas Patocka    2019-04-29  4766  
468dfca38b1a6f Mikulas Patocka    2019-04-29  4767  	if (log2_sectors_per_bitmap_bit < 0)
468dfca38b1a6f Mikulas Patocka    2019-04-29  4768  		log2_sectors_per_bitmap_bit = __fls(DEFAULT_SECTORS_PER_BITMAP_BIT);
468dfca38b1a6f Mikulas Patocka    2019-04-29  4769  	if (log2_sectors_per_bitmap_bit < ic->sb->log2_sectors_per_block)
468dfca38b1a6f Mikulas Patocka    2019-04-29  4770  		log2_sectors_per_bitmap_bit = ic->sb->log2_sectors_per_block;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4771  
468dfca38b1a6f Mikulas Patocka    2019-04-29  4772  	bits_in_journal = ((__u64)ic->journal_section_sectors * ic->journal_sections) << (SECTOR_SHIFT + 3);
468dfca38b1a6f Mikulas Patocka    2019-04-29  4773  	if (bits_in_journal > UINT_MAX)
468dfca38b1a6f Mikulas Patocka    2019-04-29  4774  		bits_in_journal = UINT_MAX;
fb0987682c629c Mikulas Patocka    2024-07-10  4775  	if (bits_in_journal)
468dfca38b1a6f Mikulas Patocka    2019-04-29  4776  		while (bits_in_journal < (ic->provided_data_sectors + ((sector_t)1 << log2_sectors_per_bitmap_bit) - 1) >> log2_sectors_per_bitmap_bit)
468dfca38b1a6f Mikulas Patocka    2019-04-29  4777  			log2_sectors_per_bitmap_bit++;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4778  
468dfca38b1a6f Mikulas Patocka    2019-04-29  4779  	log2_blocks_per_bitmap_bit = log2_sectors_per_bitmap_bit - ic->sb->log2_sectors_per_block;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4780  	ic->log2_blocks_per_bitmap_bit = log2_blocks_per_bitmap_bit;
2d0f25cbc0d948 Heinz Mauelshagen  2023-02-02  4781  	if (should_write_sb)
468dfca38b1a6f Mikulas Patocka    2019-04-29  4782  		ic->sb->log2_blocks_per_bitmap_bit = log2_blocks_per_bitmap_bit;
2d0f25cbc0d948 Heinz Mauelshagen  2023-02-02  4783  
468dfca38b1a6f Mikulas Patocka    2019-04-29  4784  	n_bitmap_bits = ((ic->provided_data_sectors >> ic->sb->log2_sectors_per_block)
468dfca38b1a6f Mikulas Patocka    2019-04-29  4785  				+ (((sector_t)1 << log2_blocks_per_bitmap_bit) - 1)) >> log2_blocks_per_bitmap_bit;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4786  	ic->n_bitmap_blocks = DIV_ROUND_UP(n_bitmap_bits, BITMAP_BLOCK_SIZE * 8);
468dfca38b1a6f Mikulas Patocka    2019-04-29  4787  
356d9d52e1221b Mikulas Patocka    2018-07-03  4788  	if (!ic->meta_dev)
356d9d52e1221b Mikulas Patocka    2018-07-03  4789  		ic->log2_buffer_sectors = min(ic->log2_buffer_sectors, (__u8)__ffs(ic->metadata_run));
356d9d52e1221b Mikulas Patocka    2018-07-03  4790  
2ad50606f847a9 Ondrej Mosnáček    2017-06-05  4791  	if (ti->len > ic->provided_data_sectors) {
2ad50606f847a9 Ondrej Mosnáček    2017-06-05  4792  		r = -EINVAL;
2ad50606f847a9 Ondrej Mosnáček    2017-06-05  4793  		ti->error = "Not enough provided sectors for requested mapping size";
2ad50606f847a9 Ondrej Mosnáček    2017-06-05  4794  		goto bad;
2ad50606f847a9 Ondrej Mosnáček    2017-06-05  4795  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4796  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4797  	threshold = (__u64)ic->journal_entries * (100 - journal_watermark);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4798  	threshold += 50;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4799  	do_div(threshold, 100);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4800  	ic->free_sectors_threshold = threshold;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4801  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4802  	DEBUG_print("initialized:\n");
7eada909bfd7ac Mikulas Patocka    2017-01-04  4803  	DEBUG_print("	integrity_tag_size %u\n", le16_to_cpu(ic->sb->integrity_tag_size));
7eada909bfd7ac Mikulas Patocka    2017-01-04  4804  	DEBUG_print("	journal_entry_size %u\n", ic->journal_entry_size);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4805  	DEBUG_print("	journal_entries_per_sector %u\n", ic->journal_entries_per_sector);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4806  	DEBUG_print("	journal_section_entries %u\n", ic->journal_section_entries);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4807  	DEBUG_print("	journal_section_sectors %u\n", ic->journal_section_sectors);
86a3238c7b9b75 Heinz Mauelshagen  2023-01-25  4808  	DEBUG_print("	journal_sections %u\n", (unsigned int)le32_to_cpu(ic->sb->journal_sections));
7eada909bfd7ac Mikulas Patocka    2017-01-04  4809  	DEBUG_print("	journal_entries %u\n", ic->journal_entries);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4810  	DEBUG_print("	log2_interleave_sectors %d\n", ic->sb->log2_interleave_sectors);
6dcbb52cddd9e5 Christoph Hellwig  2021-10-18  4811  	DEBUG_print("	data_device_sectors 0x%llx\n", bdev_nr_sectors(ic->dev->bdev));
7eada909bfd7ac Mikulas Patocka    2017-01-04  4812  	DEBUG_print("	initial_sectors 0x%x\n", ic->initial_sectors);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4813  	DEBUG_print("	metadata_run 0x%x\n", ic->metadata_run);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4814  	DEBUG_print("	log2_metadata_run %d\n", ic->log2_metadata_run);
7649194a1636ab Mikulas Patocka    2020-03-22  4815  	DEBUG_print("	provided_data_sectors 0x%llx (%llu)\n", ic->provided_data_sectors, ic->provided_data_sectors);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4816  	DEBUG_print("	log2_buffer_sectors %u\n", ic->log2_buffer_sectors);
7649194a1636ab Mikulas Patocka    2020-03-22  4817  	DEBUG_print("	bits_in_journal %llu\n", bits_in_journal);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4818  
468dfca38b1a6f Mikulas Patocka    2019-04-29  4819  	if (ic->recalculate_flag && !(ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING))) {
a3fcf725313960 Mikulas Patocka    2018-07-03  4820  		ic->sb->flags |= cpu_to_le32(SB_FLAG_RECALCULATING);
a3fcf725313960 Mikulas Patocka    2018-07-03  4821  		ic->sb->recalc_sector = cpu_to_le64(0);
a3fcf725313960 Mikulas Patocka    2018-07-03  4822  	}
a3fcf725313960 Mikulas Patocka    2018-07-03  4823  
468dfca38b1a6f Mikulas Patocka    2019-04-29  4824  	if (ic->internal_hash) {
e8c2566f83527f Colin Ian King     2018-11-28  4825  		ic->recalc_wq = alloc_workqueue("dm-integrity-recalc", WQ_MEM_RECLAIM, 1);
a3fcf725313960 Mikulas Patocka    2018-07-03  4826  		if (!ic->recalc_wq) {
a3fcf725313960 Mikulas Patocka    2018-07-03  4827  			ti->error = "Cannot allocate workqueue";
a3fcf725313960 Mikulas Patocka    2018-07-03  4828  			r = -ENOMEM;
a3fcf725313960 Mikulas Patocka    2018-07-03  4829  			goto bad;
a3fcf725313960 Mikulas Patocka    2018-07-03  4830  		}
a3fcf725313960 Mikulas Patocka    2018-07-03  4831  		INIT_WORK(&ic->recalc_work, integrity_recalc);
2d06dfecb132a1 Mikulas Patocka    2021-01-20  4832  	} else {
2d06dfecb132a1 Mikulas Patocka    2021-01-20  4833  		if (ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING)) {
2d06dfecb132a1 Mikulas Patocka    2021-01-20  4834  			ti->error = "Recalculate can only be specified with internal_hash";
2d06dfecb132a1 Mikulas Patocka    2021-01-20  4835  			r = -EINVAL;
2d06dfecb132a1 Mikulas Patocka    2021-01-20  4836  			goto bad;
2d06dfecb132a1 Mikulas Patocka    2021-01-20  4837  		}
a3fcf725313960 Mikulas Patocka    2018-07-03  4838  	}
a3fcf725313960 Mikulas Patocka    2018-07-03  4839  
5c02406428d521 Mikulas Patocka    2021-01-20  4840  	if (ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING) &&
5c02406428d521 Mikulas Patocka    2021-01-20  4841  	    le64_to_cpu(ic->sb->recalc_sector) < ic->provided_data_sectors &&
5c02406428d521 Mikulas Patocka    2021-01-20  4842  	    dm_integrity_disable_recalculate(ic)) {
5c02406428d521 Mikulas Patocka    2021-01-20  4843  		ti->error = "Recalculating with HMAC is disabled for security reasons - if you really need it, use the argument \"legacy_recalculate\"";
5c02406428d521 Mikulas Patocka    2021-01-20  4844  		r = -EOPNOTSUPP;
5c02406428d521 Mikulas Patocka    2021-01-20  4845  		goto bad;
5c02406428d521 Mikulas Patocka    2021-01-20  4846  	}
5c02406428d521 Mikulas Patocka    2021-01-20  4847  
fb0987682c629c Mikulas Patocka    2024-07-10  4848  	if (ic->mode != 'I') {
356d9d52e1221b Mikulas Patocka    2018-07-03  4849  		ic->bufio = dm_bufio_client_create(ic->meta_dev ? ic->meta_dev->bdev : ic->dev->bdev,
0fcb100d50835d Nathan Huckleberry 2022-07-22  4850  				1U << (SECTOR_SHIFT + ic->log2_buffer_sectors), 1, 0, NULL, NULL, 0);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4851  		if (IS_ERR(ic->bufio)) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4852  			r = PTR_ERR(ic->bufio);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4853  			ti->error = "Cannot initialize dm-bufio";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4854  			ic->bufio = NULL;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4855  			goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4856  		}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4857  		dm_bufio_set_sector_offset(ic->bufio, ic->start + ic->initial_sectors);
fb0987682c629c Mikulas Patocka    2024-07-10  4858  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4859  
fb0987682c629c Mikulas Patocka    2024-07-10  4860  	if (ic->mode != 'R' && ic->mode != 'I') {
1aa0efd4210df1 Mike Snitzer       2017-03-17  4861  		r = create_journal(ic, &ti->error);
1aa0efd4210df1 Mike Snitzer       2017-03-17  4862  		if (r)
7eada909bfd7ac Mikulas Patocka    2017-01-04  4863  			goto bad;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4864  
468dfca38b1a6f Mikulas Patocka    2019-04-29  4865  	}
468dfca38b1a6f Mikulas Patocka    2019-04-29  4866  
468dfca38b1a6f Mikulas Patocka    2019-04-29  4867  	if (ic->mode == 'B') {
86a3238c7b9b75 Heinz Mauelshagen  2023-01-25  4868  		unsigned int i;
86a3238c7b9b75 Heinz Mauelshagen  2023-01-25  4869  		unsigned int n_bitmap_pages = DIV_ROUND_UP(ic->n_bitmap_blocks, PAGE_SIZE / BITMAP_BLOCK_SIZE);
468dfca38b1a6f Mikulas Patocka    2019-04-29  4870  
468dfca38b1a6f Mikulas Patocka    2019-04-29  4871  		ic->recalc_bitmap = dm_integrity_alloc_page_list(n_bitmap_pages);
468dfca38b1a6f Mikulas Patocka    2019-04-29  4872  		if (!ic->recalc_bitmap) {
468dfca38b1a6f Mikulas Patocka    2019-04-29  4873  			r = -ENOMEM;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4874  			goto bad;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4875  		}
468dfca38b1a6f Mikulas Patocka    2019-04-29  4876  		ic->may_write_bitmap = dm_integrity_alloc_page_list(n_bitmap_pages);
468dfca38b1a6f Mikulas Patocka    2019-04-29  4877  		if (!ic->may_write_bitmap) {
468dfca38b1a6f Mikulas Patocka    2019-04-29  4878  			r = -ENOMEM;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4879  			goto bad;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4880  		}
468dfca38b1a6f Mikulas Patocka    2019-04-29  4881  		ic->bbs = kvmalloc_array(ic->n_bitmap_blocks, sizeof(struct bitmap_block_status), GFP_KERNEL);
468dfca38b1a6f Mikulas Patocka    2019-04-29  4882  		if (!ic->bbs) {
468dfca38b1a6f Mikulas Patocka    2019-04-29  4883  			r = -ENOMEM;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4884  			goto bad;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4885  		}
468dfca38b1a6f Mikulas Patocka    2019-04-29  4886  		INIT_DELAYED_WORK(&ic->bitmap_flush_work, bitmap_flush_work);
468dfca38b1a6f Mikulas Patocka    2019-04-29  4887  		for (i = 0; i < ic->n_bitmap_blocks; i++) {
468dfca38b1a6f Mikulas Patocka    2019-04-29  4888  			struct bitmap_block_status *bbs = &ic->bbs[i];
86a3238c7b9b75 Heinz Mauelshagen  2023-01-25  4889  			unsigned int sector, pl_index, pl_offset;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4890  
468dfca38b1a6f Mikulas Patocka    2019-04-29  4891  			INIT_WORK(&bbs->work, bitmap_block_work);
468dfca38b1a6f Mikulas Patocka    2019-04-29  4892  			bbs->ic = ic;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4893  			bbs->idx = i;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4894  			bio_list_init(&bbs->bio_queue);
468dfca38b1a6f Mikulas Patocka    2019-04-29  4895  			spin_lock_init(&bbs->bio_queue_lock);
468dfca38b1a6f Mikulas Patocka    2019-04-29  4896  
468dfca38b1a6f Mikulas Patocka    2019-04-29  4897  			sector = i * (BITMAP_BLOCK_SIZE >> SECTOR_SHIFT);
468dfca38b1a6f Mikulas Patocka    2019-04-29  4898  			pl_index = sector >> (PAGE_SHIFT - SECTOR_SHIFT);
468dfca38b1a6f Mikulas Patocka    2019-04-29  4899  			pl_offset = (sector << SECTOR_SHIFT) & (PAGE_SIZE - 1);
468dfca38b1a6f Mikulas Patocka    2019-04-29  4900  
468dfca38b1a6f Mikulas Patocka    2019-04-29  4901  			bbs->bitmap = lowmem_page_address(ic->journal[pl_index].page) + pl_offset;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4902  		}
c2bcb2b702e468 Mikulas Patocka    2017-03-17  4903  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4904  
7eada909bfd7ac Mikulas Patocka    2017-01-04 @4905  	if (should_write_sb) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4906  		init_journal(ic, 0, ic->journal_sections, 0);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4907  		r = dm_integrity_failed(ic);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4908  		if (unlikely(r)) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4909  			ti->error = "Error initializing journal";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4910  			goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4911  		}
c9154a4cb8dc6a Bart Van Assche    2022-07-14  4912  		r = sync_rw_sb(ic, REQ_OP_WRITE | REQ_FUA);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4913  		if (r) {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4914  			ti->error = "Error initializing superblock";
7eada909bfd7ac Mikulas Patocka    2017-01-04  4915  			goto bad;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4916  		}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4917  		ic->just_formatted = true;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4918  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4919  
fb0987682c629c Mikulas Patocka    2024-07-10  4920  	if (!ic->meta_dev && ic->mode != 'I') {
7eada909bfd7ac Mikulas Patocka    2017-01-04  4921  		r = dm_set_target_max_io_len(ti, 1U << ic->sb->log2_interleave_sectors);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4922  		if (r)
7eada909bfd7ac Mikulas Patocka    2017-01-04  4923  			goto bad;
356d9d52e1221b Mikulas Patocka    2018-07-03  4924  	}
468dfca38b1a6f Mikulas Patocka    2019-04-29  4925  	if (ic->mode == 'B') {
0ef0b4717aa684 Heinz Mauelshagen  2023-02-01  4926  		unsigned int max_io_len;
0ef0b4717aa684 Heinz Mauelshagen  2023-02-01  4927  
0ef0b4717aa684 Heinz Mauelshagen  2023-02-01  4928  		max_io_len = ((sector_t)ic->sectors_per_block << ic->log2_blocks_per_bitmap_bit) * (BITMAP_BLOCK_SIZE * 8);
468dfca38b1a6f Mikulas Patocka    2019-04-29  4929  		if (!max_io_len)
468dfca38b1a6f Mikulas Patocka    2019-04-29  4930  			max_io_len = 1U << 31;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4931  		DEBUG_print("max_io_len: old %u, new %u\n", ti->max_io_len, max_io_len);
468dfca38b1a6f Mikulas Patocka    2019-04-29  4932  		if (!ti->max_io_len || ti->max_io_len > max_io_len) {
468dfca38b1a6f Mikulas Patocka    2019-04-29  4933  			r = dm_set_target_max_io_len(ti, max_io_len);
468dfca38b1a6f Mikulas Patocka    2019-04-29  4934  			if (r)
468dfca38b1a6f Mikulas Patocka    2019-04-29  4935  				goto bad;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4936  		}
468dfca38b1a6f Mikulas Patocka    2019-04-29  4937  	}
7eada909bfd7ac Mikulas Patocka    2017-01-04  4938  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4939  	ti->num_flush_bios = 1;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4940  	ti->flush_supported = true;
84597a44a9d86a Mikulas Patocka    2020-03-22  4941  	if (ic->discard)
84597a44a9d86a Mikulas Patocka    2020-03-22  4942  		ti->num_discard_bios = 1;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4943  
fb0987682c629c Mikulas Patocka    2024-07-10  4944  	if (ic->mode == 'I')
fb0987682c629c Mikulas Patocka    2024-07-10  4945  		ti->mempool_needs_integrity = true;
fb0987682c629c Mikulas Patocka    2024-07-10  4946  
82bb85998cc9a3 Michael Weiß       2021-09-04  4947  	dm_audit_log_ctr(DM_MSG_PREFIX, ti, 1);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4948  	return 0;
468dfca38b1a6f Mikulas Patocka    2019-04-29  4949  
7eada909bfd7ac Mikulas Patocka    2017-01-04  4950  bad:
82bb85998cc9a3 Michael Weiß       2021-09-04  4951  	dm_audit_log_ctr(DM_MSG_PREFIX, ti, 0);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4952  	dm_integrity_dtr(ti);
7eada909bfd7ac Mikulas Patocka    2017-01-04  4953  	return r;
7eada909bfd7ac Mikulas Patocka    2017-01-04  4954  }
7eada909bfd7ac Mikulas Patocka    2017-01-04  4955  

:::::: The code at line 4905 was first introduced by commit
:::::: 7eada909bfd7ac90a4522e56aa3179d1fd68cd14 dm: add integrity target

:::::: TO: Mikulas Patocka <mpatocka@redhat.com>
:::::: CC: Mike Snitzer <snitzer@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
