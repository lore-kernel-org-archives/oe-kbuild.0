Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501244052CC
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Sep 2026 21:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788988054; cv=none; b=ZFz71qo4dnI7b3TCdDbTLSIoAKE+UmxLFhb/9GJLozYVwHUCeVde+ZptTX48BBTwM0EtmsODOjNjXckSbR4CH++XmhGDRJSzaMszZvxouzxjsXu7/M3gGIe+Hs4ax7w6V9pkQ0axyvsxrKUemLeEK+2b3dq7p6p1Hk2i4hvG3Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788988054; c=relaxed/simple;
	bh=oO03ax03FKUGl80Bnva6oGRhgmzOVIZXLzxEegBhqQ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i+cteesXE9nPNM7nJpZ1h/n0hkJeB8WfeiCrzgNgaJSWvKjuiBUrQpOvf1rNK+aukTpfBE/K3qbMfChuZrW7asilsz2RoVnl37tuOSi5YSgqNF/alLceeSOrKrWMYBcPJzPdOwf27DD2sqGoy4fUsAfcZJLdl+8vPjTM2UoaqEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XxtxUtZO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XxtxUtZO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788988052; x=1820524052;
  h=date:from:to:cc:subject:message-id;
  bh=oO03ax03FKUGl80Bnva6oGRhgmzOVIZXLzxEegBhqQ8=;
  b=XxtxUtZODsNFrcBa7Ijh4YWOWujyLhbg3bnRZjLwE9BkWv8TASF8J1sQ
   n/H5xjGiIemi8cijYoZzqdq3a71g6PIdo7exfhV2LcBRb50AIUJp1vqxf
   tNLDUD3nBZj9A0tLx29V2iB5esH6hH4uaMZjTvAtD+yFdXaXJGsAyzDb6
   hrhnru2HfMfsdCwK47DD9HHwTen66wPnP2qSKeVwVVm977823Vx7e+2Ay
   wBuQThPsI4FOYAHSRS98mV8y24k2r5rNcKE57S1tRX6GA/xWeKCVKUHxf
   MS34KpFU9XO1Iph5q4im4JB0s+UsgAOCsn6FnPpVQ+3AL/cH2GqR72mdX
   Q==;
X-CSE-ConnectionGUID: tbsei4qHQsWukAwtQrjnNg==
X-CSE-MsgGUID: Murbe+odSju2A2TiL8fBHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89300765"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="89300765"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 14:07:32 -0700
X-CSE-ConnectionGUID: QdMxncjZS8yYTayRLPu7ww==
X-CSE-MsgGUID: dH9jT4aPT2aeJcotfUNrIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="267739193"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Sep 2026 14:07:31 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4PVw-000000000vs-40pa;
	Wed, 09 Sep 2026 21:07:28 +0000
Date: Thu, 10 Sep 2026 05:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [axboe:io_uring-exit-cancel.4 6/7]
 build_policy.c:(.text+0x7c9f): dangerous relocation: l32r: literal target out
 of range (try using text-section-literals): (.text+0x7c88)
Message-ID: <202609100549.zT5cAE0y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "xtensa: dangerous relocation"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-exit-cancel.4
head:   db06d7713376eb9513a163c6202e07b855ce1563
commit: eaeeceef6d9f6933f9d689f00456176a4ed403b9 [6/7] io_uring: wait for in-flight requests on ring release
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: xtensa-allnoconfig (https://download.01.org/0day-ci/archive/20260910/202609100549.zT5cAE0y-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100549.zT5cAE0y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609100549.zT5cAE0y-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/build_policy.o: in function `switched_to_dl':
>> build_policy.c:(.text+0x7c9f): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.text+0x7c88)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
