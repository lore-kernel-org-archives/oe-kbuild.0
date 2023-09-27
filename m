Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA9146B3
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Sep 2023 02:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695782107; x=1727318107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Qd+JiGgbm5Xv6Sugbx3l/TinSGiRb9Byb/yExL69D8=;
  b=EfqcEPqbq0BgdTc6aFWxQ/PV0TcV5BLGJvN+AuZukCzxJAUefLhBCSxf
   I6BaZ6sD6a5IY+VchlCGyb1KovIghVNEvF0n4NjZmDXTCElvC8M5pGmCm
   UuQ74eLl617SMKtnM7q2ste7YQgS7ryvvkPctgxiLi+8qn60u4Wxj8GAC
   n8ZeJknN+WhkeUxBxSq4ApNpKRwGoZ0ywM50FM+7A5zXEORgB9RkLSBfp
   Bl2fWmg3LrWCPmKeVIV/SP55X2h1havxcKsVKUKfZ3wJyAAFWBfJiDnJ+
   i0qvrscu8kyjXj+IX2M5Kwg6NCZZASHSvKUD46poG9fpH9B7owSqabdDK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="384493569"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="384493569"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 19:35:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="742553664"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="742553664"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 26 Sep 2023 19:35:05 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlKOE-0003dP-2S;
	Wed, 27 Sep 2023 02:35:02 +0000
Date: Wed, 27 Sep 2023 10:34:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/queue/tx.c:1050 iwl_txq_alloc()
 warn: check sign expansion for 'slots_num'
Message-ID: <202309271059.2g18bfib-lkp@intel.com>
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
CC: Gregory Greenman <gregory.greenman@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e945134b680040b8613e962f586d91b6d40292d
commit: c83031afaaaa4a1129394439c8cd93ffe94f9970 wifi: iwlwifi: pcie: point invalid TFDs to invalid data
date:   5 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-161-20230926 (https://download.01.org/0day-ci/archive/20230927/202309271059.2g18bfib-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309271059.2g18bfib-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309271059.2g18bfib-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/queue/tx.c:1050 iwl_txq_alloc() warn: check sign expansion for 'slots_num'

vim +/slots_num +1050 drivers/net/wireless/intel/iwlwifi/queue/tx.c

c83031afaaaa4a Johannes Berg       2023-08-16  1046  
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1047  int iwl_txq_alloc(struct iwl_trans *trans, struct iwl_txq *txq, int slots_num,
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1048  		  bool cmd_queue)
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1049  {
c83031afaaaa4a Johannes Berg       2023-08-16 @1050  	size_t num_entries = trans->trans_cfg->gen2 ?
c83031afaaaa4a Johannes Berg       2023-08-16  1051  		slots_num : trans->trans_cfg->base_params->max_tfd_queue_size;
c83031afaaaa4a Johannes Berg       2023-08-16  1052  	size_t tfd_sz;
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1053  	size_t tb0_buf_sz;
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1054  	int i;
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1055  
2e0ce1de206f8a Anjaneyulu          2023-06-14  1056  	if (WARN_ONCE(slots_num <= 0, "Invalid slots num:%d\n", slots_num))
2e0ce1de206f8a Anjaneyulu          2023-06-14  1057  		return -EINVAL;
2e0ce1de206f8a Anjaneyulu          2023-06-14  1058  
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1059  	if (WARN_ON(txq->entries || txq->tfds))
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1060  		return -EINVAL;
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1061  
c83031afaaaa4a Johannes Berg       2023-08-16  1062  	tfd_sz = trans->txqs.tfd.size * num_entries;
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1063  
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1064  	timer_setup(&txq->stuck_timer, iwl_txq_stuck_timer, 0);
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1065  	txq->trans = trans;
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1066  
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1067  	txq->n_window = slots_num;
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1068  
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1069  	txq->entries = kcalloc(slots_num,
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1070  			       sizeof(struct iwl_pcie_txq_entry),
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1071  			       GFP_KERNEL);
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1072  
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1073  	if (!txq->entries)
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1074  		goto error;
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1075  
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1076  	if (cmd_queue)
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1077  		for (i = 0; i < slots_num; i++) {
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1078  			txq->entries[i].cmd =
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1079  				kmalloc(sizeof(struct iwl_device_cmd),
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1080  					GFP_KERNEL);
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1081  			if (!txq->entries[i].cmd)
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1082  				goto error;
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1083  		}
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1084  
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1085  	/* Circular buffer of transmit frame descriptors (TFDs),
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1086  	 * shared with device */
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1087  	txq->tfds = dma_alloc_coherent(trans->dev, tfd_sz,
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1088  				       &txq->dma_addr, GFP_KERNEL);
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1089  	if (!txq->tfds)
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1090  		goto error;
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1091  
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1092  	BUILD_BUG_ON(sizeof(*txq->first_tb_bufs) != IWL_FIRST_TB_SIZE_ALIGN);
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1093  
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1094  	tb0_buf_sz = sizeof(*txq->first_tb_bufs) * slots_num;
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1095  
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1096  	txq->first_tb_bufs = dma_alloc_coherent(trans->dev, tb0_buf_sz,
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1097  						&txq->first_tb_dma,
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1098  						GFP_KERNEL);
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1099  	if (!txq->first_tb_bufs)
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1100  		goto err_free_tfds;
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1101  
c83031afaaaa4a Johannes Berg       2023-08-16  1102  	for (i = 0; i < num_entries; i++) {
c83031afaaaa4a Johannes Berg       2023-08-16  1103  		void *tfd = iwl_txq_get_tfd(trans, txq, i);
c83031afaaaa4a Johannes Berg       2023-08-16  1104  
c83031afaaaa4a Johannes Berg       2023-08-16  1105  		if (trans->trans_cfg->gen2)
c83031afaaaa4a Johannes Berg       2023-08-16  1106  			iwl_txq_set_tfd_invalid_gen2(trans, tfd);
c83031afaaaa4a Johannes Berg       2023-08-16  1107  		else
c83031afaaaa4a Johannes Berg       2023-08-16  1108  			iwl_txq_set_tfd_invalid_gen1(trans, tfd);
c83031afaaaa4a Johannes Berg       2023-08-16  1109  	}
c83031afaaaa4a Johannes Berg       2023-08-16  1110  
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1111  	return 0;
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1112  err_free_tfds:
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1113  	dma_free_coherent(trans->dev, tfd_sz, txq->tfds, txq->dma_addr);
f973795a8d19cb Lv Yunlong          2021-04-02  1114  	txq->tfds = NULL;
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1115  error:
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1116  	if (txq->entries && cmd_queue)
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1117  		for (i = 0; i < slots_num; i++)
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1118  			kfree(txq->entries[i].cmd);
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1119  	kfree(txq->entries);
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1120  	txq->entries = NULL;
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1121  
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1122  	return -ENOMEM;
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1123  }
0cd1ad2d7fd41e Mordechay Goodstein 2020-09-30  1124  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
