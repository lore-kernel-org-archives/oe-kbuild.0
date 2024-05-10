Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785877EEF8
	for <oe-kbuild@lists.linux.dev>; Fri, 10 May 2024 10:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715337906; cv=none; b=roJYn9vf8Cr3ObNfqXnvWueIPkEqGE1lVglxgf1G/3rWx1UT7q29EwHm5qWOZdTQl3/LCebgL2Jm5AKDX4spMOpsueFuCnleK4kBMjCgpDEyCE29f4gHo4c3jxbIwZQSi8+iWiO4C1/Z8KjPwjW/EFEjb6foBCA0so+xUuz5EQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715337906; c=relaxed/simple;
	bh=0xcERPle+RNx6qnu/MvW/zNk113N1Oa1DckLSCid1LA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TfUU0c2B7DB20b905j0WNjflIXCdiCmdTqMmjHdAISobBrg3al/egmhSXbTe8P6SaMvane8cyUnCCd2HceyO9nnB9ZtsvxIOxbwt41pjoEX5MYCfIkXMvKKEVDd5221RNInplno5jnQIz5VwbQHvbmDX6eJfkTZ440uaGRHEIWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6HifF3x; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6HifF3x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715337904; x=1746873904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0xcERPle+RNx6qnu/MvW/zNk113N1Oa1DckLSCid1LA=;
  b=k6HifF3x8qAXtdD35sa1VstV0wbWyQCv0OrV/dmitqj1FQYuqHYLnMN9
   2u99YTvKWREBkb2zIm7p+ORVO497s6CBuA9Hcn5OCzefWggKGX1VHnf2w
   +Gl6K/ZYFDOdx/dKBaf6C/74kitHYo7VXaGy++FAkjFJ8PMRR94ED871d
   Hp6Exr05En54I8Ol4atzWcM6u1aIX5aVFTcoAgZzWTTL1YgH7EOQVmRfc
   PVd34yHEa93Xj/7u20a/sQ5oendeNosIO/O3ROu9MF++CeRi3JGYidPXV
   yTbu6rGcM4mCWnRC+DYCokOFx/hq6m4KBM2j+IddXdH33dKEdXFWQXgsh
   w==;
X-CSE-ConnectionGUID: F3caXP34Tz6pG22PVF5vqg==
X-CSE-MsgGUID: t5vfg/dES/231gdRVNItdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11173825"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="11173825"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 03:45:04 -0700
X-CSE-ConnectionGUID: PQN1vCqYQKKaw135GpS7FA==
X-CSE-MsgGUID: q2pwHLXlRHCkwkQ3J9ssbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="34228581"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 May 2024 03:45:02 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5NkJ-00060g-2x;
	Fri, 10 May 2024 10:44:59 +0000
Date: Fri, 10 May 2024 18:44:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [conor:qwip 5/15] drivers/spi/spi-microchip-core-qspi.c:593:2-8:
 preceding lock on line 586
Message-ID: <202405101807.6rG1rE94-lkp@intel.com>
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
TO: Conor Dooley <conor+lkp@kernel.org>

