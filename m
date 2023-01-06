Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B057B
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Jan 2023 09:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672996160; x=1704532160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DgrSMfzjtx9NkWZA80aTl4jYanFM5EtKpcixwT/zhNU=;
  b=LGjkuOJ1f7HN0hDhWmqZjSaJxjCi7mfBwSnSTdd4X15Td19hNInRwYKO
   gDG+HLmbTj/wcrukvP+39Ai2iKp91C68zf6r+VPGITjQsqutkMMSJh1Jp
   h/LpAUvdwvTGeIxnjUoOK6RjzQevs0PEU71p8WCLQE5szgJnsh7oLWtnw
   tbQl92S0HTKePHyQLfHaa0c+YUc/UOjPNuYz1AhXmH0xQQ0SxA4dG/rzD
   oTpyOg/KgcT0OcnRPv13pHBO36GvbObh0IrbXraxwlE+V/JWQ7JexgXb4
   9w+15VVBwMjkjt7BZQPHW1d+x+qxm9T2V0V1kBzUX6/QoOLTityB3MJ3m
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="302805497"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; 
   d="scan'208";a="302805497"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2023 01:09:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="688252209"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; 
   d="scan'208";a="688252209"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 06 Jan 2023 01:09:17 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pDiiy-0003B0-2P;
	Fri, 06 Jan 2023 09:09:16 +0000
Date: Fri, 6 Jan 2023 17:08:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse:
 incorrect type in argument 2 (different address spaces)
Message-ID: <202301061739.4xYV8Rjt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="6Bk/08D7I0JAAQn6"
Content-Disposition: inline


--6Bk/08D7I0JAAQn6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Stephen Boyd <swboyd@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1f5abbd77e2c1787e74b7c2caffac97def78ba52
commit: 3f4a80cbf968466c5ba0c78ef41cae8292965bd8 drm/msm: move msm_readl/_writel to msm_drv.h
date:   11 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 months ago
config: mips-randconfig-s031-20230106
compiler: mips64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3f4a80cbf968466c5ba0c78ef41cae8292965bd8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3f4a80cbf968466c5ba0c78ef41cae8292965bd8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:108:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:108:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:108:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:108:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:108:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:108:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c: note: in included file:
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:108:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:108:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:108:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:108:15: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
--
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:366:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:366:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:366:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:366:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:366:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:366:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:391:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:391:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:391:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:391:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:391:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:391:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:464:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:464:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:464:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:464:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:464:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:464:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:471:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:471:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:471:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:471:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:471:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:471:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:497:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:497:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:497:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:497:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:497:15: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:497:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1418:31: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1418:31: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1418:31: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1424:31: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1424:31: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1424:31: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:862:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:862:9: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:862:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:862:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:862:9: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:862:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:864:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:864:9: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:864:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:864:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:864:9: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:864:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:866:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:866:9: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:866:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:866:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:866:9: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:866:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:868:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:868:9: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:868:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:868:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:868:9: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:868:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1070:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1070:23: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1070:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1070:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1070:23: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1070:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1464:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[noderef] mmio @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1464:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1464:20: sparse:     got void *[noderef] mmio
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1466:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[noderef] rscc @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1466:28: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1466:28: sparse:     got void *[noderef] rscc
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1573:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] mmio @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1573:19: sparse:     expected void *[noderef] mmio
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1573:19: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1580:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] rscc @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1580:27: sparse:     expected void *[noderef] rscc
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1580:27: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1611:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[noderef] mmio @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1611:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1611:20: sparse:     got void *[noderef] mmio
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1613:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[noderef] rscc @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1613:28: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1613:28: sparse:     got void *[noderef] rscc
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c: note: in included file (through drivers/gpu/drm/msm/adreno/a6xx_gpu.h):
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse: sparse: too many warnings
--
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1515:36: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *llc_mmio @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1515:36: sparse:     expected void [noderef] __iomem *llc_mmio
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1515:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c: note: in included file (through drivers/gpu/drm/msm/adreno/a6xx_gpu.h):
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:124:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:124:21: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:124:21: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:125:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:125:23: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:125:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:124:21: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:124:21: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:125:23: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:125:23: sparse: sparse: dereference of noderef expression
--
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c: note: in included file (through drivers/gpu/drm/msm/adreno/a6xx_gpu.h):
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:136:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:136:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:136:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:136:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:136:16: sparse: sparse: dereference of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference of noderef expression

vim +101 drivers/gpu/drm/msm/adreno/a6xx_gmu.h

4b565ca5a2cbbb Jordan Crouse 2018-08-06   93  
4b565ca5a2cbbb Jordan Crouse 2018-08-06   94  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
4b565ca5a2cbbb Jordan Crouse 2018-08-06   95  {
4b565ca5a2cbbb Jordan Crouse 2018-08-06  @96  	return msm_readl(gmu->mmio + (offset << 2));
4b565ca5a2cbbb Jordan Crouse 2018-08-06   97  }
4b565ca5a2cbbb Jordan Crouse 2018-08-06   98  
4b565ca5a2cbbb Jordan Crouse 2018-08-06   99  static inline void gmu_write(struct a6xx_gmu *gmu, u32 offset, u32 value)
4b565ca5a2cbbb Jordan Crouse 2018-08-06  100  {
4b565ca5a2cbbb Jordan Crouse 2018-08-06 @101  	return msm_writel(value, gmu->mmio + (offset << 2));
4b565ca5a2cbbb Jordan Crouse 2018-08-06  102  }
4b565ca5a2cbbb Jordan Crouse 2018-08-06  103  

:::::: The code at line 101 was first introduced by commit
:::::: 4b565ca5a2cbbbb6345e8789da89c193b6b00e5a drm/msm: Add A6XX device support

:::::: TO: Jordan Crouse <jcrouse@codeaurora.org>
:::::: CC: Rob Clark <robdclark@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

--6Bk/08D7I0JAAQn6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/mips 5.17.0-rc2 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="mips64-linux-gcc (GCC) 12.1.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120100
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23800
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23800
CONFIG_LLD_VERSION=0
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
# CONFIG_WATCH_QUEUE is not set
# CONFIG_CROSS_MEMORY_ATTACH is not set
# CONFIG_USELIB is not set

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_IRQ_FASTEOI_HIERARCHY_HANDLERS=y
CONFIG_IRQ_FORCED_THREADING=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CMOS_UPDATE=y
# CONFIG_TIME_KUNIT_TEST is not set

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_FORCE=y
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
# CONFIG_BPF_UNPRIV_DEFAULT_OFF is not set
# end of BPF subsystem

CONFIG_PREEMPT_NONE_BUILD=y
CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
# CONFIG_TICK_CPU_ACCOUNTING is not set
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_IRQ_TIME_ACCOUNTING=y
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TINY_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_NEED_SEGCBLIST=y
# end of RCU Subsystem

# CONFIG_IKCONFIG is not set
CONFIG_IKHEADERS=y
CONFIG_GENERIC_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_CGROUPS=y
# CONFIG_MEMCG is not set
# CONFIG_CGROUP_SCHED is not set
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
CONFIG_CGROUP_FREEZER=y
# CONFIG_CGROUP_DEVICE is not set
# CONFIG_CGROUP_CPUACCT is not set
CONFIG_CGROUP_PERF=y
# CONFIG_CGROUP_BPF is not set
# CONFIG_CGROUP_MISC is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_CHECKPOINT_RESTORE=y
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
CONFIG_BOOT_CONFIG=y
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION=y
CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
CONFIG_LD_ORPHAN_WARN=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_EXPERT=y
# CONFIG_MULTIUSER is not set
CONFIG_SGETMASK_SYSCALL=y
# CONFIG_SYSFS_SYSCALL is not set
# CONFIG_FHANDLE is not set
CONFIG_POSIX_TIMERS=y
# CONFIG_PRINTK is not set
# CONFIG_BUG is not set
CONFIG_BASE_FULL=y
# CONFIG_FUTEX is not set
# CONFIG_EPOLL is not set
CONFIG_SIGNALFD=y
# CONFIG_TIMERFD is not set
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
# CONFIG_AIO is not set
# CONFIG_IO_URING is not set
CONFIG_ADVISE_SYSCALLS=y
# CONFIG_MEMBARRIER is not set
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_USERFAULTFD=y
CONFIG_KCMP=y
# CONFIG_RSEQ is not set
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y
CONFIG_PC104=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_VM_EVENT_COUNTERS=y
CONFIG_SLUB_DEBUG=y
CONFIG_COMPAT_BRK=y
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLOB is not set
CONFIG_SLAB_MERGE_DEFAULT=y
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
# CONFIG_PROFILING is not set
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_MIPS=y

#
# Machine selection
#
# CONFIG_MIPS_GENERIC_KERNEL is not set
# CONFIG_MIPS_ALCHEMY is not set
# CONFIG_AR7 is not set
# CONFIG_ATH25 is not set
# CONFIG_ATH79 is not set
# CONFIG_BMIPS_GENERIC is not set
# CONFIG_BCM47XX is not set
# CONFIG_BCM63XX is not set
# CONFIG_MIPS_COBALT is not set
# CONFIG_MACH_DECSTATION is not set
# CONFIG_MACH_JAZZ is not set
# CONFIG_MACH_INGENIC_SOC is not set
# CONFIG_LANTIQ is not set
# CONFIG_MACH_LOONGSON32 is not set
# CONFIG_MACH_LOONGSON2EF is not set
# CONFIG_MACH_LOONGSON64 is not set
# CONFIG_MIPS_MALTA is not set
# CONFIG_MACH_PIC32 is not set
# CONFIG_MACH_VR41XX is not set
# CONFIG_MACH_NINTENDO64 is not set
# CONFIG_RALINK is not set
# CONFIG_MACH_REALTEK_RTL is not set
# CONFIG_SGI_IP22 is not set
# CONFIG_SGI_IP27 is not set
# CONFIG_SGI_IP28 is not set
# CONFIG_SGI_IP30 is not set
# CONFIG_SGI_IP32 is not set
# CONFIG_SIBYTE_CRHINE is not set
CONFIG_SIBYTE_CARMEL=y
# CONFIG_SIBYTE_CRHONE is not set
# CONFIG_SIBYTE_RHONE is not set
# CONFIG_SIBYTE_SWARM is not set
# CONFIG_SIBYTE_LITTLESUR is not set
# CONFIG_SIBYTE_SENTOSA is not set
# CONFIG_SIBYTE_BIGSUR is not set
# CONFIG_SNI_RM is not set
# CONFIG_MACH_TX39XX is not set
# CONFIG_MACH_TX49XX is not set
# CONFIG_MIKROTIK_RB532 is not set
# CONFIG_CAVIUM_OCTEON_SOC is not set
CONFIG_SIBYTE_BCM1120=y
CONFIG_SIBYTE_BCM112X=y
CONFIG_SIBYTE_SB1xxx_SOC=y
CONFIG_CPU_SB1_PASS_2_112x=y
# CONFIG_CPU_SB1_PASS_3 is not set
CONFIG_CPU_SB1_PASS_2=y
# CONFIG_SB1_CEX_ALWAYS_FATAL is not set
CONFIG_SB1_CERR_STALL=y
CONFIG_SIBYTE_CFE_CONSOLE=y
# CONFIG_SIBYTE_BUS_WATCHER is not set
CONFIG_SIBYTE_TBPROF=y
CONFIG_SIBYTE_HAS_ZBUS_PROFILING=y
# end of Machine selection

CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_SCHED_OMIT_FRAME_POINTER=y
CONFIG_CEVT_SB1250=y
CONFIG_CSRC_SB1250=y
CONFIG_FW_CFE=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_SYS_HAS_EARLY_PRINTK=y
CONFIG_CPU_BIG_ENDIAN=y
# CONFIG_CPU_LITTLE_ENDIAN is not set
CONFIG_SYS_SUPPORTS_BIG_ENDIAN=y
CONFIG_SYS_SUPPORTS_LITTLE_ENDIAN=y
CONFIG_SWAP_IO_SPACE=y
CONFIG_BOOT_ELF32=y
CONFIG_MIPS_L1_CACHE_SHIFT=5

#
# CPU selection
#
CONFIG_CPU_SB1=y
CONFIG_SYS_HAS_CPU_SB1=y
CONFIG_WEAK_ORDERING=y
# end of CPU selection

CONFIG_TARGET_ISA_REV=0
CONFIG_SYS_SUPPORTS_32BIT_KERNEL=y
CONFIG_SYS_SUPPORTS_64BIT_KERNEL=y
CONFIG_CPU_SUPPORTS_32BIT_KERNEL=y
CONFIG_CPU_SUPPORTS_64BIT_KERNEL=y
CONFIG_CPU_SUPPORTS_HUGEPAGES=y

#
# Kernel type
#
# CONFIG_32BIT is not set
CONFIG_64BIT=y
CONFIG_MIPS_VA_BITS_48=y
CONFIG_PAGE_SIZE_4KB=y
# CONFIG_PAGE_SIZE_16KB is not set
# CONFIG_PAGE_SIZE_64KB is not set
CONFIG_FORCE_MAX_ZONEORDER=11
# CONFIG_SIBYTE_DMA_PAGEOPS is not set
CONFIG_CPU_GENERIC_DUMP_TLB=y
# CONFIG_MIPS_FP_SUPPORT is not set
CONFIG_SB1_PASS_2_WORKAROUNDS=y
CONFIG_SB1_PASS_2_1_WORKAROUNDS=y
CONFIG_CPU_NEEDS_NO_SMARTMIPS_OR_MICROMIPS=y
CONFIG_CPU_HAS_SYNC=y
CONFIG_MIPS_ASID_SHIFT=0
CONFIG_MIPS_ASID_BITS=8
CONFIG_CPU_SUPPORTS_HIGHMEM=y
CONFIG_ARCH_FLATMEM_ENABLE=y
# CONFIG_HW_PERF_EVENTS is not set
# CONFIG_HZ_24 is not set
# CONFIG_HZ_48 is not set
# CONFIG_HZ_100 is not set
CONFIG_HZ_128=y
# CONFIG_HZ_250 is not set
# CONFIG_HZ_256 is not set
# CONFIG_HZ_1000 is not set
# CONFIG_HZ_1024 is not set
CONFIG_SYS_SUPPORTS_ARBIT_HZ=y
CONFIG_HZ=128
CONFIG_SCHED_HRTICK=y
# CONFIG_KEXEC is not set
CONFIG_CRASH_DUMP=y
CONFIG_PHYSICAL_START=0xffffffff84000000
CONFIG_MIPS_O32_FP64_SUPPORT=y
# end of Kernel type

CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_PGTABLE_LEVELS=4

#
# Bus options (PCI, PCMCIA, EISA, ISA, TC)
#
CONFIG_PCI_DRIVERS_LEGACY=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=12
CONFIG_ARCH_MMAP_RND_BITS_MAX=18
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=15
# end of Bus options (PCI, PCMCIA, EISA, ISA, TC)

CONFIG_MIPS32_COMPAT=y
CONFIG_COMPAT=y
CONFIG_SYSVIPC_COMPAT=y
CONFIG_MIPS32_O32=y
# CONFIG_MIPS32_N32 is not set

#
# Power management options
#
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
# CONFIG_SUSPEND_SKIP_SYNC is not set
CONFIG_PM_SLEEP=y
# CONFIG_PM_AUTOSLEEP is not set
CONFIG_PM_WAKELOCKS=y
CONFIG_PM_WAKELOCKS_LIMIT=100
# CONFIG_PM_WAKELOCKS_GC is not set
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_CLK=y
CONFIG_PM_GENERIC_DOMAINS=y
CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
CONFIG_PM_GENERIC_DOMAINS_SLEEP=y
CONFIG_CPU_PM=y
# end of Power management options

#
# CPU Power Management
#

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
# CONFIG_CPU_IDLE_GOV_LADDER is not set
# CONFIG_CPU_IDLE_GOV_MENU is not set
CONFIG_CPU_IDLE_GOV_TEO=y

#
# MIPS CPU Idle Drivers
#
# end of MIPS CPU Idle Drivers
# end of CPU Idle
# end of CPU Power Management

# CONFIG_VIRTUALIZATION is not set
CONFIG_MIPS_LD_CAN_LINK_VDSO=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
# CONFIG_JUMP_LABEL is not set
CONFIG_HAVE_64BIT_ALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_LTO_NONE=y
CONFIG_HAVE_CONTEXT_TRACKING=y
CONFIG_HAVE_TIF_NOHZ=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=12
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT=y
CONFIG_CLONE_BACKWARDS=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_CPU_NO_EFFICIENT_FFS=y
CONFIG_HAVE_ARCH_COMPILER_H=y
CONFIG_LOCK_EVENT_COUNTS=y
CONFIG_HAVE_SPARSE_SYSCALL_NR=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_HAS_ELFCORE_COMPAT=y

#
# GCOV-based kernel profiling
#
CONFIG_GCOV_KERNEL=y
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_GCC_PLUGINS=y
CONFIG_GCC_PLUGIN_LATENT_ENTROPY=y
CONFIG_GCC_PLUGIN_RANDSTRUCT=y
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
# CONFIG_MODULES is not set
CONFIG_MODULES_TREE_LOOKUP=y
# CONFIG_BLOCK is not set
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_FREEZER=y

#
# Executable file formats
#
# CONFIG_BINFMT_ELF is not set
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=y
# CONFIG_COREDUMP is not set
# end of Executable file formats

#
# Memory Management options
#
CONFIG_FLATMEM=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_ARCH_KEEP_MEMBLOCK=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_MEMORY_BALLOON=y
# CONFIG_COMPACTION is not set
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_VIRT_TO_BUS=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_NEED_PER_CPU_KM=y
CONFIG_CMA=y
CONFIG_CMA_DEBUG=y
# CONFIG_CMA_DEBUGFS is not set
# CONFIG_CMA_SYSFS is not set
CONFIG_CMA_AREAS=7
# CONFIG_ZPOOL is not set
# CONFIG_ZSMALLOC is not set
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_PERCPU_STATS=y
CONFIG_GUP_TEST=y
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_ANON_VMA_NAME=y

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

# CONFIG_NET is not set

#
# Device Drivers
#
CONFIG_PCCARD=y
# CONFIG_PCMCIA is not set

#
# PC-card bridges
#

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
# CONFIG_DEVTMPFS is not set
CONFIG_STANDALONE=y
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
CONFIG_FW_LOADER_COMPRESS=y
CONFIG_FW_CACHE=y
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
CONFIG_DEBUG_DEVRES=y
CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
# CONFIG_PM_QOS_KUNIT_TEST is not set
# CONFIG_DRIVER_PE_KUNIT_TEST is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SLIMBUS=y
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_SCCB=y
CONFIG_REGMAP_SPI_AVMM=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_ARM_INTEGRATOR_LM=y
# CONFIG_BRCMSTB_GISB_ARB is not set
CONFIG_BT1_APB=y
CONFIG_BT1_AXI=y
# CONFIG_HISILICON_LPC is not set
CONFIG_INTEL_IXP4XX_EB=y
# CONFIG_QCOM_EBI2 is not set
CONFIG_MHI_BUS=y
# CONFIG_MHI_BUS_DEBUG is not set
# end of Bus devices

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# CONFIG_ARM_SCMI_PROTOCOL is not set
# end of ARM System Control and Management Interface Protocol

CONFIG_ARM_SCPI_PROTOCOL=y
CONFIG_ARM_SCPI_POWER_DOMAIN=y
# CONFIG_FIRMWARE_MEMMAP is not set
CONFIG_QCOM_SCM=y
# CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT is not set
CONFIG_BCM47XX_NVRAM=y
CONFIG_BCM47XX_SPROM=y
CONFIG_GOOGLE_FIRMWARE=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
# CONFIG_MTD is not set
# CONFIG_OF is not set
CONFIG_PARPORT=y
CONFIG_PARPORT_AX88796=y
# CONFIG_PARPORT_1284 is not set
CONFIG_PARPORT_NOT_PC=y

#
# NVME Support
#
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=y
CONFIG_AD525X_DPOT=y
CONFIG_AD525X_DPOT_I2C=y
CONFIG_AD525X_DPOT_SPI=y
CONFIG_DUMMY_IRQ=y
CONFIG_ICS932S401=y
CONFIG_ATMEL_SSC=y
# CONFIG_ENCLOSURE_SERVICES is not set
CONFIG_GEHC_ACHC=y
# CONFIG_QCOM_COINCELL is not set
CONFIG_QCOM_FASTRPC=y
CONFIG_APDS9802ALS=y
CONFIG_ISL29003=y
CONFIG_ISL29020=y
CONFIG_SENSORS_TSL2550=y
# CONFIG_SENSORS_BH1770 is not set
# CONFIG_SENSORS_APDS990X is not set
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
# CONFIG_LATTICE_ECP3_CONFIG is not set
# CONFIG_SRAM is not set
CONFIG_XILINX_SDFEC=y
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
CONFIG_EEPROM_AT25=y
CONFIG_EEPROM_LEGACY=y
CONFIG_EEPROM_MAX6875=y
CONFIG_EEPROM_93CX6=y
CONFIG_EEPROM_93XX46=y
CONFIG_EEPROM_IDT_89HPESX=y
CONFIG_EEPROM_EE1004=y
# end of EEPROM support

