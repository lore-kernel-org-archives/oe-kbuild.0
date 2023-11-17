Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D596D1110
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Nov 2023 01:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AsV3agRu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700183767; x=1731719767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ErIAf1413zMdoLdAn+Y8bn+2U6y5g2uPfu3OqH+Prs=;
  b=AsV3agRu623ztAdynkp6Ta91tP7N9lm1Z+++6ItRRtxm8PNdb7bJD85M
   GwUuAdAWaI2DsgoR7u+rN84fEBm4w53qEQjoNg/c1SIKA5hw2fJ++5PJe
   8dJLZBrXI8LrgXv48jWTDGSqAfYuDPyo7YJ9EYz/tY/C/atQ1kv8bPBPp
   u880VaLI6sCvgUaOTqIXa2OSiS/+R/55MKIxiNZNLJkHnBrv8jWRVd8xs
   h3st1CZ8W+ByzTQaGsmbGWMxm/ukfIULyTm1AcAz+azBHpT2LYIW6zAOP
   8/DejTiWP9Yc7pNl3PIDlny11+TPQcdWASpMWhfEBTwqBQBfNridg8UST
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="455511825"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="455511825"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:16:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="769089178"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="769089178"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 16 Nov 2023 17:16:04 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3nSk-0002En-27;
	Fri, 17 Nov 2023 01:16:02 +0000
Date: Fri, 17 Nov 2023 09:15:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gustavoars:testing/next20231116-Warray-bounds 4/4]
 security/security.c:810:9: warning: 'memcpy' offset 32 is out of the bounds
 [0, 0]
Message-ID: <202311170928.SdIOGhSh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "has Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
CC: LKML <linux-kernel@vger.kernel.org>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/next20231116-Warray-bounds
head:   e636d8836f48541eb6e09f4371dbb8869ca1fc1c
commit: e636d8836f48541eb6e09f4371dbb8869ca1fc1c [4/4] Makefile: Enable -Warray-bounds globally
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231117/202311170928.SdIOGhSh-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231117/202311170928.SdIOGhSh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311170928.SdIOGhSh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/security.c: In function 'lsm_fill_user_ctx':
>> security/security.c:810:9: warning: 'memcpy' offset 32 is out of the bounds [0, 0] [-Warray-bounds]
     810 |         memcpy(nctx->ctx, val, val_len);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/memcpy +810 security/security.c

