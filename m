Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4272230E84F
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 17:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765906648; cv=none; b=IocR/hYZvhb5nByUVLyZCmQHqsKClf60Wy00J3dpI9WfFsT48LTBxbxRnC9sWlaMyddG1xOmr4fRz5sxKmXLeSKbxXUm2Mtx370jhJ/oabRZYvTPHClMkqxcMXgpSXi+dt11A40W9rlNTYCTwtazh+sDYMyMbBwavZaz2/87CyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765906648; c=relaxed/simple;
	bh=RMeREwnvFhMlfRSoJI/DUj9Fy2H6b1TAbx5737h9v7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VQb4pyQiM6KJW/DsLWb3TGyN4CUl7pmTJLAPC+BofTAKenWAD+bbIacm8xu+DjJ/cDtLY9Ov8/L611zywZ9yy37yriUXk2YrBP/5WUaWhadm+TsiUyFYlKbDJYj94d+olwy5ysU1f0k3v1i9zyy+WjihcjQ2qunmvzdp5AqiNUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FGZj6uPf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FGZj6uPf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765906646; x=1797442646;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RMeREwnvFhMlfRSoJI/DUj9Fy2H6b1TAbx5737h9v7w=;
  b=FGZj6uPfw76Zjo7H/SWQkhvFEXZPXo3D8ghEEDd6pHPKWMBHuz4UuNum
   oybiWdYl7Rx6f4/BvI4osuLjtN4TazIz3/6N9QSY1ZdaMi4ivvwlZ2ngl
   nG6DiHQKfGcI43hIh2cYtloA3OPI1yQI0OhWnu6rcik2gKD5t3UzzeMZP
   PQInaulMqR9L9LBI6qcRh70vPIVlcWaCeRJJvykE7yxB5aqDWxastsTew
   9Bp55duyBfgSzA+f1j372RAwK9Ic5opRafIdBuoK9+5/k7AQk7tjbHZky
   M2E+eJb9q4KlbxP6rRW6761pFcO9y+3jl3rl6tk2YS+Vuowr2r/llYpGd
   Q==;
X-CSE-ConnectionGUID: S1+JYs4SR2yrShpL/JTiJA==
X-CSE-MsgGUID: fXPAE/lrSoivvzZ6VJLfeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78140031"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78140031"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 09:37:25 -0800
X-CSE-ConnectionGUID: SvrYFroTTM2+dXDg3LCtnQ==
X-CSE-MsgGUID: qsc5qZyeTGaP1hlGCFFgiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="198875219"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 16 Dec 2025 09:37:23 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVYzA-000000003ev-00oL;
	Tue, 16 Dec 2025 17:37:20 +0000
Date: Wed, 17 Dec 2025 01:36:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/nvme/target/pci-epf.c:1087:8-12: ERROR: reference preceded
 by free on line 1082
Message-ID: <202512170146.WfjrzWNF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Damien Le Moal <dlemoal@kernel.org>
CC: Keith Busch <kbusch@kernel.org>
CC: Christoph Hellwig <hch@lst.de>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: "Krzysztof Wilczyński" <kwilczynski@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
commit: 0faa0fe6f90ea59b10d1b0f15ce0eb0c18eff186 nvmet: New NVMe PCI endpoint function target driver
date:   11 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 11 months ago
config: sparc64-randconfig-r053-20251216 (https://download.01.org/0day-ci/archive/20251217/202512170146.WfjrzWNF-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512170146.WfjrzWNF-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/nvme/target/pci-epf.c:1087:8-12: ERROR: reference preceded by free on line 1082

vim +1087 drivers/nvme/target/pci-epf.c

0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1033  
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1034  static int nvmet_pci_epf_iod_parse_sgl_segments(struct nvmet_pci_epf_ctrl *ctrl,
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1035  						struct nvmet_pci_epf_iod *iod)
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1036  {
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1037  	struct nvme_command *cmd = &iod->cmd;
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1038  	struct nvme_sgl_desc seg = cmd->common.dptr.sgl;
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1039  	struct nvme_sgl_desc *sgls = NULL;
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1040  	int n = 0, i, nr_sgls;
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1041  	int ret;
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1042  
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1043  	/*
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1044  	 * We do not support inline data nor keyed SGLs, so we should be seeing
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1045  	 * only segment descriptors.
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1046  	 */
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1047  	if (seg.type != (NVME_SGL_FMT_SEG_DESC << 4) &&
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1048  	    seg.type != (NVME_SGL_FMT_LAST_SEG_DESC << 4)) {
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1049  		iod->status = NVME_SC_SGL_INVALID_TYPE | NVME_STATUS_DNR;
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1050  		return -EIO;
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1051  	}
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1052  
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1053  	while (seg.length) {
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1054  		sgls = nvmet_pci_epf_get_sgl_segment(ctrl, &seg, &nr_sgls);
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1055  		if (!sgls) {
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1056  			iod->status = NVME_SC_INTERNAL | NVME_STATUS_DNR;
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1057  			return -EIO;
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1058  		}
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1059  
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1060  		/* Grow the PCI segment table as needed. */
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1061  		ret = nvmet_pci_epf_alloc_iod_data_segs(iod, nr_sgls);
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1062  		if (ret) {
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1063  			iod->status = NVME_SC_INTERNAL | NVME_STATUS_DNR;
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1064  			goto out;
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1065  		}
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1066  
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1067  		/*
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1068  		 * Parse the SGL descriptors to build the PCI segment table,
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1069  		 * checking the descriptor type as we go.
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1070  		 */
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1071  		for (i = 0; i < nr_sgls; i++) {
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1072  			if (sgls[i].type != (NVME_SGL_FMT_DATA_DESC << 4)) {
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1073  				iod->status = NVME_SC_SGL_INVALID_TYPE |
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1074  					NVME_STATUS_DNR;
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1075  				goto out;
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1076  			}
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1077  			iod->data_segs[n].pci_addr = le64_to_cpu(sgls[i].addr);
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1078  			iod->data_segs[n].length = le32_to_cpu(sgls[i].length);
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1079  			n++;
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1080  		}
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1081  
0faa0fe6f90ea59 Damien Le Moal 2025-01-04 @1082  		kfree(sgls);
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1083  	}
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1084  
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1085   out:
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1086  	if (iod->status != NVME_SC_SUCCESS) {
0faa0fe6f90ea59 Damien Le Moal 2025-01-04 @1087  		kfree(sgls);
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1088  		return -EIO;
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1089  	}
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1090  
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1091  	return 0;
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1092  }
0faa0fe6f90ea59 Damien Le Moal 2025-01-04  1093  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
