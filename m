Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7969180A81
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Aug 2024 21:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725140545; cv=none; b=fs8H6TGPsLjuxaM2cT+05/XZqS73ox23cR2NTM/BkPZ3ZJorJTS/d3vJ+UKQkXNCpWuDq0VSVxmQ+QrRCsSnJlHwY81Tr+UVs0ODIzvfqMQ0tTCRFLYOqfZD1M13uJkgHI9cnUz4DO3msK+kYMA1YQ8qudl5A0nz7XI5cIEIBBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725140545; c=relaxed/simple;
	bh=YAbLmVRSMjEMKOb7ev2ywCta6rqrjRWdsI1a1R2QoXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QOIf0ULLXnSNiJ6O8jRrhqd+CM5Z/Zc3qBbTcDxNNis7EXn3N5T3ieJtZcHprB2dYw2257Nmrj293N0dFz9BWIEflkWt4iXaBvY7pWKFEvKMkn4z//EuLQs5PlS7WSb2Ztn95kbgxeJ2LF4/AvwdS6fMVHJWWDKQZkD2dzM/bAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MtxtbYkX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtxtbYkX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725140543; x=1756676543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YAbLmVRSMjEMKOb7ev2ywCta6rqrjRWdsI1a1R2QoXY=;
  b=MtxtbYkXL8ydJO/Hz4n+qfQpSiLBINSDIiOLHg9WHNsZqvLfWXPezfmX
   Jen4VbIv8N0aAfcfcY0O83W60q619hMll1Wf/OLvelqcMpgX8aKgKcQ92
   oxlZmpg+frQUweRxig7SP2vMVlB7auxjGIGI0PhSRLenV9bEq5dBCXyyh
   /FmzwHwePN7qRrH7dgVt8TG8awpQzFoo+JHkWNll7h5BC5osnhk/WkZLI
   QwMFCCjl53XQtySgj/LPivSB9k2eAO5T1NV/yOwbSEHwk4x7TsB2Y2cL3
   9n8SgJHhFk9RrbRDIHX+LeiuTmBfMPgmZjtvl4xWgZIzE7PRIzDqdWCbe
   Q==;
X-CSE-ConnectionGUID: 6XdiCU1fQcGxKi2/OqgazA==
X-CSE-MsgGUID: M+Cs/IPCSpuoi6CGt9KpKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="35163899"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="35163899"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 14:42:22 -0700
X-CSE-ConnectionGUID: UjRW6NpyQFqstBWvtp2QEg==
X-CSE-MsgGUID: PYOpotswQhK1g3do/NG8Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="94938109"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Aug 2024 14:42:21 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skVrP-00039S-0U;
	Sat, 31 Aug 2024 21:42:19 +0000
Date: Sun, 1 Sep 2024 05:42:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/dma/mv_xor.o: warning: objtool: mv_xor_prep_dma_xor+0x284:
 unreachable instruction
