Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4059C1FA5
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Apr 2023 22:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680994518; x=1712530518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q5/neoLReZnv6ezG+vtXuluuLl9fwkwT200+2lKGnxw=;
  b=O8jQr3wqlWYxSo59DxH4GA08wVmd6JAnLrstU0pePlfnkhZd8zE5IgAq
   ItqVLdALHXRFl1xGfH6S2VtY9w0kJZuG789QP3/KSaPFsagOu8MtM51Km
   sq1p1sQiNNXNhf3U2DT0DGi4Fa6efnOuyWHWqDgLU25Y6VEAUqQKg9egt
   qTUBk+1w/aD3x+cklpJaDSx65qNcr/b0xJgUEOLeF0DtwMo2XhcVlaMXl
   LaPsdJgbJNS7JIEDKe4y0eg8tGYnuj/XgJRaKCSQntduRxWRewOGMo/pd
   5I9nQAvgwtGRzty9fRYkJEkkgFh+iCJEunC3ctCJbb0H8aGg40eyrB83M
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="340658097"
X-IronPort-AV: E=Sophos;i="5.98,330,1673942400"; 
   d="scan'208";a="340658097"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 15:55:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="665234796"
X-IronPort-AV: E=Sophos;i="5.98,330,1673942400"; 
   d="scan'208";a="665234796"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Apr 2023 15:55:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plHSl-000UBN-25;
	Sat, 08 Apr 2023 22:55:15 +0000
Date: Sun, 9 Apr 2023 06:54:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: bno055.c:undefined reference to `devm_iio_triggered_buffer_setup_ext'
Message-ID: <202304090654.9e3bQIAC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: bno055.c:(.text+0x26f2): undefined reference to `devm_iio_triggered_buffer_setup_ext'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andrea Merello <andrea.merello@iit.it>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   68047c48b2288803c441df9f3e61d0d26bed87df
commit: 2eef5a9cc6439a4c8eb4c741a498e72f9335febe iio: imu: add BNO055 serdev driver
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
config: s390-randconfig-s033-20230409 (https://download.01.org/0day-ci/archive/20230409/202304090654.9e3bQIAC-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2eef5a9cc6439a4c8eb4c741a498e72f9335febe
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2eef5a9cc6439a4c8eb4c741a498e72f9335febe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304090654.9e3bQIAC-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/dma/qcom/hidma.o: in function `hidma_probe':
   hidma.c:(.text+0x18cc): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: hidma.c:(.text+0x1906): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: drivers/iio/imu/bno055/bno055.o: in function `bno055_probe':
>> bno055.c:(.text+0x26f2): undefined reference to `devm_iio_triggered_buffer_setup_ext'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
