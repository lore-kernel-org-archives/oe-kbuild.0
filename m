Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F70389110
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jun 2026 16:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780419409; cv=none; b=SKK8VFwM2n56NrkCrxm9nklXndh0btRQOGJMGx9LWeuZ8+dMeUp3yg/iRn/gUYLZT1C19RkCDnH8GuWIqAQzLC1zd7pqWNVvNEQXkVN+HmtD5T7a+KRx2kmY723mnEndFtLe1szA7UkUdY+S8KVSm872xVE17aY1n8z1PwuBw/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780419409; c=relaxed/simple;
	bh=fCQvaUR4jEzLqjSlFBHZQsLos8SraF3MyXYX9zNwv3Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gFU0e69epk5EtzU5DU2gzfsgsBu6T9qaqM7dHscWWYsv3X3Qg9JcAPGf/+MczUHF0G1EaErxP0XTtHAPTDudti2GGpT5/9ZsJIVScXbdb90D+LqQ44UhNi6E8LPP56MRLVMKCtKAPYhXI5bcPNnvdFG59mbtk1nFKv7UWscQuHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dnAQ3l7U; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dnAQ3l7U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780419408; x=1811955408;
  h=date:from:to:cc:subject:message-id;
  bh=fCQvaUR4jEzLqjSlFBHZQsLos8SraF3MyXYX9zNwv3Q=;
  b=dnAQ3l7UnQsJ9UHXeLvuKQpb9+lGCOsk6oXvzWRJ67GM4+fxZQUQhGxE
   7GZRcdx1OSqCttLFfHaSgAgRVVTKsu6WdRXGN3YzVkYzVPN5fSawt0ZAl
   shQja8d0JCv/sRf74H6us1PV6Rylqnqph9PrzElbOJvEQubVDKhr0xAL6
   pWn86VmELZFpLaOqTCMNSYv8Jz74mXDQeUntEH5pTJD+kSqO/sEBwmwTj
   MOMZ00v/CdFo++KfehVYWslx2OaXn4eCSho52aE1E7lkx3bDJMmXE+2vP
   Cj4f4RD/0Q0aNoc8EkgavKqIWiCTPP0f1TixcgQ0Hpq/THpEZ0KCJWsNt
   w==;
X-CSE-ConnectionGUID: 8FiIQMXARnWW+4M16LDMiw==
X-CSE-MsgGUID: GgdBob0TQeex5ePAtUCKOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91898437"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="91898437"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 09:56:47 -0700
X-CSE-ConnectionGUID: mMzZFC7wS1aH6EMvgJItCw==
X-CSE-MsgGUID: 71cThjaJT+Kq51OA9YRe2w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Jun 2026 09:56:47 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUSQ0-00000000CJn-2Mks;
	Tue, 02 Jun 2026 16:56:44 +0000
Date: Wed, 03 Jun 2026 00:56:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sbates130272-p2pmem:switchtec-dma-sysfs 3/4]
 drivers/dma/switchtec_dma.c:1046:10: error: call to
 '__compiletime_assert_446' declared with 'error' attribute: FIELD_GET: mask
 is not constant
Message-ID: <202606030019.XnYafgFG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Logan Gunthorpe <logang@deltatee.com>

