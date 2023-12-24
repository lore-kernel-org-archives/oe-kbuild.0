Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935C42592
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Dec 2023 12:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GpSZstIy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703422305; x=1734958305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xQCAvWNo/i74DQf9uKY/hqbp7JFCCoYnjAakmzS4F6I=;
  b=GpSZstIyALm588QEJKtEJ0JB4Q12PGEnqIPgpFOZcg92diyFOYsZtb43
   jMKhByEpdn9Lvm0eAvaM0gMmaWd6b8OBAiYdpYL2ZQ7rqhKZuGsIo8Vu8
   hASg01tad11qEVU+jFXL9/IviT+eyV0PyruvKbBkJypflTuTGVTDZvt4E
   jg5kel8ZoslHY0PtMn9cCSiStnBUofEUwbE1Zl1j5YKiDdREzHHbUN2+K
   JO4mk2A8OsFwNLoD7Hi4POsVCyIg/RyQVRN/7HXSbLGNMk8lKNu/06AXY
   4mh04RGGAQNeM91dq+3VdoaQLpcrYt7EjYrN5ZZDKS7kdb+VKMmVFV94d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="400059753"
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; 
   d="scan'208";a="400059753"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 04:51:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; 
   d="scan'208";a="19223188"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Dec 2023 04:51:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHNxF-000CGD-1J;
	Sun, 24 Dec 2023 12:51:41 +0000
Date: Sun, 24 Dec 2023 20:49:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/spi/spi-ljca.c:155:12-13: WARNING opportunity for min()
Message-ID: <202312242043.XZWzAj9c-lkp@intel.com>
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
TO: Wentong Wu <wentong.wu@intel.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Andi Shyti <andi.shyti@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   861deac3b092f37b2c5e6871732f3e11486f7082
commit: caee8e38da67a8991a60f1f67e6820a0063278c4 spi: Add support for Intel LJCA USB SPI driver
date:   2 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 2 months ago
config: i386-randconfig-054-20231224 (https://download.01.org/0day-ci/archive/20231224/202312242043.XZWzAj9c-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312242043.XZWzAj9c-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-ljca.c:155:12-13: WARNING opportunity for min()

vim +155 drivers/spi/spi-ljca.c

caee8e38da67a8 Wentong Wu 2023-10-09  144  
caee8e38da67a8 Wentong Wu 2023-10-09  145  static int ljca_spi_deinit(struct ljca_spi_dev *ljca_spi)
caee8e38da67a8 Wentong Wu 2023-10-09  146  {
caee8e38da67a8 Wentong Wu 2023-10-09  147  	struct ljca_spi_init_packet w_packet = {};
caee8e38da67a8 Wentong Wu 2023-10-09  148  	int ret;
caee8e38da67a8 Wentong Wu 2023-10-09  149  
caee8e38da67a8 Wentong Wu 2023-10-09  150  	w_packet.index = ljca_spi->spi_info->id;
caee8e38da67a8 Wentong Wu 2023-10-09  151  
caee8e38da67a8 Wentong Wu 2023-10-09  152  	ret = ljca_transfer(ljca_spi->ljca, LJCA_SPI_DEINIT, (u8 *)&w_packet,
caee8e38da67a8 Wentong Wu 2023-10-09  153  			    sizeof(w_packet), NULL, 0);
caee8e38da67a8 Wentong Wu 2023-10-09  154  
caee8e38da67a8 Wentong Wu 2023-10-09 @155  	return ret < 0 ? ret : 0;
caee8e38da67a8 Wentong Wu 2023-10-09  156  }
caee8e38da67a8 Wentong Wu 2023-10-09  157  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
