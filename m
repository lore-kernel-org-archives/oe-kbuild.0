Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087FC2356BA
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Apr 2025 09:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574903; cv=none; b=ht46AP2g+D5fSXCTb9tGU0nMctS+6bMxwZ4eYnNAijp6pxCBmr/RpCy3tDNtPiptYPFQnz/QQKohs2cCcLxJeO2hGgt6Vav9udsYrFH6coU4mxYz+nPKr3mb6NPASAcI2aX6TVAe9nsTyh6nBaxgh8f2E3w+s4OHfRt46m70i9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574903; c=relaxed/simple;
	bh=XsKPJjJ1X/7dzn4lDGwbQvw5DvTf4fdFKN5AtSKchjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=prVZofRcCjPrnA3p/igmJJYmNofmCHck8PTFsNsPLObUHLKe0HQ3dhiL4upW0Xl6Tl8RYKENA/Txd8D29R8r3C9BsLJ2ypXETHDIC+Vyp0pqLI5FSyGfkfK7bgULF02x9eEUdqbDDBKjMSdXOJqrEqsqnavy1pY4bjbRkk1tvnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+6LEMQq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+6LEMQq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745574901; x=1777110901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XsKPJjJ1X/7dzn4lDGwbQvw5DvTf4fdFKN5AtSKchjs=;
  b=J+6LEMQqAJv1RpzUGmgx9aFjn7fLAc6KcxY7+vpN3WCcte9kZVCcejFJ
   H6vv7vXNjJcfkV49DofBFSlAsIbPIZZEdBse6T6IpNnKlW6H9MpRv9WxL
   JU6eWCxP2r2Dnhbh8TW6ST5FSmdf5ymWgYsBIwzp4A5XIZ9+yYnPIP2YY
   zXioDpkYoB+dZunVZT8J4O6N1615KOcP56xB3V8VHDYLNrxZJhcXeEffb
   8GwrvYZU84c3LHKBgnSVyGbgB+VT5VcE2ZxQYHYjfTHdGcHFpJ4eIG+AW
   C+cGrp1PBGcJjPWZ+Bn5wpwPlkdVlK+rjb4g5ar5E1x2phlfJtpxFB0WF
   A==;
X-CSE-ConnectionGUID: soVrWCBKTUCYCuTrtIFpMg==
X-CSE-MsgGUID: TERhrKs5RIq+c0Ykr/LPfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47404415"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47404415"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 02:55:00 -0700
X-CSE-ConnectionGUID: 9C1jMuRLSVayRjcv+LUEPA==
X-CSE-MsgGUID: +HEUWoW8RHueYh2Ak8hy4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="163829495"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Apr 2025 02:54:58 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Flo-00052u-0A;
	Fri, 25 Apr 2025 09:54:56 +0000
Date: Fri, 25 Apr 2025 17:54:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 2167/2167]
 drivers/net/wireless/intel/iwlwifi/queue/tx.c:1050 iwl_txq_alloc() warn:
 check sign expansion for 'slots_num'
Message-ID: <202504251739.SxAj6bXJ-lkp@intel.com>
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
TO: kernel@openeuler.org

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   2f6f8a0f52903845ede4602b637dd1323aef3592
commit: c83031afaaaa4a1129394439c8cd93ffe94f9970 [2167/2167] wifi: iwlwifi: pcie: point invalid TFDs to invalid data
:::::: branch date: 26 hours ago
:::::: commit date: 1 year, 8 months ago
config: x86_64-randconfig-161-20250425 (https://download.01.org/0day-ci/archive/20250425/202504251739.SxAj6bXJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504251739.SxAj6bXJ-lkp@intel.com/

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
