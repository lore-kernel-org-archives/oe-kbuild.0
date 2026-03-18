Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB3521018A
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 23:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773876090; cv=none; b=EVgcFV383nOztNOxibUAl+aaxqdh9LwFRtAm1zqsru5y93gALiqH1p+JOD7F6Izwg8UxUNxVPiugKO0rrmvBfyGglVPUxO8xpfhmMmbMwP+tAJRW4JU+rH9LL79HwlBPsw317m20pwVlI2Wgtr49ICeeD47jj6cHrBZ+dnnUNKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773876090; c=relaxed/simple;
	bh=0fAn6BW2pzTk5N8iD5qbypLf1MpOgKrGb8XXWR6X/8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UdD0dzXz6izbPoXRdIKMdp1m8Jmr9agIS1hRatZV1jIh9aBasiFPJo6RLhV19AW8iq1rlhPjAGJFa4BSFvi1cF5XYqrge5zzukbCodo3VAxYe7kuoGsM4zXYviNW4GitoOnO/1Ynh2UqQJDaXRLPGzIoxKJgNZgb1BI7qUZgKEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWNYLvgC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWNYLvgC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773876089; x=1805412089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0fAn6BW2pzTk5N8iD5qbypLf1MpOgKrGb8XXWR6X/8k=;
  b=SWNYLvgCmjorL8yNzOkKh1SfCerY2Qx/fLrOE3q4gE++2cCkF9Gcuvji
   h7yF9L7D3RZE9aHn74uZwtQCQ/AbutGTmW5c0yjTfd/x14ii1xkYMsbkq
   fdvWGBe1pJWXlyXR8vd8wZuIC9FGLn/CELMXe0xyh/aJWV13Jsp2h+6o+
   +r2G/bYMHA2nBeE0gvOF6j0vyAjlyqt+nG79yMJmIJSh1TXcd/zwEK+qt
   MMDAh+znjRJOXOoeUv7LO+LCrKAhUg3pNRHtxZHvDji0eXT0nvjDyRqea
   optPe9xf6USPNSZ1WT6w2jjA5gbQwXlRALpE1sW+JxrOJlBxVuiChKUWA
   Q==;
X-CSE-ConnectionGUID: dva4H1w4SEuf4Xt70GhI+Q==
X-CSE-MsgGUID: P2I2ZJ01SO+1RWt5qABRow==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="100405168"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="100405168"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 16:21:28 -0700
X-CSE-ConnectionGUID: 0NBUHwYsTiOmLZojy2yNUg==
X-CSE-MsgGUID: iGQoe/JkTsyNrEbSjVH+HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="227484227"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Mar 2026 16:21:26 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w30Bg-0000000004H-3tKO;
	Wed, 18 Mar 2026 23:20:42 +0000
Date: Thu, 19 Mar 2026 07:20:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v11 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Message-ID: <202603190747.Cww0w5ZV-lkp@intel.com>
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
In-Reply-To: <20260318071808.817074-5-pavitrakumarm@vayavyalabs.com>
References: <20260318071808.817074-5-pavitrakumarm@vayavyalabs.com>
TO: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
TO: linux-crypto@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: herbert@gondor.apana.org.au
TO: robh@kernel.org
CC: conor+dt@kernel.org
CC: Ruud.Derwig@synopsys.com
CC: manjunath.hadli@vayavyalabs.com
CC: adityak@vayavyalabs.com
CC: navami.telsang@vayavyalabs.com
CC: bhoomikak@vayavyalabs.com
CC: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

