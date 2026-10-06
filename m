Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6EB2EEE7E
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Oct 2026 01:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791249312; cv=none; b=Ohz4jhkikfBuEEMsoNpesRQXpdbKjMAMUAuG8fPXy71fUCBg/SdrHu2cq3lFP1Hy01nS4RvsY+5IqRSPeJLR7AXaEr4YX/2c3WpzJ+ueMoHvphD7TCuTDmPBpsZuDx5Uzidblhc6fOijhHTGhHDg8mUKf1mKWDCbLMU7J9COtV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791249312; c=relaxed/simple;
	bh=eNc7VaB0i44VYNA9xtFNY+RtOwNwy09jSJ8sTqDRn38=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qcYPIVG0sqTiM4zNiUEbkrDQS95VfUnW7bbivIi5S2QomefCl2y92y4PWNJmthc63i1zz18cItgESQUXxYgL2lFUgUViRqyejntyBC71Cq7h7BKcJcryzlPKF0rQkfx1Jn+XI6IACphVOFAQSslE/aBjE54dSJymFiChUaWel4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UxpEmYgP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UxpEmYgP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791249309; x=1822785309;
  h=date:from:to:cc:subject:message-id;
  bh=eNc7VaB0i44VYNA9xtFNY+RtOwNwy09jSJ8sTqDRn38=;
  b=UxpEmYgPHD7vSaKYEgffknymaJGD1/ynz4KFbJv/d9rJt/GUz7+y4o02
   Yrkxg2OrS822W9e3UyWe0TZohEkngDZqjh3ZqANFVlvf0Tn5udjKmlGX6
   rsV2UIC2+GwqQ3RBOcXv5j3cDgTcgsDn5x2muHoqeCc+gyfAQRzgn3+3q
   peZ/3gxzNlGO8YTMTBVQEAgRBlDf41ojExFXQCmfUjLyk84DkehVJwBB7
   5uVJwB6ybh3Cf0SqdoY7RP55CQw97uT/hQg8m6+0UKdAcXXpiX+U76c3d
   gJBOq6PVxt8pcv+/lg2jhlc0z5yqvDcsSBMgpfpChdUX/ywOsc1DBUNNw
   g==;
X-CSE-ConnectionGUID: a19XLo1pTqSN/79YjPSEjw==
X-CSE-MsgGUID: N22AywPHQb6H8ovjc0jE3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="103302537"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="103302537"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 18:15:08 -0700
X-CSE-ConnectionGUID: ySkgOJ4dRaepwX6/dWnFuQ==
X-CSE-MsgGUID: lTfwp46hRKKpmU2X8+Uabw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="281751216"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 05 Oct 2026 18:15:07 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDtlp-000000000Wl-0d79;
	Tue, 06 Oct 2026 01:15:05 +0000
Date: Tue, 06 Oct 2026 03:14:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10709/14242]
 drivers/net/wireless/intel/iwlwifi/pcie/tx.c:725 iwl_pcie_txq_alloc() warn:
 check sign expansion for 'slots_num'
