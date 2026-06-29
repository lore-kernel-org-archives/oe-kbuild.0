Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDBE308F39
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Jun 2026 12:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736757; cv=none; b=ocpmKLh4RDzjS9jPMA7lUvsUhuSvKWrt0q5ZZFKl1FACs00yj9IY0PGOY/osPw7x3fkJLWZeSghN+bY+1c+Mgpl7yx/Hm37ZXfsULKbRwZ6rDWPXKfYC4uBkp80zRNzRXl+KfmwsASEdlSnX6ZHIQuVw3fnnmXtqcMQWLFc3JrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736757; c=relaxed/simple;
	bh=WwFZ+X4WJfwlwFpXY6X1Jgj39icl2ie0vrhecfCd1OA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W8wsG4B4tfYmkY1jlh646aIlw62wTozaNlssykJNiOEAr/tkwnvNfxjr1CMZo5urjadnfIGYU1TBwXSfLoe6G6rnCFv0OdQbg76ARCSeKLrqZZoa0dQnTFzM4i22LfjDdICUOznD9EfSKnjFpEg9qZ0PelbtKLnM46C5riVpzgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M+QUOFaw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+QUOFaw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782736755; x=1814272755;
  h=date:from:to:cc:subject:message-id;
  bh=WwFZ+X4WJfwlwFpXY6X1Jgj39icl2ie0vrhecfCd1OA=;
  b=M+QUOFawmi06gd9C73RCbSSeQH7xrNy3gYwPH+CoqOggCruO5dSFZ8BP
   6sDFEb8kVNf/vs5Qa90ysHCHUYD6rz2KS65+/vpi7HRmlPUo8cUlWz8Tj
   J9noh77iXtXhph8UM+t8O03+Ueh8LdtePduopsOZ0QXMjkSszTNGbSyRQ
   6T9PvgBO6eqg8FDBAIPKs2QxliIJpPWGvYlHse0mxs2OjwA6cF6eq8nY/
   xC1r/vpBHQCQVZv7jRe1N7R5G/DBMxt3n0sF6yHxQud7+TIVwTW5os3XO
   3yC5xpo2x7saIZdSN8X7fG3Io5Ca98vz9uBBtStOX6tFqztYBU5ItF81X
   Q==;
X-CSE-ConnectionGUID: kWhhU96CQPGTAmVmiuSFyw==
X-CSE-MsgGUID: D4YznDfeSdiEJYpYgqqCbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83561675"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="83561675"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 05:39:15 -0700
X-CSE-ConnectionGUID: QzZPD6lQRDSPiQOELH90OA==
X-CSE-MsgGUID: o5A/qv+wQSmZzbXMjKY5Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="251553468"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 29 Jun 2026 05:39:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weBGW-000000007OT-0BGW;
	Mon, 29 Jun 2026 12:39:08 +0000
Date: Mon, 29 Jun 2026 20:38:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ebiggers:wip-fscrypt 19/21] fs/f2fs/data.c:319
 f2fs_read_end_io() warn: bitwise AND condition is false here
Message-ID: <202606292015.dnvCZRdA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Eric Biggers <ebiggers@kernel.org>
CC: Christoph Hellwig <hch@lst.de>

Hi Eric,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-fscrypt
head:   c3f49d50cb21c9bd84b8edf3696683d18bc6b6e2
commit: b44cdc6b5de2dfd1b6bc6249caf72d781027c93e [19/21] fscrypt: Remove unused functions and workqueue
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: powerpc-randconfig-r072-20260629 (https://download.01.org/0day-ci/archive/20260629/202606292015.dnvCZRdA-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606292015.dnvCZRdA-lkp@intel.com/

New smatch warnings:
fs/f2fs/data.c:319 f2fs_read_end_io() warn: bitwise AND condition is false here

Old smatch warnings:
fs/f2fs/data.c:243 f2fs_verify_and_finish_bio() warn: bitwise AND condition is false here
fs/f2fs/data.c:296 f2fs_post_read_work() warn: bitwise AND condition is false here

vim +319 fs/f2fs/data.c

6dbb17961f46b2 Eric Biggers            2018-04-18  301  
6dbb17961f46b2 Eric Biggers            2018-04-18  302  static void f2fs_read_end_io(struct bio *bio)
6dbb17961f46b2 Eric Biggers            2018-04-18  303  {
0f54eec0cb8988 Matthew Wilcox (Oracle  2025-07-08  304) 	struct f2fs_sb_info *sbi = F2FS_F_SB(bio_first_folio_all(bio));
a4b6817625e71d Daeho Jeong             2021-08-20  305  	struct bio_post_read_ctx *ctx;
08a7efc5b02a06 Jan Prusakowski         2025-07-24  306  	bool intask = in_task() && !irqs_disabled();
a4b6817625e71d Daeho Jeong             2021-08-20  307  
d9bac032ac0de8 Yangtao Li              2023-02-01  308  	iostat_update_and_unbind_ctx(bio);
a4b6817625e71d Daeho Jeong             2021-08-20  309  	ctx = bio->bi_private;
c45d6002ff7a32 Chao Yu                 2019-11-01  310  
c40e15a9a59f79 Yangtao Li              2022-12-21  311  	if (time_to_inject(sbi, FAULT_READ_IO))
4e4cbee93d5613 Christoph Hellwig       2017-06-03  312  		bio->bi_status = BLK_STS_IOERR;
8b038c70dfe4fd Chao Yu                 2016-09-18  313  
68e7f31eecf1d6 Chao Yu                 2025-05-23  314  	if (bio->bi_status != BLK_STS_OK) {
bff139b49d9f70 Daeho Jeong             2022-08-02  315  		f2fs_finish_read_bio(bio, intask);
4375a33664de17 Jaegeuk Kim             2015-04-23  316  		return;
4375a33664de17 Jaegeuk Kim             2015-04-23  317  	}
4375a33664de17 Jaegeuk Kim             2015-04-23  318  
df5305d38262e2 Eric Biggers            2026-06-28 @319  	if (ctx && (ctx->enabled_steps & STEP_DECOMPRESS)) {
df5305d38262e2 Eric Biggers            2026-06-28  320  		if (!f2fs_low_mem_mode(sbi)) {
df5305d38262e2 Eric Biggers            2026-06-28  321  			/* Decompress inline. */
bff139b49d9f70 Daeho Jeong             2022-08-02  322  			f2fs_handle_step_decompress(ctx, intask);
df5305d38262e2 Eric Biggers            2026-06-28  323  		} else {
7f59b277f79e8a Eric Biggers            2021-01-04  324  			INIT_WORK(&ctx->work, f2fs_post_read_work);
7ba36a9ea81c01 Bart Van Assche         2026-06-10  325  			queue_work(ctx->sbi->wq, &ctx->work);
bff139b49d9f70 Daeho Jeong             2022-08-02  326  			return;
7f59b277f79e8a Eric Biggers            2021-01-04  327  		}
f1e8866016b53b Jaegeuk Kim             2015-04-09  328  	}
f1e8866016b53b Jaegeuk Kim             2015-04-09  329  
bff139b49d9f70 Daeho Jeong             2022-08-02  330  	f2fs_verify_and_finish_bio(bio, intask);
f1e8866016b53b Jaegeuk Kim             2015-04-09  331  }
f1e8866016b53b Jaegeuk Kim             2015-04-09  332  

:::::: The code at line 319 was first introduced by commit
:::::: df5305d38262e2b0184687897a4bd98a1bef3c5e f2fs: Remove fs-layer file contents en/decryption code

:::::: TO: Eric Biggers <ebiggers@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
