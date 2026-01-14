Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0EF2D7801
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 16:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768409947; cv=none; b=dd9bpz6gkfmRTqtKH8vPv5qk7ni6seBMQFoxrbGRrzQ69IP2UTbY60XFtVxS7Q+B7kX5qQ2XEghNBkemEIVyUnsYj3GSscuseoldN+jXSP41e1VEyIIWbQOQrscnwS+/TeGdjUn1uq8eld+IUs2Dsgbkh4YF6lpHNXcOYydQq40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768409947; c=relaxed/simple;
	bh=7yQhyTjMBcTpgbYXQUxT3SWCyN3FstPhkSLNRO0HjhU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=smPBezl1fp6PxCWKopjmaqktb6NHyHewnNFWwx8CbM9qhwRnU6wS1tuGrb9g5ZVmifzprSGLwtrRxLKAMc9AGb6XTcic8rJjjACpIx72zRsutTUZg74QSL1QKSdSXyzLvsQmI3aege8QK8KjFqbzO6crGk1N2M8WDR5++CiEelM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYx3yxkD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYx3yxkD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768409946; x=1799945946;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7yQhyTjMBcTpgbYXQUxT3SWCyN3FstPhkSLNRO0HjhU=;
  b=TYx3yxkDJq4Nf6RWqxvS/gyf0ZTm3zN5weiQLH7NvPIuQrlLUQ3YQ+As
   wpHry/O5m1uG6vXmtzsR3UMB07SeZR/zs4cChZr1c0YUSUuvnPXV+1Uvr
   p7LmsO741aZyT9IA7aGTit7j+iS7hAijwWQuR1NRu7RCUsNQwqY3Jlr8R
   T5QJsmrM9MBf3qygQiADwRBMeidRVKJvn/09YLm12SYJT/LMHQ/9Ib6i0
   HXI0wol7CEGCFtFmSGn4rSqAODzOpULdWR8pVKi+KAPAMuST9B1G1BTyJ
   je579f7JTk7ft4Iuch5vuPtYxihXQs3zjOr0OXsLhBSKy0QXlC0ie8/2h
   Q==;
X-CSE-ConnectionGUID: BD+jiODDQsWAWJAQO6rCWg==
X-CSE-MsgGUID: SNLNcBL5SCG/2zD/Nzp7DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69622260"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69622260"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 08:59:04 -0800
X-CSE-ConnectionGUID: LmiCvFDIT0GfHjgh/gRHiA==
X-CSE-MsgGUID: qIe5yxtaR66oNdu3Z94mLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204757281"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Jan 2026 08:59:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg4Cy-00000000GhY-3wRT;
	Wed, 14 Jan 2026 16:59:00 +0000
Date: Thu, 15 Jan 2026 00:58:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/dma-buf/dma-fence.o: warning: objtool:
 __dma_fence_init+0x84: unreachable instruction
Message-ID: <202601150033.XbZtUHBG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "loongarch: unreachable instruction"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c537e12daeecaecdcd322c56a5f70659d2de7bde
commit: bf33a0003d9e3b0546f2d7e91bebfd67af59f275 dma-fence: Use a flag for =
64-bit seqnos
date:   8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: loongarch-randconfig-r053-20260108 (https://download.01.org/0day-ci=
/archive/20260115/202601150033.XbZtUHBG-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260115/202601150033.XbZtUHBG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601150033.XbZtUHBG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-fence.o: warning: objtool: __dma_fence_init+0x84: un=
reachable instruction

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
