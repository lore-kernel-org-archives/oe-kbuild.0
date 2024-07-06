Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7896273176
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jul 2024 10:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720261243; cv=none; b=pQiI/v7rxFKH3vEdzw0taa0s/Pre8fS2nW5FxIs3lpZcUDK9NytZicQE8B1ew5RO6wIXVqWRtSOJJjI6VXLNNkNnMkFDhBA2ELH5p5rYgxdiiFX/Rxx0LJI1jdFG2SVP04VnEaCrkWXOLUERTpCdH0bl4SZxn6aIM4kXGEjGHcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720261243; c=relaxed/simple;
	bh=J1tkKsRP7eiRe/jaEAAq1NGJdu9lv5za4rPDpx8+DWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UldThIGxRYk0AdYvil3D3IwpIoRSSswX3vpGGHNSftlRnHxKB3MXYb3qvE6GICT9EmHffB9tvU6P3LZze4lXvbc1xUm8A0DAlZm6oZFd/PVhOtSCx3KsLalw5N8AgUheQngC/ZcSF4X1KGLy39UfUDqMLM7ALqFZqVAnCXUXFlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C6G2WUrd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C6G2WUrd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720261241; x=1751797241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J1tkKsRP7eiRe/jaEAAq1NGJdu9lv5za4rPDpx8+DWw=;
  b=C6G2WUrd6lUWJVQcbBKmOBlg184N/HolX+vMHVtPThPjq01JyZF1bUdy
   V7hXiJQSD8BrFVoJQX2iJtV1ur+bHS55YvQNgxd2sjJoJzJqMdTAB+1Nu
   5P4OTU1ivwxAq4wkSPCz3zT9TYZcDvPGfPP8iZRuw0XO9n6XZcbwOvpKJ
   AhVSEPACyF1CgCkOO6cY6ZndDRbowGikBV7ltAreSzb5ulTMjuGm8HHuu
   OkZRAMfobww6inVVqi+0o7w3+1S0fBQbITK23zmwIE277hkuoEz4c+Asu
   WJWOkHD3xZnfvY8J1LKVC4FOps4bol4YzWpI+bguNzStldGcd2kqpCRnR
   A==;
X-CSE-ConnectionGUID: Oc24TsRbT1a7uRWEGoDTAg==
X-CSE-MsgGUID: 3p+N4bu5T+a/QjnUtXf2WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17658909"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="17658909"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 03:20:41 -0700
X-CSE-ConnectionGUID: D+H7vWObQfSdR/wgtx+DKg==
X-CSE-MsgGUID: xSJNKMK7Q+SEWIs6JkOJdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="47134936"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Jul 2024 03:20:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQ2Wz-000TeK-0p;
	Sat, 06 Jul 2024 10:20:37 +0000
Date: Sat, 6 Jul 2024 18:19:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4427/10451]
 drivers/net/wireless/intel/iwlwifi/pcie/tx.c:690 iwl_pcie_txq_alloc() warn:
 check sign expansion for 'slots_num'
Message-ID: <202407061802.YbfJkjGB-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Johannes Berg <johannes.berg@intel.com>
CC: Miri Korenblit <miriam.rachel.korenblit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: 49101078be769e9c50a8bfbc8caaab56db9d12d9 [4427/10451] wifi: iwlwifi: pcie: integrate TX queue code
:::::: branch date: 3 days ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-161-20240706 (https://download.01.org/0day-ci/archive/20240706/202407061802.YbfJkjGB-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407061802.YbfJkjGB-lkp@intel.com/

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
