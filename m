Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F413346A9
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 07:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770708934; cv=none; b=WfXQuPjTu7BvQUMHt74QWe+azqtmn+Dz5qZ0gLnZRhMEVEggEmCYm3QuODPHbsje/TKPeZESM0nGQWZGB0iq7hC93BaiE81A3pLn/+IJR9yurCsCGW24l3RKIGx1sLTZLqKc5EGrj7uQUJi6H/1VWQzGWetU80OYaOhUo9qTfjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770708934; c=relaxed/simple;
	bh=mk6ptaQm+xL73+oxB3UzSzwZfIIpIIJ5qXoCLkE5B/s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SCSo/PHq1GJ/FbzUWggO/pn0XhllPcheA49M2iED8hBmgA4fV649BQobmzexS43YvgpXq4TJkzGeSM3K0tJ+16z8Q1qNPG2KaF5oily7WH2FZP71EU9hOHfqvmxFudzB4nr3tyervrpm/1X7fuS4HSg5m8Z0gSETKmFzQHAqYNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJ+DOWYq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJ+DOWYq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770708932; x=1802244932;
  h=date:from:to:cc:subject:message-id;
  bh=mk6ptaQm+xL73+oxB3UzSzwZfIIpIIJ5qXoCLkE5B/s=;
  b=hJ+DOWYqJWrE0M835aNDRkhUpTqvmYw7PfSL4xT3gnZ5VGm8ts1Ei2v6
   RHtbOADY2et5hUZ+IBcNrbiKyWOUWdDfLu1eOOcvZpZ35SWgfXnqV1VYV
   iRBIs88uKjIuCzBLsAE9pGqsVsS3FvVoCzeDQJUFt6kUAmCqPme+UMReX
   UmgjiUvxo9ycjf8unq2Jj3RHsWVq/bwoBVrMfa4BUxnzn6oAnTXnhMwmf
   Bh8kMqtUM5IpqXzlblwZnScgqUjcSBIR81Nsu/dKi7OI4xL9eatrBbdMD
   HsppWhyvCutZJ3FsycIpurw6ZKhlxAp+3lJKtDUkAzIFg4V8d/mE/cR/V
   A==;
X-CSE-ConnectionGUID: KqtomdsWTPWIJM1ogmj8LQ==
X-CSE-MsgGUID: +B2KjeKTSXyOGmkFBco7gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71901202"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71901202"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 23:35:30 -0800
X-CSE-ConnectionGUID: 0x0Pvv73RDuilJ1comuKgg==
X-CSE-MsgGUID: x72JCzcxS6GevJC6uFi6Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216012385"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Feb 2026 23:35:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpiHO-00000000omO-3cj3;
	Tue, 10 Feb 2026 07:35:26 +0000
Date: Tue, 10 Feb 2026 15:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: 
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c:1091
 hclge_dbg_dump_dcb_pri() warn: '0x' prefix is redundant when # flag is used
Message-ID: <202602101515.O0lYdvbg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jijie Shao <shaojijie@huawei.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72c395024dac5e215136cbff793455f065603b06
commit: 2363145ad86e701481bbe884eeda5c35c9ac658c net: hns3: use seq_file for files in reg/ in debugfs
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-r071-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101515.O0lYdvbg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602101515.O0lYdvbg-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c:1091 hclge_dbg_dump_dcb_pri() warn: '0x' prefix is redundant when # flag is used

vim +/0x +1091 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c

365e860aa7a74a Yufeng Mo   2021-05-20  1069  
2363145ad86e70 Jijie Shao  2025-07-14  1070  static int hclge_dbg_dump_dcb_pri(struct hclge_dev *hdev, struct seq_file *s)
365e860aa7a74a Yufeng Mo   2021-05-20  1071  {
2a21dab594a98c Jie Wang    2021-10-27  1072  	struct hclge_dbg_bitmap_cmd req;
365e860aa7a74a Yufeng Mo   2021-05-20  1073  	struct hclge_desc desc;
365e860aa7a74a Yufeng Mo   2021-05-20  1074  	u8 pri_id, pri_num;
365e860aa7a74a Yufeng Mo   2021-05-20  1075  	int ret;
365e860aa7a74a Yufeng Mo   2021-05-20  1076  
365e860aa7a74a Yufeng Mo   2021-05-20  1077  	ret = hclge_tm_get_pri_num(hdev, &pri_num);
365e860aa7a74a Yufeng Mo   2021-05-20  1078  	if (ret)
365e860aa7a74a Yufeng Mo   2021-05-20  1079  		return ret;
365e860aa7a74a Yufeng Mo   2021-05-20  1080  
2363145ad86e70 Jijie Shao  2025-07-14  1081  	seq_puts(s, "pri_id  pri_mask  pri_cshaping_pass  pri_pshaping_pass\n");
365e860aa7a74a Yufeng Mo   2021-05-20  1082  	for (pri_id = 0; pri_id < pri_num; pri_id++) {
365e860aa7a74a Yufeng Mo   2021-05-20  1083  		ret = hclge_dbg_cmd_send(hdev, &desc, pri_id, 1,
365e860aa7a74a Yufeng Mo   2021-05-20  1084  					 HCLGE_OPC_PRI_DFX_STS);
365e860aa7a74a Yufeng Mo   2021-05-20  1085  		if (ret)
365e860aa7a74a Yufeng Mo   2021-05-20  1086  			return ret;
365e860aa7a74a Yufeng Mo   2021-05-20  1087  
2a21dab594a98c Jie Wang    2021-10-27  1088  		req.bitmap = (u8)le32_to_cpu(desc.data[1]);
365e860aa7a74a Yufeng Mo   2021-05-20  1089  
2363145ad86e70 Jijie Shao  2025-07-14  1090  		seq_printf(s, "%03u     %#-10x%#-19x%#-x\n",
2a21dab594a98c Jie Wang    2021-10-27 @1091  			   pri_id, req.bit0, req.bit1, req.bit2);
c0ebebb9ccc136 liuzhongzhu 2018-12-15  1092  	}
c0ebebb9ccc136 liuzhongzhu 2018-12-15  1093  
365e860aa7a74a Yufeng Mo   2021-05-20  1094  	return 0;
365e860aa7a74a Yufeng Mo   2021-05-20  1095  }
365e860aa7a74a Yufeng Mo   2021-05-20  1096  

:::::: The code at line 1091 was first introduced by commit
:::::: 2a21dab594a98c338c4bfbc31864cbca15888549 net: hns3: fix data endian problem of some functions of debugfs

:::::: TO: Jie Wang <wangjie125@huawei.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