#
# Texas Instruments shared transport line discipline
#
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_SPI=y
CONFIG_SENSORS_LIS3_I2C=y
# CONFIG_ALTERA_STAPL is not set
# CONFIG_ECHO is not set
# CONFIG_UACCE is not set
CONFIG_PVPANIC=y
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# end of SCSI device support

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# end of IEEE 1394 (FireWire) support

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
CONFIG_INPUT_MOUSEDEV_PSAUX=y
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=y
# CONFIG_INPUT_EVDEV is not set
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ADC=y
# CONFIG_KEYBOARD_ADP5520 is not set
CONFIG_KEYBOARD_ADP5588=y
# CONFIG_KEYBOARD_ADP5589 is not set
# CONFIG_KEYBOARD_ATKBD is not set
CONFIG_KEYBOARD_QT1050=y
CONFIG_KEYBOARD_QT1070=y
CONFIG_KEYBOARD_QT2160=y
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
CONFIG_KEYBOARD_EP93XX=y
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
CONFIG_KEYBOARD_TCA6416=y
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
CONFIG_KEYBOARD_MAX7359=y
CONFIG_KEYBOARD_MCS=y
CONFIG_KEYBOARD_MPR121=y
CONFIG_KEYBOARD_IMX=y
CONFIG_KEYBOARD_NEWTON=y
CONFIG_KEYBOARD_OPENCORES=y
CONFIG_KEYBOARD_SAMSUNG=y
CONFIG_KEYBOARD_GOLDFISH_EVENTS=y
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_ST_KEYSCAN is not set
CONFIG_KEYBOARD_SUNKBD=y
CONFIG_KEYBOARD_SH_KEYSC=y
# CONFIG_KEYBOARD_IQS62X is not set
CONFIG_KEYBOARD_TM2_TOUCHKEY=y
CONFIG_KEYBOARD_TWL4030=y
CONFIG_KEYBOARD_XTKBD=y
CONFIG_KEYBOARD_CROS_EC=y
CONFIG_KEYBOARD_CYPRESS_SF=y
CONFIG_INPUT_MOUSE=y
# CONFIG_MOUSE_PS2 is not set
CONFIG_MOUSE_SERIAL=y
CONFIG_MOUSE_CYAPA=y
CONFIG_MOUSE_ELAN_I2C=y
CONFIG_MOUSE_ELAN_I2C_I2C=y
CONFIG_MOUSE_ELAN_I2C_SMBUS=y
# CONFIG_MOUSE_VSXXXAA is not set
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=y
# CONFIG_INPUT_JOYSTICK is not set
CONFIG_INPUT_TABLET=y
# CONFIG_TABLET_SERIAL_WACOM4 is not set
CONFIG_INPUT_TOUCHSCREEN=y
CONFIG_TOUCHSCREEN_88PM860X=y
CONFIG_TOUCHSCREEN_ADS7846=y
CONFIG_TOUCHSCREEN_AD7877=y
CONFIG_TOUCHSCREEN_AD7879=y
# CONFIG_TOUCHSCREEN_AD7879_I2C is not set
CONFIG_TOUCHSCREEN_AD7879_SPI=y
CONFIG_TOUCHSCREEN_ADC=y
# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
CONFIG_TOUCHSCREEN_AUO_PIXCIR=y
CONFIG_TOUCHSCREEN_BU21013=y
# CONFIG_TOUCHSCREEN_BU21029 is not set
CONFIG_TOUCHSCREEN_CY8CTMA140=y
CONFIG_TOUCHSCREEN_CY8CTMG110=y
# CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
CONFIG_TOUCHSCREEN_CYTTSP4_CORE=y
# CONFIG_TOUCHSCREEN_CYTTSP4_I2C is not set
# CONFIG_TOUCHSCREEN_CYTTSP4_SPI is not set
CONFIG_TOUCHSCREEN_DA9034=y
CONFIG_TOUCHSCREEN_DA9052=y
CONFIG_TOUCHSCREEN_DYNAPRO=y
CONFIG_TOUCHSCREEN_HAMPSHIRE=y
# CONFIG_TOUCHSCREEN_EETI is not set
# CONFIG_TOUCHSCREEN_EGALAX_SERIAL is not set
# CONFIG_TOUCHSCREEN_EXC3000 is not set
# CONFIG_TOUCHSCREEN_FUJITSU is not set
# CONFIG_TOUCHSCREEN_GOODIX is not set
CONFIG_TOUCHSCREEN_HIDEEP=y
# CONFIG_TOUCHSCREEN_HYCON_HY46XX is not set
CONFIG_TOUCHSCREEN_ILI210X=y
CONFIG_TOUCHSCREEN_ILITEK=y
CONFIG_TOUCHSCREEN_IPROC=y
CONFIG_TOUCHSCREEN_S6SY761=y
CONFIG_TOUCHSCREEN_GUNZE=y
# CONFIG_TOUCHSCREEN_EKTF2127 is not set
CONFIG_TOUCHSCREEN_ELAN=y
CONFIG_TOUCHSCREEN_ELO=y
CONFIG_TOUCHSCREEN_WACOM_W8001=y
# CONFIG_TOUCHSCREEN_WACOM_I2C is not set
CONFIG_TOUCHSCREEN_MAX11801=y
# CONFIG_TOUCHSCREEN_MCS5000 is not set
CONFIG_TOUCHSCREEN_MMS114=y
# CONFIG_TOUCHSCREEN_MELFAS_MIP4 is not set
CONFIG_TOUCHSCREEN_MSG2638=y
CONFIG_TOUCHSCREEN_MTOUCH=y
CONFIG_TOUCHSCREEN_IMX6UL_TSC=y
CONFIG_TOUCHSCREEN_INEXIO=y
CONFIG_TOUCHSCREEN_MK712=y
CONFIG_TOUCHSCREEN_PENMOUNT=y
CONFIG_TOUCHSCREEN_EDT_FT5X06=y
CONFIG_TOUCHSCREEN_RASPBERRYPI_FW=y
# CONFIG_TOUCHSCREEN_MIGOR is not set
CONFIG_TOUCHSCREEN_TOUCHRIGHT=y
CONFIG_TOUCHSCREEN_TOUCHWIN=y
CONFIG_TOUCHSCREEN_TI_AM335X_TSC=y
CONFIG_TOUCHSCREEN_PIXCIR=y
# CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
CONFIG_TOUCHSCREEN_WM831X=y
CONFIG_TOUCHSCREEN_MC13783=y
# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
CONFIG_TOUCHSCREEN_TSC200X_CORE=y
CONFIG_TOUCHSCREEN_TSC2004=y
CONFIG_TOUCHSCREEN_TSC2005=y
CONFIG_TOUCHSCREEN_TSC2007=y
CONFIG_TOUCHSCREEN_TSC2007_IIO=y
CONFIG_TOUCHSCREEN_RM_TS=y
CONFIG_TOUCHSCREEN_SILEAD=y
CONFIG_TOUCHSCREEN_SIS_I2C=y
CONFIG_TOUCHSCREEN_ST1232=y
# CONFIG_TOUCHSCREEN_STMFTS is not set
CONFIG_TOUCHSCREEN_SURFACE3_SPI=y
CONFIG_TOUCHSCREEN_SX8654=y
CONFIG_TOUCHSCREEN_TPS6507X=y
# CONFIG_TOUCHSCREEN_ZET6223 is not set
# CONFIG_TOUCHSCREEN_ZFORCE is not set
CONFIG_TOUCHSCREEN_ROHM_BU21023=y
CONFIG_TOUCHSCREEN_IQS5XX=y
# CONFIG_TOUCHSCREEN_ZINITIX is not set
CONFIG_INPUT_MISC=y
CONFIG_INPUT_88PM860X_ONKEY=y
# CONFIG_INPUT_88PM80X_ONKEY is not set
CONFIG_INPUT_AD714X=y
CONFIG_INPUT_AD714X_I2C=y
CONFIG_INPUT_AD714X_SPI=y
CONFIG_INPUT_ARIEL_PWRBUTTON=y
# CONFIG_INPUT_ATMEL_CAPTOUCH is not set
# CONFIG_INPUT_BMA150 is not set
CONFIG_INPUT_E3X0_BUTTON=y
CONFIG_INPUT_MAX77693_HAPTIC=y
CONFIG_INPUT_MC13783_PWRBUTTON=y
CONFIG_INPUT_MMA8450=y
CONFIG_INPUT_GPIO_BEEPER=y
CONFIG_INPUT_GPIO_DECODER=y
CONFIG_INPUT_GPIO_VIBRA=y
# CONFIG_INPUT_KXTJ9 is not set
CONFIG_INPUT_REGULATOR_HAPTIC=y
CONFIG_INPUT_RETU_PWRBUTTON=y
CONFIG_INPUT_AXP20X_PEK=y
CONFIG_INPUT_TWL4030_PWRBUTTON=y
CONFIG_INPUT_TWL4030_VIBRA=y
CONFIG_INPUT_TWL6040_VIBRA=y
CONFIG_INPUT_UINPUT=y
CONFIG_INPUT_PALMAS_PWRBUTTON=y
CONFIG_INPUT_PCF50633_PMU=y
CONFIG_INPUT_PCF8574=y
# CONFIG_INPUT_PWM_BEEPER is not set
CONFIG_INPUT_PWM_VIBRA=y
# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
CONFIG_INPUT_DA7280_HAPTICS=y
CONFIG_INPUT_DA9052_ONKEY=y
# CONFIG_INPUT_DA9063_ONKEY is not set
CONFIG_INPUT_WM831X_ON=y
CONFIG_INPUT_ADXL34X=y
CONFIG_INPUT_ADXL34X_I2C=y
CONFIG_INPUT_ADXL34X_SPI=y
CONFIG_INPUT_IQS269A=y
CONFIG_INPUT_IQS626A=y
# CONFIG_INPUT_CMA3000 is not set
# CONFIG_INPUT_DRV260X_HAPTICS is not set
CONFIG_INPUT_DRV2665_HAPTICS=y
CONFIG_INPUT_DRV2667_HAPTICS=y
CONFIG_INPUT_HISI_POWERKEY=y
CONFIG_INPUT_SC27XX_VIBRA=y
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=y
CONFIG_RMI4_SPI=y
CONFIG_RMI4_SMB=y
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
# CONFIG_RMI4_F34 is not set
CONFIG_RMI4_F3A=y
CONFIG_RMI4_F54=y
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_PARKBD=y
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=y
# CONFIG_SERIO_ALTERA_PS2 is not set
# CONFIG_SERIO_PS2MULT is not set
# CONFIG_SERIO_ARC_PS2 is not set
# CONFIG_SERIO_OLPC_APSP is not set
CONFIG_SERIO_SUN4I_PS2=y
CONFIG_SERIO_GPIO_PS2=y
CONFIG_USERIO=y
CONFIG_GAMEPORT=y
CONFIG_GAMEPORT_NS558=y
CONFIG_GAMEPORT_L4=y
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
# CONFIG_UNIX98_PTYS is not set
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
# CONFIG_LDISC_AUTOLOAD is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_16550A_VARIANTS=y
# CONFIG_SERIAL_8250_FINTEK is not set
# CONFIG_SERIAL_8250_CONSOLE is not set
CONFIG_SERIAL_8250_MEN_MCB=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=y
# CONFIG_SERIAL_8250_EM is not set
# CONFIG_SERIAL_8250_IOC3 is not set
# CONFIG_SERIAL_8250_RT288X is not set
# CONFIG_SERIAL_8250_OMAP is not set
CONFIG_SERIAL_8250_MT6577=y
# CONFIG_SERIAL_8250_UNIPHIER is not set
# CONFIG_SERIAL_8250_PXA is not set
# CONFIG_SERIAL_8250_TEGRA is not set
# CONFIG_SERIAL_8250_BCM7271 is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_AMBA_PL010 is not set
# CONFIG_SERIAL_SB1250_DUART is not set
CONFIG_SERIAL_ATMEL=y
# CONFIG_SERIAL_ATMEL_CONSOLE is not set
# CONFIG_SERIAL_ATMEL_PDC is not set
# CONFIG_SERIAL_ATMEL_TTYAT is not set
CONFIG_SERIAL_MESON=y
# CONFIG_SERIAL_MESON_CONSOLE is not set
# CONFIG_SERIAL_CLPS711X is not set
CONFIG_SERIAL_SAMSUNG=y
CONFIG_SERIAL_SAMSUNG_UARTS_4=y
CONFIG_SERIAL_SAMSUNG_UARTS=4
# CONFIG_SERIAL_SAMSUNG_CONSOLE is not set
# CONFIG_SERIAL_TEGRA is not set
CONFIG_SERIAL_TEGRA_TCU=y
CONFIG_SERIAL_TEGRA_TCU_CONSOLE=y
CONFIG_SERIAL_MAX3100=y
CONFIG_SERIAL_MAX310X=y
# CONFIG_SERIAL_IMX is not set
CONFIG_SERIAL_UARTLITE=y
# CONFIG_SERIAL_UARTLITE_CONSOLE is not set
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
# CONFIG_SERIAL_SH_SCI is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_MSM is not set
CONFIG_SERIAL_VT8500=y
# CONFIG_SERIAL_VT8500_CONSOLE is not set
CONFIG_SERIAL_OMAP=y
# CONFIG_SERIAL_OMAP_CONSOLE is not set
CONFIG_SERIAL_LANTIQ=y
CONFIG_SERIAL_LANTIQ_CONSOLE=y
CONFIG_SERIAL_SCCNXP=y
CONFIG_SERIAL_SCCNXP_CONSOLE=y
CONFIG_SERIAL_SC16IS7XX=y
# CONFIG_SERIAL_SC16IS7XX_I2C is not set
# CONFIG_SERIAL_SC16IS7XX_SPI is not set
CONFIG_SERIAL_TIMBERDALE=y
CONFIG_SERIAL_BCM63XX=y
CONFIG_SERIAL_BCM63XX_CONSOLE=y
CONFIG_SERIAL_ALTERA_JTAGUART=y
# CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE is not set
CONFIG_SERIAL_ALTERA_UART=y
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
# CONFIG_SERIAL_ALTERA_UART_CONSOLE is not set
CONFIG_SERIAL_MXS_AUART=y
# CONFIG_SERIAL_MXS_AUART_CONSOLE is not set
# CONFIG_SERIAL_MPS2_UART_CONSOLE is not set
CONFIG_SERIAL_MPS2_UART=y
CONFIG_SERIAL_ARC=y
# CONFIG_SERIAL_ARC_CONSOLE is not set
CONFIG_SERIAL_ARC_NR_PORTS=1
CONFIG_SERIAL_FSL_LPUART=y
# CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
# CONFIG_SERIAL_ST_ASC is not set
CONFIG_SERIAL_MEN_Z135=y
CONFIG_SERIAL_SPRD=y
# CONFIG_SERIAL_SPRD_CONSOLE is not set
CONFIG_SERIAL_STM32=y
# CONFIG_SERIAL_STM32_CONSOLE is not set
CONFIG_SERIAL_MVEBU_UART=y
# CONFIG_SERIAL_MVEBU_CONSOLE is not set
# CONFIG_SERIAL_OWL is not set
# CONFIG_SERIAL_RDA is not set
# CONFIG_SERIAL_LITEUART is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
CONFIG_N_HDLC=y
CONFIG_GOLDFISH_TTY=y
CONFIG_GOLDFISH_TTY_EARLY_CONSOLE=y
CONFIG_NULL_TTY=y
CONFIG_RPMSG_TTY=y
# CONFIG_SERIAL_DEV_BUS is not set
CONFIG_TTY_PRINTK=y
CONFIG_TTY_PRINTK_LEVEL=6
# CONFIG_PRINTER is not set
CONFIG_PPDEV=y
# CONFIG_VIRTIO_CONSOLE is not set
CONFIG_IPMI_HANDLER=y
CONFIG_IPMI_PLAT_DATA=y
# CONFIG_IPMI_PANIC_EVENT is not set
# CONFIG_IPMI_DEVICE_INTERFACE is not set
CONFIG_IPMI_SI=y
CONFIG_IPMI_SSIF=y
# CONFIG_IPMI_IPMB is not set
CONFIG_IPMI_WATCHDOG=y
CONFIG_IPMI_POWEROFF=y
# CONFIG_ASPEED_KCS_IPMI_BMC is not set
# CONFIG_NPCM7XX_KCS_IPMI_BMC is not set
# CONFIG_ASPEED_BT_IPMI_BMC is not set
# CONFIG_IPMB_DEVICE_INTERFACE is not set
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=y
CONFIG_HW_RANDOM_BA431=y
# CONFIG_HW_RANDOM_BCM2835 is not set
CONFIG_HW_RANDOM_IPROC_RNG200=y
CONFIG_HW_RANDOM_IXP4XX=y
CONFIG_HW_RANDOM_OMAP=y
CONFIG_HW_RANDOM_OMAP3_ROM=y
CONFIG_HW_RANDOM_VIRTIO=y
CONFIG_HW_RANDOM_IMX_RNGC=y
CONFIG_HW_RANDOM_NOMADIK=y
CONFIG_HW_RANDOM_STM32=y
CONFIG_HW_RANDOM_MESON=y
CONFIG_HW_RANDOM_MTK=y
CONFIG_HW_RANDOM_EXYNOS=y
# CONFIG_HW_RANDOM_NPCM is not set
CONFIG_HW_RANDOM_XIPHERA=y
# CONFIG_DEVMEM is not set
CONFIG_TCG_TPM=y
# CONFIG_HW_RANDOM_TPM is not set
# CONFIG_TCG_TIS_SPI is not set
# CONFIG_TCG_TIS_SYNQUACER is not set
CONFIG_TCG_TIS_I2C_CR50=y
CONFIG_TCG_TIS_I2C_ATMEL=y
CONFIG_TCG_TIS_I2C_INFINEON=y
# CONFIG_TCG_TIS_I2C_NUVOTON is not set
CONFIG_TCG_ATMEL=y
CONFIG_TCG_VTPM_PROXY=y
CONFIG_TCG_TIS_ST33ZP24=y
CONFIG_TCG_TIS_ST33ZP24_I2C=y
CONFIG_TCG_TIS_ST33ZP24_SPI=y
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
CONFIG_I2C_MUX_GPIO=y
# CONFIG_I2C_MUX_GPMUX is not set
CONFIG_I2C_MUX_LTC4306=y
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
# CONFIG_I2C_MUX_PINCTRL is not set
# CONFIG_I2C_MUX_REG is not set
CONFIG_I2C_MUX_MLXCPLD=y
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=y

#
# I2C Hardware Bus support
#
# CONFIG_I2C_HIX5HD2 is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_ASPEED=y
CONFIG_I2C_AT91=y
CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL=y
CONFIG_I2C_AXXIA=y
CONFIG_I2C_BCM2835=y
CONFIG_I2C_BCM_IPROC=y
CONFIG_I2C_BCM_KONA=y
CONFIG_I2C_BRCMSTB=y
CONFIG_I2C_CBUS_GPIO=y
CONFIG_I2C_DAVINCI=y
CONFIG_I2C_DESIGNWARE_CORE=y
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=y
# CONFIG_I2C_DIGICOLOR is not set
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_GPIO is not set
CONFIG_I2C_HIGHLANDER=y
# CONFIG_I2C_HISI is not set
CONFIG_I2C_IMG=y
# CONFIG_I2C_IMX_LPI2C is not set
CONFIG_I2C_IOP3XX=y
# CONFIG_I2C_JZ4780 is not set
# CONFIG_I2C_MESON is not set
CONFIG_I2C_MT65XX=y
# CONFIG_I2C_MT7621 is not set
CONFIG_I2C_MV64XXX=y
CONFIG_I2C_MXS=y
# CONFIG_I2C_NPCM7XX is not set
CONFIG_I2C_OCORES=y
# CONFIG_I2C_OMAP is not set
# CONFIG_I2C_OWL is not set
CONFIG_I2C_APPLE=y
CONFIG_I2C_PCA_PLATFORM=y
CONFIG_I2C_PNX=y
CONFIG_I2C_PXA=y
CONFIG_I2C_PXA_SLAVE=y
# CONFIG_I2C_QCOM_CCI is not set
CONFIG_I2C_RIIC=y
CONFIG_I2C_S3C2410=y
# CONFIG_I2C_SH_MOBILE is not set
CONFIG_I2C_SIMTEC=y
CONFIG_I2C_SPRD=y
CONFIG_I2C_ST=y
CONFIG_I2C_STM32F4=y
# CONFIG_I2C_STM32F7 is not set
CONFIG_I2C_SUN6I_P2WI=y
CONFIG_I2C_SYNQUACER=y
CONFIG_I2C_TEGRA_BPMP=y
CONFIG_I2C_UNIPHIER=y
# CONFIG_I2C_UNIPHIER_F is not set
CONFIG_I2C_VERSATILE=y
CONFIG_I2C_WMT=y
# CONFIG_I2C_XILINX is not set
# CONFIG_I2C_XLP9XX is not set
CONFIG_I2C_RCAR=y

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_PARPORT=y
CONFIG_I2C_TAOS_EVM=y

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=y
CONFIG_I2C_SIBYTE=y
CONFIG_I2C_CROS_EC_TUNNEL=y
CONFIG_I2C_VIRTIO=y
# end of I2C Hardware Bus support

CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
CONFIG_I2C_SLAVE_TESTUNIT=y
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=y
CONFIG_CDNS_I3C_MASTER=y
CONFIG_DW_I3C_MASTER=y
CONFIG_SVC_I3C_MASTER=y
CONFIG_MIPI_I3C_HCI=y
CONFIG_SPI=y
CONFIG_SPI_DEBUG=y
CONFIG_SPI_MASTER=y
# CONFIG_SPI_MEM is not set

#
# SPI Master Controller Drivers
#
CONFIG_SPI_ALTERA=y
CONFIG_SPI_ALTERA_CORE=y
CONFIG_SPI_AR934X=y
CONFIG_SPI_ATH79=y
CONFIG_SPI_ARMADA_3700=y
# CONFIG_SPI_AT91_USART is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
CONFIG_SPI_BCM2835=y
CONFIG_SPI_BCM2835AUX=y
CONFIG_SPI_BCM63XX=y
CONFIG_SPI_BCM63XX_HSSPI=y
# CONFIG_SPI_BCM_QSPI is not set
CONFIG_SPI_BITBANG=y
# CONFIG_SPI_BUTTERFLY is not set
# CONFIG_SPI_CADENCE is not set
CONFIG_SPI_CLPS711X=y
CONFIG_SPI_DESIGNWARE=y
CONFIG_SPI_DW_DMA=y
CONFIG_SPI_DW_MMIO=y
CONFIG_SPI_DW_BT1=y
CONFIG_SPI_DW_BT1_DIRMAP=y
# CONFIG_SPI_EP93XX is not set
CONFIG_SPI_FSL_LPSPI=y
CONFIG_SPI_FSL_QUADSPI=y
# CONFIG_SPI_HISI_KUNPENG is not set
CONFIG_SPI_HISI_SFC_V3XX=y
CONFIG_SPI_NXP_FLEXSPI=y
CONFIG_SPI_GPIO=y
# CONFIG_SPI_IMG_SPFI is not set
CONFIG_SPI_IMX=y
# CONFIG_SPI_INGENIC is not set
CONFIG_SPI_LM70_LLP=y
CONFIG_SPI_LP8841_RTC=y
CONFIG_SPI_FSL_DSPI=y
CONFIG_SPI_MESON_SPICC=y
CONFIG_SPI_MESON_SPIFC=y
CONFIG_SPI_MT65XX=y
CONFIG_SPI_MT7621=y
CONFIG_SPI_MTK_NOR=y
# CONFIG_SPI_NPCM_PSPI is not set
CONFIG_SPI_LANTIQ_SSC=y
# CONFIG_SPI_OC_TINY is not set
# CONFIG_SPI_OMAP24XX is not set
CONFIG_SPI_TI_QSPI=y
CONFIG_SPI_OMAP_100K=y
# CONFIG_SPI_ORION is not set
CONFIG_SPI_PIC32=y
CONFIG_SPI_PIC32_SQI=y
# CONFIG_SPI_PXA2XX is not set
CONFIG_SPI_ROCKCHIP=y
# CONFIG_SPI_ROCKCHIP_SFC is not set
# CONFIG_SPI_RSPI is not set
CONFIG_SPI_QUP=y
# CONFIG_SPI_S3C64XX is not set
# CONFIG_SPI_SC18IS602 is not set
# CONFIG_SPI_SH_MSIOF is not set
# CONFIG_SPI_SH is not set
CONFIG_SPI_SH_HSPI=y
CONFIG_SPI_SIFIVE=y
CONFIG_SPI_SLAVE_MT27XX=y
CONFIG_SPI_SPRD=y
CONFIG_SPI_SPRD_ADI=y
CONFIG_SPI_STM32=y
CONFIG_SPI_ST_SSC4=y
CONFIG_SPI_SUN4I=y
CONFIG_SPI_SUN6I=y
CONFIG_SPI_SYNQUACER=y
# CONFIG_SPI_MXIC is not set
CONFIG_SPI_TEGRA210_QUAD=y
# CONFIG_SPI_TEGRA114 is not set
CONFIG_SPI_TEGRA20_SFLASH=y
CONFIG_SPI_TEGRA20_SLINK=y
# CONFIG_SPI_XCOMM is not set
CONFIG_SPI_XILINX=y
CONFIG_SPI_XLP=y
# CONFIG_SPI_XTENSA_XTFPGA is not set
# CONFIG_SPI_ZYNQ_QSPI is not set
CONFIG_SPI_ZYNQMP_GQSPI=y
# CONFIG_SPI_AMD is not set

