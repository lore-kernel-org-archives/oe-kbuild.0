Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D0214D2B5
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Aug 2024 15:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723303208; cv=none; b=Lrh9IoIrkY1OrB+qqsMURuZdG052POfMb4AbngdIjlCRFjRu7ECQgR+uHnJuEjf/F5bw9DILRHdWsM6TxKG+6xaRQaktdLOKXaw/5WfpjHk5iWq8VKl5P+5uYoyP12HzFRYcPVmW73TfGPtJUGGLKePb5smEQof6ctvGVi+NBkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723303208; c=relaxed/simple;
	bh=sTFoCOr6Z0gBQHkgAAXOttYK3ZYbzPyubj3GT7Q8RbI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IPEr5fAOT9wQJElAf2nsYC9MD3WPgMI7ETeb9BgdguvoQOjUVZP5CIA7bFxB6XbKSSdsCMuVXdcbTKsnXVqg4VceISpz7f9AV3TrFvrMRrCfFuicc8+ge2rmQpNCA2C41yxOWJ++MzMmffF9X+v4eiXGDABTKbkIUVwZcOXKvfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lAVRcjEi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAVRcjEi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723303207; x=1754839207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sTFoCOr6Z0gBQHkgAAXOttYK3ZYbzPyubj3GT7Q8RbI=;
  b=lAVRcjEiNddXuvJ/eityFRjaXjBDCjyM38dq65iPbtSp2hAE/1mMnTKJ
   JVXjW904ZlHi5AdbExOy82CCYGec+KLfUm496VUoQK0mq1XcFj53cMVPl
   UOhiaV5+42zs76RjFVKTjgfPZQXVvuSpm+BAQXiTU/x3Cxalo062cfof1
   bWC3U8nsZtS9GO/pXGpdLcWot/2a65sL01210qakrPdoUlCa4jCz2I4rN
   jyWXguSOh4qG5Em4Y5i9f6Qah2Pe0JyhozJiTK9uTiXSa7f17MDeL5FmA
   9dla92EosW9tihloaLAWS2XhENlH9I971OTVnwxls9O2UOHjJ26ya0WfL
   A==;
X-CSE-ConnectionGUID: ekLET89wQHG4HXbkuroNqg==
X-CSE-MsgGUID: YFVj1DO6SPyyISjw9S9xnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="32856852"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="32856852"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 08:20:06 -0700
X-CSE-ConnectionGUID: lkP4NUk2T2Ssn1vfiOMnBg==
X-CSE-MsgGUID: hVqyw/9BRviq5GaakXArSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="95364188"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 10 Aug 2024 08:20:04 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scnsw-000A3D-1o;
	Sat, 10 Aug 2024 15:20:02 +0000
Date: Sat, 10 Aug 2024 23:19:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [herbert-cryptodev-2.6:master 16/24]
 drivers/crypto/dwc-spacc/spacc_interrupt.c:118:1-7: preceding lock on line
 97
