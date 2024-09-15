Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86581CB30E
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Sep 2024 20:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726431311; cv=none; b=ppizLRhJFqjzkLFT/aaJr4vgzK8RF4uK++t60oUFJu2fwYZ4dLdVAP2YWv67sZ+pqVj3Z/RlJr+sOZhu5BfZG/F9nNJH6320d2n+Xg0NVZriBbP4Clh/UAtpwCNsvyQTzR8kYkb7MBF4+B3PIsCRZsJ9SGVLCpuI8dUS9Cklz5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726431311; c=relaxed/simple;
	bh=Rna9CId0BMpuQSjc25NlJ7SFGSEhgBdFR6mQ9v+jsTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NLn/cBlNljup/LpZV3LOC7ykIoO44kLRvHkordaXFBtzeh2fbyHL9NxfcWEywsebn00rQLwga//vnsSINW8+RbaQtqkap+VSStPIIqgQpmoi4IswfPS7Z1/RpMI59rnGk42baR3NkivhgXkTdmYkO5IysORkUXyzXEvdpROuPDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+IossZH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+IossZH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726431309; x=1757967309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rna9CId0BMpuQSjc25NlJ7SFGSEhgBdFR6mQ9v+jsTM=;
  b=Y+IossZHM2az+IvisO98RqJq/VQYL3dsB+nqRxL98T01g8XQ8qhbIsPs
   t/REkl+Cs4udyqvXCFd+wYZGdQozNXQE/9hudugGbHcBAts6kRIe+tpeQ
   CuFFHCC5DmI2vxMk2IPbk1KYPhcrDoQgkSXuyacvjKPqDXB5x29xpg3nh
   5C2Q3vatnytuYVo4/xPrMnDN0wiKSpf4q/+zkMDj4D39ypEhiCVA3QxVn
   3BLR5Kbb4+0/skqC50l5HDzPLydKFT/cgSw2h6mx50GxwR60WB3yHhXck
   HV7bok4xYqDEua5H6EAoVR5OZL4G5zeU81vN0sFpNPk/KMfwEq4v7C9MT
   A==;
X-CSE-ConnectionGUID: skNB/L8yTy654EU1BaBgcA==
X-CSE-MsgGUID: 7bZSOqYyTfi+zdUzt5jSxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25202630"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="25202630"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 13:15:09 -0700
X-CSE-ConnectionGUID: +wJkF58gTF2YlsJ5aKgfsw==
X-CSE-MsgGUID: Szd9gB7OTVWfpQGDe/mdsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="68553302"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Sep 2024 13:15:07 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spveC-00090w-0O;
	Sun, 15 Sep 2024 20:15:04 +0000
Date: Mon, 16 Sep 2024 04:14:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/vdpa/octeon_ep/octep_vdpa_hw.c:143 octep_process_mbox()
 warn: missing error code? 'ret'
