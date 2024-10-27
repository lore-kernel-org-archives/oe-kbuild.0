Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF444CB36
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Oct 2024 10:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730024346; cv=none; b=jNv5MTfRrepWqpFEINOw2ZWHW0M0DAm7DL5Aog+CXftEInhsGzKvxu2ZT7PZKeWyspxGpXeM2b1w6rHx+SCV+KdvCKRJs1Nk5/w77ICeDheItffKUDD53ernYBMIA9/JlGQ48CPWtvz38TGCbfuMgZ5ktRrXZ1IWHGZx/MnDD44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730024346; c=relaxed/simple;
	bh=UgIFoM/h2cy5/wpTojdZ/q+QraB0B9e82cbugM3Mu5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ONWlKVCu3p+1MXdS/EzXS+0fkKkXmJS/OvmkL58TQICnMstq5n9MqT/isUVc67xnvDe2aex91kiybgygdqSqrgZLgz6g5TJIYuIgz9ivaKARh79jRbGQVKYYs5DTP9UuxC6orcKmdQJ5ojBts3OoZV1ABFHZDsldr4DjEgSxKyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ed193zJP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ed193zJP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730024344; x=1761560344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UgIFoM/h2cy5/wpTojdZ/q+QraB0B9e82cbugM3Mu5Y=;
  b=ed193zJPiDdRd7dqfcP5Uv9I2f7XS3MNpsiU+VOG0PLC9jKLXsCYXz48
   tbWM5fSC00e6ZoE2LJgyYH/j5aXAQe3ATmkyrQteidwk/1zFlz+M5WA51
   M6w95tG8tVkYNKV2y1j7IKJO+GWQqzAeer5PRIUCj4PCVO79zP5BE5hl4
   TCgMW6xyv+14mL/a8O337u0sRoAFk6VUyPHoGZvDp8hqpA9FMuU16AayB
   zJKthXB4lixC6Z5yQfvo8NjT3cEK8v/8xrNXJ2BxYVhUildZLAKrcx9q5
   Hr/C+fZvPw0i9QVg5jkpgdA3CbRz/HLySRjYTGHLbdyAK7fMFMaG9DWpv
   A==;
X-CSE-ConnectionGUID: eAwX1KeCSzS/ZPeUX5GUcQ==
X-CSE-MsgGUID: xXbLaO3TRre7SPFXDu4EXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="55048133"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="55048133"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 03:19:03 -0700
X-CSE-ConnectionGUID: xIHLQNMTR2WQRQEwEFaqfw==
X-CSE-MsgGUID: v5xpotE6Qcym+GH3fRjHeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="81663229"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Oct 2024 03:19:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t50MN-000ac8-1s;
	Sun, 27 Oct 2024 10:18:59 +0000
Date: Sun, 27 Oct 2024 18:18:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/pcie/tx.c:690
 iwl_pcie_txq_alloc() warn: check sign expansion for 'slots_num'
Message-ID: <202410271847.iCD1KB9P-lkp@intel.com>
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
head:   850925a8133c73c4a2453c360b2c3beb3bab67c9
commit: 49101078be769e9c50a8bfbc8caaab56db9d12d9 wifi: iwlwifi: pcie: integrate TX queue code
date:   5 months ago
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161-20241026 (https://download.01.org/0day-ci/archive/20241027/202410271847.iCD1KB9P-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410271847.iCD1KB9P-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/pcie/tx.c:690 iwl_pcie_txq_alloc() warn: check sign expansion for 'slots_num'

vim +/slots_num +690 drivers/net/wireless/intel/iwlwifi/pcie/tx.c

49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  685  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  686  int iwl_pcie_txq_alloc(struct iwl_trans *trans, struct iwl_txq *txq,
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  687  		       int slots_num, bool cmd_queue)
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  688  {
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  689  	struct iwl_trans_pcie *trans_pcie = IWL_TRANS_GET_PCIE_TRANS(trans);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05 @690  	size_t num_entries = trans->trans_cfg->gen2 ?
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  691  		slots_num : trans->trans_cfg->base_params->max_tfd_queue_size;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  692  	size_t tfd_sz;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  693  	size_t tb0_buf_sz;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  694  	int i;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  695  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  696  	if (WARN_ONCE(slots_num <= 0, "Invalid slots num:%d\n", slots_num))
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  697  		return -EINVAL;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  698  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  699  	if (WARN_ON(txq->entries || txq->tfds))
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  700  		return -EINVAL;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  701  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  702  	tfd_sz = trans_pcie->txqs.tfd.size * num_entries;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  703  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  704  	timer_setup(&txq->stuck_timer, iwl_txq_stuck_timer, 0);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  705  	txq->trans = trans;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  706  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  707  	txq->n_window = slots_num;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  708  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  709  	txq->entries = kcalloc(slots_num,
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  710  			       sizeof(struct iwl_pcie_txq_entry),
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  711  			       GFP_KERNEL);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  712  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  713  	if (!txq->entries)
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  714  		goto error;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  715  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  716  	if (cmd_queue)
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  717  		for (i = 0; i < slots_num; i++) {
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  718  			txq->entries[i].cmd =
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  719  				kmalloc(sizeof(struct iwl_device_cmd),
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  720  					GFP_KERNEL);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  721  			if (!txq->entries[i].cmd)
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  722  				goto error;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  723  		}
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  724  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  725  	/* Circular buffer of transmit frame descriptors (TFDs),
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  726  	 * shared with device
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  727  	 */
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  728  	txq->tfds = dma_alloc_coherent(trans->dev, tfd_sz,
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  729  				       &txq->dma_addr, GFP_KERNEL);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  730  	if (!txq->tfds)
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  731  		goto error;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  732  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  733  	BUILD_BUG_ON(sizeof(*txq->first_tb_bufs) != IWL_FIRST_TB_SIZE_ALIGN);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  734  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  735  	tb0_buf_sz = sizeof(*txq->first_tb_bufs) * slots_num;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  736  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  737  	txq->first_tb_bufs = dma_alloc_coherent(trans->dev, tb0_buf_sz,
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  738  						&txq->first_tb_dma,
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  739  						GFP_KERNEL);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  740  	if (!txq->first_tb_bufs)
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  741  		goto err_free_tfds;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  742  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  743  	for (i = 0; i < num_entries; i++) {
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  744  		void *tfd = iwl_txq_get_tfd(trans, txq, i);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  745  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  746  		if (trans->trans_cfg->gen2)
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  747  			iwl_txq_set_tfd_invalid_gen2(trans, tfd);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  748  		else
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  749  			iwl_txq_set_tfd_invalid_gen1(trans, tfd);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  750  	}
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  751  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  752  	return 0;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  753  err_free_tfds:
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  754  	dma_free_coherent(trans->dev, tfd_sz, txq->tfds, txq->dma_addr);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  755  	txq->tfds = NULL;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  756  error:
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  757  	if (txq->entries && cmd_queue)
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  758  		for (i = 0; i < slots_num; i++)
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  759  			kfree(txq->entries[i].cmd);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  760  	kfree(txq->entries);
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  761  	txq->entries = NULL;
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  762  
49101078be769e drivers/net/wireless/intel/iwlwifi/pcie/tx.c Johannes Berg     2024-06-05  763  	return -ENOMEM;
f02831be962c7b drivers/net/wireless/iwlwifi/pcie/tx.c       Emmanuel Grumbach 2012-11-14  764  }
f02831be962c7b drivers/net/wireless/iwlwifi/pcie/tx.c       Emmanuel Grumbach 2012-11-14  765  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
