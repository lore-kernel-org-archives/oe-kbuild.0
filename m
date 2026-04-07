Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233F63921D6
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Apr 2026 07:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775545329; cv=none; b=UKRHdahqAvsZcLuNHO8poyoU39NjLFyIPQfffnChopwppAkJF0dujFwqXJjwFGPyClLC/Lj3iDmda+FsiE09U9WIrqd89UmgDreZguAW2517GAAkH7+BivnFWo4BMOOVjcobjKfqR2/Rk851q2w+jB8BB6RaPFGOwZUBKdMRIXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775545329; c=relaxed/simple;
	bh=E6RWIBjxFCk4em8ItUd28TNUqNR7K82m8xS09fyAWdY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=noa3mjb+RsP/h6kaT8U18db2lfoSqe9ay7gUM46u2xBmE8Hv3cNLNx9C3lYz5hEzXh4+zvyqd0RforVYQs8XSd71pZWpadneF4YgdX9F1FWltgTQyITV7TKfECudJeK7gO1YgZrfswnJPelna7icI2JAOJkcmoquQTD6YqSoF64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=icDBgoTc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="icDBgoTc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775545325; x=1807081325;
  h=date:from:to:cc:subject:message-id;
  bh=E6RWIBjxFCk4em8ItUd28TNUqNR7K82m8xS09fyAWdY=;
  b=icDBgoTcFjiT0QIRi61FK63K1V7BvBqEu9iFu3KKraDhym0t5LrER9dT
   QvOPIDAV0FsRByt+l7DtptLED5ygEpp41j90cIamkw9nm/yAbwo1VsrFq
   d3TTKqjYJkXmMi6QLMXACuDtEU9i9G+DDPF3QPslgQcR79BA3rufvktcH
   ZZ+1fbSJV9jzb38cqDZPTxHSQI0rLyrERtED2YQRt6S0unmiqYN1KJ/+f
   epgqt+cqFgAe2EaDHIFf+Ra/E8tnIPD4RpSHzGilRO9OZxAuDGnk8MRjT
   310huvMdvQowvh2YMTpstx35m+1sxz52cD8F1Wtl27Y28jcF6eq78IOi0
   g==;
X-CSE-ConnectionGUID: mXEo89TgRmuYGTsNa1c0KQ==
X-CSE-MsgGUID: 714wppaWQ0KCbqwjljucLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76466141"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76466141"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 00:01:56 -0700
X-CSE-ConnectionGUID: grXxb/cEQVqdfS2tz/qqfw==
X-CSE-MsgGUID: PLX+kb4jRgeGNLHG8WZ9pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="221517542"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2026 00:01:55 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA0Rc-000000000I3-3ekI;
	Tue, 07 Apr 2026 07:01:52 +0000
Date: Tue, 07 Apr 2026 15:01:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/tx.c:723
 iwl_pcie_txq_alloc() warn: check sign expansion for 'slots_num'
Message-ID: <202604071442.gyeKUHPF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>

