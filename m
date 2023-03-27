Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94D17468
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Mar 2023 20:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679948728; x=1711484728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=49XTYWAlLyNKxqBdpSSqk7kIoahSK+n5xVv6RepMV48=;
  b=aEN3I6Vlvrx2nW2j4He4wGcqYfyxaHLQteZczIH6uIj58vyjH6LHPr38
   yOmQDx/yOhm6F7aQIS7kn7uVG0ZjyNyMvroZm7vhZveg4zZJAAHOzpZWD
   AC5JoJvbbgz45N77u0CyaIzFEjVp7ytFRqgfCMmztqxuXEnFDglO4RjrE
   Er3vou15Bmh0Nclo7SWT75khRaS2nYp/+xcrB3aQEaUH7GeBEgKNhLFqP
   x4T58fBqk6vDwbxd1JT7MsJUVAOIkdp4hdBG75VztR/j9m/whFxQX4xQv
   xOCl0qIOSjFlqFUWhHiC2wJJjQ1jjma0RRj6DimR5IdUYLus4PVAm7KEz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="339104226"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="339104226"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 13:25:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="929595178"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="929595178"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Mar 2023 13:25:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgtPC-000Hz5-16;
	Mon, 27 Mar 2023 20:25:26 +0000
Date: Tue, 28 Mar 2023 04:25:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djwong-xfs:xfile-page-caching 192/287] fs/xfs/xfs_buf.c:2061:11-12:
 WARNING kmalloc is used to allocate this memory at line 2027
Message-ID: <202303280426.fHfMIkgR-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

Hi Darrick,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   10b2657dfdd633f83d3de6eba27b8e093cf0caa6
commit: 565b7dfb64d1f2a929795fdd7a42b315efd2c61d [192/287] xfs: make GFP_ usage consistent when allocating buftargs
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arc-randconfig-c44-20230326 (https://download.01.org/0day-ci/archive/20230328/202303280426.fHfMIkgR-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202303280426.fHfMIkgR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_buf.c:2061:11-12: WARNING kmalloc is used to allocate this memory at line 2027

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
