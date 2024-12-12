Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD9220A5D1
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Dec 2024 07:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733987576; cv=none; b=uQ/XLTui1XW8tqdKP32HMUf7Sz8tNHAQM5u4NMwGbbRTUWmQOn9zFaqYDe6IIa+JNsbdSrFm028yHzf7iI+bZ+qnwyWhULiwbirrZtekYETRFvr9rmXMHijL9c1Um+icAz60KPNXidhZXXzqUDZO7eWyfsrUheosh8QNLJmEnNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733987576; c=relaxed/simple;
	bh=xO797+OqZO8NhVb8g63t6/JyhJCeKeK78Tue6QMTdXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dm7X6SwhI9+1a7IqvYqrDLkPxLOfe6lkAHEb850eMsTGXt3M7/XZGz+3Upbqyel4PRwTw2on+hK8QSqDiQw3L5em8daGXVGDc5IMegUx9pgGG7E6SQU0MecNocdDmLyVHvYUy1HFPVSb7PyIBV9aa2amq9Ek6KrlJOSHD1HOFRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CsAgOvKH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CsAgOvKH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733987575; x=1765523575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xO797+OqZO8NhVb8g63t6/JyhJCeKeK78Tue6QMTdXM=;
  b=CsAgOvKHlOVP7vSgNPIJWuUIGFJCrTMOp1WRMFLGBMyLJHKAPzkaiNQg
   Mcgy/8akU5LqLAukIcA6la3G74rV/fL+SZNefYyd9EMFpfLX1jWSnemIS
   mh1V8+hGS6+eGN9C0uRTMte8ZhNoXFhsWAZJPpC8k3ODQPJHrgufSIKHo
   hpZD2ukKBF14yJ1J1qDV2BgD7EWnVMvlOYY33Fj7UifZcH3YisyVW04T2
   ntfvi2mmX3lVYSQ+oPMXVlGVuoHFuP/8OObRvU6MeWEnFguaDIDZeNO08
   Gji0MJUJOTjnuTHe7WbCP3bWN3Gvqhx0jeSouMK1MNOh/zKTDVx6CT4ov
   Q==;
X-CSE-ConnectionGUID: TkmZRkT8TvGM7/01+ZBCww==
X-CSE-MsgGUID: CjkoQA6OTcCUAgx6VYZ8yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34518991"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="34518991"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 23:12:54 -0800
X-CSE-ConnectionGUID: 7O17zWzKQM6bG5OEwdlBMA==
X-CSE-MsgGUID: eC+nfikOQjuaL2jH1N9iGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100293299"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Dec 2024 23:12:52 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLdNR-0007Z1-0G;
	Thu, 12 Dec 2024 07:12:49 +0000
Date: Thu, 12 Dec 2024 15:11:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/nvmem/zynqmp_nvmem.c:123 zynqmp_efuse_access() error:
 uninitialized symbol 'ret'.
Message-ID: <202412121555.Fp663tyH-lkp@intel.com>
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
TO: Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   231825b2e1ff6ba799c5eaf396d3ab2354e37c6b
commit: 737c0c8d07b5f671c0a33cec95965fcb2d2ea893 nvmem: zynqmp_nvmem: Add support to access efuse
date:   9 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-r072-20241210 (https://download.01.org/0day-ci/archive/20241212/202412121555.Fp663tyH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412121555.Fp663tyH-lkp@intel.com/

smatch warnings:
drivers/nvmem/zynqmp_nvmem.c:123 zynqmp_efuse_access() error: uninitialized symbol 'ret'.

vim +/ret +123 drivers/nvmem/zynqmp_nvmem.c

737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   58  
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   59  static int zynqmp_efuse_access(void *context, unsigned int offset,
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   60  			       void *val, size_t bytes, enum efuse_access flag,
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   61  			       unsigned int pufflag)
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   62  {
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   63  	struct device *dev = context;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   64  	struct xilinx_efuse *efuse;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   65  	dma_addr_t dma_addr;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   66  	dma_addr_t dma_buf;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   67  	size_t words = bytes / WORD_INBYTES;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   68  	int ret;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   69  	int value;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   70  	char *data;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   71  
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   72  	if (bytes % WORD_INBYTES != 0) {
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   73  		dev_err(dev, "Bytes requested should be word aligned\n");
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   74  		return -EOPNOTSUPP;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   75  	}
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   76  
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   77  	if (pufflag == 0 && offset % WORD_INBYTES) {
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   78  		dev_err(dev, "Offset requested should be word aligned\n");
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   79  		return -EOPNOTSUPP;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   80  	}
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   81  
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   82  	if (pufflag == 1 && flag == EFUSE_WRITE) {
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   83  		memcpy(&value, val, bytes);
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   84  		if ((offset == EFUSE_PUF_START_OFFSET ||
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   85  		     offset == EFUSE_PUF_MID_OFFSET) &&
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   86  		    value & P_USER_0_64_UPPER_MASK) {
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   87  			dev_err(dev, "Only lower 4 bytes are allowed to be programmed in P_USER_0 & P_USER_64\n");
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   88  			return -EOPNOTSUPP;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   89  		}
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   90  
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   91  		if (offset == EFUSE_PUF_END_OFFSET &&
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   92  		    (value & P_USER_127_LOWER_4_BIT_MASK)) {
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   93  			dev_err(dev, "Only MSB 28 bits are allowed to be programmed for P_USER_127\n");
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   94  			return -EOPNOTSUPP;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   95  		}
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   96  	}
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   97  
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   98  	efuse = dma_alloc_coherent(dev, sizeof(struct xilinx_efuse),
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24   99  				   &dma_addr, GFP_KERNEL);
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  100  	if (!efuse)
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  101  		return -ENOMEM;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  102  
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  103  	data = dma_alloc_coherent(dev, sizeof(bytes),
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  104  				  &dma_buf, GFP_KERNEL);
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  105  	if (!data) {
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  106  		ret = -ENOMEM;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  107  		goto efuse_data_fail;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  108  	}
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  109  
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  110  	if (flag == EFUSE_WRITE) {
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  111  		memcpy(data, val, bytes);
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  112  		efuse->flag = EFUSE_WRITE;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  113  	} else {
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  114  		efuse->flag = EFUSE_READ;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  115  	}
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  116  
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  117  	efuse->src = dma_buf;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  118  	efuse->size = words;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  119  	efuse->offset = offset;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  120  	efuse->pufuserfuse = pufflag;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  121  
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  122  	zynqmp_pm_efuse_access(dma_addr, (u32 *)&ret);
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24 @123  	if (ret != 0) {
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  124  		if (ret == EFUSE_NOT_ENABLED) {
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  125  			dev_err(dev, "efuse access is not enabled\n");
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  126  			ret = -EOPNOTSUPP;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  127  		} else {
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  128  			dev_err(dev, "Error in efuse read %x\n", ret);
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  129  			ret = -EPERM;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  130  		}
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  131  		goto efuse_access_err;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  132  	}
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  133  
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  134  	if (flag == EFUSE_READ)
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  135  		memcpy(val, data, bytes);
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  136  efuse_access_err:
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  137  	dma_free_coherent(dev, sizeof(bytes),
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  138  			  data, dma_buf);
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  139  efuse_data_fail:
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  140  	dma_free_coherent(dev, sizeof(struct xilinx_efuse),
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  141  			  efuse, dma_addr);
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  142  
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  143  	return ret;
737c0c8d07b5f67 Praveen Teja Kundanala 2024-02-24  144  }
4640fa1833fe857 Nava kishore Manne     2019-02-06  145  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