#
# SPI Multiplexer support
#
CONFIG_SPI_MUX=y

#
# SPI Protocol Masters
#
CONFIG_SPI_SPIDEV=y
CONFIG_SPI_TLE62X0=y
CONFIG_SPI_SLAVE=y
CONFIG_SPI_SLAVE_TIME=y
CONFIG_SPI_SLAVE_SYSTEM_CONTROL=y
CONFIG_SPI_DYNAMIC=y
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
CONFIG_PPS_DEBUG=y
CONFIG_NTP_PPS=y

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=y
# CONFIG_PPS_CLIENT_LDISC is not set
# CONFIG_PPS_CLIENT_PARPORT is not set
CONFIG_PPS_CLIENT_GPIO=y

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
CONFIG_PINCTRL_AMD=y
# CONFIG_PINCTRL_DA9062 is not set
CONFIG_PINCTRL_MCP23S08_I2C=y
CONFIG_PINCTRL_MCP23S08_SPI=y
CONFIG_PINCTRL_MCP23S08=y
CONFIG_PINCTRL_SX150X=y
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L15=y
CONFIG_PINCTRL_CS47L92=y

#
# Intel pinctrl drivers
#
# end of Intel pinctrl drivers

#
# MediaTek pinctrl drivers
#
CONFIG_EINT_MTK=y
# end of MediaTek pinctrl drivers

CONFIG_PINCTRL_PXA=y
CONFIG_PINCTRL_PXA25X=y
# CONFIG_PINCTRL_PXA27X is not set
CONFIG_PINCTRL_MSM=y
# CONFIG_PINCTRL_SM8350 is not set
# CONFIG_PINCTRL_LPASS_LPI is not set

#
# Renesas pinctrl drivers
#
CONFIG_PINCTRL_RENESAS=y
CONFIG_PINCTRL_SH_PFC=y
CONFIG_PINCTRL_SH_PFC_GPIO=y
CONFIG_PINCTRL_SH_FUNC_GPIO=y
CONFIG_PINCTRL_PFC_EMEV2=y
CONFIG_PINCTRL_PFC_R8A77995=y
# CONFIG_PINCTRL_PFC_R8A7794 is not set
CONFIG_PINCTRL_PFC_R8A77990=y
# CONFIG_PINCTRL_PFC_R8A7779 is not set
# CONFIG_PINCTRL_PFC_R8A7790 is not set
# CONFIG_PINCTRL_PFC_R8A77950 is not set
# CONFIG_PINCTRL_PFC_R8A77951 is not set
# CONFIG_PINCTRL_PFC_R8A7778 is not set
CONFIG_PINCTRL_PFC_R8A7793=y
# CONFIG_PINCTRL_PFC_R8A7791 is not set
# CONFIG_PINCTRL_PFC_R8A77965 is not set
# CONFIG_PINCTRL_PFC_R8A77960 is not set
CONFIG_PINCTRL_PFC_R8A77961=y
CONFIG_PINCTRL_PFC_R8A7792=y
# CONFIG_PINCTRL_PFC_R8A77980 is not set
# CONFIG_PINCTRL_PFC_R8A77970 is not set
CONFIG_PINCTRL_PFC_R8A779A0=y
CONFIG_PINCTRL_PFC_R8A7740=y
# CONFIG_PINCTRL_PFC_R8A73A4 is not set
# CONFIG_PINCTRL_PFC_R8A77470 is not set
# CONFIG_PINCTRL_PFC_R8A7745 is not set
CONFIG_PINCTRL_PFC_R8A7742=y
# CONFIG_PINCTRL_PFC_R8A7743 is not set
# CONFIG_PINCTRL_PFC_R8A7744 is not set
CONFIG_PINCTRL_PFC_R8A774C0=y
# CONFIG_PINCTRL_PFC_R8A774E1 is not set
CONFIG_PINCTRL_PFC_R8A774A1=y
# CONFIG_PINCTRL_PFC_R8A774B1 is not set
# CONFIG_PINCTRL_PFC_SH7203 is not set
CONFIG_PINCTRL_PFC_SH7264=y
CONFIG_PINCTRL_PFC_SH7269=y
CONFIG_PINCTRL_PFC_SH7720=y
CONFIG_PINCTRL_PFC_SH7722=y
CONFIG_PINCTRL_PFC_SH7734=y
# CONFIG_PINCTRL_PFC_SH7757 is not set
CONFIG_PINCTRL_PFC_SH7785=y
CONFIG_PINCTRL_PFC_SH7786=y
CONFIG_PINCTRL_PFC_SH73A0=y
CONFIG_PINCTRL_PFC_SH7723=y
CONFIG_PINCTRL_PFC_SH7724=y
CONFIG_PINCTRL_PFC_SHX3=y
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
# CONFIG_GPIO_SYSFS is not set
# CONFIG_GPIO_CDEV is not set
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_REGMAP=y
CONFIG_GPIO_MAX730X=y

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_ATH79=y
CONFIG_GPIO_CLPS711X=y
CONFIG_GPIO_DWAPB=y
CONFIG_GPIO_GENERIC_PLATFORM=y
# CONFIG_GPIO_HISI is not set
CONFIG_GPIO_IOP=y
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_MENZ127 is not set
# CONFIG_GPIO_MPC8XXX is not set
CONFIG_GPIO_MXC=y
# CONFIG_GPIO_MXS is not set
# CONFIG_GPIO_PXA is not set
CONFIG_GPIO_RCAR=y
CONFIG_GPIO_ROCKCHIP=y
CONFIG_GPIO_XGENE_SB=y
# CONFIG_GPIO_XLP is not set
CONFIG_GPIO_AMD_FCH=y
CONFIG_GPIO_IDT3243X=y
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
CONFIG_GPIO_MAX7300=y
CONFIG_GPIO_MAX732X=y
# CONFIG_GPIO_MAX732X_IRQ is not set
# CONFIG_GPIO_PCA953X is not set
CONFIG_GPIO_PCA9570=y
CONFIG_GPIO_PCF857X=y
# CONFIG_GPIO_TPIC2810 is not set
CONFIG_GPIO_TS4900=y
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# CONFIG_GPIO_ADP5520 is not set
CONFIG_GPIO_ARIZONA=y
CONFIG_GPIO_DA9052=y
CONFIG_GPIO_MADERA=y
CONFIG_GPIO_PALMAS=y
# CONFIG_GPIO_RC5T583 is not set
CONFIG_GPIO_SL28CPLD=y
# CONFIG_GPIO_TPS65086 is not set
CONFIG_GPIO_TPS6586X=y
# CONFIG_GPIO_TPS65910 is not set
CONFIG_GPIO_TPS65912=y
# CONFIG_GPIO_TQMX86 is not set
# CONFIG_GPIO_TWL4030 is not set
CONFIG_GPIO_TWL6040=y
# CONFIG_GPIO_WM831X is not set
# end of MFD GPIO expanders

#
# SPI GPIO expanders
#
CONFIG_GPIO_MAX3191X=y
CONFIG_GPIO_MAX7301=y
CONFIG_GPIO_MC33880=y
# CONFIG_GPIO_PISOSR is not set
# CONFIG_GPIO_XRA1403 is not set
# end of SPI GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=y
# CONFIG_GPIO_MOCKUP is not set
CONFIG_GPIO_VIRTIO=y
CONFIG_GPIO_SIM=y
# end of Virtual GPIO drivers

CONFIG_W1=y

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_DS2482 is not set
# CONFIG_W1_MASTER_MXC is not set
# CONFIG_W1_MASTER_DS1WM is not set
CONFIG_W1_MASTER_GPIO=y
CONFIG_W1_MASTER_SGI=y
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
# CONFIG_W1_SLAVE_SMEM is not set
# CONFIG_W1_SLAVE_DS2405 is not set
CONFIG_W1_SLAVE_DS2408=y
CONFIG_W1_SLAVE_DS2408_READBACK=y
# CONFIG_W1_SLAVE_DS2413 is not set
# CONFIG_W1_SLAVE_DS2406 is not set
# CONFIG_W1_SLAVE_DS2423 is not set
CONFIG_W1_SLAVE_DS2805=y
# CONFIG_W1_SLAVE_DS2430 is not set
CONFIG_W1_SLAVE_DS2431=y
# CONFIG_W1_SLAVE_DS2433 is not set
CONFIG_W1_SLAVE_DS2438=y
CONFIG_W1_SLAVE_DS250X=y
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=y
CONFIG_W1_SLAVE_DS28E17=y
# end of 1-wire Slaves

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_PDA_POWER=y
CONFIG_GENERIC_ADC_BATTERY=y
CONFIG_WM831X_BACKUP=y
CONFIG_WM831X_POWER=y
CONFIG_TEST_POWER=y
CONFIG_BATTERY_88PM860X=y
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_ACT8945A is not set
CONFIG_BATTERY_CW2015=y
CONFIG_BATTERY_DS2760=y
CONFIG_BATTERY_DS2780=y
CONFIG_BATTERY_DS2781=y
CONFIG_BATTERY_DS2782=y
CONFIG_BATTERY_OLPC=y
# CONFIG_BATTERY_INGENIC is not set
CONFIG_BATTERY_SBS=y
CONFIG_CHARGER_SBS=y
CONFIG_MANAGER_SBS=y
CONFIG_BATTERY_BQ27XXX=y
CONFIG_BATTERY_BQ27XXX_I2C=y
CONFIG_BATTERY_BQ27XXX_HDQ=y
CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM=y
CONFIG_BATTERY_DA9030=y
# CONFIG_BATTERY_DA9052 is not set
CONFIG_CHARGER_DA9150=y
# CONFIG_BATTERY_DA9150 is not set
CONFIG_CHARGER_AXP20X=y
CONFIG_BATTERY_AXP20X=y
# CONFIG_AXP20X_POWER is not set
CONFIG_BATTERY_MAX17040=y
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_BATTERY_MAX1721X is not set
CONFIG_BATTERY_TWL4030_MADC=y
# CONFIG_CHARGER_88PM860X is not set
# CONFIG_CHARGER_PCF50633 is not set
# CONFIG_BATTERY_RX51 is not set
CONFIG_CHARGER_MAX8903=y
CONFIG_CHARGER_TWL4030=y
CONFIG_CHARGER_LP8727=y
CONFIG_CHARGER_GPIO=y
CONFIG_CHARGER_MANAGER=y
# CONFIG_CHARGER_LT3651 is not set
CONFIG_CHARGER_LTC4162L=y
# CONFIG_CHARGER_MAX14577 is not set
# CONFIG_CHARGER_MAX77976 is not set
# CONFIG_CHARGER_MAX8998 is not set
# CONFIG_CHARGER_MP2629 is not set
# CONFIG_CHARGER_MT6360 is not set
CONFIG_CHARGER_BQ2415X=y
# CONFIG_CHARGER_BQ24190 is not set
CONFIG_CHARGER_BQ24257=y
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ2515X is not set
# CONFIG_CHARGER_BQ25890 is not set
CONFIG_CHARGER_BQ25980=y
CONFIG_CHARGER_BQ256XX=y
CONFIG_CHARGER_SMB347=y
# CONFIG_CHARGER_TPS65090 is not set
CONFIG_BATTERY_GAUGE_LTC2941=y
CONFIG_BATTERY_GOLDFISH=y
CONFIG_BATTERY_RT5033=y
# CONFIG_CHARGER_RT9455 is not set
CONFIG_CHARGER_SC2731=y
# CONFIG_FUEL_GAUGE_SC27XX is not set
CONFIG_CHARGER_BD99954=y
CONFIG_BATTERY_ACER_A500=y
# CONFIG_HWMON is not set
CONFIG_THERMAL=y
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_WRITABLE_TRIPS=y
# CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE=y
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
# CONFIG_THERMAL_GOV_BANG_BANG is not set
# CONFIG_THERMAL_GOV_USER_SPACE is not set
# CONFIG_DEVFREQ_THERMAL is not set
# CONFIG_THERMAL_EMULATION is not set
# CONFIG_THERMAL_MMIO is not set
CONFIG_K3_THERMAL=y
CONFIG_ROCKCHIP_THERMAL=y
CONFIG_RCAR_THERMAL=y
CONFIG_MTK_THERMAL=y

#
# Intel thermal drivers
#

#
# ACPI INT340X thermal drivers
#
# end of ACPI INT340X thermal drivers
# end of Intel thermal drivers

#
# Broadcom thermal drivers
#
CONFIG_BRCMSTB_THERMAL=y
CONFIG_BCM_NS_THERMAL=y
CONFIG_BCM_SR_THERMAL=y
# end of Broadcom thermal drivers

#
# Texas Instruments thermal drivers
#
CONFIG_TI_SOC_THERMAL=y
# CONFIG_TI_THERMAL is not set
# CONFIG_OMAP3_THERMAL is not set
# CONFIG_OMAP4_THERMAL is not set
# CONFIG_OMAP5_THERMAL is not set
# CONFIG_DRA752_THERMAL is not set
# end of Texas Instruments thermal drivers

#
# Samsung thermal drivers
#
# end of Samsung thermal drivers

#
# NVIDIA Tegra thermal drivers
#
CONFIG_TEGRA_SOCTHERM=y
# CONFIG_TEGRA_BPMP_THERMAL is not set
CONFIG_TEGRA30_TSENSOR=y
# end of NVIDIA Tegra thermal drivers

CONFIG_GENERIC_ADC_THERMAL=y

#
# Qualcomm thermal drivers
#
# end of Qualcomm thermal drivers

CONFIG_SPRD_THERMAL=y
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
CONFIG_WATCHDOG_NOWAYOUT=y
# CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y
CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT=y

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
# CONFIG_SOFT_WATCHDOG is not set
# CONFIG_DA9052_WATCHDOG is not set
CONFIG_DA9055_WATCHDOG=y
CONFIG_DA9063_WATCHDOG=y
CONFIG_DA9062_WATCHDOG=y
# CONFIG_MENF21BMC_WATCHDOG is not set
CONFIG_MENZ069_WATCHDOG=y
# CONFIG_WM831X_WATCHDOG is not set
CONFIG_XILINX_WATCHDOG=y
CONFIG_ZIIRAVE_WATCHDOG=y
CONFIG_MLX_WDT=y
CONFIG_SL28CPLD_WATCHDOG=y
CONFIG_ARMADA_37XX_WATCHDOG=y
# CONFIG_AT91RM9200_WATCHDOG is not set
CONFIG_AT91SAM9X_WATCHDOG=y
CONFIG_SAMA5D4_WATCHDOG=y
CONFIG_CADENCE_WATCHDOG=y
CONFIG_FTWDT010_WATCHDOG=y
CONFIG_S3C2410_WATCHDOG=y
# CONFIG_DW_WATCHDOG is not set
CONFIG_EP93XX_WATCHDOG=y
CONFIG_OMAP_WATCHDOG=y
CONFIG_PNX4008_WATCHDOG=y
CONFIG_DAVINCI_WATCHDOG=y
CONFIG_K3_RTI_WATCHDOG=y
CONFIG_RN5T618_WATCHDOG=y
CONFIG_SUNXI_WATCHDOG=y
CONFIG_NPCM7XX_WATCHDOG=y
# CONFIG_TWL4030_WATCHDOG is not set
CONFIG_STMP3XXX_RTC_WATCHDOG=y
CONFIG_TS72XX_WATCHDOG=y
# CONFIG_MAX63XX_WATCHDOG is not set
# CONFIG_MAX77620_WATCHDOG is not set
# CONFIG_IMX2_WDT is not set
CONFIG_IMX7ULP_WDT=y
CONFIG_RETU_WATCHDOG=y
CONFIG_MOXART_WDT=y
# CONFIG_TEGRA_WATCHDOG is not set
# CONFIG_QCOM_WDT is not set
CONFIG_MESON_GXBB_WATCHDOG=y
CONFIG_MESON_WATCHDOG=y
CONFIG_MEDIATEK_WATCHDOG=y
CONFIG_DIGICOLOR_WATCHDOG=y
CONFIG_LPC18XX_WATCHDOG=y
CONFIG_RENESAS_WDT=y
# CONFIG_RENESAS_RZAWDT is not set
CONFIG_RENESAS_RZG2LWDT=y
CONFIG_ASPEED_WATCHDOG=y
CONFIG_REALTEK_OTTO_WDT=y
CONFIG_SPRD_WATCHDOG=y
CONFIG_VISCONTI_WATCHDOG=y
CONFIG_MSC313E_WATCHDOG=y
CONFIG_APPLE_WATCHDOG=y
# CONFIG_SC520_WDT is not set
CONFIG_BCM47XX_WDT=y
CONFIG_JZ4740_WDT=y
CONFIG_WDT_MTX1=y
CONFIG_SIBYTE_WDOG=y
# CONFIG_TXX9_WDT is not set
CONFIG_BCM_KONA_WDT=y
CONFIG_BCM_KONA_WDT_DEBUG=y
CONFIG_BCM7038_WDT=y
CONFIG_IMGPDC_WDT=y
# CONFIG_PIC32_WDT is not set
# CONFIG_PIC32_DMT is not set
CONFIG_MPC5200_WDT=y
CONFIG_MEN_A21_WDT=y
CONFIG_UML_WATCHDOG=y
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_SDIOHOST_POSSIBLE=y
# CONFIG_SSB_SDIOHOST is not set
# CONFIG_SSB_HOST_SOC is not set
CONFIG_SSB_SERIAL=y
CONFIG_SSB_DRIVER_MIPS=y
CONFIG_SSB_SFLASH=y
# CONFIG_SSB_DRIVER_EXTIF is not set
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_SUN4I_GPADC is not set
CONFIG_MFD_AS3711=y
CONFIG_PMIC_ADP5520=y
CONFIG_MFD_AAT2870_CORE=y
CONFIG_MFD_AT91_USART=y
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
# CONFIG_MFD_CROS_EC_DEV is not set
CONFIG_MFD_MADERA=y
# CONFIG_MFD_MADERA_I2C is not set
# CONFIG_MFD_MADERA_SPI is not set
CONFIG_MFD_CS47L15=y
# CONFIG_MFD_CS47L35 is not set
# CONFIG_MFD_CS47L85 is not set
# CONFIG_MFD_CS47L90 is not set
CONFIG_MFD_CS47L92=y
CONFIG_MFD_ASIC3=y
CONFIG_PMIC_DA903X=y
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_SPI=y
CONFIG_MFD_DA9052_I2C=y
# CONFIG_MFD_DA9055 is not set
CONFIG_MFD_DA9062=y
CONFIG_MFD_DA9063=y
CONFIG_MFD_DA9150=y
CONFIG_MFD_ENE_KB3930=y
CONFIG_MFD_EXYNOS_LPASS=y
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_SPI=y
CONFIG_MFD_MC13XXX_I2C=y
CONFIG_MFD_MP2629=y
# CONFIG_MFD_MXS_LRADC is not set
# CONFIG_MFD_MX25_TSADC is not set
CONFIG_HTC_PASIC3=y
# CONFIG_HTC_I2CPLD is not set
CONFIG_MFD_IQS62X=y
# CONFIG_MFD_KEMPLD is not set
CONFIG_MFD_88PM800=y
# CONFIG_MFD_88PM805 is not set
CONFIG_MFD_88PM860X=y
CONFIG_MFD_MAX14577=y
# CONFIG_MFD_MAX77620 is not set
# CONFIG_MFD_MAX77650 is not set
# CONFIG_MFD_MAX77686 is not set
# CONFIG_MFD_MAX77693 is not set
CONFIG_MFD_MAX77843=y
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
CONFIG_MFD_MAX8998=y
CONFIG_MFD_MT6360=y
# CONFIG_MFD_MT6397 is not set
CONFIG_MFD_MENF21BMC=y
# CONFIG_EZX_PCAP is not set
# CONFIG_MFD_CPCAP is not set
# CONFIG_MFD_NTXEC is not set
CONFIG_MFD_RETU=y
CONFIG_MFD_PCF50633=y
CONFIG_PCF50633_ADC=y
# CONFIG_PCF50633_GPIO is not set
# CONFIG_MFD_PM8XXX is not set
CONFIG_MFD_RT4831=y
CONFIG_MFD_RT5033=y
CONFIG_MFD_RC5T583=y
# CONFIG_MFD_SEC_CORE is not set
CONFIG_MFD_SI476X_CORE=y
CONFIG_MFD_SIMPLE_MFD_I2C=y
CONFIG_MFD_SL28CPLD=y
# CONFIG_MFD_SM501 is not set
# CONFIG_MFD_SKY81452 is not set
CONFIG_MFD_SC27XX_PMIC=y
CONFIG_ABX500_CORE=y
CONFIG_MFD_SUN6I_PRCM=y
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
CONFIG_MFD_PALMAS=y
# CONFIG_TPS6105X is not set
CONFIG_TPS65010=y
# CONFIG_TPS6507X is not set
CONFIG_MFD_TPS65086=y
CONFIG_MFD_TPS65090=y
# CONFIG_MFD_TI_LP873X is not set
CONFIG_MFD_TPS6586X=y
CONFIG_MFD_TPS65910=y
CONFIG_MFD_TPS65912=y
CONFIG_MFD_TPS65912_I2C=y
# CONFIG_MFD_TPS65912_SPI is not set
CONFIG_TWL4030_CORE=y
CONFIG_MFD_TWL4030_AUDIO=y
CONFIG_TWL6040_CORE=y
# CONFIG_MFD_WL1273_CORE is not set
CONFIG_MFD_LM3533=y
CONFIG_MFD_TQMX86=y
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
CONFIG_MFD_ARIZONA_SPI=y
CONFIG_MFD_CS47L24=y
# CONFIG_MFD_WM5102 is not set
# CONFIG_MFD_WM5110 is not set
CONFIG_MFD_WM8997=y
# CONFIG_MFD_WM8998 is not set
CONFIG_MFD_WM8400=y
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
# CONFIG_MFD_WM831X_SPI is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
CONFIG_MFD_STW481X=y
CONFIG_MFD_STM32_LPTIMER=y
# CONFIG_MFD_STM32_TIMERS is not set
# CONFIG_MFD_STMFX is not set
CONFIG_MFD_WCD934X=y
# CONFIG_MFD_ATC260X_I2C is not set
# CONFIG_MFD_KHADAS_MCU is not set
CONFIG_MFD_ACER_A500_EC=y
CONFIG_MFD_INTEL_M10_BMC=y
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
CONFIG_REGULATOR_88PG86X=y
CONFIG_REGULATOR_88PM800=y
CONFIG_REGULATOR_88PM8607=y
CONFIG_REGULATOR_ACT8865=y
# CONFIG_REGULATOR_AD5398 is not set
CONFIG_REGULATOR_ANATOP=y
CONFIG_REGULATOR_AAT2870=y
# CONFIG_REGULATOR_AS3711 is not set
# CONFIG_REGULATOR_AXP20X is not set
CONFIG_REGULATOR_DA903X=y
CONFIG_REGULATOR_DA9052=y
CONFIG_REGULATOR_DA9062=y
# CONFIG_REGULATOR_DA9210 is not set
CONFIG_REGULATOR_DA9211=y
# CONFIG_REGULATOR_FAN53555 is not set
# CONFIG_REGULATOR_FAN53880 is not set
CONFIG_REGULATOR_GPIO=y
CONFIG_REGULATOR_ISL9305=y
CONFIG_REGULATOR_ISL6271A=y
CONFIG_REGULATOR_LP3971=y
CONFIG_REGULATOR_LP3972=y
# CONFIG_REGULATOR_LP872X is not set
CONFIG_REGULATOR_LP8755=y
# CONFIG_REGULATOR_LTC3589 is not set
CONFIG_REGULATOR_LTC3676=y
CONFIG_REGULATOR_MAX14577=y
# CONFIG_REGULATOR_MAX1586 is not set
CONFIG_REGULATOR_MAX77620=y
# CONFIG_REGULATOR_MAX77650 is not set
CONFIG_REGULATOR_MAX8649=y
CONFIG_REGULATOR_MAX8660=y
# CONFIG_REGULATOR_MAX8893 is not set
# CONFIG_REGULATOR_MAX8907 is not set
CONFIG_REGULATOR_MAX8952=y
CONFIG_REGULATOR_MAX8998=y
CONFIG_REGULATOR_MAX20086=y
CONFIG_REGULATOR_MAX77686=y
# CONFIG_REGULATOR_MAX77693 is not set
CONFIG_REGULATOR_MAX77802=y
# CONFIG_REGULATOR_MAX77826 is not set
CONFIG_REGULATOR_MC13XXX_CORE=y
# CONFIG_REGULATOR_MC13783 is not set
CONFIG_REGULATOR_MC13892=y
# CONFIG_REGULATOR_MP8859 is not set
# CONFIG_REGULATOR_MP886X is not set
CONFIG_REGULATOR_MT6311=y
CONFIG_REGULATOR_MT6360=y
CONFIG_REGULATOR_PALMAS=y
CONFIG_REGULATOR_PBIAS=y
# CONFIG_REGULATOR_PCA9450 is not set
CONFIG_REGULATOR_PCF50633=y
# CONFIG_REGULATOR_PV88060 is not set
CONFIG_REGULATOR_PV88080=y
# CONFIG_REGULATOR_PV88090 is not set
CONFIG_REGULATOR_PWM=y
CONFIG_REGULATOR_QCOM_RPMH=y
CONFIG_REGULATOR_QCOM_SMD_RPM=y
# CONFIG_REGULATOR_QCOM_SPMI is not set
CONFIG_REGULATOR_QCOM_USB_VBUS=y
# CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY is not set
# CONFIG_REGULATOR_RC5T583 is not set
CONFIG_REGULATOR_RT4801=y
CONFIG_REGULATOR_RT4831=y
CONFIG_REGULATOR_RT5033=y
# CONFIG_REGULATOR_RT6160 is not set
CONFIG_REGULATOR_RT6245=y
CONFIG_REGULATOR_RTQ2134=y
# CONFIG_REGULATOR_RTMV20 is not set
CONFIG_REGULATOR_RTQ6752=y
# CONFIG_REGULATOR_S2MPA01 is not set
CONFIG_REGULATOR_S2MPS11=y
# CONFIG_REGULATOR_S5M8767 is not set
CONFIG_REGULATOR_SC2731=y
CONFIG_REGULATOR_SLG51000=y
CONFIG_REGULATOR_STM32_BOOSTER=y
CONFIG_REGULATOR_STM32_VREFBUF=y
# CONFIG_REGULATOR_STM32_PWR is not set
# CONFIG_REGULATOR_TI_ABB is not set
# CONFIG_REGULATOR_STW481X_VMMC is not set
# CONFIG_REGULATOR_SY8106A is not set
# CONFIG_REGULATOR_SY8824X is not set
# CONFIG_REGULATOR_SY8827N is not set
CONFIG_REGULATOR_TPS51632=y
CONFIG_REGULATOR_TPS62360=y
# CONFIG_REGULATOR_TPS65023 is not set
CONFIG_REGULATOR_TPS6507X=y
# CONFIG_REGULATOR_TPS65086 is not set
CONFIG_REGULATOR_TPS65090=y
# CONFIG_REGULATOR_TPS65132 is not set
CONFIG_REGULATOR_TPS6524X=y
CONFIG_REGULATOR_TPS6586X=y
# CONFIG_REGULATOR_TPS65910 is not set
# CONFIG_REGULATOR_TPS65912 is not set
CONFIG_REGULATOR_TPS68470=y
# CONFIG_REGULATOR_TWL4030 is not set
CONFIG_REGULATOR_WM831X=y
# CONFIG_REGULATOR_WM8400 is not set
# CONFIG_REGULATOR_QCOM_LABIBB is not set
CONFIG_RC_CORE=y
CONFIG_RC_MAP=y
# CONFIG_LIRC is not set
CONFIG_RC_DECODERS=y
# CONFIG_IR_NEC_DECODER is not set
CONFIG_IR_RC5_DECODER=y
# CONFIG_IR_RC6_DECODER is not set
CONFIG_IR_JVC_DECODER=y
# CONFIG_IR_SONY_DECODER is not set
CONFIG_IR_SANYO_DECODER=y
CONFIG_IR_SHARP_DECODER=y
# CONFIG_IR_MCE_KBD_DECODER is not set
CONFIG_IR_XMP_DECODER=y
CONFIG_IR_IMON_DECODER=y
CONFIG_IR_RCMM_DECODER=y
# CONFIG_RC_DEVICES is not set
CONFIG_CEC_CORE=y

