Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E76527B357
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jan 2026 01:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769648457; cv=none; b=I0MA/vDWTnOX5n7gQchAqRUzszhVRvMIsFzMTwPMmqrj3yjVKiJ3qKaNiPnG+ydQhv0/vSGXyuouc8+XMPcsYrgHTR5M6xZWacOExohe9zteblu0SssaCwdchEUhZB5wGh0U5Lc8N2vqEZ6akor122lUWcCHwGoMC+QExHIcwf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769648457; c=relaxed/simple;
	bh=Aix14LeIYZPcjbrnOX1YmH/mTvH7yVSfpbMu6ln+6Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hG4OOauTUfGNRBZVzSd96x+zDresXUWjUL44m7kmpooCeizKSyO4elAs1FMT1pApUJiJ6TI9PyRowV2vuo37uFUunuO7pMlhLltHmls6KgkvGUvWLGjimo5rMYI83dQfapw3/M+OriOrJrHc/dSlVLRVV24fUrJ8mfEOI3KFtnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bg9Pq16+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bg9Pq16+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769648454; x=1801184454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Aix14LeIYZPcjbrnOX1YmH/mTvH7yVSfpbMu6ln+6Ss=;
  b=Bg9Pq16+CMOI9dibwQqVBwVXumW67voY+emcrp9mVDCOv2j/qp6aIkFM
   Wf0GTz/COQMaM+NnHcTkrl3tj3geJg5lLpIrZOfOybw7Z5g0ywtZoB4Co
   NsCx58NT5hhLka6fhv9QoUM3sAgD1UrNPrEeLOj3uROIeNLtcJVVHv1b3
   kcUOl7j/OEDt2Qr++GoLKbXky3UUfzNOOLNqVM00Chxch9v1Jwhvy9Dzb
   ZMkC/44olNL1Y2nJNIvphxn0edA8ClqxvMBW0kxRtyc9HZlv8fjANfLvf
   X3OfxIi54tLlYx6nlcB98VkKhuYp/rgXV/fp6CRiBm3AeYUx/5tDR7muW
   g==;
X-CSE-ConnectionGUID: Uf3uawnPToCkyY3LUQeiiw==
X-CSE-MsgGUID: 5Mf/w86mQK2sNCtKbvBSlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74499084"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="74499084"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 17:00:54 -0800
X-CSE-ConnectionGUID: tBaY9WxYRDqRwFqb1a2VxQ==
X-CSE-MsgGUID: helyahZHSfCtvq0r89zjnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208510303"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Jan 2026 17:00:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlGOw-00000000awc-2rlG;
	Thu, 29 Jan 2026 01:00:50 +0000
Date: Thu, 29 Jan 2026 08:59:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] usb: xhci: add interrupter type
Message-ID: <202601290847.Cb6aLduh-lkp@intel.com>
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
In-Reply-To: <20260128131504.124322-3-niklas.neronin@linux.intel.com>
References: <20260128131504.124322-3-niklas.neronin@linux.intel.com>
TO: Niklas Neronin <niklas.neronin@linux.intel.com>
TO: mathias.nyman@linux.intel.com
CC: linux-usb@vger.kernel.org
CC: raoxu@uniontech.com
CC: Niklas Neronin <niklas.neronin@linux.intel.com>

