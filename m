Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2E133C7
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 15:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674057556; x=1705593556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CdpXmcR6DRJRsubytVvuf6z3qT1gmb/SPhxZ7jESKV4=;
  b=XC2J+JAnygFENVt/WmmR0ytzHXASTndJHLn02ZYJqI+I7D3XdW092Icb
   d8EX38iI6A4gLY6cPRCkSDBONH/VEjiUzC93ZxwA2ogDj1OZdBQoi7pqW
   p2z3XYGa2b6avZl5U07BEtHDIBKkTbmXDxZEC12rd4V3u4OPsKUErMJIO
   0Dr7HDCJ5xuwtxugq6uBC9rj650eFtyXfFWjPxVby06dkchmcEkqfdGbV
   /TCI1/I9ZF1baZrPSgVATI3cDyz93y80y56uj6T8CYS43pvUwSvGy4l8y
   CEOCxR2KMcGlwnIoDgl2xf4rLth8tkecryNO09MKTiu3ll7xsO+d7txm4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327088064"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="327088064"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 07:58:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="905154191"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="905154191"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 Jan 2023 07:58:54 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIApx-0000Tv-2c;
	Wed, 18 Jan 2023 15:58:53 +0000
Date: Wed, 18 Jan 2023 23:58:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: sound/soc/samsung/spdif.c:95:2: warning: unused function
 'component_to_info'
Message-ID: <202301182358.Ld1cBliY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "gcc: unused function warning for stub function"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Stephen Boyd <sboyd@kernel.org>
CC: Mark Brown <broonie@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c1649ec55708ae42091a2f1bca1ab49ecd722d55
commit: bbd7ffdbef6888459f301c5889f3b14ada38b913 clk: Allow the common clk framework to be selectable
date:   2 years, 8 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 2 years, 8 months ago
config: hexagon-randconfig-r005-20230118 (https://download.01.org/0day-ci/archive/20230118/202301182358.Ld1cBliY-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bbd7ffdbef6888459f301c5889f3b14ada38b913
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout bbd7ffdbef6888459f301c5889f3b14ada38b913
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/mmc/host/ sound/soc/samsung/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/samsung/spdif.c:95:2: warning: unused function 'component_to_info' [-Wunused-function]
   *component_to_info(struct snd_soc_component *component)
    ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FRAME_POINTER
   Depends on [n]: DEBUG_KERNEL [=y] && (M68K || UML || SUPERH) || ARCH_WANT_FRAME_POINTERS [=n]
   Selected by [y]:
   - LOCKDEP [=y] && DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y] && !MIPS && !PPC && !ARM && !S390 && !MICROBLAZE && !ARC && !X86


vim +/component_to_info +95 sound/soc/samsung/spdif.c

fc127ccccc5de1 sound/soc/s3c24xx/spdif.c Seungwhan Youn    2010-10-12  93  
79a5cf90f8719c sound/soc/samsung/spdif.c Kuninori Morimoto 2020-01-20  94  static inline struct samsung_spdif_info
79a5cf90f8719c sound/soc/samsung/spdif.c Kuninori Morimoto 2020-01-20 @95  *component_to_info(struct snd_soc_component *component)
79a5cf90f8719c sound/soc/samsung/spdif.c Kuninori Morimoto 2020-01-20  96  {
79a5cf90f8719c sound/soc/samsung/spdif.c Kuninori Morimoto 2020-01-20  97  	return snd_soc_component_get_drvdata(component);
79a5cf90f8719c sound/soc/samsung/spdif.c Kuninori Morimoto 2020-01-20  98  }
79a5cf90f8719c sound/soc/samsung/spdif.c Kuninori Morimoto 2020-01-20  99  

:::::: The code at line 95 was first introduced by commit
:::::: 79a5cf90f8719c3f69a0dc53efebb38da654512f ASoC: samsung: spdif: move .suspend/.resume to component

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
