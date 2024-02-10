Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B97C8C04
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Feb 2024 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707557294; cv=none; b=e75uEbXgTdieLBVDAjSKF43Y376VBN8vUDFFI1+QfrH3ZglUQ0E9B+3QdmkQgFl1WlLOy6OVHNI+/1L2hNs8GFBv6FYMmePgJ8L0FoSR6/nnt9ii8BUYjxdblfS8DSNXGu6+GMxYXMZfffKXbgENPcO8i07A3kJA6q83rUIBsls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707557294; c=relaxed/simple;
	bh=yNulkfeKcP++StMgQqI2aSvzDauXJDKddnwgTFYiFaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z8YfVmMIjXpgXH4Wuv06cSBuDJRrMXYs4yh2IKT/Z532Afe9n6QKylYeuQ0Sg/cCfFZSuuf4qaAykk3/shzBx614cme7EvHJ0Phi7NKh/d+1w42GryOSbP3w68oZYmWv4ovU9jH9JAyL0/98laSAOvVYA35Y2Y9UJSaEOrsLWuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YsV7axn9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YsV7axn9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707557293; x=1739093293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yNulkfeKcP++StMgQqI2aSvzDauXJDKddnwgTFYiFaI=;
  b=YsV7axn9zYXl67wRDgdSCfBNgIX5VgaBfwq5z3YL78JkiHAkAISnAvEP
   CQKKMXAvlMg4nvEp/ng/rdcT6T4P/9Da47keFUtozbl1PpKEt/5rdzMq7
   J4TPuv2lRKMd5jWRQOA64fpQE+DVh8Zodp3EkyXMuBtrB0/OUoMY9AigJ
   7T0pZk60IuTJWzUP2gUzOIwF8khACSXqs2gy4CnAREenQu/wLgVHMLU1g
   Y1CGIqLLR+JX2vhtXdxp+7JFccxenYRtNnU+PmgVbmB7KdmDtwrsY/m1D
   3xFfpu7G7c1ErqShnCVK2iNVet+j9XQzJWEfXpcoxGkF+DIZODN68SWlP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="12931215"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="12931215"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 01:28:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="2173604"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Feb 2024 01:28:11 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYjea-0005X4-2F;
	Sat, 10 Feb 2024 09:28:08 +0000
Date: Sat, 10 Feb 2024 17:27:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [avpatel:riscv_aia_v13 42/43]
 drivers/irqchip/irq-riscv-imsic-state.c:316:7: error: incompatible integer
 to pointer conversion assigning to 'struct imsic_vector *' from 'long'
Message-ID: <202402101719.jbDSWQ7z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Anup Patel <apatel@ventanamicro.com>
CC: Conor Dooley <conor.dooley@microchip.com>

Hi Anup,

First bad commit (maybe != root cause):

tree:   https://github.com/avpatel/linux.git riscv_aia_v13
head:   7c827f929b596c9423d47904baf55ca77f9f53f5
commit: 3b3830894afc5d53b08fa0a5fbc8209b98db04c5 [42/43] RISC-V: Select APLIC and IMSIC drivers
:::::: branch date: 21 hours ago
:::::: commit date: 28 hours ago
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240210/202402101719.jbDSWQ7z-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ac0577177f053ba7e7016e1b7e44cf5932d00b03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402101719.jbDSWQ7z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402101719.jbDSWQ7z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-riscv-imsic-state.c:316:7: error: incompatible integer to pointer conversion assigning to 'struct imsic_vector *' from 'long' [-Wint-conversion]
     316 |         mvec = atomic_long_read(&vec->move);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +316 drivers/irqchip/irq-riscv-imsic-state.c

