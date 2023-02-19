Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B967229AC
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 21:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676840567; x=1708376567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y+UoF0Hu9gRHOwnkaGpQsIxV8sMQDX1wvxHIIf0Og18=;
  b=kP2MazAemSrZc55CZoKlgjGQl7OdLI1U7zorCK4WNRImDl7SidE5MUan
   uWnCzAo2KiAfM3RPpkKYuBL7ATYhhYrhLBiwbSGcjEaETjAd26lWkkqI+
   H3I5IQcYO15ieDiJgO/O++THJ+XWI0dq11EvUrNmgfze72FVRgF9GFb+n
   1V/Fb4Msw+IcLGiOJ4wltFC7T6D5y8w9IHmS8OlbVHiSckdYU9aKAFR/Q
   bjR8iNVuo/3jJTVAIqmHFky0KPYAgSd/DfcLz2Qu2kYjd/yHklXo3OOpu
   hf31CAXCZGVq91Zapl565wYg6AOSw3OeNLHjwr4AFLtSMuWkhuBQSVYVy
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="320404406"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="320404406"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 13:02:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="701479551"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="701479551"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Feb 2023 13:02:45 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTqpZ-000DS7-07;
	Sun, 19 Feb 2023 21:02:45 +0000
Date: Mon, 20 Feb 2023 05:02:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/input/keyboard/mtk-pmic-keys.c:127:15: warning: shift by
 negative count ('-1')
Message-ID: <202302200408.UCe7gTac-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: drivers/input/keyboard/mtk-pmic-keys.c:127:15: warning: shift by negative count ('-1') [-Wanalyzer-shift-count-negative]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Mattijs Korpershoek <mkorpershoek@baylibre.com>