#
# CEC support
#
# CONFIG_MEDIA_CEC_RC is not set
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=y
# CONFIG_MEDIA_SUPPORT_FILTER is not set
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_SDR_SUPPORT=y
CONFIG_MEDIA_PLATFORM_SUPPORT=y
CONFIG_MEDIA_TEST_SUPPORT=y
# end of Media device types

#
# Media core support
#
CONFIG_VIDEO_DEV=y
CONFIG_MEDIA_CONTROLLER=y
CONFIG_DVB_CORE=y
# end of Media core support

#
# Video4Linux options
#
CONFIG_VIDEO_V4L2=y
CONFIG_VIDEO_V4L2_I2C=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
CONFIG_VIDEO_ADV_DEBUG=y
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
CONFIG_V4L2_H264=y
CONFIG_V4L2_VP9=y
CONFIG_V4L2_MEM2MEM_DEV=y
CONFIG_V4L2_FLASH_LED_CLASS=y
CONFIG_V4L2_FWNODE=y
CONFIG_V4L2_ASYNC=y
# end of Video4Linux options

#
# Media controller options
#
# CONFIG_MEDIA_CONTROLLER_DVB is not set
CONFIG_MEDIA_CONTROLLER_REQUEST_API=y
# end of Media controller options

#
# Digital TV options
#
# CONFIG_DVB_MMAP is not set
CONFIG_DVB_MAX_ADAPTERS=16
CONFIG_DVB_DYNAMIC_MINORS=y
CONFIG_DVB_DEMUX_SECTION_LOSS_LOG=y
# CONFIG_DVB_ULE_DEBUG is not set
# end of Digital TV options

#
# Media drivers
#
# CONFIG_RADIO_ADAPTERS is not set
CONFIG_MEDIA_COMMON_OPTIONS=y

#
# common driver options
#
CONFIG_VIDEOBUF2_CORE=y
CONFIG_VIDEOBUF2_V4L2=y
CONFIG_VIDEOBUF2_MEMOPS=y
CONFIG_VIDEOBUF2_DMA_CONTIG=y
CONFIG_VIDEOBUF2_VMALLOC=y
CONFIG_SMS_SIANO_MDTV=y
CONFIG_SMS_SIANO_RC=y
# CONFIG_V4L_PLATFORM_DRIVERS is not set
# CONFIG_V4L_MEM2MEM_DRIVERS is not set
# CONFIG_DVB_PLATFORM_DRIVERS is not set
# CONFIG_SDR_PLATFORM_DRIVERS is not set

#
# MMC/SDIO DVB adapters
#
CONFIG_SMS_SDIO_DRV=y
CONFIG_V4L_TEST_DRIVERS=y
# CONFIG_VIDEO_VIMC is not set
# CONFIG_VIDEO_VIVID is not set
CONFIG_VIDEO_VIM2M=y
CONFIG_VIDEO_VICODEC=y
# CONFIG_DVB_TEST_DRIVERS is not set
# end of Media drivers

#
# Media ancillary drivers
#

#
# IR I2C driver auto-selected by 'Autoselect ancillary drivers'
#
CONFIG_VIDEO_IR_I2C=y

#
# Audio decoders, processors and mixers
#
# CONFIG_VIDEO_TVAUDIO is not set
# CONFIG_VIDEO_TDA7432 is not set
CONFIG_VIDEO_TDA9840=y
CONFIG_VIDEO_TEA6415C=y
CONFIG_VIDEO_TEA6420=y
CONFIG_VIDEO_MSP3400=y
CONFIG_VIDEO_CS3308=y
CONFIG_VIDEO_CS5345=y
CONFIG_VIDEO_CS53L32A=y
# CONFIG_VIDEO_TLV320AIC23B is not set
# CONFIG_VIDEO_UDA1342 is not set
# CONFIG_VIDEO_WM8775 is not set
CONFIG_VIDEO_WM8739=y
CONFIG_VIDEO_VP27SMPX=y
CONFIG_VIDEO_SONY_BTF_MPX=y
# end of Audio decoders, processors and mixers

#
# RDS decoders
#
# CONFIG_VIDEO_SAA6588 is not set
# end of RDS decoders

#
# Video decoders
#
CONFIG_VIDEO_ADV7180=y
# CONFIG_VIDEO_ADV7183 is not set
# CONFIG_VIDEO_ADV7604 is not set
CONFIG_VIDEO_ADV7842=y
# CONFIG_VIDEO_ADV7842_CEC is not set
CONFIG_VIDEO_BT819=y
CONFIG_VIDEO_BT856=y
CONFIG_VIDEO_BT866=y
# CONFIG_VIDEO_KS0127 is not set
# CONFIG_VIDEO_ML86V7667 is not set
CONFIG_VIDEO_SAA7110=y
# CONFIG_VIDEO_SAA711X is not set
CONFIG_VIDEO_TC358743=y
# CONFIG_VIDEO_TC358743_CEC is not set
# CONFIG_VIDEO_TVP514X is not set
# CONFIG_VIDEO_TVP5150 is not set
CONFIG_VIDEO_TVP7002=y
CONFIG_VIDEO_TW2804=y
CONFIG_VIDEO_TW9903=y
# CONFIG_VIDEO_TW9906 is not set
# CONFIG_VIDEO_TW9910 is not set
CONFIG_VIDEO_VPX3220=y

#
# Video and audio decoders
#
# CONFIG_VIDEO_SAA717X is not set
CONFIG_VIDEO_CX25840=y
# end of Video decoders

#
# Video encoders
#
CONFIG_VIDEO_SAA7127=y
CONFIG_VIDEO_SAA7185=y
CONFIG_VIDEO_ADV7170=y
CONFIG_VIDEO_ADV7175=y
CONFIG_VIDEO_ADV7343=y
CONFIG_VIDEO_ADV7393=y
CONFIG_VIDEO_ADV7511=y
CONFIG_VIDEO_ADV7511_CEC=y
# CONFIG_VIDEO_AD9389B is not set
CONFIG_VIDEO_AK881X=y
CONFIG_VIDEO_THS8200=y
# end of Video encoders

#
# Video improvement chips
#
CONFIG_VIDEO_UPD64031A=y
CONFIG_VIDEO_UPD64083=y
# end of Video improvement chips

#
# Audio/Video compression chips
#
CONFIG_VIDEO_SAA6752HS=y
# end of Audio/Video compression chips

#
# SDR tuner chips
#
CONFIG_SDR_MAX2175=y
# end of SDR tuner chips

#
# Miscellaneous helper chips
#
# CONFIG_VIDEO_THS7303 is not set
# CONFIG_VIDEO_M52790 is not set
CONFIG_VIDEO_I2C=y
CONFIG_VIDEO_ST_MIPID02=y
# end of Miscellaneous helper chips

#
# Camera sensor devices
#
CONFIG_VIDEO_APTINA_PLL=y
CONFIG_VIDEO_CCS_PLL=y
CONFIG_VIDEO_HI556=y
# CONFIG_VIDEO_HI846 is not set
CONFIG_VIDEO_IMX208=y
CONFIG_VIDEO_IMX214=y
# CONFIG_VIDEO_IMX219 is not set
CONFIG_VIDEO_IMX258=y
CONFIG_VIDEO_IMX274=y
# CONFIG_VIDEO_IMX290 is not set
# CONFIG_VIDEO_IMX319 is not set
CONFIG_VIDEO_IMX355=y
CONFIG_VIDEO_OV02A10=y
# CONFIG_VIDEO_OV2640 is not set
# CONFIG_VIDEO_OV2659 is not set
CONFIG_VIDEO_OV2680=y
CONFIG_VIDEO_OV2685=y
# CONFIG_VIDEO_OV2740 is not set
# CONFIG_VIDEO_OV5647 is not set
CONFIG_VIDEO_OV5648=y
# CONFIG_VIDEO_OV6650 is not set
CONFIG_VIDEO_OV5670=y
CONFIG_VIDEO_OV5675=y
CONFIG_VIDEO_OV5693=y
CONFIG_VIDEO_OV5695=y
CONFIG_VIDEO_OV7251=y
# CONFIG_VIDEO_OV772X is not set
# CONFIG_VIDEO_OV7640 is not set
CONFIG_VIDEO_OV7670=y
CONFIG_VIDEO_OV7740=y
# CONFIG_VIDEO_OV8856 is not set
CONFIG_VIDEO_OV8865=y
CONFIG_VIDEO_OV9640=y
# CONFIG_VIDEO_OV9650 is not set
# CONFIG_VIDEO_OV9734 is not set
CONFIG_VIDEO_OV13858=y
CONFIG_VIDEO_OV13B10=y
CONFIG_VIDEO_VS6624=y
# CONFIG_VIDEO_MT9M001 is not set
CONFIG_VIDEO_MT9M032=y
CONFIG_VIDEO_MT9M111=y
CONFIG_VIDEO_MT9P031=y
CONFIG_VIDEO_MT9T001=y
CONFIG_VIDEO_MT9T112=y
CONFIG_VIDEO_MT9V011=y
# CONFIG_VIDEO_MT9V032 is not set
CONFIG_VIDEO_MT9V111=y
CONFIG_VIDEO_SR030PC30=y
CONFIG_VIDEO_NOON010PC30=y
CONFIG_VIDEO_M5MOLS=y
# CONFIG_VIDEO_RDACM20 is not set
# CONFIG_VIDEO_RDACM21 is not set
CONFIG_VIDEO_RJ54N1=y
CONFIG_VIDEO_S5K6AA=y
CONFIG_VIDEO_S5K6A3=y
# CONFIG_VIDEO_S5K4ECGX is not set
CONFIG_VIDEO_S5K5BAF=y
CONFIG_VIDEO_CCS=y
# CONFIG_VIDEO_ET8EK8 is not set
CONFIG_VIDEO_S5C73M3=y
# end of Camera sensor devices

#
# Lens drivers
#
# CONFIG_VIDEO_AD5820 is not set
# CONFIG_VIDEO_AK7375 is not set
CONFIG_VIDEO_DW9714=y
CONFIG_VIDEO_DW9768=y
CONFIG_VIDEO_DW9807_VCM=y
# end of Lens drivers

#
# Flash devices
#
# CONFIG_VIDEO_ADP1653 is not set
CONFIG_VIDEO_LM3560=y
CONFIG_VIDEO_LM3646=y
# end of Flash devices

#
# SPI helper chips
#
CONFIG_VIDEO_GS1662=y
# end of SPI helper chips

#
# Media SPI Adapters
#
# CONFIG_CXD2880_SPI_DRV is not set
# end of Media SPI Adapters

CONFIG_MEDIA_TUNER=y

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_SIMPLE=y
CONFIG_MEDIA_TUNER_TDA18250=y
CONFIG_MEDIA_TUNER_TDA8290=y
CONFIG_MEDIA_TUNER_TDA827X=y
CONFIG_MEDIA_TUNER_TDA18271=y
CONFIG_MEDIA_TUNER_TDA9887=y
CONFIG_MEDIA_TUNER_TEA5761=y
CONFIG_MEDIA_TUNER_TEA5767=y
CONFIG_MEDIA_TUNER_MSI001=y
CONFIG_MEDIA_TUNER_MT20XX=y
# CONFIG_MEDIA_TUNER_MT2060 is not set
CONFIG_MEDIA_TUNER_MT2063=y
# CONFIG_MEDIA_TUNER_MT2266 is not set
# CONFIG_MEDIA_TUNER_MT2131 is not set
CONFIG_MEDIA_TUNER_QT1010=y
CONFIG_MEDIA_TUNER_XC2028=y
CONFIG_MEDIA_TUNER_XC5000=y
CONFIG_MEDIA_TUNER_XC4000=y
CONFIG_MEDIA_TUNER_MXL5005S=y
# CONFIG_MEDIA_TUNER_MXL5007T is not set
CONFIG_MEDIA_TUNER_MC44S803=y
CONFIG_MEDIA_TUNER_MAX2165=y
CONFIG_MEDIA_TUNER_TDA18218=y
CONFIG_MEDIA_TUNER_FC0011=y
CONFIG_MEDIA_TUNER_FC0012=y
CONFIG_MEDIA_TUNER_FC0013=y
CONFIG_MEDIA_TUNER_TDA18212=y
CONFIG_MEDIA_TUNER_E4000=y
CONFIG_MEDIA_TUNER_FC2580=y
CONFIG_MEDIA_TUNER_M88RS6000T=y
CONFIG_MEDIA_TUNER_TUA9001=y
CONFIG_MEDIA_TUNER_SI2157=y
# CONFIG_MEDIA_TUNER_IT913X is not set
# CONFIG_MEDIA_TUNER_R820T is not set
CONFIG_MEDIA_TUNER_MXL301RF=y
# CONFIG_MEDIA_TUNER_QM1D1C0042 is not set
# CONFIG_MEDIA_TUNER_QM1D1B0004 is not set
# end of Customize TV tuners

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
CONFIG_DVB_STB0899=y
# CONFIG_DVB_STB6100 is not set
CONFIG_DVB_STV090x=y
CONFIG_DVB_STV0910=y
CONFIG_DVB_STV6110x=y
# CONFIG_DVB_STV6111 is not set
CONFIG_DVB_MXL5XX=y
# CONFIG_DVB_M88DS3103 is not set

#
# Multistandard (cable + terrestrial) frontends
#
CONFIG_DVB_DRXK=y
CONFIG_DVB_TDA18271C2DD=y
CONFIG_DVB_SI2165=y
# CONFIG_DVB_MN88472 is not set
CONFIG_DVB_MN88473=y

#
# DVB-S (satellite) frontends
#
CONFIG_DVB_CX24110=y
CONFIG_DVB_CX24123=y
# CONFIG_DVB_MT312 is not set
# CONFIG_DVB_ZL10036 is not set
# CONFIG_DVB_ZL10039 is not set
CONFIG_DVB_S5H1420=y
# CONFIG_DVB_STV0288 is not set
CONFIG_DVB_STB6000=y
CONFIG_DVB_STV0299=y
CONFIG_DVB_STV6110=y
CONFIG_DVB_STV0900=y
# CONFIG_DVB_TDA8083 is not set
CONFIG_DVB_TDA10086=y
# CONFIG_DVB_TDA8261 is not set
CONFIG_DVB_VES1X93=y
CONFIG_DVB_TUNER_ITD1000=y
CONFIG_DVB_TUNER_CX24113=y
CONFIG_DVB_TDA826X=y
CONFIG_DVB_TUA6100=y
# CONFIG_DVB_CX24116 is not set
CONFIG_DVB_CX24117=y
# CONFIG_DVB_CX24120 is not set
CONFIG_DVB_SI21XX=y
CONFIG_DVB_TS2020=y
CONFIG_DVB_DS3000=y
# CONFIG_DVB_MB86A16 is not set
CONFIG_DVB_TDA10071=y