Message-ID: <202409160431.bRhZWhiU-lkp@intel.com>
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
TO: Srujana Challa <schalla@marvell.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Vamsi Attunuru <vattunuru@marvell.com>
CC: Shijith Thotton <sthotton@marvell.com>
CC: Nithin Dabilpuram <ndabilpuram@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   98f7e32f20d28ec452afb208f9cffc08448a2652
commit: 8b6c724cdab85d8923dd8c474a5a9464228379c5 virtio: vdpa: vDPA driver for Marvell OCTEON DPU devices
date:   10 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 10 weeks ago
config: i386-randconfig-141-20240912 (https://download.01.org/0day-ci/archive/20240916/202409160431.bRhZWhiU-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409160431.bRhZWhiU-lkp@intel.com/

New smatch warnings:
drivers/vdpa/octeon_ep/octep_vdpa_hw.c:143 octep_process_mbox() warn: missing error code? 'ret'
drivers/vdpa/octeon_ep/octep_vdpa_hw.c:478 octep_hw_caps_read() warn: argument 3 to %016llx specifier is cast from pointer

Old smatch warnings:
drivers/vdpa/octeon_ep/octep_vdpa_hw.c:479 octep_hw_caps_read() warn: argument 3 to %016llx specifier is cast from pointer
drivers/vdpa/octeon_ep/octep_vdpa_hw.c:480 octep_hw_caps_read() warn: argument 3 to %016llx specifier is cast from pointer
drivers/vdpa/octeon_ep/octep_vdpa_hw.c:481 octep_hw_caps_read() warn: argument 3 to %016llx specifier is cast from pointer
drivers/vdpa/octeon_ep/octep_vdpa_hw.c:514 octep_hw_caps_read() warn: argument 3 to %016llx specifier is cast from pointer

vim +/ret +143 drivers/vdpa/octeon_ep/octep_vdpa_hw.c

8b6c724cdab85d Srujana Challa 2024-06-14  101  
8b6c724cdab85d Srujana Challa 2024-06-14  102  static int octep_process_mbox(struct octep_hw *oct_hw, u16 id, u16 qid, void *buffer,
8b6c724cdab85d Srujana Challa 2024-06-14  103  			      u32 buf_size, bool write)
8b6c724cdab85d Srujana Challa 2024-06-14  104  {
8b6c724cdab85d Srujana Challa 2024-06-14  105  	struct octep_mbox __iomem *mbox = octep_get_mbox(oct_hw);
8b6c724cdab85d Srujana Challa 2024-06-14  106  	struct pci_dev *pdev = oct_hw->pdev;
8b6c724cdab85d Srujana Challa 2024-06-14  107  	u32 *p = (u32 *)buffer;
8b6c724cdab85d Srujana Challa 2024-06-14  108  	u16 data_wds;
8b6c724cdab85d Srujana Challa 2024-06-14  109  	int ret, i;
8b6c724cdab85d Srujana Challa 2024-06-14  110  	u32 val;
8b6c724cdab85d Srujana Challa 2024-06-14  111  
8b6c724cdab85d Srujana Challa 2024-06-14  112  	if (!IS_ALIGNED(buf_size, 4))
8b6c724cdab85d Srujana Challa 2024-06-14  113  		return -EINVAL;
8b6c724cdab85d Srujana Challa 2024-06-14  114  
8b6c724cdab85d Srujana Challa 2024-06-14  115  	/* Make sure mbox space is available */
8b6c724cdab85d Srujana Challa 2024-06-14  116  	ret = octep_wait_for_mbox_avail(mbox);
8b6c724cdab85d Srujana Challa 2024-06-14  117  	if (ret) {
8b6c724cdab85d Srujana Challa 2024-06-14  118  		dev_warn(&pdev->dev, "Timeout waiting for previous mbox data to be consumed\n");
8b6c724cdab85d Srujana Challa 2024-06-14  119  		return ret;
8b6c724cdab85d Srujana Challa 2024-06-14  120  	}
8b6c724cdab85d Srujana Challa 2024-06-14  121  	data_wds = buf_size / 4;
8b6c724cdab85d Srujana Challa 2024-06-14  122  
8b6c724cdab85d Srujana Challa 2024-06-14  123  	if (write) {
8b6c724cdab85d Srujana Challa 2024-06-14  124  		for (i = 1; i <= data_wds; i++) {
8b6c724cdab85d Srujana Challa 2024-06-14  125  			octep_write32_word(mbox, i, *p);
8b6c724cdab85d Srujana Challa 2024-06-14  126  			p++;
8b6c724cdab85d Srujana Challa 2024-06-14  127  		}
8b6c724cdab85d Srujana Challa 2024-06-14  128  	}
8b6c724cdab85d Srujana Challa 2024-06-14  129  	octep_write32_word(mbox, 0, (u32)qid);
8b6c724cdab85d Srujana Challa 2024-06-14  130  	octep_write_sts(mbox, 0);
8b6c724cdab85d Srujana Challa 2024-06-14  131  
8b6c724cdab85d Srujana Challa 2024-06-14  132  	octep_write_hdr(mbox, id, MBOX_REQ_SIG);
8b6c724cdab85d Srujana Challa 2024-06-14  133  
8b6c724cdab85d Srujana Challa 2024-06-14  134  	ret = octep_wait_for_mbox_rsp(mbox);
8b6c724cdab85d Srujana Challa 2024-06-14  135  	if (ret) {
8b6c724cdab85d Srujana Challa 2024-06-14  136  		dev_warn(&pdev->dev, "Timeout waiting for mbox : %d response\n", id);
8b6c724cdab85d Srujana Challa 2024-06-14  137  		return ret;
8b6c724cdab85d Srujana Challa 2024-06-14  138  	}
8b6c724cdab85d Srujana Challa 2024-06-14  139  
8b6c724cdab85d Srujana Challa 2024-06-14  140  	val = octep_read_sig(mbox);
8b6c724cdab85d Srujana Challa 2024-06-14  141  	if ((val & 0xFFFF) != MBOX_RSP_SIG) {
8b6c724cdab85d Srujana Challa 2024-06-14  142  		dev_warn(&pdev->dev, "Invalid Signature from mbox : %d response\n", id);
8b6c724cdab85d Srujana Challa 2024-06-14 @143  		return ret;
8b6c724cdab85d Srujana Challa 2024-06-14  144  	}
8b6c724cdab85d Srujana Challa 2024-06-14  145  
8b6c724cdab85d Srujana Challa 2024-06-14  146  	val = octep_read_sts(mbox);
8b6c724cdab85d Srujana Challa 2024-06-14  147  	if (val & MBOX_RC_MASK) {
8b6c724cdab85d Srujana Challa 2024-06-14  148  		ret = MBOX_RSP_TO_ERR(val);
8b6c724cdab85d Srujana Challa 2024-06-14  149  		dev_warn(&pdev->dev, "Error while processing mbox : %d, err %d\n", id, ret);
8b6c724cdab85d Srujana Challa 2024-06-14  150  		return ret;
8b6c724cdab85d Srujana Challa 2024-06-14  151  	}
8b6c724cdab85d Srujana Challa 2024-06-14  152  
8b6c724cdab85d Srujana Challa 2024-06-14  153  	if (!write)
8b6c724cdab85d Srujana Challa 2024-06-14  154  		for (i = 1; i <= data_wds; i++)
8b6c724cdab85d Srujana Challa 2024-06-14  155  			*p++ = octep_read32_word(mbox, i);
8b6c724cdab85d Srujana Challa 2024-06-14  156  
8b6c724cdab85d Srujana Challa 2024-06-14  157  	return 0;
8b6c724cdab85d Srujana Challa 2024-06-14  158  }
8b6c724cdab85d Srujana Challa 2024-06-14  159  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
