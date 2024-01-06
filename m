Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F5220E3
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jan 2024 02:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FzY5kVt0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704509317; x=1736045317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KDBYH/7/oFKjKybmVNJKu5lacxHyS2Kp5GbCgnc8qWM=;
  b=FzY5kVt0Q1MmgmVz9an/reCVoLOG6CpltnM69sexq8m5f9b+iJ5El5C1
   1VnbPgaM0iRm2/5rcqZ23WhacumivC76BxbVrWtmDhIaHDGkm6lJ0mUYr
   H++DEVgYp0Z+j28WFh5euaA3nQZMoSfrUt+WyOYbbZQuzCdkJuIX8o4ch
   rdJ4TpCkyoXSQll58MGCEpk0Smxp9JwkDIEk18ZEwUT7YIMgz+NJJ8Pfn
   DCDP5YrKho91UiKhIuoHsHkB/CpuqgiqI2dz2666v4hn1qcD1/EqYdXyL
   7FStI+3yubu1EdEh1UbLrUxERvVX8S6zEr9NUrtiX3RtiYTw0n6dGCIxT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="11115203"
X-IronPort-AV: E=Sophos;i="6.04,335,1695711600"; 
   d="scan'208";a="11115203"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 18:44:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,335,1695711600"; 
   d="scan'208";a="23008669"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 05 Jan 2024 18:44:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLwfL-0001wm-0S;
	Sat, 06 Jan 2024 02:44:03 +0000
Date: Sat, 6 Jan 2024 10:43:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/scsi/mpt3sas/mpt3sas_base.c:2951:54: warning: '%d' directive
 output may be truncated writing between 1 and 3 bytes into a region of size
 between 1 and 26
