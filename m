Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9703B8BEF
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Apr 2023 14:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682000032; x=1713536032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6g2WvLlDHro799aN4m1SkO2DDrIlSf646/v5IAyxZks=;
  b=lnJu8CU+q/pAGiN7hffhd3QIw8YB8ldMDyaDE9axEzOJUKtu3iplLm4C
   XqMmaxdvVIgX+vvaObOEfvjyYNWweBrCg3XtehINXiDq2ZFweQNxsgwji
   qXJ/Z7ovDq9vDny1zevLHmM9dvJE7z9tNarIIsDd6I8nWe8oWqhXmkhzP
   O7CXyNyBV39pTTA1/K5jxtZaPQ6SeRo506AwlrintboYzIpTreonPjsHH
   qDdglSuQiQ4lDn1FueDwyAMkNeXxPZB5pLqBOXzmJ3DlzZ/5KxB0l/IsT
   6vUDPd589Euo+4q9IVxAh+fbHTJbqUPYAOJ3Lhqtjx6wp5bTOyyUIkK7l
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="345752632"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="345752632"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 07:13:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="781251033"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="781251033"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Apr 2023 07:13:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppV2c-000fsE-0t;
	Thu, 20 Apr 2023 14:13:42 +0000
Date: Thu, 20 Apr 2023 22:13:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/soc/qcom/rmtfs_mem.c:233 qcom_rmtfs_mem_probe() warn:
 missing error code 'ret'
