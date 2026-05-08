Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A832C3266
	for <oe-kbuild@lists.linux.dev>; Fri,  8 May 2026 04:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778213232; cv=none; b=b0k5PiY0bczyfj2qmDQOzwhuofo1wTW2ipNWG94CpbI9EguhSgIU2ahotUN6HWAMESiex4dbww87ZAnXoyqYwKgBhkRdn2OM7mw5pfRJWeNvc+F3KiELd6zBALgKmXiGim85V04mWSZEhGFNQz3sd0OYAVW/Ob15bjHBzNPLBMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778213232; c=relaxed/simple;
	bh=aSmWhvWLvCqo+j4e/dQCscttp8/NIYiOO3TWLgtXp6Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cyz3abWVX1N6jJuk7zJk132Dh5caLHQEhZv3Ny0P0txgDv2egssF2WUYGgDQbtFUcKnpMkMqVnPp9hKbNXCXya5XWrQj2Cezu1mRM6blHKAgx5TO7c+MjmmlE9Kua/vHuLPgLlKwLiFe3u5m7Y2zrOyYSDxWl6Fd9avUygXMJro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aoxBFyxd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aoxBFyxd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778213231; x=1809749231;
  h=date:from:to:cc:subject:message-id;
  bh=aSmWhvWLvCqo+j4e/dQCscttp8/NIYiOO3TWLgtXp6Q=;
  b=aoxBFyxdrQpG2rhBsx2rXfeZStdOplPBmPz5YbnCxNXL8g+aVGeS0OcG
   pUME2bgJJsXjMHtaXYea7jNOPWvSB3yCkK43+unzXJFhChSREMsg43ck/
   eOBSndFUbkjyP/vXQ46nJR6PbfNnJRGs8OvnU1ddIgr1nAe+pyHkuGx+N
   Zc0iUKTcQnBU5UqsWsQquoe8lmXfBwScNl8Nv94a2YT+h/JzKxFSJ5RJy
   kal3iQ6UgKiyWzLycvudUW/bf9xEGYfxYxw3IX42QKm6pXLB4+V6QCt2c
   04nKctJOiFBn2K0f08LVB7yORWljtQhM/2fz4jObgxzR88NVI7I1IYaFC
   g==;
X-CSE-ConnectionGUID: fGNNo1P1TyqJVLUbhXxpGQ==
X-CSE-MsgGUID: ea7HYNStTAOyOv8NONGIZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79115098"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="79115098"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 21:07:08 -0700
X-CSE-ConnectionGUID: xAK9bhv8QMiOzUHR5+fBsw==
X-CSE-MsgGUID: kHDsEsU3R5ejoVRrIJPQlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="274780405"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 May 2026 21:07:07 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLCUS-000000000ll-1Ued;
	Fri, 08 May 2026 04:07:04 +0000
Date: Fri, 08 May 2026 12:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 3785/4176]
 drivers/md/dm-inlinecrypt.c:329:29: sparse: sparse: unsigned value that used
 to be signed checked against zero?
