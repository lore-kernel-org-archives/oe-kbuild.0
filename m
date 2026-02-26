Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FF339527D
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Feb 2026 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772097284; cv=none; b=mXGg2SKepwPsbSxTpAkKR6kfSscYyZTCaHlNs5yIcT6zzM3GfLVQXhmZI8ESnelnZgHxRxF2cFSD34CRktDYaeBKnI/4BuD4T84iaHrlrlM8Vr3FFC8HFeEvA3Voue/D0fuPX0eRuTZrcAnHPHpq90JgVoWv3N8WIcJiniTkAuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772097284; c=relaxed/simple;
	bh=yVTplpAHoP7soCcQF5Q/+cPKqtDtjmz1LHDQRf23Iq0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=USpwnlViCh82lHAUgufEQxVRX75qkypNNcC3AGlODAWRkQWUUHBQinrdmtzJ3/HqhPkYfGE7DtyWQqoMnTEaIU+Bw3a9iqrj1aCmYNrAEWjdqvq6yajl3NBKcgFEAO6wO166bsrfnGmo6EyOG2sEJqQSEa9wRADlbYcOK8xMhMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hEUvYWev; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hEUvYWev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772097283; x=1803633283;
  h=date:from:to:cc:subject:message-id;
  bh=yVTplpAHoP7soCcQF5Q/+cPKqtDtjmz1LHDQRf23Iq0=;
  b=hEUvYWevrHvarw6/14PSb1RWhKwSm4nS+pGzGkhLbHITYe+ZUOh1/0VV
   lY/9Eh87+b7lkgrYR+e6Pt+WDx/+blO4wmBarGCOUcd8VJKhpdjCA3u7Y
   uDF6ScIwU6Z3Dd3wFSWvmzlkuL3MMdNIkrhtLRKEn4wdKlnP6/WU63Bm6
   XtO+FEKoOladFnDEDiXLcDzb6wEKXM0Odheiw8bii9OdyiBnNrbkNP9gz
   yVMoCUecFGd83gEWyQhiaVAHKplyxoQqY5tzhVhmPujiff9+aj+9qpVC3
   IfKPjvJ60rJHnt5u8LXMAgahmbF5BCWzYRjeY49XltG+DiB3doN071qkI
   Q==;
X-CSE-ConnectionGUID: 97BMpkUCT0Ow0moPXNiB3g==
X-CSE-MsgGUID: vf+j9V+7S5SIxTR62SlNPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72364059"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="72364059"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 01:14:42 -0800
X-CSE-ConnectionGUID: LpS9OuWMQ6GtbSxx/98ZvA==
X-CSE-MsgGUID: LcGcyFchQ22ltppQBCC/QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="216412256"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 26 Feb 2026 01:14:42 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvXSA-000000008in-45oQ;
	Thu, 26 Feb 2026 09:14:38 +0000
Date: Thu, 26 Feb 2026 17:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [leon-rdma:var-tlp-v2 12/28] WARNING: modpost: module
 ib_uverbs uses symbol dma_buf_move_notify from namespace DMA_BUF, but does
 not import it.
Message-ID: <202602261714.4vDNLi2t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Leon Romanovsky <leonro@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git var-tlp-v2
head:   020795e4f34c4e609bfcdbbf48423d8f524afc05
commit: a731c8626507d2df0b34a572719e3e6efcf10530 [12/28] RDMA/core: Promote UMEM to a core component
:::::: branch date: 19 hours ago
:::::: commit date: 20 hours ago
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260226/202602261714.4vDNLi2t-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602261714.4vDNLi2t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602261714.4vDNLi2t-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: module ib_uverbs uses symbol dma_buf_move_notify from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module ib_uverbs uses symbol dma_buf_phys_vec_to_sgt from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module ib_uverbs uses symbol dma_buf_export from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module ib_uverbs uses symbol dma_buf_free_sgt from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module ib_uverbs uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
