Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090751DDA34
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Dec 2024 22:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734475790; cv=none; b=KUZFt8SV4IaJLYT+vmOaoArBRD+Zppivd4ac8Kb9tTp2TZVoraASLJTeKy5Iz9lPRxhfKqnZ9gsPb3qAQpyVd9MpWHJLoDUD405EU1DuUEuuD9QqHeE7kFKDH5B5cdY7LNo8KsjA1yp9reuLGD3sieJWWe/Q9iyT3NOrxTTn4cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734475790; c=relaxed/simple;
	bh=mHfjJItvDYf2yGVQDnMTNcyvLxSe8zpA5nfgrTbIvDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=atifJ2TIsrb2PvnbSaOzrgvTj+vQVxKT9NYXWwksD/fXa/ffPthhbsMb8F0c7P28LErR5bRGOsLaOd24v31Wm85gxi16M73Rru3ogAZTRlL+vsnX3ImGaiBr/BZghVwmqI5WXwnGwNLhTzD3Xti58ZnXCOhU9Bz2AYGa6Azbq3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iD4nq0wY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iD4nq0wY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734475789; x=1766011789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mHfjJItvDYf2yGVQDnMTNcyvLxSe8zpA5nfgrTbIvDI=;
  b=iD4nq0wYgpzPIlDWCsyCm9VX+QTyWSLw/P5qScA70ms44bm4t1wKT6jF
   7kgasH7bEIi+/VcN5RpSMl3UcsGcSk/F9TZZSqOg6yQ+iIm11/frB54Bw
   K0Lz9I/MRlGHjRsPINqp5wzI6MR/+AVNa1OloFvO/t97Dw9nyZcaEAL8d
   4HAKdMOgaFWnPRPPnHwScDG/Q3mOyZu6kSCJvRcG703cgwbTouQIMZJ+z
   Y/LVfMAYQaDI5XOlwoQU6o06wXinD1h1Ob0OiWLFFuLbYlsujDP+R9bkJ
   Yht4Yx8e9XfVTpE+OdWa8gh7MN9p2t8rfEns0mq261aW7dhDOCksjHYl7
   Q==;
X-CSE-ConnectionGUID: CEFv/5u+T6W4MaoHfoibLg==
X-CSE-MsgGUID: OWAX3aRhQ1ONRr8osQuhWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45620953"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="45620953"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 14:49:48 -0800
X-CSE-ConnectionGUID: VABSIB1cTLyo3ehA57yz2Q==
X-CSE-MsgGUID: kf+Od+swRc2Ww60IejTMqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="98249822"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Dec 2024 14:49:47 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNgNs-000Fry-3D;
	Tue, 17 Dec 2024 22:49:44 +0000
Date: Wed, 18 Dec 2024 06:49:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kernel/rsi.c:57 arm64_rsi_setup_memory() warn: iterator
 'i' not incremented
Message-ID: <202412180643.8K3zAvzB-lkp@intel.com>
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
TO: Suzuki K Poulose <suzuki.poulose@arm.com>
CC: Catalin Marinas <catalin.marinas@arm.com>
CC: Gavin Shan <gshan@redhat.com>
CC: Steven Price <steven.price@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5529876063e110ea49326138149fdf2a28a484dd
commit: c077711f718be7cebcc8b987eac2ebfd17447e9f arm64: Detect if in a realm and set RIPAS RAM
date:   8 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-r073-20241207 (https://download.01.org/0day-ci/archive/20241218/202412180643.8K3zAvzB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412180643.8K3zAvzB-lkp@intel.com/

smatch warnings:
arch/arm64/kernel/rsi.c:57 arm64_rsi_setup_memory() warn: iterator 'i' not incremented

vim +/i +57 arch/arm64/kernel/rsi.c

c077711f718be7c Suzuki K Poulose 2024-10-17  40  
c077711f718be7c Suzuki K Poulose 2024-10-17  41  static void __init arm64_rsi_setup_memory(void)
c077711f718be7c Suzuki K Poulose 2024-10-17  42  {
c077711f718be7c Suzuki K Poulose 2024-10-17  43  	u64 i;
c077711f718be7c Suzuki K Poulose 2024-10-17  44  	phys_addr_t start, end;
c077711f718be7c Suzuki K Poulose 2024-10-17  45  
c077711f718be7c Suzuki K Poulose 2024-10-17  46  	/*
c077711f718be7c Suzuki K Poulose 2024-10-17  47  	 * Iterate over the available memory ranges and convert the state to
c077711f718be7c Suzuki K Poulose 2024-10-17  48  	 * protected memory. We should take extra care to ensure that we DO NOT
c077711f718be7c Suzuki K Poulose 2024-10-17  49  	 * permit any "DESTROYED" pages to be converted to "RAM".
c077711f718be7c Suzuki K Poulose 2024-10-17  50  	 *
c077711f718be7c Suzuki K Poulose 2024-10-17  51  	 * panic() is used because if the attempt to switch the memory to
c077711f718be7c Suzuki K Poulose 2024-10-17  52  	 * protected has failed here, then future accesses to the memory are
c077711f718be7c Suzuki K Poulose 2024-10-17  53  	 * simply going to be reflected as a SEA (Synchronous External Abort)
c077711f718be7c Suzuki K Poulose 2024-10-17  54  	 * which we can't handle.  Bailing out early prevents the guest limping
c077711f718be7c Suzuki K Poulose 2024-10-17  55  	 * on and dying later.
c077711f718be7c Suzuki K Poulose 2024-10-17  56  	 */
c077711f718be7c Suzuki K Poulose 2024-10-17 @57  	for_each_mem_range(i, &start, &end) {
c077711f718be7c Suzuki K Poulose 2024-10-17  58  		if (rsi_set_memory_range_protected_safe(start, end)) {
c077711f718be7c Suzuki K Poulose 2024-10-17  59  			panic("Failed to set memory range to protected: %pa-%pa",
c077711f718be7c Suzuki K Poulose 2024-10-17  60  			      &start, &end);
c077711f718be7c Suzuki K Poulose 2024-10-17  61  		}
c077711f718be7c Suzuki K Poulose 2024-10-17  62  	}
c077711f718be7c Suzuki K Poulose 2024-10-17  63  }
c077711f718be7c Suzuki K Poulose 2024-10-17  64  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
