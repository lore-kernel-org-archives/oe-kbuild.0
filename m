Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568E815D5B9
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Aug 2024 02:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722996641; cv=none; b=M8faYF584ioduwTAp9+S4A/9XnpCJZ2Cu0W7PazQFabKO94YqP4DPGNbFm8EGii/3X3Qtr4OyFUyjpmCzcw0F4aE3cvZ4OPWI5l8YxN7ZN06JY+4kJDVUvq/k+jbQZg5LHltKOmWIm4l1mdKjqIe5pVkZmNN7pVOcVY4/J6cTP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722996641; c=relaxed/simple;
	bh=gB/XFwVLZ4Z+s7EI4MNwnT2rqcfeXeKgBIl6KQ8Ks1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tKf+00gf64QdfLvoKENT2IKOf3731O6a+1mTFOHsiuEjft9RU+WzmRrmbonRyfVYlLWGpUPepyjTFoE+B8biZiRkglA9ZgJHs0YwzRyxH8No/pT0AksaDb6Co/C0GSBzhz6+T6XEPWrYF0B0zpQAfHZwfxzG6v43UtLQNPN6KQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePqBAW4M; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePqBAW4M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722996639; x=1754532639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gB/XFwVLZ4Z+s7EI4MNwnT2rqcfeXeKgBIl6KQ8Ks1g=;
  b=ePqBAW4MQBeSE6XmqlXAvoxwztUgmQqtnLnX6Bby0yNygCi1FZqvzkjo
   bV/wSlaKbP3KLcDwSSxDYI6Nv+wIhA456DpqcQv1VZbeMplC3YR7O4D9b
   GzVlMU4bQnIQtzapLDxzlfA2AE+cdJ+RDhnW5v/RJ/XHGn1aumuvK3AXI
   /bUvRUBhPeUYs2IoYfK1pVPdJRXPUe+UHant2FI0pBoBN8WP1fRj0K2xO
   tpAleZEdtsP+7TxoZRFoAJVtqDUSEjmBEx7gk1tkJpUFU7jYpTZUbNkCV
   ZOC28HqX1CHAXjad+ibKMb+hT1nwKuQI/YDdG8L+nbXXGYWt5R4qF1u9J
   w==;
X-CSE-ConnectionGUID: tsaW+s4VR1Ky/QWmRU27Fg==
X-CSE-MsgGUID: 1d7tafteRUGbxjhxWOaNcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="12894000"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="12894000"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 19:10:38 -0700
X-CSE-ConnectionGUID: eJtwuUT1Tpi83sRqn/JSeA==
X-CSE-MsgGUID: AcO/shiOSauAQRPq3oRuZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="61576279"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 06 Aug 2024 19:10:36 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbW8I-00053U-1a;
	Wed, 07 Aug 2024 02:10:34 +0000
Date: Wed, 7 Aug 2024 10:10:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kdave-btrfs-devel:misc-next 21/80] fs/btrfs/file.o: warning:
 objtool: btrfs_page_mkwrite+0x720: unreachable instruction
Message-ID: <202408071009.z4U4G80q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Josef Bacik <josef@toxicpanda.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   3902e48de96af7dbcd01450ab444d0f892f4ee19
commit: ec88c16c9f197b3bf9e84c3047e9734c9f29744d [21/80] btrfs: utilize folio more in btrfs_page_mkwrite()
:::::: branch date: 8 hours ago
:::::: commit date: 35 hours ago
config: loongarch-randconfig-001-20240807 (https://download.01.org/0day-ci/archive/20240807/202408071009.z4U4G80q-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408071009.z4U4G80q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408071009.z4U4G80q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/file.o: warning: objtool: btrfs_page_mkwrite+0x720: unreachable instruction
   fs/btrfs/file.o: warning: objtool: btrfs_drop_extents+0x2c0: unreachable instruction
   fs/btrfs/file.o: warning: objtool: btrfs_sync_file+0x5fc: unreachable instruction


objdump-func vmlinux.o btrfs_page_mkwrite:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