#
# DVB-T (terrestrial) frontends
#
CONFIG_DVB_SP887X=y
CONFIG_DVB_CX22700=y
CONFIG_DVB_CX22702=y
CONFIG_DVB_S5H1432=y
CONFIG_DVB_DRXD=y
CONFIG_DVB_L64781=y
CONFIG_DVB_TDA1004X=y
CONFIG_DVB_NXT6000=y
CONFIG_DVB_MT352=y
CONFIG_DVB_ZL10353=y
# CONFIG_DVB_DIB3000MB is not set
CONFIG_DVB_DIB3000MC=y
CONFIG_DVB_DIB7000M=y
CONFIG_DVB_DIB7000P=y
CONFIG_DVB_DIB9000=y
# CONFIG_DVB_TDA10048 is not set
CONFIG_DVB_AF9013=y
CONFIG_DVB_EC100=y
# CONFIG_DVB_STV0367 is not set
CONFIG_DVB_CXD2820R=y
CONFIG_DVB_CXD2841ER=y
# CONFIG_DVB_RTL2830 is not set
# CONFIG_DVB_RTL2832 is not set
CONFIG_DVB_SI2168=y
# CONFIG_DVB_ZD1301_DEMOD is not set
CONFIG_DVB_CXD2880=y

#
# DVB-C (cable) frontends
#
# CONFIG_DVB_VES1820 is not set
# CONFIG_DVB_TDA10021 is not set
CONFIG_DVB_TDA10023=y
# CONFIG_DVB_STV0297 is not set

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
# CONFIG_DVB_NXT200X is not set
CONFIG_DVB_OR51211=y
CONFIG_DVB_OR51132=y
CONFIG_DVB_BCM3510=y
CONFIG_DVB_LGDT330X=y
CONFIG_DVB_LGDT3305=y
# CONFIG_DVB_LGDT3306A is not set
CONFIG_DVB_LG2160=y
# CONFIG_DVB_S5H1409 is not set
CONFIG_DVB_AU8522=y
# CONFIG_DVB_AU8522_DTV is not set
CONFIG_DVB_AU8522_V4L=y
CONFIG_DVB_S5H1411=y
CONFIG_DVB_MXL692=y

#
# ISDB-T (terrestrial) frontends
#
CONFIG_DVB_S921=y
# CONFIG_DVB_DIB8000 is not set
CONFIG_DVB_MB86A20S=y

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
CONFIG_DVB_TC90522=y
CONFIG_DVB_MN88443X=y

#
# Digital terrestrial only tuners/PLL
#
# CONFIG_DVB_PLL is not set
CONFIG_DVB_TUNER_DIB0070=y
CONFIG_DVB_TUNER_DIB0090=y

#
# SEC control devices for DVB-S
#
CONFIG_DVB_DRX39XYJ=y
CONFIG_DVB_LNBH25=y
CONFIG_DVB_LNBH29=y
# CONFIG_DVB_LNBP21 is not set
# CONFIG_DVB_LNBP22 is not set
CONFIG_DVB_ISL6405=y
CONFIG_DVB_ISL6421=y
# CONFIG_DVB_ISL6423 is not set
CONFIG_DVB_A8293=y
# CONFIG_DVB_LGS8GL5 is not set
CONFIG_DVB_LGS8GXX=y
CONFIG_DVB_ATBM8830=y
CONFIG_DVB_TDA665x=y
CONFIG_DVB_IX2505V=y
CONFIG_DVB_M88RS2000=y
CONFIG_DVB_AF9033=y
CONFIG_DVB_HORUS3A=y
CONFIG_DVB_ASCOT2E=y
# CONFIG_DVB_HELENE is not set

#
# Common Interface (EN50221) controller drivers
#
# CONFIG_DVB_CXD2099 is not set
CONFIG_DVB_SP2=y
# end of Customise DVB Frontends

#
# Tools to develop new frontends
#
# CONFIG_DVB_DUMMY_FE is not set
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_IMX_IPUV3_CORE=y
CONFIG_DRM=y
CONFIG_DRM_MIPI_DBI=y
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_DP_AUX_CHARDEV=y
CONFIG_DRM_DEBUG_MM=y
# CONFIG_DRM_DEBUG_SELFTEST is not set
CONFIG_DRM_KMS_HELPER=y
# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_DP_CEC=y
CONFIG_DRM_GEM_CMA_HELPER=y
CONFIG_DRM_GEM_SHMEM_HELPER=y
CONFIG_DRM_SCHED=y

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=y
CONFIG_DRM_I2C_SIL164=y
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

CONFIG_DRM_KMB_DISPLAY=y
# CONFIG_DRM_VGEM is not set
CONFIG_DRM_VKMS=y
# CONFIG_DRM_VIRTIO_GPU is not set
CONFIG_DRM_MSM=y
CONFIG_DRM_MSM_GPU_STATE=y
CONFIG_DRM_MSM_GPU_SUDO=y
# CONFIG_DRM_MSM_HDMI_HDCP is not set
# CONFIG_DRM_MSM_DP is not set
CONFIG_DRM_MSM_DSI=y
# CONFIG_DRM_MSM_DSI_28NM_PHY is not set
CONFIG_DRM_MSM_DSI_20NM_PHY=y
CONFIG_DRM_MSM_DSI_28NM_8960_PHY=y
CONFIG_DRM_MSM_DSI_14NM_PHY=y
CONFIG_DRM_MSM_DSI_10NM_PHY=y
CONFIG_DRM_MSM_DSI_7NM_PHY=y
CONFIG_DRM_PANEL=y

#
# Display Panels
#
CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN=y
# CONFIG_DRM_PANEL_WIDECHIPS_WS2401 is not set
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
# end of Display Interface Bridges

CONFIG_DRM_IMX=y
# CONFIG_DRM_IMX_PARALLEL_DISPLAY is not set
CONFIG_DRM_IMX_TVE=y
CONFIG_DRM_IMX_LDB=y
CONFIG_DRM_V3D=y
CONFIG_DRM_ETNAVIV=y
# CONFIG_DRM_ETNAVIV_THERMAL is not set
CONFIG_DRM_SIMPLEDRM=y
# CONFIG_TINYDRM_HX8357D is not set
# CONFIG_TINYDRM_ILI9163 is not set
CONFIG_TINYDRM_ILI9225=y
CONFIG_TINYDRM_ILI9341=y
CONFIG_TINYDRM_ILI9486=y
CONFIG_TINYDRM_MI0283QT=y
# CONFIG_TINYDRM_REPAPER is not set
CONFIG_TINYDRM_ST7586=y
CONFIG_TINYDRM_ST7735R=y
# CONFIG_DRM_PL111 is not set
CONFIG_DRM_PANFROST=y
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_NOMODESET=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_CFB_REV_PIXELS_IN_BYTE=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
CONFIG_FB_FOREIGN_ENDIAN=y
# CONFIG_FB_BOTH_ENDIAN is not set
CONFIG_FB_BIG_ENDIAN=y
# CONFIG_FB_LITTLE_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_MACMODES=y
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
CONFIG_FB_CLPS711X=y
CONFIG_FB_IMX=y
# CONFIG_FB_ARC is not set
CONFIG_FB_CONTROL=y
# CONFIG_FB_GBE is not set
CONFIG_FB_PVR2=y
CONFIG_FB_OPENCORES=y
CONFIG_FB_S1D13XXX=y
CONFIG_FB_WM8505=y
# CONFIG_FB_WMT_GE_ROPS is not set
# CONFIG_FB_PXA168 is not set
# CONFIG_FB_W100 is not set
CONFIG_FB_SH_MOBILE_LCDC=y
# CONFIG_FB_TMIO is not set
# CONFIG_FB_S3C is not set
CONFIG_FB_IBM_GXT4500=y
CONFIG_FB_GOLDFISH=y
CONFIG_FB_DA8XX=y
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
CONFIG_FB_BROADSHEET=y
# CONFIG_FB_SSD1307 is not set
# CONFIG_MMP_DISP is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=y
CONFIG_LCD_L4F00242T03=y
CONFIG_LCD_LMS283GF05=y
# CONFIG_LCD_LTV350QV is not set
CONFIG_LCD_ILI922X=y
CONFIG_LCD_ILI9320=y
CONFIG_LCD_TDO24M=y
# CONFIG_LCD_VGG2432A4 is not set
CONFIG_LCD_PLATFORM=y
CONFIG_LCD_AMS369FG06=y
CONFIG_LCD_LMS501KF03=y
CONFIG_LCD_HX8357=y
CONFIG_LCD_OTM3225A=y
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_KTD253 is not set
CONFIG_BACKLIGHT_LM3533=y
# CONFIG_BACKLIGHT_PWM is not set
CONFIG_BACKLIGHT_DA903X=y
CONFIG_BACKLIGHT_DA9052=y
CONFIG_BACKLIGHT_QCOM_WLED=y
CONFIG_BACKLIGHT_RT4831=y
# CONFIG_BACKLIGHT_WM831X is not set
CONFIG_BACKLIGHT_ADP5520=y
# CONFIG_BACKLIGHT_ADP8860 is not set
CONFIG_BACKLIGHT_ADP8870=y
CONFIG_BACKLIGHT_88PM860X=y
CONFIG_BACKLIGHT_PCF50633=y
CONFIG_BACKLIGHT_AAT2870=y
CONFIG_BACKLIGHT_LM3630A=y
CONFIG_BACKLIGHT_LM3639=y
CONFIG_BACKLIGHT_LP855X=y
# CONFIG_BACKLIGHT_PANDORA is not set
# CONFIG_BACKLIGHT_AS3711 is not set
# CONFIG_BACKLIGHT_GPIO is not set
CONFIG_BACKLIGHT_LV5207LP=y
CONFIG_BACKLIGHT_BD6107=y
# CONFIG_BACKLIGHT_ARCXCNN is not set
# end of Backlight & LCD device support

CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y

#
# Console display driver support
#
# CONFIG_VGA_CONSOLE is not set
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

CONFIG_SOUND=y
CONFIG_SOUND_OSS_CORE=y
# CONFIG_SOUND_OSS_CORE_PRECLAIM is not set
CONFIG_SND=y
CONFIG_SND_TIMER=y
CONFIG_SND_PCM=y
CONFIG_SND_SEQ_DEVICE=y
CONFIG_SND_RAWMIDI=y
CONFIG_SND_OSSEMUL=y
# CONFIG_SND_MIXER_OSS is not set
CONFIG_SND_PCM_OSS=y
CONFIG_SND_PCM_OSS_PLUGINS=y
# CONFIG_SND_PCM_TIMER is not set
CONFIG_SND_HRTIMER=y
# CONFIG_SND_DYNAMIC_MINORS is not set
# CONFIG_SND_SUPPORT_OLD_API is not set
# CONFIG_SND_PROC_FS is not set
# CONFIG_SND_VERBOSE_PRINTK is not set
# CONFIG_SND_DEBUG is not set
CONFIG_SND_SEQUENCER=y
CONFIG_SND_SEQ_DUMMY=y
CONFIG_SND_SEQUENCER_OSS=y
CONFIG_SND_SEQ_HRTIMER_DEFAULT=y
CONFIG_SND_SEQ_MIDI_EVENT=y
CONFIG_SND_SEQ_MIDI=y
CONFIG_SND_SEQ_VIRMIDI=y
CONFIG_SND_MPU401_UART=y
CONFIG_SND_DRIVERS=y
# CONFIG_SND_DUMMY is not set
CONFIG_SND_ALOOP=y
CONFIG_SND_VIRMIDI=y
CONFIG_SND_MTPAV=y
CONFIG_SND_MTS64=y
CONFIG_SND_SERIAL_U16550=y
CONFIG_SND_MPU401=y
CONFIG_SND_PORTMAN2X4=y

#
# HD-Audio
#
# end of HD-Audio

CONFIG_SND_HDA_PREALLOC_SIZE=64
CONFIG_SND_SPI=y
CONFIG_SND_AT73C213=y
CONFIG_SND_AT73C213_TARGET_BITRATE=48000
# CONFIG_SND_MIPS is not set
# CONFIG_SND_SOC is not set
# CONFIG_SND_VIRTIO is not set

#
# HID support
#
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
# CONFIG_HIDRAW is not set
# CONFIG_UHID is not set
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=y
# CONFIG_HID_ACRUX is not set
# CONFIG_HID_APPLE is not set
CONFIG_HID_AUREAL=y
CONFIG_HID_BELKIN=y
CONFIG_HID_CHERRY=y
CONFIG_HID_COUGAR=y
CONFIG_HID_MACALLY=y
# CONFIG_HID_CMEDIA is not set
CONFIG_HID_CYPRESS=y
CONFIG_HID_DRAGONRISE=y
CONFIG_DRAGONRISE_FF=y
# CONFIG_HID_EMS_FF is not set
CONFIG_HID_ELECOM=y
CONFIG_HID_EZKEY=y
CONFIG_HID_GEMBIRD=y
CONFIG_HID_GFRM=y
# CONFIG_HID_GLORIOUS is not set
CONFIG_HID_VIVALDI=y
# CONFIG_HID_KEYTOUCH is not set
CONFIG_HID_KYE=y
CONFIG_HID_WALTOP=y
# CONFIG_HID_VIEWSONIC is not set
# CONFIG_HID_XIAOMI is not set
# CONFIG_HID_GYRATION is not set
# CONFIG_HID_ICADE is not set
CONFIG_HID_ITE=y
CONFIG_HID_JABRA=y
# CONFIG_HID_TWINHAN is not set
CONFIG_HID_KENSINGTON=y
CONFIG_HID_LCPOWER=y
CONFIG_HID_LED=y
# CONFIG_HID_LENOVO is not set
# CONFIG_HID_MAGICMOUSE is not set
# CONFIG_HID_MALTRON is not set
CONFIG_HID_MAYFLASH=y
CONFIG_HID_REDRAGON=y
CONFIG_HID_MICROSOFT=y
# CONFIG_HID_MONTEREY is not set
# CONFIG_HID_MULTITOUCH is not set
CONFIG_HID_NINTENDO=y
CONFIG_NINTENDO_FF=y
CONFIG_HID_NTI=y
# CONFIG_HID_ORTEK is not set
CONFIG_HID_PANTHERLORD=y
CONFIG_PANTHERLORD_FF=y
CONFIG_HID_PETALYNX=y
CONFIG_HID_PICOLCD=y
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
# CONFIG_HID_PICOLCD_LEDS is not set
# CONFIG_HID_PICOLCD_CIR is not set
CONFIG_HID_PLANTRONICS=y
# CONFIG_HID_PRIMAX is not set
# CONFIG_HID_SAITEK is not set
CONFIG_HID_SEMITEK=y
# CONFIG_HID_SPEEDLINK is not set
CONFIG_HID_STEAM=y
CONFIG_HID_STEELSERIES=y
# CONFIG_HID_SUNPLUS is not set
CONFIG_HID_RMI=y
CONFIG_HID_GREENASIA=y
CONFIG_GREENASIA_FF=y
CONFIG_HID_SMARTJOYPLUS=y
CONFIG_SMARTJOYPLUS_FF=y
CONFIG_HID_TIVO=y
# CONFIG_HID_TOPSEED is not set
CONFIG_HID_THINGM=y
CONFIG_HID_UDRAW_PS3=y
CONFIG_HID_WIIMOTE=y
CONFIG_HID_XINMO=y
CONFIG_HID_ZEROPLUS=y
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=y
# CONFIG_HID_SENSOR_HUB is not set
# CONFIG_HID_ALPS is not set
# end of Special HID drivers

#
# I2C HID support
#
# end of I2C HID support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
# CONFIG_USB_SUPPORT is not set
CONFIG_MMC=y
# CONFIG_SDIO_UART is not set
CONFIG_MMC_TEST=y

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=y
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_PLTFM=y
CONFIG_MMC_SDHCI_OF_ESDHC=y
CONFIG_MMC_SDHCI_OF_SPARX5=y
# CONFIG_MMC_SDHCI_CNS3XXX is not set
CONFIG_MMC_SDHCI_DOVE=y
# CONFIG_MMC_SDHCI_TEGRA is not set
CONFIG_MMC_SDHCI_S3C=y
CONFIG_MMC_SDHCI_PXAV3=y
CONFIG_MMC_SDHCI_PXAV2=y
# CONFIG_MMC_SDHCI_S3C_DMA is not set
CONFIG_MMC_SDHCI_BCM_KONA=y
CONFIG_MMC_MESON_GX=y
CONFIG_MMC_MOXART=y
# CONFIG_MMC_SDHCI_ST is not set
CONFIG_MMC_OMAP_HS=y
# CONFIG_MMC_SDHCI_MSM is not set
CONFIG_MMC_DAVINCI=y
CONFIG_MMC_SPI=y
CONFIG_MMC_S3C=y
# CONFIG_MMC_S3C_HW_SDIO_IRQ is not set
CONFIG_MMC_S3C_PIO=y
# CONFIG_MMC_S3C_DMA is not set
CONFIG_MMC_SDHCI_SPRD=y
CONFIG_MMC_TMIO_CORE=y
CONFIG_MMC_TMIO=y
# CONFIG_MMC_SDHI is not set
CONFIG_MMC_DW=y
CONFIG_MMC_DW_PLTFM=y
CONFIG_MMC_DW_BLUEFIELD=y
CONFIG_MMC_DW_EXYNOS=y
CONFIG_MMC_DW_HI3798CV200=y
CONFIG_MMC_DW_K3=y
# CONFIG_MMC_SH_MMCIF is not set
CONFIG_MMC_JZ4740=y
CONFIG_MMC_USDHI6ROL0=y
CONFIG_MMC_SUNXI=y
CONFIG_MMC_CQHCI=y
CONFIG_MMC_HSQ=y
CONFIG_MMC_BCM2835=y
CONFIG_MMC_MTK=y
CONFIG_MMC_SDHCI_XENON=y
CONFIG_MMC_OWL=y
CONFIG_MEMSTICK=y
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set

#
# MemoryStick Host Controller Drivers
#
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
CONFIG_LEDS_88PM860X=y
CONFIG_LEDS_ARIEL=y
CONFIG_LEDS_LM3530=y
# CONFIG_LEDS_LM3532 is not set
CONFIG_LEDS_LM3533=y
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_S3C24XX is not set
CONFIG_LEDS_COBALT_QUBE=y
CONFIG_LEDS_COBALT_RAQ=y
CONFIG_LEDS_PCA9532=y
CONFIG_LEDS_PCA9532_GPIO=y
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_LP3944=y
CONFIG_LEDS_LP3952=y
CONFIG_LEDS_LP50XX=y
CONFIG_LEDS_PCA955X=y
CONFIG_LEDS_PCA955X_GPIO=y
CONFIG_LEDS_PCA963X=y
# CONFIG_LEDS_WM831X_STATUS is not set
CONFIG_LEDS_DA903X=y
# CONFIG_LEDS_DA9052 is not set
CONFIG_LEDS_DAC124S085=y
CONFIG_LEDS_PWM=y
CONFIG_LEDS_REGULATOR=y
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_LT3593=y
# CONFIG_LEDS_ADP5520 is not set
CONFIG_LEDS_MC13783=y
CONFIG_LEDS_NS2=y
CONFIG_LEDS_ASIC3=y
CONFIG_LEDS_TCA6507=y
# CONFIG_LEDS_TLC591XX is not set
CONFIG_LEDS_LM355x=y
# CONFIG_LEDS_OT200 is not set
# CONFIG_LEDS_MENF21BMC is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=y
CONFIG_LEDS_MLXREG=y
CONFIG_LEDS_USER=y
CONFIG_LEDS_TI_LMU_COMMON=y
# CONFIG_LEDS_IP30 is not set
CONFIG_LEDS_ACER_A500=y

#
# Flash and Torch LED drivers
#
CONFIG_LEDS_AS3645A=y
CONFIG_LEDS_LM3601X=y
CONFIG_LEDS_RT8515=y
# CONFIG_LEDS_SGM3140 is not set

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=y
CONFIG_LEDS_TRIGGER_ONESHOT=y
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
CONFIG_LEDS_TRIGGER_BACKLIGHT=y
CONFIG_LEDS_TRIGGER_CPU=y
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
# CONFIG_LEDS_TRIGGER_GPIO is not set
# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
# CONFIG_LEDS_TRIGGER_CAMERA is not set
CONFIG_LEDS_TRIGGER_PANIC=y
CONFIG_LEDS_TRIGGER_PATTERN=y
CONFIG_LEDS_TRIGGER_AUDIO=y
CONFIG_LEDS_TRIGGER_TTY=y

#
# Simple LED drivers
#
CONFIG_ACCESSIBILITY=y
# CONFIG_A11Y_BRAILLE_CONSOLE is not set

#
# Speakup console speech
#
CONFIG_SPEAKUP=y
CONFIG_SPEAKUP_SERIALIO=y
CONFIG_SPEAKUP_SYNTH_ACNTSA=y
CONFIG_SPEAKUP_SYNTH_ACNTPC=y
CONFIG_SPEAKUP_SYNTH_APOLLO=y
CONFIG_SPEAKUP_SYNTH_AUDPTR=y
CONFIG_SPEAKUP_SYNTH_BNS=y
# CONFIG_SPEAKUP_SYNTH_DECTLK is not set
# CONFIG_SPEAKUP_SYNTH_DECEXT is not set
CONFIG_SPEAKUP_SYNTH_DTLK=y
CONFIG_SPEAKUP_SYNTH_KEYPC=y
# CONFIG_SPEAKUP_SYNTH_LTLK is not set
CONFIG_SPEAKUP_SYNTH_SOFT=y
CONFIG_SPEAKUP_SYNTH_SPKOUT=y
CONFIG_SPEAKUP_SYNTH_TXPRT=y
# CONFIG_SPEAKUP_SYNTH_DUMMY is not set
# end of Speakup console speech

CONFIG_RTC_LIB=y
# CONFIG_RTC_CLASS is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
CONFIG_UDMABUF=y
CONFIG_DMABUF_MOVE_NOTIFY=y
# CONFIG_DMABUF_DEBUG is not set
CONFIG_DMABUF_SELFTESTS=y
CONFIG_DMABUF_HEAPS=y
CONFIG_DMABUF_SYSFS_STATS=y
# CONFIG_DMABUF_HEAPS_SYSTEM is not set
# CONFIG_DMABUF_HEAPS_CMA is not set
# end of DMABUF options

CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_LINEDISP=y
CONFIG_HD44780_COMMON=y
# CONFIG_HD44780 is not set
CONFIG_IMG_ASCII_LCD=y
CONFIG_HT16K33=y
CONFIG_LCD2S=y
CONFIG_PARPORT_PANEL=y
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
CONFIG_PANEL_CHANGE_MESSAGE=y
CONFIG_PANEL_BOOT_MESSAGE=""
# CONFIG_CHARLCD_BL_OFF is not set
CONFIG_CHARLCD_BL_ON=y
# CONFIG_CHARLCD_BL_FLASH is not set
CONFIG_PANEL=y
# CONFIG_UIO is not set
CONFIG_VFIO=y
CONFIG_VFIO_VIRQFD=y
# CONFIG_VFIO_NOIOMMU is not set
CONFIG_VFIO_PLATFORM=y
CONFIG_VFIO_AMBA=y
CONFIG_VFIO_PLATFORM_CALXEDAXGMAC_RESET=y
# CONFIG_VFIO_PLATFORM_AMDXGBE_RESET is not set
CONFIG_VFIO_PLATFORM_BCMFLEXRM_RESET=y
# CONFIG_VFIO_MDEV is not set
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_INPUT=y
CONFIG_VIRTIO_MMIO=y
# CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
CONFIG_VHOST_MENU=y
CONFIG_VHOST_CROSS_ENDIAN_LEGACY=y

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
CONFIG_COMEDI=y
CONFIG_COMEDI_DEBUG=y
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
CONFIG_COMEDI_MISC_DRIVERS=y
# CONFIG_COMEDI_BOND is not set
CONFIG_COMEDI_TEST=y
CONFIG_COMEDI_PARPORT=y
CONFIG_COMEDI_SSV_DNP=y
# CONFIG_COMEDI_ISA_DRIVERS is not set
# CONFIG_COMEDI_8255_SA is not set
CONFIG_COMEDI_KCOMEDILIB=y
CONFIG_COMEDI_NI_ROUTING=y
CONFIG_COMEDI_TESTS=y
# CONFIG_COMEDI_TESTS_EXAMPLE is not set
CONFIG_COMEDI_TESTS_NI_ROUTES=y
CONFIG_STAGING=y

#
# IIO staging drivers
#

#
# Accelerometers
#
# CONFIG_ADIS16203 is not set
CONFIG_ADIS16240=y
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD7816=y
# CONFIG_AD7280 is not set
# end of Analog to digital converters

#
# Analog digital bi-direction converters
#
CONFIG_ADT7316=y
# CONFIG_ADT7316_SPI is not set
# CONFIG_ADT7316_I2C is not set
# end of Analog digital bi-direction converters

#
# Capacitance to digital converters
#
# CONFIG_AD7746 is not set
# end of Capacitance to digital converters

#
# Direct Digital Synthesis
#
CONFIG_AD9832=y
CONFIG_AD9834=y
# end of Direct Digital Synthesis

#
# Network Analyzer, Impedance Converters
#
CONFIG_AD5933=y
# end of Network Analyzer, Impedance Converters

#
# Active energy metering IC
#
CONFIG_ADE7854=y
CONFIG_ADE7854_I2C=y
CONFIG_ADE7854_SPI=y
# end of Active energy metering IC

#
# Resolver to digital converters
#
CONFIG_AD2S1210=y
# end of Resolver to digital converters
# end of IIO staging drivers

CONFIG_STAGING_MEDIA=y
# CONFIG_VIDEO_HANTRO is not set
CONFIG_VIDEO_IMX_MEDIA=y

#
# i.MX5/6/7/8 Media Sub devices
#
# CONFIG_VIDEO_IMX_CSI is not set
CONFIG_VIDEO_IMX7_CSI=y
# end of i.MX5/6/7/8 Media Sub devices

CONFIG_VIDEO_MESON_VDEC=y
# CONFIG_VIDEO_OMAP4 is not set
CONFIG_VIDEO_ROCKCHIP_VDEC=y
CONFIG_VIDEO_SUNXI=y
# CONFIG_TEGRA_VDE is not set

#
# Android
#
# end of Android

# CONFIG_GS_FPGABOOT is not set
# CONFIG_UNISYSSPAR is not set
# CONFIG_FB_TFT is not set
# CONFIG_MOST_COMPONENTS is not set
CONFIG_PI433=y
CONFIG_FIELDBUS_DEV=y
CONFIG_MIPS_PLATFORM_DEVICES=y
CONFIG_RS780E_ACPI=y
CONFIG_LS2K_RESET=y
CONFIG_GOLDFISH=y
CONFIG_GOLDFISH_PIPE=y
CONFIG_CHROME_PLATFORMS=y
CONFIG_CROS_EC=y
CONFIG_CROS_EC_I2C=y
# CONFIG_CROS_EC_SPI is not set
CONFIG_CROS_EC_PROTO=y
CONFIG_MELLANOX_PLATFORM=y
CONFIG_OLPC_EC=y
CONFIG_OLPC_XO175=y
CONFIG_OLPC_XO175_EC=y
CONFIG_SURFACE_PLATFORMS=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
CONFIG_COMMON_CLK_WM831X=y

#
# Clock driver for ARM Reference designs
#
CONFIG_CLK_ICST=y
# CONFIG_CLK_SP810 is not set
# end of Clock driver for ARM Reference designs

# CONFIG_CLK_HSDK is not set
CONFIG_LMK04832=y
CONFIG_COMMON_CLK_MAX77686=y
CONFIG_COMMON_CLK_MAX9485=y
# CONFIG_COMMON_CLK_HI655X is not set
# CONFIG_COMMON_CLK_SCMI is not set
CONFIG_COMMON_CLK_SCPI=y
CONFIG_COMMON_CLK_SI5341=y
CONFIG_COMMON_CLK_SI5351=y
# CONFIG_COMMON_CLK_SI544 is not set
# CONFIG_COMMON_CLK_BM1880 is not set
CONFIG_COMMON_CLK_CDCE706=y
# CONFIG_COMMON_CLK_TPS68470 is not set
CONFIG_COMMON_CLK_CS2000_CP=y
CONFIG_COMMON_CLK_FSL_FLEXSPI=y
CONFIG_COMMON_CLK_FSL_SAI=y
# CONFIG_COMMON_CLK_GEMINI is not set
# CONFIG_COMMON_CLK_LAN966X is not set
# CONFIG_COMMON_CLK_ASPEED is not set
CONFIG_COMMON_CLK_S2MPS11=y
CONFIG_CLK_TWL6040=y
# CONFIG_CLK_LS1028A_PLLDIG is not set
CONFIG_COMMON_CLK_XGENE=y
CONFIG_COMMON_CLK_PALMAS=y
CONFIG_COMMON_CLK_PWM=y
CONFIG_COMMON_CLK_OXNAS=y
CONFIG_COMMON_CLK_MMP2_AUDIO=y
# CONFIG_CLK_ACTIONS is not set
CONFIG_CLK_BAIKAL_T1=y
# CONFIG_CLK_BT1_CCU_PLL is not set
CONFIG_CLK_BT1_CCU_DIV=y
# CONFIG_CLK_BCM2711_DVP is not set
# CONFIG_CLK_BCM2835 is not set
# CONFIG_CLK_BCM_63XX is not set
CONFIG_CLK_BCM_63XX_GATE=y
# CONFIG_CLK_BCM_KONA is not set
CONFIG_COMMON_CLK_IPROC=y
# CONFIG_CLK_BCM_CYGNUS is not set
# CONFIG_CLK_BCM_HR2 is not set
CONFIG_CLK_BCM_NSP=y
# CONFIG_CLK_BCM_NS2 is not set
# CONFIG_CLK_BCM_SR is not set
# CONFIG_CLK_RASPBERRYPI is not set
CONFIG_COMMON_CLK_HI3516CV300=y
# CONFIG_COMMON_CLK_HI3519 is not set
# CONFIG_COMMON_CLK_HI3559A is not set
# CONFIG_COMMON_CLK_HI3660 is not set
CONFIG_COMMON_CLK_HI3670=y
# CONFIG_COMMON_CLK_HI3798CV200 is not set
# CONFIG_COMMON_CLK_HI6220 is not set
CONFIG_RESET_HISI=y
# CONFIG_STUB_CLK_HI6220 is not set
CONFIG_STUB_CLK_HI3660=y
# CONFIG_COMMON_CLK_BOSTON is not set
CONFIG_MXC_CLK=y
# CONFIG_CLK_IMX8MM is not set
# CONFIG_CLK_IMX8MN is not set
CONFIG_CLK_IMX8MP=y
CONFIG_CLK_IMX8MQ=y
# CONFIG_CLK_IMX8ULP is not set

#
# Ingenic SoCs drivers
#
CONFIG_INGENIC_CGU_COMMON=y
CONFIG_INGENIC_CGU_JZ4740=y
CONFIG_INGENIC_CGU_JZ4725B=y
# CONFIG_INGENIC_CGU_JZ4760 is not set
# CONFIG_INGENIC_CGU_JZ4770 is not set
CONFIG_INGENIC_CGU_JZ4780=y
CONFIG_INGENIC_CGU_X1000=y
CONFIG_INGENIC_CGU_X1830=y
CONFIG_INGENIC_TCU_CLK=y
# end of Ingenic SoCs drivers

CONFIG_TI_SYSCON_CLK=y

#
# Clock driver for MediaTek SoC
#
CONFIG_COMMON_CLK_MEDIATEK=y
CONFIG_COMMON_CLK_MT2701=y
# CONFIG_COMMON_CLK_MT2701_MMSYS is not set
# CONFIG_COMMON_CLK_MT2701_IMGSYS is not set
# CONFIG_COMMON_CLK_MT2701_VDECSYS is not set
# CONFIG_COMMON_CLK_MT2701_HIFSYS is not set
# CONFIG_COMMON_CLK_MT2701_ETHSYS is not set
# CONFIG_COMMON_CLK_MT2701_BDPSYS is not set
CONFIG_COMMON_CLK_MT2701_AUDSYS=y
# CONFIG_COMMON_CLK_MT2701_G3DSYS is not set
CONFIG_COMMON_CLK_MT2712=y
CONFIG_COMMON_CLK_MT2712_BDPSYS=y
CONFIG_COMMON_CLK_MT2712_IMGSYS=y
# CONFIG_COMMON_CLK_MT2712_JPGDECSYS is not set
# CONFIG_COMMON_CLK_MT2712_MFGCFG is not set
# CONFIG_COMMON_CLK_MT2712_MMSYS is not set
CONFIG_COMMON_CLK_MT2712_VDECSYS=y
# CONFIG_COMMON_CLK_MT2712_VENCSYS is not set
CONFIG_COMMON_CLK_MT6765=y
# CONFIG_COMMON_CLK_MT6765_AUDIOSYS is not set
# CONFIG_COMMON_CLK_MT6765_CAMSYS is not set
CONFIG_COMMON_CLK_MT6765_GCESYS=y
CONFIG_COMMON_CLK_MT6765_MMSYS=y
CONFIG_COMMON_CLK_MT6765_IMGSYS=y
CONFIG_COMMON_CLK_MT6765_VCODECSYS=y
# CONFIG_COMMON_CLK_MT6765_MFGSYS is not set
# CONFIG_COMMON_CLK_MT6765_MIPI0ASYS is not set
# CONFIG_COMMON_CLK_MT6765_MIPI0BSYS is not set
CONFIG_COMMON_CLK_MT6765_MIPI1ASYS=y
CONFIG_COMMON_CLK_MT6765_MIPI1BSYS=y
# CONFIG_COMMON_CLK_MT6765_MIPI2ASYS is not set
CONFIG_COMMON_CLK_MT6765_MIPI2BSYS=y
# CONFIG_COMMON_CLK_MT6779 is not set
CONFIG_COMMON_CLK_MT6797=y
CONFIG_COMMON_CLK_MT6797_MMSYS=y
# CONFIG_COMMON_CLK_MT6797_IMGSYS is not set
# CONFIG_COMMON_CLK_MT6797_VDECSYS is not set
CONFIG_COMMON_CLK_MT6797_VENCSYS=y
# CONFIG_COMMON_CLK_MT7622 is not set
CONFIG_COMMON_CLK_MT7629=y
CONFIG_COMMON_CLK_MT7629_ETHSYS=y
CONFIG_COMMON_CLK_MT7629_HIFSYS=y
CONFIG_COMMON_CLK_MT7986=y
# CONFIG_COMMON_CLK_MT7986_ETHSYS is not set
# CONFIG_COMMON_CLK_MT8135 is not set
# CONFIG_COMMON_CLK_MT8167 is not set
CONFIG_COMMON_CLK_MT8173=y
# CONFIG_COMMON_CLK_MT8173_MMSYS is not set
# CONFIG_COMMON_CLK_MT8183 is not set
CONFIG_COMMON_CLK_MT8192=y
CONFIG_COMMON_CLK_MT8192_AUDSYS=y
# CONFIG_COMMON_CLK_MT8192_CAMSYS is not set
CONFIG_COMMON_CLK_MT8192_IMGSYS=y
CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP=y
CONFIG_COMMON_CLK_MT8192_IPESYS=y
# CONFIG_COMMON_CLK_MT8192_MDPSYS is not set
CONFIG_COMMON_CLK_MT8192_MFGCFG=y
# CONFIG_COMMON_CLK_MT8192_MMSYS is not set
# CONFIG_COMMON_CLK_MT8192_MSDC is not set
# CONFIG_COMMON_CLK_MT8192_SCP_ADSP is not set
# CONFIG_COMMON_CLK_MT8192_VDECSYS is not set
# CONFIG_COMMON_CLK_MT8192_VENCSYS is not set
CONFIG_COMMON_CLK_MT8195=y
# CONFIG_COMMON_CLK_MT8516 is not set
# end of Clock driver for MediaTek SoC

#
# Clock support for Amlogic platforms
#
# end of Clock support for Amlogic platforms

# CONFIG_MSTAR_MSC313_MPLL is not set
# CONFIG_COMMON_CLK_PISTACHIO is not set
CONFIG_CLK_MT7621=y
# CONFIG_CLK_RENESAS is not set
CONFIG_COMMON_CLK_SAMSUNG=y
CONFIG_S3C64XX_COMMON_CLK=y
# CONFIG_S5PV210_COMMON_CLK is not set
CONFIG_EXYNOS_3250_COMMON_CLK=y
CONFIG_EXYNOS_4_COMMON_CLK=y
CONFIG_EXYNOS_5250_COMMON_CLK=y
CONFIG_EXYNOS_5260_COMMON_CLK=y
CONFIG_EXYNOS_5410_COMMON_CLK=y
# CONFIG_EXYNOS_5420_COMMON_CLK is not set
CONFIG_EXYNOS_ARM64_COMMON_CLK=y
CONFIG_EXYNOS_AUDSS_CLK_CON=y
# CONFIG_EXYNOS_CLKOUT is not set
# CONFIG_S3C2410_COMMON_CLK is not set
CONFIG_S3C2412_COMMON_CLK=y
CONFIG_S3C2443_COMMON_CLK=y
# CONFIG_CLK_SIFIVE is not set
# CONFIG_CLK_INTEL_SOCFPGA is not set
CONFIG_SPRD_COMMON_CLK=y
CONFIG_SPRD_SC9860_CLK=y
# CONFIG_SPRD_SC9863A_CLK is not set
# CONFIG_CLK_STARFIVE_JH7100 is not set
# CONFIG_CLK_SUNXI is not set
CONFIG_SUNXI_CCU=y
# CONFIG_SUNIV_F1C100S_CCU is not set
CONFIG_SUN20I_D1_CCU=y
CONFIG_SUN20I_D1_R_CCU=y
CONFIG_SUN50I_A64_CCU=y
CONFIG_SUN50I_A100_CCU=y
CONFIG_SUN50I_A100_R_CCU=y
# CONFIG_SUN50I_H6_CCU is not set
CONFIG_SUN50I_H616_CCU=y
# CONFIG_SUN50I_H6_R_CCU is not set
CONFIG_SUN4I_A10_CCU=y
# CONFIG_SUN5I_CCU is not set
# CONFIG_SUN6I_A31_CCU is not set
# CONFIG_SUN8I_A23_CCU is not set
CONFIG_SUN8I_A33_CCU=y
# CONFIG_SUN8I_A83T_CCU is not set
# CONFIG_SUN8I_H3_CCU is not set
# CONFIG_SUN8I_V3S_CCU is not set
# CONFIG_SUN8I_DE2_CCU is not set
CONFIG_SUN8I_R40_CCU=y
# CONFIG_SUN9I_A80_CCU is not set
CONFIG_SUN8I_R_CCU=y
# CONFIG_COMMON_CLK_TI_ADPLL is not set
CONFIG_COMMON_CLK_VISCONTI=y
# CONFIG_XILINX_VCU is not set
CONFIG_COMMON_CLK_ZYNQMP=y
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_TIMER_OF=y
CONFIG_TIMER_PROBE=y
CONFIG_CLKSRC_MMIO=y
# CONFIG_BCM2835_TIMER is not set
CONFIG_BCM_KONA_TIMER=y
# CONFIG_DAVINCI_TIMER is not set
# CONFIG_DIGICOLOR_TIMER is not set
# CONFIG_DW_APB_TIMER is not set
CONFIG_FTTMR010_TIMER=y
# CONFIG_IXP4XX_TIMER is not set
CONFIG_MESON6_TIMER=y
# CONFIG_OWL_TIMER is not set
CONFIG_RDA_TIMER=y
CONFIG_SUN4I_TIMER=y
CONFIG_SUN5I_HSTIMER=y
CONFIG_TEGRA_TIMER=y
# CONFIG_VT8500_TIMER is not set
CONFIG_NPCM7XX_TIMER=y
# CONFIG_CADENCE_TTC_TIMER is not set
# CONFIG_ASM9260_TIMER is not set
CONFIG_CLKSRC_DBX500_PRCMU=y
CONFIG_CLPS711X_TIMER=y
# CONFIG_MXS_TIMER is not set
# CONFIG_NSPIRE_TIMER is not set
CONFIG_INTEGRATOR_AP_TIMER=y
CONFIG_CLKSRC_PISTACHIO=y
# CONFIG_CLKSRC_TI_32K is not set
CONFIG_CLKSRC_STM32_LP=y
# CONFIG_CLKSRC_MPS2 is not set
CONFIG_ARC_TIMERS=y
# CONFIG_ARC_TIMERS_64BIT is not set
# CONFIG_ARM_TIMER_SP804 is not set
CONFIG_ARMV7M_SYSTICK=y
CONFIG_ATMEL_PIT=y
# CONFIG_ATMEL_ST is not set
CONFIG_CLKSRC_SAMSUNG_PWM=y
CONFIG_FSL_FTM_TIMER=y
CONFIG_OXNAS_RPS_TIMER=y
# CONFIG_MTK_TIMER is not set
CONFIG_SPRD_TIMER=y
# CONFIG_SH_TIMER_CMT is not set
CONFIG_SH_TIMER_MTU2=y
# CONFIG_RENESAS_OSTM is not set
# CONFIG_SH_TIMER_TMU is not set
# CONFIG_EM_TIMER_STI is not set
# CONFIG_CLKSRC_VERSATILE is not set
CONFIG_CLKSRC_PXA=y
# CONFIG_H8300_TMR8 is not set
# CONFIG_H8300_TMR16 is not set
# CONFIG_H8300_TPU is not set
CONFIG_TIMER_IMX_SYS_CTR=y
# CONFIG_CLKSRC_ST_LPC is not set
# CONFIG_ATCPIT100_TIMER is not set
# CONFIG_MSC313E_TIMER is not set
# CONFIG_INGENIC_TIMER is not set
# CONFIG_INGENIC_SYSOST is not set
# CONFIG_INGENIC_OST is not set
CONFIG_MICROCHIP_PIT64B=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
# CONFIG_IMX_MBOX is not set
CONFIG_ROCKCHIP_MBOX=y
CONFIG_ALTERA_MBOX=y
CONFIG_POLARFIRE_SOC_MAILBOX=y
CONFIG_QCOM_APCS_IPC=y
# CONFIG_BCM_PDC_MBOX is not set
# CONFIG_STM32_IPCC is not set
CONFIG_MTK_CMDQ_MBOX=y
CONFIG_SUN6I_MSGBOX=y
CONFIG_SPRD_MBOX=y
# CONFIG_QCOM_IPCC is not set
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
CONFIG_IOMMU_IO_PGTABLE=y
CONFIG_IOMMU_IO_PGTABLE_LPAE=y
CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST=y
CONFIG_IOMMU_IO_PGTABLE_ARMV7S=y
# CONFIG_IOMMU_IO_PGTABLE_ARMV7S_SELFTEST is not set
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
# CONFIG_IOMMU_DEFAULT_DMA_LAZY is not set
CONFIG_IOMMU_DEFAULT_PASSTHROUGH=y
# CONFIG_OMAP_IOMMU is not set
# CONFIG_ROCKCHIP_IOMMU is not set
CONFIG_SUN50I_IOMMU=y
CONFIG_IPMMU_VMSA=y
CONFIG_APPLE_DART=y
CONFIG_ARM_SMMU=y
CONFIG_ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=y
# CONFIG_S390_CCW_IOMMU is not set
# CONFIG_S390_AP_IOMMU is not set
# CONFIG_MTK_IOMMU is not set
# CONFIG_QCOM_IOMMU is not set
CONFIG_SPRD_IOMMU=y

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
CONFIG_RPMSG_NS=y
CONFIG_RPMSG_QCOM_GLINK=y
CONFIG_RPMSG_QCOM_GLINK_RPM=y
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

#
# SOC (System On Chip) specific Drivers
#
CONFIG_OWL_PM_DOMAINS_HELPER=y
CONFIG_OWL_PM_DOMAINS=y

#
# Amlogic SoC drivers
#
CONFIG_MESON_CANVAS=y
# CONFIG_MESON_CLK_MEASURE is not set
CONFIG_MESON_GX_SOCINFO=y
CONFIG_MESON_MX_SOCINFO=y
# end of Amlogic SoC drivers

#
# Apple SoC drivers
#
CONFIG_APPLE_PMGR_PWRSTATE=y
# end of Apple SoC drivers

#
# ASPEED SoC drivers
#
CONFIG_ASPEED_LPC_CTRL=y
CONFIG_ASPEED_LPC_SNOOP=y
CONFIG_ASPEED_UART_ROUTING=y
CONFIG_ASPEED_P2A_CTRL=y
CONFIG_ASPEED_SOCINFO=y
# end of ASPEED SoC drivers

CONFIG_AT91_SOC_ID=y
CONFIG_AT91_SOC_SFR=y

#
# Broadcom SoC drivers
#
# CONFIG_SOC_BCM63XX is not set
# CONFIG_SOC_BRCMSTB is not set
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
CONFIG_FSL_GUTS=y
# end of NXP/Freescale QorIQ SoC drivers

#
# i.MX SoC drivers
#
# CONFIG_SOC_IMX8M is not set
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
CONFIG_IXP4XX_QMGR=y
# CONFIG_IXP4XX_NPE is not set
# end of IXP4xx SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
CONFIG_LITEX=y
CONFIG_LITEX_SOC_CONTROLLER=y
# end of Enable LiteX SoC Builder specific drivers