Hi Niklas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Niklas-Neronin/usb-xhci-move-Primary-Interrupter-IMODI-setup/20260128-211728
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20260128131504.124322-3-niklas.neronin%40linux.intel.com
patch subject: [PATCH 2/2] usb: xhci: add interrupter type
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-randconfig-161-20260129 (https://download.01.org/0day-ci/archive/20260129/202601290847.Cb6aLduh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601290847.Cb6aLduh-lkp@intel.com/

smatch warnings:
drivers/usb/host/xhci.c:320 xhci_enable_interrupter() warn: variable dereferenced before check 'ir' (see line 317)
drivers/usb/host/xhci.c:340 xhci_disable_interrupter() warn: variable dereferenced before check 'ir' (see line 337)

vim +/ir +320 drivers/usb/host/xhci.c

43b86af83da7db Dong Nguyen    2010-07-21  312  
bea5892d0ed274 Mathias Nyman  2025-04-10  313  int xhci_enable_interrupter(struct xhci_interrupter *ir)
52dd0483e822d0 Mathias Nyman  2023-02-02  314  {
52dd0483e822d0 Mathias Nyman  2023-02-02  315  	u32 iman;
52dd0483e822d0 Mathias Nyman  2023-02-02  316  
486b278520fd70 Niklas Neronin 2026-01-28 @317  	if (ir->type == INTR_NOOP)
486b278520fd70 Niklas Neronin 2026-01-28  318  		return 0;
486b278520fd70 Niklas Neronin 2026-01-28  319  
52dd0483e822d0 Mathias Nyman  2023-02-02 @320  	if (!ir || !ir->ir_set)
52dd0483e822d0 Mathias Nyman  2023-02-02  321  		return -EINVAL;
52dd0483e822d0 Mathias Nyman  2023-02-02  322  
bf9cce90da311a Niklas Neronin 2025-05-15  323  	iman = readl(&ir->ir_set->iman);
ff9a09b3e09c7b Niklas Neronin 2025-08-19  324  	iman &= ~IMAN_IP;
9f7f74735ac295 Niklas Neronin 2025-05-15  325  	iman |= IMAN_IE;
bf9cce90da311a Niklas Neronin 2025-05-15  326  	writel(iman, &ir->ir_set->iman);
52dd0483e822d0 Mathias Nyman  2023-02-02  327  
f5bce30ad25e74 Niklas Neronin 2025-05-15  328  	/* Read operation to guarantee the write has been flushed from posted buffers */
bf9cce90da311a Niklas Neronin 2025-05-15  329  	readl(&ir->ir_set->iman);
52dd0483e822d0 Mathias Nyman  2023-02-02  330  	return 0;
52dd0483e822d0 Mathias Nyman  2023-02-02  331  }
52dd0483e822d0 Mathias Nyman  2023-02-02  332  
e1db856bd28891 Niklas Neronin 2025-05-15  333  int xhci_disable_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
52dd0483e822d0 Mathias Nyman  2023-02-02  334  {
52dd0483e822d0 Mathias Nyman  2023-02-02  335  	u32 iman;
52dd0483e822d0 Mathias Nyman  2023-02-02  336  
486b278520fd70 Niklas Neronin 2026-01-28 @337  	if (ir->type == INTR_NOOP)
486b278520fd70 Niklas Neronin 2026-01-28  338  		return 0;
486b278520fd70 Niklas Neronin 2026-01-28  339  
52dd0483e822d0 Mathias Nyman  2023-02-02 @340  	if (!ir || !ir->ir_set)
52dd0483e822d0 Mathias Nyman  2023-02-02  341  		return -EINVAL;
52dd0483e822d0 Mathias Nyman  2023-02-02  342  
bf9cce90da311a Niklas Neronin 2025-05-15  343  	iman = readl(&ir->ir_set->iman);
ff9a09b3e09c7b Niklas Neronin 2025-08-19  344  	iman &= ~IMAN_IP;
9f7f74735ac295 Niklas Neronin 2025-05-15  345  	iman &= ~IMAN_IE;
bf9cce90da311a Niklas Neronin 2025-05-15  346  	writel(iman, &ir->ir_set->iman);
52dd0483e822d0 Mathias Nyman  2023-02-02  347  
bf9cce90da311a Niklas Neronin 2025-05-15  348  	iman = readl(&ir->ir_set->iman);
e1db856bd28891 Niklas Neronin 2025-05-15  349  	if (iman & IMAN_IP)
e1db856bd28891 Niklas Neronin 2025-05-15  350  		xhci_dbg(xhci, "%s: Interrupt pending\n", __func__);
e1db856bd28891 Niklas Neronin 2025-05-15  351  
52dd0483e822d0 Mathias Nyman  2023-02-02  352  	return 0;
52dd0483e822d0 Mathias Nyman  2023-02-02  353  }
52dd0483e822d0 Mathias Nyman  2023-02-02  354  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
