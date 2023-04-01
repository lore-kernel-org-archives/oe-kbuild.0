Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62823C39
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Apr 2023 16:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680365615; x=1711901615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nfpNjHam8cTqkT4wC6JGmEekhBBKqqQM1q6+F2XygB0=;
  b=oLD/oGHL+AIL3qTe2WWfqrjh943aunmIOzYcGIyJBl6wbRKJd9Lesy2S
   poqz99ArY8JrpSaCYtKJX3xVIvmFmw0JOyuWlRkoD6jN/hXeYEI6LN/Mr
   AZZvj7gA93rYjILxNIGELXUVCEoDCXPMsMkjjOLTzuss62aTPSNjeS/K7
   Zbks0o3MMpQ18d+a2cTxyObmMTyGrGlPOIr6zNajugk21GInRb7dkGkPP
   ELZAes1RX/Cx+oENgVx0mbrKr8CT1hJfiI53/65tVQOJjqQTiN/YFn7Ul
   XcxsGH9EqqVqiIReJ75+uxYKJRDRFLko58Y5b78kPcFaDWRch/H0zjiIx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="330224505"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="330224505"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 09:13:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="859690937"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="859690937"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Apr 2023 09:13:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pidrB-000Mu1-08;
	Sat, 01 Apr 2023 16:13:33 +0000
Date: Sun, 2 Apr 2023 00:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v11] ASoC: tas2781: Add tas2781 driver
Message-ID: <202304020020.afDwUH0G-lkp@intel.com>
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
In-Reply-To: <20230331114008.12522-1-13916275206@139.com>
References: <20230331114008.12522-1-13916275206@139.com>
TO: Shenghao Ding <13916275206@139.com>
TO: broonie@kernel.org
TO: lgirdwood@gmail.com
TO: perex@perex.cz
TO: pierre-louis.bossart@linux.intel.com
CC: kevin-lu@ti.com
CC: shenghao-ding@ti.com
CC: alsa-devel@alsa-project.org
CC: linux-kernel@vger.kernel.org
CC: x1077012@ti.com
CC: peeyush@ti.com
CC: navada@ti.com
CC: Shenghao Ding <13916275206@139.com>

