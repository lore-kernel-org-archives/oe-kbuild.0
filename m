Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92D7CA52
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Jan 2026 18:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767292548; cv=none; b=Se13lg8FujGlCrnGhruOQ60Ahl1FkBMMqxIZ7aise0CgzbGvbluvrOywwyNjH9j/nYWhL1mkkmDNqgDvSh16YbpipY0lftFd9O6qYuuU+RkWI0YaEtLYjfjoxTOGWnuahiSOj3KSh0ZvdKHQVya39r6125ZUih4SDyGL/Q1swPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767292548; c=relaxed/simple;
	bh=fH4uNP3qCgoRP6HE0LCM2VYe6dMvRhGxJZBkU9jpwtQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IfqaIpEaYNg22+k83wTbegdjOss/thxFAiwP4ibZVwrqL4s/Tkrd+2L4Fef4ctDXsP+vj2a63U0+oNgsRy4Ihfx6ERC/CzVdi5fCXI+P1DC0aVWJofvkO2D4kQrx+tyB6G5TJIMriMotjL8stnIQ95aZDMx4KPjQ7dyVlpaI3vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jg11qvNi; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jg11qvNi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767292547; x=1798828547;
  h=date:from:to:cc:subject:message-id;
  bh=fH4uNP3qCgoRP6HE0LCM2VYe6dMvRhGxJZBkU9jpwtQ=;
  b=Jg11qvNi69e4E6pFClpDugpvskphAzzCoa3I9f4K0tnevb8FUYPtNZSU
   2pTYFCSUOGcGeHYWuaMqR+Ioll5pUqwbiXUYZg4gC8kgJ+Q1jqeaeqrza
   R0ZjCo0aOG+QRVeDTgTg9PrzRkpyLSb34cJOwvq2tCScucSa9l+IGdoGV
   WGQrwD0RpxlX7ETcQ+dI2/37g0NmFV8DANpxblA4Y2oUq54WWA9kBV+X1
   LI5g8PlnjOZOPEkoAdWWLh4b03iXF7YH84T+iW8xbt4tI8Cc/rqz9Re5p
   9cMfVXu/GHAgd4xM6cIvbtHdLDM5j/R8mVeNtZqFvShftNXSErOWN8TPt
   w==;
X-CSE-ConnectionGUID: 1KQLidxPR46AZ7UptgFbXQ==
X-CSE-MsgGUID: jrUS8vGaRzW0hQokE+w0qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="86401143"
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="86401143"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 10:35:46 -0800
X-CSE-ConnectionGUID: fQsu1PkmRNe9ICazMmDh3A==
X-CSE-MsgGUID: Pe2OYfGtRESsXkMD88v8hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="201428369"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Jan 2026 10:35:45 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbNWQ-000000001zX-2OQS;
	Thu, 01 Jan 2026 18:35:42 +0000
Date: Fri, 02 Jan 2026 02:35:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/spi/spi-stm32-ospi.c:658:1-20: iterator with update
 on line 684
