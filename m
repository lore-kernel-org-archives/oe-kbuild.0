Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFEA346D9F
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 17:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761066658; cv=none; b=rXxwKcPcEwyNT8/AZOlyyXnJ/NohZ6WPcacE7+bKDCQ4aU0GF9nPZuqwje5/SyZV371NE0LrN5A0MWrUGeu0PePR5cw3S09f4G69N3DDwyiwV/d9fbWUAdWM5GkFaMi9/JpkU4ca75QLXRhI56LUo+0dXsnCZVeJHvq9OfsIM6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761066658; c=relaxed/simple;
	bh=x0yugcoL9rPnZBnJ9QcByPmBg/Eh+fFRuYxGeux+TbA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rpfhChXDn1aLGePKWo7Ru+d8yEJPx8su90yT7TEPODk0MbrPq9xRamb0EnKcQRCATQNbeFXy6val1jAgY7yW75ZBsXG7ul60fwY8ZktvJOa3h0qtP36WE0wHTWBgBEGb6wW0P/+4oPWgCylzPvmhRQaD/bXniERUA8SeIxvBSjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e6aChdMG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e6aChdMG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761066657; x=1792602657;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=x0yugcoL9rPnZBnJ9QcByPmBg/Eh+fFRuYxGeux+TbA=;
  b=e6aChdMGsuya7xNQ9TvgXlinTj7eBDVJifTT4zriwoMLPbaFReFQpx4j
   pQCnMFiPkdUNEuZigHOpVB5EQPfcr846z90I+72dJo5d3h/zI7SKiJR3J
   WCQg2qgjzHL5F8LIMFPHM3+5Hz6OoIARaJ6MQKSMsrSQWiPEJ1mpnqZ+n
   fWSsbNIy0gf8n+7GYWRXJxyn2OoawRmKz7zaWGRNS4YF6LXevaINLl2Mp
   3Xs6EGrpDkuMUH4CVrEL5sAWnz9H0EcKgOEcGVWLCQMkTME3n4RVc/Y+S
   ZQvI0T3FyyfiM9IABgdxw433ehCqnnp8n0ADont7KqUT7990/BXVCoY+H
   Q==;
X-CSE-ConnectionGUID: 4UEwSFXoTlyKtVTzdh1D1w==
X-CSE-MsgGUID: DtEMPL3GThajpKjW5GMFxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63104354"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63104354"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 10:10:52 -0700
X-CSE-ConnectionGUID: vkFtB1QHQE2dG2+07gjOdw==
X-CSE-MsgGUID: UA067P2XTXC3PhAqYAGy0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="183581571"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 21 Oct 2025 10:10:50 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBFsm-000B57-12;
	Tue, 21 Oct 2025 17:10:48 +0000
Date: Wed, 22 Oct 2025 01:10:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android15-6.6-2025-08 11/11]
 crypto/jitterentropy-kcapi.c:65:11-12: WARNING opportunity for
 kfree_sensitive/kvfree_sensitive (memset at line 64)
Message-ID: <202510220158.igYPrEPo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-08
head:   da059b1ba54d8749c5dcd198cf779cf8b6ac3ba9
commit: bd17e47475cc22f32168101b9dadce8907098a58 [11/11] UPSTREAM: crypto: jitter - Allow configuration of memory size
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-r064-20251021 (https://download.01.org/0day-ci/archive/20251022/202510220158.igYPrEPo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510220158.igYPrEPo-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> crypto/jitterentropy-kcapi.c:65:11-12: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 64)

vim +65 crypto/jitterentropy-kcapi.c

bd17e47475cc22f Stephan Müller 2023-09-21  61  
bd17e47475cc22f Stephan Müller 2023-09-21  62  void jent_kvzfree(void *ptr, unsigned int len)
bd17e47475cc22f Stephan Müller 2023-09-21  63  {
bd17e47475cc22f Stephan Müller 2023-09-21 @64  	memzero_explicit(ptr, len);
bd17e47475cc22f Stephan Müller 2023-09-21 @65  	kvfree(ptr);
bd17e47475cc22f Stephan Müller 2023-09-21  66  }
bd17e47475cc22f Stephan Müller 2023-09-21  67  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
