Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A621E880
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Feb 2024 21:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708204850; cv=none; b=AVDftmxeQYyfzqPFhh1fqHC+Aku0w8KBnXTIkQDSFMSAD67+a/hVMzNZGQ/EmS4Y81bir5JKuSeYs0xRAsOgGjFDVF8HiZII/P4qk4IfIHqwW1oLr7ffjH5h9FUGdDmAy6qT5NmABV8qQ7uwl7BSZH6AktCHP1wtXmUzTqL7yFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708204850; c=relaxed/simple;
	bh=jRjP5OnOWNN07UdpqXoGxEk+o1oMDRopoX6Z4P85SPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p41nd7jVx0Gezk5xAVh+dMWTDpyfAspCyWO0w4e6BpD2evz8qc7W8w86aKOQtgbcVe6fiP+8Fk0fu670/34Kr2nlMH5p8FssO/UTEEtgNTzfdQfIbROolg2nkqIzl1kxxRaJJH4hzCM/JOn0tI5JeRt/OrcVfV7H50OEZC7f0aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VgMI72OJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VgMI72OJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708204848; x=1739740848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jRjP5OnOWNN07UdpqXoGxEk+o1oMDRopoX6Z4P85SPs=;
  b=VgMI72OJeWPf5ogaQNRISzJo3XPE4U8m4jdUc2m8BRN9IWF7uPlK2kHi
   qTXIK8Sjpe8nIxwTAfXmCo2AJWGWKbSQ8VEJKftk/P/w24qnH8bR2mQhU
   brKY1PqK+4Tcj+ogQGm9vbrThWFOmcWP35kNv1N3p67j7ljjdsAHLEuih
   QnEEzu76ipRXvAiUjNnKXKcyLIe90aEKfGwoTwbVkxGHEUBkVMBNaOkaH
   SQ1DzC7/bPuL5FcZNFLswTSlL9R647e7OSwpOoeEuOF+Kdtu/ZAAm7Kgm
   gH2rM+k19jn/GwuSWg7YgDaux0Y3sxIizimBQ0a/hdLOZhUtigyXttV82
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="19841089"
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="19841089"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 13:20:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="4043454"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 17 Feb 2024 13:20:46 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbS72-0002Vi-03;
	Sat, 17 Feb 2024 21:20:44 +0000
Date: Sun, 18 Feb 2024 05:20:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6663/7658] drivers/nvmem/zynqmp_nvmem.c:123
 zynqmp_efuse_access() error: uninitialized symbol 'ret'.
Message-ID: <202402180509.Aj5wp9zz-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d37e1e4c52bc60578969f391fb81f947c3e83118
commit: 30c624c97d08d37765ca3a23762f8c79bd6ab26e [6663/7658] nvmem: zynqmp_nvmem: Add support to access efuse
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-r081-20240216 (https://download.01.org/0day-ci/archive/20240218/202402180509.Aj5wp9zz-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402180509.Aj5wp9zz-lkp@intel.com/

smatch warnings:
drivers/nvmem/zynqmp_nvmem.c:123 zynqmp_efuse_access() error: uninitialized symbol 'ret'.

vim +/ret +123 drivers/nvmem/zynqmp_nvmem.c

30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   58  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   59  static int zynqmp_efuse_access(void *context, unsigned int offset,
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   60  			       void *val, size_t bytes, enum efuse_access flag,
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   61  			       unsigned int pufflag)
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   62  {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   63  	struct device *dev = context;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   64  	struct xilinx_efuse *efuse;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   65  	dma_addr_t dma_addr;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   66  	dma_addr_t dma_buf;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   67  	size_t words = bytes / WORD_INBYTES;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   68  	int ret;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   69  	int value;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   70  	char *data;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   71  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   72  	if (bytes % WORD_INBYTES != 0) {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   73  		dev_err(dev, "Bytes requested should be word aligned\n");
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   74  		return -EOPNOTSUPP;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   75  	}
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   76  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   77  	if (pufflag == 0 && offset % WORD_INBYTES) {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   78  		dev_err(dev, "Offset requested should be word aligned\n");
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   79  		return -EOPNOTSUPP;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   80  	}
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   81  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   82  	if (pufflag == 1 && flag == EFUSE_WRITE) {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   83  		memcpy(&value, val, bytes);
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   84  		if ((offset == EFUSE_PUF_START_OFFSET ||
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   85  		     offset == EFUSE_PUF_MID_OFFSET) &&
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   86  		    value & P_USER_0_64_UPPER_MASK) {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   87  			dev_err(dev, "Only lower 4 bytes are allowed to be programmed in P_USER_0 & P_USER_64\n");
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   88  			return -EOPNOTSUPP;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   89  		}
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   90  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   91  		if (offset == EFUSE_PUF_END_OFFSET &&
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   92  		    (value & P_USER_127_LOWER_4_BIT_MASK)) {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   93  			dev_err(dev, "Only MSB 28 bits are allowed to be programmed for P_USER_127\n");
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   94  			return -EOPNOTSUPP;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   95  		}
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   96  	}
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   97  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   98  	efuse = dma_alloc_coherent(dev, sizeof(struct xilinx_efuse),
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02   99  				   &dma_addr, GFP_KERNEL);
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  100  	if (!efuse)
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  101  		return -ENOMEM;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  102  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  103  	data = dma_alloc_coherent(dev, sizeof(bytes),
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  104  				  &dma_buf, GFP_KERNEL);
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  105  	if (!data) {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  106  		ret = -ENOMEM;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  107  		goto efuse_data_fail;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  108  	}
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  109  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  110  	if (flag == EFUSE_WRITE) {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  111  		memcpy(data, val, bytes);
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  112  		efuse->flag = EFUSE_WRITE;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  113  	} else {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  114  		efuse->flag = EFUSE_READ;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  115  	}
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  116  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  117  	efuse->src = dma_buf;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  118  	efuse->size = words;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  119  	efuse->offset = offset;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  120  	efuse->pufuserfuse = pufflag;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  121  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  122  	zynqmp_pm_efuse_access(dma_addr, (u32 *)&ret);
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02 @123  	if (ret != 0) {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  124  		if (ret == EFUSE_NOT_ENABLED) {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  125  			dev_err(dev, "efuse access is not enabled\n");
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  126  			ret = -EOPNOTSUPP;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  127  		} else {
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  128  			dev_err(dev, "Error in efuse read %x\n", ret);
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  129  			ret = -EPERM;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  130  		}
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  131  		goto efuse_access_err;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  132  	}
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  133  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  134  	if (flag == EFUSE_READ)
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  135  		memcpy(val, data, bytes);
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  136  efuse_access_err:
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  137  	dma_free_coherent(dev, sizeof(bytes),
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  138  			  data, dma_buf);
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  139  efuse_data_fail:
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  140  	dma_free_coherent(dev, sizeof(struct xilinx_efuse),
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  141  			  efuse, dma_addr);
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  142  
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  143  	return ret;
30c624c97d08d3 Praveen Teja Kundanala 2024-02-02  144  }
4640fa1833fe85 Nava kishore Manne     2019-02-06  145  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