eb49bac5b097db Anup Patel 2023-08-02  300  
eb49bac5b097db Anup Patel 2023-08-02  301  #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
eb49bac5b097db Anup Patel 2023-08-02  302  void imsic_vector_debug_show(struct seq_file *m,
eb49bac5b097db Anup Patel 2023-08-02  303  			     struct imsic_vector *vec, int ind)
eb49bac5b097db Anup Patel 2023-08-02  304  {
eb49bac5b097db Anup Patel 2023-08-02  305  	unsigned int mcpu = 0, mlocal_id = 0;
eb49bac5b097db Anup Patel 2023-08-02  306  	struct imsic_local_priv *lpriv;
eb49bac5b097db Anup Patel 2023-08-02  307  	bool move_in_progress = false;
eb49bac5b097db Anup Patel 2023-08-02  308  	struct imsic_vector *mvec;
eb49bac5b097db Anup Patel 2023-08-02  309  	bool is_enabled;
eb49bac5b097db Anup Patel 2023-08-02  310  
eb49bac5b097db Anup Patel 2023-08-02  311  	lpriv = per_cpu_ptr(imsic->lpriv, vec->cpu);
eb49bac5b097db Anup Patel 2023-08-02  312  	if (WARN_ON(&lpriv->vectors[vec->local_id] != vec))
eb49bac5b097db Anup Patel 2023-08-02  313  		return;
eb49bac5b097db Anup Patel 2023-08-02  314  
eb49bac5b097db Anup Patel 2023-08-02  315  	is_enabled = atomic_long_read(&vec->enable) ? true : false;
eb49bac5b097db Anup Patel 2023-08-02 @316  	mvec = atomic_long_read(&vec->move);
eb49bac5b097db Anup Patel 2023-08-02  317  	if (mvec) {
eb49bac5b097db Anup Patel 2023-08-02  318  		move_in_progress = true;
eb49bac5b097db Anup Patel 2023-08-02  319  		mcpu = mvec->cpu;
eb49bac5b097db Anup Patel 2023-08-02  320  		mlocal_id = mvec->local_id;
eb49bac5b097db Anup Patel 2023-08-02  321  	}
eb49bac5b097db Anup Patel 2023-08-02  322  
eb49bac5b097db Anup Patel 2023-08-02  323  	seq_printf(m, "%*starget_cpu      : %5u\n", ind, "", vec->cpu);
eb49bac5b097db Anup Patel 2023-08-02  324  	seq_printf(m, "%*starget_local_id : %5u\n", ind, "", vec->local_id);
eb49bac5b097db Anup Patel 2023-08-02  325  	seq_printf(m, "%*sis_reserved     : %5u\n", ind, "",
eb49bac5b097db Anup Patel 2023-08-02  326  		   (vec->local_id <= IMSIC_IPI_ID) ? 1 : 0);
eb49bac5b097db Anup Patel 2023-08-02  327  	seq_printf(m, "%*sis_enabled      : %5u\n", ind, "",
eb49bac5b097db Anup Patel 2023-08-02  328  		   (is_enabled) ? 1 : 0);
eb49bac5b097db Anup Patel 2023-08-02  329  	seq_printf(m, "%*sis_move_pending : %5u\n", ind, "",
eb49bac5b097db Anup Patel 2023-08-02  330  		   (move_in_progress) ? 1 : 0);
eb49bac5b097db Anup Patel 2023-08-02  331  	if (move_in_progress) {
eb49bac5b097db Anup Patel 2023-08-02  332  		seq_printf(m, "%*smove_cpu        : %5u\n", ind, "", mcpu);
eb49bac5b097db Anup Patel 2023-08-02  333  		seq_printf(m, "%*smove_local_id   : %5u\n", ind, "", mlocal_id);
eb49bac5b097db Anup Patel 2023-08-02  334  	}
eb49bac5b097db Anup Patel 2023-08-02  335  }
eb49bac5b097db Anup Patel 2023-08-02  336  

:::::: The code at line 316 was first introduced by commit
:::::: eb49bac5b097dbda8f0660076a9e109fa4498917 irqchip: Add RISC-V incoming MSI controller early driver

:::::: TO: Anup Patel <apatel@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
