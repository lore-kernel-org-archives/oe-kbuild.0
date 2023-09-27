Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689AF1C20
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Sep 2023 01:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695779063; x=1727315063;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=42QRuBhFhLvH0k31XDiFiVmYoTbsOsVbg15kJnb8NT4=;
  b=mr6U0oa9kourhGCFzPWPXOIpHzsWlc6xJUWRV6A1NS4gJZIEWs/uodM9
   HP9gXiNlUsBiyIrHoLFKNbJhwglVhVE4q20MWBs/em/nUlkc1TNbFvyno
   SfB6LWKuwDVJSM7wboM9D8lNtaKymee3plq/kTIkdv2GMrmQOovKzANPk
   D8TibIayDEkY6zm7QoT/0AevQYvdMyL86qtk5fsOJCMml/MkhIXPg5ZVb
   1jODQLCjSDGjeb2mpNqWayeRYOU0NaobDN7HvuUkZFWyFIwmhZjtS+VQv
   ddy1jdPwsQEIq/exs/kG4geDq35J1RioUndBAFF6KmArnE7nIfLcoBfe7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="381606178"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="381606178"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 18:43:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="742536044"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="742536044"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 26 Sep 2023 18:43:49 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlJad-0003ZD-2F;
	Wed, 27 Sep 2023 01:43:47 +0000
Date: Wed, 27 Sep 2023 09:43:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] trigger: ledtrig-tty: add new line mode to triggers
Message-ID: <202309270921.wW6DyJDu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/leds/trigger/ledtrig-tty.c:362:17: sparse: sparse: typename in expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230926093607.59536-3-fe@dev.tdt.de>
References: <20230926093607.59536-3-fe@dev.tdt.de>
TO: Florian Eckert <fe@dev.tdt.de>
TO: Eckert.Florian@googlemail.com
TO: gregkh@linuxfoundation.org
TO: jirislaby@kernel.org
TO: pavel@ucw.cz
TO: lee@kernel.org
TO: kabel@kernel.org
TO: u.kleine-koenig@pengutronix.de
CC: linux-kernel@vger.kernel.org
CC: linux-serial@vger.kernel.org
CC: linux-leds@vger.kernel.org

