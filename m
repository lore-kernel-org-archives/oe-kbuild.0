Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36B636A023
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Apr 2026 19:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776885501; cv=none; b=JPakQCimbjTPLeG5hw8bA5+DsyWtIoau1AHCfCHKe38gYXmBa8yE2S/fAnVCdGu4JevSdYmtyrldD1IFCpCaR78FeJVEBfBsn/i5/RAKEJVMunkk46xq0QCVLFBaQKz8fYkr0bOFiYrqiAhaoXBg0rgOunBK0XTs3QyMpYR87sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776885501; c=relaxed/simple;
	bh=6KiXugzwSgG0dSD+TxUy587JiwDJgP94/VXoLONZFks=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PPih1SD1JZkiJNtj8wwlJyoeEoZSHZVHuVxBJN6vEEKXzvKEtyNrzN0PHqK7xjuQFad95oPKS7ad+VRkOHm96qu90scbZhKUS1n3YVee6i4aEBR/eYh+bv/1yJ7uzyzqApjN1RL0oic5q949cvzUNf03MbvUZ5MJd0Sd51edI9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k8BG9cNq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k8BG9cNq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776885497; x=1808421497;
  h=date:from:to:cc:subject:message-id;
  bh=6KiXugzwSgG0dSD+TxUy587JiwDJgP94/VXoLONZFks=;
  b=k8BG9cNqZTQA6Lp+v0HpyeBRvidEaWqqxDKDkHTb41rsYYfn1cP3zDqi
   rFa+obQbWzJMyvtACGSzyMFf7QmPVuvenJHE3HzdfRz2LVNKbHFeih3Oo
   1Hv5oVxsezGKh1YF/rL4Mn8p5yJn6e9eEBthwhmnAq++H211+glca4BYD
   lmu83Fq3E3YCYEKDKBYg6nR3Cp8153qfPQWg2udXZujPV9OvyLLKrR3S2
   yivHZQSj9ddtfpek5JH0C2yp0D/pwbOvMWuvW9iJwHgPIogxX7nI5fi/W
   CrAoy5NfGt/gJBIwTMBScyf+wUBVvR97w12ZQq67JJ/4U51ZfuNRa45zU
   w==;
X-CSE-ConnectionGUID: LSjf6EBOTYWkw41ukzwARw==
X-CSE-MsgGUID: fpIO9JijRpak4smSxWaw+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77552060"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="77552060"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 12:18:10 -0700
X-CSE-ConnectionGUID: mVjL5HvgR/GiV7fNbl2p3g==
X-CSE-MsgGUID: vTtxTg5YShK6FQOWRzcY/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="231401536"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Apr 2026 12:18:08 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFd5J-000000000vl-46wE;
	Wed, 22 Apr 2026 19:18:06 +0000
Date: Thu, 23 Apr 2026 03:17:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android14-kiwi-6.1 77/77]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:11152:3-39:
 opportunity for str_enable_disable(handle -> kinfo . tc_info .
 dcb_ets_active)
