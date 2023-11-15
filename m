Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACE82D044
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 14:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htSwQzaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700058440; x=1731594440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EKtNuOECS2hZW0lTvFlTuPjq79LFYAh4msxiAK0DsdI=;
  b=htSwQzaGcCII9Bg+IXfcNmyi+R4wqdBuAYEyu8jKFTrRWBevexlyPkCM
   TsB2hNB19iA3juR0a8ZHnILCqcNa06bSZc66LhrC8iLi4Y5qFkP0C7V9x
   DsuHQYZN4MStua1brzYe1swtD9vXYUol7w2WVJOyvvl0+X17sIoUOMUgV
   cHiJZbnNLoLKaYAcO+QT5sPjkZa4kXEIdQbeJvqZK0iAEndSvffrLtfIN
   6sqxPTJbVHQV6L6h1HWzjC1KUbE5lIdrGuakJLh9giSOQFgmTeitJEyAi
   6gaRVQ06MFaCLI6IFjk2oxWLomQA8dMPbkxNCnwdP9RnHuUy7YcIOILFP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="3999090"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="3999090"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 06:27:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="938491011"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="938491011"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Nov 2023 06:27:17 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3GrK-0000P0-19;
	Wed, 15 Nov 2023 14:27:14 +0000
Date: Wed, 15 Nov 2023 22:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-6.1 714/14885]
 drivers/md/dm-default-key.c:205:32: sparse: sparse: self-comparison always
 evaluates to false