#
# MediaTek SoC drivers
#
# CONFIG_MTK_CMDQ is not set
CONFIG_MTK_DEVAPC=y
CONFIG_MTK_INFRACFG=y
# CONFIG_MTK_PMIC_WRAP is not set
# CONFIG_MTK_SCPSYS is not set
CONFIG_MTK_SCPSYS_PM_DOMAINS=y
# CONFIG_MTK_MMSYS is not set
# end of MediaTek SoC drivers

#
# Qualcomm SoC drivers
#
# CONFIG_QCOM_AOSS_QMP is not set
# CONFIG_QCOM_GENI_SE is not set
CONFIG_QCOM_GSBI=y
# CONFIG_QCOM_LLCC is not set
CONFIG_QCOM_RPMH=y
# CONFIG_QCOM_RPMPD is not set
CONFIG_QCOM_SMD_RPM=y
# CONFIG_QCOM_SPM is not set
CONFIG_QCOM_WCNSS_CTRL=y
# end of Qualcomm SoC drivers

CONFIG_SOC_RENESAS=y
CONFIG_RST_RCAR=y
CONFIG_SYSC_RCAR=y
# CONFIG_SYSC_RCAR_GEN4 is not set
# CONFIG_SYSC_R8A77995 is not set
# CONFIG_SYSC_R8A7794 is not set
CONFIG_SYSC_R8A77990=y
# CONFIG_SYSC_R8A7779 is not set
# CONFIG_SYSC_R8A7790 is not set
# CONFIG_SYSC_R8A7795 is not set
CONFIG_SYSC_R8A7791=y
CONFIG_SYSC_R8A77965=y
CONFIG_SYSC_R8A77960=y
CONFIG_SYSC_R8A77961=y
# CONFIG_SYSC_R8A779F0 is not set
CONFIG_SYSC_R8A7792=y
CONFIG_SYSC_R8A77980=y
# CONFIG_SYSC_R8A77970 is not set
# CONFIG_SYSC_R8A779A0 is not set
CONFIG_SYSC_RMOBILE=y
CONFIG_SYSC_R8A77470=y
CONFIG_SYSC_R8A7745=y
# CONFIG_SYSC_R8A7742 is not set
# CONFIG_SYSC_R8A7743 is not set
# CONFIG_SYSC_R8A774C0 is not set
# CONFIG_SYSC_R8A774E1 is not set
CONFIG_SYSC_R8A774A1=y
# CONFIG_SYSC_R8A774B1 is not set
CONFIG_ROCKCHIP_GRF=y
# CONFIG_ROCKCHIP_PM_DOMAINS is not set
CONFIG_SOC_SAMSUNG=y
CONFIG_EXYNOS_ASV_ARM=y
CONFIG_EXYNOS_CHIPID=y
CONFIG_EXYNOS_USI=y
# CONFIG_EXYNOS_PM_DOMAINS is not set
CONFIG_EXYNOS_REGULATOR_COUPLER=y
# CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER is not set
CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER=y
CONFIG_SOC_TI=y
# CONFIG_UX500_SOC_ID is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
CONFIG_DEVFREQ_GOV_PERFORMANCE=y
# CONFIG_DEVFREQ_GOV_POWERSAVE is not set
CONFIG_DEVFREQ_GOV_USERSPACE=y
# CONFIG_DEVFREQ_GOV_PASSIVE is not set

#
# DEVFREQ Drivers
#
# CONFIG_ARM_EXYNOS_BUS_DEVFREQ is not set
# CONFIG_ARM_IMX_BUS_DEVFREQ is not set
CONFIG_ARM_TEGRA_DEVFREQ=y
CONFIG_ARM_SUN8I_A33_MBUS_DEVFREQ=y
CONFIG_PM_DEVFREQ_EVENT=y
# CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP is not set
# CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU is not set
# CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_ADC_JACK=y
# CONFIG_EXTCON_FSA9480 is not set
# CONFIG_EXTCON_GPIO is not set
# CONFIG_EXTCON_MAX14577 is not set
CONFIG_EXTCON_MAX3355=y
CONFIG_EXTCON_MAX77843=y
CONFIG_EXTCON_PALMAS=y
CONFIG_EXTCON_PTN5150=y
CONFIG_EXTCON_QCOM_SPMI_MISC=y
# CONFIG_EXTCON_RT8973A is not set
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=y
CONFIG_EXTCON_USBC_CROS_EC=y
# CONFIG_EXTCON_USBC_TUSB320 is not set
# CONFIG_MEMORY is not set
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
# CONFIG_IIO_BUFFER_DMA is not set
# CONFIG_IIO_BUFFER_DMAENGINE is not set
CONFIG_IIO_BUFFER_HW_CONSUMER=y
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=y
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=y
# CONFIG_IIO_SW_TRIGGER is not set
CONFIG_IIO_TRIGGERED_EVENT=y

#
# Accelerometers
#
CONFIG_ADIS16201=y
CONFIG_ADIS16209=y
CONFIG_ADXL313=y
CONFIG_ADXL313_I2C=y
# CONFIG_ADXL313_SPI is not set
CONFIG_ADXL355=y
CONFIG_ADXL355_I2C=y
# CONFIG_ADXL355_SPI is not set
CONFIG_ADXL372=y
CONFIG_ADXL372_SPI=y
CONFIG_ADXL372_I2C=y
CONFIG_BMA180=y
CONFIG_BMA220=y
CONFIG_BMA400=y
CONFIG_BMA400_I2C=y
CONFIG_BMA400_SPI=y
# CONFIG_BMC150_ACCEL is not set
CONFIG_BMI088_ACCEL=y
CONFIG_BMI088_ACCEL_SPI=y
CONFIG_DA280=y
# CONFIG_DA311 is not set
CONFIG_DMARD06=y
CONFIG_DMARD09=y
# CONFIG_DMARD10 is not set
CONFIG_FXLS8962AF=y
CONFIG_FXLS8962AF_I2C=y
CONFIG_FXLS8962AF_SPI=y
CONFIG_KXSD9=y
# CONFIG_KXSD9_SPI is not set
# CONFIG_KXSD9_I2C is not set
CONFIG_KXCJK1013=y
CONFIG_MC3230=y
CONFIG_MMA7455=y
CONFIG_MMA7455_I2C=y
CONFIG_MMA7455_SPI=y
CONFIG_MMA7660=y
# CONFIG_MMA8452 is not set
CONFIG_MMA9551_CORE=y
CONFIG_MMA9551=y
CONFIG_MMA9553=y
# CONFIG_MXC4005 is not set
CONFIG_MXC6255=y
CONFIG_SCA3000=y
# CONFIG_SCA3300 is not set
# CONFIG_STK8312 is not set
CONFIG_STK8BA50=y
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD_SIGMA_DELTA=y
CONFIG_AD7091R5=y
CONFIG_AD7124=y
CONFIG_AD7192=y
CONFIG_AD7266=y
CONFIG_AD7291=y
CONFIG_AD7292=y
# CONFIG_AD7298 is not set
# CONFIG_AD7476 is not set
CONFIG_AD7606=y
# CONFIG_AD7606_IFACE_PARALLEL is not set
CONFIG_AD7606_IFACE_SPI=y
CONFIG_AD7766=y
CONFIG_AD7768_1=y
# CONFIG_AD7780 is not set
CONFIG_AD7791=y
CONFIG_AD7793=y
CONFIG_AD7887=y
# CONFIG_AD7923 is not set
CONFIG_AD7949=y
# CONFIG_AD799X is not set
CONFIG_ASPEED_ADC=y
# CONFIG_AT91_SAMA5D2_ADC is not set
CONFIG_AXP20X_ADC=y
# CONFIG_AXP288_ADC is not set
CONFIG_BCM_IPROC_ADC=y
CONFIG_BERLIN2_ADC=y
# CONFIG_CC10001_ADC is not set
CONFIG_DA9150_GPADC=y
CONFIG_HI8435=y
CONFIG_HX711=y
CONFIG_INA2XX_ADC=y
CONFIG_INGENIC_ADC=y
CONFIG_IMX7D_ADC=y
CONFIG_IMX8QXP_ADC=y
CONFIG_LPC32XX_ADC=y
CONFIG_LTC2471=y
# CONFIG_LTC2485 is not set
CONFIG_LTC2496=y
CONFIG_LTC2497=y
# CONFIG_MAX1027 is not set
# CONFIG_MAX11100 is not set
CONFIG_MAX1118=y
# CONFIG_MAX1241 is not set
CONFIG_MAX1363=y
CONFIG_MAX9611=y
# CONFIG_MCP320X is not set
# CONFIG_MCP3422 is not set
# CONFIG_MCP3911 is not set
CONFIG_MEDIATEK_MT6360_ADC=y
# CONFIG_MEDIATEK_MT6577_AUXADC is not set
# CONFIG_MEN_Z188_ADC is not set
CONFIG_MP2629_ADC=y
# CONFIG_NAU7802 is not set
CONFIG_NPCM_ADC=y
CONFIG_PALMAS_GPADC=y
# CONFIG_RCAR_GYRO_ADC is not set
# CONFIG_ROCKCHIP_SARADC is not set
# CONFIG_RZG2L_ADC is not set
CONFIG_SC27XX_ADC=y
# CONFIG_SPEAR_ADC is not set
CONFIG_STM32_DFSDM_CORE=y
# CONFIG_STM32_DFSDM_ADC is not set
# CONFIG_TI_ADC081C is not set
CONFIG_TI_ADC0832=y
# CONFIG_TI_ADC084S021 is not set
CONFIG_TI_ADC12138=y
CONFIG_TI_ADC108S102=y
CONFIG_TI_ADC128S052=y
CONFIG_TI_ADC161S626=y
CONFIG_TI_ADS1015=y
CONFIG_TI_ADS7950=y
CONFIG_TI_ADS8344=y
# CONFIG_TI_ADS8688 is not set
# CONFIG_TI_ADS124S08 is not set
CONFIG_TI_ADS131E08=y
CONFIG_TI_AM335X_ADC=y
CONFIG_TI_TLC4541=y
CONFIG_TI_TSC2046=y
CONFIG_TWL4030_MADC=y
CONFIG_TWL6030_GPADC=y
CONFIG_XILINX_XADC=y
# CONFIG_XILINX_AMS is not set
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
CONFIG_AD74413R=y
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
CONFIG_IIO_RESCALE=y
# end of Analog Front Ends

#
# Amplifiers
#
CONFIG_AD8366=y
CONFIG_HMC425=y
# end of Amplifiers

#
# Capacitance to digital converters
#
CONFIG_AD7150=y
# end of Capacitance to digital converters

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=y
CONFIG_ATLAS_EZO_SENSOR=y
# CONFIG_BME680 is not set
CONFIG_CCS811=y
CONFIG_IAQCORE=y
CONFIG_SCD30_CORE=y
CONFIG_SCD30_I2C=y
# CONFIG_SCD4X is not set
CONFIG_SENSIRION_SGP30=y
CONFIG_SENSIRION_SGP40=y
# CONFIG_SPS30_I2C is not set
# CONFIG_SENSEAIR_SUNRISE_CO2 is not set
CONFIG_VZ89X=y
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=y

#
# IIO SCMI Sensors
#
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# CONFIG_IIO_SSP_SENSORS_COMMONS is not set
CONFIG_IIO_SSP_SENSORHUB=y
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=y
CONFIG_IIO_ST_SENSORS_SPI=y
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Digital to analog converters
#
# CONFIG_AD3552R is not set
CONFIG_AD5064=y
CONFIG_AD5360=y
CONFIG_AD5380=y
# CONFIG_AD5421 is not set
# CONFIG_AD5446 is not set
CONFIG_AD5449=y
# CONFIG_AD5592R is not set
# CONFIG_AD5593R is not set
CONFIG_AD5504=y
CONFIG_AD5624R_SPI=y
CONFIG_AD5686=y
# CONFIG_AD5686_SPI is not set
CONFIG_AD5696_I2C=y
CONFIG_AD5755=y
CONFIG_AD5758=y
CONFIG_AD5761=y
CONFIG_AD5764=y
# CONFIG_AD5766 is not set
CONFIG_AD5770R=y
CONFIG_AD5791=y
CONFIG_AD7293=y
CONFIG_AD7303=y
CONFIG_AD8801=y
CONFIG_DS4424=y
CONFIG_LTC1660=y
CONFIG_LTC2632=y
CONFIG_M62332=y
# CONFIG_MAX517 is not set
# CONFIG_MAX5821 is not set
# CONFIG_MCP4725 is not set
CONFIG_MCP4922=y
CONFIG_STM32_DAC=y
CONFIG_STM32_DAC_CORE=y
# CONFIG_TI_DAC082S085 is not set
CONFIG_TI_DAC5571=y
CONFIG_TI_DAC7311=y
CONFIG_TI_DAC7612=y
# end of Digital to analog converters

#
# IIO dummy driver
#
# CONFIG_IIO_SIMPLE_DUMMY is not set
# end of IIO dummy driver

#
# Filters
#
CONFIG_ADMV8818=y
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
CONFIG_AD9523=y
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# CONFIG_ADF4350 is not set
CONFIG_ADF4371=y
# CONFIG_ADMV1013 is not set
CONFIG_ADRF6780=y
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
# CONFIG_ADIS16080 is not set
# CONFIG_ADIS16130 is not set
# CONFIG_ADIS16136 is not set
# CONFIG_ADIS16260 is not set
CONFIG_ADXRS290=y
CONFIG_ADXRS450=y
# CONFIG_BMG160 is not set
CONFIG_FXAS21002C=y
CONFIG_FXAS21002C_I2C=y
CONFIG_FXAS21002C_SPI=y
CONFIG_MPU3050=y
CONFIG_MPU3050_I2C=y
# CONFIG_IIO_ST_GYRO_3AXIS is not set
# CONFIG_ITG3200 is not set
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4403=y
CONFIG_AFE4404=y
CONFIG_MAX30100=y
CONFIG_MAX30102=y
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
CONFIG_AM2315=y
CONFIG_DHT11=y
CONFIG_HDC100X=y
CONFIG_HDC2010=y
CONFIG_HTS221=y
CONFIG_HTS221_I2C=y
CONFIG_HTS221_SPI=y
CONFIG_HTU21=y
# CONFIG_SI7005 is not set
CONFIG_SI7020=y
# end of Humidity sensors

#
# Inertial measurement units
#
# CONFIG_ADIS16400 is not set
CONFIG_ADIS16460=y
CONFIG_ADIS16475=y
CONFIG_ADIS16480=y
CONFIG_BMI160=y
CONFIG_BMI160_I2C=y
CONFIG_BMI160_SPI=y
CONFIG_FXOS8700=y
CONFIG_FXOS8700_I2C=y
CONFIG_FXOS8700_SPI=y
CONFIG_KMX61=y
CONFIG_INV_ICM42600=y
# CONFIG_INV_ICM42600_I2C is not set
CONFIG_INV_ICM42600_SPI=y
CONFIG_INV_MPU6050_IIO=y
CONFIG_INV_MPU6050_I2C=y
CONFIG_INV_MPU6050_SPI=y
# CONFIG_IIO_ST_LSM6DSX is not set
# end of Inertial measurement units

CONFIG_IIO_ADIS_LIB=y
CONFIG_IIO_ADIS_LIB_BUFFER=y

#
# Light sensors
#
CONFIG_ADJD_S311=y
CONFIG_ADUX1020=y
CONFIG_AL3010=y
CONFIG_AL3320A=y
CONFIG_APDS9300=y
CONFIG_APDS9960=y
CONFIG_AS73211=y
CONFIG_BH1750=y
CONFIG_BH1780=y
CONFIG_CM32181=y
CONFIG_CM3232=y
# CONFIG_CM3323 is not set
# CONFIG_CM36651 is not set
# CONFIG_GP2AP002 is not set
# CONFIG_GP2AP020A00F is not set
CONFIG_IQS621_ALS=y
CONFIG_SENSORS_ISL29018=y
CONFIG_SENSORS_ISL29028=y
# CONFIG_ISL29125 is not set
# CONFIG_JSA1212 is not set
CONFIG_RPR0521=y
CONFIG_SENSORS_LM3533=y
CONFIG_LTR501=y
CONFIG_LV0104CS=y
# CONFIG_MAX44000 is not set
# CONFIG_MAX44009 is not set
CONFIG_NOA1305=y
# CONFIG_OPT3001 is not set
CONFIG_PA12203001=y
CONFIG_SI1133=y
CONFIG_SI1145=y
CONFIG_STK3310=y
CONFIG_ST_UVIS25=y
CONFIG_ST_UVIS25_I2C=y
CONFIG_ST_UVIS25_SPI=y
CONFIG_TCS3414=y
CONFIG_TCS3472=y
CONFIG_SENSORS_TSL2563=y
CONFIG_TSL2583=y
CONFIG_TSL2591=y
# CONFIG_TSL2772 is not set
CONFIG_TSL4531=y
CONFIG_US5182D=y
# CONFIG_VCNL4000 is not set
CONFIG_VCNL4035=y
# CONFIG_VEML6030 is not set
# CONFIG_VEML6070 is not set
CONFIG_VL6180=y
CONFIG_ZOPT2201=y
# end of Light sensors

#
# Magnetometer sensors
#
CONFIG_AK8975=y
CONFIG_AK09911=y
CONFIG_BMC150_MAGN=y
CONFIG_BMC150_MAGN_I2C=y
# CONFIG_BMC150_MAGN_SPI is not set
# CONFIG_MAG3110 is not set
CONFIG_MMC35240=y
# CONFIG_IIO_ST_MAGN_3AXIS is not set
CONFIG_SENSORS_HMC5843=y
CONFIG_SENSORS_HMC5843_I2C=y
CONFIG_SENSORS_HMC5843_SPI=y
CONFIG_SENSORS_RM3100=y
CONFIG_SENSORS_RM3100_I2C=y
CONFIG_SENSORS_RM3100_SPI=y
CONFIG_YAMAHA_YAS530=y
# end of Magnetometer sensors

#
# Multiplexers
#
CONFIG_IIO_MUX=y
# end of Multiplexers

#
# Inclinometer sensors
#
# end of Inclinometer sensors

# CONFIG_IIO_TEST_FORMAT is not set

#
# Triggers - standalone
#
CONFIG_IIO_INTERRUPT_TRIGGER=y
CONFIG_IIO_STM32_LPTIMER_TRIGGER=y
# CONFIG_IIO_STM32_TIMER_TRIGGER is not set
CONFIG_IIO_SYSFS_TRIGGER=y
# end of Triggers - standalone

#
# Linear and angular position sensors
#
CONFIG_IQS624_POS=y
# end of Linear and angular position sensors

#
# Digital potentiometers
#
# CONFIG_AD5110 is not set
CONFIG_AD5272=y
CONFIG_DS1803=y
# CONFIG_MAX5432 is not set
CONFIG_MAX5481=y
CONFIG_MAX5487=y
CONFIG_MCP4018=y
CONFIG_MCP4131=y
CONFIG_MCP4531=y
CONFIG_MCP41010=y
CONFIG_TPL0102=y
# end of Digital potentiometers

#
# Digital potentiostats
#
# CONFIG_LMP91000 is not set
# end of Digital potentiostats

#
# Pressure sensors
#
# CONFIG_ABP060MG is not set
# CONFIG_BMP280 is not set
CONFIG_DLHL60D=y
# CONFIG_DPS310 is not set
CONFIG_HP03=y
CONFIG_ICP10100=y
CONFIG_MPL115=y
CONFIG_MPL115_I2C=y
# CONFIG_MPL115_SPI is not set
CONFIG_MPL3115=y
CONFIG_MS5611=y
# CONFIG_MS5611_I2C is not set
CONFIG_MS5611_SPI=y
# CONFIG_MS5637 is not set
CONFIG_IIO_ST_PRESS=y
CONFIG_IIO_ST_PRESS_I2C=y
CONFIG_IIO_ST_PRESS_SPI=y
CONFIG_T5403=y
CONFIG_HP206C=y
# CONFIG_ZPA2326 is not set
# end of Pressure sensors

#
# Lightning sensors
#
CONFIG_AS3935=y
# end of Lightning sensors

#
# Proximity and distance sensors
#
CONFIG_CROS_EC_MKBP_PROXIMITY=y
CONFIG_ISL29501=y
# CONFIG_LIDAR_LITE_V2 is not set
# CONFIG_MB1232 is not set
# CONFIG_PING is not set
CONFIG_RFD77402=y
CONFIG_SRF04=y
CONFIG_SX9310=y
CONFIG_SX9500=y
CONFIG_SRF08=y
CONFIG_VCNL3020=y
# CONFIG_VL53L0X_I2C is not set
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
CONFIG_AD2S90=y
CONFIG_AD2S1200=y
# end of Resolver to digital converters

#
# Temperature sensors
#
# CONFIG_IQS620AT_TEMP is not set
CONFIG_LTC2983=y
# CONFIG_MAXIM_THERMOCOUPLE is not set
CONFIG_MLX90614=y
CONFIG_MLX90632=y
CONFIG_TMP006=y
CONFIG_TMP007=y
# CONFIG_TMP117 is not set
CONFIG_TSYS01=y
# CONFIG_TSYS02D is not set
# CONFIG_MAX31856 is not set
CONFIG_MAX31865=y
# end of Temperature sensors

CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
# CONFIG_PWM_BCM_IPROC is not set
CONFIG_PWM_BCM_KONA=y
CONFIG_PWM_BCM2835=y
# CONFIG_PWM_BERLIN is not set
CONFIG_PWM_BRCMSTB=y
CONFIG_PWM_CLPS711X=y
# CONFIG_PWM_CROS_EC is not set
CONFIG_PWM_EP93XX=y
CONFIG_PWM_HIBVT=y
CONFIG_PWM_IMG=y
CONFIG_PWM_IMX1=y
# CONFIG_PWM_IMX27 is not set
CONFIG_PWM_IMX_TPM=y
CONFIG_PWM_INTEL_LGM=y
# CONFIG_PWM_IQS620A is not set
# CONFIG_PWM_JZ4740 is not set
# CONFIG_PWM_KEEMBAY is not set
CONFIG_PWM_LPC18XX_SCT=y
# CONFIG_PWM_LPC32XX is not set
CONFIG_PWM_LPSS=y
CONFIG_PWM_LPSS_PLATFORM=y
CONFIG_PWM_MESON=y
CONFIG_PWM_MTK_DISP=y
# CONFIG_PWM_MEDIATEK is not set
# CONFIG_PWM_PCA9685 is not set
CONFIG_PWM_PXA=y
# CONFIG_PWM_RASPBERRYPI_POE is not set
# CONFIG_PWM_RCAR is not set
# CONFIG_PWM_RENESAS_TPU is not set
CONFIG_PWM_ROCKCHIP=y
CONFIG_PWM_SAMSUNG=y
CONFIG_PWM_SL28CPLD=y
CONFIG_PWM_SPRD=y
# CONFIG_PWM_STM32 is not set
CONFIG_PWM_STM32_LP=y
CONFIG_PWM_SUN4I=y
# CONFIG_PWM_TEGRA is not set
# CONFIG_PWM_TIECAP is not set
CONFIG_PWM_TIEHRPWM=y
CONFIG_PWM_TWL=y
CONFIG_PWM_TWL_LED=y
CONFIG_PWM_VISCONTI=y
CONFIG_PWM_VT8500=y