Hi Pavitrakumar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c708d3fad4217f23421b8496e231b0c5cee617a0]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavitrakumar-Managutte/dt-bindings-crypto-Document-support-for-SPAcc/20260318-181359
base:   c708d3fad4217f23421b8496e231b0c5cee617a0
patch link:    https://lore.kernel.org/r/20260318071808.817074-5-pavitrakumarm%40vayavyalabs.com
patch subject: [PATCH v11 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: openrisc-randconfig-r062-20260319 (https://download.01.org/0day-ci/archive/20260319/202603190747.Cww0w5ZV-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603190747.Cww0w5ZV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/crypto/dwc-spacc/spacc_interrupt.c:121:1-7: preceding lock on line 96

vim +121 drivers/crypto/dwc-spacc/spacc_interrupt.c

d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   21  
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   22  static int spacc_pop_packets_ex(struct spacc_device *spacc, int *num_popped,
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   23  				unsigned long *lock_flag)
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   24  {
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   25  	int jobs;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   26  	int ret = -EINPROGRESS;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   27  	struct spacc_job *job = NULL;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   28  	u32 cmdstat, swid, spacc_errcode = SPACC_OK;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   29  	*num_popped = 0;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   30  
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   31  	while ((jobs = _spacc_get_stat_cnt(spacc))) {
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   32  		while (jobs-- > 0) {
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   33  			/* write the pop register to get the next job */
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   34  			writel(1, spacc->regmap + SPACC_REG_STAT_POP);
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   35  			cmdstat = readl(spacc->regmap + SPACC_REG_STATUS);
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   36  
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   37  			swid = SPACC_STATUS_SW_ID_GET(cmdstat);
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   38  
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   39  			if (spacc->job_lookup[swid] == SPACC_JOB_IDX_UNUSED) {
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   40  				ret = -EIO;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   41  				goto ERR;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   42  			}
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   43  
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   44  			/* find the associated job with popped swid */
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   45  			if (swid < 0 || swid >= SPACC_MAX_JOBS)
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   46  				job = NULL;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   47  			else
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   48  				job = &spacc->job[spacc->job_lookup[swid]];
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   49  
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   50  			if (!job) {
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   51  				ret = -EIO;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   52  				goto ERR;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   53  			}
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   54  
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   55  			/* mark job as done */
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   56  			if (spacc->autodetect) {
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   57  				job->job_done = 1;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   58  				wake_up_interruptible(&job->waitq);
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   59  			}
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   60  
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   61  			spacc->job_lookup[swid] = SPACC_JOB_IDX_UNUSED;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   62  			spacc_errcode = SPACC_GET_STATUS_RET_CODE(cmdstat);
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   63  
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   64  			switch (spacc_errcode) {
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   65  			case SPACC_ICVFAIL:
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   66  				ret = -EBADMSG;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   67  				break;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   68  			case SPACC_MEMERR:
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   69  				ret = -EINVAL;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   70  				break;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   71  			case SPACC_BLOCKERR:
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   72  				ret = -EINVAL;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   73  				break;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   74  			case SPACC_SECERR:
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   75  				ret = -EIO;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   76  				break;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   77  			case SPACC_OK:
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   78  				ret = 0;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   79  				break;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   80  			default:
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   81  				dev_err(spacc->dptr, "Invalid SPAcc Error");
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   82  			}
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   83  
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   84  			job->job_err = ret;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   85  
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   86  			/*
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   87  			 * We're done touching the SPAcc hw, so release the
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   88  			 * lock across the job callback.  It must be reacquired
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   89  			 * before continuing to the next iteration.
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   90  			 */
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   91  
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   92  			if (job->cb) {
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   93  				spin_unlock_irqrestore(&spacc->lock,
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   94  						       *lock_flag);
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   95  				job->cb(spacc, job->cbdata);
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  @96  				spin_lock_irqsave(&spacc->lock, *lock_flag);
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   97  			} else {
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   98  				if (!spacc->autodetect) {
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18   99  					job->job_done = 1;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  100  					wake_up_interruptible(&job->waitq);
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  101  				}
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  102  			}
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  103  
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  104  			(*num_popped)++;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  105  		}
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  106  	}
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  107  
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  108  	if (!*num_popped)
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  109  		dev_dbg(spacc->dptr, "Failed to pop a single job\n");
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  110  
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  111  ERR:
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  112  	spacc_process_jb(spacc);
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  113  
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  114  	/* reset the WD timer to the original value */
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  115  	if (spacc->op_mode == SPACC_OP_MODE_WD)
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  116  		spacc_set_wd_count(spacc, spacc->config.wd_timer);
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  117  
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  118  	if (*num_popped && spacc->spacc_notify_jobs)
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  119  		spacc->spacc_notify_jobs(spacc);
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  120  
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18 @121  	return ret;
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  122  }
d27bf0e4fcbca6 Pavitrakumar Managutte 2026-03-18  123  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
