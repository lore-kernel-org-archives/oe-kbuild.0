Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE98A19C568
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Oct 2024 08:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727772969; cv=none; b=o72kkw0G7oOK3+/6b2rHOfipT8EQjz0OcCvkEw0SeOMC5zWgBU6xGSRFuI75Dbwtt5eyWYYFVmFslXTNC+PBF3I0q/aRQmKb+NU5F6gu3KRfbbmhtloJAJb3tHvBTujYNPSS5hlJ/KhJDT87UIIBcx6F2kX2RtCmGxxuOJHJHzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727772969; c=relaxed/simple;
	bh=UbqRkLibpaNPd2xjvyliZADQkvzO8blUOrh84vE5fR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AzPS0MSIz3TzGWzuzj2yBNcAr9juoWNig+V+4wK7syEZBiMwlF8KXjfppgsEmnymsrOsColbGCBPjzFBhSVHpMTsOF6TaBcSTvC6oN2BUCNUrowUD37L6AhnC1dO8aUegRaXJhWHZ6SvwVS0LFEbts1s4f0WV4CYl7K3FffhSJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9Vk9oD5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9Vk9oD5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727772968; x=1759308968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UbqRkLibpaNPd2xjvyliZADQkvzO8blUOrh84vE5fR8=;
  b=H9Vk9oD5soXRUvJiIMYrfJB2duqFlKaqt5e5VJL1g/W+qk/COHB0g5G1
   EptiU6doNa1yZBGEED2SA0XYhXyEmNJUXh5xcrDBKvL31Sm/6pBvz+rHL
   J1gyezphFr1vKATdmvuCpf0L3m/IR8Di6/luUf+QTMCJ9prObl/Gjiah0
   JaRrceeXDadWIg0lAvf74NBI3iBFtVSSydGi+jJJ3p0BVIkyYe5k+HseA
   4gS2VMg2VMb5uqfJC24brNw+USV/gSrvmVcXKKn3lLiTBPoduRyB6t06M
   pxEdMp2sN8kJ1kokP9KFBiogaxqjlozgbQ09ZaBcEtFIVGtVqpmVLVVOM
   A==;
X-CSE-ConnectionGUID: syqiwJ3GQByVdjRI/9nXng==
X-CSE-MsgGUID: EQn6pobbRaOSv1CUHuYlMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="14514630"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="14514630"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 01:56:04 -0700
X-CSE-ConnectionGUID: DwT/5juGSGStE/aLDYyFug==
X-CSE-MsgGUID: SwY5qn4vQHi0j4cdM4X+IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="78329994"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Oct 2024 01:56:03 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svYfo-000QT5-27;
	Tue, 01 Oct 2024 08:56:00 +0000
Date: Tue, 1 Oct 2024 16:55:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v9 6/7] Add SPAcc compilation in crypto
Message-ID: <202410011629.vRb9g32w-lkp@intel.com>
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
In-Reply-To: <20240930093054.215809-7-pavitrakumarm@vayavyalabs.com>
References: <20240930093054.215809-7-pavitrakumarm@vayavyalabs.com>
TO: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>
TO: devicetree@vger.kernel.org
TO: herbert@gondor.apana.org.au
TO: linux-crypto@vger.kernel.org
TO: robh@kernel.org
CC: Ruud.Derwig@synopsys.com
CC: manjunath.hadli@vayavyalabs.com
CC: bhoomikak@vayavyalabs.com
CC: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>
CC: Shweta Raikar <shwetar@vayavyalabs.com>

