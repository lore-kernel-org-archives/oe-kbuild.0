Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B962364
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Mar 2024 06:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711780946; cv=none; b=uggO1pQnL/2wbXKXiODTZZcs+209KrtUFHlBbZeSNueX/Hg/cpYvRtlAJ7nWPoJc/8sR1lyRKTr7qlNANTVt6GGlO1RfgnFJeVxHLmE0pxplXcoD6UsOllxIWO32QWzLfPRcVzb4nn6UiVq0mHZgAg4E6tEfhduUBbcjMvvtqBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711780946; c=relaxed/simple;
	bh=WbSsqUmUK8khJFN58cgd4JU5svRUhL6kyC129u15JWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mcEpcclvBPgI68mkAM7W/Z3g685H3cFfr5RVXn7434xi78TgMgvVvcYvTiiwYPGsS57yYeRls1C/TytQKoeR1erOxgsMSNSASuNJLaRpotU90ickD3xufMauseBd1alNMel+Zvqvb+dp8z3bILwTbzoKrDAh/TYmeCs5UfBF+4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMnamuOa; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMnamuOa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711780944; x=1743316944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WbSsqUmUK8khJFN58cgd4JU5svRUhL6kyC129u15JWU=;
  b=eMnamuOa7DlIPwaTZWRjL9UM7K4pa0G5QmceddRFpA8zbNfcxQcUaonx
   pP/8UzTs338gU3SwR9uAvyk9W1txwxGIsmJU1h3YaE2sGShWwAexQb18x
   PQ93Hs6lnrq67ORJFQOOQldT33m99rMK7YBxSCyIjjtQ1LWDfMbFUEa4D
   sxoWp4HjMjc9A5pIZA+lQZ1QI2MLcoWX4iImaMs54f57xsca293ln34sE
   JW/S4zTY4lPbckTDqv28zwCpuHDfh013blR6WBVCPWarG303zRlViwfFo
   mEM5A0JkBrlHrIvEuDciiy6f2aLGmdQ7UH7O0Vgr84G3oHzI+Vucg+7V9
   Q==;
X-CSE-ConnectionGUID: UOxw+6kuQvWzPUsANYJAXw==
X-CSE-MsgGUID: 6LJxJ7TFRtay1aeS1Co42A==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="18340386"
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="18340386"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 23:42:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="17642332"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Mar 2024 23:42:22 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqSPz-00040y-0l;
	Sat, 30 Mar 2024 06:42:19 +0000
Date: Sat, 30 Mar 2024 14:41:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v1 4/4] Enable Driver compilation in crypto Kconfig and
 Makefile file
Message-ID: <202403301459.iOQWfbMn-lkp@intel.com>
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
In-Reply-To: <20240328182652.3587727-5-pavitrakumarm@vayavyalabs.com>
References: <20240328182652.3587727-5-pavitrakumarm@vayavyalabs.com>
TO: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>
TO: herbert@gondor.apana.org.au
TO: linux-crypto@vger.kernel.org
CC: Ruud.Derwig@synopsys.com
CC: manjunath.hadli@vayavyalabs.com
CC: bhoomikak@vayavyalabs.com
CC: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>

