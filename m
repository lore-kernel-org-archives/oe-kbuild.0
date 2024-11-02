Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910F71ABEB0
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Nov 2024 20:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730581079; cv=none; b=qxZZ4+Qhzhe37ywRFCECpVUE8FoaKk9cFcbw2DZ6B7OULVZkD8DD/YMUL42+fnCu49GgfKUklGTD0ByVsjL4Ocjnuzqq+/tN70d55csVPSd0t5DyyTVj1Fc3BfpPOiC8mCLGxzak09k1pikofd6kE69Dp7d2dbta9nzLDOz3sgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730581079; c=relaxed/simple;
	bh=pShYoP8i+AcOxGn+KscHypqGSfTrA4e1B7eu6jYPbXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=knFz9n5bYfnT+lnkodRMkVqOcYL/DIWOswwnYV8iaW1gb0j1m8LCr4gd0u/+aSziopvVH/hygt1ffaPTNAzOV8u/CxWVVyVDDh1GS3Z1aYiXTFzOi4NhMJhKe8BPbYHBPDTHrgfKcg8JGfxS8/jCuINcAfHKw+zhYYPSuSmGmMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CitLIn+M; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CitLIn+M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730581077; x=1762117077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pShYoP8i+AcOxGn+KscHypqGSfTrA4e1B7eu6jYPbXA=;
  b=CitLIn+MiyPUvY7t2i/L2zha8vdefnMXVwsKy+kr1rnLoly45Fkok2XY
   79xCsKqkeq2h52EPl0LQHFk5kf6IUtBLrs9DvKxl0hpeBsYlBVhbbMAvC
   IlQv68fDFcWh7t5joJbgawv7Iz58XAVisumTdWitkd4HwMCHI5hacDifa
   kVAwelZGEfwpn21OrY4aaH4Yudx/w0QI6Jh1cCSs9mEsO+u54F88ApJby
   5UMtmGsC34vdxh77YX2JmFLJTsE2CZFdrseY9QoYaOf5LD9s/Wx2emwy1
   KDsXAgXOH0K0parbyqd2QTu0KxiT8/qvFy6HLqFZb8aSOscY7FBMUPBez
   g==;
X-CSE-ConnectionGUID: 3+2JO3m3RR+VbxzYt8jR3Q==
X-CSE-MsgGUID: ZNc/BpUrS/yYaQN5VAK6VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="29738528"
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="29738528"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 13:57:55 -0700
X-CSE-ConnectionGUID: 6WmU8P2SQU6tZNmTkhUT5Q==
X-CSE-MsgGUID: Fexf08bjQ9KArvOeGzyqmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="120726410"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Nov 2024 13:57:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7LBv-000jLF-1O;
	Sat, 02 Nov 2024 20:57:51 +0000
Date: Sun, 3 Nov 2024 04:56:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/parport/procfs.c:267:18-28: WARNING use flexible-array
 member instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202411030437.OYnKHsPA-lkp@intel.com>
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
TO: Joel Granados <j.granados@samsung.com>
CC: Luis Chamberlain <mcgrof@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   11066801dd4b7c4d75fce65c812723a80c1481ae
commit: 0829381e481ab2760086cc88090f70e761e4fcc2 parport: Remove the now superfluous sentinel element from ctl_table array
date:   1 year, 1 month ago
:::::: branch date: 19 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-102-20241102 (https://download.01.org/0day-ci/archive/20241103/202411030437.OYnKHsPA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411030437.OYnKHsPA-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/parport/procfs.c:267:18-28: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
   drivers/parport/procfs.c:364:18-28: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +267 drivers/parport/procfs.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  257  
^1da177e4c3f41 Linus Torvalds 2005-04-16  258  
^1da177e4c3f41 Linus Torvalds 2005-04-16  259  struct parport_sysctl_table {
37e9981e33e4d3 Joel Granados  2023-06-16  260  	struct ctl_table_header *port_header;
37e9981e33e4d3 Joel Granados  2023-06-16  261  	struct ctl_table_header *devices_header;
0829381e481ab2 Joel Granados  2023-10-02  262  #ifdef CONFIG_PARPORT_1284
0829381e481ab2 Joel Granados  2023-10-02  263  	struct ctl_table vars[10];
0829381e481ab2 Joel Granados  2023-10-02  264  #else
0829381e481ab2 Joel Granados  2023-10-02  265  	struct ctl_table vars[5];
0829381e481ab2 Joel Granados  2023-10-02  266  #endif /* IEEE 1284 support */
0829381e481ab2 Joel Granados  2023-10-02 @267  	struct ctl_table device_dir[1];
^1da177e4c3f41 Linus Torvalds 2005-04-16  268  };
^1da177e4c3f41 Linus Torvalds 2005-04-16  269  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
