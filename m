Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D1E2572
	for <oe-kbuild@lists.linux.dev>; Sun,  6 Oct 2024 19:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728241419; cv=none; b=clHCm42WSI4lL2KgEFr6Hmxd6WCVUIoPM5f65NB6+7y+j+0Gt6OzT4noxlS0PPq98XUsaj0DlkjFEX8Eqb8IKQE4wF0h+fDXIqS3RGnGOfWZ/h69zwzNiTrU9WcCB47v8savW0o3ToCpf25okwKpubrpv941uTCW6tM9J3VbAyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728241419; c=relaxed/simple;
	bh=YhB6GTPIiFsxk9TLJQa9mT1TaoIaDeUMLUy/Py5PVco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GMgNfjmc5shKajwzSNoZ5zE9IFpcIhoJdt/v5+tyP7pQX1GdI1CuwIXvRWP8VXPb1uI5XwJ0Ni6ZJpIOcYJTfTsLYIsO35TUWKzzbRywmtE4iHatRQGPYTQWZBQ1lnqB1T8EccL0W7D7KuJHX+eQ7MhB/5m1JBGsOQr1u6oyrss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DsuZ2sm2; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DsuZ2sm2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728241417; x=1759777417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YhB6GTPIiFsxk9TLJQa9mT1TaoIaDeUMLUy/Py5PVco=;
  b=DsuZ2sm2ZkgRc6g4yGnsdMqCajwLCmwdCjc8GJl+l1vZX61v6G6N1vUK
   77+eopRDeLtsmr62ftVget6Xbn4q1UbjxR1fJIwd/5OwBXEEe60ZzePQy
   4DqBwcYIY3mQ8vMHXRsAkKtrSuvn1t9S/qgnutVArZ43pzAJL3zdrjteE
   AnXtMsVd34RX6Ax6XBfrWwNgH8DG4kgSxSFyLiU1LHpqdIIj0XJnCHVka
   5lD0Eo9sSOjdEefI5J8v43rObJShys6tXtS3NkYppyDTjQqWIs5EhA8Wd
   XGHAL7UDuWdnCBRSUV027+NSQ/GR9WTvt9neLIYc1sxnWMIHxQ5pVFN2b
   w==;
X-CSE-ConnectionGUID: rjxL3sMDSxWWtic3thSI7Q==
X-CSE-MsgGUID: GPXzUOBbRtSuK4meCkC4ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="27532425"
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="27532425"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 12:03:36 -0700
X-CSE-ConnectionGUID: tQsZi48WSVGt9AThdwatzA==
X-CSE-MsgGUID: GaimPwnjRa6tv97cL8d5NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="106085061"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Oct 2024 12:03:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxWXV-0004Fk-0j;
	Sun, 06 Oct 2024 19:03:33 +0000
Date: Mon, 7 Oct 2024 03:02:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/extent_io.o: warning: objtool: btrfs_readahead+0x98:
 unreachable instruction
Message-ID: <202410070217.IlnGeJlG-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Josef Bacik <josef@toxicpanda.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f602276d3902642fdc3429b548d73c745446601
commit: 03d6612648a48d0f5a60a013d4b583b4886807d2 btrfs: convert btrfs_readahead() to only use folio
date:   4 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 weeks ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20241007/202410070217.IlnGeJlG-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410070217.IlnGeJlG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410070217.IlnGeJlG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/extent_io.o: warning: objtool: detach_extent_buffer_folio+0xe4: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: btrfs_do_readpage+0x2b0: unreachable instruction
>> fs/btrfs/extent_io.o: warning: objtool: btrfs_readahead+0x98: unreachable instruction


objdump-func vmlinux.o btrfs_readahead:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
