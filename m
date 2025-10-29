Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA75F29CF5
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761750730; cv=none; b=BEkU0npc79ERupZj2eI0M2Tb73Rg9izDAN/VgtRrrh3H4ng1Y/CxQFmG/puP1X0vk0siK9unoE9svLxhQXWEmJS+cBm7pK+GrQ/eI0POtrmPwk8TNN5wKnJIXPhBOvQ3wqisT84pHg9HTvXxlHsx0tmdpNAAvN9+AhzmE23EjVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761750730; c=relaxed/simple;
	bh=8976CCtyd+0xBJYoPhUMl8cbdp5kREZAasgtln35xLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pSUvxgzcZg7QPrVgf+yzFEwkOrK7VjcSSuScobzwk0Mkd6mW3hxHDV6PrPGUdyiKnfFnX1jlmI0yXWeyfz8/KvgMTdpNNyDuc/1fjFg97R43tLNNG1niEffBy9aoF9oqresKZAgiCUEP8n7KgHq3wfo40YczfNbrPL//tEYbEDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3kBLjBx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3kBLjBx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761750729; x=1793286729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8976CCtyd+0xBJYoPhUMl8cbdp5kREZAasgtln35xLY=;
  b=C3kBLjBxLkr4+WOIlreZh93WOxG1OvUX/0pRbEUZHUDqSM3oEAHrZS0I
   BD3PHcASMper/RAaUZ83gKI6/MIFIDWeOEUMum0TPV2WK98QGFcJsV6ji
   5xSuG/Iu+mCPeUHLs0WtmAPGF2Nk1YOLN8hfB0HmZVm5LLEJQk8je5qja
   +sCgKderVKoRN519u0Zo6PMxob/gX5BFaY4YDEt0OipYJ3AhMKSsdV8Vd
   Xw5DiDIXCEYQseEqr/hpMlKlNl1iIj9J1W2IeoUyelSpsVOIkFniaS6GL
   pVsUSVeAoIO21/VY6VFJcPWSeFS8FoFhykR0WKWGO/xkyH/myOPAoBehh
   g==;
X-CSE-ConnectionGUID: oE8wpa0cRseQOT8eWlKsnw==
X-CSE-MsgGUID: U3+v3bV4SmS9gRncRuTLUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="89343642"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="89343642"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:12:08 -0700
X-CSE-ConnectionGUID: hLimqL7/TFKDk4BZmSp1Nw==
X-CSE-MsgGUID: 0sLLCl6QQ8GMsubaaUUptw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="185390049"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 29 Oct 2025 08:12:07 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE7nP-000KiD-2y;
	Wed, 29 Oct 2025 15:10:57 +0000
Date: Wed, 29 Oct 2025 23:08:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c:1091
 hclge_dbg_dump_dcb_pri() warn: '0x' prefix is redundant when # flag is used
Message-ID: <202510292210.tyVS9Ffu-lkp@intel.com>
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
TO: Jijie Shao <shaojijie@huawei.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
commit: 2363145ad86e701481bbe884eeda5c35c9ac658c net: hns3: use seq_file for files in reg/ in debugfs
date:   4 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r071-20251028 (https://download.01.org/0day-ci/archive/20251029/202510292210.tyVS9Ffu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510292210.tyVS9Ffu-lkp@intel.com/

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
