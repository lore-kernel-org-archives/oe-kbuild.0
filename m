Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAEE9456
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jul 2023 08:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690358748; x=1721894748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1VTPHkI1UULEBfZeipaHMldDfOpkPpz6Ylvua6osgzM=;
  b=YO5zLMAn3LOk+h1N9cN9ig3HDAfzw+kvNkDQSS1hMJgwJrnG1HI0/voM
   wuj7tUfWQRJX67Buu9NA4ms/eTaeGsL9qaV9rRSMvomrNB2WbeyZ6UpPZ
   guW9p51BjXVxSrae55plDaRXkoT8EvOEcaq+Wd0TE6ms9QVRBw39yQ43y
   ZvXBag9kHwsjST1rC59j5NDtaF+1Y0e7VWnEo2KN/eCXguN4xy7kMYAoY
   aC49z5CmD6tQafSCIv3M5zshBR/l2CB5c8+V+di3mbCu2CRYG3DTyJRhi
   12sblTjdwOOGwyq2olfnQzaNntKBPIj7xkrfQzrTN+cM+L9bLsl0ChC+h
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="371558438"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="371558438"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 01:05:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="729749068"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="729749068"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 26 Jul 2023 01:05:44 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOZWi-0000oX-0M;
	Wed, 26 Jul 2023 08:05:44 +0000
Date: Wed, 26 Jul 2023 16:05:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202307261503.baQhuiJ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/input/mouse/focaltech.c:135:37: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
References: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master crng-random/master v6.5-rc3 next-20230726]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-204940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/a09512c8526b46759669d0b879144563%40AcuMS.aculab.com
patch subject: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-x063-20230726 (https://download.01.org/0day-ci/archive/20230726/202307261503.baQhuiJ2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261503.baQhuiJ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307261503.baQhuiJ2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/input/mouse/focaltech.c:135:37: sparse: sparse: bad integer constant expression
>> drivers/input/mouse/focaltech.c:135:37: sparse: sparse: static assertion failed: "clamp() low limit 0U greater than high limit priv->x_max"
   drivers/input/mouse/focaltech.c:136:37: sparse: sparse: bad integer constant expression
>> drivers/input/mouse/focaltech.c:136:37: sparse: sparse: static assertion failed: "clamp() low limit 0U greater than high limit priv->y_max"
--
>> drivers/thermal/intel/intel_powerclamp.c:704:28: sparse: sparse: bad integer constant expression
>> drivers/thermal/intel/intel_powerclamp.c:704:28: sparse: sparse: static assertion failed: "clamp() low limit 0UL greater than high limit (unsigned long) (max_idle - 1)"
--
>> drivers/net/can/dev/calc_bittiming.c:39:25: sparse: sparse: bad integer constant expression
>> drivers/net/can/dev/calc_bittiming.c:39:25: sparse: sparse: static assertion failed: "clamp() low limit btc->tseg2_min greater than high limit btc->tseg2_max"

vim +135 drivers/input/mouse/focaltech.c

05be1d079ec0b3 Mathias Gottschlag 2014-12-29  114  
05be1d079ec0b3 Mathias Gottschlag 2014-12-29  115  static void focaltech_report_state(struct psmouse *psmouse)
05be1d079ec0b3 Mathias Gottschlag 2014-12-29  116  {
05be1d079ec0b3 Mathias Gottschlag 2014-12-29  117  	struct focaltech_data *priv = psmouse->private;
05be1d079ec0b3 Mathias Gottschlag 2014-12-29  118  	struct focaltech_hw_state *state = &priv->state;
05be1d079ec0b3 Mathias Gottschlag 2014-12-29  119  	struct input_dev *dev = psmouse->dev;
05be1d079ec0b3 Mathias Gottschlag 2014-12-29  120  	int i;
05be1d079ec0b3 Mathias Gottschlag 2014-12-29  121  
05be1d079ec0b3 Mathias Gottschlag 2014-12-29  122  	for (i = 0; i < FOC_MAX_FINGERS; i++) {
05be1d079ec0b3 Mathias Gottschlag 2014-12-29  123  		struct focaltech_finger_state *finger = &state->fingers[i];
05be1d079ec0b3 Mathias Gottschlag 2014-12-29  124  		bool active = finger->active && finger->valid;
05be1d079ec0b3 Mathias Gottschlag 2014-12-29  125  
05be1d079ec0b3 Mathias Gottschlag 2014-12-29  126  		input_mt_slot(dev, i);
05be1d079ec0b3 Mathias Gottschlag 2014-12-29  127  		input_mt_report_slot_state(dev, MT_TOOL_FINGER, active);
05be1d079ec0b3 Mathias Gottschlag 2014-12-29  128  		if (active) {
679d83ea939063 Mathias Gottschlag 2015-03-07  129  			unsigned int clamped_x, clamped_y;
679d83ea939063 Mathias Gottschlag 2015-03-07  130  			/*
679d83ea939063 Mathias Gottschlag 2015-03-07  131  			 * The touchpad might report invalid data, so we clamp
679d83ea939063 Mathias Gottschlag 2015-03-07  132  			 * the resulting values so that we do not confuse
679d83ea939063 Mathias Gottschlag 2015-03-07  133  			 * userspace.
679d83ea939063 Mathias Gottschlag 2015-03-07  134  			 */
679d83ea939063 Mathias Gottschlag 2015-03-07 @135  			clamped_x = clamp(finger->x, 0U, priv->x_max);
679d83ea939063 Mathias Gottschlag 2015-03-07 @136  			clamped_y = clamp(finger->y, 0U, priv->y_max);
679d83ea939063 Mathias Gottschlag 2015-03-07  137  			input_report_abs(dev, ABS_MT_POSITION_X, clamped_x);
05be1d079ec0b3 Mathias Gottschlag 2014-12-29  138  			input_report_abs(dev, ABS_MT_POSITION_Y,
679d83ea939063 Mathias Gottschlag 2015-03-07  139  					 priv->y_max - clamped_y);
85919a00e55f90 Dmitry Tunin       2015-05-31  140  			input_report_abs(dev, ABS_TOOL_WIDTH, state->width);
05be1d079ec0b3 Mathias Gottschlag 2014-12-29  141  		}
05be1d079ec0b3 Mathias Gottschlag 2014-12-29  142  	}
05be1d079ec0b3 Mathias Gottschlag 2014-12-29  143  	input_mt_report_pointer_emulation(dev, true);
05be1d079ec0b3 Mathias Gottschlag 2014-12-29  144  
324ae0958cab5c Dmitry Tunin       2016-10-24  145  	input_report_key(dev, BTN_LEFT, state->pressed);
324ae0958cab5c Dmitry Tunin       2016-10-24  146  	input_sync(dev);
05be1d079ec0b3 Mathias Gottschlag 2014-12-29  147  }
05be1d079ec0b3 Mathias Gottschlag 2014-12-29  148  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