Message-ID: <202604230329.XhyAWhO5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   e139836dbdcd7fda9d67c896dea11d89d0c5c491
commit: 9bd9afd55c523670fac649b393288d0430419c26 [77/77] net: hns3: fix invalid mutex between tc qdisc and dcb ets command issue
:::::: branch date: 15 hours ago
:::::: commit date: 2 years, 7 months ago
config: arm-randconfig-r063-20260422 (https://download.01.org/0day-ci/archive/20260423/202604230329.XhyAWhO5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202604230329.XhyAWhO5-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:7986:3-5: opportunity for str_enable_disable(en)
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:11152:3-39: opportunity for str_enable_disable(handle -> kinfo . tc_info . dcb_ets_active)
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:11154:3-38: opportunity for str_enable_disable(handle -> kinfo . tc_info . mqprio_active)
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:11800:7-13: opportunity for str_on_off(enable)
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:11808:7-13: opportunity for str_on_off(enable)

vim +11152 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c

46a3df9f9718541 Salil        2017-08-02  11132  
bb87be87b1658f7 Yonglong Liu 2019-04-19  11133  static void hclge_info_show(struct hclge_dev *hdev)
bb87be87b1658f7 Yonglong Liu 2019-04-19  11134  {
9bd9afd55c52367 Jijie Shao   2023-09-06  11135  	struct hnae3_handle *handle = &hdev->vport->nic;
bb87be87b1658f7 Yonglong Liu 2019-04-19  11136  	struct device *dev = &hdev->pdev->dev;
bb87be87b1658f7 Yonglong Liu 2019-04-19  11137  
bb87be87b1658f7 Yonglong Liu 2019-04-19  11138  	dev_info(dev, "PF info begin:\n");
bb87be87b1658f7 Yonglong Liu 2019-04-19  11139  
adcf738b804b3cf Guojia Liao  2019-10-31  11140  	dev_info(dev, "Task queue pairs numbers: %u\n", hdev->num_tqps);
adcf738b804b3cf Guojia Liao  2019-10-31  11141  	dev_info(dev, "Desc num per TX queue: %u\n", hdev->num_tx_desc);
adcf738b804b3cf Guojia Liao  2019-10-31  11142  	dev_info(dev, "Desc num per RX queue: %u\n", hdev->num_rx_desc);
adcf738b804b3cf Guojia Liao  2019-10-31  11143  	dev_info(dev, "Numbers of vports: %u\n", hdev->num_alloc_vport);
adcf738b804b3cf Guojia Liao  2019-10-31  11144  	dev_info(dev, "Numbers of VF for this PF: %u\n", hdev->num_req_vfs);
adcf738b804b3cf Guojia Liao  2019-10-31  11145  	dev_info(dev, "HW tc map: 0x%x\n", hdev->hw_tc_map);
adcf738b804b3cf Guojia Liao  2019-10-31  11146  	dev_info(dev, "Total buffer size for TX/RX: %u\n", hdev->pkt_buf_size);
adcf738b804b3cf Guojia Liao  2019-10-31  11147  	dev_info(dev, "TX buffer size for each TC: %u\n", hdev->tx_buf_size);
adcf738b804b3cf Guojia Liao  2019-10-31  11148  	dev_info(dev, "DV buffer size for each TC: %u\n", hdev->dv_buf_size);
bb87be87b1658f7 Yonglong Liu 2019-04-19  11149  	dev_info(dev, "This is %s PF\n",
bb87be87b1658f7 Yonglong Liu 2019-04-19  11150  		 hdev->flag & HCLGE_FLAG_MAIN ? "main" : "not main");
bb87be87b1658f7 Yonglong Liu 2019-04-19  11151  	dev_info(dev, "DCB %s\n",
9bd9afd55c52367 Jijie Shao   2023-09-06 @11152  		 handle->kinfo.tc_info.dcb_ets_active ? "enable" : "disable");
bb87be87b1658f7 Yonglong Liu 2019-04-19  11153  	dev_info(dev, "MQPRIO %s\n",
9bd9afd55c52367 Jijie Shao   2023-09-06 @11154  		 handle->kinfo.tc_info.mqprio_active ? "enable" : "disable");
1a00197b7d2fe57 Huazhong Tan 2021-06-16  11155  	dev_info(dev, "Default tx spare buffer size: %u\n",
1a00197b7d2fe57 Huazhong Tan 2021-06-16  11156  		 hdev->tx_spare_buf_size);
bb87be87b1658f7 Yonglong Liu 2019-04-19  11157  
bb87be87b1658f7 Yonglong Liu 2019-04-19  11158  	dev_info(dev, "PF info end.\n");
bb87be87b1658f7 Yonglong Liu 2019-04-19  11159  }
bb87be87b1658f7 Yonglong Liu 2019-04-19  11160  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