Message-ID: <202311152251.7sjIXycT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/md/dm-default-key.c:205:32: sparse: sparse: self-comparison always evaluates to false"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   c47043d65f0a1063f6c651e558aeb80621046eb2
commit: cb39ec0c1040e89d14ae0852454f8fd64a704118 [714/14885] ANDROID: dm: add dm-default-key target for metadata encryption
:::::: branch date: 15 hours ago
:::::: commit date: 3 years, 10 months ago
config: i386-randconfig-061-20231115 (https://download.01.org/0day-ci/archive/20231115/202311152251.7sjIXycT-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311152251.7sjIXycT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311152251.7sjIXycT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/md/dm-default-key.c:205:32: sparse: sparse: self-comparison always evaluates to false

vim +205 drivers/md/dm-default-key.c

cb39ec0c1040e8 Eric Biggers 2020-01-21  132  
cb39ec0c1040e8 Eric Biggers 2020-01-21  133  /*
cb39ec0c1040e8 Eric Biggers 2020-01-21  134   * Construct a default-key mapping:
cb39ec0c1040e8 Eric Biggers 2020-01-21  135   * <cipher> <key> <iv_offset> <dev_path> <start>
cb39ec0c1040e8 Eric Biggers 2020-01-21  136   *
cb39ec0c1040e8 Eric Biggers 2020-01-21  137   * This syntax matches dm-crypt's, but lots of unneeded functionality has been
cb39ec0c1040e8 Eric Biggers 2020-01-21  138   * removed.  Also, dm-default-key requires that the "iv_large_sectors" option be
cb39ec0c1040e8 Eric Biggers 2020-01-21  139   * given whenever a non-default sector size is used.
cb39ec0c1040e8 Eric Biggers 2020-01-21  140   */
cb39ec0c1040e8 Eric Biggers 2020-01-21  141  static int default_key_ctr(struct dm_target *ti, unsigned int argc, char **argv)
cb39ec0c1040e8 Eric Biggers 2020-01-21  142  {
cb39ec0c1040e8 Eric Biggers 2020-01-21  143  	struct default_key_c *dkc;
cb39ec0c1040e8 Eric Biggers 2020-01-21  144  	const struct dm_default_key_cipher *cipher;
cb39ec0c1040e8 Eric Biggers 2020-01-21  145  	u8 raw_key[DM_DEFAULT_KEY_MAX_KEY_SIZE];
cb39ec0c1040e8 Eric Biggers 2020-01-21  146  	unsigned long long tmpll;
cb39ec0c1040e8 Eric Biggers 2020-01-21  147  	char dummy;
cb39ec0c1040e8 Eric Biggers 2020-01-21  148  	int err;
cb39ec0c1040e8 Eric Biggers 2020-01-21  149  
cb39ec0c1040e8 Eric Biggers 2020-01-21  150  	if (argc < 5) {
cb39ec0c1040e8 Eric Biggers 2020-01-21  151  		ti->error = "Not enough arguments";
cb39ec0c1040e8 Eric Biggers 2020-01-21  152  		return -EINVAL;
cb39ec0c1040e8 Eric Biggers 2020-01-21  153  	}
cb39ec0c1040e8 Eric Biggers 2020-01-21  154  
cb39ec0c1040e8 Eric Biggers 2020-01-21  155  	dkc = kzalloc(sizeof(*dkc), GFP_KERNEL);
cb39ec0c1040e8 Eric Biggers 2020-01-21  156  	if (!dkc) {
cb39ec0c1040e8 Eric Biggers 2020-01-21  157  		ti->error = "Out of memory";
cb39ec0c1040e8 Eric Biggers 2020-01-21  158  		return -ENOMEM;
cb39ec0c1040e8 Eric Biggers 2020-01-21  159  	}
cb39ec0c1040e8 Eric Biggers 2020-01-21  160  	ti->private = dkc;
cb39ec0c1040e8 Eric Biggers 2020-01-21  161  
cb39ec0c1040e8 Eric Biggers 2020-01-21  162  	/* <cipher> */
cb39ec0c1040e8 Eric Biggers 2020-01-21  163  	dkc->cipher_string = kstrdup(argv[0], GFP_KERNEL);
cb39ec0c1040e8 Eric Biggers 2020-01-21  164  	if (!dkc->cipher_string) {
cb39ec0c1040e8 Eric Biggers 2020-01-21  165  		ti->error = "Out of memory";
cb39ec0c1040e8 Eric Biggers 2020-01-21  166  		err = -ENOMEM;
cb39ec0c1040e8 Eric Biggers 2020-01-21  167  		goto bad;
cb39ec0c1040e8 Eric Biggers 2020-01-21  168  	}
cb39ec0c1040e8 Eric Biggers 2020-01-21  169  	cipher = lookup_cipher(dkc->cipher_string);
cb39ec0c1040e8 Eric Biggers 2020-01-21  170  	if (!cipher) {
cb39ec0c1040e8 Eric Biggers 2020-01-21  171  		ti->error = "Unsupported cipher";
cb39ec0c1040e8 Eric Biggers 2020-01-21  172  		err = -EINVAL;
cb39ec0c1040e8 Eric Biggers 2020-01-21  173  		goto bad;
cb39ec0c1040e8 Eric Biggers 2020-01-21  174  	}
cb39ec0c1040e8 Eric Biggers 2020-01-21  175  
cb39ec0c1040e8 Eric Biggers 2020-01-21  176  	/* <key> */
cb39ec0c1040e8 Eric Biggers 2020-01-21  177  	if (strlen(argv[1]) != 2 * cipher->key_size) {
cb39ec0c1040e8 Eric Biggers 2020-01-21  178  		ti->error = "Incorrect key size for cipher";
cb39ec0c1040e8 Eric Biggers 2020-01-21  179  		err = -EINVAL;
cb39ec0c1040e8 Eric Biggers 2020-01-21  180  		goto bad;
cb39ec0c1040e8 Eric Biggers 2020-01-21  181  	}
cb39ec0c1040e8 Eric Biggers 2020-01-21  182  	if (hex2bin(raw_key, argv[1], cipher->key_size) != 0) {
cb39ec0c1040e8 Eric Biggers 2020-01-21  183  		ti->error = "Malformed key string";
cb39ec0c1040e8 Eric Biggers 2020-01-21  184  		err = -EINVAL;
cb39ec0c1040e8 Eric Biggers 2020-01-21  185  		goto bad;
cb39ec0c1040e8 Eric Biggers 2020-01-21  186  	}
cb39ec0c1040e8 Eric Biggers 2020-01-21  187  
cb39ec0c1040e8 Eric Biggers 2020-01-21  188  	/* <iv_offset> */
cb39ec0c1040e8 Eric Biggers 2020-01-21  189  	if (sscanf(argv[2], "%llu%c", &dkc->iv_offset, &dummy) != 1) {
cb39ec0c1040e8 Eric Biggers 2020-01-21  190  		ti->error = "Invalid iv_offset sector";
cb39ec0c1040e8 Eric Biggers 2020-01-21  191  		err = -EINVAL;
cb39ec0c1040e8 Eric Biggers 2020-01-21  192  		goto bad;
cb39ec0c1040e8 Eric Biggers 2020-01-21  193  	}
cb39ec0c1040e8 Eric Biggers 2020-01-21  194  
cb39ec0c1040e8 Eric Biggers 2020-01-21  195  	/* <dev_path> */
cb39ec0c1040e8 Eric Biggers 2020-01-21  196  	err = dm_get_device(ti, argv[3], dm_table_get_mode(ti->table),
cb39ec0c1040e8 Eric Biggers 2020-01-21  197  			    &dkc->dev);
cb39ec0c1040e8 Eric Biggers 2020-01-21  198  	if (err) {
cb39ec0c1040e8 Eric Biggers 2020-01-21  199  		ti->error = "Device lookup failed";
cb39ec0c1040e8 Eric Biggers 2020-01-21  200  		goto bad;
cb39ec0c1040e8 Eric Biggers 2020-01-21  201  	}
cb39ec0c1040e8 Eric Biggers 2020-01-21  202  
cb39ec0c1040e8 Eric Biggers 2020-01-21  203  	/* <start> */
cb39ec0c1040e8 Eric Biggers 2020-01-21  204  	if (sscanf(argv[4], "%llu%c", &tmpll, &dummy) != 1 ||
cb39ec0c1040e8 Eric Biggers 2020-01-21 @205  	    tmpll != (sector_t)tmpll) {
cb39ec0c1040e8 Eric Biggers 2020-01-21  206  		ti->error = "Invalid start sector";
cb39ec0c1040e8 Eric Biggers 2020-01-21  207  		err = -EINVAL;
cb39ec0c1040e8 Eric Biggers 2020-01-21  208  		goto bad;
cb39ec0c1040e8 Eric Biggers 2020-01-21  209  	}
cb39ec0c1040e8 Eric Biggers 2020-01-21  210  	dkc->start = tmpll;
cb39ec0c1040e8 Eric Biggers 2020-01-21  211  
cb39ec0c1040e8 Eric Biggers 2020-01-21  212  	/* optional arguments */
cb39ec0c1040e8 Eric Biggers 2020-01-21  213  	dkc->sector_size = SECTOR_SIZE;
cb39ec0c1040e8 Eric Biggers 2020-01-21  214  	if (argc > 5) {
cb39ec0c1040e8 Eric Biggers 2020-01-21  215  		err = default_key_ctr_optional(ti, argc - 5, &argv[5]);
cb39ec0c1040e8 Eric Biggers 2020-01-21  216  		if (err)
cb39ec0c1040e8 Eric Biggers 2020-01-21  217  			goto bad;
cb39ec0c1040e8 Eric Biggers 2020-01-21  218  	}
cb39ec0c1040e8 Eric Biggers 2020-01-21  219  	dkc->sector_bits = ilog2(dkc->sector_size);
cb39ec0c1040e8 Eric Biggers 2020-01-21  220  	if (ti->len & ((dkc->sector_size >> SECTOR_SHIFT) - 1)) {
cb39ec0c1040e8 Eric Biggers 2020-01-21  221  		ti->error = "Device size is not a multiple of sector_size";
cb39ec0c1040e8 Eric Biggers 2020-01-21  222  		err = -EINVAL;
cb39ec0c1040e8 Eric Biggers 2020-01-21  223  		goto bad;
cb39ec0c1040e8 Eric Biggers 2020-01-21  224  	}
cb39ec0c1040e8 Eric Biggers 2020-01-21  225  
cb39ec0c1040e8 Eric Biggers 2020-01-21  226  	err = blk_crypto_init_key(&dkc->key, raw_key, cipher->key_size,
cb39ec0c1040e8 Eric Biggers 2020-01-21  227  				  cipher->mode_num, dkc->sector_size);
cb39ec0c1040e8 Eric Biggers 2020-01-21  228  	if (err) {
cb39ec0c1040e8 Eric Biggers 2020-01-21  229  		ti->error = "Error initializing blk-crypto key";
cb39ec0c1040e8 Eric Biggers 2020-01-21  230  		goto bad;
cb39ec0c1040e8 Eric Biggers 2020-01-21  231  	}
cb39ec0c1040e8 Eric Biggers 2020-01-21  232  
cb39ec0c1040e8 Eric Biggers 2020-01-21  233  	err = blk_crypto_start_using_mode(cipher->mode_num, dkc->sector_size,
cb39ec0c1040e8 Eric Biggers 2020-01-21  234  					  dkc->dev->bdev->bd_queue);
cb39ec0c1040e8 Eric Biggers 2020-01-21  235  	if (err) {
cb39ec0c1040e8 Eric Biggers 2020-01-21  236  		ti->error = "Error starting to use blk-crypto";
cb39ec0c1040e8 Eric Biggers 2020-01-21  237  		goto bad;
cb39ec0c1040e8 Eric Biggers 2020-01-21  238  	}
cb39ec0c1040e8 Eric Biggers 2020-01-21  239  
cb39ec0c1040e8 Eric Biggers 2020-01-21  240  	ti->num_flush_bios = 1;
cb39ec0c1040e8 Eric Biggers 2020-01-21  241  
cb39ec0c1040e8 Eric Biggers 2020-01-21  242  	ti->may_passthrough_inline_crypto = true;
cb39ec0c1040e8 Eric Biggers 2020-01-21  243  
cb39ec0c1040e8 Eric Biggers 2020-01-21  244  	err = 0;
cb39ec0c1040e8 Eric Biggers 2020-01-21  245  	goto out;
cb39ec0c1040e8 Eric Biggers 2020-01-21  246  
cb39ec0c1040e8 Eric Biggers 2020-01-21  247  bad:
cb39ec0c1040e8 Eric Biggers 2020-01-21  248  	default_key_dtr(ti);
cb39ec0c1040e8 Eric Biggers 2020-01-21  249  out:
cb39ec0c1040e8 Eric Biggers 2020-01-21  250  	memzero_explicit(raw_key, sizeof(raw_key));
cb39ec0c1040e8 Eric Biggers 2020-01-21  251  	return err;
cb39ec0c1040e8 Eric Biggers 2020-01-21  252  }
cb39ec0c1040e8 Eric Biggers 2020-01-21  253  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