Hi Miri,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bfe62a454542cfad3379f6ef5680b125f41e20f4
commit: c8a00a6e89ffee419a9190d2af9c75a7afe196d2 wifi: iwlwifi: pcie: move generation specific files to a folder
date:   10 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20260407 (https://download.01.org/0day-ci/archive/20260407/202604071442.gyeKUHPF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c8a00a6e89ff ("wifi: iwlwifi: pcie: move generation specific files to a folder")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604071442.gyeKUHPF-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/tx.c:723 iwl_pcie_txq_alloc() warn: check sign expansion for 'slots_num'
drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c:3527 iwl_trans_pcie_dump_monitor() error: we previously assumed 'trans->dbg.dest_tlv' could be null (see line 3512)

vim +/slots_num +723 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/tx.c

49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  718  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  719  int iwl_pcie_txq_alloc(struct iwl_trans *trans, struct iwl_txq *txq,
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  720  		       int slots_num, bool cmd_queue)
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  721  {
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  722  	struct iwl_trans_pcie *trans_pcie = IWL_TRANS_GET_PCIE_TRANS(trans);
c96a36491003d7 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2025-05-08 @723  	size_t num_entries = trans->mac_cfg->gen2 ?
264e744fec0171 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2025-05-08  724  		slots_num : trans->mac_cfg->base->max_tfd_queue_size;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  725  	size_t tfd_sz;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  726  	size_t tb0_buf_sz;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  727  	int i;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  728  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  729  	if (WARN_ONCE(slots_num <= 0, "Invalid slots num:%d\n", slots_num))
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  730  		return -EINVAL;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  731  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  732  	if (WARN_ON(txq->entries || txq->tfds))
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  733  		return -EINVAL;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  734  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  735  	tfd_sz = trans_pcie->txqs.tfd.size * num_entries;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  736  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  737  	timer_setup(&txq->stuck_timer, iwl_txq_stuck_timer, 0);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  738  	txq->trans = trans;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  739  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  740  	txq->n_window = slots_num;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  741  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  742  	txq->entries = kcalloc(slots_num,
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  743  			       sizeof(struct iwl_pcie_txq_entry),
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  744  			       GFP_KERNEL);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  745  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  746  	if (!txq->entries)
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  747  		goto error;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  748  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  749  	if (cmd_queue)
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  750  		for (i = 0; i < slots_num; i++) {
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  751  			txq->entries[i].cmd =
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  752  				kmalloc(sizeof(struct iwl_device_cmd),
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  753  					GFP_KERNEL);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  754  			if (!txq->entries[i].cmd)
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  755  				goto error;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  756  		}
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  757  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  758  	/* Circular buffer of transmit frame descriptors (TFDs),
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  759  	 * shared with device
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  760  	 */
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  761  	txq->tfds = dma_alloc_coherent(trans->dev, tfd_sz,
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  762  				       &txq->dma_addr, GFP_KERNEL);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  763  	if (!txq->tfds)
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  764  		goto error;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  765  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  766  	BUILD_BUG_ON(sizeof(*txq->first_tb_bufs) != IWL_FIRST_TB_SIZE_ALIGN);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  767  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  768  	tb0_buf_sz = sizeof(*txq->first_tb_bufs) * slots_num;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  769  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  770  	txq->first_tb_bufs = dma_alloc_coherent(trans->dev, tb0_buf_sz,
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  771  						&txq->first_tb_dma,
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  772  						GFP_KERNEL);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  773  	if (!txq->first_tb_bufs)
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  774  		goto err_free_tfds;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  775  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  776  	for (i = 0; i < num_entries; i++) {
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  777  		void *tfd = iwl_txq_get_tfd(trans, txq, i);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  778  
c96a36491003d7 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2025-05-08  779  		if (trans->mac_cfg->gen2)
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  780  			iwl_txq_set_tfd_invalid_gen2(trans, tfd);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  781  		else
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  782  			iwl_txq_set_tfd_invalid_gen1(trans, tfd);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  783  	}
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  784  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  785  	return 0;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  786  err_free_tfds:
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  787  	dma_free_coherent(trans->dev, tfd_sz, txq->tfds, txq->dma_addr);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  788  	txq->tfds = NULL;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  789  error:
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  790  	if (txq->entries && cmd_queue)
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  791  		for (i = 0; i < slots_num; i++)
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  792  			kfree(txq->entries[i].cmd);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  793  	kfree(txq->entries);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  794  	txq->entries = NULL;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  795  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  796  	return -ENOMEM;
f02831be962c7b drivers/net/wireless/iwlwifi/pcie/tx.c       Emmanuel Grumbach 2012-11-14  797  }
f02831be962c7b drivers/net/wireless/iwlwifi/pcie/tx.c       Emmanuel Grumbach 2012-11-14  798  

:::::: The code at line 723 was first introduced by commit
:::::: c96a36491003d7a6fb6dd3c5bcf84cca15387109 wifi: iwlwifi: rename cfg_trans_params to mac_cfg

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Miri Korenblit <miriam.rachel.korenblit@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
