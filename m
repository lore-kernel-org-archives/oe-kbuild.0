Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A097311C31
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Aug 2025 20:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754943636; cv=none; b=JLyw5UQAwgOAyQQ1C9gg1UhxQPK/HjKjQybtmSi2E0aqC7Z6P8ZesRMYDW9nnFzHaljxxyF8JXLEjGveaR4Lq94LizhRKnN6nChH++8nhtPp0cBt29aPo2cQt8CN00d8waTDgSINDX+txHTNKTkZ+2HKLxanbr/EoYxGIHyF1/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754943636; c=relaxed/simple;
	bh=R8+ZJZPepeti9/yQD+F/jfsbtYDShVoVlnn49j8YUw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nCtwSNVt8IDE4igDLrKiMlwAfuPC6on/K51vZmOmYfJMXnZ1Csz1G76RV3YNVKN3kSfFDpvX4byY9xmhwkMXvWIL7RosEHwo9Oz5220C1qf5qFwAUi9AGEQJFFjODvFMTL3OAVphp6QuaSUwmLL1F4Cn5oke1M49YN3f1yRvscA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nWVp3l29; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nWVp3l29"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754943634; x=1786479634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R8+ZJZPepeti9/yQD+F/jfsbtYDShVoVlnn49j8YUw4=;
  b=nWVp3l29MUOrVoO1hgccTiSFDuH1kg5QngyKkRLiECDj2lnX+KebRSE3
   cG5+9dlc4a7fAGVDSgMuiXJ5R2vf64z4UiBobRVQ7fke7JAZwckbpJ+ia
   pu21iDC8GEH0Flc0fJCIrf0+AirFh9Q8/n1IaPLw8P/JJ5cX9asEMosjy
   sIF21hWkp8o9I1WuU64ssovONN4wVp3oYrw4Y8IOOtdN5TSIsSC9CxsUv
   Mmqwysk4EY+pvQxusmCKfyLNeeHb5f/jlWpZ7HDlLlaG58SyAZAHtcH2I
   nt6OAkPSO9shpccAnkw+LrH9Yfv3r4SiBlvaV/I+ItqHtKiroKtrXV7bi
   Q==;
X-CSE-ConnectionGUID: Yz8VfPvjTReAEJQu4dUsPQ==
X-CSE-MsgGUID: X8pAV28HT0unF/hEd6dG3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="74654754"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="74654754"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 13:20:34 -0700
X-CSE-ConnectionGUID: xHRZc5VYTSO3MEfHMzzJ1A==
X-CSE-MsgGUID: iHffWwl2T8S0408PdghWMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="171358871"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 11 Aug 2025 13:20:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulZ0I-0006CW-25;
	Mon, 11 Aug 2025 20:20:25 +0000
Date: Tue, 12 Aug 2025 04:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v4 6/6] Add SPAcc Kconfig and Makefile
Message-ID: <202508120136.hqvFe3av-lkp@intel.com>
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
In-Reply-To: <20250808122631.697421-7-pavitrakumarm@vayavyalabs.com>
References: <20250808122631.697421-7-pavitrakumarm@vayavyalabs.com>
TO: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
TO: linux-crypto@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: herbert@gondor.apana.org.au
TO: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: Ruud.Derwig@synopsys.com
CC: manjunath.hadli@vayavyalabs.com
CC: adityak@vayavyalabs.com
CC: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