tree:   https://github.com/sbates130272/linux-p2pmem.git switchtec-dma-sysfs
head:   7de58d38d826e9043f1c21054c804d326563a84a
commit: 60076882346d9bb208a6b077708823ce8421a6a3 [3/4] dmaengine: switchtec-dma: Add config sysfs attributes
:::::: branch date: 17 hours ago
:::::: commit date: 18 hours ago
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260603/202606030019.XnYafgFG-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606030019.XnYafgFG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606030019.XnYafgFG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma/switchtec_dma.c:1046:10: error: call to '__compiletime_assert_446' declared with 'error' attribute: FIELD_GET: mask is not constant
    1046 |         value = FIELD_GET(mask, perf_cfg);
         |                 ^
   include/linux/bitfield.h:178:3: note: expanded from macro 'FIELD_GET'
     178 |                 __FIELD_GET(_mask, _reg, "FIELD_GET: ");                \
         |                 ^
   include/linux/bitfield.h:97:3: note: expanded from macro '__FIELD_GET'
      97 |                 __BF_FIELD_CHECK_MASK(mask, 0U, pfx);                   \
         |                 ^
   include/linux/bitfield.h:67:3: note: expanded from macro '__BF_FIELD_CHECK_MASK'
      67 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:687:2: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:680:4: note: expanded from macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:21:1: note: expanded from here
      21 | __compiletime_assert_446
         | ^
>> drivers/dma/switchtec_dma.c:1079:2: error: call to '__compiletime_assert_452' declared with 'error' attribute: FIELD_MODIFY: mask is not constant
    1079 |         FIELD_MODIFY(mask, &perf_cfg, value);
         |         ^
   include/linux/bitfield.h:193:3: note: expanded from macro 'FIELD_MODIFY'
     193 |                 __BF_FIELD_CHECK(_mask, *(_reg_p), _val, "FIELD_MODIFY: ");             \
         |                 ^
   include/linux/bitfield.h:85:3: note: expanded from macro '__BF_FIELD_CHECK'
      85 |                 __BF_FIELD_CHECK_MASK(mask, val, pfx);                  \
         |                 ^
   include/linux/bitfield.h:67:3: note: expanded from macro '__BF_FIELD_CHECK_MASK'
      67 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:687:2: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:680:4: note: expanded from macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:44:1: note: expanded from here
      44 | __compiletime_assert_452
         | ^
   2 errors generated.


vim +1046 drivers/dma/switchtec_dma.c