Hi Conor,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git qwip
head:   520f2563214599bc3abdd1aa6f127f67e084e65f
commit: a68acec2b20292248b54f6f69dda8ef92ee8002a [5/15] try to rationalise the cs stuff
:::::: branch date: 8 days ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-051-20240510 (https://download.01.org/0day-ci/archive/20240510/202405101807.6rG1rE94-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202405101807.6rG1rE94-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-microchip-core-qspi.c:593:2-8: preceding lock on line 586

vim +593 drivers/spi/spi-microchip-core-qspi.c

a68acec2b20292 Conor Dooley  2024-04-23  574  
e08ccfd9874188 Jamie Gibbons 2023-11-29  575  static int mchp_coreqspi_transfer_one_message(struct spi_controller *ctlr,
e08ccfd9874188 Jamie Gibbons 2023-11-29  576  					struct spi_message *m)
e08ccfd9874188 Jamie Gibbons 2023-11-29  577  {
e08ccfd9874188 Jamie Gibbons 2023-11-29  578  	struct mchp_coreqspi *qspi = spi_controller_get_devdata(ctlr);
e08ccfd9874188 Jamie Gibbons 2023-11-29  579  	struct spi_transfer *t = NULL;
e08ccfd9874188 Jamie Gibbons 2023-11-29  580  	u32 control, frames, status;
e08ccfd9874188 Jamie Gibbons 2023-11-29  581  	u32 total_bytes, cmd_bytes = 0, idle_cycles = 0;
e08ccfd9874188 Jamie Gibbons 2023-11-29  582  	int ret;
e08ccfd9874188 Jamie Gibbons 2023-11-29  583  	bool quad = false, dual = false;
a68acec2b20292 Conor Dooley  2024-04-23  584  	bool cs_change = true;
e08ccfd9874188 Jamie Gibbons 2023-11-29  585  
e08ccfd9874188 Jamie Gibbons 2023-11-29 @586  	mutex_lock(&qspi->op_lock);
e08ccfd9874188 Jamie Gibbons 2023-11-29  587  	ret = readl_poll_timeout(qspi->regs + REG_STATUS, status,
e08ccfd9874188 Jamie Gibbons 2023-11-29  588  				 (status & STATUS_READY), 0,
e08ccfd9874188 Jamie Gibbons 2023-11-29  589  				 TIMEOUT_MS);
e08ccfd9874188 Jamie Gibbons 2023-11-29  590  	if (ret) {
e08ccfd9874188 Jamie Gibbons 2023-11-29  591  		dev_err(&ctlr->dev,
e08ccfd9874188 Jamie Gibbons 2023-11-29  592  			"Timeout waiting on QSPI ready.\n");
e08ccfd9874188 Jamie Gibbons 2023-11-29 @593  		return -ETIMEDOUT;
e08ccfd9874188 Jamie Gibbons 2023-11-29  594  	}
e08ccfd9874188 Jamie Gibbons 2023-11-29  595  
e08ccfd9874188 Jamie Gibbons 2023-11-29  596  	ret = mchp_coreqspi_setup_clock(qspi, m->spi);
e08ccfd9874188 Jamie Gibbons 2023-11-29  597  	if (ret)
e08ccfd9874188 Jamie Gibbons 2023-11-29  598  		goto error;
e08ccfd9874188 Jamie Gibbons 2023-11-29  599  
e08ccfd9874188 Jamie Gibbons 2023-11-29  600  	control = readl_relaxed(qspi->regs + REG_CONTROL);
a68acec2b20292 Conor Dooley  2024-04-23  601  	control &= ~(CONTROL_MODE12_MASK | CONTROL_MODE0);
e08ccfd9874188 Jamie Gibbons 2023-11-29  602  	writel_relaxed(control, qspi->regs + REG_CONTROL);
e08ccfd9874188 Jamie Gibbons 2023-11-29  603  
e08ccfd9874188 Jamie Gibbons 2023-11-29  604  	reinit_completion(&qspi->data_completion);
e08ccfd9874188 Jamie Gibbons 2023-11-29  605  
e08ccfd9874188 Jamie Gibbons 2023-11-29  606  	/* Check the total bytes and command bytes */
e08ccfd9874188 Jamie Gibbons 2023-11-29  607  	list_for_each_entry(t, &m->transfers, transfer_list) {
e08ccfd9874188 Jamie Gibbons 2023-11-29  608  		total_bytes += t->len;
e08ccfd9874188 Jamie Gibbons 2023-11-29  609  		if ((!cmd_bytes) && !(t->tx_buf && t->rx_buf))
e08ccfd9874188 Jamie Gibbons 2023-11-29  610  			cmd_bytes = t->len;
e08ccfd9874188 Jamie Gibbons 2023-11-29  611  		if (!t->rx_buf)
e08ccfd9874188 Jamie Gibbons 2023-11-29  612  			cmd_bytes = total_bytes;
e08ccfd9874188 Jamie Gibbons 2023-11-29  613  		if (t->tx_nbits == SPI_NBITS_QUAD || t->rx_nbits == SPI_NBITS_QUAD)
e08ccfd9874188 Jamie Gibbons 2023-11-29  614  			quad = true;
e08ccfd9874188 Jamie Gibbons 2023-11-29  615  		else if (t->tx_nbits == SPI_NBITS_DUAL || t->rx_nbits == SPI_NBITS_DUAL)
e08ccfd9874188 Jamie Gibbons 2023-11-29  616  			dual = true;
e08ccfd9874188 Jamie Gibbons 2023-11-29  617  	}
e08ccfd9874188 Jamie Gibbons 2023-11-29  618  
e08ccfd9874188 Jamie Gibbons 2023-11-29  619  	control = readl_relaxed(qspi->regs + REG_CONTROL);
e08ccfd9874188 Jamie Gibbons 2023-11-29  620  	if (quad) {
e08ccfd9874188 Jamie Gibbons 2023-11-29  621  		control |= (CONTROL_MODE0 | CONTROL_MODE12_EX_RW);
e08ccfd9874188 Jamie Gibbons 2023-11-29  622  	} else if (dual) {
e08ccfd9874188 Jamie Gibbons 2023-11-29  623  		control &= ~CONTROL_MODE0;
e08ccfd9874188 Jamie Gibbons 2023-11-29  624  		control |= CONTROL_MODE12_FULL;
e08ccfd9874188 Jamie Gibbons 2023-11-29  625  	} else {
a68acec2b20292 Conor Dooley  2024-04-23  626  		control &= ~(CONTROL_MODE12_MASK | CONTROL_MODE0);
e08ccfd9874188 Jamie Gibbons 2023-11-29  627  	}
e08ccfd9874188 Jamie Gibbons 2023-11-29  628  
e08ccfd9874188 Jamie Gibbons 2023-11-29  629  	writel_relaxed(control, qspi->regs + REG_CONTROL);
e08ccfd9874188 Jamie Gibbons 2023-11-29  630  	frames = total_bytes & BYTESUPPER_MASK;
e08ccfd9874188 Jamie Gibbons 2023-11-29  631  	writel_relaxed(frames, qspi->regs + REG_FRAMESUP);
e08ccfd9874188 Jamie Gibbons 2023-11-29  632  	frames = total_bytes & BYTESLOWER_MASK;
e08ccfd9874188 Jamie Gibbons 2023-11-29  633  	frames |= cmd_bytes << FRAMES_CMDBYTES_SHIFT;
e08ccfd9874188 Jamie Gibbons 2023-11-29  634  	frames |= idle_cycles << FRAMES_IDLE_SHIFT;
e08ccfd9874188 Jamie Gibbons 2023-11-29  635  	control = readl_relaxed(qspi->regs + REG_CONTROL);
e08ccfd9874188 Jamie Gibbons 2023-11-29  636  	if (control & CONTROL_MODE12_MASK)
e08ccfd9874188 Jamie Gibbons 2023-11-29  637  		frames |= (1 << FRAMES_SHIFT);
e08ccfd9874188 Jamie Gibbons 2023-11-29  638  
e08ccfd9874188 Jamie Gibbons 2023-11-29  639  	frames |= FRAMES_FLAGWORD;
e08ccfd9874188 Jamie Gibbons 2023-11-29  640  	writel_relaxed(frames, qspi->regs + REG_FRAMES);
e08ccfd9874188 Jamie Gibbons 2023-11-29  641  
a68acec2b20292 Conor Dooley  2024-04-23  642  	//TODO: questionable robustness if both cs_change and cs_off toggle
e08ccfd9874188 Jamie Gibbons 2023-11-29  643  	list_for_each_entry(t, &m->transfers, transfer_list) {
a68acec2b20292 Conor Dooley  2024-04-23  644  		//cs_change being set means we need to re-enable
a68acec2b20292 Conor Dooley  2024-04-23  645  		if (cs_change && !t->cs_off)
a68acec2b20292 Conor Dooley  2024-04-23  646  			mchp_coreqspi_activate_cs(m->spi);
a68acec2b20292 Conor Dooley  2024-04-23  647  		else if (cs_change) //cs_off set but we changed it after last xfer so it may be on
a68acec2b20292 Conor Dooley  2024-04-23  648  			mchp_coreqspi_deactivate_cs(m->spi);
e08ccfd9874188 Jamie Gibbons 2023-11-29  649  
e08ccfd9874188 Jamie Gibbons 2023-11-29  650  		if ((t->tx_buf) && (t->rx_buf)){
e08ccfd9874188 Jamie Gibbons 2023-11-29  651  			bool last = false;
e08ccfd9874188 Jamie Gibbons 2023-11-29  652  			qspi->txbuf = (u8 *)t->tx_buf;
e08ccfd9874188 Jamie Gibbons 2023-11-29  653  			qspi->rxbuf = (u8 *)t->rx_buf;
e08ccfd9874188 Jamie Gibbons 2023-11-29  654  			qspi->tx_len = t->len;
e08ccfd9874188 Jamie Gibbons 2023-11-29  655  			if (list_is_last(&t->transfer_list, &m->transfers))
e08ccfd9874188 Jamie Gibbons 2023-11-29  656  				last = true;
e08ccfd9874188 Jamie Gibbons 2023-11-29  657  			mchp_coreqspi_write_read_op(qspi, last);
e08ccfd9874188 Jamie Gibbons 2023-11-29  658  		} else if (t->tx_buf) {
e08ccfd9874188 Jamie Gibbons 2023-11-29  659  			qspi->txbuf = (u8 *)t->tx_buf;
e08ccfd9874188 Jamie Gibbons 2023-11-29  660  			qspi->tx_len = t->len;
e08ccfd9874188 Jamie Gibbons 2023-11-29  661  			mchp_coreqspi_write_op(qspi, true);
e08ccfd9874188 Jamie Gibbons 2023-11-29  662  		} else {
e08ccfd9874188 Jamie Gibbons 2023-11-29  663  			qspi->rxbuf = (u8 *)t->rx_buf;
e08ccfd9874188 Jamie Gibbons 2023-11-29  664  			qspi->rx_len = t->len;
e08ccfd9874188 Jamie Gibbons 2023-11-29  665  		}
e08ccfd9874188 Jamie Gibbons 2023-11-29  666  
a68acec2b20292 Conor Dooley  2024-04-23  667  		cs_change = t->cs_change;
a68acec2b20292 Conor Dooley  2024-04-23  668  
a68acec2b20292 Conor Dooley  2024-04-23  669  		//TODO: address delay
e08ccfd9874188 Jamie Gibbons 2023-11-29  670  		//_spi_transfer_cs_change_delay(m, t);
a68acec2b20292 Conor Dooley  2024-04-23  671  		if (cs_change) {
a68acec2b20292 Conor Dooley  2024-04-23  672  			if (list_is_last(&t->transfer_list, &m->transfers)) {
a68acec2b20292 Conor Dooley  2024-04-23  673  				break; //special meaning, see below
e08ccfd9874188 Jamie Gibbons 2023-11-29  674  			}
a68acec2b20292 Conor Dooley  2024-04-23  675  
a68acec2b20292 Conor Dooley  2024-04-23  676  			// cs_change is set, so disable between xfers
a68acec2b20292 Conor Dooley  2024-04-23  677  			// if cs_off,
a68acec2b20292 Conor Dooley  2024-04-23  678  			if (!t->cs_off)
a68acec2b20292 Conor Dooley  2024-04-23  679  				mchp_coreqspi_deactivate_cs(m->spi);
a68acec2b20292 Conor Dooley  2024-04-23  680  			else
a68acec2b20292 Conor Dooley  2024-04-23  681  				mchp_coreqspi_activate_cs(m->spi);
e08ccfd9874188 Jamie Gibbons 2023-11-29  682  		}
e08ccfd9874188 Jamie Gibbons 2023-11-29  683  	}
e08ccfd9874188 Jamie Gibbons 2023-11-29  684  
e08ccfd9874188 Jamie Gibbons 2023-11-29  685  
a68acec2b20292 Conor Dooley  2024-04-23  686  	// need to wait for a final txdone to know that all data has been sent.
e08ccfd9874188 Jamie Gibbons 2023-11-29  687  	mchp_coreqspi_enable_ints(qspi);
e08ccfd9874188 Jamie Gibbons 2023-11-29  688  	if (!wait_for_completion_timeout(&qspi->data_completion, msecs_to_jiffies(1000)))
e08ccfd9874188 Jamie Gibbons 2023-11-29  689  		ret = -ETIMEDOUT;
e08ccfd9874188 Jamie Gibbons 2023-11-29  690  
e08ccfd9874188 Jamie Gibbons 2023-11-29  691  	m->actual_length = total_bytes;
e08ccfd9874188 Jamie Gibbons 2023-11-29  692  
e08ccfd9874188 Jamie Gibbons 2023-11-29  693  error:
a68acec2b20292 Conor Dooley  2024-04-23  694  	if (ret != 0 || !cs_change) //special case of cs_change for last xfer, set means dont touch line state
a68acec2b20292 Conor Dooley  2024-04-23  695  		mchp_coreqspi_deactivate_cs(m->spi);
e08ccfd9874188 Jamie Gibbons 2023-11-29  696  
e08ccfd9874188 Jamie Gibbons 2023-11-29  697  	m->status = ret;
e08ccfd9874188 Jamie Gibbons 2023-11-29  698  	spi_finalize_current_message(ctlr);
e08ccfd9874188 Jamie Gibbons 2023-11-29  699  	mutex_unlock(&qspi->op_lock);
e08ccfd9874188 Jamie Gibbons 2023-11-29  700  	mchp_coreqspi_disable_ints(qspi);
e08ccfd9874188 Jamie Gibbons 2023-11-29  701  	return ret;
e08ccfd9874188 Jamie Gibbons 2023-11-29  702  }
e08ccfd9874188 Jamie Gibbons 2023-11-29  703  

:::::: The code at line 593 was first introduced by commit
:::::: e08ccfd9874188f0f0142fd19cf0579f43e999be spi: microchip-core-qspi: Add regular transfers

:::::: TO: Jamie Gibbons <jamie.gibbons@microchip.com>
:::::: CC: Conor Dooley <conor.dooley@microchip.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
