Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D87214A0B3
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Jan 2025 19:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736709587; cv=none; b=BAcXwpdC0HawdlXMqWy9LS3Z26lxmxkdjTDIwW+R3fbiLI49BgZDP+0KIahhoVVd4o2fJqQ9VDdQiUrphgAn7N66a+cg7UnP+CN3sFXSj7x1NOd5KWdeCuGS3+x6wHGnHfjoTJeH48aNeqUYDMo/4LECJRhrBMrIEt4XItBJbWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736709587; c=relaxed/simple;
	bh=2p3VFf5xnhTFEndKcq7UAjt3YpBnOz2SZ/+ptXul8qI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o0dePcrxAgxC80Ls7jd+ugT+cCRZyJ2tm3sXM9iATxvG27TXfnB8GchGvbLoe9NbBLwJEZ/Q5SJ+5RDjVKRe8j+ySIBKX0j0kqObZk6ewhdMAzioo7HyZNSpGOXh0+MobSQQOjCDxudloyDs2P/dRGqvfDGQ3ghKEIL/ny1CLkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4S27/cS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4S27/cS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736709585; x=1768245585;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2p3VFf5xnhTFEndKcq7UAjt3YpBnOz2SZ/+ptXul8qI=;
  b=P4S27/cS7I8tsdEYz2D9qYKIURE7dM+IPOLlInx+BqsIfHqjInnNAt5n
   fDADQ6s4kj4HXh4qShGCnEmAQTmx0psVSs5hdJAPCFhS7Ne3gYYeWfwE0
   8uF/MzqhLOay0sTIvJHjyO2yWiZYN1pw1S+y/e4fOAK6SFOe/p3fi3SLP
   ax1ZWcZR8HJURhmeyzOU+fvjE/1p2MXuSkUaegcdBxgOxV07HtUzmWEGo
   lD1Tgz/V4k8VrrUH8ILs5qgiwkIWIKnkWGHf/aJ2asZfMobO1F+2PMJFK
   S6wsITXA6aTheQjlngOy3kJKv4ZDS86oYG13QD+rXCqlULlj0ZsJi3U/2
   A==;
X-CSE-ConnectionGUID: 5nJ7D/oNQjCj+tQbJlTdBA==
X-CSE-MsgGUID: gzxm3gbHSduTodp5bc7CtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="37041290"
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="37041290"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 11:19:44 -0800
X-CSE-ConnectionGUID: HTwEdlwTQGqZ2PI2fx1fBw==
X-CSE-MsgGUID: aLxtqgYqRhW71zP80Duqmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104118432"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Jan 2025 11:19:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tX3Uq-000MK7-36;
	Sun, 12 Jan 2025 19:19:40 +0000
Date: Mon, 13 Jan 2025 03:19:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-nvme:nvme-6.14 21/35]
 drivers/nvme/target/pci-epf.c:1087:8-12: ERROR: reference preceded by free
 on line 1082
Message-ID: <202501130320.Zfh4k4Vk-lkp@intel.com>
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
CC: linux-nvme@lists.infradead.org
TO: Damien Le Moal <dlemoal@kernel.org>
CC: Keith Busch <kbusch@kernel.org>
CC: Christoph Hellwig <hch@lst.de>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: "Krzysztof Wilczyński" <kwilczynski@kernel.org>

tree:   git://git.infradead.org/nvme.git nvme-6.14
head:   6d84dae9af94be43bb71d24353aef102fd0744da
commit: 0faa0fe6f90ea59b10d1b0f15ce0eb0c18eff186 [21/35] nvmet: New NVMe PCI endpoint function target driver
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: mips-randconfig-r053-20250112 (https://download.01.org/0day-ci/archive/20250113/202501130320.Zfh4k4Vk-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501130320.Zfh4k4Vk-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/nvme/target/pci-epf.c:1087:8-12: ERROR: reference preceded by free on line 1082

vim +1087 drivers/nvme/target/pci-epf.c

0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1033  
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1034  static int nvmet_pci_epf_iod_parse_sgl_segments(struct nvmet_pci_epf_ctrl *ctrl,
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1035  						struct nvmet_pci_epf_iod *iod)
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1036  {
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1037  	struct nvme_command *cmd = &iod->cmd;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1038  	struct nvme_sgl_desc seg = cmd->common.dptr.sgl;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1039  	struct nvme_sgl_desc *sgls = NULL;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1040  	int n = 0, i, nr_sgls;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1041  	int ret;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1042  
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1043  	/*
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1044  	 * We do not support inline data nor keyed SGLs, so we should be seeing
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1045  	 * only segment descriptors.
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1046  	 */
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1047  	if (seg.type != (NVME_SGL_FMT_SEG_DESC << 4) &&
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1048  	    seg.type != (NVME_SGL_FMT_LAST_SEG_DESC << 4)) {
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1049  		iod->status = NVME_SC_SGL_INVALID_TYPE | NVME_STATUS_DNR;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1050  		return -EIO;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1051  	}
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1052  
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1053  	while (seg.length) {
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1054  		sgls = nvmet_pci_epf_get_sgl_segment(ctrl, &seg, &nr_sgls);
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1055  		if (!sgls) {
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1056  			iod->status = NVME_SC_INTERNAL | NVME_STATUS_DNR;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1057  			return -EIO;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1058  		}
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1059  
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1060  		/* Grow the PCI segment table as needed. */
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1061  		ret = nvmet_pci_epf_alloc_iod_data_segs(iod, nr_sgls);
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1062  		if (ret) {
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1063  			iod->status = NVME_SC_INTERNAL | NVME_STATUS_DNR;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1064  			goto out;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1065  		}
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1066  
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1067  		/*
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1068  		 * Parse the SGL descriptors to build the PCI segment table,
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1069  		 * checking the descriptor type as we go.
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1070  		 */
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1071  		for (i = 0; i < nr_sgls; i++) {
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1072  			if (sgls[i].type != (NVME_SGL_FMT_DATA_DESC << 4)) {
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1073  				iod->status = NVME_SC_SGL_INVALID_TYPE |
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1074  					NVME_STATUS_DNR;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1075  				goto out;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1076  			}
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1077  			iod->data_segs[n].pci_addr = le64_to_cpu(sgls[i].addr);
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1078  			iod->data_segs[n].length = le32_to_cpu(sgls[i].length);
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1079  			n++;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1080  		}
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1081  
0faa0fe6f90ea5 Damien Le Moal 2025-01-04 @1082  		kfree(sgls);
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1083  	}
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1084  
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1085   out:
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1086  	if (iod->status != NVME_SC_SUCCESS) {
0faa0fe6f90ea5 Damien Le Moal 2025-01-04 @1087  		kfree(sgls);
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1088  		return -EIO;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1089  	}
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1090  
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1091  	return 0;
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1092  }
0faa0fe6f90ea5 Damien Le Moal 2025-01-04  1093  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