30eba9df76adf1 Kelvin Cao      2026-03-02  1029  
60076882346d9b Logan Gunthorpe 2026-06-01  1030  static inline ssize_t perf_cfg_show(struct dma_chan *chan, char *page,
60076882346d9b Logan Gunthorpe 2026-06-01  1031  				    unsigned int mask)
60076882346d9b Logan Gunthorpe 2026-06-01  1032  {
60076882346d9b Logan Gunthorpe 2026-06-01  1033  	struct switchtec_dma_chan *swdma_chan =
60076882346d9b Logan Gunthorpe 2026-06-01  1034  		container_of(chan, struct switchtec_dma_chan, dma_chan);
60076882346d9b Logan Gunthorpe 2026-06-01  1035  	struct chan_fw_regs __iomem *chan_fw = swdma_chan->mmio_chan_fw;
60076882346d9b Logan Gunthorpe 2026-06-01  1036  	u32 perf_cfg;
60076882346d9b Logan Gunthorpe 2026-06-01  1037  	int value;
60076882346d9b Logan Gunthorpe 2026-06-01  1038  
60076882346d9b Logan Gunthorpe 2026-06-01  1039  	rcu_read_lock();
60076882346d9b Logan Gunthorpe 2026-06-01  1040  	if (!rcu_dereference(swdma_chan->swdma_dev->pdev)) {
60076882346d9b Logan Gunthorpe 2026-06-01  1041  		rcu_read_unlock();
60076882346d9b Logan Gunthorpe 2026-06-01  1042  		return -ENODEV;
60076882346d9b Logan Gunthorpe 2026-06-01  1043  	}
60076882346d9b Logan Gunthorpe 2026-06-01  1044  
60076882346d9b Logan Gunthorpe 2026-06-01  1045  	perf_cfg = readl(&chan_fw->perf_cfg);
60076882346d9b Logan Gunthorpe 2026-06-01 @1046  	value = FIELD_GET(mask, perf_cfg);
60076882346d9b Logan Gunthorpe 2026-06-01  1047  
60076882346d9b Logan Gunthorpe 2026-06-01  1048  	rcu_read_unlock();
60076882346d9b Logan Gunthorpe 2026-06-01  1049  	return sprintf(page, "0x%x\n", value);
60076882346d9b Logan Gunthorpe 2026-06-01  1050  }
60076882346d9b Logan Gunthorpe 2026-06-01  1051  
60076882346d9b Logan Gunthorpe 2026-06-01  1052  static inline ssize_t perf_cfg_store(struct dma_chan *chan, const char *page,
60076882346d9b Logan Gunthorpe 2026-06-01  1053  				     size_t count, unsigned int mask)
60076882346d9b Logan Gunthorpe 2026-06-01  1054  {
60076882346d9b Logan Gunthorpe 2026-06-01  1055  	struct switchtec_dma_chan *swdma_chan =
60076882346d9b Logan Gunthorpe 2026-06-01  1056  		container_of(chan, struct switchtec_dma_chan, dma_chan);
60076882346d9b Logan Gunthorpe 2026-06-01  1057  	struct chan_fw_regs __iomem *chan_fw = swdma_chan->mmio_chan_fw;
60076882346d9b Logan Gunthorpe 2026-06-01  1058  	unsigned int max = mask >> ffs(mask);
60076882346d9b Logan Gunthorpe 2026-06-01  1059  	ssize_t ret = count;
60076882346d9b Logan Gunthorpe 2026-06-01  1060  	u32 perf_cfg;
60076882346d9b Logan Gunthorpe 2026-06-01  1061  	int value;
60076882346d9b Logan Gunthorpe 2026-06-01  1062  
60076882346d9b Logan Gunthorpe 2026-06-01  1063  	if (kstrtoint(page, 0, &value) < 0)
60076882346d9b Logan Gunthorpe 2026-06-01  1064  		return -EINVAL;
60076882346d9b Logan Gunthorpe 2026-06-01  1065  
60076882346d9b Logan Gunthorpe 2026-06-01  1066  	if (value < 0 || value > max)
60076882346d9b Logan Gunthorpe 2026-06-01  1067  		return -EINVAL;
60076882346d9b Logan Gunthorpe 2026-06-01  1068  
60076882346d9b Logan Gunthorpe 2026-06-01  1069  	rcu_read_lock();
60076882346d9b Logan Gunthorpe 2026-06-01  1070  	if (!rcu_dereference(swdma_chan->swdma_dev->pdev)) {
60076882346d9b Logan Gunthorpe 2026-06-01  1071  		ret = -ENODEV;
60076882346d9b Logan Gunthorpe 2026-06-01  1072  		goto err_unlock;
60076882346d9b Logan Gunthorpe 2026-06-01  1073  	}
60076882346d9b Logan Gunthorpe 2026-06-01  1074  
60076882346d9b Logan Gunthorpe 2026-06-01  1075  	if (chan->client_count)
60076882346d9b Logan Gunthorpe 2026-06-01  1076  		goto err_unlock;
60076882346d9b Logan Gunthorpe 2026-06-01  1077  
60076882346d9b Logan Gunthorpe 2026-06-01  1078  	perf_cfg = readl(&chan_fw->perf_cfg);
60076882346d9b Logan Gunthorpe 2026-06-01 @1079  	FIELD_MODIFY(mask, &perf_cfg, value);
60076882346d9b Logan Gunthorpe 2026-06-01  1080  	writel(perf_cfg, &chan_fw->perf_cfg);
60076882346d9b Logan Gunthorpe 2026-06-01  1081  
60076882346d9b Logan Gunthorpe 2026-06-01  1082  err_unlock:
60076882346d9b Logan Gunthorpe 2026-06-01  1083  	rcu_read_unlock();
60076882346d9b Logan Gunthorpe 2026-06-01  1084  	return ret;
60076882346d9b Logan Gunthorpe 2026-06-01  1085  }
60076882346d9b Logan Gunthorpe 2026-06-01  1086  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
