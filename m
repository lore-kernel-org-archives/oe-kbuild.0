Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C4D379C4A
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Aug 2026 19:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786389986; cv=none; b=XQg8/4nP/2ggC0LFrJh9DiLalKQD1CNg+962TLRC4S4YUp/cgPFMwRfP8wtUwElOf224VU5cp1IXIGFhF+bijPHw61TLhDS9x35bgsPPiGKnxn64V+7GPKRB722Y2QiAjxIcWfIhPCjUDJcoDt62gJFKiT2wC2DU7kkZmqjxeco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786389986; c=relaxed/simple;
	bh=/3XDKrk0oBSyuQ24960ZkTeEbUH1xtpRMRnAbO1qIfE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s1dWiMdStW9P2yRM4sm/NifqQQYTm8ayaKZJKkx3Q4hfSBZ1IvzdQBqkPT3tRJrzg0QKC7QhKPH39xc9FFGRm1l200qq0jVuUHRQmUwb5EBIO81EBPEDl0j+a9hAAXyheK+NBjFM0xbDEaNXWI60qMCaxV7DsR5037VRd6yFTzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=angug8mU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="angug8mU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786389984; x=1817925984;
  h=date:from:to:cc:subject:message-id;
  bh=/3XDKrk0oBSyuQ24960ZkTeEbUH1xtpRMRnAbO1qIfE=;
  b=angug8mUo+yX15x4iFW8rGRMkFa3fNcorDX4o9AILSEZBwhtde5ROW5V
   CASQPsTapjGkM58AT2OfKJYOh6jcAW9zR8cNwlgGu2dKSQlo++ht9RhNX
   2yEUAgGGYpWRtXYe05hHIDeiq0wgx5lTdhZO6TJFclZDmLZXmGitUQZS2
   Q+ZTjUQ4exZlC+OJ66SfY4B1uhha6yBR8os1o2pomL+jyqp3Rqn09hRGV
   0L56yU3NvZT2h2Rky34seQhbO6aH0l1l0xODt6cZSPhJgU6qLV3nXwmOA
   TtNhkCnrD0Qe56l9EXEt4exKE1mz3pPnn/Jmd/YOYyrfBgVFfApBNulzc
   g==;
X-CSE-ConnectionGUID: PJ9NOmPfQ4KnAFsIfVIQEg==
X-CSE-MsgGUID: OsjuqX0xTZOagu9UZjYPaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="112461247"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="112461247"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 12:26:23 -0700
X-CSE-ConnectionGUID: MLPww4kRQOSWWt/sR2YO4Q==
X-CSE-MsgGUID: 5pdGUCi3SvCJRERM/vUISg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="258854648"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Aug 2026 12:26:22 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtVdc-00000000Neu-1ZS3;
	Mon, 10 Aug 2026 19:26:20 +0000
Date: Tue, 11 Aug 2026 03:25:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/qce/common.c:293 qce_xts_swapiv() error:
 buffer overflow 'swap' 16 <= 31
Message-ID: <202608110200.wuj8MAmr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Thorsten Blum <thorsten.blum@linux.dev>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   06cf61899d6498b33e4b7c87d99d5bd471ccc375
commit: 3787fb7697a942baa25361bfc3390575e5659db8 crypto: qce - simplify qce_xts_swapiv()
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: nios2-randconfig-r072-20260810 (https://download.01.org/0day-ci/archive/20260811/202608110200.wuj8MAmr-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3787fb7697a9 ("crypto: qce - simplify qce_xts_swapiv()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608110200.wuj8MAmr-lkp@intel.com/

smatch warnings:
drivers/crypto/qce/common.c:293 qce_xts_swapiv() error: buffer overflow 'swap' 16 <= 31

vim +/swap +293 drivers/crypto/qce/common.c

59e056cda4beb5 Eneas U de Queiroz 2019-12-20  279  
db0018a8b615e2 Thara Gopinath     2021-04-29  280  #ifdef CONFIG_CRYPTO_DEV_QCE_SKCIPHER
59e056cda4beb5 Eneas U de Queiroz 2019-12-20  281  static void qce_xts_swapiv(__be32 *dst, const u8 *src, unsigned int ivsize)
59e056cda4beb5 Eneas U de Queiroz 2019-12-20  282  {
3787fb7697a942 Thorsten Blum      2026-03-30  283  	u8 swap[QCE_AES_IV_LENGTH] = {0};
3787fb7697a942 Thorsten Blum      2026-03-30  284  	unsigned int i, offset;
59e056cda4beb5 Eneas U de Queiroz 2019-12-20  285  
59e056cda4beb5 Eneas U de Queiroz 2019-12-20  286  	if (ivsize > QCE_AES_IV_LENGTH)
59e056cda4beb5 Eneas U de Queiroz 2019-12-20  287  		return;
59e056cda4beb5 Eneas U de Queiroz 2019-12-20  288  
3787fb7697a942 Thorsten Blum      2026-03-30  289  	offset = QCE_AES_IV_LENGTH - ivsize;
59e056cda4beb5 Eneas U de Queiroz 2019-12-20  290  
3787fb7697a942 Thorsten Blum      2026-03-30  291  	/* Reverse and right-align IV bytes. */
3787fb7697a942 Thorsten Blum      2026-03-30  292  	for (i = 0; i < ivsize; i++)
3787fb7697a942 Thorsten Blum      2026-03-30 @293  		swap[offset + i] = src[ivsize - 1 - i];
59e056cda4beb5 Eneas U de Queiroz 2019-12-20  294  
59e056cda4beb5 Eneas U de Queiroz 2019-12-20  295  	qce_cpu_to_be32p_array(dst, swap, QCE_AES_IV_LENGTH);
59e056cda4beb5 Eneas U de Queiroz 2019-12-20  296  }
59e056cda4beb5 Eneas U de Queiroz 2019-12-20  297  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
