Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCE433E5
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Mar 2024 15:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710256781; cv=none; b=XnR8djq8ZGpxplUFaVv/n6g3yYNzTR1NyqbfqVZ17DRNYWZXrmVAubIfNIAmDcUo60n/oxXtHOhqfcwDweA6OsZbZGf8A0LmopL8yBQ00OYD9vrN36c2uh5dFOdcaeQZ2OjZeshwkncSDITqeLk8ksM2kL+id0H3dWSacPRgGts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710256781; c=relaxed/simple;
	bh=monUeskr8KELLt0hVdzEjfW4IAtaLRqr0KVTYJjBZO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X0NmcHLjVAvLAxjTW1rTt26lDDJJUra2gpBMYPGCOxvIK4zMZZXYrZ2xOrJHtdxQFgVEHYT98A46fsag3oX1Tfucuj47a2JhMlXR+dQXsIwnXNh7GzR8hSqHzwKV3mvtV2jVOpjnGCVF+I0+G8vc4upiJUVncyUkSP1P+cJF44Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5DLf5Zo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5DLf5Zo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710256779; x=1741792779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=monUeskr8KELLt0hVdzEjfW4IAtaLRqr0KVTYJjBZO8=;
  b=g5DLf5ZoKHmx8E4+jRTxwFysWB4mevjyxN27vNJQmniYMTfn/3cpS1L/
   ekRgE/HGo2I+YBHJo+Wndtbf1s6WvWgQN4s8sP/qnxk8aB4amU0OZSD6+
   KqPlAnpk/ChrXonjVN1KYYUmkos7nFA1P5ZLy9Mh/0ceOrvEsIowp1eLb
   f01xcQRipEwZteLr2nu07+xYySwFbyHXILqIKRKwa0gs5PsoTo61cogG0
   2g+n/VP0JCS+qJU3rVTRw0PALXg0UIjxC0ejksTmPWWeaudUHGsCJAp0+
   oGdzU9F7/71Q9auK2SKMx9RPCpUPCTR5egh6oHq1W62ZeStvAuoC17S41
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="7919700"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="7919700"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 08:19:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="11496809"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Mar 2024 08:19:37 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rk3uh-000AJb-1X;
	Tue, 12 Mar 2024 15:19:35 +0000
Date: Tue, 12 Mar 2024 23:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 1/3] scsi: libsas: Allow smp_execute_task() arguments
 to be on the stack
Message-ID: <202403122304.O8OEoJ8X-lkp@intel.com>
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
In-Reply-To: <20240307093733.41222-2-yangxingui@huawei.com>
References: <20240307093733.41222-2-yangxingui@huawei.com>
TO: Xingui Yang <yangxingui@huawei.com>
TO: john.g.garry@oracle.com
TO: yanaijie@huawei.com
TO: jejb@linux.ibm.com
TO: martin.petersen@oracle.com
TO: damien.lemoal@opensource.wdc.com
CC: linux-scsi@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linuxarm@huawei.com
CC: prime.zeng@hisilicon.com
CC: chenxiang66@hisilicon.com
CC: kangfenglong@huawei.com

Hi Xingui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on jejb-scsi/for-next linus/master v6.8 next-20240312]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xingui-Yang/scsi-libsas-Allow-smp_execute_task-arguments-to-be-on-the-stack/20240307-174215
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20240307093733.41222-2-yangxingui%40huawei.com
patch subject: [PATCH v3 1/3] scsi: libsas: Allow smp_execute_task() arguments to be on the stack
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20240308 (https://download.01.org/0day-ci/archive/20240312/202403122304.O8OEoJ8X-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403122304.O8OEoJ8X-lkp@intel.com/

New smatch warnings:
drivers/scsi/libsas/sas_expander.c:148 smp_execute_task() warn: possible memory leak of '_req'

Old smatch warnings:
drivers/scsi/libsas/sas_expander.c:1020 sas_ex_discover_dev() warn: missing error code? 'res'
drivers/scsi/libsas/sas_expander.c:1036 sas_ex_discover_dev() warn: missing error code? 'res'
drivers/scsi/libsas/sas_expander.c:2002 sas_rediscover_dev() warn: missing error code? 'res'

vim +/_req +148 drivers/scsi/libsas/sas_expander.c

2908d778ab3e244 James Bottomley 2006-08-29  137  
adfd2325dfc5cf6 Xingui Yang     2024-03-07  138  static int smp_execute_task(struct domain_device *dev, void *req, int req_size,
adfd2325dfc5cf6 Xingui Yang     2024-03-07  139  			    void *resp, int resp_size)
adfd2325dfc5cf6 Xingui Yang     2024-03-07  140  {
adfd2325dfc5cf6 Xingui Yang     2024-03-07  141  	struct scatterlist req_sg;
adfd2325dfc5cf6 Xingui Yang     2024-03-07  142  	struct scatterlist resp_sg;
adfd2325dfc5cf6 Xingui Yang     2024-03-07  143  	void *_req = kmemdup(req, req_size, GFP_KERNEL);
adfd2325dfc5cf6 Xingui Yang     2024-03-07  144  	void *_resp = alloc_smp_resp(resp_size);
adfd2325dfc5cf6 Xingui Yang     2024-03-07  145  	int ret;
adfd2325dfc5cf6 Xingui Yang     2024-03-07  146  
adfd2325dfc5cf6 Xingui Yang     2024-03-07  147  	if (!_req || !resp)
adfd2325dfc5cf6 Xingui Yang     2024-03-07 @148  		return -ENOMEM;
adfd2325dfc5cf6 Xingui Yang     2024-03-07  149  
adfd2325dfc5cf6 Xingui Yang     2024-03-07  150  	sg_init_one(&req_sg, _req, req_size);
adfd2325dfc5cf6 Xingui Yang     2024-03-07  151  	sg_init_one(&resp_sg, _resp, resp_size);
adfd2325dfc5cf6 Xingui Yang     2024-03-07  152  	ret = smp_execute_task_sg(dev, &req_sg, &resp_sg);
adfd2325dfc5cf6 Xingui Yang     2024-03-07  153  	memcpy(resp, _resp, resp_size);
adfd2325dfc5cf6 Xingui Yang     2024-03-07  154  	kfree(_req);
adfd2325dfc5cf6 Xingui Yang     2024-03-07  155  	kfree(_resp);
adfd2325dfc5cf6 Xingui Yang     2024-03-07  156  	return ret;
adfd2325dfc5cf6 Xingui Yang     2024-03-07  157  }
adfd2325dfc5cf6 Xingui Yang     2024-03-07  158  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
