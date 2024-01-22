Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8805F63C
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jan 2024 03:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705893180; cv=none; b=fm7COtY42HtZOZTKX4/u/cJYEB111TksUBHHTHeG80KmICqS1YJ/DNN6bKfQ6PRfEeoTpEFDmeNTxx8weN/xh9KkClEoLRXwvcf28smmCSzyMRe66VmIFE/0wtjxrhd+Sbl9nLOf3pHH+mw1CpWqqfvF/P0jh9im/54VRTCkt4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705893180; c=relaxed/simple;
	bh=NQ4RLngmr/xJakGjkrT9kfywHgyZ/EY5YgCOSyKpAn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZH+rzR9+v8TKqzA6IIoAfygio3F4fcY6m1jU145aQGKfMxHdxWeLcT/Ssj/ofRfET0qT35nCvnCxzkfmv+3GOlDBW1ApF0RDjkDZjcTjB3hUyVf+frQ1fzJ045UnFSGCJyOJ5RLj8nHm9D7kvyacxkplQUMDvykYH6GwF36PzZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BV51boS0; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BV51boS0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705893178; x=1737429178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NQ4RLngmr/xJakGjkrT9kfywHgyZ/EY5YgCOSyKpAn0=;
  b=BV51boS0wmhDVJhm+9RnIKXO5bp4Atylb7U8LcnSQ/BgvZKfamfLphQH
   prmmQhja+G1FIi6n4L2tfu/Cn8aioipBTuMxRhtVaXUE/q1c3YuVWb5Cs
   zcvDAFAordlFjU3gL0Ejau3++Ftu0LR69kn45J4r+RIodHMTjekd8Yv5z
   KVKf33Qdg7FBOe7FBIspWbaeSXRG/cqGgN36iy90EpBsderkln+UCHEX/
   c15Jkn5iTjMBpTUIQvNbDYt6W9pfFaOLvVc8g0qYWwvE3WNckFGrcGvER
   cOiumwozt1F4ZiaAXgXguUxQBHg/BrZkX6IdlnmYJg9KVo17PBQI0jGMI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="14608815"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="14608815"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 19:12:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="1055866"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Jan 2024 19:12:36 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRkjh-0006Mu-0Z;
	Mon, 22 Jan 2024 03:12:33 +0000
Date: Mon, 22 Jan 2024 11:12:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/scsi/ipr.c:1468:22-25: ERROR: invalid reference to the index
 variable of the iterator on line 1445
