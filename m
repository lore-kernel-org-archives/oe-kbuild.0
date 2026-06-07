Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038A217BED0
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jun 2026 07:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780816821; cv=none; b=ttypeSTf/L4j0A2nh7MNXjDZTc7gvSPJzZ3osMPjkaD2YLZDcVXMaKJi90R4oKz7vkjSmtx30hNQkC2vz4y7w2Esjsivm42S2KYcHGCXdky+TE0LclC1uaPp54fyUdIAXpwNho8bqk9DxfyR4oS/H+0s1GH/GUpy0MWmENwIK7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780816821; c=relaxed/simple;
	bh=HJTwI+/qPVRlxj9zTyRQgJIew25GZQkOmfpcQ3lpq6o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IWnSBvPJ1jObUx3iXKd04PFzFbllc+0ZEczYJb1hPyomqMb+pnAAvhL26CUp+qd+EN4Xr/sZmGuQAzIoO9uK23VS8+XXokjfqgkf7n+hSuCHheVIjsCOsyfBl3WzFeLJaPh9/Ho4i6XJxMgZ2+X7VPVudUd1B7OxdzoEZHbeNYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acR91+Es; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acR91+Es"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780816819; x=1812352819;
  h=date:from:to:cc:subject:message-id;
  bh=HJTwI+/qPVRlxj9zTyRQgJIew25GZQkOmfpcQ3lpq6o=;
  b=acR91+EsAFyNkwXcJd6VJlme05uF2xgcEr+WRkjcXm+2pV+duo4Adxzc
   QsNHSEx7f486XxiLxol55S9b0UaENhhjAFNEyyZfFT2YI1mew9A/IdMEy
   J1ZEv39jFNm04qa0VWTI/oD9OSrrIbVVA+MiZYQKKLIxZ5mY3uXiw0YxE
   +cit3H3rNv3fax+oRSbyQIgUmDUV2kuSC634dLBJMvY49mj2+J1Q95mub
   QY3ap7aBnBXVoKVGxXenlf+TkymXUdeopCtJM15BJ5+gM60qcs381YVMl
   QWHM5GCJNCnmnEPWOS6ruRl+3AI5vNDW3i9xpPFWHP3sqlgow9m7Af344
   Q==;
X-CSE-ConnectionGUID: ThdIcVKiQH6aXvIc8j3bbA==
X-CSE-MsgGUID: ZoL88y4sSlmd2lmtCmxnbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="93071331"
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="93071331"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 00:20:18 -0700
X-CSE-ConnectionGUID: YX3YeO8+RG65hrU/0lCUDw==
X-CSE-MsgGUID: HmKiOhMJRuKZS51HdNlFOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="268922630"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Jun 2026 00:20:17 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wW7nq-00000000Hh0-2UMn;
	Sun, 07 Jun 2026 07:20:14 +0000
Date: Sun, 07 Jun 2026 15:19:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: 
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c:1091
 hclge_dbg_dump_dcb_pri() warn: '0x' prefix is redundant when # flag is used
Message-ID: <202606071505.2tLNQh5g-lkp@intel.com>
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
head:   979c294509f9248fe1e7c358d582fb37dd5ca12d
commit: 2363145ad86e701481bbe884eeda5c35c9ac658c net: hns3: use seq_file for files in reg/ in debugfs
date:   11 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 11 months ago
config: powerpc64-randconfig-r073-20260607 (https://download.01.org/0day-ci/archive/20260607/202606071505.2tLNQh5g-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2363145ad86e ("net: hns3: use seq_file for files in reg/ in debugfs")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606071505.2tLNQh5g-lkp@intel.com/

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