Hi Florian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus staging/staging-testing staging/staging-next staging/staging-linus linus/master v6.6-rc3 next-20230926]
[cannot apply to pavel-leds/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Eckert/tty-add-new-helper-function-tty_get_mget/20230926-180154
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20230926093607.59536-3-fe%40dev.tdt.de
patch subject: [PATCH 2/2] trigger: ledtrig-tty: add new line mode to triggers
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-123-20230927 (https://download.01.org/0day-ci/archive/20230927/202309270921.wW6DyJDu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309270921.wW6DyJDu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309270921.wW6DyJDu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/leds/trigger/ledtrig-tty.c:362:17: sparse: sparse: typename in expression
   drivers/leds/trigger/ledtrig-tty.c:362:26: sparse: sparse: Expected ; at end of statement
   drivers/leds/trigger/ledtrig-tty.c:362:26: sparse: sparse: got long
   drivers/leds/trigger/ledtrig-tty.c:362:17: sparse: sparse: undefined identifier 'unsigned'
   drivers/leds/trigger/ledtrig-tty.c:363:64: sparse: sparse: undefined identifier 'interval'

vim +362 drivers/leds/trigger/ledtrig-tty.c

7c8a6442409e77b Florian Eckert   2023-09-26  270  
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  271  static void ledtrig_tty_work(struct work_struct *work)
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  272  {
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  273  	struct ledtrig_tty_data *trigger_data =
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  274  		container_of(work, struct ledtrig_tty_data, dwork.work);
7c8a6442409e77b Florian Eckert   2023-09-26  275  	struct led_classdev *led_cdev = trigger_data->led_cdev;
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  276  	struct serial_icounter_struct icount;
7c8a6442409e77b Florian Eckert   2023-09-26  277  	enum tty_led_state state;
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  278  	int ret;
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  279  
7c8a6442409e77b Florian Eckert   2023-09-26  280  	state = TTY_LED_DISABLE;
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  281  	mutex_lock(&trigger_data->mutex);
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  282  
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  283  	if (!trigger_data->ttyname) {
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  284  		/* exit without rescheduling */
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  285  		mutex_unlock(&trigger_data->mutex);
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  286  		return;
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  287  	}
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  288  
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  289  	/* try to get the tty corresponding to $ttyname */
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  290  	if (!trigger_data->tty) {
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  291  		dev_t devno;
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  292  		struct tty_struct *tty;
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  293  		int ret;
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  294  
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  295  		ret = tty_dev_name_to_number(trigger_data->ttyname, &devno);
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  296  		if (ret < 0)
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  297  			/*
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  298  			 * A device with this name might appear later, so keep
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  299  			 * retrying.
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  300  			 */
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  301  			goto out;
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  302  
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  303  		tty = tty_kopen_shared(devno);
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  304  		if (IS_ERR(tty) || !tty)
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  305  			/* What to do? retry or abort */
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  306  			goto out;
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  307  
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  308  		trigger_data->tty = tty;
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  309  	}
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  310  
7c8a6442409e77b Florian Eckert   2023-09-26  311  	if (test_bit(LEDTRIG_TTY_MODE_CTS, &trigger_data->mode)) {
7c8a6442409e77b Florian Eckert   2023-09-26  312  		ret = ledtrig_tty_flag(trigger_data, TIOCM_CTS);
7c8a6442409e77b Florian Eckert   2023-09-26  313  		if (ret)
7c8a6442409e77b Florian Eckert   2023-09-26  314  			state = TTY_LED_ENABLE;
7c8a6442409e77b Florian Eckert   2023-09-26  315  	}
7c8a6442409e77b Florian Eckert   2023-09-26  316  
7c8a6442409e77b Florian Eckert   2023-09-26  317  	if (test_bit(LEDTRIG_TTY_MODE_DSR, &trigger_data->mode)) {
7c8a6442409e77b Florian Eckert   2023-09-26  318  		ret = ledtrig_tty_flag(trigger_data, TIOCM_DSR);
7c8a6442409e77b Florian Eckert   2023-09-26  319  		if (ret)
7c8a6442409e77b Florian Eckert   2023-09-26  320  			state = TTY_LED_ENABLE;
7c8a6442409e77b Florian Eckert   2023-09-26  321  	}
7c8a6442409e77b Florian Eckert   2023-09-26  322  
7c8a6442409e77b Florian Eckert   2023-09-26  323  	if (test_bit(LEDTRIG_TTY_MODE_CAR, &trigger_data->mode)) {
7c8a6442409e77b Florian Eckert   2023-09-26  324  		ret = ledtrig_tty_flag(trigger_data, TIOCM_CAR);
7c8a6442409e77b Florian Eckert   2023-09-26  325  		if (ret)
7c8a6442409e77b Florian Eckert   2023-09-26  326  			state = TTY_LED_ENABLE;
7c8a6442409e77b Florian Eckert   2023-09-26  327  	}
7c8a6442409e77b Florian Eckert   2023-09-26  328  
7c8a6442409e77b Florian Eckert   2023-09-26  329  	if (test_bit(LEDTRIG_TTY_MODE_RNG, &trigger_data->mode)) {
7c8a6442409e77b Florian Eckert   2023-09-26  330  		ret = ledtrig_tty_flag(trigger_data, TIOCM_RNG);
7c8a6442409e77b Florian Eckert   2023-09-26  331  		if (ret)
7c8a6442409e77b Florian Eckert   2023-09-26  332  			state = TTY_LED_ENABLE;
7c8a6442409e77b Florian Eckert   2023-09-26  333  	}
7c8a6442409e77b Florian Eckert   2023-09-26  334  
7c8a6442409e77b Florian Eckert   2023-09-26  335  	/* The rx/tx handling must come after the evaluation of TIOCM_*,
7c8a6442409e77b Florian Eckert   2023-09-26  336  	 * since the display for rx/tx has priority
7c8a6442409e77b Florian Eckert   2023-09-26  337  	 */
7c8a6442409e77b Florian Eckert   2023-09-26  338  	if (test_bit(LEDTRIG_TTY_MODE_TX, &trigger_data->mode) ||
7c8a6442409e77b Florian Eckert   2023-09-26  339  	    test_bit(LEDTRIG_TTY_MODE_RX, &trigger_data->mode)) {
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  340  		ret = tty_get_icount(trigger_data->tty, &icount);
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  341  		if (ret) {
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  342  			dev_info(trigger_data->tty->dev, "Failed to get icount, stopped polling\n");
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  343  			mutex_unlock(&trigger_data->mutex);
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  344  			return;
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  345  		}
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  346  
7c8a6442409e77b Florian Eckert   2023-09-26  347  		if (test_bit(LEDTRIG_TTY_MODE_TX, &trigger_data->mode) &&
7c8a6442409e77b Florian Eckert   2023-09-26  348  		    (icount.tx != trigger_data->tx)) {
7c8a6442409e77b Florian Eckert   2023-09-26  349  			trigger_data->tx = icount.tx;
7c8a6442409e77b Florian Eckert   2023-09-26  350  			state = TTY_LED_BLINK;
7c8a6442409e77b Florian Eckert   2023-09-26  351  		}
7c8a6442409e77b Florian Eckert   2023-09-26  352  
7c8a6442409e77b Florian Eckert   2023-09-26  353  		if (test_bit(LEDTRIG_TTY_MODE_RX, &trigger_data->mode) &&
7c8a6442409e77b Florian Eckert   2023-09-26  354  		    (icount.rx != trigger_data->rx)) {
7c8a6442409e77b Florian Eckert   2023-09-26  355  			trigger_data->rx = icount.rx;
7c8a6442409e77b Florian Eckert   2023-09-26  356  			state = TTY_LED_BLINK;
7c8a6442409e77b Florian Eckert   2023-09-26  357  		}
7c8a6442409e77b Florian Eckert   2023-09-26  358  	}
730094577e0c37e Marek Behún      2023-08-02  359  
7c8a6442409e77b Florian Eckert   2023-09-26  360  	switch (state) {
7c8a6442409e77b Florian Eckert   2023-09-26  361  	case TTY_LED_BLINK:
7c8a6442409e77b Florian Eckert   2023-09-26 @362  		unsigned long interval = LEDTRIG_TTY_INTERVAL;
730094577e0c37e Marek Behún      2023-08-02  363  		led_blink_set_oneshot(trigger_data->led_cdev, &interval,
730094577e0c37e Marek Behún      2023-08-02  364  				      &interval, 0);
7c8a6442409e77b Florian Eckert   2023-09-26  365  		break;
7c8a6442409e77b Florian Eckert   2023-09-26  366  	case TTY_LED_ENABLE:
7c8a6442409e77b Florian Eckert   2023-09-26  367  		led_set_brightness(led_cdev, led_cdev->blink_brightness);
7c8a6442409e77b Florian Eckert   2023-09-26  368  		break;
7c8a6442409e77b Florian Eckert   2023-09-26  369  	case TTY_LED_DISABLE:
7c8a6442409e77b Florian Eckert   2023-09-26  370  		fallthrough;
7c8a6442409e77b Florian Eckert   2023-09-26  371  	default:
7c8a6442409e77b Florian Eckert   2023-09-26  372  		led_set_brightness(led_cdev, 0);
7c8a6442409e77b Florian Eckert   2023-09-26  373  		break;
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  374  	}
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  375  
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  376  out:
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  377  	mutex_unlock(&trigger_data->mutex);
730094577e0c37e Marek Behún      2023-08-02  378  	schedule_delayed_work(&trigger_data->dwork,
730094577e0c37e Marek Behún      2023-08-02  379  			      msecs_to_jiffies(LEDTRIG_TTY_INTERVAL * 2));
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  380  }
fd4a641ac88fbba Uwe Kleine-König 2021-01-13  381  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
