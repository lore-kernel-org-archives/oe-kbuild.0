Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C3C7B
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Feb 2023 17:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675703652; x=1707239652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R5wE8X1CAnynMSCvTL+vuYbZCTkTj85QNWOV25jdg88=;
  b=bAYgNFBRNrMnhgcWFa3jPunituSk0TF2c041J5XyJHNrBCw9lZvPvlgG
   /WNU4bvxl/fjHZcos/eTorHsL9luYVW408OvVD2bMFp4mbnAWrLI4ul1j
   FrQ/sm4NgVn08Vc4EvzFa1PUcLPu6rres7FsZRWb19IiC3rNta8CMER1G
   +UdCMQ0gsB4Sv69Id8I7oB8tSuFVUYFMc1U9CDaPFHiMTyVx8mu9T7WtB
   NN6SIMk5r7A2yLHRWZ33DlSi0R20dK0VJDLq3BtwXw+fPDZw5/CZfR992
   sovTs95KHJh2/MMV4tqkAOwbYmmTEsrWlkBkW/lKG1l9kwMFqYHZuPvTI
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="327893257"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="327893257"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 09:14:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="668467481"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="668467481"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Feb 2023 09:14:06 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP54A-0002go-1D;
	Mon, 06 Feb 2023 17:14:06 +0000
Date: Tue, 7 Feb 2023 01:14:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/regulator/mt6331-regulator.c:237:13: warning: shift by
 negative count ('-1')
Message-ID: <202302070144.jcA8UN8a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/regulator/mt6331-regulator.c:237:13: warning: shift by negative count ('-1') [-Wanalyzer-shift-count-negative]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2d11f342b179f1894a901f143ec7c008caba43e
commit: 6f7a71f804287a7566314ab1a73d8ca2c18ca0d7 regulator: Add driver for MT6331 PMIC regulators
date:   5 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20230205 (https://download.01.org/0day-ci/archive/20230207/202302070144.jcA8UN8a-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6f7a71f804287a7566314ab1a73d8ca2c18ca0d7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6f7a71f804287a7566314ab1a73d8ca2c18ca0d7
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/regulator/mt6331-regulator.c: In function 'mt6331_get_status':
   drivers/regulator/mt6331-regulator.c:209:13: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     209 |         u32 regval;
         |             ^~~~~~
     'mt6331_get_status': event 1
       |
       |  209 |         u32 regval;
       |      |             ^~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/regulator/mt6331-regulator.c: In function 'mt6331_ldo_set_mode':
>> drivers/regulator/mt6331-regulator.c:237:13: warning: shift by negative count ('-1') [-Wanalyzer-shift-count-negative]
     237 |         val <<= ffs(info->modeset_mask) - 1;
         |             ^~~
     'mt6331_ldo_set_mode': events 1-2
       |
       |  221 | static int mt6331_ldo_set_mode(struct regulator_dev *rdev, unsigned int mode)
       |      |            ^~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'mt6331_ldo_set_mode'
       |......
       |  237 |         val <<= ffs(info->modeset_mask) - 1;
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (2) calling 'ffs' from 'mt6331_ldo_set_mode'
       |
       +--> 'ffs': events 3-4
              |
              |include/asm-generic/bitops/ffs.h:13:19:
              |   13 | static inline int ffs(int x)
              |      |                   ^~~
              |      |                   |
              |      |                   (3) entry to 'ffs'
              |......
              |   17 |         if (!x)
              |      |            ~       
              |      |            |
              |      |            (4) following 'true' branch (when 'x == 0')...
              |
            'ffs': event 5
              |
              |cc1:
              | (5): ...to here
              |
       <------+
       |
     'mt6331_ldo_set_mode': events 6-7
       |
       |drivers/regulator/mt6331-regulator.c:237:17:
       |  237 |         val <<= ffs(info->modeset_mask) - 1;
       |      |             ~~~ ^~~~~~~~~~~~~~~~~~~~~~~
       |      |             |   |
       |      |             |   (6) returning to 'mt6331_ldo_set_mode' from 'ffs'
       |      |             (7) shift by negative amount here ('-1')
       |
   drivers/regulator/mt6331-regulator.c: In function 'mt6331_ldo_get_mode':
   drivers/regulator/mt6331-regulator.c:246:22: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     246 |         unsigned int val;
         |                      ^~~
     'mt6331_ldo_get_mode': event 1
       |
       |  246 |         unsigned int val;
       |      |                      ^~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unknown>' here
       |
   drivers/regulator/mt6331-regulator.c:254:13: warning: shift by negative count ('-1') [-Wanalyzer-shift-count-negative]
     254 |         val >>= ffs(info->modeset_mask) - 1;
         |             ^~~
     'mt6331_ldo_get_mode': events 1-4
       |
       |  243 | static unsigned int mt6331_ldo_get_mode(struct regulator_dev *rdev)
       |      |                     ^~~~~~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (1) entry to 'mt6331_ldo_get_mode'
       |......
       |  250 |         if (ret < 0)
       |      |            ~         
       |      |            |
       |      |            (2) following 'false' branch (when 'ret >= 0')...
       |......
       |  253 |         val &= info->modeset_mask;
       |      |         ~~~          
       |      |         |
       |      |         (3) ...to here
       |  254 |         val >>= ffs(info->modeset_mask) - 1;
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (4) calling 'ffs' from 'mt6331_ldo_get_mode'
       |
       +--> 'ffs': events 5-6
              |
              |include/asm-generic/bitops/ffs.h:13:19:
              |   13 | static inline int ffs(int x)
              |      |                   ^~~
              |      |                   |
              |      |                   (5) entry to 'ffs'
              |......
              |   17 |         if (!x)
              |      |            ~       
              |      |            |
              |      |            (6) following 'true' branch (when 'x == 0')...
              |
            'ffs': event 7
              |
              |cc1:
              | (7): ...to here
              |
       <------+
       |
     'mt6331_ldo_get_mode': events 8-9
       |

vim +237 drivers/regulator/mt6331-regulator.c

6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13  220  
6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13  221  static int mt6331_ldo_set_mode(struct regulator_dev *rdev, unsigned int mode)
6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13  222  {
6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13  223  	struct mt6331_regulator_info *info = rdev_get_drvdata(rdev);
6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13  224  	int val;
6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13  225  
6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13  226  	switch (mode) {
6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13  227  	case REGULATOR_MODE_STANDBY:
6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13  228  		val = MT6331_LDO_MODE_LP;
6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13  229  		break;
6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13  230  	case REGULATOR_MODE_NORMAL:
6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13  231  		val = MT6331_LDO_MODE_NORMAL;
6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13  232  		break;
6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13  233  	default:
6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13  234  		return -EINVAL;
6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13  235  	}
6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13  236  
6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13 @237  	val <<= ffs(info->modeset_mask) - 1;
6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13  238  
6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13  239  	return regmap_update_bits(rdev->regmap, info->modeset_reg,
6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13  240  				  info->modeset_mask, val);
6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13  241  }
6f7a71f804287a AngeloGioacchino Del Regno 2022-09-13  242  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
