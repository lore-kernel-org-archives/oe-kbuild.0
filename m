Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B47C2BF012
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Nov 2025 17:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763226811; cv=none; b=Sg5XqhgUlLHsUZsmANOsP7/m5zrDz2jzZgWF/U0ufac4TvtTkf8tfC5SLDTRev1fyJUH47CFJCro9FS0NEOgGzxuf88H3iexvWsoJqY1bM8J/ACTXURfbGwvI025n5lp/t8LbQA8AWfM+TR4X+qComeLTIYqjbJhfMVdbatFXpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763226811; c=relaxed/simple;
	bh=1ID77+S6853DuCG8snjbZJmSsxeLjplleJxPbJkzxWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=trAJrl/PGiLTB44CkRmcD3wNmkEl7a4dWpoWcWRIk9L90b/NkAJgvoDpnRGcwjfNn6COC76AXk+HMwhdXJt3J/mUc2pkrau7CleYg9YrXKG7rcwN8xjdL/81913pkGEJxkxXDL70W1azmT1duknOQLbGGIK0v7julbyjJnm1qPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdSJoefc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hdSJoefc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763226809; x=1794762809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ID77+S6853DuCG8snjbZJmSsxeLjplleJxPbJkzxWc=;
  b=hdSJoefc6BgL5onoT6yszxlZIC0K1cJ4oq/SnCekxXXcU6uirSObj9OD
   ZGMsag6SAr9xOEAN9U5LAdnhQrCWgj8cejKWgAJwt/sSzyqIiVvDuHvsJ
   oXVN9GV6yriiLwrq3Ffjq3q87Kwr03Ll/vhigIQ3eYiSP/35z1u60jaDD
   PSrINYCS+Tz1ZmXuOVCJfQs8pXAnKKjLH7dBHzf78O9wUYUAQOf1pB9Ym
   Q/ieyHx4S3fbY+rVPlq5eL4774g9aRPH6tQ0cAxIbaEMu8lE8yJOapgcQ
   KqfRtNjoV8yQeMMMy4BM71fiO1YUcvbZRjQeVUrYWQpCvQelcNW04VK1d
   A==;
X-CSE-ConnectionGUID: +siqdjnVRwybd71IJEq8ag==
X-CSE-MsgGUID: AJnd0jikToyVpbCIRIgzeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="64496995"
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="64496995"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 09:13:28 -0800
X-CSE-ConnectionGUID: NWhN96/BTL6hFYJouXpZOQ==
X-CSE-MsgGUID: YqoKUI+8Qsu3srJ+scp9Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="190319806"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Nov 2025 09:13:27 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKJq1-000887-25;
	Sat, 15 Nov 2025 17:13:25 +0000
Date: Sun, 16 Nov 2025 01:13:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [brauner-github:work.ovl.cred.guard 46/47] fs/overlayfs/util.c:70:9:
 sparse: sparse: cannot size expression
Message-ID: <202511160131.7ekHOUWN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/overlayfs/util.c:70:9: sparse: sparse: cannot size expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git work.ovl.cred.guard
head:   74fa97e66e24a79a77ee469a7e8305f2013edd1f
commit: 05caf92703741e332e658d583bddc36d18d0067b [46/47] ovl: detect double credential overrides
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-r112-20251115 (https://download.01.org/0day-ci/archive/20251116/202511160131.7ekHOUWN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511160131.7ekHOUWN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511160131.7ekHOUWN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/overlayfs/util.c:70:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/overlayfs/util.c:70:9: sparse:    struct cred const [noderef] __rcu *
   fs/overlayfs/util.c:70:9: sparse:    struct cred const *
   fs/overlayfs/util.c:70:9: sparse: sparse: cast from unknown type
>> fs/overlayfs/util.c:70:9: sparse: sparse: cannot size expression

vim +70 fs/overlayfs/util.c

bbb1e54dd53cf8 Miklos Szeredi    2016-12-16  64  
bbb1e54dd53cf8 Miklos Szeredi    2016-12-16  65  const struct cred *ovl_override_creds(struct super_block *sb)
bbb1e54dd53cf8 Miklos Szeredi    2016-12-16  66  {
f01d08899fd7fa Andrea Righi      2023-05-21  67  	struct ovl_fs *ofs = OVL_FS(sb);
bbb1e54dd53cf8 Miklos Szeredi    2016-12-16  68  
05caf92703741e Christian Brauner 2025-11-13  69  	/* Detect callchains where we override credentials multiple times. */
05caf92703741e Christian Brauner 2025-11-13 @70  	VFS_WARN_ON_ONCE(current->cred == ofs->creator_cred);
6771e004b40962 Christian Brauner 2024-11-25  71  	return override_creds(ofs->creator_cred);
bbb1e54dd53cf8 Miklos Szeredi    2016-12-16  72  }
bbb1e54dd53cf8 Miklos Szeredi    2016-12-16  73  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