Hi AngeloGioacchino,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   925cf0457d7e62ce08878ffb789189ac08ca8677
commit: 69cf890d8b283c8d3a77d28dbd3024f58ae236a9 Input: mtk-pmic-keys - move long press debounce mask to mtk_pmic_regs
date:   9 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20230219 (https://download.01.org/0day-ci/archive/20230220/202302200408.UCe7gTac-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=69cf890d8b283c8d3a77d28dbd3024f58ae236a9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 69cf890d8b283c8d3a77d28dbd3024f58ae236a9
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302200408.UCe7gTac-lkp@intel.com/

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/input/keyboard/mtk-pmic-keys.c: In function 'mtk_pmic_keys_lp_reset_setup':
   drivers/input/keyboard/mtk-pmic-keys.c:114:13: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     114 |         u32 long_press_mode, long_press_debounce;
         |             ^~~~~~~~~~~~~~~
     'mtk_pmic_keys_lp_reset_setup': event 1
       |
       |  114 |         u32 long_press_mode, long_press_debounce;
       |      |             ^~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/input/keyboard/mtk-pmic-keys.c:114:30: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     114 |         u32 long_press_mode, long_press_debounce;
         |                              ^~~~~~~~~~~~~~~~~~~
     'mtk_pmic_keys_lp_reset_setup': event 1
       |
       |  114 |         u32 long_press_mode, long_press_debounce;
       |      |                              ^~~~~~~~~~~~~~~~~~~
       |      |                              |
       |      |                              (1) use of uninitialized value '<unknown>' here
       |
>> drivers/input/keyboard/mtk-pmic-keys.c:127:15: warning: shift by negative count ('-1') [-Wanalyzer-shift-count-negative]
     127 |         value = long_press_debounce << (ffs(regs->rst_lprst_mask) - 1);
         |         ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'mtk_pmic_keys_lp_reset_setup': events 1-2
       |
       |  110 | static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'mtk_pmic_keys_lp_reset_setup'
       |......
       |  127 |         value = long_press_debounce << (ffs(regs->rst_lprst_mask) - 1);
       |      |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                         |
       |      |                                         (2) calling 'ffs' from 'mtk_pmic_keys_lp_reset_setup'
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
     'mtk_pmic_keys_lp_reset_setup': events 6-7
       |
       |drivers/input/keyboard/mtk-pmic-keys.c:127:41:
       |  127 |         value = long_press_debounce << (ffs(regs->rst_lprst_mask) - 1);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |                         |
       |      |               |                         (6) returning to 'mtk_pmic_keys_lp_reset_setup' from 'ffs'
       |      |               (7) shift by negative amount here ('-1')
       |
   drivers/input/keyboard/mtk-pmic-keys.c: In function 'mtk_pmic_keys_irq_handler_thread':
   drivers/input/keyboard/mtk-pmic-keys.c:159:13: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     159 |         u32 key_deb, pressed;
         |             ^~~~~~~
     'mtk_pmic_keys_irq_handler_thread': event 1
       |
       |  159 |         u32 key_deb, pressed;
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |

vim +127 drivers/input/keyboard/mtk-pmic-keys.c

3e9f0b3e2b27c0 Chen Zhong                 2017-10-25  109  
3e9f0b3e2b27c0 Chen Zhong                 2017-10-25  110  static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
69cf890d8b283c AngeloGioacchino Del Regno 2022-05-31  111  					 const struct mtk_pmic_regs *regs)
3e9f0b3e2b27c0 Chen Zhong                 2017-10-25  112  {
b581acb49aec5c AngeloGioacchino Del Regno 2022-05-31  113  	const struct mtk_pmic_keys_regs *kregs_home, *kregs_pwr;
3e9f0b3e2b27c0 Chen Zhong                 2017-10-25  114  	u32 long_press_mode, long_press_debounce;
2a0a5828b98a91 Dmitry Torokhov            2022-05-25  115  	u32 value, mask;
2a0a5828b98a91 Dmitry Torokhov            2022-05-25  116  	int error;
3e9f0b3e2b27c0 Chen Zhong                 2017-10-25  117  
b581acb49aec5c AngeloGioacchino Del Regno 2022-05-31  118  	kregs_home = keys->keys[MTK_PMIC_HOMEKEY_INDEX].regs;
b581acb49aec5c AngeloGioacchino Del Regno 2022-05-31  119  	kregs_pwr = keys->keys[MTK_PMIC_PWRKEY_INDEX].regs;
b581acb49aec5c AngeloGioacchino Del Regno 2022-05-31  120  
2a0a5828b98a91 Dmitry Torokhov            2022-05-25  121  	error = of_property_read_u32(keys->dev->of_node, "power-off-time-sec",
2a0a5828b98a91 Dmitry Torokhov            2022-05-25  122  				     &long_press_debounce);
2a0a5828b98a91 Dmitry Torokhov            2022-05-25  123  	if (error)
3e9f0b3e2b27c0 Chen Zhong                 2017-10-25  124  		long_press_debounce = 0;
3e9f0b3e2b27c0 Chen Zhong                 2017-10-25  125  
69cf890d8b283c AngeloGioacchino Del Regno 2022-05-31  126  	mask = regs->rst_lprst_mask;
69cf890d8b283c AngeloGioacchino Del Regno 2022-05-31 @127  	value = long_press_debounce << (ffs(regs->rst_lprst_mask) - 1);
3e9f0b3e2b27c0 Chen Zhong                 2017-10-25  128  
2a0a5828b98a91 Dmitry Torokhov            2022-05-25  129  	error  = of_property_read_u32(keys->dev->of_node,
2a0a5828b98a91 Dmitry Torokhov            2022-05-25  130  				      "mediatek,long-press-mode",
2a0a5828b98a91 Dmitry Torokhov            2022-05-25  131  				      &long_press_mode);
2a0a5828b98a91 Dmitry Torokhov            2022-05-25  132  	if (error)
3e9f0b3e2b27c0 Chen Zhong                 2017-10-25  133  		long_press_mode = LP_DISABLE;
3e9f0b3e2b27c0 Chen Zhong                 2017-10-25  134  
3e9f0b3e2b27c0 Chen Zhong                 2017-10-25  135  	switch (long_press_mode) {
3e9f0b3e2b27c0 Chen Zhong                 2017-10-25  136  	case LP_TWOKEY:
b581acb49aec5c AngeloGioacchino Del Regno 2022-05-31  137  		value |= kregs_home->rst_en_mask;
2a0a5828b98a91 Dmitry Torokhov            2022-05-25  138  		fallthrough;
2a0a5828b98a91 Dmitry Torokhov            2022-05-25  139  
2a0a5828b98a91 Dmitry Torokhov            2022-05-25  140  	case LP_ONEKEY:
b581acb49aec5c AngeloGioacchino Del Regno 2022-05-31  141  		value |= kregs_pwr->rst_en_mask;
2a0a5828b98a91 Dmitry Torokhov            2022-05-25  142  		fallthrough;
2a0a5828b98a91 Dmitry Torokhov            2022-05-25  143  
3e9f0b3e2b27c0 Chen Zhong                 2017-10-25  144  	case LP_DISABLE:
b581acb49aec5c AngeloGioacchino Del Regno 2022-05-31  145  		mask |= kregs_home->rst_en_mask;
b581acb49aec5c AngeloGioacchino Del Regno 2022-05-31  146  		mask |= kregs_pwr->rst_en_mask;
3e9f0b3e2b27c0 Chen Zhong                 2017-10-25  147  		break;
2a0a5828b98a91 Dmitry Torokhov            2022-05-25  148  
3e9f0b3e2b27c0 Chen Zhong                 2017-10-25  149  	default:
3e9f0b3e2b27c0 Chen Zhong                 2017-10-25  150  		break;
3e9f0b3e2b27c0 Chen Zhong                 2017-10-25  151  	}
2a0a5828b98a91 Dmitry Torokhov            2022-05-25  152  
69cf890d8b283c AngeloGioacchino Del Regno 2022-05-31  153  	regmap_update_bits(keys->regmap, regs->pmic_rst_reg, mask, value);
3e9f0b3e2b27c0 Chen Zhong                 2017-10-25  154  }
3e9f0b3e2b27c0 Chen Zhong                 2017-10-25  155  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
