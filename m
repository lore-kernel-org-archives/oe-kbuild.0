Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6BA3BBF2
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 17:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763746518; cv=none; b=mNbXDFSXp7yiUFB09YDPI7myYgETrhqwF9+eqgYOmRtA23hDqcUBSYOWbMGCaGGz8+jD3csg0XJFJj/nU3xpvqV2yhgXj7YMtKEaK0gSvSpVMZE/yCgOiB0D7Nx9evknZXtLqgi1nKAQpIlo2lQgWDle2pYTdqw0fL8X2kVvIPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763746518; c=relaxed/simple;
	bh=NdLFGZdgi3leqDVm4+0QB2ESwajM261ykx9wu08jymg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uIg3UU6M+Qs/Hm8alVa5c2IFgTMR4CZayd6lsK74u9Ro2KQ1e7Ye0PA44CX9UcW4KMFCaivdGhwB9VBcBJmgZiGs7BKdthl4sluRbJ++jNizpTU7nVIj6bFGlhUKeCZSZSgX6VIpdi+smTNRvLri3ou/AcexJMqO1HOd/nbCzmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9VtpHdD; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9VtpHdD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763746516; x=1795282516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NdLFGZdgi3leqDVm4+0QB2ESwajM261ykx9wu08jymg=;
  b=Y9VtpHdDjTsUsToW71t0NRZz5nyhKNqCIP9lBe1BAkfr0/NfXT/04FJj
   tbEKQJYtDc789n90g2e1SaT/+IJSSICi5u2FInUc/dYLuOAD/jPGBy288
   qMiksUqdr0CdChucRqe1owjj2A2DjMFBNIN5LntU16ekU7Kyf09bn7DZV
   NJ9xcDTHI2yiT8T2tq3n5y5WDu94JOu1syqWWel7GoQybHnkSCIlVRmWk
   WrxwLuzmvvy0df70Wyq3jylokyvWspVL7tUQeaChGmlvZONl9LMTLboWO
   ULZEbWr2YTCKF37oY+F307SjTdMjRJOdjBz1AxyZ5uAtbwR3qYe4PpmtI
   A==;
X-CSE-ConnectionGUID: MN5lrphEQD+aQH5ysED0ow==
X-CSE-MsgGUID: yq7uPyh/RH6LccLFSY7x5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="53416600"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="53416600"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 09:35:15 -0800
X-CSE-ConnectionGUID: 529JgtM1SziTv74lgf6YYQ==
X-CSE-MsgGUID: SzXxujcpRDiLvC9Y5rO+LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="196210349"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Nov 2025 09:35:15 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMV2O-0006f2-1m;
	Fri, 21 Nov 2025 17:35:12 +0000
Date: Sat, 22 Nov 2025 01:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: error[E0609]: no field `nents` on type `bindings::sg_table`
Message-ID: <202511220154.Nuzltenx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "um-randconfig-001-20251121 results in a lot of rust failure"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Danilo Krummrich <dakr@kernel.org>
CC: Alice Ryhl <aliceryhl@google.com>
CC: Alexandre Courbot <acourbot@nvidia.com>
CC: Daniel Almeida <daniel.almeida@collabora.com>
CC: Lyude Paul <lyude@redhat.com>
CC: Abdiel Janulgue <abdiel.janulgue@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd95357fd8c6778ac7dea6c57a19b8b182b6e91f
commit: 05aa6fb1c21d7fb9df735da24096d793223789d5 rust: scatterlist: Add abstraction for sg_table
date:   3 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 3 months ago
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251122/202511220154.Nuzltenx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220154.Nuzltenx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511220154.Nuzltenx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `nents` on type `bindings::sg_table`
   --> rust/kernel/scatterlist.rs:158:47
   |
   158 |         let nents = unsafe { (*self.as_raw()).nents };
   |                                               ^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `sgl` on type `bindings::sg_table`
   --> rust/kernel/scatterlist.rs:162:49
   |
   162 |             let ptr = unsafe { (*self.as_raw()).sgl };
   |                                                 ^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
