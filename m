Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7F127442
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Dec 2024 17:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734196521; cv=none; b=mfYLFfCd13EtnfV9rOr4kMLvrdjY/WJpwBKg78CaIRoiLl4dk2vw5M2mlmc7KQihB+Pe8vP1I6FNuHvVGXgNDKk9T3qXJWOafdjCRr3ANsiEAwRFrfaNwIhoIALm4zTy+um33RqDbWgr1xc11lnV7XMt/og1AVwMFILaPnIecyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734196521; c=relaxed/simple;
	bh=GUQjrbIY6MsbIz/MszER9nS5A0fB1HEcwfB/LKFH0Js=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nioacgtaQtHCgET6LNGpLlsK5D3OcyQtyCIligW5qp7w1GTvapKRD0B7Y4ERgfvvXxz0CwpMBlbbP8+FyxkwGyAhtRcjuXMuPwcq7uiuzKxbvQM3dM8Z1D2vA607H8uQ/xAKHyrhab3gKsKfaHDcvRZMoSUwaIY3syBH/IxaCow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hHIQEar4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHIQEar4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734196520; x=1765732520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GUQjrbIY6MsbIz/MszER9nS5A0fB1HEcwfB/LKFH0Js=;
  b=hHIQEar4/BAxbwv8SL8wNWQYaWng+3ZtsqgU+MdHz5wb0Cnh7APV2GlF
   K8brJid7T5b4DtYB3kTTnajVZRJX8W3dRlZMuDJLoHjBydEiwSMjL+wmP
   0vuLvcVlEqWAZoXIRyiniUJ8oT4tzOyXLYvuiWUVAwIoxmq5qt2irJsuK
   6tpNnxcp2yvo6qB/dCRd4t497NFMnUNaRnZGAnhQxlbYvk1suhaM2+mHu
   HXMdyEZGqeOlKARhDMWt93LtIIRG0dI3BX64tcFtSl8L3pZ69TdOKC4MP
   +TpUCaCiiM6ysDP7E7h1VMDg1PpF5uY22YzhP3rFPUTc8F5BKYRpnO2xL
   A==;
X-CSE-ConnectionGUID: YgI4QdBYSZO+zk22ymL0PA==
X-CSE-MsgGUID: qD7ObdeaQKeX3TgrSYXgfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34508186"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="34508186"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 09:15:19 -0800
X-CSE-ConnectionGUID: j3BzBMWTSHWf+0/Zjgxpqg==
X-CSE-MsgGUID: 2LcRKiSYTq6l68LGhnwKzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134156323"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Dec 2024 09:15:17 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMVjW-000D5j-3A;
	Sat, 14 Dec 2024 17:15:14 +0000
Date: Sun, 15 Dec 2024 01:14:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2579/2579]
 drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:851 hifc_dbgtool_knl_init()
 warn: potential spectre issue 'g_card_node_array' [w]
