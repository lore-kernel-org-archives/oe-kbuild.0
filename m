Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D6420C461
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Aug 2025 23:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755990368; cv=none; b=m7ckjPtvjc6oO+vwYpIKVlUNfkjM/BvSk7drSTxLpO8xTRHQbex1NnXQA+F/5KcgR/8jTKwXSgGW/27klp/LQutRuglIyF8YcRvT1aXgTkhpQieDFGDr59Z/YDZiKP/HuJzuk7NvbwYMIkSUm65MCt+jr3k7nt6NdS12IseaqBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755990368; c=relaxed/simple;
	bh=EFUIhibNWCMw0orZee7W1T6KlE2AZ/zJpKr5pSJ+2HA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RRkatsoULb2VG6cuPEPGvBF3ZkXW8roNFq351jQwkEJmOfx0JSlDsqSSJkqsLjJL+2Kmdg6pZujJP8Z/v6cDRpe22NEZXLPgmLHgMC8tahCu9+Fz6F2jwtzdNOTb7h9PwKN5FXRI/6R/TVxVvytcPHcgmHbarychoKHmZr1L+4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4rDggOu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4rDggOu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755990367; x=1787526367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EFUIhibNWCMw0orZee7W1T6KlE2AZ/zJpKr5pSJ+2HA=;
  b=M4rDggOu1aHvTN5pudcnTxIRvAyZ65e2mVJfi8UetI7W9xN9xxiDDYM0
   lnHXDpPQsXBOoH7Z/unXAjekCQ6AiaNLFqmfTUcLt98LNqCRkHL1whEZN
   1Sh/a0TzSJAop+tCC3aL+FwFU3xrq3cbP7rycHYKSe7tVKhVu9QIViAwx
   ojsi2GLVuqhcQZqH20rsAI1i+/0caHWkM+zjjyIBYWVkgoN8oYgjehz2b
   4e9Hz1DVZdujBA68NOGHk9hc6m+zfDSVeuf7YTA4kPfLhjgnvwjsnzmEU
   gFqDWAksEe+tOWoRnxCGSI9fRwdIK5MgZQgQKLTvqSSDj0FDF6VdgzUvR
   w==;
X-CSE-ConnectionGUID: EnFNbgkgTxiqtq6ePq4JBg==
X-CSE-MsgGUID: NjmQNPZZTa6isf/6EKjF0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58200395"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58200395"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 16:06:03 -0700
X-CSE-ConnectionGUID: sUOReY5ITiSnIdTAXaMR8g==
X-CSE-MsgGUID: eznWhSQZQ+Cj2giJpg7AQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="174263273"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 23 Aug 2025 16:06:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upxJ9-000Mdt-1Z;
	Sat, 23 Aug 2025 23:05:59 +0000
Date: Sun, 24 Aug 2025 07:05:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/tx.c:723
 iwl_pcie_txq_alloc() warn: check sign expansion for 'slots_num'
Message-ID: <202508240642.jxhc4pbT-lkp@intel.com>
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
TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8d245acc1e884e89f0808f64d6af3fc91d4903a0
commit: c8a00a6e89ffee419a9190d2af9c75a7afe196d2 wifi: iwlwifi: pcie: move generation specific files to a folder
date:   9 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-r071-20250821 (https://download.01.org/0day-ci/archive/20250824/202508240642.jxhc4pbT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508240642.jxhc4pbT-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/tx.c:723 iwl_pcie_txq_alloc() warn: check sign expansion for 'slots_num'

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
