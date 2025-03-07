Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277FF19AA5D
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Mar 2025 07:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741332215; cv=none; b=gCAtq03NZtHHTS7Nl0U7ZQtF88tSFgr9TNRCjWwDfgLQXkfc5fA/DUYmu/mC46G6jQZA3PI1ocD0ke2FqqeSU5VK9pMMwjfoZdgEYMGSwAqZnC4ehHuLdbmHPXAhq0bHbrZqcASq/oHzQ3Mp+oWvnaTF3PBeH/WuClyzksx5MAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741332215; c=relaxed/simple;
	bh=djO9ibnY7u8okvW7jwchUYG+Wc2Zf4Eb3bE0MHNoQ8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R/HIkBTfL2wf33FAh1ZM6+Butt88cUDbhTduzIu2m9jYsWDoJmlwcItWCtRe2rsWgPgzea02yA+48gC7xhfaw6sIApLHz19chWigimpkSUkCq9jyXD0A+kvsx2+CWal4cIOs+ekgn3GUOi5J+2JJ9jn5QoImrD0Bg6K8py4Vd4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nm7K1pQe; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nm7K1pQe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741332213; x=1772868213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=djO9ibnY7u8okvW7jwchUYG+Wc2Zf4Eb3bE0MHNoQ8A=;
  b=Nm7K1pQeVbFXeVAlfJiyD+KgqYhYSs47pOtWVYy2SAEr8u7QLc5niZvq
   v/mcUdybZ4V5XNd+wUwdBFJjRD5DmnYzXVE2lGL0JaOpy7TBjKMoON+Ka
   Qe5/mKBWpFxfMkmeElQqfPzWjVHxayzxXI+oHJIC8CrFWjOAbG41l001a
   n0BPoOIWTAWGR1E6UMsyod8ws2QRrm3i9NH7z+QL41DYsj/pG+ba8Wt9f
   Glw7qIB33KYSO+AFFcW/nhtU6P4zNz4vcrI5lRHWxaH4yrAW67ExMwNan
   u0tFTdJV9ZaIYATpdtdHoI0KWF4JLa9W/AEdtBOhIoK13pS19DeKPCXHB
   g==;
X-CSE-ConnectionGUID: Xn8l2kX4TjCMCH+c95RSQg==
X-CSE-MsgGUID: OfUYRGYIQEa/gXBpQz4FKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="64813559"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="64813559"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 23:23:31 -0800
X-CSE-ConnectionGUID: zZaxqTP+TniEkaYMjJb6wg==
X-CSE-MsgGUID: hQYv8RP+TT65zoF6ptIJVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119772764"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Mar 2025 23:23:30 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqS3L-00007P-3A;
	Fri, 07 Mar 2025 07:23:27 +0000
Date: Fri, 7 Mar 2025 15:23:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] From: Xu Rao <raoxu@uniontech.com> Subject: [PATCH] usb:
 xhci: Add debugfs support for xHCI port bandwidth
Message-ID: <202503071516.tj5UBRqT-lkp@intel.com>
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
In-Reply-To: <20250303095837.16332-1-raoxu@uniontech.com>
References: <20250303095837.16332-1-raoxu@uniontech.com>
TO: raoxu <raoxu@uniontech.com>
TO: mathias.nyman@intel.com
TO: gregkh@linuxfoundation.org
CC: linux-usb@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: wangyuli@uniontech.com
CC: zhanjun@uniontech.com
CC: Xu Rao <raoxu@uniontech.com>