Message-ID: <202412150126.4ROUW6wq-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: zhoujiadong <zhoujiadong5@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6c3413fbf8c430b89f5d23f465e10e99ea145199
commit: 3d776c92130b1cdb4c9c0e5b7267152ab998fec3 [2579/2579] scsi/hifc: Fix compile error in allyesconfigs
:::::: branch date: 34 hours ago
:::::: commit date: 1 year, 7 months ago
config: x86_64-randconfig-161-20241213 (https://download.01.org/0day-ci/archive/20241215/202412150126.4ROUW6wq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412150126.4ROUW6wq-lkp@intel.com/

smatch warnings:
drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:851 hifc_dbgtool_knl_init() warn: potential spectre issue 'g_card_node_array' [w]
drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:883 hifc_dbgtool_knl_init() warn: sscanf doesn't return error codes
drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:917 hifc_dbgtool_knl_deinit() warn: potential spectre issue 'g_card_node_array' [w]

vim +/g_card_node_array +851 drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c

02b4d17a9ac62b denglei     2021-04-26  789  
02b4d17a9ac62b denglei     2021-04-26  790  /**
3d776c92130b1c zhoujiadong 2023-05-09  791   * hifc_dbgtool_knl_init - dbgtool character device init
02b4d17a9ac62b denglei     2021-04-26  792   * @hwdev: the pointer to hardware device
02b4d17a9ac62b denglei     2021-04-26  793   * @chip_node: the pointer to card node
02b4d17a9ac62b denglei     2021-04-26  794   * Return: 0 - success, negative - failure
02b4d17a9ac62b denglei     2021-04-26  795   */
3d776c92130b1c zhoujiadong 2023-05-09  796  int hifc_dbgtool_knl_init(void *vhwdev, void *chip_node)
02b4d17a9ac62b denglei     2021-04-26  797  {
02b4d17a9ac62b denglei     2021-04-26  798  	struct card_node *chip_info = (struct card_node *)chip_node;
02b4d17a9ac62b denglei     2021-04-26  799  	struct dbgtool_k_glb_info *dbgtool_info;
02b4d17a9ac62b denglei     2021-04-26  800  	struct hifc_hwdev *hwdev = vhwdev;
02b4d17a9ac62b denglei     2021-04-26  801  	int ret = 0;
02b4d17a9ac62b denglei     2021-04-26  802  	int id;
02b4d17a9ac62b denglei     2021-04-26  803  
02b4d17a9ac62b denglei     2021-04-26  804  	if (hifc_func_type(hwdev) == TYPE_VF)
02b4d17a9ac62b denglei     2021-04-26  805  		return 0;
02b4d17a9ac62b denglei     2021-04-26  806  
02b4d17a9ac62b denglei     2021-04-26  807  	ret = sysfs_create_file(&((struct device *)(hwdev->dev_hdl))->kobj,
02b4d17a9ac62b denglei     2021-04-26  808  				&chip_info->dbgtool_attr_file);
02b4d17a9ac62b denglei     2021-04-26  809  	if (ret) {
02b4d17a9ac62b denglei     2021-04-26  810  		pr_err("Failed to sysfs create file\n");
02b4d17a9ac62b denglei     2021-04-26  811  		return ret;
02b4d17a9ac62b denglei     2021-04-26  812  	}
02b4d17a9ac62b denglei     2021-04-26  813  
02b4d17a9ac62b denglei     2021-04-26  814  	chip_info->func_handle_array[hifc_global_func_id(hwdev)] = hwdev;
02b4d17a9ac62b denglei     2021-04-26  815  
02b4d17a9ac62b denglei     2021-04-26  816  	hifc_comm_recv_mgmt_self_cmd_reg(hwdev, HIFC_SELF_CMD_UP2PF_FFM,
02b4d17a9ac62b denglei     2021-04-26  817  					 ffm_intr_msg_record);
02b4d17a9ac62b denglei     2021-04-26  818  
02b4d17a9ac62b denglei     2021-04-26  819  	if (chip_info->dbgtool_info) {
02b4d17a9ac62b denglei     2021-04-26  820  		chip_info->func_num++;
02b4d17a9ac62b denglei     2021-04-26  821  		return 0;
02b4d17a9ac62b denglei     2021-04-26  822  	}
02b4d17a9ac62b denglei     2021-04-26  823  
02b4d17a9ac62b denglei     2021-04-26  824  	dbgtool_info = (struct dbgtool_k_glb_info *)
02b4d17a9ac62b denglei     2021-04-26  825  			kzalloc(sizeof(struct dbgtool_k_glb_info), GFP_KERNEL);
02b4d17a9ac62b denglei     2021-04-26  826  	if (!dbgtool_info) {
02b4d17a9ac62b denglei     2021-04-26  827  		pr_err("Failed to allocate dbgtool_info\n");
02b4d17a9ac62b denglei     2021-04-26  828  		ret = -EFAULT;
02b4d17a9ac62b denglei     2021-04-26  829  		goto dbgtool_info_fail;
02b4d17a9ac62b denglei     2021-04-26  830  	}
02b4d17a9ac62b denglei     2021-04-26  831  	chip_info->dbgtool_info = dbgtool_info;
02b4d17a9ac62b denglei     2021-04-26  832  
02b4d17a9ac62b denglei     2021-04-26  833  	/* FFM init */
02b4d17a9ac62b denglei     2021-04-26  834  	dbgtool_info->ffm = (struct ffm_record_info *)
02b4d17a9ac62b denglei     2021-04-26  835  				kzalloc(sizeof(struct ffm_record_info),
02b4d17a9ac62b denglei     2021-04-26  836  					GFP_KERNEL);
02b4d17a9ac62b denglei     2021-04-26  837  	if (!dbgtool_info->ffm) {
02b4d17a9ac62b denglei     2021-04-26  838  		pr_err("Failed to allocate cell contexts for a chain\n");
02b4d17a9ac62b denglei     2021-04-26  839  		ret = -EFAULT;
02b4d17a9ac62b denglei     2021-04-26  840  		goto dbgtool_info_ffm_fail;
02b4d17a9ac62b denglei     2021-04-26  841  	}
02b4d17a9ac62b denglei     2021-04-26  842  
02b4d17a9ac62b denglei     2021-04-26  843  	sema_init(&dbgtool_info->dbgtool_sem, 1);
02b4d17a9ac62b denglei     2021-04-26  844  
02b4d17a9ac62b denglei     2021-04-26  845  	ret = sscanf(chip_info->chip_name, HIFC_CHIP_NAME "%d", &id);
02b4d17a9ac62b denglei     2021-04-26  846  	if (ret < 0) {
02b4d17a9ac62b denglei     2021-04-26  847  		pr_err("Failed to get hifc id\n");
02b4d17a9ac62b denglei     2021-04-26  848  		goto sscanf_chdev_fail;
02b4d17a9ac62b denglei     2021-04-26  849  	}
02b4d17a9ac62b denglei     2021-04-26  850  
02b4d17a9ac62b denglei     2021-04-26 @851  	g_card_node_array[id] = chip_info;
02b4d17a9ac62b denglei     2021-04-26  852  	chip_info->func_num++;
02b4d17a9ac62b denglei     2021-04-26  853  
02b4d17a9ac62b denglei     2021-04-26  854  	if (g_dbgtool_init_flag) {
02b4d17a9ac62b denglei     2021-04-26  855  		g_dbgtool_ref_cnt++;
02b4d17a9ac62b denglei     2021-04-26  856  		/* already initialized */
02b4d17a9ac62b denglei     2021-04-26  857  		return 0;
02b4d17a9ac62b denglei     2021-04-26  858  	}
02b4d17a9ac62b denglei     2021-04-26  859  
02b4d17a9ac62b denglei     2021-04-26  860  	ret = dbgtool_create_cdev();
02b4d17a9ac62b denglei     2021-04-26  861  	if (ret)
02b4d17a9ac62b denglei     2021-04-26  862  		goto alloc_chdev_fail;
02b4d17a9ac62b denglei     2021-04-26  863  
02b4d17a9ac62b denglei     2021-04-26  864  	g_dbgtool_init_flag = 1;
02b4d17a9ac62b denglei     2021-04-26  865  	g_dbgtool_ref_cnt = 1;
3d776c92130b1c zhoujiadong 2023-05-09  866  	mutex_init(&g_hifc_addr_lock);
02b4d17a9ac62b denglei     2021-04-26  867  
02b4d17a9ac62b denglei     2021-04-26  868  	return 0;
02b4d17a9ac62b denglei     2021-04-26  869  
02b4d17a9ac62b denglei     2021-04-26  870  alloc_chdev_fail:
02b4d17a9ac62b denglei     2021-04-26  871  	g_card_node_array[id] = NULL;
02b4d17a9ac62b denglei     2021-04-26  872  sscanf_chdev_fail:
02b4d17a9ac62b denglei     2021-04-26  873  	kfree(dbgtool_info->ffm);
02b4d17a9ac62b denglei     2021-04-26  874  dbgtool_info_ffm_fail:
02b4d17a9ac62b denglei     2021-04-26  875  	kfree(dbgtool_info);
02b4d17a9ac62b denglei     2021-04-26  876  	dbgtool_info = NULL;
02b4d17a9ac62b denglei     2021-04-26  877  	chip_info->dbgtool_info = NULL;
02b4d17a9ac62b denglei     2021-04-26  878  dbgtool_info_fail:
02b4d17a9ac62b denglei     2021-04-26  879  	hifc_comm_recv_up_self_cmd_unreg(hwdev, HIFC_SELF_CMD_UP2PF_FFM);
02b4d17a9ac62b denglei     2021-04-26  880  	chip_info->func_handle_array[hifc_global_func_id(hwdev)] = NULL;
02b4d17a9ac62b denglei     2021-04-26  881  	sysfs_remove_file(&((struct device *)(hwdev->dev_hdl))->kobj,
02b4d17a9ac62b denglei     2021-04-26  882  			  &chip_info->dbgtool_attr_file);
02b4d17a9ac62b denglei     2021-04-26 @883  	return ret;
02b4d17a9ac62b denglei     2021-04-26  884  }
02b4d17a9ac62b denglei     2021-04-26  885  
02b4d17a9ac62b denglei     2021-04-26  886  /**
3d776c92130b1c zhoujiadong 2023-05-09  887   * hifc_dbgtool_knl_deinit - dbgtool character device deinit
02b4d17a9ac62b denglei     2021-04-26  888   * @hwdev: the pointer to hardware device
02b4d17a9ac62b denglei     2021-04-26  889   * @chip_node: the pointer to card node
02b4d17a9ac62b denglei     2021-04-26  890   */
3d776c92130b1c zhoujiadong 2023-05-09  891  void hifc_dbgtool_knl_deinit(void *vhwdev, void *chip_node)
02b4d17a9ac62b denglei     2021-04-26  892  {
02b4d17a9ac62b denglei     2021-04-26  893  	struct dbgtool_k_glb_info *dbgtool_info;
02b4d17a9ac62b denglei     2021-04-26  894  	struct card_node *chip_info = (struct card_node *)chip_node;
02b4d17a9ac62b denglei     2021-04-26  895  	int id;
02b4d17a9ac62b denglei     2021-04-26  896  	int err;
02b4d17a9ac62b denglei     2021-04-26  897  	struct hifc_hwdev *hwdev = vhwdev;
02b4d17a9ac62b denglei     2021-04-26  898  
02b4d17a9ac62b denglei     2021-04-26  899  	if (hifc_func_type(hwdev) == TYPE_VF)
02b4d17a9ac62b denglei     2021-04-26  900  		return;
02b4d17a9ac62b denglei     2021-04-26  901  
02b4d17a9ac62b denglei     2021-04-26  902  	hifc_comm_recv_up_self_cmd_unreg(hwdev, HIFC_SELF_CMD_UP2PF_FFM);
02b4d17a9ac62b denglei     2021-04-26  903  
02b4d17a9ac62b denglei     2021-04-26  904  	chip_info->func_handle_array[hifc_global_func_id(hwdev)] = NULL;
02b4d17a9ac62b denglei     2021-04-26  905  
02b4d17a9ac62b denglei     2021-04-26  906  	sysfs_remove_file(&((struct device *)(hwdev->dev_hdl))->kobj,
02b4d17a9ac62b denglei     2021-04-26  907  			  &chip_info->dbgtool_attr_file);
02b4d17a9ac62b denglei     2021-04-26  908  
02b4d17a9ac62b denglei     2021-04-26  909  	chip_info->func_num--;
02b4d17a9ac62b denglei     2021-04-26  910  	if (chip_info->func_num)
02b4d17a9ac62b denglei     2021-04-26  911  		return;
02b4d17a9ac62b denglei     2021-04-26  912  
02b4d17a9ac62b denglei     2021-04-26  913  	err = sscanf(chip_info->chip_name, HIFC_CHIP_NAME "%d", &id);
02b4d17a9ac62b denglei     2021-04-26  914  	if (err < 0)
02b4d17a9ac62b denglei     2021-04-26  915  		pr_err("Failed to get hifc id\n");
02b4d17a9ac62b denglei     2021-04-26  916  
02b4d17a9ac62b denglei     2021-04-26 @917  	g_card_node_array[id] = NULL;
02b4d17a9ac62b denglei     2021-04-26  918  
02b4d17a9ac62b denglei     2021-04-26  919  	dbgtool_info = chip_info->dbgtool_info;
02b4d17a9ac62b denglei     2021-04-26  920  	/* FFM deinit */
02b4d17a9ac62b denglei     2021-04-26  921  	kfree(dbgtool_info->ffm);
02b4d17a9ac62b denglei     2021-04-26  922  	dbgtool_info->ffm = NULL;
02b4d17a9ac62b denglei     2021-04-26  923  
02b4d17a9ac62b denglei     2021-04-26  924  	kfree(dbgtool_info);
02b4d17a9ac62b denglei     2021-04-26  925  	chip_info->dbgtool_info = NULL;
02b4d17a9ac62b denglei     2021-04-26  926  
3d776c92130b1c zhoujiadong 2023-05-09  927  	(void)hifc_dbgtool_knl_free_mem(id);
02b4d17a9ac62b denglei     2021-04-26  928  
02b4d17a9ac62b denglei     2021-04-26  929  	if (g_dbgtool_init_flag) {
02b4d17a9ac62b denglei     2021-04-26  930  		if ((--g_dbgtool_ref_cnt))
02b4d17a9ac62b denglei     2021-04-26  931  			return;
02b4d17a9ac62b denglei     2021-04-26  932  	}
02b4d17a9ac62b denglei     2021-04-26  933  
02b4d17a9ac62b denglei     2021-04-26  934  	if (!dbgtool_d_class)
02b4d17a9ac62b denglei     2021-04-26  935  		return;
02b4d17a9ac62b denglei     2021-04-26  936  
02b4d17a9ac62b denglei     2021-04-26  937  	device_destroy(dbgtool_d_class, dbgtool_dev_id);
02b4d17a9ac62b denglei     2021-04-26  938  	class_destroy(dbgtool_d_class);
02b4d17a9ac62b denglei     2021-04-26  939  	dbgtool_d_class = NULL;
02b4d17a9ac62b denglei     2021-04-26  940  
02b4d17a9ac62b denglei     2021-04-26  941  	cdev_del(&(dbgtool_chr_dev));
02b4d17a9ac62b denglei     2021-04-26  942  	unregister_chrdev_region(dbgtool_dev_id, 1);
02b4d17a9ac62b denglei     2021-04-26  943  
02b4d17a9ac62b denglei     2021-04-26  944  	g_dbgtool_init_flag = 0;
02b4d17a9ac62b denglei     2021-04-26  945  }
02b4d17a9ac62b denglei     2021-04-26  946  

:::::: The code at line 851 was first introduced by commit
:::::: 02b4d17a9ac62b6d75e70a3d3bec5449bdeb30fa scsi/hifc: add port manager module of hifc driver

:::::: TO: denglei <denglei25@huawei.com>
:::::: CC: Zheng Zengkai <zhengzengkai@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