Hi Pavitrakumar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ce212d2afca47acd366a2e74c76fe82c31f785ab]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavitrakumar-M/Add-SPAcc-Skcipher-support/20240930-173252
base:   ce212d2afca47acd366a2e74c76fe82c31f785ab
patch link:    https://lore.kernel.org/r/20240930093054.215809-7-pavitrakumarm%40vayavyalabs.com
patch subject: [PATCH v9 6/7] Add SPAcc compilation in crypto
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: microblaze-randconfig-r064-20241001 (https://download.01.org/0day-ci/archive/20241001/202410011629.vRb9g32w-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410011629.vRb9g32w-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/crypto/dwc-spacc/spacc_interrupt.c:119:1-7: preceding lock on line 98
--
>> drivers/crypto/dwc-spacc/spacc_device.c:129:2-9: line 129 is redundant because platform_get_irq() already prints an error
--
>> drivers/crypto/dwc-spacc/spacc_device.c:288:3-8: No need to set .owner here. The core will do it.

vim +119 drivers/crypto/dwc-spacc/spacc_interrupt.c

ef604c21620651 Pavitrakumar M 2024-09-30   26  
ef604c21620651 Pavitrakumar M 2024-09-30   27  static int spacc_pop_packets_ex(struct spacc_device *spacc, int *num_popped,
ef604c21620651 Pavitrakumar M 2024-09-30   28  				unsigned long *lock_flag)
ef604c21620651 Pavitrakumar M 2024-09-30   29  {
ef604c21620651 Pavitrakumar M 2024-09-30   30  	int jobs;
ef604c21620651 Pavitrakumar M 2024-09-30   31  	int ret = -EINPROGRESS;
ef604c21620651 Pavitrakumar M 2024-09-30   32  	struct spacc_job *job = NULL;
ef604c21620651 Pavitrakumar M 2024-09-30   33  	u32 cmdstat, swid, spacc_errcode = SPACC_OK;
ef604c21620651 Pavitrakumar M 2024-09-30   34  
ef604c21620651 Pavitrakumar M 2024-09-30   35  	*num_popped = 0;
ef604c21620651 Pavitrakumar M 2024-09-30   36  
ef604c21620651 Pavitrakumar M 2024-09-30   37  	while ((jobs = _spacc_get_stat_cnt(spacc))) {
ef604c21620651 Pavitrakumar M 2024-09-30   38  		while (jobs-- > 0) {
ef604c21620651 Pavitrakumar M 2024-09-30   39  			/* write the pop register to get the next job */
ef604c21620651 Pavitrakumar M 2024-09-30   40  			writel(1, spacc->regmap + SPACC_REG_STAT_POP);
ef604c21620651 Pavitrakumar M 2024-09-30   41  			cmdstat = readl(spacc->regmap + SPACC_REG_STATUS);
ef604c21620651 Pavitrakumar M 2024-09-30   42  
ef604c21620651 Pavitrakumar M 2024-09-30   43  			swid = SPACC_STATUS_SW_ID_GET(cmdstat);
ef604c21620651 Pavitrakumar M 2024-09-30   44  
ef604c21620651 Pavitrakumar M 2024-09-30   45  			if (spacc->job_lookup[swid] == SPACC_JOB_IDX_UNUSED) {
ef604c21620651 Pavitrakumar M 2024-09-30   46  				ret = -EIO;
ef604c21620651 Pavitrakumar M 2024-09-30   47  				goto ERR;
ef604c21620651 Pavitrakumar M 2024-09-30   48  			}
ef604c21620651 Pavitrakumar M 2024-09-30   49  
ef604c21620651 Pavitrakumar M 2024-09-30   50  			/* find the associated job with popped swid */
ef604c21620651 Pavitrakumar M 2024-09-30   51  			if (swid < 0 || swid >= SPACC_MAX_JOBS)
ef604c21620651 Pavitrakumar M 2024-09-30   52  				job = NULL;
ef604c21620651 Pavitrakumar M 2024-09-30   53  			else
ef604c21620651 Pavitrakumar M 2024-09-30   54  				job = &spacc->job[spacc->job_lookup[swid]];
ef604c21620651 Pavitrakumar M 2024-09-30   55  
ef604c21620651 Pavitrakumar M 2024-09-30   56  			if (!job) {
ef604c21620651 Pavitrakumar M 2024-09-30   57  				ret = -EIO;
ef604c21620651 Pavitrakumar M 2024-09-30   58  				goto ERR;
ef604c21620651 Pavitrakumar M 2024-09-30   59  			}
ef604c21620651 Pavitrakumar M 2024-09-30   60  
ef604c21620651 Pavitrakumar M 2024-09-30   61  			/* mark job as done */
ef604c21620651 Pavitrakumar M 2024-09-30   62  			job->job_done = 1;
ef604c21620651 Pavitrakumar M 2024-09-30   63  			spacc->job_lookup[swid] = SPACC_JOB_IDX_UNUSED;
ef604c21620651 Pavitrakumar M 2024-09-30   64  			spacc_errcode = SPACC_GET_STATUS_RET_CODE(cmdstat);
ef604c21620651 Pavitrakumar M 2024-09-30   65  
ef604c21620651 Pavitrakumar M 2024-09-30   66  			switch (spacc_errcode) {
ef604c21620651 Pavitrakumar M 2024-09-30   67  			case SPACC_ICVFAIL:
ef604c21620651 Pavitrakumar M 2024-09-30   68  				ret = -EBADMSG;
ef604c21620651 Pavitrakumar M 2024-09-30   69  				break;
ef604c21620651 Pavitrakumar M 2024-09-30   70  			case SPACC_MEMERR:
ef604c21620651 Pavitrakumar M 2024-09-30   71  				ret = -EINVAL;
ef604c21620651 Pavitrakumar M 2024-09-30   72  				break;
ef604c21620651 Pavitrakumar M 2024-09-30   73  			case SPACC_BLOCKERR:
ef604c21620651 Pavitrakumar M 2024-09-30   74  				ret = -EINVAL;
ef604c21620651 Pavitrakumar M 2024-09-30   75  				break;
ef604c21620651 Pavitrakumar M 2024-09-30   76  			case SPACC_SECERR:
ef604c21620651 Pavitrakumar M 2024-09-30   77  				ret = -EIO;
ef604c21620651 Pavitrakumar M 2024-09-30   78  				break;
ef604c21620651 Pavitrakumar M 2024-09-30   79  			case SPACC_OK:
ef604c21620651 Pavitrakumar M 2024-09-30   80  				ret = CRYPTO_OK;
ef604c21620651 Pavitrakumar M 2024-09-30   81  				break;
ef604c21620651 Pavitrakumar M 2024-09-30   82  			default:
ef604c21620651 Pavitrakumar M 2024-09-30   83  				pr_debug("Invalid SPAcc Error");
ef604c21620651 Pavitrakumar M 2024-09-30   84  			}
ef604c21620651 Pavitrakumar M 2024-09-30   85  
ef604c21620651 Pavitrakumar M 2024-09-30   86  			job->job_err = ret;
ef604c21620651 Pavitrakumar M 2024-09-30   87  
ef604c21620651 Pavitrakumar M 2024-09-30   88  			/*
ef604c21620651 Pavitrakumar M 2024-09-30   89  			 * We're done touching the SPAcc hw, so release the
ef604c21620651 Pavitrakumar M 2024-09-30   90  			 * lock across the job callback.  It must be reacquired
ef604c21620651 Pavitrakumar M 2024-09-30   91  			 * before continuing to the next iteration.
ef604c21620651 Pavitrakumar M 2024-09-30   92  			 */
ef604c21620651 Pavitrakumar M 2024-09-30   93  
ef604c21620651 Pavitrakumar M 2024-09-30   94  			if (job->cb) {
ef604c21620651 Pavitrakumar M 2024-09-30   95  				spin_unlock_irqrestore(&spacc->lock,
ef604c21620651 Pavitrakumar M 2024-09-30   96  							*lock_flag);
ef604c21620651 Pavitrakumar M 2024-09-30   97  				job->cb(spacc, job->cbdata);
ef604c21620651 Pavitrakumar M 2024-09-30  @98  				spin_lock_irqsave(&spacc->lock,
ef604c21620651 Pavitrakumar M 2024-09-30   99  							*lock_flag);
ef604c21620651 Pavitrakumar M 2024-09-30  100  			}
ef604c21620651 Pavitrakumar M 2024-09-30  101  
ef604c21620651 Pavitrakumar M 2024-09-30  102  			(*num_popped)++;
ef604c21620651 Pavitrakumar M 2024-09-30  103  		}
ef604c21620651 Pavitrakumar M 2024-09-30  104  	}
ef604c21620651 Pavitrakumar M 2024-09-30  105  
ef604c21620651 Pavitrakumar M 2024-09-30  106  	if (!*num_popped)
ef604c21620651 Pavitrakumar M 2024-09-30  107  		pr_debug("   Failed to pop a single job\n");
ef604c21620651 Pavitrakumar M 2024-09-30  108  
ef604c21620651 Pavitrakumar M 2024-09-30  109  ERR:
ef604c21620651 Pavitrakumar M 2024-09-30  110  	spacc_process_jb(spacc);
ef604c21620651 Pavitrakumar M 2024-09-30  111  
ef604c21620651 Pavitrakumar M 2024-09-30  112  	/* reset the WD timer to the original value*/
ef604c21620651 Pavitrakumar M 2024-09-30  113  	if (spacc->op_mode == SPACC_OP_MODE_WD)
ef604c21620651 Pavitrakumar M 2024-09-30  114  		spacc_set_wd_count(spacc, spacc->config.wd_timer);
ef604c21620651 Pavitrakumar M 2024-09-30  115  
ef604c21620651 Pavitrakumar M 2024-09-30  116  	if (*num_popped && spacc->spacc_notify_jobs)
ef604c21620651 Pavitrakumar M 2024-09-30  117  		spacc->spacc_notify_jobs(spacc);
ef604c21620651 Pavitrakumar M 2024-09-30  118  
ef604c21620651 Pavitrakumar M 2024-09-30 @119  	return ret;
ef604c21620651 Pavitrakumar M 2024-09-30  120  }
ef604c21620651 Pavitrakumar M 2024-09-30  121  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
