Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45AB38F94
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Mar 2024 15:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710084015; cv=none; b=dP15I0GsAv0fIcH6E1dSYQOvNnGbFR6lRrGfhS54d12c89bQiByprPe09+hrX8zSiHv4nNHpw3SZPE+TlbJqN0KsccRqBAHPZMDaFI0jMD62hYKSqcBvgVY7cWpRD3dtxWCpJeEPz4KJthwxiknPiLo4ECv2VSOgEN+hMNKX/4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710084015; c=relaxed/simple;
	bh=ZY55zd1wTp0y03O7a3ZxkbKOg+YYix4j818CMwdJpas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kUcMnZxkP/yNOc3yWPL9uQymCv2AlLKzoY6Ury4ggUPeZiKC6SU/T90NbEtBwljlro8gAjX82aqQ4gIfirKuXoPal18xM4Wn+8yewzbwdCgvilJFF4gKJ3AiYPodO95mNj6jaEZPj9WKXcycfmBIdgWLnNxwUdasyRonmtKzrEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/IDeWdY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/IDeWdY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710084013; x=1741620013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZY55zd1wTp0y03O7a3ZxkbKOg+YYix4j818CMwdJpas=;
  b=K/IDeWdYaJE1HW7aNJ5jrV/iCGi8TInE3MeBQBannkfJ1n6AxDhQfNc/
   2K2nbvXkRkPSc5ODuJOE/x0EslmbUR6BGF9PoMn0PW6j7gHjz/GOqfS08
   WhpHCn5GmXUPi429prgYpVX72ovceOrPuGWbEe5v+OPOGOrSAPVcxKJmQ
   gfcCIAmjRpjwPQjkztc5qWoMuayEI0IewS8vNI057eHofvYfwlEMGdLws
   c8H/TzjQ2O5W7A+xY1ZGfc0gxGEBiy6GnG+lMhwG2SmXi3giGhrajau+m
   e+VuAmDBvNIF6TtBCipT9pxdxop+7qckjTjAZRotEhtLIFL0trdHYVs73
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="30193976"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="30193976"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 08:20:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="15635873"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Mar 2024 08:20:11 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjKy8-0008KV-1Q;
	Sun, 10 Mar 2024 15:20:08 +0000
Date: Sun, 10 Mar 2024 23:19:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 1/3] scsi: libsas: Allow smp_execute_task() arguments
 to be on the stack
Message-ID: <202403102353.jUPi6fOP-lkp@intel.com>
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
[also build test WARNING on jejb-scsi/for-next linus/master v6.8-rc7 next-20240308]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xingui-Yang/scsi-libsas-Allow-smp_execute_task-arguments-to-be-on-the-stack/20240307-174215
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20240307093733.41222-2-yangxingui%40huawei.com
patch subject: [PATCH v3 1/3] scsi: libsas: Allow smp_execute_task() arguments to be on the stack
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20240308 (https://download.01.org/0day-ci/archive/20240310/202403102353.jUPi6fOP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403102353.jUPi6fOP-lkp@intel.com/

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
