Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F6D13AD1C
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Dec 2024 16:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734107679; cv=none; b=CTzprb0yVzUdtXc2AymvLDgk4UKUD2LGi4B5w4pJ4zosPsNVaUMmHattPNksAgl3X1jTdTBoaPdopkLB8+FcJWVbqN8RTyipjp/pEOtoZwj5re/tHd/1bQWkIv4Id0CooWZhVeJOapLFNGcgcEPxp85PObH1E5ET0ZrhGyXAgso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734107679; c=relaxed/simple;
	bh=xXSkBKhzNtuuMYI28+UR16suh7RESPjiQtHCmRNYQ6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PtgJobHlxlqMULSatmr3cnI31HCzRvDucuHktvSKTjulVGcrG23zJXkGUHZSZcrsztIBn4tw4MuHrXo/sWB/+XK8ES4LQkk1GTnr17+TBzHEkzGRJvAg024ehnLp8K+xjsY9U/hlya8g8rsj7my1WkvNCJRha/BEf15I+XLPbVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aKaBmpnB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aKaBmpnB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734107677; x=1765643677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xXSkBKhzNtuuMYI28+UR16suh7RESPjiQtHCmRNYQ6g=;
  b=aKaBmpnBbd0AFmBdVZbE+mj8RCWuf49MtiNEN1KFVNRYahHTrOb945Kd
   Ymz7JhRRhcGZc5FAKv6jCoxqBpp4kHZ3Zi2MkxdONdomRdu5wwWhi5Vfg
   l66ryIx79KwXAzG4TAbUn1nuI9UoWVi3wGsx56/5XWzuGWIIz7TNsNfCz
   KWh0PVp59UaLNyUaYhxWfDHL36FohpKTT4QcSE4FktYi/EMV26hfZ+e5z
   CQg6x6YhAFpKGpcWEQR8ZbsRpV6UzkMb7BfOIISv/vNWsVeLZDAC0McZL
   OTycDVKpt3PEI64tvAyPiiwRXCIxy8LGL1YcQMaYv8V7ExZaguLdr3Pj9
   Q==;
X-CSE-ConnectionGUID: R3iGcVSKT0K9BHADUYMVhw==
X-CSE-MsgGUID: 7+8ZBYd3QIOFeYYAlTp7tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34295898"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; 
   d="scan'208";a="34295898"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 08:34:36 -0800
X-CSE-ConnectionGUID: drvD/Q04T7u/fMW9eFCSbA==
X-CSE-MsgGUID: 94YWrTlvR82IZI2Dn0esjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101155702"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Dec 2024 08:34:34 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tM8ca-000CEa-0H;
	Fri, 13 Dec 2024 16:34:32 +0000
Date: Sat, 14 Dec 2024 00:33:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/pcie/tx.c:690
 iwl_pcie_txq_alloc() warn: check sign expansion for 'slots_num'
Message-ID: <202412140012.lmyIwJfZ-lkp@intel.com>
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
TO: Johannes Berg <johannes.berg@intel.com>
CC: Miri Korenblit <miriam.rachel.korenblit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f932fb9b40749d1c9a539d89bb3e288c077aafe5
commit: 49101078be769e9c50a8bfbc8caaab56db9d12d9 wifi: iwlwifi: pcie: integrate TX queue code
date:   6 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-161-20241213 (https://download.01.org/0day-ci/archive/20241214/202412140012.lmyIwJfZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412140012.lmyIwJfZ-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/pcie/tx.c:690 iwl_pcie_txq_alloc() warn: check sign expansion for 'slots_num'

vim +/slots_num +690 drivers/net/wireless/intel/iwlwifi/pcie/tx.c

49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  685  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  686  int iwl_pcie_txq_alloc(struct iwl_trans *trans, struct iwl_txq *txq,
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  687  		       int slots_num, bool cmd_queue)
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  688  {
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  689  	struct iwl_trans_pcie *trans_pcie = IWL_TRANS_GET_PCIE_TRANS(trans);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05 @690  	size_t num_entries = trans->trans_cfg->gen2 ?
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  691  		slots_num : trans->trans_cfg->base_params->max_tfd_queue_size;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  692  	size_t tfd_sz;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  693  	size_t tb0_buf_sz;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  694  	int i;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  695  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  696  	if (WARN_ONCE(slots_num <= 0, "Invalid slots num:%d\n", slots_num))
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  697  		return -EINVAL;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  698  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  699  	if (WARN_ON(txq->entries || txq->tfds))
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  700  		return -EINVAL;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  701  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  702  	tfd_sz = trans_pcie->txqs.tfd.size * num_entries;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  703  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  704  	timer_setup(&txq->stuck_timer, iwl_txq_stuck_timer, 0);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  705  	txq->trans = trans;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  706  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  707  	txq->n_window = slots_num;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  708  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  709  	txq->entries = kcalloc(slots_num,
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  710  			       sizeof(struct iwl_pcie_txq_entry),
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  711  			       GFP_KERNEL);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  712  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  713  	if (!txq->entries)
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  714  		goto error;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  715  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  716  	if (cmd_queue)
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  717  		for (i = 0; i < slots_num; i++) {
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  718  			txq->entries[i].cmd =
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  719  				kmalloc(sizeof(struct iwl_device_cmd),
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  720  					GFP_KERNEL);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  721  			if (!txq->entries[i].cmd)
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  722  				goto error;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  723  		}
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  724  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  725  	/* Circular buffer of transmit frame descriptors (TFDs),
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  726  	 * shared with device
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  727  	 */
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  728  	txq->tfds = dma_alloc_coherent(trans->dev, tfd_sz,
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  729  				       &txq->dma_addr, GFP_KERNEL);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  730  	if (!txq->tfds)
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  731  		goto error;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  732  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  733  	BUILD_BUG_ON(sizeof(*txq->first_tb_bufs) != IWL_FIRST_TB_SIZE_ALIGN);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  734  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  735  	tb0_buf_sz = sizeof(*txq->first_tb_bufs) * slots_num;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  736  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  737  	txq->first_tb_bufs = dma_alloc_coherent(trans->dev, tb0_buf_sz,
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  738  						&txq->first_tb_dma,
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  739  						GFP_KERNEL);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  740  	if (!txq->first_tb_bufs)
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  741  		goto err_free_tfds;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  742  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  743  	for (i = 0; i < num_entries; i++) {
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  744  		void *tfd = iwl_txq_get_tfd(trans, txq, i);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  745  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  746  		if (trans->trans_cfg->gen2)
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  747  			iwl_txq_set_tfd_invalid_gen2(trans, tfd);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  748  		else
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  749  			iwl_txq_set_tfd_invalid_gen1(trans, tfd);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  750  	}
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  751  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  752  	return 0;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  753  err_free_tfds:
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  754  	dma_free_coherent(trans->dev, tfd_sz, txq->tfds, txq->dma_addr);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  755  	txq->tfds = NULL;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  756  error:
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  757  	if (txq->entries && cmd_queue)
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  758  		for (i = 0; i < slots_num; i++)
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  759  			kfree(txq->entries[i].cmd);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  760  	kfree(txq->entries);
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  761  	txq->entries = NULL;
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  762  
49101078be769e9 drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  763  	return -ENOMEM;
f02831be962c7be drivers/net/wireless/iwlwifi/pcie/tx.c       Emmanuel Grumbach 2012-11-14  764  }
f02831be962c7be drivers/net/wireless/iwlwifi/pcie/tx.c       Emmanuel Grumbach 2012-11-14  765  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
