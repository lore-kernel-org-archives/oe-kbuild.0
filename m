Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A22208D0
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Oct 2025 06:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760767816; cv=none; b=I0lbrw5FE6cSxGq7EDxO1z0TkiQVOLt74nYc2Fy0y2C6kDt9nJkOB9fv6sEhHSx8qP2qZgYxmGu3veYDVXLC/Sr5U9gzhrpslyZ2vATcQK+gvnuhulaI/u2FIzsoqx1Prcz7qlpzPM3w7mY/hwHEmeEHarHCObZ45JE+UIDZ1ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760767816; c=relaxed/simple;
	bh=ItKf4kZYuxxruC5mTcn10QpwdU9q8iNlFzx7fiE3Xbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F4iHY/3hs2KGqWXu7jjBjFxm2DjmBMQnnHrmyD4elJi5X1g5xmepZkY258EGs8UnsLDpjcbmnFQCNTXfJSPmuUrHaLlZ+ZA6t04ksY2EGp4j+sJjseRlU/YOdaLO3C6qF5qwaEkAlcUFBQYodrVPu2THMwqRSv53XqdRSgQ/e5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y4aK9weO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y4aK9weO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760767814; x=1792303814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ItKf4kZYuxxruC5mTcn10QpwdU9q8iNlFzx7fiE3Xbs=;
  b=Y4aK9weOv+n02GRWdJqjDtRZIAxx2P67O8gCwER7kV17xFNdQH0MZvp2
   YvI1ejxDNpytqX6IelWb2pii93Jlu49pAU0/g/3SY+kHMFH/O/WvuVyp8
   W1FoZU6PES5zPzbK7pvVww5rBfSEdgZIEkn2/WahzPxsEhWxkKy9Jro9p
   yBr3d2R6dB4pPaBSP8coDPn6nksobIXO5dQeINDUryUuvAg1NdjB9kl38
   DpF5r3qHDPigt65weh/vIQIfQs+gSD30Bvvxqpp5e/YZ+DlImEQIdZRqN
   BXkLhyxgfo5jH8/ODMywWcrL5XzklDFyWEzavzj+GTYEy6hWtnR/fa3CC
   g==;
X-CSE-ConnectionGUID: dRsLlg28TAmRp7qJ707fGw==
X-CSE-MsgGUID: uiGplNDvSNWylVpHtLVffQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="62013251"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="62013251"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 23:10:13 -0700
X-CSE-ConnectionGUID: re5RIWOaRGu2yr4vpg/+Xg==
X-CSE-MsgGUID: 1GaYApoYRSObkdqrTQ1PuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="182606904"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 17 Oct 2025 23:10:12 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA08o-00087B-0G;
	Sat, 18 Oct 2025 06:10:10 +0000
Date: Sat, 18 Oct 2025 14:09:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/ath/ath11k/qmi.c:2091
 ath11k_qmi_assign_target_mem_chunk() error: uninitialized symbol
 'host_ddr_sz'.