Message-ID: <202409010524.hnyDITUw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tiezhu Yang <yangtiezhu@loongson.cn>
CC: Huacai Chen <chenhuacai@kernel.org>
CC: Jinyang He <hejinyang@loongson.cn>
CC: Youling Tang <tangyouling@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e8784b0aef62cd6117e1c93c64d060e4c7314a1f
commit: cb8a2ef0848ca80d67d6d56e2df757cfdf6b3355 LoongArch: Add ORC stack unwinder support
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
config: loongarch-randconfig-002-20240829 (https://download.01.org/0day-ci/archive/20240901/202409010524.hnyDITUw-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010524.hnyDITUw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409010524.hnyDITUw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/mv_xor.o: warning: objtool: mv_xor_prep_dma_xor+0x284: unreachable instruction
--
>> drivers/scsi/esp_scsi.o: warning: objtool: esp_free_lun_tag+0x98: unreachable instruction
--
>> drivers/net/virtio_net.o: warning: objtool: mergeable_rx_buffer_size_show+0xb8: unreachable instruction
--
>> drivers/target/tcm_fc/tfc_io.o: warning: objtool: ft_queue_data_in+0x314: unreachable instruction
>> drivers/target/tcm_fc/tfc_io.o: warning: objtool: ft_recv_write_data+0x1d0: unreachable instruction
--
>> drivers/scsi/bnx2fc/bnx2fc_tgt.o: warning: objtool: bnx2fc_flush_active_ios+0x3cc: unreachable instruction
--
   drivers/net/ethernet/brocade/bna/bnad.c: In function 'bnad_setup_tx':
   drivers/net/ethernet/brocade/bna/bnad.c:1537:51: warning: ' TXQ ' directive writing 5 bytes into a region of size between 1 and 16 [-Wformat-overflow=]
    1537 |                 sprintf(tx_info->tcb[i]->name, "%s TXQ %d", bnad->netdev->name,
         |                                                   ^~~~~
   In function 'bnad_tx_msix_register',
       inlined from 'bnad_setup_tx' at drivers/net/ethernet/brocade/bna/bnad.c:1998:9:
   drivers/net/ethernet/brocade/bna/bnad.c:1537:48: note: using the range [-2147483648, 2147483647] for directive argument
    1537 |                 sprintf(tx_info->tcb[i]->name, "%s TXQ %d", bnad->netdev->name,
         |                                                ^~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c:1537:17: note: 'sprintf' output between 7 and 32 bytes into a destination of size 16
    1537 |                 sprintf(tx_info->tcb[i]->name, "%s TXQ %d", bnad->netdev->name,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1538 |                                 tx_id + tx_info->tcb[i]->id);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c: In function 'bnad_setup_rx':
   drivers/net/ethernet/brocade/bna/bnad.c:1588:59: warning: ' CQ ' directive writing 4 bytes into a region of size between 1 and 16 [-Wformat-overflow=]
    1588 |                 sprintf(rx_info->rx_ctrl[i].ccb->name, "%s CQ %d",
         |                                                           ^~~~
   In function 'bnad_rx_msix_register',
       inlined from 'bnad_setup_rx' at drivers/net/ethernet/brocade/bna/bnad.c:2260:9:
   drivers/net/ethernet/brocade/bna/bnad.c:1588:56: note: using the range [-2147483648, 2147483647] for directive argument
    1588 |                 sprintf(rx_info->rx_ctrl[i].ccb->name, "%s CQ %d",
         |                                                        ^~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c:1588:17: note: 'sprintf' output between 6 and 31 bytes into a destination of size 16
    1588 |                 sprintf(rx_info->rx_ctrl[i].ccb->name, "%s CQ %d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1589 |                         bnad->netdev->name,
         |                         ~~~~~~~~~~~~~~~~~~~
    1590 |                         rx_id + rx_info->rx_ctrl[i].ccb->id);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/brocade/bna/bnad.o: warning: objtool: bnad_cb_tx_resume+0xb4: unreachable instruction
--
>> drivers/net/ethernet/brocade/bna/bna_tx_rx.o: warning: objtool: bna_bfi_rx_enet_start.constprop.0+0x248: unreachable instruction
--
>> drivers/net/ethernet/brocade/bna/bfa_ioc_ct.o: warning: objtool: bfa_ioc_ct2_pll_init+0x210: unreachable instruction
--
>> drivers/scsi/csiostor/csio_rnode.o: warning: objtool: csio_confirm_rnode+0x4c0: unreachable instruction
--
>> drivers/scsi/bnx2i/bnx2i_iscsi.o: warning: objtool: bnx2i_task_xmit+0x3ac: unreachable instruction
--
>> drivers/net/ethernet/mellanox/mlxsw/core.o: warning: objtool: __mlxsw_item_offset+0xb0: unreachable instruction
..


objdump-func vmlinux.o mv_xor_prep_dma_xor:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