Message-ID: <202408102305.aBrlHkBD-lkp@intel.com>
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
CC: linux-crypto@vger.kernel.org
TO: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Bhoomika K <bhoomikak@vayavyalabs.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
head:   001412493e74d89166d2441b622eeaea00511bdc
commit: fc61c658c94cb7405ca6946d8f2a2b71cef49845 [16/24] crypto: spacc - Enable Driver compilation in crypto Kconfig and Makefile
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: i386-randconfig-054-20240810 (https://download.01.org/0day-ci/archive/20240810/202408102305.aBrlHkBD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202408102305.aBrlHkBD-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/crypto/dwc-spacc/spacc_interrupt.c:118:1-7: preceding lock on line 97

vim +118 drivers/crypto/dwc-spacc/spacc_interrupt.c

c8981d9230d808 Pavitrakumar M 2024-07-29   25  
c8981d9230d808 Pavitrakumar M 2024-07-29   26  static int spacc_pop_packets_ex(struct spacc_device *spacc, int *num_popped,
c8981d9230d808 Pavitrakumar M 2024-07-29   27  				unsigned long *lock_flag)
c8981d9230d808 Pavitrakumar M 2024-07-29   28  {
c8981d9230d808 Pavitrakumar M 2024-07-29   29  	int jobs;
c8981d9230d808 Pavitrakumar M 2024-07-29   30  	int ret = -EINPROGRESS;
c8981d9230d808 Pavitrakumar M 2024-07-29   31  	struct spacc_job *job = NULL;
c8981d9230d808 Pavitrakumar M 2024-07-29   32  	u32 cmdstat, swid, spacc_errcode = SPACC_OK;
c8981d9230d808 Pavitrakumar M 2024-07-29   33  
c8981d9230d808 Pavitrakumar M 2024-07-29   34  	*num_popped = 0;
c8981d9230d808 Pavitrakumar M 2024-07-29   35  
c8981d9230d808 Pavitrakumar M 2024-07-29   36  	while ((jobs = _spacc_get_stat_cnt(spacc))) {
c8981d9230d808 Pavitrakumar M 2024-07-29   37  		while (jobs-- > 0) {
c8981d9230d808 Pavitrakumar M 2024-07-29   38  			/* write the pop register to get the next job */
c8981d9230d808 Pavitrakumar M 2024-07-29   39  			writel(1, spacc->regmap + SPACC_REG_STAT_POP);
c8981d9230d808 Pavitrakumar M 2024-07-29   40  			cmdstat = readl(spacc->regmap + SPACC_REG_STATUS);
c8981d9230d808 Pavitrakumar M 2024-07-29   41  
c8981d9230d808 Pavitrakumar M 2024-07-29   42  			swid = SPACC_STATUS_SW_ID_GET(cmdstat);
c8981d9230d808 Pavitrakumar M 2024-07-29   43  
c8981d9230d808 Pavitrakumar M 2024-07-29   44  			if (spacc->job_lookup[swid] == SPACC_JOB_IDX_UNUSED) {
c8981d9230d808 Pavitrakumar M 2024-07-29   45  				ret = -EIO;
c8981d9230d808 Pavitrakumar M 2024-07-29   46  				goto ERR;
c8981d9230d808 Pavitrakumar M 2024-07-29   47  			}
c8981d9230d808 Pavitrakumar M 2024-07-29   48  
c8981d9230d808 Pavitrakumar M 2024-07-29   49  			/* find the associated job with popped swid */
c8981d9230d808 Pavitrakumar M 2024-07-29   50  			if (swid < 0 || swid >= SPACC_MAX_JOBS)
c8981d9230d808 Pavitrakumar M 2024-07-29   51  				job = NULL;
c8981d9230d808 Pavitrakumar M 2024-07-29   52  			else
c8981d9230d808 Pavitrakumar M 2024-07-29   53  				job = &spacc->job[spacc->job_lookup[swid]];
c8981d9230d808 Pavitrakumar M 2024-07-29   54  
c8981d9230d808 Pavitrakumar M 2024-07-29   55  			if (!job) {
c8981d9230d808 Pavitrakumar M 2024-07-29   56  				ret = -EIO;
c8981d9230d808 Pavitrakumar M 2024-07-29   57  				goto ERR;
c8981d9230d808 Pavitrakumar M 2024-07-29   58  			}
c8981d9230d808 Pavitrakumar M 2024-07-29   59  
c8981d9230d808 Pavitrakumar M 2024-07-29   60  			/* mark job as done */
c8981d9230d808 Pavitrakumar M 2024-07-29   61  			job->job_done = 1;
c8981d9230d808 Pavitrakumar M 2024-07-29   62  			spacc->job_lookup[swid] = SPACC_JOB_IDX_UNUSED;
c8981d9230d808 Pavitrakumar M 2024-07-29   63  			spacc_errcode = SPACC_GET_STATUS_RET_CODE(cmdstat);
c8981d9230d808 Pavitrakumar M 2024-07-29   64  
c8981d9230d808 Pavitrakumar M 2024-07-29   65  			switch (spacc_errcode) {
c8981d9230d808 Pavitrakumar M 2024-07-29   66  			case SPACC_ICVFAIL:
c8981d9230d808 Pavitrakumar M 2024-07-29   67  				ret = -EBADMSG;
c8981d9230d808 Pavitrakumar M 2024-07-29   68  				break;
c8981d9230d808 Pavitrakumar M 2024-07-29   69  			case SPACC_MEMERR:
c8981d9230d808 Pavitrakumar M 2024-07-29   70  				ret = -EINVAL;
c8981d9230d808 Pavitrakumar M 2024-07-29   71  				break;
c8981d9230d808 Pavitrakumar M 2024-07-29   72  			case SPACC_BLOCKERR:
c8981d9230d808 Pavitrakumar M 2024-07-29   73  				ret = -EINVAL;
c8981d9230d808 Pavitrakumar M 2024-07-29   74  				break;
c8981d9230d808 Pavitrakumar M 2024-07-29   75  			case SPACC_SECERR:
c8981d9230d808 Pavitrakumar M 2024-07-29   76  				ret = -EIO;
c8981d9230d808 Pavitrakumar M 2024-07-29   77  				break;
c8981d9230d808 Pavitrakumar M 2024-07-29   78  			case SPACC_OK:
c8981d9230d808 Pavitrakumar M 2024-07-29   79  				ret = CRYPTO_OK;
c8981d9230d808 Pavitrakumar M 2024-07-29   80  				break;
c8981d9230d808 Pavitrakumar M 2024-07-29   81  			default:
c8981d9230d808 Pavitrakumar M 2024-07-29   82  				pr_debug("Invalid SPAcc Error");
c8981d9230d808 Pavitrakumar M 2024-07-29   83  			}
c8981d9230d808 Pavitrakumar M 2024-07-29   84  
c8981d9230d808 Pavitrakumar M 2024-07-29   85  			job->job_err = ret;
c8981d9230d808 Pavitrakumar M 2024-07-29   86  
c8981d9230d808 Pavitrakumar M 2024-07-29   87  			/*
c8981d9230d808 Pavitrakumar M 2024-07-29   88  			 * We're done touching the SPAcc hw, so release the
c8981d9230d808 Pavitrakumar M 2024-07-29   89  			 * lock across the job callback.  It must be reacquired
c8981d9230d808 Pavitrakumar M 2024-07-29   90  			 * before continuing to the next iteration.
c8981d9230d808 Pavitrakumar M 2024-07-29   91  			 */
c8981d9230d808 Pavitrakumar M 2024-07-29   92  
c8981d9230d808 Pavitrakumar M 2024-07-29   93  			if (job->cb) {
c8981d9230d808 Pavitrakumar M 2024-07-29   94  				spin_unlock_irqrestore(&spacc->lock,
c8981d9230d808 Pavitrakumar M 2024-07-29   95  							*lock_flag);
c8981d9230d808 Pavitrakumar M 2024-07-29   96  				job->cb(spacc, job->cbdata);
c8981d9230d808 Pavitrakumar M 2024-07-29  @97  				spin_lock_irqsave(&spacc->lock,
c8981d9230d808 Pavitrakumar M 2024-07-29   98  							*lock_flag);
c8981d9230d808 Pavitrakumar M 2024-07-29   99  			}
c8981d9230d808 Pavitrakumar M 2024-07-29  100  
c8981d9230d808 Pavitrakumar M 2024-07-29  101  			(*num_popped)++;
c8981d9230d808 Pavitrakumar M 2024-07-29  102  		}
c8981d9230d808 Pavitrakumar M 2024-07-29  103  	}
c8981d9230d808 Pavitrakumar M 2024-07-29  104  
c8981d9230d808 Pavitrakumar M 2024-07-29  105  	if (!*num_popped)
c8981d9230d808 Pavitrakumar M 2024-07-29  106  		pr_debug("   Failed to pop a single job\n");
c8981d9230d808 Pavitrakumar M 2024-07-29  107  
c8981d9230d808 Pavitrakumar M 2024-07-29  108  ERR:
c8981d9230d808 Pavitrakumar M 2024-07-29  109  	spacc_process_jb(spacc);
c8981d9230d808 Pavitrakumar M 2024-07-29  110  
c8981d9230d808 Pavitrakumar M 2024-07-29  111  	/* reset the WD timer to the original value*/
c8981d9230d808 Pavitrakumar M 2024-07-29  112  	if (spacc->op_mode == SPACC_OP_MODE_WD)
c8981d9230d808 Pavitrakumar M 2024-07-29  113  		spacc_set_wd_count(spacc, spacc->config.wd_timer);
c8981d9230d808 Pavitrakumar M 2024-07-29  114  
c8981d9230d808 Pavitrakumar M 2024-07-29  115  	if (*num_popped && spacc->spacc_notify_jobs)
c8981d9230d808 Pavitrakumar M 2024-07-29  116  		spacc->spacc_notify_jobs(spacc);
c8981d9230d808 Pavitrakumar M 2024-07-29  117  
c8981d9230d808 Pavitrakumar M 2024-07-29 @118  	return ret;
c8981d9230d808 Pavitrakumar M 2024-07-29  119  }
c8981d9230d808 Pavitrakumar M 2024-07-29  120  

:::::: The code at line 118 was first introduced by commit
:::::: c8981d9230d808e62c65349d0b255c7f4b9087d6 crypto: spacc - Add SPAcc Skcipher support

:::::: TO: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
