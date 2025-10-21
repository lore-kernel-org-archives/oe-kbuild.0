Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAD532ED20
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 11:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761046878; cv=none; b=LpSiTyj0zCUpePCwbxs0vfoG6udTvPDP8R6sdLskrIJN+HGJhNex9GbtPFIgcWOkxHn0Zr77xL3FzYJ5ICPogZyb4Pv6ThkQXzBwCfIdfrwYPlrm4iI5W1jIcRMWiBIDT5LM6pnY74OQ2TjzIVg/4hK1+iO/x8bhrZ3b20+TVe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761046878; c=relaxed/simple;
	bh=ltYv5QGx46hqBY3SLB1Bcvv57kwX1h1skMi/xWXphcM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hKqrBmAgVu7tTHEfXxgFtEkRfnV0t9y5fWNomW1kW0/zSVvuKvB0JL3g5mq3dl9lqn5dNiO9JhlHKzoLKTxiLhDjH9r9V5yYabWdOs8J4gkcI/PV/4zBqoyu2HPRTRbMHgauNLavnewhXOzHaiaPyhIJpmWWiMFXdw1deBAsaa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5yOnWIK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5yOnWIK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761046877; x=1792582877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ltYv5QGx46hqBY3SLB1Bcvv57kwX1h1skMi/xWXphcM=;
  b=C5yOnWIKpmMO2zx5DQtX1jLE2c47uLhOY7Hhvb1Z1fXUfphBaPEMyXmU
   tMiRQ9WBfjGFzJ6UHFQjODXbGk5UReHqRSSlI9OYRa4ctLr5FDPLE4tve
   XncDiXN45FAdJHdr1PJjqL6g8necxig8Es9dTt+D6eOqAskDDUC+5Hb9E
   NGkshzeuBTV/COBRKx3uUk63iegwktKnkwhDI2I0ok3Xoh8XNFexD43v+
   qQfS9yZWHI7PRgjx+RtMWyYFZtk2zCIhgPDUfjRba/smTSLpyfwMChn+5
   I9ddr4X/i/rgB86AYrVUcS9qR1IPbLCMHj//r5zyuR+VyXqT/rqLoNChi
   g==;
X-CSE-ConnectionGUID: HeigfcDjTmeK8EvDQ+HZJw==
X-CSE-MsgGUID: 2/r0NNrPQE2rwTJq6IZwKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63210122"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="63210122"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 04:41:16 -0700
X-CSE-ConnectionGUID: qKljPoBIRkqLQCwnnNCk6w==
X-CSE-MsgGUID: WnZVC9RbRBG8hp8ZjITRvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="184052164"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Oct 2025 04:41:15 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBAjp-000An0-0D;
	Tue, 21 Oct 2025 11:41:13 +0000
Date: Tue, 21 Oct 2025 19:38:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/mtd/nand/qpic_common.c:261:49: sparse: signed value source
Message-ID: <202510211903.mGRGqeM0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/mtd/nand/qpic_common.c:261:49: sparse: signed value source"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Md Sadre Alam <quic_mdalam@quicinc.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6548d364a3e850326831799d7e3ea2d7bb97ba08
commit: fdf3ee5c6e5278dab4f60b998b47ed2d510bf80f mtd: nand: Add qpic_common API file
date:   10 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 10 months ago
config: m68k-randconfig-r131-20251021 (https://download.01.org/0day-ci/archive/20251021/202510211903.mGRGqeM0-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510211903.mGRGqeM0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510211903.mGRGqeM0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/mtd/nand/qpic_common.c: note: in included file (through include/linux/dmaengine.h):
   include/linux/scatterlist.h:187:9: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/mtd/nand/qpic_common.c:261:49: sparse: signed value source

vim +261 drivers/mtd/nand/qpic_common.c

fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  218  
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  219  /**
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  220   * qcom_prep_bam_dma_desc_cmd() - Prepares the command descriptor for BAM DMA
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  221   * @nandc: qpic nand controller
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  222   * @read: read or write type
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  223   * @reg_off: offset within the controller's data buffer
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  224   * @vaddr: virtual address of the buffer we want to write to
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  225   * @size: DMA transaction size in bytes
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  226   * @flags: flags to control DMA descriptor preparation
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  227   *
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  228   * This function will prepares the command descriptor for BAM DMA
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  229   * which will be used for NAND register reads and writes.
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  230   */
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  231  int qcom_prep_bam_dma_desc_cmd(struct qcom_nand_controller *nandc, bool read,
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  232  			       int reg_off, const void *vaddr,
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  233  			       int size, unsigned int flags)
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  234  {
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  235  	int bam_ce_size;
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  236  	int i, ret;
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  237  	struct bam_cmd_element *bam_ce_buffer;
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  238  	struct bam_transaction *bam_txn = nandc->bam_txn;
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  239  
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  240  	bam_ce_buffer = &bam_txn->bam_ce[bam_txn->bam_ce_pos];
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  241  
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  242  	/* fill the command desc */
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  243  	for (i = 0; i < size; i++) {
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  244  		if (read)
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  245  			bam_prep_ce(&bam_ce_buffer[i],
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  246  				    nandc_reg_phys(nandc, reg_off + 4 * i),
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  247  				    BAM_READ_COMMAND,
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  248  				    reg_buf_dma_addr(nandc,
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  249  						     (__le32 *)vaddr + i));
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  250  		else
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  251  			bam_prep_ce_le32(&bam_ce_buffer[i],
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  252  					 nandc_reg_phys(nandc, reg_off + 4 * i),
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  253  					 BAM_WRITE_COMMAND,
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  254  					 *((__le32 *)vaddr + i));
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  255  	}
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  256  
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  257  	bam_txn->bam_ce_pos += size;
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  258  
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  259  	/* use the separate sgl after this command */
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  260  	if (flags & NAND_BAM_NEXT_SGL) {
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20 @261  		bam_ce_buffer = &bam_txn->bam_ce[bam_txn->bam_ce_start];
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  262  		bam_ce_size = (bam_txn->bam_ce_pos -
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  263  				bam_txn->bam_ce_start) *
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  264  				sizeof(struct bam_cmd_element);
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  265  		sg_set_buf(&bam_txn->cmd_sgl[bam_txn->cmd_sgl_pos],
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  266  			   bam_ce_buffer, bam_ce_size);
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  267  		bam_txn->cmd_sgl_pos++;
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  268  		bam_txn->bam_ce_start = bam_txn->bam_ce_pos;
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  269  
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  270  		if (flags & NAND_BAM_NWD) {
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  271  			ret = qcom_prepare_bam_async_desc(nandc, nandc->cmd_chan,
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  272  							  DMA_PREP_FENCE | DMA_PREP_CMD);
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  273  			if (ret)
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  274  				return ret;
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  275  		}
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  276  	}
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  277  
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  278  	return 0;
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  279  }
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  280  EXPORT_SYMBOL(qcom_prep_bam_dma_desc_cmd);
fdf3ee5c6e5278 Md Sadre Alam 2024-11-20  281  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