Message-ID: <202401061021.tpkbFcs2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Nathan Chancellor <natechancellor@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a4ab2706bb1280693e7dff1c5c42a8cb9d70c177
commit: 61e0349f703d1576a12f88c15f25e0a56fd277af ubsan: disable object-size sanitizer under GCC
date:   3 years, 1 month ago
:::::: branch date: 6 hours ago
:::::: commit date: 3 years, 1 month ago
config: x86_64-randconfig-002-20240105 (https://download.01.org/0day-ci/archive/20240106/202401061021.tpkbFcs2-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240106/202401061021.tpkbFcs2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401061021.tpkbFcs2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/mpt3sas/mpt3sas_base.c: In function '_base_request_irq':
>> drivers/scsi/mpt3sas/mpt3sas_base.c:2951:54: warning: '%d' directive output may be truncated writing between 1 and 3 bytes into a region of size between 1 and 26 [-Wformat-truncation=]
    2951 |   snprintf(reply_q->name, MPT_NAME_LENGTH, "%s%d-msix%d",
         |                                                      ^~
   drivers/scsi/mpt3sas/mpt3sas_base.c:2951:44: note: directive argument in the range [0, 255]
    2951 |   snprintf(reply_q->name, MPT_NAME_LENGTH, "%s%d-msix%d",
         |                                            ^~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_base.c:2951:3: note: 'snprintf' output between 8 and 35 bytes into a destination of size 32
    2951 |   snprintf(reply_q->name, MPT_NAME_LENGTH, "%s%d-msix%d",
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2952 |       ioc->driver_name, ioc->id, index);
         |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_base.c: In function 'mpt3sas_base_start_watchdog':
   drivers/scsi/mpt3sas/mpt3sas_base.c:751:50: warning: '%s' directive output may be truncated writing up to 23 bytes into a region of size 15 [-Wformat-truncation=]
     751 |      sizeof(ioc->fault_reset_work_q_name), "poll_%s%d_status",
         |                                                  ^~
   drivers/scsi/mpt3sas/mpt3sas_base.c:751:44: note: directive argument in the range [0, 255]
     751 |      sizeof(ioc->fault_reset_work_q_name), "poll_%s%d_status",
         |                                            ^~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_base.c:750:2: note: 'snprintf' output between 14 and 39 bytes into a destination of size 20
     750 |  snprintf(ioc->fault_reset_work_q_name,
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     751 |      sizeof(ioc->fault_reset_work_q_name), "poll_%s%d_status",
         |      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     752 |      ioc->driver_name, ioc->id);
         |      ~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +2951 drivers/scsi/mpt3sas/mpt3sas_base.c

f92363d1235949 Sreekanth Reddy          2012-11-30  2925  
f92363d1235949 Sreekanth Reddy          2012-11-30  2926  /**
f92363d1235949 Sreekanth Reddy          2012-11-30  2927   * _base_request_irq - request irq
f92363d1235949 Sreekanth Reddy          2012-11-30  2928   * @ioc: per adapter object
f92363d1235949 Sreekanth Reddy          2012-11-30  2929   * @index: msix index into vector table
f92363d1235949 Sreekanth Reddy          2012-11-30  2930   *
f92363d1235949 Sreekanth Reddy          2012-11-30  2931   * Inserting respective reply_queue into the list.
f92363d1235949 Sreekanth Reddy          2012-11-30  2932   */
f92363d1235949 Sreekanth Reddy          2012-11-30  2933  static int
1d55abc0e98a0b Hannes Reinecke          2017-02-22  2934  _base_request_irq(struct MPT3SAS_ADAPTER *ioc, u8 index)
f92363d1235949 Sreekanth Reddy          2012-11-30  2935  {
1d55abc0e98a0b Hannes Reinecke          2017-02-22  2936  	struct pci_dev *pdev = ioc->pdev;
f92363d1235949 Sreekanth Reddy          2012-11-30  2937  	struct adapter_reply_queue *reply_q;
f92363d1235949 Sreekanth Reddy          2012-11-30  2938  	int r;
f92363d1235949 Sreekanth Reddy          2012-11-30  2939  
f92363d1235949 Sreekanth Reddy          2012-11-30  2940  	reply_q =  kzalloc(sizeof(struct adapter_reply_queue), GFP_KERNEL);
f92363d1235949 Sreekanth Reddy          2012-11-30  2941  	if (!reply_q) {
919d8a3f3fef99 Joe Perches              2018-09-17  2942  		ioc_err(ioc, "unable to allocate memory %zu!\n",
919d8a3f3fef99 Joe Perches              2018-09-17  2943  			sizeof(struct adapter_reply_queue));
f92363d1235949 Sreekanth Reddy          2012-11-30  2944  		return -ENOMEM;
f92363d1235949 Sreekanth Reddy          2012-11-30  2945  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  2946  	reply_q->ioc = ioc;
f92363d1235949 Sreekanth Reddy          2012-11-30  2947  	reply_q->msix_index = index;
14b3114d940cdc Sreekanth Reddy          2015-01-12  2948  
f92363d1235949 Sreekanth Reddy          2012-11-30  2949  	atomic_set(&reply_q->busy, 0);
f92363d1235949 Sreekanth Reddy          2012-11-30  2950  	if (ioc->msix_enable)
f92363d1235949 Sreekanth Reddy          2012-11-30 @2951  		snprintf(reply_q->name, MPT_NAME_LENGTH, "%s%d-msix%d",
c84b06a48c4d8a Sreekanth Reddy          2015-11-11  2952  		    ioc->driver_name, ioc->id, index);
f92363d1235949 Sreekanth Reddy          2012-11-30  2953  	else
f92363d1235949 Sreekanth Reddy          2012-11-30  2954  		snprintf(reply_q->name, MPT_NAME_LENGTH, "%s%d",
c84b06a48c4d8a Sreekanth Reddy          2015-11-11  2955  		    ioc->driver_name, ioc->id);
1d55abc0e98a0b Hannes Reinecke          2017-02-22  2956  	r = request_irq(pci_irq_vector(pdev, index), _base_interrupt,
1d55abc0e98a0b Hannes Reinecke          2017-02-22  2957  			IRQF_SHARED, reply_q->name, reply_q);
f92363d1235949 Sreekanth Reddy          2012-11-30  2958  	if (r) {
fc7d510ec4c8ff Joe Perches              2018-09-17  2959  		pr_err("%s: unable to allocate interrupt %d!\n",
1d55abc0e98a0b Hannes Reinecke          2017-02-22  2960  		       reply_q->name, pci_irq_vector(pdev, index));
da3cec2515f009 Suganath prabu Subramani 2016-02-11  2961  		kfree(reply_q);
f92363d1235949 Sreekanth Reddy          2012-11-30  2962  		return -EBUSY;
f92363d1235949 Sreekanth Reddy          2012-11-30  2963  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  2964  
f92363d1235949 Sreekanth Reddy          2012-11-30  2965  	INIT_LIST_HEAD(&reply_q->list);
f92363d1235949 Sreekanth Reddy          2012-11-30  2966  	list_add_tail(&reply_q->list, &ioc->reply_queue_list);
f92363d1235949 Sreekanth Reddy          2012-11-30  2967  	return 0;
f92363d1235949 Sreekanth Reddy          2012-11-30  2968  }
f92363d1235949 Sreekanth Reddy          2012-11-30  2969  

:::::: The code at line 2951 was first introduced by commit
:::::: f92363d12359498f9a9960511de1a550f0ec41c2 [SCSI] mpt3sas: add new driver supporting 12GB SAS

:::::: TO: Sreekanth Reddy <Sreekanth.Reddy@lsi.com>
:::::: CC: James Bottomley <JBottomley@Parallels.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