#
# IRQ chip support
#
# CONFIG_AL_FIC is not set
CONFIG_MADERA_IRQ=y
CONFIG_IRQ_MIPS_CPU=y
# CONFIG_RENESAS_INTC_IRQPIN is not set
# CONFIG_RENESAS_IRQC is not set
# CONFIG_RENESAS_RZA1_IRQC is not set
CONFIG_SL28CPLD_INTC=y
# CONFIG_TS4800_IRQ is not set
CONFIG_INGENIC_TCU_IRQ=y
# CONFIG_RENESAS_H8S_INTC is not set
# CONFIG_IRQ_UNIPHIER_AIDET is not set
# CONFIG_MESON_IRQ_GPIO is not set
CONFIG_GOLDFISH_PIC=y
# CONFIG_IMX_IRQSTEER is not set
# CONFIG_IMX_INTMUX is not set
# CONFIG_EXYNOS_IRQ_COMBINER is not set
# CONFIG_LOONGSON_PCH_PIC is not set
# CONFIG_MST_IRQ is not set
# CONFIG_MCHP_EIC is not set
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_ATH79=y
CONFIG_RESET_AXS10X=y
# CONFIG_RESET_BCM6345 is not set
CONFIG_RESET_BERLIN=y
# CONFIG_RESET_BRCMSTB is not set
CONFIG_RESET_BRCMSTB_RESCAL=y
# CONFIG_RESET_HSDK is not set
CONFIG_RESET_IMX7=y
# CONFIG_RESET_LANTIQ is not set
# CONFIG_RESET_LPC18XX is not set
# CONFIG_RESET_MCHP_SPARX5 is not set
CONFIG_RESET_MESON=y
# CONFIG_RESET_MESON_AUDIO_ARB is not set
CONFIG_RESET_NPCM=y
CONFIG_RESET_PISTACHIO=y
# CONFIG_RESET_QCOM_AOSS is not set
CONFIG_RESET_QCOM_PDC=y
CONFIG_RESET_RASPBERRYPI=y
CONFIG_RESET_RZG2L_USBPHY_CTRL=y
CONFIG_RESET_SCMI=y
# CONFIG_RESET_SIMPLE is not set
# CONFIG_RESET_SOCFPGA is not set
CONFIG_RESET_STARFIVE_JH7100=y
# CONFIG_RESET_SUNXI is not set
CONFIG_RESET_TI_SYSCON=y
CONFIG_RESET_ZYNQ=y
CONFIG_COMMON_RESET_HI3660=y
CONFIG_COMMON_RESET_HI6220=y

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
# CONFIG_PHY_PISTACHIO_USB is not set
CONFIG_PHY_CAN_TRANSCEIVER=y
CONFIG_PHY_SUN6I_MIPI_DPHY=y

#
# PHY drivers for Broadcom platforms
#
CONFIG_PHY_BCM63XX_USBH=y
# CONFIG_BCM_KONA_USB2_PHY is not set
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_HI6220_USB=y
CONFIG_PHY_HI3660_USB=y
# CONFIG_PHY_HI3670_USB is not set
CONFIG_PHY_HI3670_PCIE=y
# CONFIG_PHY_HISTB_COMBPHY is not set
# CONFIG_PHY_HISI_INNO_USB2 is not set
CONFIG_PHY_PXA_28NM_HSIC=y
CONFIG_PHY_PXA_28NM_USB2=y
CONFIG_PHY_PXA_USB=y
# CONFIG_PHY_MMP3_USB is not set
# CONFIG_PHY_MMP3_HSIC is not set
CONFIG_PHY_MT7621_PCI=y
# CONFIG_PHY_RALINK_USB is not set
CONFIG_PHY_RCAR_GEN3_USB3=y
# CONFIG_PHY_ROCKCHIP_DPHY_RX0 is not set
CONFIG_PHY_ROCKCHIP_PCIE=y
CONFIG_PHY_EXYNOS_MIPI_VIDEO=y
CONFIG_PHY_SAMSUNG_USB2=y
# CONFIG_PHY_S5PV210_USB2 is not set
CONFIG_PHY_ST_SPEAR1310_MIPHY=y
CONFIG_PHY_ST_SPEAR1340_MIPHY=y
CONFIG_PHY_STIH407_USB=y
# CONFIG_PHY_STM32_USBPHYC is not set
CONFIG_PHY_TEGRA194_P2U=y
CONFIG_PHY_DA8XX_USB=y
CONFIG_PHY_AM654_SERDES=y
CONFIG_OMAP_CONTROL_PHY=y
CONFIG_TI_PIPE3=y
CONFIG_PHY_INTEL_KEEMBAY_EMMC=y
# CONFIG_PHY_INTEL_KEEMBAY_USB is not set
CONFIG_PHY_INTEL_LGM_EMMC=y
CONFIG_PHY_XILINX_ZYNQMP=y
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
CONFIG_MCB=y
CONFIG_MCB_LPC=y

#
# Performance monitor support
#
# CONFIG_ARM_CCN is not set
# CONFIG_ARM_CMN is not set
CONFIG_FSL_IMX8_DDR_PMU=y
CONFIG_XGENE_PMU=y
# CONFIG_ARM_DMC620_PMU is not set
CONFIG_MARVELL_CN10K_TAD_PMU=y
# end of Performance monitor support

CONFIG_RAS=y

#
# Android
#
# CONFIG_ANDROID is not set
# end of Android

# CONFIG_DAX is not set
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
CONFIG_NVMEM_IMX_IIM=y
CONFIG_NVMEM_IMX_OCOTP=y
CONFIG_NVMEM_LPC18XX_EEPROM=y
# CONFIG_NVMEM_LPC18XX_OTP is not set
CONFIG_NVMEM_MXS_OCOTP=y
# CONFIG_MTK_EFUSE is not set
CONFIG_NVMEM_NINTENDO_OTP=y
# CONFIG_QCOM_QFPROM is not set
# CONFIG_ROCKCHIP_EFUSE is not set
# CONFIG_ROCKCHIP_OTP is not set
CONFIG_NVMEM_BCM_OCOTP=y
CONFIG_NVMEM_STM32_ROMEM=y
# CONFIG_UNIPHIER_EFUSE is not set
# CONFIG_NVMEM_VF610_OCOTP is not set
# CONFIG_MESON_MX_EFUSE is not set
# CONFIG_NVMEM_SNVS_LPGPR is not set
# CONFIG_SC27XX_EFUSE is not set
# CONFIG_SPRD_EFUSE is not set
CONFIG_NVMEM_RMEM=y
CONFIG_NVMEM_BRCM_NVRAM=y

#
# HW tracing support
#
# CONFIG_STM is not set
CONFIG_INTEL_TH=y
CONFIG_INTEL_TH_GTH=y
# CONFIG_INTEL_TH_MSU is not set
CONFIG_INTEL_TH_PTI=y
CONFIG_INTEL_TH_DEBUG=y
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_TEE is not set
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
# CONFIG_MUX_ADG792A is not set
# CONFIG_MUX_ADGS1408 is not set
CONFIG_MUX_GPIO=y
CONFIG_MUX_MMIO=y
# end of Multiplexer drivers

CONFIG_PM_OPP=y
# CONFIG_SIOX is not set
CONFIG_SLIMBUS=y
CONFIG_SLIM_QCOM_CTRL=y
# CONFIG_INTERCONNECT is not set
CONFIG_COUNTER=y
CONFIG_INTERRUPT_CNT=y
# CONFIG_STM32_TIMER_CNT is not set
# CONFIG_STM32_LPTIMER_CNT is not set
# CONFIG_TI_EQEP is not set
CONFIG_MOST=y
CONFIG_MOST_CDEV=y
CONFIG_MOST_SND=y
# end of Device Drivers

#
# File systems
#
CONFIG_VALIDATE_FS_PARSER=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
# CONFIG_FILE_LOCKING is not set
CONFIG_FS_ENCRYPTION=y
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
# CONFIG_INOTIFY_USER is not set
# CONFIG_FANOTIFY is not set
CONFIG_QUOTA=y
# CONFIG_PRINT_QUOTA_WARNING is not set
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
# CONFIG_FUSE_FS is not set
CONFIG_OVERLAY_FS=y
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
CONFIG_OVERLAY_FS_XINO_AUTO=y
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=y
CONFIG_NETFS_STATS=y
CONFIG_FSCACHE=y
# CONFIG_FSCACHE_STATS is not set
CONFIG_FSCACHE_DEBUG=y
# end of Caches

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
# CONFIG_PROC_VMCORE is not set
# CONFIG_PROC_SYSCTL is not set
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
CONFIG_TMPFS_INODE64=y
CONFIG_ARCH_SUPPORTS_HUGETLBFS=y
# CONFIG_HUGETLBFS is not set
CONFIG_MEMFD_CREATE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
# CONFIG_NLS is not set
# CONFIG_UNICODE is not set
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
# CONFIG_PERSISTENT_KEYRINGS is not set
CONFIG_TRUSTED_KEYS=y
CONFIG_ENCRYPTED_KEYS=y
CONFIG_KEY_DH_OPERATIONS=y
CONFIG_SECURITY_DMESG_RESTRICT=y
CONFIG_SECURITYFS=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
# CONFIG_HARDENED_USERCOPY_PAGESPAN is not set
# CONFIG_FORTIFY_SOURCE is not set
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
CONFIG_INIT_STACK_ALL_PATTERN=y
# CONFIG_INIT_STACK_ALL_ZERO is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=y
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
# CONFIG_CRYPTO_CRYPTD is not set
CONFIG_CRYPTO_AUTHENC=y
CONFIG_CRYPTO_TEST=y

#
# Public-key cryptography
#
# CONFIG_CRYPTO_RSA is not set
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
# CONFIG_CRYPTO_ECDSA is not set
CONFIG_CRYPTO_ECRDSA=y
CONFIG_CRYPTO_SM2=y
CONFIG_CRYPTO_CURVE25519=y

#
# Authenticated Encryption with Associated Data
#
# CONFIG_CRYPTO_CCM is not set
# CONFIG_CRYPTO_GCM is not set
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_AEGIS128=y
CONFIG_CRYPTO_SEQIV=y
# CONFIG_CRYPTO_ECHAINIV is not set

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=y
CONFIG_CRYPTO_OFB=y
CONFIG_CRYPTO_PCBC=y
# CONFIG_CRYPTO_XTS is not set
CONFIG_CRYPTO_KEYWRAP=y
CONFIG_CRYPTO_NHPOLY1305=y
CONFIG_CRYPTO_ADIANTUM=y
CONFIG_CRYPTO_ESSIV=y

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=y
CONFIG_CRYPTO_VMAC=y

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_XXHASH=y
# CONFIG_CRYPTO_BLAKE2B is not set
# CONFIG_CRYPTO_BLAKE2S is not set
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_GHASH=y
# CONFIG_CRYPTO_POLY1305 is not set
CONFIG_CRYPTO_POLY1305_MIPS=y
# CONFIG_CRYPTO_MD4 is not set
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=y
# CONFIG_CRYPTO_RMD160 is not set
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
# CONFIG_CRYPTO_SHA3 is not set
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_STREEBOG=y
CONFIG_CRYPTO_WP512=y

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
# CONFIG_CRYPTO_BLOWFISH is not set
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=y
# CONFIG_CRYPTO_CAST5 is not set
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=y
# CONFIG_CRYPTO_FCRYPT is not set
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_SERPENT=y
CONFIG_CRYPTO_SM4=y
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
# CONFIG_CRYPTO_LZO is not set
# CONFIG_CRYPTO_842 is not set
# CONFIG_CRYPTO_LZ4 is not set
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=y

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=y
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
# CONFIG_CRYPTO_DRBG_HASH is not set
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_KDF800108_CTR=y
CONFIG_CRYPTO_HASH_INFO=y
# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
# CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE is not set
# CONFIG_X509_CERTIFICATE_PARSER is not set
CONFIG_PKCS8_PRIVATE_KEY_PARSER=y

#
# Certificates for signature checking
#
# CONFIG_SYSTEM_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_ARCH_HAS_STRNCPY_FROM_USER=y
CONFIG_ARCH_HAS_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=y
CONFIG_PRIME_NUMBERS=y
CONFIG_RATIONAL=y
CONFIG_NO_GENERIC_PCI_IOPORT_MAP=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_STMP_DEVICE=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
# CONFIG_CRYPTO_LIB_CHACHA is not set
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=2
CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=y
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=y
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA256=y
CONFIG_CRYPTO_LIB_SM4=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
CONFIG_CRC32_BIT=y
CONFIG_CRC64=y
# CONFIG_CRC4 is not set
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
CONFIG_RANDOM32_SELFTEST=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
# CONFIG_XZ_DEC_POWERPC is not set
# CONFIG_XZ_DEC_IA64 is not set
# CONFIG_XZ_DEC_ARM is not set
# CONFIG_XZ_DEC_ARMTHUMB is not set
# CONFIG_XZ_DEC_SPARC is not set
CONFIG_XZ_DEC_MICROLZMA=y
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_TEST=y
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=y
CONFIG_REED_SOLOMON_ENC16=y
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_DMA_CMA=y
CONFIG_DMA_PERNUMA_CMA=y

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=16
CONFIG_CMA_SIZE_PERCENTAGE=10
# CONFIG_CMA_SIZE_SEL_MBYTES is not set
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
CONFIG_CMA_SIZE_SEL_MIN=y
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_FONT_SUPPORT=y
CONFIG_FONTS=y
# CONFIG_FONT_8x8 is not set
CONFIG_FONT_8x16=y
CONFIG_FONT_6x11=y
CONFIG_FONT_7x14=y
CONFIG_FONT_PEARL_8x8=y
# CONFIG_FONT_ACORN_8x8 is not set
# CONFIG_FONT_MINI_4x6 is not set
CONFIG_FONT_6x10=y
CONFIG_FONT_10x18=y
# CONFIG_FONT_SUN8x16 is not set
# CONFIG_FONT_SUN12x22 is not set
# CONFIG_FONT_TER16x32 is not set
CONFIG_FONT_6x8=y
CONFIG_STACKDEPOT=y
CONFIG_STACK_HASH_ORDER=20
CONFIG_REF_TRACKER=y
CONFIG_PARMAN=y
CONFIG_OBJAGG=y
# end of Library routines

CONFIG_GENERIC_LIB_ASHLDI3=y
CONFIG_GENERIC_LIB_ASHRDI3=y
CONFIG_GENERIC_LIB_LSHRDI3=y
CONFIG_GENERIC_LIB_CMPDI2=y
CONFIG_GENERIC_LIB_UCMPDI2=y
CONFIG_ASN1_ENCODER=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_SYMBOLIC_ERRNAME is not set
# end of printk and dmesg options

#
# Compile-time checks and compiler options
#
CONFIG_FRAME_WARN=2048
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_READABLE_ASM is not set
CONFIG_HEADERS_INSTALL=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
CONFIG_VMLINUX_MAP=y
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
# CONFIG_MAGIC_SYSRQ_SERIAL is not set
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
CONFIG_DEBUG_FS_ALLOW_NONE=y
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ONLY_BOUNDS=y
CONFIG_UBSAN_SHIFT=y
# CONFIG_UBSAN_DIV_ZERO is not set
CONFIG_UBSAN_UNREACHABLE=y
CONFIG_UBSAN_BOOL=y
# CONFIG_UBSAN_ENUM is not set
# CONFIG_UBSAN_SANITIZE_ALL is not set
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_PAGE_OWNER=y
# CONFIG_PAGE_POISONING is not set
CONFIG_DEBUG_PAGE_REF=y
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_SLUB_STATS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=16000
# CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
# CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_DEBUG_VM=y
# CONFIG_DEBUG_VM_VMACACHE is not set
# CONFIG_DEBUG_VM_RB is not set
# CONFIG_DEBUG_VM_PGFLAGS is not set
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
# CONFIG_DEBUG_STACKOVERFLOW is not set
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
# CONFIG_SOFTLOCKUP_DETECTOR is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=0
CONFIG_WQ_WATCHDOG=y
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
# CONFIG_SCHEDSTATS is not set
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
# CONFIG_LOCK_STAT is not set
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
CONFIG_DEBUG_RWSEMS=y
# CONFIG_DEBUG_LOCK_ALLOC is not set
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
# CONFIG_LOCK_TORTURE_TEST is not set
# CONFIG_WW_MUTEX_SELFTEST is not set
CONFIG_SCF_TORTURE_TEST=y
CONFIG_CSD_LOCK_WAIT_DEBUG=y
# end of Lock Debugging (spinlocks, mutexes, etc...)

# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
CONFIG_DEBUG_KOBJECT=y

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
CONFIG_DEBUG_SG=y
CONFIG_DEBUG_NOTIFIERS=y
CONFIG_BUG_ON_DATA_CORRUPTION=y
# end of Debug kernel data structures

CONFIG_DEBUG_CREDENTIALS=y

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=y
CONFIG_RCU_SCALE_TEST=y
# CONFIG_RCU_TORTURE_TEST is not set
CONFIG_RCU_REF_SCALE_TEST=y
# CONFIG_RCU_TRACE is not set
CONFIG_RCU_EQS_DEBUG=y
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_LATENCYTOP is not set
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
CONFIG_FUNCTION_TRACER=y
CONFIG_FUNCTION_GRAPH_TRACER=y
CONFIG_DYNAMIC_FTRACE=y
# CONFIG_FUNCTION_PROFILER is not set
CONFIG_STACK_TRACER=y
# CONFIG_IRQSOFF_TRACER is not set
# CONFIG_SCHED_TRACER is not set
# CONFIG_HWLAT_TRACER is not set
CONFIG_OSNOISE_TRACER=y
CONFIG_TIMERLAT_TRACER=y
# CONFIG_FTRACE_SYSCALLS is not set
CONFIG_TRACER_SNAPSHOT=y
CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_PROFILE_ALL_BRANCHES is not set
# CONFIG_UPROBE_EVENTS is not set
CONFIG_DYNAMIC_EVENTS=y
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT=y
CONFIG_SYNTH_EVENTS=y
CONFIG_TRACE_EVENT_INJECT=y
# CONFIG_TRACEPOINT_BENCHMARK is not set
# CONFIG_RING_BUFFER_BENCHMARK is not set
CONFIG_TRACE_EVAL_MAP_FILE=y
CONFIG_FTRACE_RECORD_RECURSION=y
CONFIG_FTRACE_RECORD_RECURSION_SIZE=128
CONFIG_RING_BUFFER_RECORD_RECURSION=y
# CONFIG_GCOV_PROFILE_FTRACE is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
CONFIG_SYNTH_EVENT_GEN_TEST=y
# CONFIG_SAMPLES is not set
# CONFIG_STRICT_DEVMEM is not set

#
# mips Debugging
#
# CONFIG_EARLY_PRINTK is not set
CONFIG_CMDLINE_BOOL=y
CONFIG_CMDLINE=""
CONFIG_CMDLINE_OVERRIDE=y
CONFIG_SB1XXX_CORELIS=y
# CONFIG_SPINLOCK_TEST is not set
# CONFIG_SCACHE_DEBUGFS is not set
# end of mips Debugging

#
# Kernel Testing and Coverage
#
CONFIG_KUNIT=y
# CONFIG_KUNIT_DEBUGFS is not set
# CONFIG_KUNIT_TEST is not set
CONFIG_KUNIT_EXAMPLE_TEST=y
# CONFIG_KUNIT_ALL_TESTS is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
# CONFIG_FAULT_INJECTION is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_KCOV=y
# CONFIG_KCOV_ENABLE_COMPARISONS is not set
CONFIG_KCOV_INSTRUMENT_ALL=y
CONFIG_KCOV_IRQ_AREA_SIZE=0x40000
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_LKDTM is not set
CONFIG_TEST_LIST_SORT=y
# CONFIG_TEST_MIN_HEAP is not set
CONFIG_TEST_SORT=y
CONFIG_TEST_DIV64=y
# CONFIG_BACKTRACE_SELF_TEST is not set
CONFIG_TEST_REF_TRACKER=y
CONFIG_RBTREE_TEST=y
CONFIG_REED_SOLOMON_TEST=y
CONFIG_INTERVAL_TREE_TEST=y
CONFIG_ATOMIC64_SELFTEST=y
CONFIG_TEST_HEXDUMP=y
# CONFIG_STRING_SELFTEST is not set
CONFIG_TEST_STRING_HELPERS=y
# CONFIG_TEST_STRSCPY is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
CONFIG_TEST_SCANF=y
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_UUID is not set
CONFIG_TEST_XARRAY=y
# CONFIG_TEST_OVERFLOW is not set
CONFIG_TEST_RHASHTABLE=y
# CONFIG_TEST_SIPHASH is not set
# CONFIG_TEST_IDA is not set
CONFIG_TEST_PARMAN=y
CONFIG_FIND_BIT_BENCHMARK=y
CONFIG_TEST_FIRMWARE=y
# CONFIG_BITFIELD_KUNIT is not set
CONFIG_HASH_KUNIT_TEST=y
CONFIG_RESOURCE_KUNIT_TEST=y
CONFIG_SYSCTL_KUNIT_TEST=y
CONFIG_LIST_KUNIT_TEST=y
CONFIG_LINEAR_RANGES_TEST=y
CONFIG_CMDLINE_KUNIT_TEST=y
CONFIG_BITS_TEST=y
# CONFIG_SLUB_KUNIT_TEST is not set
CONFIG_RATIONAL_KUNIT_TEST=y
# CONFIG_MEMCPY_KUNIT_TEST is not set
CONFIG_TEST_UDELAY=y
CONFIG_TEST_MEMCAT_P=y
# CONFIG_TEST_OBJAGG is not set
# CONFIG_TEST_STACKINIT is not set
CONFIG_TEST_MEMINIT=y
CONFIG_TEST_FREE_PAGES=y
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage

CONFIG_WARN_MISSING_DOCUMENTS=y
# CONFIG_WARN_ABI_ERRORS is not set
# end of Kernel hacking

--6Bk/08D7I0JAAQn6--
