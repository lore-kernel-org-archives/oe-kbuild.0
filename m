Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCB62874FA
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Apr 2026 17:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776880328; cv=none; b=TNjUW5/VhePaWwmATDsQ1SGX09wuzWuuL3TEtYwCpC/QjR7wvP/jLEPdFnKopC4Cwa1mFwJDx9RCrtm80mQzNu540RDQbgTK0AWMQgGX1xaPjjP1xPG+n6Xs1lzQNSf+vcKCn9QbSv8DohTy0CJN0DMrpE7lFxn5HQH37ayCuEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776880328; c=relaxed/simple;
	bh=VCcqe8IMK/zDNPdh26jCGjir4L8k+RrC/XQVkYKRabw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XabD5xKlWHofwIiQ2ZJXshJuy2KLo9jhC40UP0y/y0auIng/VlNJyZrynAQHFFleFrOlScQd9UzLRknogn1fYyr5wWn42WMvxJjKUqEABX+k+vWbMZICpgUit8Bed80CDvVCqeeKPzn12jl+pmSQA5IRLl5Hes6Ry2KZlcEt9G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AlirGq/w; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AlirGq/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776880326; x=1808416326;
  h=date:from:to:cc:subject:message-id;
  bh=VCcqe8IMK/zDNPdh26jCGjir4L8k+RrC/XQVkYKRabw=;
  b=AlirGq/wiffFKeBIfnKoJFXdThSp//W801mvvJnOSykBxJJO4Ka8KvhI
   biX1Ll+5SeeQe57xkpcoBfc+u+F/o25s36MhMX3fjDsYFR7u4VWEMUCck
   9FvH50xC873O7+0XsdrmpwjetcCoVwf6AY6pVePxHyKro24qYhk+CL2PV
   WLRZ3zl68EjufRXsFH3Rm1ot4epyTf4NwjOrvex9vIVNbPO94E46cvZIs
   Yf+oWalRhTMHsfE5H1lkJxd7jxVJx0m0xDtwdOq/aRf4XPufCPubReWJD
   bd9/4MfvGiCVI6C3L0+I9+EYg6fV/nqlLM6OA8CbkXTDOeLFpe13mahwr
   g==;
X-CSE-ConnectionGUID: 7aq4flAbTte9HAji3x2fCw==
X-CSE-MsgGUID: 0oCqLeMKTtCD3sv2kFUxlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="81704804"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="81704804"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 10:52:05 -0700
X-CSE-ConnectionGUID: SywNJtAHTNiwYoWAzlG7aA==
X-CSE-MsgGUID: 4iru29GzSICETTUCqSiLHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="232279989"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Apr 2026 10:52:04 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFbk1-000000000sn-1xuP;
	Wed, 22 Apr 2026 17:52:01 +0000
Date: Thu, 23 Apr 2026 01:51:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/qce/common.c:293 qce_xts_swapiv() error:
 buffer overflow 'swap' 16 <= 31
Message-ID: <202604230104.wmPWNBf3-lkp@intel.com>
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
head:   6596a02b207886e9e00bb0161c7fd59fea53c081
commit: 3787fb7697a942baa25361bfc3390575e5659db8 crypto: qce - simplify qce_xts_swapiv()
date:   10 days ago
:::::: branch date: 17 hours ago
:::::: commit date: 10 days ago
config: parisc-randconfig-r073-20260422 (https://download.01.org/0day-ci/archive/20260423/202604230104.wmPWNBf3-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3787fb7697a9 ("crypto: qce - simplify qce_xts_swapiv()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604230104.wmPWNBf3-lkp@intel.com/

smatch warnings:
drivers/crypto/qce/common.c:293 qce_xts_swapiv() error: buffer overflow 'swap' 16 <= 31

vim +/swap +293 drivers/crypto/qce/common.c

59e056cda4beb54 Eneas U de Queiroz 2019-12-20  279  
db0018a8b615e25 Thara Gopinath     2021-04-29  280  #ifdef CONFIG_CRYPTO_DEV_QCE_SKCIPHER
59e056cda4beb54 Eneas U de Queiroz 2019-12-20  281  static void qce_xts_swapiv(__be32 *dst, const u8 *src, unsigned int ivsize)
59e056cda4beb54 Eneas U de Queiroz 2019-12-20  282  {
3787fb7697a942b Thorsten Blum      2026-03-30  283  	u8 swap[QCE_AES_IV_LENGTH] = {0};
3787fb7697a942b Thorsten Blum      2026-03-30  284  	unsigned int i, offset;
59e056cda4beb54 Eneas U de Queiroz 2019-12-20  285  
59e056cda4beb54 Eneas U de Queiroz 2019-12-20  286  	if (ivsize > QCE_AES_IV_LENGTH)
59e056cda4beb54 Eneas U de Queiroz 2019-12-20  287  		return;
59e056cda4beb54 Eneas U de Queiroz 2019-12-20  288  
3787fb7697a942b Thorsten Blum      2026-03-30  289  	offset = QCE_AES_IV_LENGTH - ivsize;
59e056cda4beb54 Eneas U de Queiroz 2019-12-20  290  
3787fb7697a942b Thorsten Blum      2026-03-30  291  	/* Reverse and right-align IV bytes. */
3787fb7697a942b Thorsten Blum      2026-03-30  292  	for (i = 0; i < ivsize; i++)
3787fb7697a942b Thorsten Blum      2026-03-30 @293  		swap[offset + i] = src[ivsize - 1 - i];
59e056cda4beb54 Eneas U de Queiroz 2019-12-20  294  
59e056cda4beb54 Eneas U de Queiroz 2019-12-20  295  	qce_cpu_to_be32p_array(dst, swap, QCE_AES_IV_LENGTH);
59e056cda4beb54 Eneas U de Queiroz 2019-12-20  296  }
59e056cda4beb54 Eneas U de Queiroz 2019-12-20  297  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
