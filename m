Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A990A945
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 01:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769219019; cv=none; b=CtDlgWUhFsv1iIhFib7TJHGPDiM+pV4L3B4wn8L/SWyrPPW5HRJwidGWO7Zk6RjoLLCWfC0dx7+1pMXTgk8F/aUVpsk4XvKGo4EvlaOmTh1xkiZi08fSEu0ZpiNwxmBN1g7IleQSU/RFsGFdfTckGx+luEV+2U8AzhHsyZYJPGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769219019; c=relaxed/simple;
	bh=Phn0UF2eIxjI1eZZeO0h+WoaFByaHw29pcXEw4Zxvvw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DXnWfDC24uPaomA9x5y5j0mB0fIAzg79NeWLupV53wHPXICqOnIqZ/3Gg36/zd2yOnoGTuH5g95dv3nDsDmpyWz1SlT5Xn5yQlKmdvjufNjMu2SzU+IY1MykYD3LFA+z6UkXh5MYJ7Nx1G6HEIi+n8+JkuBToezKK1RB4XxO3fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dXLVS1dq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXLVS1dq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769219017; x=1800755017;
  h=date:from:to:cc:subject:message-id;
  bh=Phn0UF2eIxjI1eZZeO0h+WoaFByaHw29pcXEw4Zxvvw=;
  b=dXLVS1dqO4QCP2x9qkk7kEsDOEKY5sjwSm9NarLweg2tZM0Cq1GQ8o/k
   Qi/QETDSJ5rT+1K1a4jIMPPTXcui/Jk8+57WJXJBurcK+F01bgpP3+iUh
   8ZViv/c+rbU3YRCdKW55i6nXAVWd/d7XqeikHyCflaNJ6TOF7OMWYozTL
   IGWQ/aJicKC2Xg2Ykf69mBXd9r//EJTbFBxFG2sQZ7djH4v2Hdz4r0Ny7
   ZvP8KedzUo7plez/BiDNTGydaC3kHhnbIJ6RzSLfmvm0oeyvoSYARMnD6
   AxG1yMGK/aJZBsktyd9YXRIShkZDanxB/0YqtlwWbnw+Riy97hgGZQoEV
   g==;
X-CSE-ConnectionGUID: 1n6lzZn3RliP9TswgTTlFw==
X-CSE-MsgGUID: k4lg+u0TRRGJI+x2lc/QLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="88049320"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="88049320"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 17:43:37 -0800
X-CSE-ConnectionGUID: KEAcx6H5S2i4TVFq8CEC6g==
X-CSE-MsgGUID: sQJlkbbpR4GdvOBp1NXcJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="237822575"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jan 2026 17:43:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjSgX-00000000Uff-20Aa;
	Sat, 24 Jan 2026 01:43:33 +0000
Date: Sat, 24 Jan 2026 09:42:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jic23-iio:testing 119/119]
 drivers/iio/dac/max22007.c:489:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601240922.upCRxtsd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iio/dac/max22007.c:489:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janani Sunil <janani.sunil@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   f52690c50893ef1504990199c8a2dfbb869f38c6
commit: f52690c50893ef1504990199c8a2dfbb869f38c6 [119/119] iio: dac: Add MAX22007 DAC driver support
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: sh-randconfig-r131-20260124 (https://download.01.org/0day-ci/archive/20260124/202601240922.upCRxtsd-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240922.upCRxtsd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601240922.upCRxtsd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/dac/max22007.c:489:1: sparse: sparse: bad integer constant expression
   drivers/iio/dac/max22007.c:489:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/dac/max22007.c:490:1: sparse: sparse: bad integer constant expression
   drivers/iio/dac/max22007.c:490:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/dac/max22007.c:491:1: sparse: sparse: bad integer constant expression
   drivers/iio/dac/max22007.c:491:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +489 drivers/iio/dac/max22007.c

f52690c50893ef Janani Sunil 2026-01-19  488  
f52690c50893ef Janani Sunil 2026-01-19 @489  MODULE_AUTHOR("Janani Sunil <janani.sunil@analog.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
