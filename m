Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2311917BC8
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jan 2024 04:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706676019; cv=none; b=OygLAonzxaOMzsXmm3ulO3Cf9L4H5+Y58w1TdHOAw0vOxXIL95Vj7nWySdsdxCr25LmfXrWgebpAp6NHu1T/aw1bZ8quYVNqW3UJgN06Ym1Ncsor/dvp7isW8CFcjM2JqskpjPSB6nthbznK1+m7lmcypfIBEsbo9+KYw3BtmuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706676019; c=relaxed/simple;
	bh=+gLYYn2J9GSqHbIF+crmHKSyl1weQC5hHvnMVy4ex/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZARxOyENUhC1ASOekvD7aU1YiS/X2xbMvOLR6pSjnkr+d1qytqSwQ/ND3KLX0tavzVBX/8LV1DcHHE/qN+Z+LKo4Qxluyg2eMCqNbKEGadp8tb25h35xdQygy+FEhSMII81JsFq5w9/MukLDiu6eILFo3ecmAO0svcTrroSyDLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BrVjEKvC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BrVjEKvC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706676016; x=1738212016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+gLYYn2J9GSqHbIF+crmHKSyl1weQC5hHvnMVy4ex/s=;
  b=BrVjEKvCM2JbUr9SIOD8svhgXPwY+phhOdIS3RU4uvFeMsITj0pCwq6h
   ZVvb4B2WeV/K5a8yi4m0eFybOTkL/uQqeRCxRmAOb8T8Kn4uR8qK5VBB+
   2oXUftkJj5OW4+YKT5vQn0pMW86363AJ8SxftoZGfHwFr7uIBfy57x3Eq
   iXmm4VfvIfV7r71nrYNsfJUmaHPhEulbBSAmsE961K1g14WXhGTkMjoE+
   JhjbYgv7VDGRGH3ZGUKipMO6ZbSruWqofPLCfDNRE8KrHAVnNIvlpk7Rn
   uw24AmLyeAifTOaiPzOyhBfJOWUX3RVypaNGwAvE9f9rhY6M8kWZmT8SH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="16869410"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="16869410"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 20:40:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="4029778"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 30 Jan 2024 20:40:15 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV2ON-00018u-2T;
	Wed, 31 Jan 2024 04:40:11 +0000
Date: Wed, 31 Jan 2024 12:39:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 22911/30000] drivers/misc/uacce/uacce.c:176
 uacce_get_ss_dma() warn: potential spectre issue 'slice' [r] (local cap)