Hi Pavitrakumar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9d9b193ed73a65ec47cf1fd39925b09da8216461]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavitrakumar-Managutte/dt-bindings-crypto-Document-support-for-SPAcc/20250808-203102
base:   9d9b193ed73a65ec47cf1fd39925b09da8216461
patch link:    https://lore.kernel.org/r/20250808122631.697421-7-pavitrakumarm%40vayavyalabs.com
patch subject: [PATCH v4 6/6] Add SPAcc Kconfig and Makefile
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-103-20250811 (https://download.01.org/0day-ci/archive/20250812/202508120136.hqvFe3av-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202508120136.hqvFe3av-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/crypto/dwc-spacc/spacc_interrupt.c:123:1-7: preceding lock on line 98

vim +123 drivers/crypto/dwc-spacc/spacc_interrupt.c

f514494768673b2 Pavitrakumar Managutte 2025-08-08   23  
f514494768673b2 Pavitrakumar Managutte 2025-08-08   24  static int spacc_pop_packets_ex(struct spacc_device *spacc, int *num_popped,
f514494768673b2 Pavitrakumar Managutte 2025-08-08   25  				unsigned long *lock_flag)
f514494768673b2 Pavitrakumar Managutte 2025-08-08   26  {
f514494768673b2 Pavitrakumar Managutte 2025-08-08   27  	int jobs;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   28  	int ret = -EINPROGRESS;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   29  	struct spacc_job *job = NULL;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   30  	u32 cmdstat, swid, spacc_errcode = SPACC_OK;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   31  	*num_popped = 0;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   32  
f514494768673b2 Pavitrakumar Managutte 2025-08-08   33  	while ((jobs = _spacc_get_stat_cnt(spacc))) {
f514494768673b2 Pavitrakumar Managutte 2025-08-08   34  		while (jobs-- > 0) {
f514494768673b2 Pavitrakumar Managutte 2025-08-08   35  			/* write the pop register to get the next job */
f514494768673b2 Pavitrakumar Managutte 2025-08-08   36  			writel(1, spacc->regmap + SPACC_REG_STAT_POP);
f514494768673b2 Pavitrakumar Managutte 2025-08-08   37  			cmdstat = readl(spacc->regmap + SPACC_REG_STATUS);
f514494768673b2 Pavitrakumar Managutte 2025-08-08   38  
f514494768673b2 Pavitrakumar Managutte 2025-08-08   39  			swid = SPACC_STATUS_SW_ID_GET(cmdstat);
f514494768673b2 Pavitrakumar Managutte 2025-08-08   40  
f514494768673b2 Pavitrakumar Managutte 2025-08-08   41  			if (spacc->job_lookup[swid] == SPACC_JOB_IDX_UNUSED) {
f514494768673b2 Pavitrakumar Managutte 2025-08-08   42  				ret = -EIO;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   43  				goto ERR;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   44  			}
f514494768673b2 Pavitrakumar Managutte 2025-08-08   45  
f514494768673b2 Pavitrakumar Managutte 2025-08-08   46  			/* find the associated job with popped swid */
f514494768673b2 Pavitrakumar Managutte 2025-08-08   47  			if (swid < 0 || swid >= SPACC_MAX_JOBS)
f514494768673b2 Pavitrakumar Managutte 2025-08-08   48  				job = NULL;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   49  			else
f514494768673b2 Pavitrakumar Managutte 2025-08-08   50  				job = &spacc->job[spacc->job_lookup[swid]];
f514494768673b2 Pavitrakumar Managutte 2025-08-08   51  
f514494768673b2 Pavitrakumar Managutte 2025-08-08   52  			if (!job) {
f514494768673b2 Pavitrakumar Managutte 2025-08-08   53  				ret = -EIO;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   54  				goto ERR;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   55  			}
f514494768673b2 Pavitrakumar Managutte 2025-08-08   56  
f514494768673b2 Pavitrakumar Managutte 2025-08-08   57  			/* mark job as done */
f514494768673b2 Pavitrakumar Managutte 2025-08-08   58  			if (spacc->autodetect) {
f514494768673b2 Pavitrakumar Managutte 2025-08-08   59  				job->job_done = 1;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   60  				wake_up_interruptible(&job->waitq);
f514494768673b2 Pavitrakumar Managutte 2025-08-08   61  			}
f514494768673b2 Pavitrakumar Managutte 2025-08-08   62  
f514494768673b2 Pavitrakumar Managutte 2025-08-08   63  			spacc->job_lookup[swid] = SPACC_JOB_IDX_UNUSED;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   64  			spacc_errcode = SPACC_GET_STATUS_RET_CODE(cmdstat);
f514494768673b2 Pavitrakumar Managutte 2025-08-08   65  
f514494768673b2 Pavitrakumar Managutte 2025-08-08   66  			switch (spacc_errcode) {
f514494768673b2 Pavitrakumar Managutte 2025-08-08   67  			case SPACC_ICVFAIL:
f514494768673b2 Pavitrakumar Managutte 2025-08-08   68  				ret = -EBADMSG;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   69  				break;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   70  			case SPACC_MEMERR:
f514494768673b2 Pavitrakumar Managutte 2025-08-08   71  				ret = -EINVAL;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   72  				break;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   73  			case SPACC_BLOCKERR:
f514494768673b2 Pavitrakumar Managutte 2025-08-08   74  				ret = -EINVAL;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   75  				break;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   76  			case SPACC_SECERR:
f514494768673b2 Pavitrakumar Managutte 2025-08-08   77  				ret = -EIO;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   78  				break;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   79  			case SPACC_OK:
f514494768673b2 Pavitrakumar Managutte 2025-08-08   80  				ret = 0;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   81  				break;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   82  			default:
f514494768673b2 Pavitrakumar Managutte 2025-08-08   83  				dev_err(spacc->dptr, "Invalid SPAcc Error");
f514494768673b2 Pavitrakumar Managutte 2025-08-08   84  			}
f514494768673b2 Pavitrakumar Managutte 2025-08-08   85  
f514494768673b2 Pavitrakumar Managutte 2025-08-08   86  			job->job_err = ret;
f514494768673b2 Pavitrakumar Managutte 2025-08-08   87  
f514494768673b2 Pavitrakumar Managutte 2025-08-08   88  			/*
f514494768673b2 Pavitrakumar Managutte 2025-08-08   89  			 * We're done touching the SPAcc hw, so release the
f514494768673b2 Pavitrakumar Managutte 2025-08-08   90  			 * lock across the job callback.  It must be reacquired
f514494768673b2 Pavitrakumar Managutte 2025-08-08   91  			 * before continuing to the next iteration.
f514494768673b2 Pavitrakumar Managutte 2025-08-08   92  			 */
f514494768673b2 Pavitrakumar Managutte 2025-08-08   93  
f514494768673b2 Pavitrakumar Managutte 2025-08-08   94  			if (job->cb) {
f514494768673b2 Pavitrakumar Managutte 2025-08-08   95  				spin_unlock_irqrestore(&spacc->lock,
f514494768673b2 Pavitrakumar Managutte 2025-08-08   96  						       *lock_flag);
f514494768673b2 Pavitrakumar Managutte 2025-08-08   97  				job->cb(spacc, job->cbdata);
f514494768673b2 Pavitrakumar Managutte 2025-08-08  @98  				spin_lock_irqsave(&spacc->lock, *lock_flag);
f514494768673b2 Pavitrakumar Managutte 2025-08-08   99  			} else {
f514494768673b2 Pavitrakumar Managutte 2025-08-08  100  				if (!spacc->autodetect) {
f514494768673b2 Pavitrakumar Managutte 2025-08-08  101  					job->job_done = 1;
f514494768673b2 Pavitrakumar Managutte 2025-08-08  102  					wake_up_interruptible(&job->waitq);
f514494768673b2 Pavitrakumar Managutte 2025-08-08  103  				}
f514494768673b2 Pavitrakumar Managutte 2025-08-08  104  			}
f514494768673b2 Pavitrakumar Managutte 2025-08-08  105  
f514494768673b2 Pavitrakumar Managutte 2025-08-08  106  			(*num_popped)++;
f514494768673b2 Pavitrakumar Managutte 2025-08-08  107  		}
f514494768673b2 Pavitrakumar Managutte 2025-08-08  108  	}
f514494768673b2 Pavitrakumar Managutte 2025-08-08  109  
f514494768673b2 Pavitrakumar Managutte 2025-08-08  110  	if (!*num_popped)
f514494768673b2 Pavitrakumar Managutte 2025-08-08  111  		dev_dbg(spacc->dptr, "Failed to pop a single job\n");
f514494768673b2 Pavitrakumar Managutte 2025-08-08  112  
f514494768673b2 Pavitrakumar Managutte 2025-08-08  113  ERR:
f514494768673b2 Pavitrakumar Managutte 2025-08-08  114  	spacc_process_jb(spacc);
f514494768673b2 Pavitrakumar Managutte 2025-08-08  115  
f514494768673b2 Pavitrakumar Managutte 2025-08-08  116  	/* reset the WD timer to the original value */
f514494768673b2 Pavitrakumar Managutte 2025-08-08  117  	if (spacc->op_mode == SPACC_OP_MODE_WD)
f514494768673b2 Pavitrakumar Managutte 2025-08-08  118  		spacc_set_wd_count(spacc, spacc->config.wd_timer);
f514494768673b2 Pavitrakumar Managutte 2025-08-08  119  
f514494768673b2 Pavitrakumar Managutte 2025-08-08  120  	if (*num_popped && spacc->spacc_notify_jobs)
f514494768673b2 Pavitrakumar Managutte 2025-08-08  121  		spacc->spacc_notify_jobs(spacc);
f514494768673b2 Pavitrakumar Managutte 2025-08-08  122  
f514494768673b2 Pavitrakumar Managutte 2025-08-08 @123  	return ret;
f514494768673b2 Pavitrakumar Managutte 2025-08-08  124  }
f514494768673b2 Pavitrakumar Managutte 2025-08-08  125  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
