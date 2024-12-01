Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1096A939
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Dec 2024 05:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733032303; cv=none; b=f1AjffHS+lYYWPuUei7y+OZhy+gIE7WBbkxaLH+y+5f7VzkNOk18zO1uWfNz8ZFJIj0El5YEZt7CWV1UOOfQ+ciVsFqhs0B0KQOlSSF7So/vD1Up5vECHKpjNUscussTEJMPP63voQrOshfR/MfDr+T2HifaL4xGosRBXLiJbBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733032303; c=relaxed/simple;
	bh=LitjmSZxHjtyqF1vgEat2536vH8KYM9EL1KjNJ6uZb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KT4CMzkd407b7Wm2MR42vlj4pdzVkoaZ9lxMTRZgq2lVbQ8CVaXQb2QyRa1Yv6m5kU6UXK4F6SIL6JGI42qdnXlnlZdvULceE9sxTq22iPOTbLFZDFdRIK4mKZqAqTVC5FHqASl0s0c3Cs7xI3GjqY89WE8TOnhzk/FVK1X2iu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lyRqNrhQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lyRqNrhQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733032301; x=1764568301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LitjmSZxHjtyqF1vgEat2536vH8KYM9EL1KjNJ6uZb4=;
  b=lyRqNrhQIMff6irMxt7rrYxFNB7z58oexTnKUDM6PNulDR+sgwg+2VhB
   10js1UkmbX285sag/SMXsvxz0P7O8Hk8RkZple786khH5vylFlSHH1z7j
   ET/sTlzxfCrI/kJU8lsrmEy2gT/bn6+7VLfZR1KQs8hMN8r6XNvXQUCdg
   DGVj1zpJRifn/smg7fLg3dVCw6oU4zJfr4npsPYyCZd5FUXZ8XEcGtxjz
   USVM05GTGttJtBydOYgR8pTPk1VXRNSYLm6PJbjvkMDT5s5RKeOeXHCo7
   XxX8nLI6WylNhs4tR+2/+ig/f4OiWoD4tcLEu5UsLgFiIs3do8xaoAC3r
   A==;
X-CSE-ConnectionGUID: 2Lxvu2zoRgeU5ILEzLl+pA==
X-CSE-MsgGUID: OR0E3MSSQZ2cMARy09ejZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="58605526"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="58605526"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 21:51:39 -0800
X-CSE-ConnectionGUID: G2aVRjKbRHCx2j8ebkBXYg==
X-CSE-MsgGUID: 1Dt70GKATda9MDBZ+mC2Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="97913167"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 30 Nov 2024 21:51:38 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHcrj-0001Hp-2x;
	Sun, 01 Dec 2024 05:51:32 +0000
Date: Sun, 1 Dec 2024 13:51:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/iio/accel/adxl367_spi.c:36:6-17: WARNING use flexible-array
 member instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202412011325.QnrhQoB2-lkp@intel.com>
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
TO: Cosmin Tanislav <demonsingur@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcc8eda6d34934d80b96adb8dc4ff5dfc632a53a
commit: cbab791c5e2a58c123d84bd9202c054e5449bc96 iio: accel: add ADXL367 driver
date:   2 years, 9 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 2 years, 9 months ago
config: arc-randconfig-r052-20241117 (https://download.01.org/0day-ci/archive/20241201/202412011325.QnrhQoB2-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412011325.QnrhQoB2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/accel/adxl367_spi.c:36:6-17: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +36 drivers/iio/accel/adxl367_spi.c

cbab791c5e2a58 Cosmin Tanislav 2022-02-14  17  
cbab791c5e2a58 Cosmin Tanislav 2022-02-14  18  struct adxl367_spi_state {
cbab791c5e2a58 Cosmin Tanislav 2022-02-14  19  	struct spi_device	*spi;
cbab791c5e2a58 Cosmin Tanislav 2022-02-14  20  
cbab791c5e2a58 Cosmin Tanislav 2022-02-14  21  	struct spi_message	reg_write_msg;
cbab791c5e2a58 Cosmin Tanislav 2022-02-14  22  	struct spi_transfer	reg_write_xfer[2];
cbab791c5e2a58 Cosmin Tanislav 2022-02-14  23  
cbab791c5e2a58 Cosmin Tanislav 2022-02-14  24  	struct spi_message	reg_read_msg;
cbab791c5e2a58 Cosmin Tanislav 2022-02-14  25  	struct spi_transfer	reg_read_xfer[2];
cbab791c5e2a58 Cosmin Tanislav 2022-02-14  26  
cbab791c5e2a58 Cosmin Tanislav 2022-02-14  27  	struct spi_message	fifo_msg;
cbab791c5e2a58 Cosmin Tanislav 2022-02-14  28  	struct spi_transfer	fifo_xfer[2];
cbab791c5e2a58 Cosmin Tanislav 2022-02-14  29  
cbab791c5e2a58 Cosmin Tanislav 2022-02-14  30  	/*
cbab791c5e2a58 Cosmin Tanislav 2022-02-14  31  	 * DMA (thus cache coherency maintenance) requires the
cbab791c5e2a58 Cosmin Tanislav 2022-02-14  32  	 * transfer buffers to live in their own cache lines.
cbab791c5e2a58 Cosmin Tanislav 2022-02-14  33  	 */
cbab791c5e2a58 Cosmin Tanislav 2022-02-14  34  	u8			reg_write_tx_buf[1] ____cacheline_aligned;
cbab791c5e2a58 Cosmin Tanislav 2022-02-14  35  	u8			reg_read_tx_buf[2];
cbab791c5e2a58 Cosmin Tanislav 2022-02-14 @36  	u8			fifo_tx_buf[1];
cbab791c5e2a58 Cosmin Tanislav 2022-02-14  37  };
cbab791c5e2a58 Cosmin Tanislav 2022-02-14  38  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