Message-ID: <202510181354.3yS6WCnb-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
CC: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f406055cb18c6e299c4a783fc1effeb16be41803
commit: 900730dc4705dc78f9bf69c4c513ec018bffee37 wifi: ath: Use of_reserved_mem_region_to_resource() for "memory-region"
date:   4 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-161-20251017 (https://download.01.org/0day-ci/archive/20251018/202510181354.3yS6WCnb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510181354.3yS6WCnb-lkp@intel.com/

smatch warnings:
drivers/net/wireless/ath/ath11k/qmi.c:2091 ath11k_qmi_assign_target_mem_chunk() error: uninitialized symbol 'host_ddr_sz'.

vim +/host_ddr_sz +2091 drivers/net/wireless/ath/ath11k/qmi.c

6eb6ea51382873 Govind Singh           2020-08-14  2039  
6eb6ea51382873 Govind Singh           2020-08-14  2040  static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
d5c65159f28953 Kalle Valo             2019-11-23  2041  {
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2042  	struct device *dev = ab->dev;
900730dc4705dc Rob Herring (Arm       2025-08-13  2043) 	struct resource res = {};
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2044  	u32 host_ddr_sz;
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2045  	int i, idx, ret;
d5c65159f28953 Kalle Valo             2019-11-23  2046  
d5c65159f28953 Kalle Valo             2019-11-23  2047  	for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
d5c65159f28953 Kalle Valo             2019-11-23  2048  		switch (ab->qmi.target_mem[i].type) {
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2049  		case HOST_DDR_REGION_TYPE:
900730dc4705dc Rob Herring (Arm       2025-08-13  2050) 			ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2051  			if (ret) {
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2052  				ath11k_dbg(ab, ATH11K_DBG_QMI,
fc3b984a7d99bc Kalle Valo             2023-06-09  2053  					   "fail to get reg from hremote\n");
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2054  				return ret;
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2055  			}
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2056  
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2057  			if (res.end - res.start + 1 < ab->qmi.target_mem[i].size) {
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2058  				ath11k_dbg(ab, ATH11K_DBG_QMI,
fc3b984a7d99bc Kalle Valo             2023-06-09  2059  					   "fail to assign memory of sz\n");
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2060  				return -EINVAL;
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2061  			}
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2062  
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2063  			ab->qmi.target_mem[idx].paddr = res.start;
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2064  			ab->qmi.target_mem[idx].iaddr =
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2065  				ioremap(ab->qmi.target_mem[idx].paddr,
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2066  					ab->qmi.target_mem[i].size);
16e0077e14a738 Jiasheng Jiang         2023-06-13  2067  			if (!ab->qmi.target_mem[idx].iaddr)
16e0077e14a738 Jiasheng Jiang         2023-06-13  2068  				return -EIO;
16e0077e14a738 Jiasheng Jiang         2023-06-13  2069  
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2070  			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2071  			host_ddr_sz = ab->qmi.target_mem[i].size;
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2072  			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2073  			idx++;
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2074  			break;
d5c65159f28953 Kalle Valo             2019-11-23  2075  		case BDF_MEM_REGION_TYPE:
3b94ae4c62db0b Anilkumar Kolli        2020-06-16  2076  			ab->qmi.target_mem[idx].paddr = ab->hw_params.bdf_addr;
9ee2578c343a2c Miaoqing Pan           2024-08-13  2077  			ab->qmi.target_mem[idx].iaddr = NULL;
d5c65159f28953 Kalle Valo             2019-11-23  2078  			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
d5c65159f28953 Kalle Valo             2019-11-23  2079  			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
d5c65159f28953 Kalle Valo             2019-11-23  2080  			idx++;
d5c65159f28953 Kalle Valo             2019-11-23  2081  			break;
d5c65159f28953 Kalle Valo             2019-11-23  2082  		case CALDB_MEM_REGION_TYPE:
d5c65159f28953 Kalle Valo             2019-11-23  2083  			if (ab->qmi.target_mem[i].size > ATH11K_QMI_CALDB_SIZE) {
d5c65159f28953 Kalle Valo             2019-11-23  2084  				ath11k_warn(ab, "qmi mem size is low to load caldata\n");
d5c65159f28953 Kalle Valo             2019-11-23  2085  				return -EINVAL;
d5c65159f28953 Kalle Valo             2019-11-23  2086  			}
02f9d3c1b918a6 Govindaraj Saminathan  2020-10-16  2087  
011e5a3052a22d Seevalamuthu Mariappan 2023-07-26  2088  			if (ath11k_core_coldboot_cal_support(ab)) {
900730dc4705dc Rob Herring (Arm       2025-08-13  2089) 				if (resource_size(&res)) {
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2090  					ab->qmi.target_mem[idx].paddr =
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14 @2091  							res.start + host_ddr_sz;
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2092  					ab->qmi.target_mem[idx].iaddr =
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2093  						ioremap(ab->qmi.target_mem[idx].paddr,
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2094  							ab->qmi.target_mem[i].size);
16e0077e14a738 Jiasheng Jiang         2023-06-13  2095  					if (!ab->qmi.target_mem[idx].iaddr)
16e0077e14a738 Jiasheng Jiang         2023-06-13  2096  						return -EIO;
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2097  				} else {
02f9d3c1b918a6 Govindaraj Saminathan  2020-10-16  2098  					ab->qmi.target_mem[idx].paddr =
02f9d3c1b918a6 Govindaraj Saminathan  2020-10-16  2099  						ATH11K_QMI_CALDB_ADDRESS;
9ee2578c343a2c Miaoqing Pan           2024-08-13  2100  					ab->qmi.target_mem[idx].iaddr = NULL;
6ac04bdc5edb41 Anilkumar Kolli        2021-12-14  2101  				}
02f9d3c1b918a6 Govindaraj Saminathan  2020-10-16  2102  			} else {
d5c65159f28953 Kalle Valo             2019-11-23  2103  				ab->qmi.target_mem[idx].paddr = 0;
9ee2578c343a2c Miaoqing Pan           2024-08-13  2104  				ab->qmi.target_mem[idx].iaddr = NULL;
02f9d3c1b918a6 Govindaraj Saminathan  2020-10-16  2105  			}
d5c65159f28953 Kalle Valo             2019-11-23  2106  			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
d5c65159f28953 Kalle Valo             2019-11-23  2107  			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
d5c65159f28953 Kalle Valo             2019-11-23  2108  			idx++;
d5c65159f28953 Kalle Valo             2019-11-23  2109  			break;
d5c65159f28953 Kalle Valo             2019-11-23  2110  		default:
d5c65159f28953 Kalle Valo             2019-11-23  2111  			ath11k_warn(ab, "qmi ignore invalid mem req type %d\n",
d5c65159f28953 Kalle Valo             2019-11-23  2112  				    ab->qmi.target_mem[i].type);
d5c65159f28953 Kalle Valo             2019-11-23  2113  			break;
d5c65159f28953 Kalle Valo             2019-11-23  2114  		}
d5c65159f28953 Kalle Valo             2019-11-23  2115  	}
d5c65159f28953 Kalle Valo             2019-11-23  2116  	ab->qmi.mem_seg_count = idx;
d5c65159f28953 Kalle Valo             2019-11-23  2117  
d5c65159f28953 Kalle Valo             2019-11-23  2118  	return 0;
d5c65159f28953 Kalle Valo             2019-11-23  2119  }
d5c65159f28953 Kalle Valo             2019-11-23  2120  

:::::: The code at line 2091 was first introduced by commit
:::::: 6ac04bdc5edb418787ab2040b1f922c23464c750 ath11k: Use reserved host DDR addresses from DT for PCI devices

:::::: TO: Anilkumar Kolli <akolli@codeaurora.org>
:::::: CC: Kalle Valo <quic_kvalo@quicinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