Message-ID: <202605081242.oqiTY3cy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/md/dm-inlinecrypt.c:329:29: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Eric Biggers <ebiggers@google.com>
CC: Mikulas Patocka <mpatocka@redhat.com>
CC: Linlin Zhang <linlin.zhang@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17c7841d09ee7d33557fd075562d9289b6018c90
commit: 753450f716417f53759c91b5bb7b96563379a719 [3785/4176] dm-inlinecrypt: add target for inline block device encryption
:::::: branch date: 16 hours ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-r123-20260508 (https://download.01.org/0day-ci/archive/20260508/202605081242.oqiTY3cy-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081242.oqiTY3cy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605081242.oqiTY3cy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/md/dm-inlinecrypt.c:329:29: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/md/dm-inlinecrypt.c:328:37: sparse: signed value source

vim +329 drivers/md/dm-inlinecrypt.c

753450f716417f5 Eric Biggers 2026-04-30  283  
753450f716417f5 Eric Biggers 2026-04-30  284  /*
753450f716417f5 Eric Biggers 2026-04-30  285   * Construct an inlinecrypt mapping:
753450f716417f5 Eric Biggers 2026-04-30  286   * <cipher> [<key>|:<key_size>:<logon>:<key_description>] <iv_offset> <dev_path> <start>
753450f716417f5 Eric Biggers 2026-04-30  287   *
753450f716417f5 Eric Biggers 2026-04-30  288   * This syntax matches dm-crypt's, but the set of supported functionality has
753450f716417f5 Eric Biggers 2026-04-30  289   * been stripped down.
753450f716417f5 Eric Biggers 2026-04-30  290   */
753450f716417f5 Eric Biggers 2026-04-30  291  static int inlinecrypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
753450f716417f5 Eric Biggers 2026-04-30  292  {
753450f716417f5 Eric Biggers 2026-04-30  293  	struct inlinecrypt_ctx *ctx;
753450f716417f5 Eric Biggers 2026-04-30  294  	const struct dm_inlinecrypt_cipher *cipher;
753450f716417f5 Eric Biggers 2026-04-30  295  	u8 raw_key[BLK_CRYPTO_MAX_ANY_KEY_SIZE];
753450f716417f5 Eric Biggers 2026-04-30  296  	unsigned int dun_bytes;
753450f716417f5 Eric Biggers 2026-04-30  297  	unsigned long long tmpll;
753450f716417f5 Eric Biggers 2026-04-30  298  	char dummy;
753450f716417f5 Eric Biggers 2026-04-30  299  	int err;
753450f716417f5 Eric Biggers 2026-04-30  300  
753450f716417f5 Eric Biggers 2026-04-30  301  	if (argc < 5) {
753450f716417f5 Eric Biggers 2026-04-30  302  		ti->error = "Not enough arguments";
753450f716417f5 Eric Biggers 2026-04-30  303  		return -EINVAL;
753450f716417f5 Eric Biggers 2026-04-30  304  	}
753450f716417f5 Eric Biggers 2026-04-30  305  
753450f716417f5 Eric Biggers 2026-04-30  306  	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
753450f716417f5 Eric Biggers 2026-04-30  307  	if (!ctx) {
753450f716417f5 Eric Biggers 2026-04-30  308  		ti->error = "Out of memory";
753450f716417f5 Eric Biggers 2026-04-30  309  		return -ENOMEM;
753450f716417f5 Eric Biggers 2026-04-30  310  	}
753450f716417f5 Eric Biggers 2026-04-30  311  	ti->private = ctx;
753450f716417f5 Eric Biggers 2026-04-30  312  
753450f716417f5 Eric Biggers 2026-04-30  313  	/* <cipher> */
753450f716417f5 Eric Biggers 2026-04-30  314  	ctx->cipher_string = kstrdup(argv[0], GFP_KERNEL);
753450f716417f5 Eric Biggers 2026-04-30  315  	if (!ctx->cipher_string) {
753450f716417f5 Eric Biggers 2026-04-30  316  		ti->error = "Out of memory";
753450f716417f5 Eric Biggers 2026-04-30  317  		err = -ENOMEM;
753450f716417f5 Eric Biggers 2026-04-30  318  		goto bad;
753450f716417f5 Eric Biggers 2026-04-30  319  	}
753450f716417f5 Eric Biggers 2026-04-30  320  	cipher = lookup_cipher(ctx->cipher_string);
753450f716417f5 Eric Biggers 2026-04-30  321  	if (!cipher) {
753450f716417f5 Eric Biggers 2026-04-30  322  		ti->error = "Unsupported cipher";
753450f716417f5 Eric Biggers 2026-04-30  323  		err = -EINVAL;
753450f716417f5 Eric Biggers 2026-04-30  324  		goto bad;
753450f716417f5 Eric Biggers 2026-04-30  325  	}
753450f716417f5 Eric Biggers 2026-04-30  326  
753450f716417f5 Eric Biggers 2026-04-30  327  	/* <key> */
753450f716417f5 Eric Biggers 2026-04-30  328  	ctx->key_size = get_key_size(&argv[1]);
753450f716417f5 Eric Biggers 2026-04-30 @329  	if (ctx->key_size < 0) {
753450f716417f5 Eric Biggers 2026-04-30  330  		ti->error = "Cannot parse key size";
753450f716417f5 Eric Biggers 2026-04-30  331  		return -EINVAL;
753450f716417f5 Eric Biggers 2026-04-30  332  	}
753450f716417f5 Eric Biggers 2026-04-30  333  	err = inlinecrypt_get_key(argv[1], raw_key, ctx->key_size);
753450f716417f5 Eric Biggers 2026-04-30  334  	if (err) {
753450f716417f5 Eric Biggers 2026-04-30  335  		ti->error = "Malformed key string";
753450f716417f5 Eric Biggers 2026-04-30  336  		goto bad;
753450f716417f5 Eric Biggers 2026-04-30  337  	}
753450f716417f5 Eric Biggers 2026-04-30  338  
753450f716417f5 Eric Biggers 2026-04-30  339  	/* <iv_offset> */
753450f716417f5 Eric Biggers 2026-04-30  340  	if (sscanf(argv[2], "%llu%c", &ctx->iv_offset, &dummy) != 1) {
753450f716417f5 Eric Biggers 2026-04-30  341  		ti->error = "Invalid iv_offset sector";
753450f716417f5 Eric Biggers 2026-04-30  342  		err = -EINVAL;
753450f716417f5 Eric Biggers 2026-04-30  343  		goto bad;
753450f716417f5 Eric Biggers 2026-04-30  344  	}
753450f716417f5 Eric Biggers 2026-04-30  345  
753450f716417f5 Eric Biggers 2026-04-30  346  	/* <dev_path> */
753450f716417f5 Eric Biggers 2026-04-30  347  	err = dm_get_device(ti, argv[3], dm_table_get_mode(ti->table),
753450f716417f5 Eric Biggers 2026-04-30  348  			    &ctx->dev);
753450f716417f5 Eric Biggers 2026-04-30  349  	if (err) {
753450f716417f5 Eric Biggers 2026-04-30  350  		ti->error = "Device lookup failed";
753450f716417f5 Eric Biggers 2026-04-30  351  		goto bad;
753450f716417f5 Eric Biggers 2026-04-30  352  	}
753450f716417f5 Eric Biggers 2026-04-30  353  
753450f716417f5 Eric Biggers 2026-04-30  354  	/* <start> */
753450f716417f5 Eric Biggers 2026-04-30  355  	if (sscanf(argv[4], "%llu%c", &tmpll, &dummy) != 1 ||
753450f716417f5 Eric Biggers 2026-04-30  356  	    tmpll != (sector_t)tmpll) {
753450f716417f5 Eric Biggers 2026-04-30  357  		ti->error = "Invalid start sector";
753450f716417f5 Eric Biggers 2026-04-30  358  		err = -EINVAL;
753450f716417f5 Eric Biggers 2026-04-30  359  		goto bad;
753450f716417f5 Eric Biggers 2026-04-30  360  	}
753450f716417f5 Eric Biggers 2026-04-30  361  	ctx->start = tmpll;
753450f716417f5 Eric Biggers 2026-04-30  362  
753450f716417f5 Eric Biggers 2026-04-30  363  	/* optional arguments */
753450f716417f5 Eric Biggers 2026-04-30  364  	ctx->sector_size = SECTOR_SIZE;
753450f716417f5 Eric Biggers 2026-04-30  365  	if (argc > 5) {
753450f716417f5 Eric Biggers 2026-04-30  366  		err = inlinecrypt_ctr_optional(ti, argc - 5, &argv[5]);
753450f716417f5 Eric Biggers 2026-04-30  367  		if (err)
753450f716417f5 Eric Biggers 2026-04-30  368  			goto bad;
753450f716417f5 Eric Biggers 2026-04-30  369  	}
753450f716417f5 Eric Biggers 2026-04-30  370  	ctx->sector_bits = ilog2(ctx->sector_size);
753450f716417f5 Eric Biggers 2026-04-30  371  	if (ti->len & ((ctx->sector_size >> SECTOR_SHIFT) - 1)) {
753450f716417f5 Eric Biggers 2026-04-30  372  		ti->error = "Device size is not a multiple of sector_size";
753450f716417f5 Eric Biggers 2026-04-30  373  		err = -EINVAL;
753450f716417f5 Eric Biggers 2026-04-30  374  		goto bad;
753450f716417f5 Eric Biggers 2026-04-30  375  	}
753450f716417f5 Eric Biggers 2026-04-30  376  	if (ctx->iv_offset & ((ctx->sector_size >> SECTOR_SHIFT) - 1)) {
753450f716417f5 Eric Biggers 2026-04-30  377  		ti->error = "Wrong alignment of iv_offset sector";
753450f716417f5 Eric Biggers 2026-04-30  378  		err = -EINVAL;
753450f716417f5 Eric Biggers 2026-04-30  379  	}
753450f716417f5 Eric Biggers 2026-04-30  380  
753450f716417f5 Eric Biggers 2026-04-30  381  	ctx->max_dun = (ctx->iv_offset + ti->len - 1) >>
753450f716417f5 Eric Biggers 2026-04-30  382  		       (ctx->sector_bits - SECTOR_SHIFT);
753450f716417f5 Eric Biggers 2026-04-30  383  	dun_bytes = DIV_ROUND_UP(fls64(ctx->max_dun), 8);
753450f716417f5 Eric Biggers 2026-04-30  384  
753450f716417f5 Eric Biggers 2026-04-30  385  	err = blk_crypto_init_key(&ctx->key, raw_key, ctx->key_size,
753450f716417f5 Eric Biggers 2026-04-30  386  				  BLK_CRYPTO_KEY_TYPE_RAW,
753450f716417f5 Eric Biggers 2026-04-30  387  				  cipher->mode_num, dun_bytes,
753450f716417f5 Eric Biggers 2026-04-30  388  				  ctx->sector_size);
753450f716417f5 Eric Biggers 2026-04-30  389  	if (err) {
753450f716417f5 Eric Biggers 2026-04-30  390  		ti->error = "Error initializing blk-crypto key";
753450f716417f5 Eric Biggers 2026-04-30  391  		goto bad;
753450f716417f5 Eric Biggers 2026-04-30  392  	}
753450f716417f5 Eric Biggers 2026-04-30  393  
753450f716417f5 Eric Biggers 2026-04-30  394  	err = blk_crypto_start_using_key(ctx->dev->bdev, &ctx->key);
753450f716417f5 Eric Biggers 2026-04-30  395  	if (err) {
753450f716417f5 Eric Biggers 2026-04-30  396  		ti->error = "Error starting to use blk-crypto";
753450f716417f5 Eric Biggers 2026-04-30  397  		goto bad;
753450f716417f5 Eric Biggers 2026-04-30  398  	}
753450f716417f5 Eric Biggers 2026-04-30  399  
753450f716417f5 Eric Biggers 2026-04-30  400  	ti->num_flush_bios = 1;
753450f716417f5 Eric Biggers 2026-04-30  401  
753450f716417f5 Eric Biggers 2026-04-30  402  	err = 0;
753450f716417f5 Eric Biggers 2026-04-30  403  	goto out;
753450f716417f5 Eric Biggers 2026-04-30  404  
753450f716417f5 Eric Biggers 2026-04-30  405  bad:
753450f716417f5 Eric Biggers 2026-04-30  406  	inlinecrypt_dtr(ti);
753450f716417f5 Eric Biggers 2026-04-30  407  out:
753450f716417f5 Eric Biggers 2026-04-30  408  	memzero_explicit(raw_key, sizeof(raw_key));
753450f716417f5 Eric Biggers 2026-04-30  409  	return err;
753450f716417f5 Eric Biggers 2026-04-30  410  }
753450f716417f5 Eric Biggers 2026-04-30  411  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