Message-ID: <202601020217.4qGKFMhG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Patrice Chotard <patrice.chotard@foss.st.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b69053dd3ffbc0d2dedbbc86182cdef6f641fe1b
commit: 79b8a705e26c08f8f09dd55f1dd56f2375973d2d spi: stm32: Add OSPI driver
date:   10 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-r051-20251231 (https://download.01.org/0day-ci/archive/20260102/202601020217.4qGKFMhG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 86b9f90b9574b3a7d15d28a91f6316459dcfa046)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601020217.4qGKFMhG-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-stm32-ospi.c:658:1-20: iterator with update on line 684

vim +658 drivers/spi/spi-stm32-ospi.c

79b8a705e26c08 Patrice Chotard 2025-02-19  636  
79b8a705e26c08 Patrice Chotard 2025-02-19  637  static int stm32_ospi_transfer_one_message(struct spi_controller *ctrl,
79b8a705e26c08 Patrice Chotard 2025-02-19  638  					   struct spi_message *msg)
79b8a705e26c08 Patrice Chotard 2025-02-19  639  {
79b8a705e26c08 Patrice Chotard 2025-02-19  640  	struct stm32_ospi *ospi = spi_controller_get_devdata(ctrl);
79b8a705e26c08 Patrice Chotard 2025-02-19  641  	struct spi_transfer *transfer;
79b8a705e26c08 Patrice Chotard 2025-02-19  642  	struct spi_device *spi = msg->spi;
79b8a705e26c08 Patrice Chotard 2025-02-19  643  	struct spi_mem_op op;
79b8a705e26c08 Patrice Chotard 2025-02-19  644  	struct gpio_desc *cs_gpiod = spi->cs_gpiod[ffs(spi->cs_index_mask) - 1];
79b8a705e26c08 Patrice Chotard 2025-02-19  645  	int ret = 0;
79b8a705e26c08 Patrice Chotard 2025-02-19  646  
79b8a705e26c08 Patrice Chotard 2025-02-19  647  	if (!cs_gpiod)
79b8a705e26c08 Patrice Chotard 2025-02-19  648  		return -EOPNOTSUPP;
79b8a705e26c08 Patrice Chotard 2025-02-19  649  
79b8a705e26c08 Patrice Chotard 2025-02-19  650  	ret = pm_runtime_resume_and_get(ospi->dev);
79b8a705e26c08 Patrice Chotard 2025-02-19  651  	if (ret < 0)
79b8a705e26c08 Patrice Chotard 2025-02-19  652  		return ret;
79b8a705e26c08 Patrice Chotard 2025-02-19  653  
79b8a705e26c08 Patrice Chotard 2025-02-19  654  	mutex_lock(&ospi->lock);
79b8a705e26c08 Patrice Chotard 2025-02-19  655  
79b8a705e26c08 Patrice Chotard 2025-02-19  656  	gpiod_set_value_cansleep(cs_gpiod, true);
79b8a705e26c08 Patrice Chotard 2025-02-19  657  
79b8a705e26c08 Patrice Chotard 2025-02-19 @658  	list_for_each_entry(transfer, &msg->transfers, transfer_list) {
79b8a705e26c08 Patrice Chotard 2025-02-19  659  		u8 dummy_bytes = 0;
79b8a705e26c08 Patrice Chotard 2025-02-19  660  
79b8a705e26c08 Patrice Chotard 2025-02-19  661  		memset(&op, 0, sizeof(op));
79b8a705e26c08 Patrice Chotard 2025-02-19  662  
79b8a705e26c08 Patrice Chotard 2025-02-19  663  		dev_dbg(ospi->dev, "tx_buf:%p tx_nbits:%d rx_buf:%p rx_nbits:%d len:%d dummy_data:%d\n",
79b8a705e26c08 Patrice Chotard 2025-02-19  664  			transfer->tx_buf, transfer->tx_nbits,
79b8a705e26c08 Patrice Chotard 2025-02-19  665  			transfer->rx_buf, transfer->rx_nbits,
79b8a705e26c08 Patrice Chotard 2025-02-19  666  			transfer->len, transfer->dummy_data);
79b8a705e26c08 Patrice Chotard 2025-02-19  667  
79b8a705e26c08 Patrice Chotard 2025-02-19  668  		/*
79b8a705e26c08 Patrice Chotard 2025-02-19  669  		 * OSPI hardware supports dummy bytes transfer.
79b8a705e26c08 Patrice Chotard 2025-02-19  670  		 * If current transfer is dummy byte, merge it with the next
79b8a705e26c08 Patrice Chotard 2025-02-19  671  		 * transfer in order to take into account OSPI block constraint
79b8a705e26c08 Patrice Chotard 2025-02-19  672  		 */
79b8a705e26c08 Patrice Chotard 2025-02-19  673  		if (transfer->dummy_data) {
79b8a705e26c08 Patrice Chotard 2025-02-19  674  			op.dummy.buswidth = transfer->tx_nbits;
79b8a705e26c08 Patrice Chotard 2025-02-19  675  			op.dummy.nbytes = transfer->len;
79b8a705e26c08 Patrice Chotard 2025-02-19  676  			dummy_bytes = transfer->len;
79b8a705e26c08 Patrice Chotard 2025-02-19  677  
79b8a705e26c08 Patrice Chotard 2025-02-19  678  			/* If happens, means that message is not correctly built */
79b8a705e26c08 Patrice Chotard 2025-02-19  679  			if (list_is_last(&transfer->transfer_list, &msg->transfers)) {
79b8a705e26c08 Patrice Chotard 2025-02-19  680  				ret = -EINVAL;
79b8a705e26c08 Patrice Chotard 2025-02-19  681  				goto end_of_transfer;
79b8a705e26c08 Patrice Chotard 2025-02-19  682  			}
79b8a705e26c08 Patrice Chotard 2025-02-19  683  
79b8a705e26c08 Patrice Chotard 2025-02-19 @684  			transfer = list_next_entry(transfer, transfer_list);
79b8a705e26c08 Patrice Chotard 2025-02-19  685  		}
79b8a705e26c08 Patrice Chotard 2025-02-19  686  
79b8a705e26c08 Patrice Chotard 2025-02-19  687  		op.data.nbytes = transfer->len;
79b8a705e26c08 Patrice Chotard 2025-02-19  688  
79b8a705e26c08 Patrice Chotard 2025-02-19  689  		if (transfer->rx_buf) {
79b8a705e26c08 Patrice Chotard 2025-02-19  690  			ospi->fmode = CR_FMODE_INDR;
79b8a705e26c08 Patrice Chotard 2025-02-19  691  			op.data.buswidth = transfer->rx_nbits;
79b8a705e26c08 Patrice Chotard 2025-02-19  692  			op.data.dir = SPI_MEM_DATA_IN;
79b8a705e26c08 Patrice Chotard 2025-02-19  693  			op.data.buf.in = transfer->rx_buf;
79b8a705e26c08 Patrice Chotard 2025-02-19  694  		} else {
79b8a705e26c08 Patrice Chotard 2025-02-19  695  			ospi->fmode = CR_FMODE_INDW;
79b8a705e26c08 Patrice Chotard 2025-02-19  696  			op.data.buswidth = transfer->tx_nbits;
79b8a705e26c08 Patrice Chotard 2025-02-19  697  			op.data.dir = SPI_MEM_DATA_OUT;
79b8a705e26c08 Patrice Chotard 2025-02-19  698  			op.data.buf.out = transfer->tx_buf;
79b8a705e26c08 Patrice Chotard 2025-02-19  699  		}
79b8a705e26c08 Patrice Chotard 2025-02-19  700  
79b8a705e26c08 Patrice Chotard 2025-02-19  701  		ret = stm32_ospi_send(spi, &op);
79b8a705e26c08 Patrice Chotard 2025-02-19  702  		if (ret)
79b8a705e26c08 Patrice Chotard 2025-02-19  703  			goto end_of_transfer;
79b8a705e26c08 Patrice Chotard 2025-02-19  704  
79b8a705e26c08 Patrice Chotard 2025-02-19  705  		msg->actual_length += transfer->len + dummy_bytes;
79b8a705e26c08 Patrice Chotard 2025-02-19  706  	}
79b8a705e26c08 Patrice Chotard 2025-02-19  707  
79b8a705e26c08 Patrice Chotard 2025-02-19  708  end_of_transfer:
79b8a705e26c08 Patrice Chotard 2025-02-19  709  	gpiod_set_value_cansleep(cs_gpiod, false);
79b8a705e26c08 Patrice Chotard 2025-02-19  710  
79b8a705e26c08 Patrice Chotard 2025-02-19  711  	mutex_unlock(&ospi->lock);
79b8a705e26c08 Patrice Chotard 2025-02-19  712  
79b8a705e26c08 Patrice Chotard 2025-02-19  713  	msg->status = ret;
79b8a705e26c08 Patrice Chotard 2025-02-19  714  	spi_finalize_current_message(ctrl);
79b8a705e26c08 Patrice Chotard 2025-02-19  715  
79b8a705e26c08 Patrice Chotard 2025-02-19  716  	pm_runtime_mark_last_busy(ospi->dev);
79b8a705e26c08 Patrice Chotard 2025-02-19  717  	pm_runtime_put_autosuspend(ospi->dev);
79b8a705e26c08 Patrice Chotard 2025-02-19  718  
79b8a705e26c08 Patrice Chotard 2025-02-19  719  	return ret;
79b8a705e26c08 Patrice Chotard 2025-02-19  720  }
79b8a705e26c08 Patrice Chotard 2025-02-19  721  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