Message-ID: <202401311235.Z1jKXdrf-lkp@intel.com>
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
TO: JiangShui <1175135535@qq.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   260c7a5874066269671cc826d6c9ccd70dd001e5
commit: 92e58150845a101fcbd0b563af66c10dbab742fb [22911/30000] uacce: add UACCE_MODE_NOIOMMU for warpdrive
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161-20240129 (https://download.01.org/0day-ci/archive/20240131/202401311235.Z1jKXdrf-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401311235.Z1jKXdrf-lkp@intel.com/

smatch warnings:
drivers/misc/uacce/uacce.c:176 uacce_get_ss_dma() warn: potential spectre issue 'slice' [r] (local cap)

vim +/slice +176 drivers/misc/uacce/uacce.c

92e58150845a10 Kai Ye 2023-05-22  141  
92e58150845a10 Kai Ye 2023-05-22  142  static long uacce_get_ss_dma(struct uacce_queue *q, void __user *arg)
92e58150845a10 Kai Ye 2023-05-22  143  {
92e58150845a10 Kai Ye 2023-05-22  144  	struct uacce_device *uacce = q->uacce;
92e58150845a10 Kai Ye 2023-05-22  145  	struct uacce_dma_slice *slice;
92e58150845a10 Kai Ye 2023-05-22  146  	unsigned long slice_idx = 0;
92e58150845a10 Kai Ye 2023-05-22  147  	unsigned long dma, size;
92e58150845a10 Kai Ye 2023-05-22  148  	unsigned int max_idx;
92e58150845a10 Kai Ye 2023-05-22  149  	long ret = -EFAULT;
92e58150845a10 Kai Ye 2023-05-22  150  
92e58150845a10 Kai Ye 2023-05-22  151  	if (q->state == UACCE_Q_ZOMBIE) {
92e58150845a10 Kai Ye 2023-05-22  152  		dev_err(&uacce->dev, "queue is zombie!\n");
92e58150845a10 Kai Ye 2023-05-22  153  		ret = -EINVAL;
92e58150845a10 Kai Ye 2023-05-22  154  		goto param_check;
92e58150845a10 Kai Ye 2023-05-22  155  	}
92e58150845a10 Kai Ye 2023-05-22  156  
92e58150845a10 Kai Ye 2023-05-22  157  	if (!q->qfrs[UACCE_QFRT_SS]) {
92e58150845a10 Kai Ye 2023-05-22  158  		dev_err(&uacce->dev, "no ss dma region!\n");
92e58150845a10 Kai Ye 2023-05-22  159  		ret = -EINVAL;
92e58150845a10 Kai Ye 2023-05-22  160  		goto param_check;
92e58150845a10 Kai Ye 2023-05-22  161  	}
92e58150845a10 Kai Ye 2023-05-22  162  
92e58150845a10 Kai Ye 2023-05-22  163  	slice = q->qfrs[UACCE_QFRT_SS]->dma_list;
92e58150845a10 Kai Ye 2023-05-22  164  	if (copy_from_user(&slice_idx, arg, sizeof(unsigned long))) {
92e58150845a10 Kai Ye 2023-05-22  165  		dev_err(&uacce->dev, "copy_from_user fail!\n");
92e58150845a10 Kai Ye 2023-05-22  166  		goto param_check;
92e58150845a10 Kai Ye 2023-05-22  167  	}
92e58150845a10 Kai Ye 2023-05-22  168  
92e58150845a10 Kai Ye 2023-05-22  169  	if (slice[0].total_num - 1 < slice_idx) {
92e58150845a10 Kai Ye 2023-05-22  170  		dev_err(&uacce->dev, "no ss slice idx %lu err, total %u!\n",
92e58150845a10 Kai Ye 2023-05-22  171  			slice_idx, slice[0].total_num);
92e58150845a10 Kai Ye 2023-05-22  172  		ret = -EINVAL;
92e58150845a10 Kai Ye 2023-05-22  173  		goto param_check;
92e58150845a10 Kai Ye 2023-05-22  174  	}
92e58150845a10 Kai Ye 2023-05-22  175  
92e58150845a10 Kai Ye 2023-05-22 @176  	dma = slice[slice_idx].dma;
92e58150845a10 Kai Ye 2023-05-22  177  	size = slice[slice_idx].size;
92e58150845a10 Kai Ye 2023-05-22  178  	if (!size) {
92e58150845a10 Kai Ye 2023-05-22  179  		max_idx = slice[0].total_num - 1;
92e58150845a10 Kai Ye 2023-05-22  180  		dev_err(&uacce->dev, "%luth ss region[0x%lx, %lu] no exist, range[[0](0x%llx, %llu) -> [%u](0x%llx, %llu)]\n",
92e58150845a10 Kai Ye 2023-05-22  181  			slice_idx, dma, size,
92e58150845a10 Kai Ye 2023-05-22  182  			slice[0].dma, slice[0].size, max_idx,
92e58150845a10 Kai Ye 2023-05-22  183  			slice[max_idx].dma, slice[max_idx].size);
92e58150845a10 Kai Ye 2023-05-22  184  		ret = -ENODEV;
92e58150845a10 Kai Ye 2023-05-22  185  		goto param_check;
92e58150845a10 Kai Ye 2023-05-22  186  	}
92e58150845a10 Kai Ye 2023-05-22  187  	dma = dma | ((size >> UACCE_GRAN_SHIFT) & UACCE_GRAN_NUM_MASK);
92e58150845a10 Kai Ye 2023-05-22  188  	if (copy_to_user(arg, &dma, sizeof(unsigned long))) {
92e58150845a10 Kai Ye 2023-05-22  189  		dev_err(&uacce->dev, "copy_to_user fail!\n");
92e58150845a10 Kai Ye 2023-05-22  190  		goto param_check;
92e58150845a10 Kai Ye 2023-05-22  191  	}
92e58150845a10 Kai Ye 2023-05-22  192  
92e58150845a10 Kai Ye 2023-05-22  193  	ret = (long)(slice[0].total_num - 1 - slice_idx);
92e58150845a10 Kai Ye 2023-05-22  194  
92e58150845a10 Kai Ye 2023-05-22  195  param_check:
92e58150845a10 Kai Ye 2023-05-22  196  	return ret;
92e58150845a10 Kai Ye 2023-05-22  197  }
92e58150845a10 Kai Ye 2023-05-22  198  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