Hi raoxu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.14-rc5 next-20250306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/raoxu/From-Xu-Rao-raoxu-uniontech-com-Subject-PATCH-usb-xhci-Add-debugfs-support-for-xHCI-port-bandwidth/20250303-180107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250303095837.16332-1-raoxu%40uniontech.com
patch subject: [PATCH] From: Xu Rao <raoxu@uniontech.com> Subject: [PATCH] usb: xhci: Add debugfs support for xHCI port bandwidth
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-r072-20250306 (https://download.01.org/0day-ci/archive/20250307/202503071516.tj5UBRqT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503071516.tj5UBRqT-lkp@intel.com/

New smatch warnings:
drivers/usb/host/xhci.c:3120 xhci_get_port_bandwidth() error: uninitialized symbol 'flags'.

Old smatch warnings:
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +/flags +3120 drivers/usb/host/xhci.c

f94e0186312b0f drivers/usb/host/xhci-hcd.c Sarah Sharp 2009-04-27  3090  
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3091  /* Get the available bandwidth of the ports under the xhci roothub,
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3092   * including USB 2.0 port and USB 3.0 port.
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3093   */
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3094  int xhci_get_port_bandwidth(struct xhci_hcd *xhci, u8 *bw_table)
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3095  {
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3096  	unsigned int		num_ports;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3097  	unsigned int		i;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3098  	struct xhci_command	*cmd;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3099  	dma_addr_t		dma_handle;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3100  	void			*dma_buf;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3101  	int			ret;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3102  	unsigned long		flags;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3103  	struct device		*dev  = xhci_to_hcd(xhci)->self.sysdev;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3104  
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3105  	num_ports = HCS_MAX_PORTS(xhci->hcs_params1);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3106  
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3107  	cmd = xhci_alloc_command(xhci, true, GFP_KERNEL);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3108  	if (!cmd)
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3109  		return -ENOMEM;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3110  
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3111  	dma_buf = dma_alloc_coherent(dev, xhci->page_size, &dma_handle,
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3112  					GFP_KERNEL);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3113  	if (!dma_buf) {
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3114  		xhci_free_command(xhci, cmd);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3115  		return -ENOMEM;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3116  	}
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3117  
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3118  	/* get xhci hub usb3 port bandwidth */
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3119  	/* refer to xhci rev1_2 protocol 4.6.15*/
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03 @3120  	spin_unlock_irqrestore(&xhci->lock, flags);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3121  	ret = xhci_queue_get_rh_port_bw(xhci, cmd, dma_handle, USB_SPEED_SUPER,
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3122  					0, false);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3123  	if (ret < 0) {
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3124  		spin_unlock_irqrestore(&xhci->lock, flags);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3125  		goto out;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3126  	}
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3127  	xhci_ring_cmd_db(xhci);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3128  	spin_unlock_irqrestore(&xhci->lock, flags);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3129  
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3130  	wait_for_completion(cmd->completion);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3131  
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3132  	/* refer to xhci rev1_2 protocol 6.2.6 , byte 0 is reserved */
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3133  	for (i = 1; i < num_ports+1; i++) {
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3134  		if (((u8 *)dma_buf)[i])
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3135  			bw_table[i] = ((u8 *)dma_buf)[i];
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3136  	}
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3137  
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3138  	/* get xhci hub usb2 port bandwidth */
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3139  	/* refer to xhci rev1_2 protocol 4.6.15*/
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3140  	spin_unlock_irqrestore(&xhci->lock, flags);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3141  	ret = xhci_queue_get_rh_port_bw(xhci, cmd, dma_handle, USB_SPEED_HIGH,
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3142  					0, false);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3143  	if (ret < 0) {
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3144  		spin_unlock_irqrestore(&xhci->lock, flags);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3145  		goto out;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3146  	}
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3147  	xhci_ring_cmd_db(xhci);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3148  	spin_unlock_irqrestore(&xhci->lock, flags);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3149  
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3150  	wait_for_completion(cmd->completion);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3151  
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3152  	/* refer to xhci rev1_2 protocol 6.2.6 , byte 0 is reserved */
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3153  	for (i = 1; i < num_ports+1; i++) {
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3154  		if (((u8 *)dma_buf)[i])
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3155  			bw_table[i] = ((u8 *)dma_buf)[i];
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3156  	}
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3157  
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3158  out:
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3159  	dma_free_coherent(dev, xhci->page_size, dma_buf, dma_handle);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3160  	xhci_free_command(xhci, cmd);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3161  
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3162  	return ret;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3163  }
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3164  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