Message-ID: <202610060307.l6rryyk7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
commit: e07ca69f9f6621624e97917f7c2d099fbb6e9467 [10709/14242] wifi: iwlwifi: Revert "wifi: iwlwifi: pcie: move generation specific files to a folder"
:::::: branch date: 13 hours ago
:::::: commit date: 6 days ago
config: alpha-randconfig-r2200-20261005 (https://download.01.org/0day-ci/archive/20261006/202610060307.l6rryyk7-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610060307.l6rryyk7-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/pcie/tx.c:725 iwl_pcie_txq_alloc() warn: check sign expansion for 'slots_num'

vim +/slots_num +725 drivers/net/wireless/intel/iwlwifi/pcie/tx.c

49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  720  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  721  int iwl_pcie_txq_alloc(struct iwl_trans *trans, struct iwl_txq *txq,
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  722  		       int slots_num, bool cmd_queue)
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  723  {
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  724  	struct iwl_trans_pcie *trans_pcie = IWL_TRANS_GET_PCIE_TRANS(trans);
c96a36491003d7a drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2025-05-08 @725  	size_t num_entries = trans->mac_cfg->gen2 ?
264e744fec0171f drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2025-05-08  726  		slots_num : trans->mac_cfg->base->max_tfd_queue_size;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  727  	size_t tfd_sz;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  728  	size_t tb0_buf_sz;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  729  	int i;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  730  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  731  	if (WARN_ONCE(slots_num <= 0, "Invalid slots num:%d\n", slots_num))
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  732  		return -EINVAL;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  733  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  734  	if (WARN_ON(txq->entries || txq->tfds))
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  735  		return -EINVAL;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  736  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  737  	tfd_sz = trans_pcie->txqs.tfd.size * num_entries;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  738  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  739  	timer_setup(&txq->stuck_timer, iwl_txq_stuck_timer, 0);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  740  	txq->trans = trans;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  741  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  742  	txq->n_window = slots_num;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  743  
32a92f8c8932698 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/tx.c Linus Torvalds    2026-02-21  744  	txq->entries = kzalloc_objs(struct iwl_pcie_txq_entry, slots_num);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  745  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  746  	if (!txq->entries)
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  747  		goto error;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  748  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  749  	if (cmd_queue)
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  750  		for (i = 0; i < slots_num; i++) {
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  751  			txq->entries[i].cmd =
bf4afc53b77aeaa drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/tx.c Linus Torvalds    2026-02-21  752  				kmalloc_obj(struct iwl_device_cmd);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  753  			if (!txq->entries[i].cmd)
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  754  				goto error;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  755  		}
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  756  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  757  	/* Circular buffer of transmit frame descriptors (TFDs),
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  758  	 * shared with device
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  759  	 */
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  760  	txq->tfds = dma_alloc_coherent(trans->dev, tfd_sz,
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  761  				       &txq->dma_addr, GFP_KERNEL);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  762  	if (!txq->tfds)
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  763  		goto error;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  764  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  765  	BUILD_BUG_ON(sizeof(*txq->first_tb_bufs) != IWL_FIRST_TB_SIZE_ALIGN);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  766  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  767  	tb0_buf_sz = sizeof(*txq->first_tb_bufs) * slots_num;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  768  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  769  	txq->first_tb_bufs = dma_alloc_coherent(trans->dev, tb0_buf_sz,
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  770  						&txq->first_tb_dma,
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  771  						GFP_KERNEL);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  772  	if (!txq->first_tb_bufs)
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  773  		goto err_free_tfds;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  774  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  775  	for (i = 0; i < num_entries; i++) {
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  776  		void *tfd = iwl_txq_get_tfd(trans, txq, i);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  777  
c96a36491003d7a drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2025-05-08  778  		if (trans->mac_cfg->gen2)
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  779  			iwl_txq_set_tfd_invalid_gen2(trans, tfd);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  780  		else
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  781  			iwl_txq_set_tfd_invalid_gen1(trans, tfd);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  782  	}
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  783  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  784  	return 0;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  785  err_free_tfds:
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  786  	dma_free_coherent(trans->dev, tfd_sz, txq->tfds, txq->dma_addr);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  787  	txq->tfds = NULL;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  788  error:
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  789  	if (txq->entries && cmd_queue)
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  790  		for (i = 0; i < slots_num; i++)
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  791  			kfree(txq->entries[i].cmd);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  792  	kfree(txq->entries);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  793  	txq->entries = NULL;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  794  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c        Johannes Berg     2024-06-05  795  	return -ENOMEM;
f02831be962c7be drivers/net/wireless/iwlwifi/pcie/tx.c              Emmanuel Grumbach 2012-11-14  796  }
f02831be962c7be drivers/net/wireless/iwlwifi/pcie/tx.c              Emmanuel Grumbach 2012-11-14  797  

:::::: The code at line 725 was first introduced by commit
:::::: c96a36491003d7a6fb6dd3c5bcf84cca15387109 wifi: iwlwifi: rename cfg_trans_params to mac_cfg

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Miri Korenblit <miriam.rachel.korenblit@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
