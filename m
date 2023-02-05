Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DD42772E
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Feb 2023 23:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675641462; x=1707177462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v0HwdKwARQNGGxUczX/B/61Gx9Wxm3XBNzY3hPwkpas=;
  b=IXSihJ4Hjzh5mfuMm7QmqjcPv5RVNtx7Lty+TX1KO5W1uXkWTeOxBirc
   WvSYBVapqTjnQr7uBsbQXzm6wxopE6g+tz2gRPXaz/Jfmx17rwswkVLSh
   WlestP++LuKH1c4Tyi+B2xLFIBywhTyId9YRNx60KQi/2oLxbPXZ97xHm
   Wbbe4mrVL9y5cH8AKKi5uqyqSS0FGTCAiU8mMlSjfmZ9HaCHpDbiZFLqk
   baQCAMciNG9a/4BYtT14pNMs6eqLvpG99i0wpiAOXJoPSyNgrz7RPUbQx
   Xd8O7RzSXBjc0lN6WVquXSy9uN66MbuuWeIUP2SqSvg5T6Pce3Xn8akg7
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="309436685"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="309436685"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 15:57:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="911752982"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="911752982"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 Feb 2023 15:57:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOotA-0002I4-02;
	Sun, 05 Feb 2023 23:57:40 +0000
Date: Mon, 6 Feb 2023 07:56:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/regulator/mt6357-regulator.c:142:16: warning: shift by
 negative count ('-1')
Message-ID: <202302060736.SWiuqZSq-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: drivers/regulator/mt6357-regulator.c:142:16: warning: shift by negative count ('-1') [-Wanalyzer-shift-count-negative]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Fabien Parent <fparent@baylibre.com>
CC: Mark Brown <broonie@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Alexandre Mergnat <amergnat@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4ec5183ec48656cec489c49f989c508b68b518e3
commit: dafc7cde23dca239987d3cd000b11cdccc3728ea regulator: add mt6357 regulator
date:   9 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 weeks ago
config: arm-randconfig-c002-20230205 (https://download.01.org/0day-ci/archive/20230206/202302060736.SWiuqZSq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dafc7cde23dca239987d3cd000b11cdccc3728ea
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout dafc7cde23dca239987d3cd000b11cdccc3728ea
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/regulator/mt6357-regulator.c: In function 'mt6357_get_buck_voltage_sel':
   drivers/regulator/mt6357-regulator.c:130:18: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     130 |         int ret, regval;
         |                  ^~~~~~
     'mt6357_get_buck_voltage_sel': event 1
       |
       |  130 |         int ret, regval;
       |      |                  ^~~~~~
       |      |                  |
       |      |                  (1) use of uninitialized value '<unknown>' here
       |
>> drivers/regulator/mt6357-regulator.c:142:16: warning: shift by negative count ('-1') [-Wanalyzer-shift-count-negative]
     142 |         regval >>= ffs(info->da_vsel_mask) - 1;
         |                ^~~
     'mt6357_get_buck_voltage_sel': events 1-4
       |
       |  128 | static int mt6357_get_buck_voltage_sel(struct regulator_dev *rdev)
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'mt6357_get_buck_voltage_sel'
       |......
       |  134 |         if (ret != 0) {
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'ret == 0')...
       |......
       |  141 |         regval &= info->da_vsel_mask;
       |      |         ~~~~~~
       |      |         |
       |      |         (3) ...to here
       |  142 |         regval >>= ffs(info->da_vsel_mask) - 1;
       |      |                    ~~~~~~~~~~~~~~~~~~~~~~~
       |      |                    |
       |      |                    (4) calling 'ffs' from 'mt6357_get_buck_voltage_sel'
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
     'mt6357_get_buck_voltage_sel': events 8-9
       |
       |drivers/regulator/mt6357-regulator.c:142:20:
       |  142 |         regval >>= ffs(info->da_vsel_mask) - 1;
       |      |                ~~~ ^~~~~~~~~~~~~~~~~~~~~~~
       |      |                |   |
       |      |                |   (8) returning to 'mt6357_get_buck_voltage_sel' from 'ffs'
       |      |                (9) shift by negative amount here ('-1')
       |

vim +142 drivers/regulator/mt6357-regulator.c

dafc7cde23dca2 Fabien Parent 2022-11-29  118  
dafc7cde23dca2 Fabien Parent 2022-11-29  119  /**
dafc7cde23dca2 Fabien Parent 2022-11-29  120   * mt6357_get_buck_voltage_sel - get_voltage_sel for regmap users
dafc7cde23dca2 Fabien Parent 2022-11-29  121   *
dafc7cde23dca2 Fabien Parent 2022-11-29  122   * @rdev: regulator to operate on
dafc7cde23dca2 Fabien Parent 2022-11-29  123   *
dafc7cde23dca2 Fabien Parent 2022-11-29  124   * Regulators that use regmap for their register I/O can set the
dafc7cde23dca2 Fabien Parent 2022-11-29  125   * da_vsel_reg and da_vsel_mask fields in the info structure and
dafc7cde23dca2 Fabien Parent 2022-11-29  126   * then use this as their get_voltage_vsel operation.
dafc7cde23dca2 Fabien Parent 2022-11-29  127   */
dafc7cde23dca2 Fabien Parent 2022-11-29  128  static int mt6357_get_buck_voltage_sel(struct regulator_dev *rdev)
dafc7cde23dca2 Fabien Parent 2022-11-29  129  {
dafc7cde23dca2 Fabien Parent 2022-11-29  130  	int ret, regval;
dafc7cde23dca2 Fabien Parent 2022-11-29  131  	struct mt6357_regulator_info *info = rdev_get_drvdata(rdev);
dafc7cde23dca2 Fabien Parent 2022-11-29  132  
dafc7cde23dca2 Fabien Parent 2022-11-29  133  	ret = regmap_read(rdev->regmap, info->da_vsel_reg, &regval);
dafc7cde23dca2 Fabien Parent 2022-11-29  134  	if (ret != 0) {
dafc7cde23dca2 Fabien Parent 2022-11-29  135  		dev_err(&rdev->dev,
dafc7cde23dca2 Fabien Parent 2022-11-29  136  			"Failed to get mt6357 Buck %s vsel reg: %d\n",
dafc7cde23dca2 Fabien Parent 2022-11-29  137  			info->desc.name, ret);
dafc7cde23dca2 Fabien Parent 2022-11-29  138  		return ret;
dafc7cde23dca2 Fabien Parent 2022-11-29  139  	}
dafc7cde23dca2 Fabien Parent 2022-11-29  140  
dafc7cde23dca2 Fabien Parent 2022-11-29  141  	regval &= info->da_vsel_mask;
dafc7cde23dca2 Fabien Parent 2022-11-29 @142  	regval >>= ffs(info->da_vsel_mask) - 1;
dafc7cde23dca2 Fabien Parent 2022-11-29  143  
dafc7cde23dca2 Fabien Parent 2022-11-29  144  	return regval;
dafc7cde23dca2 Fabien Parent 2022-11-29  145  }
dafc7cde23dca2 Fabien Parent 2022-11-29  146  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