Hi Pavitrakumar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6a8dbd71a70620c42d4fa82509204ba18231f28d]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavitrakumar-M/Add-SPAcc-driver-to-Linux-kernel/20240329-023010
base:   6a8dbd71a70620c42d4fa82509204ba18231f28d
patch link:    https://lore.kernel.org/r/20240328182652.3587727-5-pavitrakumarm%40vayavyalabs.com
patch subject: [PATCH v1 4/4] Enable Driver compilation in crypto Kconfig and Makefile file
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-103-20240330 (https://download.01.org/0day-ci/archive/20240330/202403301459.iOQWfbMn-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403301459.iOQWfbMn-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/crypto/dwc-spacc/spacc_core.c:1638:1-7: preceding lock on line 1618

vim +1638 drivers/crypto/dwc-spacc/spacc_core.c

b37587c90bca57 Pavitrakumar M 2024-03-28  1546  
b37587c90bca57 Pavitrakumar M 2024-03-28  1547  static int spacc_pop_packets_ex(struct spacc_device *spacc, int *num_popped,
b37587c90bca57 Pavitrakumar M 2024-03-28  1548  				unsigned long *lock_flag)
b37587c90bca57 Pavitrakumar M 2024-03-28  1549  {
b37587c90bca57 Pavitrakumar M 2024-03-28  1550  	int ret = -EINPROGRESS;
b37587c90bca57 Pavitrakumar M 2024-03-28  1551  	struct spacc_job *job = NULL;
b37587c90bca57 Pavitrakumar M 2024-03-28  1552  	u32 cmdstat, swid, spacc_errcode = SPACC_OK;
b37587c90bca57 Pavitrakumar M 2024-03-28  1553  	int jobs;
b37587c90bca57 Pavitrakumar M 2024-03-28  1554  
b37587c90bca57 Pavitrakumar M 2024-03-28  1555  	*num_popped = 0;
b37587c90bca57 Pavitrakumar M 2024-03-28  1556  
b37587c90bca57 Pavitrakumar M 2024-03-28  1557  	while ((jobs = _spacc_get_stat_cnt(spacc))) {
b37587c90bca57 Pavitrakumar M 2024-03-28  1558  		while (jobs-- > 0) {
b37587c90bca57 Pavitrakumar M 2024-03-28  1559  			/* write the pop register to get the next job */
b37587c90bca57 Pavitrakumar M 2024-03-28  1560  			writel(1, spacc->regmap + SPACC_REG_STAT_POP);
b37587c90bca57 Pavitrakumar M 2024-03-28  1561  			cmdstat = readl(spacc->regmap + SPACC_REG_STATUS);
b37587c90bca57 Pavitrakumar M 2024-03-28  1562  
b37587c90bca57 Pavitrakumar M 2024-03-28  1563  			swid = SPACC_STATUS_SW_ID_GET(cmdstat);
b37587c90bca57 Pavitrakumar M 2024-03-28  1564  
b37587c90bca57 Pavitrakumar M 2024-03-28  1565  			if (spacc->job_lookup[swid] == SPACC_JOB_IDX_UNUSED) {
b37587c90bca57 Pavitrakumar M 2024-03-28  1566  				ret = -EIO;
b37587c90bca57 Pavitrakumar M 2024-03-28  1567  				goto ERR;
b37587c90bca57 Pavitrakumar M 2024-03-28  1568  			}
b37587c90bca57 Pavitrakumar M 2024-03-28  1569  
b37587c90bca57 Pavitrakumar M 2024-03-28  1570  			/* find the associated job with popped swid */
b37587c90bca57 Pavitrakumar M 2024-03-28  1571  			if (swid < 0 || swid >= SPACC_MAX_JOBS)
b37587c90bca57 Pavitrakumar M 2024-03-28  1572  				job = NULL;
b37587c90bca57 Pavitrakumar M 2024-03-28  1573  			else
b37587c90bca57 Pavitrakumar M 2024-03-28  1574  				job = &spacc->job[spacc->job_lookup[swid]];
b37587c90bca57 Pavitrakumar M 2024-03-28  1575  
b37587c90bca57 Pavitrakumar M 2024-03-28  1576  			if (!job) {
b37587c90bca57 Pavitrakumar M 2024-03-28  1577  				ret = -EIO;
b37587c90bca57 Pavitrakumar M 2024-03-28  1578  				goto ERR;
b37587c90bca57 Pavitrakumar M 2024-03-28  1579  			}
b37587c90bca57 Pavitrakumar M 2024-03-28  1580  
b37587c90bca57 Pavitrakumar M 2024-03-28  1581  			/* mark job as done */
b37587c90bca57 Pavitrakumar M 2024-03-28  1582  			job->job_done = 1;
b37587c90bca57 Pavitrakumar M 2024-03-28  1583  			spacc->job_lookup[swid] = SPACC_JOB_IDX_UNUSED;
b37587c90bca57 Pavitrakumar M 2024-03-28  1584  			spacc_errcode = SPACC_GET_STATUS_RET_CODE(cmdstat);
b37587c90bca57 Pavitrakumar M 2024-03-28  1585  
b37587c90bca57 Pavitrakumar M 2024-03-28  1586  			switch (spacc_errcode) {
b37587c90bca57 Pavitrakumar M 2024-03-28  1587  			case SPACC_ICVFAIL:
b37587c90bca57 Pavitrakumar M 2024-03-28  1588  				ret = -EBADMSG;
b37587c90bca57 Pavitrakumar M 2024-03-28  1589  				break;
b37587c90bca57 Pavitrakumar M 2024-03-28  1590  			case SPACC_MEMERR:
b37587c90bca57 Pavitrakumar M 2024-03-28  1591  				ret = -EINVAL;
b37587c90bca57 Pavitrakumar M 2024-03-28  1592  				break;
b37587c90bca57 Pavitrakumar M 2024-03-28  1593  			case SPACC_BLOCKERR:
b37587c90bca57 Pavitrakumar M 2024-03-28  1594  				ret = -EINVAL;
b37587c90bca57 Pavitrakumar M 2024-03-28  1595  				break;
b37587c90bca57 Pavitrakumar M 2024-03-28  1596  			case SPACC_SECERR:
b37587c90bca57 Pavitrakumar M 2024-03-28  1597  				ret = -EIO;
b37587c90bca57 Pavitrakumar M 2024-03-28  1598  				break;
b37587c90bca57 Pavitrakumar M 2024-03-28  1599  			case SPACC_OK:
b37587c90bca57 Pavitrakumar M 2024-03-28  1600  				ret = CRYPTO_OK;
b37587c90bca57 Pavitrakumar M 2024-03-28  1601  				break;
b37587c90bca57 Pavitrakumar M 2024-03-28  1602  			default:
b37587c90bca57 Pavitrakumar M 2024-03-28  1603  				pr_debug("   BUG: Hitting default case");
b37587c90bca57 Pavitrakumar M 2024-03-28  1604  			}
b37587c90bca57 Pavitrakumar M 2024-03-28  1605  
b37587c90bca57 Pavitrakumar M 2024-03-28  1606  			job->job_err = ret;
b37587c90bca57 Pavitrakumar M 2024-03-28  1607  
b37587c90bca57 Pavitrakumar M 2024-03-28  1608  			/*
b37587c90bca57 Pavitrakumar M 2024-03-28  1609  			 * We're done touching the SPAcc hw, so release the
b37587c90bca57 Pavitrakumar M 2024-03-28  1610  			 * lock across the job callback.  It must be reacquired
b37587c90bca57 Pavitrakumar M 2024-03-28  1611  			 * before continuing to the next iteration.
b37587c90bca57 Pavitrakumar M 2024-03-28  1612  			 */
b37587c90bca57 Pavitrakumar M 2024-03-28  1613  
b37587c90bca57 Pavitrakumar M 2024-03-28  1614  			if (job->cb) {
b37587c90bca57 Pavitrakumar M 2024-03-28  1615  				spin_unlock_irqrestore(&spacc->lock,
b37587c90bca57 Pavitrakumar M 2024-03-28  1616  						       *lock_flag);
b37587c90bca57 Pavitrakumar M 2024-03-28  1617  				job->cb(spacc, job->cbdata);
b37587c90bca57 Pavitrakumar M 2024-03-28 @1618  				spin_lock_irqsave(&spacc->lock, *lock_flag);
b37587c90bca57 Pavitrakumar M 2024-03-28  1619  			}
b37587c90bca57 Pavitrakumar M 2024-03-28  1620  
b37587c90bca57 Pavitrakumar M 2024-03-28  1621  			(*num_popped)++;
b37587c90bca57 Pavitrakumar M 2024-03-28  1622  		}
b37587c90bca57 Pavitrakumar M 2024-03-28  1623  	}
b37587c90bca57 Pavitrakumar M 2024-03-28  1624  
b37587c90bca57 Pavitrakumar M 2024-03-28  1625  	if (!*num_popped)
b37587c90bca57 Pavitrakumar M 2024-03-28  1626  		pr_debug("   Failed to pop a single job\n");
b37587c90bca57 Pavitrakumar M 2024-03-28  1627  
b37587c90bca57 Pavitrakumar M 2024-03-28  1628  ERR:
b37587c90bca57 Pavitrakumar M 2024-03-28  1629  	spacc_process_jb(spacc);
b37587c90bca57 Pavitrakumar M 2024-03-28  1630  
b37587c90bca57 Pavitrakumar M 2024-03-28  1631  	/* reset the WD timer to the original value*/
b37587c90bca57 Pavitrakumar M 2024-03-28  1632  	if (spacc->op_mode == SPACC_OP_MODE_WD)
b37587c90bca57 Pavitrakumar M 2024-03-28  1633  		spacc_set_wd_count(spacc, spacc->config.wd_timer);
b37587c90bca57 Pavitrakumar M 2024-03-28  1634  
b37587c90bca57 Pavitrakumar M 2024-03-28  1635  	if (*num_popped && spacc->spacc_notify_jobs)
b37587c90bca57 Pavitrakumar M 2024-03-28  1636  		spacc->spacc_notify_jobs(spacc);
b37587c90bca57 Pavitrakumar M 2024-03-28  1637  
b37587c90bca57 Pavitrakumar M 2024-03-28 @1638  	return ret;
b37587c90bca57 Pavitrakumar M 2024-03-28  1639  }
b37587c90bca57 Pavitrakumar M 2024-03-28  1640  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