Message-ID: <202401221117.4m5A4aGy-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>
CC: WANG Xuerui <git@xen0n.name>
CC: Jianmin Lv <lvjianmin@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6613476e225e090cc9aad49be7fa504e290dd33d
commit: 57fc7323a8e7c2e7c1d5795ab63cb3ffea3cfdfb LoongArch: Add PCI controller support
date:   1 year, 5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 1 year, 5 months ago
config: loongarch-randconfig-r061-20240119 (https://download.01.org/0day-ci/archive/20240122/202401221117.4m5A4aGy-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401221117.4m5A4aGy-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/scsi/ipr.c:1468:22-25: ERROR: invalid reference to the index variable of the iterator on line 1445
   drivers/scsi/ipr.c:7865:13-16: ERROR: invalid reference to the index variable of the iterator on line 7845
   drivers/scsi/ipr.c:7865:46-49: ERROR: invalid reference to the index variable of the iterator on line 7845
   drivers/scsi/ipr.c:7865:71-74: ERROR: invalid reference to the index variable of the iterator on line 7845
--
>> drivers/scsi/mpt3sas/mpt3sas_transport.c:980:6-18: ERROR: invalid reference to the index variable of the iterator on line 900
--
>> drivers/scsi/initio.c:2741:2-8: SUGGESTION: printk + WARN_ON can be just WARN

vim +1468 drivers/scsi/ipr.c

^1da177e4c3f41 Linus Torvalds            2005-04-16  1419  
^1da177e4c3f41 Linus Torvalds            2005-04-16  1420  /**
^1da177e4c3f41 Linus Torvalds            2005-04-16  1421   * ipr_handle_config_change - Handle a config change from the adapter
^1da177e4c3f41 Linus Torvalds            2005-04-16  1422   * @ioa_cfg:	ioa config struct
^1da177e4c3f41 Linus Torvalds            2005-04-16  1423   * @hostrcb:	hostrcb
^1da177e4c3f41 Linus Torvalds            2005-04-16  1424   *
^1da177e4c3f41 Linus Torvalds            2005-04-16  1425   * Return value:
^1da177e4c3f41 Linus Torvalds            2005-04-16  1426   * 	none
^1da177e4c3f41 Linus Torvalds            2005-04-16  1427   **/
^1da177e4c3f41 Linus Torvalds            2005-04-16  1428  static void ipr_handle_config_change(struct ipr_ioa_cfg *ioa_cfg,
^1da177e4c3f41 Linus Torvalds            2005-04-16  1429  				     struct ipr_hostrcb *hostrcb)
^1da177e4c3f41 Linus Torvalds            2005-04-16  1430  {
^1da177e4c3f41 Linus Torvalds            2005-04-16  1431  	struct ipr_resource_entry *res = NULL;
3e7ebdfa58ddae Wayne Boyer               2010-02-19  1432  	struct ipr_config_table_entry_wrapper cfgtew;
3e7ebdfa58ddae Wayne Boyer               2010-02-19  1433  	__be32 cc_res_handle;
3e7ebdfa58ddae Wayne Boyer               2010-02-19  1434  
^1da177e4c3f41 Linus Torvalds            2005-04-16  1435  	u32 is_ndn = 1;
^1da177e4c3f41 Linus Torvalds            2005-04-16  1436  
3e7ebdfa58ddae Wayne Boyer               2010-02-19  1437  	if (ioa_cfg->sis64) {
3e7ebdfa58ddae Wayne Boyer               2010-02-19  1438  		cfgtew.u.cfgte64 = &hostrcb->hcam.u.ccn.u.cfgte64;
3e7ebdfa58ddae Wayne Boyer               2010-02-19  1439  		cc_res_handle = cfgtew.u.cfgte64->res_handle;
3e7ebdfa58ddae Wayne Boyer               2010-02-19  1440  	} else {
3e7ebdfa58ddae Wayne Boyer               2010-02-19  1441  		cfgtew.u.cfgte = &hostrcb->hcam.u.ccn.u.cfgte;
3e7ebdfa58ddae Wayne Boyer               2010-02-19  1442  		cc_res_handle = cfgtew.u.cfgte->res_handle;
3e7ebdfa58ddae Wayne Boyer               2010-02-19  1443  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  1444  
^1da177e4c3f41 Linus Torvalds            2005-04-16 @1445  	list_for_each_entry(res, &ioa_cfg->used_res_q, queue) {
3e7ebdfa58ddae Wayne Boyer               2010-02-19  1446  		if (res->res_handle == cc_res_handle) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  1447  			is_ndn = 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  1448  			break;
^1da177e4c3f41 Linus Torvalds            2005-04-16  1449  		}
^1da177e4c3f41 Linus Torvalds            2005-04-16  1450  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  1451  
^1da177e4c3f41 Linus Torvalds            2005-04-16  1452  	if (is_ndn) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  1453  		if (list_empty(&ioa_cfg->free_res_q)) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  1454  			ipr_send_hcam(ioa_cfg,
^1da177e4c3f41 Linus Torvalds            2005-04-16  1455  				      IPR_HCAM_CDB_OP_CODE_CONFIG_CHANGE,
^1da177e4c3f41 Linus Torvalds            2005-04-16  1456  				      hostrcb);
^1da177e4c3f41 Linus Torvalds            2005-04-16  1457  			return;
^1da177e4c3f41 Linus Torvalds            2005-04-16  1458  		}
^1da177e4c3f41 Linus Torvalds            2005-04-16  1459  
^1da177e4c3f41 Linus Torvalds            2005-04-16  1460  		res = list_entry(ioa_cfg->free_res_q.next,
^1da177e4c3f41 Linus Torvalds            2005-04-16  1461  				 struct ipr_resource_entry, queue);
^1da177e4c3f41 Linus Torvalds            2005-04-16  1462  
^1da177e4c3f41 Linus Torvalds            2005-04-16  1463  		list_del(&res->queue);
3e7ebdfa58ddae Wayne Boyer               2010-02-19  1464  		ipr_init_res_entry(res, &cfgtew);
^1da177e4c3f41 Linus Torvalds            2005-04-16  1465  		list_add_tail(&res->queue, &ioa_cfg->used_res_q);
^1da177e4c3f41 Linus Torvalds            2005-04-16  1466  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  1467  
3e7ebdfa58ddae Wayne Boyer               2010-02-19 @1468  	ipr_update_res_entry(res, &cfgtew);
^1da177e4c3f41 Linus Torvalds            2005-04-16  1469  
^1da177e4c3f41 Linus Torvalds            2005-04-16  1470  	if (hostrcb->hcam.notify_type == IPR_HOST_RCB_NOTIF_TYPE_REM_ENTRY) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  1471  		if (res->sdev) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  1472  			res->del_from_ml = 1;
3e7ebdfa58ddae Wayne Boyer               2010-02-19  1473  			res->res_handle = IPR_INVALID_RES_HANDLE;
^1da177e4c3f41 Linus Torvalds            2005-04-16  1474  			schedule_work(&ioa_cfg->work_q);
3e7ebdfa58ddae Wayne Boyer               2010-02-19  1475  		} else {
3e7ebdfa58ddae Wayne Boyer               2010-02-19  1476  			ipr_clear_res_target(res);
^1da177e4c3f41 Linus Torvalds            2005-04-16  1477  			list_move_tail(&res->queue, &ioa_cfg->free_res_q);
3e7ebdfa58ddae Wayne Boyer               2010-02-19  1478  		}
5767a1c4989314 Kleber Sacilotto de Souza 2011-02-14  1479  	} else if (!res->sdev || res->del_from_ml) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  1480  		res->add_to_ml = 1;
^1da177e4c3f41 Linus Torvalds            2005-04-16  1481  		schedule_work(&ioa_cfg->work_q);
^1da177e4c3f41 Linus Torvalds            2005-04-16  1482  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  1483  
^1da177e4c3f41 Linus Torvalds            2005-04-16  1484  	ipr_send_hcam(ioa_cfg, IPR_HCAM_CDB_OP_CODE_CONFIG_CHANGE, hostrcb);
^1da177e4c3f41 Linus Torvalds            2005-04-16  1485  }
^1da177e4c3f41 Linus Torvalds            2005-04-16  1486  

:::::: The code at line 1468 was first introduced by commit
:::::: 3e7ebdfa58ddaef361f9538219e66a7226fb1e5d [SCSI] ipr: update the configuration table code for the next generation chip

:::::: TO: Wayne Boyer <wayneb@linux.vnet.ibm.com>
:::::: CC: James Bottomley <James.Bottomley@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
