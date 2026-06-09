Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4855E403B14
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jun 2026 22:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043973; cv=none; b=gQmtSqom541M7Ir/pARJ1Z4ayzX4Tikmsg7nT6fjGBXAuykLLIqamdFMxjho5Iwtz7ckXdpO+n6l3jwh46Ow4bdCp601Uv2wZZ38Lo6NtEYtWUUPceiO1BU+Q6xG4EdI9Hd2+W8848y+8iesAx+g8gS1YLOy/55DpMDxgLJMmhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043973; c=relaxed/simple;
	bh=fFoa+s24q/7uEtyUVR4co0U0q6kJwCVK6dwkvZVAw8I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kA2sTAYs61/FcxTXj7DijjzeHKcsFs9L8zNWCPHv0NRIshVYf5xp942HGGY/zTe4SHCDwu9fUyXs2c+ZJMulPvvxau5zKTy1WGnW6eR95glemEjTbBg5x26YyQJzcX6JHd3iFmBx/7j0klUDofbuEOO0coll8jj+t3DPDv4WSzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azHQE/DI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azHQE/DI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781043971; x=1812579971;
  h=date:from:to:cc:subject:message-id;
  bh=fFoa+s24q/7uEtyUVR4co0U0q6kJwCVK6dwkvZVAw8I=;
  b=azHQE/DIosizMEMN9dOvi7UHQbpk8EoLdHLfh65gKVR7BlfZHxafYy8G
   i7RCmyF+7X387pIWUoV3sp1s6+KV0w02Q99hBKvmBsnBOIsexc3Az1EdC
   H8+BpBM5DQxmnJlNmvsI7dsUfHW8lOZtenxqngzHwsMi8bPyh6Ua+kJ/h
   gPyhRWCTSYsJxE/O9/PyG5Bz1/KGYI5hvQWHdNoOmqLhVbvjypQ1o6+tB
   xpJMRKFNVbrZS3dIpurU1QUwGtNtKc5grspRf6fwQYGDw1Y8TQt8XMbDO
   0JjECTtIedIr36ewmcFgzHzapjKBHlRntZ52EDUZfnPEjt/3JTkETbG6K
   g==;
X-CSE-ConnectionGUID: 4Qx/im3KTJyS2gyEKOWq/w==
X-CSE-MsgGUID: 18tdtYrSQ96xQEqwbMIFRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81829365"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="81829365"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 15:26:11 -0700
X-CSE-ConnectionGUID: uTRj6PCjTxWPn6yYVQZv8Q==
X-CSE-MsgGUID: 4Myuw28ZTW+J98fahkR1/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="251063156"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Jun 2026 15:26:10 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX4tb-00000000KcC-2i27;
	Tue, 09 Jun 2026 22:26:07 +0000
Date: Wed, 10 Jun 2026 06:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/mpage.o: warning: objtool: mpage_write_folio+0x188:
 unreachable instruction
Message-ID: <202606100655.vWbFhFxz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Christian Brauner <brauner@kernel.org>
CC: Jan Kara <jack@suse.cz>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Hi Christoph,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2d3090a8aeb596a26935db0955d46c9a5db5c6ce
commit: bb01e8cc10f0c5b1151a5f047289fcfa5519e351 fs: use writeback_iter directly in mpage_writepages
date:   1 year, 1 month ago
:::::: branch date: 31 hours ago
:::::: commit date: 1 year, 1 month ago
config: loongarch-randconfig-r064-20260608 (https://download.01.org/0day-ci/archive/20260610/202606100655.vWbFhFxz-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606100655.vWbFhFxz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bb01e8cc10f0 ("fs: use writeback_iter directly in mpage_writepages")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606100655.vWbFhFxz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/mpage.o: warning: objtool: mpage_write_folio+0x188: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