Hi Shenghao,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.3-rc4 next-20230331]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenghao-Ding/ASoC-tas2781-Add-tas2781-driver/20230331-194316
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230331114008.12522-1-13916275206%40139.com
patch subject: [PATCH v11] ASoC: tas2781: Add tas2781 driver
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: nios2-randconfig-m031-20230329 (https://download.01.org/0day-ci/archive/20230402/202304020020.afDwUH0G-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304020020.afDwUH0G-lkp@intel.com/

smatch warnings:
sound/soc/codecs/tas2781-i2c.c:221 tasdevice_process_block() error: uninitialized symbol 'subblk_offset'.

vim +/subblk_offset +221 sound/soc/codecs/tas2781-i2c.c

cfbcc5ae5728b0 Shenghao Ding 2023-03-31   79  
cfbcc5ae5728b0 Shenghao Ding 2023-03-31   80  int tasdevice_process_block(void *context,
cfbcc5ae5728b0 Shenghao Ding 2023-03-31   81  	unsigned char *data, unsigned char dev_idx, int sublocksize)
cfbcc5ae5728b0 Shenghao Ding 2023-03-31   82  {
cfbcc5ae5728b0 Shenghao Ding 2023-03-31   83  	struct tasdevice_priv *tas_dev = (struct tasdevice_priv *)context;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31   84  	unsigned char subblk_typ = data[1];
cfbcc5ae5728b0 Shenghao Ding 2023-03-31   85  	bool is_err = false;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31   86  	int blktyp = dev_idx & 0xC0;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31   87  	int idx = dev_idx & 0x3F;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31   88  	int subblk_offset;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31   89  	int chn, chnend;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31   90  	int rc;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31   91  
cfbcc5ae5728b0 Shenghao Ding 2023-03-31   92  	if (idx) {
cfbcc5ae5728b0 Shenghao Ding 2023-03-31   93  		chn = idx - 1;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31   94  		chnend = idx;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31   95  	} else {
cfbcc5ae5728b0 Shenghao Ding 2023-03-31   96  		if (tas_dev->set_global_mode) {
cfbcc5ae5728b0 Shenghao Ding 2023-03-31   97  			chn = tas_dev->ndev;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31   98  			chnend = tas_dev->ndev + 1;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31   99  		} else {
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  100  			chn = 0;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  101  			chnend = tas_dev->ndev;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  102  		}
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  103  	}
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  104  
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  105  	for (; chn < chnend; chn++) {
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  106  		if (!tas_dev->set_global_mode &&
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  107  			tas_dev->tasdevice[chn].is_loading == false)
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  108  			continue;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  109  
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  110  		is_err = false;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  111  		subblk_offset = 2;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  112  		switch (subblk_typ) {
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  113  		case TASDEVICE_CMD_SING_W: {
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  114  			int i;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  115  			unsigned short len = be16_to_cpup((__be16 *)&data[2]);
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  116  
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  117  			subblk_offset += 2;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  118  			if (subblk_offset + 4 * len > sublocksize) {
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  119  				dev_err(tas_dev->dev,
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  120  					"process_block: Out of boundary\n");
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  121  				is_err = true;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  122  				break;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  123  			}
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  124  
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  125  			for (i = 0; i < len; i++) {
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  126  				rc = tasdevice_dev_write(tas_dev, chn,
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  127  					TASDEVICE_REG(data[subblk_offset],
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  128  						data[subblk_offset + 1],
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  129  						data[subblk_offset + 2]),
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  130  					data[subblk_offset + 3]);
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  131  				if (rc < 0) {
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  132  					is_err = true;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  133  					dev_err(tas_dev->dev,
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  134  					"process_block: single write error\n");
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  135  				}
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  136  				subblk_offset += 4;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  137  			}
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  138  		}
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  139  			break;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  140  		case TASDEVICE_CMD_BURST: {
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  141  			unsigned short len = be16_to_cpup((__be16 *)&data[2]);
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  142  
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  143  			subblk_offset += 2;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  144  			if (subblk_offset + 4 + len > sublocksize) {
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  145  				dev_err(tas_dev->dev,
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  146  					"%s: BST Out of boundary\n",
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  147  					__func__);
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  148  				is_err = true;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  149  				break;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  150  			}
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  151  			if (len % 4) {
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  152  				dev_err(tas_dev->dev,
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  153  					"%s:Bst-len(%u)not div by 4\n",
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  154  					__func__, len);
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  155  				break;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  156  			}
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  157  
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  158  			rc = tasdevice_dev_bulk_write(tas_dev, chn,
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  159  				TASDEVICE_REG(data[subblk_offset],
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  160  				data[subblk_offset + 1],
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  161  				data[subblk_offset + 2]),
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  162  				&(data[subblk_offset + 4]), len);
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  163  			if (rc < 0) {
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  164  				is_err = true;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  165  				dev_err(tas_dev->dev,
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  166  					"%s: bulk_write error = %d\n",
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  167  					__func__, rc);
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  168  			}
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  169  			subblk_offset += (len + 4);
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  170  		}
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  171  			break;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  172  		case TASDEVICE_CMD_DELAY: {
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  173  			unsigned int sleep_time = 0;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  174  
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  175  			if (subblk_offset + 2 > sublocksize) {
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  176  				dev_err(tas_dev->dev,
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  177  					"%s: delay Out of boundary\n",
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  178  					__func__);
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  179  				is_err = true;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  180  				break;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  181  			}
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  182  			sleep_time = be16_to_cpup((__be16 *)&data[2]) * 1000;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  183  			usleep_range(sleep_time, sleep_time + 50);
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  184  			subblk_offset += 2;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  185  		}
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  186  			break;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  187  		case TASDEVICE_CMD_FIELD_W:
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  188  			if (subblk_offset + 6 > sublocksize) {
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  189  				dev_err(tas_dev->dev,
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  190  					"%s: bit write Out of boundary\n",
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  191  					__func__);
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  192  				is_err = true;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  193  				break;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  194  			}
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  195  			rc = tasdevice_dev_update_bits(tas_dev, chn,
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  196  				TASDEVICE_REG(data[subblk_offset + 2],
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  197  				data[subblk_offset + 3],
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  198  				data[subblk_offset + 4]),
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  199  				data[subblk_offset + 1],
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  200  				data[subblk_offset + 5]);
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  201  			if (rc < 0) {
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  202  				is_err = true;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  203  				dev_err(tas_dev->dev,
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  204  					"%s: update_bits error = %d\n",
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  205  					__func__, rc);
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  206  			}
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  207  			subblk_offset += 6;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  208  			break;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  209  		default:
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  210  			break;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  211  		}
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  212  		if (is_err == true && blktyp != 0) {
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  213  			if (blktyp == 0x80) {
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  214  				tas_dev->tasdevice[chn].cur_prog = -1;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  215  				tas_dev->tasdevice[chn].cur_conf = -1;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  216  			} else
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  217  				tas_dev->tasdevice[chn].cur_conf = -1;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  218  		}
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  219  	}
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  220  
cfbcc5ae5728b0 Shenghao Ding 2023-03-31 @221  	return subblk_offset;
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  222  }
cfbcc5ae5728b0 Shenghao Ding 2023-03-31  223  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