1aea7808372eee Casey Schaufler 2021-04-22  772  
e1ca7129db2c3b Casey Schaufler 2023-09-12  773  /**
e1ca7129db2c3b Casey Schaufler 2023-09-12  774   * lsm_fill_user_ctx - Fill a user space lsm_ctx structure
d7cf3412a9f6c5 Paul Moore      2023-10-24  775   * @uctx: a userspace LSM context to be filled
d7cf3412a9f6c5 Paul Moore      2023-10-24  776   * @uctx_len: available uctx size (input), used uctx size (output)
d7cf3412a9f6c5 Paul Moore      2023-10-24  777   * @val: the new LSM context value
d7cf3412a9f6c5 Paul Moore      2023-10-24  778   * @val_len: the size of the new LSM context value
e1ca7129db2c3b Casey Schaufler 2023-09-12  779   * @id: LSM id
e1ca7129db2c3b Casey Schaufler 2023-09-12  780   * @flags: LSM defined flags
e1ca7129db2c3b Casey Schaufler 2023-09-12  781   *
e1ca7129db2c3b Casey Schaufler 2023-09-12  782   * Fill all of the fields in a userspace lsm_ctx structure.
e1ca7129db2c3b Casey Schaufler 2023-09-12  783   *
d7cf3412a9f6c5 Paul Moore      2023-10-24  784   * Returns 0 on success, -E2BIG if userspace buffer is not large enough,
d7cf3412a9f6c5 Paul Moore      2023-10-24  785   * -EFAULT on a copyout error, -ENOMEM if memory can't be allocated.
e1ca7129db2c3b Casey Schaufler 2023-09-12  786   */
d7cf3412a9f6c5 Paul Moore      2023-10-24  787  int lsm_fill_user_ctx(struct lsm_ctx __user *uctx, size_t *uctx_len,
d7cf3412a9f6c5 Paul Moore      2023-10-24  788  		      void *val, size_t val_len,
d7cf3412a9f6c5 Paul Moore      2023-10-24  789  		      u64 id, u64 flags)
e1ca7129db2c3b Casey Schaufler 2023-09-12  790  {
d7cf3412a9f6c5 Paul Moore      2023-10-24  791  	struct lsm_ctx *nctx = NULL;
d7cf3412a9f6c5 Paul Moore      2023-10-24  792  	size_t nctx_len;
e1ca7129db2c3b Casey Schaufler 2023-09-12  793  	int rc = 0;
e1ca7129db2c3b Casey Schaufler 2023-09-12  794  
41793202292fd2 Paul Moore      2023-11-01  795  	nctx_len = ALIGN(struct_size(nctx, ctx, val_len), sizeof(void *));
d7cf3412a9f6c5 Paul Moore      2023-10-24  796  	if (nctx_len > *uctx_len) {
d7cf3412a9f6c5 Paul Moore      2023-10-24  797  		rc = -E2BIG;
d7cf3412a9f6c5 Paul Moore      2023-10-24  798  		goto out;
d7cf3412a9f6c5 Paul Moore      2023-10-24  799  	}
e1ca7129db2c3b Casey Schaufler 2023-09-12  800  
d7cf3412a9f6c5 Paul Moore      2023-10-24  801  	nctx = kzalloc(nctx_len, GFP_KERNEL);
d7cf3412a9f6c5 Paul Moore      2023-10-24  802  	if (nctx == NULL) {
d7cf3412a9f6c5 Paul Moore      2023-10-24  803  		rc = -ENOMEM;
d7cf3412a9f6c5 Paul Moore      2023-10-24  804  		goto out;
d7cf3412a9f6c5 Paul Moore      2023-10-24  805  	}
d7cf3412a9f6c5 Paul Moore      2023-10-24  806  	nctx->id = id;
d7cf3412a9f6c5 Paul Moore      2023-10-24  807  	nctx->flags = flags;
d7cf3412a9f6c5 Paul Moore      2023-10-24  808  	nctx->len = nctx_len;
d7cf3412a9f6c5 Paul Moore      2023-10-24  809  	nctx->ctx_len = val_len;
d7cf3412a9f6c5 Paul Moore      2023-10-24 @810  	memcpy(nctx->ctx, val, val_len);
e1ca7129db2c3b Casey Schaufler 2023-09-12  811  
d7cf3412a9f6c5 Paul Moore      2023-10-24  812  	if (copy_to_user(uctx, nctx, nctx_len))
e1ca7129db2c3b Casey Schaufler 2023-09-12  813  		rc = -EFAULT;
e1ca7129db2c3b Casey Schaufler 2023-09-12  814  
d7cf3412a9f6c5 Paul Moore      2023-10-24  815  out:
d7cf3412a9f6c5 Paul Moore      2023-10-24  816  	kfree(nctx);
d7cf3412a9f6c5 Paul Moore      2023-10-24  817  	*uctx_len = nctx_len;
e1ca7129db2c3b Casey Schaufler 2023-09-12  818  	return rc;
e1ca7129db2c3b Casey Schaufler 2023-09-12  819  }
e1ca7129db2c3b Casey Schaufler 2023-09-12  820  

:::::: The code at line 810 was first introduced by commit
:::::: d7cf3412a9f6c547e5ee443fa7644e08898aa3e2 lsm: consolidate buffer size handling into lsm_fill_user_ctx()

:::::: TO: Paul Moore <paul@paul-moore.com>
:::::: CC: Paul Moore <paul@paul-moore.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