Message-ID: <202304202258.rstUALtF-lkp@intel.com>
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
TO: Loic Poulain <loic.poulain@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb0856346a60fe3eb837ba5e73588a41f81ac05f
commit: e656cd0bcf3d2ba2eceac82b44714bf355428ec4 soc: qcom: rmtfs: Optionally map RMTFS to more VMs
date:   3 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-m041-20230419 (https://download.01.org/0day-ci/archive/20230420/202304202258.rstUALtF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304202258.rstUALtF-lkp@intel.com/

New smatch warnings:
drivers/soc/qcom/rmtfs_mem.c:233 qcom_rmtfs_mem_probe() warn: missing error code 'ret'

Old smatch warnings:
drivers/soc/qcom/rmtfs_mem.c:231 qcom_rmtfs_mem_probe() warn: unsigned 'num_vmids' is never less than zero.

vim +/ret +233 drivers/soc/qcom/rmtfs_mem.c

d1de6d6c639b78 Bjorn Andersson 2017-10-16  171  
d1de6d6c639b78 Bjorn Andersson 2017-10-16  172  static int qcom_rmtfs_mem_probe(struct platform_device *pdev)
d1de6d6c639b78 Bjorn Andersson 2017-10-16  173  {
d1de6d6c639b78 Bjorn Andersson 2017-10-16  174  	struct device_node *node = pdev->dev.of_node;
e656cd0bcf3d2b Loic Poulain    2023-01-09  175  	struct qcom_scm_vmperm perms[NUM_MAX_VMIDS + 1];
d1de6d6c639b78 Bjorn Andersson 2017-10-16  176  	struct reserved_mem *rmem;
d1de6d6c639b78 Bjorn Andersson 2017-10-16  177  	struct qcom_rmtfs_mem *rmtfs_mem;
d1de6d6c639b78 Bjorn Andersson 2017-10-16  178  	u32 client_id;
e656cd0bcf3d2b Loic Poulain    2023-01-09  179  	u32 num_vmids, vmid[NUM_MAX_VMIDS];
e656cd0bcf3d2b Loic Poulain    2023-01-09  180  	int ret, i;
d1de6d6c639b78 Bjorn Andersson 2017-10-16  181  
d1de6d6c639b78 Bjorn Andersson 2017-10-16  182  	rmem = of_reserved_mem_lookup(node);
d1de6d6c639b78 Bjorn Andersson 2017-10-16  183  	if (!rmem) {
d1de6d6c639b78 Bjorn Andersson 2017-10-16  184  		dev_err(&pdev->dev, "failed to acquire memory region\n");
d1de6d6c639b78 Bjorn Andersson 2017-10-16  185  		return -EINVAL;
d1de6d6c639b78 Bjorn Andersson 2017-10-16  186  	}
d1de6d6c639b78 Bjorn Andersson 2017-10-16  187  
d1de6d6c639b78 Bjorn Andersson 2017-10-16  188  	ret = of_property_read_u32(node, "qcom,client-id", &client_id);
d1de6d6c639b78 Bjorn Andersson 2017-10-16  189  	if (ret) {
d1de6d6c639b78 Bjorn Andersson 2017-10-16  190  		dev_err(&pdev->dev, "failed to parse \"qcom,client-id\"\n");
d1de6d6c639b78 Bjorn Andersson 2017-10-16  191  		return ret;
d1de6d6c639b78 Bjorn Andersson 2017-10-16  192  
d1de6d6c639b78 Bjorn Andersson 2017-10-16  193  	}
d1de6d6c639b78 Bjorn Andersson 2017-10-16  194  
d1de6d6c639b78 Bjorn Andersson 2017-10-16  195  	rmtfs_mem = kzalloc(sizeof(*rmtfs_mem), GFP_KERNEL);
d1de6d6c639b78 Bjorn Andersson 2017-10-16  196  	if (!rmtfs_mem)
d1de6d6c639b78 Bjorn Andersson 2017-10-16  197  		return -ENOMEM;
d1de6d6c639b78 Bjorn Andersson 2017-10-16  198  
d1de6d6c639b78 Bjorn Andersson 2017-10-16  199  	rmtfs_mem->addr = rmem->base;
d1de6d6c639b78 Bjorn Andersson 2017-10-16  200  	rmtfs_mem->client_id = client_id;
d1de6d6c639b78 Bjorn Andersson 2017-10-16  201  	rmtfs_mem->size = rmem->size;
d1de6d6c639b78 Bjorn Andersson 2017-10-16  202  
d1de6d6c639b78 Bjorn Andersson 2017-10-16  203  	device_initialize(&rmtfs_mem->dev);
d1de6d6c639b78 Bjorn Andersson 2017-10-16  204  	rmtfs_mem->dev.parent = &pdev->dev;
d1de6d6c639b78 Bjorn Andersson 2017-10-16  205  	rmtfs_mem->dev.groups = qcom_rmtfs_mem_groups;
78ee559d7fc65e Johan Hovold    2018-06-12  206  	rmtfs_mem->dev.release = qcom_rmtfs_mem_release_device;
d1de6d6c639b78 Bjorn Andersson 2017-10-16  207  
d1de6d6c639b78 Bjorn Andersson 2017-10-16  208  	rmtfs_mem->base = devm_memremap(&rmtfs_mem->dev, rmtfs_mem->addr,
d1de6d6c639b78 Bjorn Andersson 2017-10-16  209  					rmtfs_mem->size, MEMREMAP_WC);
d1de6d6c639b78 Bjorn Andersson 2017-10-16  210  	if (IS_ERR(rmtfs_mem->base)) {
d1de6d6c639b78 Bjorn Andersson 2017-10-16  211  		dev_err(&pdev->dev, "failed to remap rmtfs_mem region\n");
d1de6d6c639b78 Bjorn Andersson 2017-10-16  212  		ret = PTR_ERR(rmtfs_mem->base);
d1de6d6c639b78 Bjorn Andersson 2017-10-16  213  		goto put_device;
d1de6d6c639b78 Bjorn Andersson 2017-10-16  214  	}
d1de6d6c639b78 Bjorn Andersson 2017-10-16  215  
d1de6d6c639b78 Bjorn Andersson 2017-10-16  216  	cdev_init(&rmtfs_mem->cdev, &qcom_rmtfs_mem_fops);
d1de6d6c639b78 Bjorn Andersson 2017-10-16  217  	rmtfs_mem->cdev.owner = THIS_MODULE;
d1de6d6c639b78 Bjorn Andersson 2017-10-16  218  
d1de6d6c639b78 Bjorn Andersson 2017-10-16  219  	dev_set_name(&rmtfs_mem->dev, "qcom_rmtfs_mem%d", client_id);
d1de6d6c639b78 Bjorn Andersson 2017-10-16  220  	rmtfs_mem->dev.id = client_id;
b4aa93bca91318 Evan Green      2019-01-02  221  	rmtfs_mem->dev.class = &rmtfs_class;
d1de6d6c639b78 Bjorn Andersson 2017-10-16  222  	rmtfs_mem->dev.devt = MKDEV(MAJOR(qcom_rmtfs_mem_major), client_id);
d1de6d6c639b78 Bjorn Andersson 2017-10-16  223  
d1de6d6c639b78 Bjorn Andersson 2017-10-16  224  	ret = cdev_device_add(&rmtfs_mem->cdev, &rmtfs_mem->dev);
d1de6d6c639b78 Bjorn Andersson 2017-10-16  225  	if (ret) {
d1de6d6c639b78 Bjorn Andersson 2017-10-16  226  		dev_err(&pdev->dev, "failed to add cdev: %d\n", ret);
d1de6d6c639b78 Bjorn Andersson 2017-10-16  227  		goto put_device;
d1de6d6c639b78 Bjorn Andersson 2017-10-16  228  	}
d1de6d6c639b78 Bjorn Andersson 2017-10-16  229  
e656cd0bcf3d2b Loic Poulain    2023-01-09  230  	num_vmids = of_property_count_u32_elems(node, "qcom,vmid");
e656cd0bcf3d2b Loic Poulain    2023-01-09  231  	if (num_vmids < 0) {
e656cd0bcf3d2b Loic Poulain    2023-01-09  232  		dev_err(&pdev->dev, "failed to count qcom,vmid elements: %d\n", ret);
e656cd0bcf3d2b Loic Poulain    2023-01-09 @233  		goto remove_cdev;
e656cd0bcf3d2b Loic Poulain    2023-01-09  234  	} else if (num_vmids > NUM_MAX_VMIDS) {
e656cd0bcf3d2b Loic Poulain    2023-01-09  235  		dev_warn(&pdev->dev,
e656cd0bcf3d2b Loic Poulain    2023-01-09  236  			 "too many VMIDs (%d) specified! Only mapping first %d entries\n",
e656cd0bcf3d2b Loic Poulain    2023-01-09  237  			 num_vmids, NUM_MAX_VMIDS);
e656cd0bcf3d2b Loic Poulain    2023-01-09  238  		num_vmids = NUM_MAX_VMIDS;
e656cd0bcf3d2b Loic Poulain    2023-01-09  239  	}
e656cd0bcf3d2b Loic Poulain    2023-01-09  240  
e656cd0bcf3d2b Loic Poulain    2023-01-09  241  	ret = of_property_read_u32_array(node, "qcom,vmid", vmid, num_vmids);
fa65f8045137d0 Bjorn Andersson 2018-02-12  242  	if (ret < 0 && ret != -EINVAL) {
fa65f8045137d0 Bjorn Andersson 2018-02-12  243  		dev_err(&pdev->dev, "failed to parse qcom,vmid\n");
fa65f8045137d0 Bjorn Andersson 2018-02-12  244  		goto remove_cdev;
fa65f8045137d0 Bjorn Andersson 2018-02-12  245  	} else if (!ret) {
137dc5843faeac Bjorn Andersson 2018-08-27  246  		if (!qcom_scm_is_available()) {
137dc5843faeac Bjorn Andersson 2018-08-27  247  			ret = -EPROBE_DEFER;
137dc5843faeac Bjorn Andersson 2018-08-27  248  			goto remove_cdev;
137dc5843faeac Bjorn Andersson 2018-08-27  249  		}
137dc5843faeac Bjorn Andersson 2018-08-27  250  
fa65f8045137d0 Bjorn Andersson 2018-02-12  251  		perms[0].vmid = QCOM_SCM_VMID_HLOS;
fa65f8045137d0 Bjorn Andersson 2018-02-12  252  		perms[0].perm = QCOM_SCM_PERM_RW;
e656cd0bcf3d2b Loic Poulain    2023-01-09  253  
e656cd0bcf3d2b Loic Poulain    2023-01-09  254  		for (i = 0; i < num_vmids; i++) {
e656cd0bcf3d2b Loic Poulain    2023-01-09  255  			perms[i + 1].vmid = vmid[i];
e656cd0bcf3d2b Loic Poulain    2023-01-09  256  			perms[i + 1].perm = QCOM_SCM_PERM_RW;
e656cd0bcf3d2b Loic Poulain    2023-01-09  257  		}
fa65f8045137d0 Bjorn Andersson 2018-02-12  258  
fa65f8045137d0 Bjorn Andersson 2018-02-12  259  		rmtfs_mem->perms = BIT(QCOM_SCM_VMID_HLOS);
fa65f8045137d0 Bjorn Andersson 2018-02-12  260  		ret = qcom_scm_assign_mem(rmtfs_mem->addr, rmtfs_mem->size,
e656cd0bcf3d2b Loic Poulain    2023-01-09  261  					  &rmtfs_mem->perms, perms, num_vmids + 1);
fa65f8045137d0 Bjorn Andersson 2018-02-12  262  		if (ret < 0) {
fa65f8045137d0 Bjorn Andersson 2018-02-12  263  			dev_err(&pdev->dev, "assign memory failed\n");
fa65f8045137d0 Bjorn Andersson 2018-02-12  264  			goto remove_cdev;
fa65f8045137d0 Bjorn Andersson 2018-02-12  265  		}
fa65f8045137d0 Bjorn Andersson 2018-02-12  266  	}
fa65f8045137d0 Bjorn Andersson 2018-02-12  267  
d1de6d6c639b78 Bjorn Andersson 2017-10-16  268  	dev_set_drvdata(&pdev->dev, rmtfs_mem);
d1de6d6c639b78 Bjorn Andersson 2017-10-16  269  
d1de6d6c639b78 Bjorn Andersson 2017-10-16  270  	return 0;
d1de6d6c639b78 Bjorn Andersson 2017-10-16  271  
fa65f8045137d0 Bjorn Andersson 2018-02-12  272  remove_cdev:
fa65f8045137d0 Bjorn Andersson 2018-02-12  273  	cdev_device_del(&rmtfs_mem->cdev, &rmtfs_mem->dev);
d1de6d6c639b78 Bjorn Andersson 2017-10-16  274  put_device:
d1de6d6c639b78 Bjorn Andersson 2017-10-16  275  	put_device(&rmtfs_mem->dev);
d1de6d6c639b78 Bjorn Andersson 2017-10-16  276  
d1de6d6c639b78 Bjorn Andersson 2017-10-16  277  	return ret;
d1de6d6c639b78 Bjorn Andersson 2017-10-16  278  }
d1de6d6c639b78 Bjorn Andersson 2017-10-16  279  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
