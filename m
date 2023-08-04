Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6A2134B3
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Aug 2023 15:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691162982; x=1722698982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u6Q3T+uujBm24k/Y+FDt364Ilewt7J9dJMmL2DBAuQs=;
  b=W3GxNPUykdB6G4beSVP7O0xHKAlxe94wcQvYcqd0jY3C/zWyCp7naALx
   AqCHy2BUAmtvIY1cBq0f8UILg2FeHjjAuE1bsNBX6Nkx4t2y1jN1vI6jP
   zUaeGV9aZ+g0LR1PYVrZ9MR74rH70dtUzqMfzw4u9nfOXbmL77bYkN+dJ
   Q82zKS8v/yWbiz7E5Y7xTFSIsWUj636/5PLeRp/fAuPatpsUZM5Fk82jt
   ZB6tGjXpkbTNKpwBy06YW/FMlXYwFkenFBlQuKRs9zAQE0AJ9ls6Irflc
   kxQJA2vxB/dOOz1FAuAcQrUxgPsEfF3BHuSc5WtUV1zjM31JckWCicR/G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="372924421"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="372924421"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 08:29:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="976622867"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="976622867"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Aug 2023 08:29:38 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRwkD-0002vL-0p;
	Fri, 04 Aug 2023 15:29:37 +0000
Date: Fri, 4 Aug 2023 23:28:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 4/7] leds: rgb: leds-qcom-lpg: Add support for PPG
 through single SDAM
Message-ID: <202308042335.4wMVE3vV-lkp@intel.com>
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
In-Reply-To: <20230725193423.25047-5-quic_amelende@quicinc.com>
References: <20230725193423.25047-5-quic_amelende@quicinc.com>
TO: Anjelique Melendez <quic_amelende@quicinc.com>
TO: pavel@ucw.cz
TO: lee@kernel.org
TO: thierry.reding@gmail.com
TO: robh+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: conor+dt@kernel.org
TO: agross@kernel.org
TO: andersson@kernel.org
CC: luca.weiss@fairphone.com
CC: konrad.dybcio@linaro.org
CC: u.kleine-koenig@pengutronix.de
CC: quic_subbaram@quicinc.com
CC: linux-leds@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: linux-pwm@vger.kernel.org
CC: Anjelique Melendez <quic_amelende@quicinc.com>

Hi Anjelique,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on lee-leds/for-leds-next linus/master v6.5-rc4 next-20230804]
[cannot apply to pavel-leds/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anjelique-Melendez/dt-bindings-soc-qcom-Add-qcom-pbs-bindings/20230726-034011
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230725193423.25047-5-quic_amelende%40quicinc.com
patch subject: [PATCH v2 4/7] leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: x86_64-randconfig-m001-20230803 (https://download.01.org/0day-ci/archive/20230804/202308042335.4wMVE3vV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308042335.4wMVE3vV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308042335.4wMVE3vV-lkp@intel.com/

smatch warnings:
drivers/leds/rgb/leds-qcom-lpg.c:1040 lpg_pattern_set() warn: potentially one past the end of array 'pattern[i]'
drivers/leds/rgb/leds-qcom-lpg.c:1040 lpg_pattern_set() warn: potentially one past the end of array 'pattern[i]'
drivers/leds/rgb/leds-qcom-lpg.c:1077 lpg_pattern_set() error: uninitialized symbol 'lo_pause'.
drivers/leds/rgb/leds-qcom-lpg.c:1078 lpg_pattern_set() error: uninitialized symbol 'hi_pause'.
drivers/leds/rgb/leds-qcom-lpg.c:1559 lpg_init_sdam() error: uninitialized symbol 'rc'.

vim +1040 drivers/leds/rgb/leds-qcom-lpg.c

24e2d05d1b6898 Bjorn Andersson    2022-03-03   924  
e98a860f65428a Bjorn Andersson    2022-05-23   925  static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
24e2d05d1b6898 Bjorn Andersson    2022-03-03   926  			   u32 len, int repeat)
24e2d05d1b6898 Bjorn Andersson    2022-03-03   927  {
24e2d05d1b6898 Bjorn Andersson    2022-03-03   928  	struct lpg_channel *chan;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   929  	struct lpg *lpg = led->lpg;
e98a860f65428a Bjorn Andersson    2022-05-23   930  	struct led_pattern *pattern;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   931  	unsigned int brightness_a;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   932  	unsigned int brightness_b;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   933  	unsigned int actual_len;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   934  	unsigned int hi_pause;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   935  	unsigned int lo_pause;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   936  	unsigned int delta_t;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   937  	unsigned int lo_idx;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   938  	unsigned int hi_idx;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   939  	unsigned int i;
27f6fd95bda9b7 Anjelique Melendez 2023-07-25   940  	bool ping_pong = false;
e98a860f65428a Bjorn Andersson    2022-05-23   941  	int ret = -EINVAL;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   942  
24e2d05d1b6898 Bjorn Andersson    2022-03-03   943  	/* Hardware only support oneshot or indefinite loops */
24e2d05d1b6898 Bjorn Andersson    2022-03-03   944  	if (repeat != -1 && repeat != 1)
24e2d05d1b6898 Bjorn Andersson    2022-03-03   945  		return -EINVAL;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   946  
e98a860f65428a Bjorn Andersson    2022-05-23   947  	/*
e98a860f65428a Bjorn Andersson    2022-05-23   948  	 * The standardized leds-trigger-pattern format defines that the
e98a860f65428a Bjorn Andersson    2022-05-23   949  	 * brightness of the LED follows a linear transition from one entry
e98a860f65428a Bjorn Andersson    2022-05-23   950  	 * in the pattern to the next, over the given delta_t time. It
e98a860f65428a Bjorn Andersson    2022-05-23   951  	 * describes that the way to perform instant transitions a zero-length
e98a860f65428a Bjorn Andersson    2022-05-23   952  	 * entry should be added following a pattern entry.
e98a860f65428a Bjorn Andersson    2022-05-23   953  	 *
e98a860f65428a Bjorn Andersson    2022-05-23   954  	 * The LPG hardware is only able to perform the latter (no linear
e98a860f65428a Bjorn Andersson    2022-05-23   955  	 * transitions), so require each entry in the pattern to be followed by
e98a860f65428a Bjorn Andersson    2022-05-23   956  	 * a zero-length transition.
e98a860f65428a Bjorn Andersson    2022-05-23   957  	 */
e98a860f65428a Bjorn Andersson    2022-05-23   958  	if (len % 2)
e98a860f65428a Bjorn Andersson    2022-05-23   959  		return -EINVAL;
e98a860f65428a Bjorn Andersson    2022-05-23   960  
e98a860f65428a Bjorn Andersson    2022-05-23   961  	pattern = kcalloc(len / 2, sizeof(*pattern), GFP_KERNEL);
e98a860f65428a Bjorn Andersson    2022-05-23   962  	if (!pattern)
e98a860f65428a Bjorn Andersson    2022-05-23   963  		return -ENOMEM;
e98a860f65428a Bjorn Andersson    2022-05-23   964  
e98a860f65428a Bjorn Andersson    2022-05-23   965  	for (i = 0; i < len; i += 2) {
e98a860f65428a Bjorn Andersson    2022-05-23   966  		if (led_pattern[i].brightness != led_pattern[i + 1].brightness)
e98a860f65428a Bjorn Andersson    2022-05-23   967  			goto out_free_pattern;
e98a860f65428a Bjorn Andersson    2022-05-23   968  		if (led_pattern[i + 1].delta_t != 0)
e98a860f65428a Bjorn Andersson    2022-05-23   969  			goto out_free_pattern;
e98a860f65428a Bjorn Andersson    2022-05-23   970  
e98a860f65428a Bjorn Andersson    2022-05-23   971  		pattern[i / 2].brightness = led_pattern[i].brightness;
e98a860f65428a Bjorn Andersson    2022-05-23   972  		pattern[i / 2].delta_t = led_pattern[i].delta_t;
e98a860f65428a Bjorn Andersson    2022-05-23   973  	}
e98a860f65428a Bjorn Andersson    2022-05-23   974  
e98a860f65428a Bjorn Andersson    2022-05-23   975  	len /= 2;
e98a860f65428a Bjorn Andersson    2022-05-23   976  
24e2d05d1b6898 Bjorn Andersson    2022-03-03   977  	/*
24e2d05d1b6898 Bjorn Andersson    2022-03-03   978  	 * Specifying a pattern of length 1 causes the hardware to iterate
24e2d05d1b6898 Bjorn Andersson    2022-03-03   979  	 * through the entire LUT, so prohibit this.
24e2d05d1b6898 Bjorn Andersson    2022-03-03   980  	 */
24e2d05d1b6898 Bjorn Andersson    2022-03-03   981  	if (len < 2)
e98a860f65428a Bjorn Andersson    2022-05-23   982  		goto out_free_pattern;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   983  
24e2d05d1b6898 Bjorn Andersson    2022-03-03   984  	/*
24e2d05d1b6898 Bjorn Andersson    2022-03-03   985  	 * The LPG plays patterns with at a fixed pace, a "low pause" can be
24e2d05d1b6898 Bjorn Andersson    2022-03-03   986  	 * used to stretch the first delay of the pattern and a "high pause"
24e2d05d1b6898 Bjorn Andersson    2022-03-03   987  	 * the last one.
24e2d05d1b6898 Bjorn Andersson    2022-03-03   988  	 *
27f6fd95bda9b7 Anjelique Melendez 2023-07-25   989  	 * In order to save space for the pattern can be played in "ping pong"
24e2d05d1b6898 Bjorn Andersson    2022-03-03   990  	 * mode, in which the pattern is first played forward, then "high
24e2d05d1b6898 Bjorn Andersson    2022-03-03   991  	 * pause" is applied, then the pattern is played backwards and finally
24e2d05d1b6898 Bjorn Andersson    2022-03-03   992  	 * the "low pause" is applied.
24e2d05d1b6898 Bjorn Andersson    2022-03-03   993  	 *
24e2d05d1b6898 Bjorn Andersson    2022-03-03   994  	 * The middle elements of the pattern are used to determine delta_t and
24e2d05d1b6898 Bjorn Andersson    2022-03-03   995  	 * the "low pause" and "high pause" multipliers are derrived from this.
24e2d05d1b6898 Bjorn Andersson    2022-03-03   996  	 *
24e2d05d1b6898 Bjorn Andersson    2022-03-03   997  	 * The first element in the pattern is used to determine "low pause".
24e2d05d1b6898 Bjorn Andersson    2022-03-03   998  	 *
24e2d05d1b6898 Bjorn Andersson    2022-03-03   999  	 * If the specified pattern is a palindrome the ping pong mode is
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1000  	 * enabled. In this scenario the delta_t of the middle entry (i.e. the
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1001  	 * last in the programmed pattern) determines the "high pause".
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1002  	 *
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1003  	 * NVMEM devices supporting LUT do not support "low pause", "high pause"
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1004  	 * or "ping pong"
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1005  	 */
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1006  
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1007  	/* Detect palindromes and use "ping pong" to reduce LUT usage */
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1008  	if (lpg->lut_base) {
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1009  		ping_pong = true;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1010  		for (i = 0; i < len / 2; i++) {
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1011  			brightness_a = pattern[i].brightness;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1012  			brightness_b = pattern[len - i - 1].brightness;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1013  
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1014  			if (brightness_a != brightness_b) {
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1015  				ping_pong = false;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1016  				break;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1017  			}
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1018  		}
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1019  	}
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1020  
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1021  	/* The pattern length to be written to the LUT */
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1022  	if (ping_pong)
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1023  		actual_len = (len + 1) / 2;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1024  	else
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1025  		actual_len = len;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1026  
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1027  	/*
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1028  	 * Validate that all delta_t in the pattern are the same, with the
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1029  	 * exception of the middle element in case of ping_pong.
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1030  	 */
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1031  	if (lpg->ppg_en) {
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1032  		i = 1;
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1033  		delta_t = pattern[0].delta_t;
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1034  	} else {
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1035  		i = 2;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1036  		delta_t = pattern[1].delta_t;
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1037  	}
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1038  
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1039  	for (; i < len; i++) {
24e2d05d1b6898 Bjorn Andersson    2022-03-03 @1040  		if (pattern[i].delta_t != delta_t) {
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1041  			/*
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1042  			 * Allow last entry in the full or shortened pattern to
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1043  			 * specify hi pause. Reject other variations.
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1044  			 */
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1045  			if (i != actual_len - 1 || lpg->ppg_en)
e98a860f65428a Bjorn Andersson    2022-05-23  1046  				goto out_free_pattern;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1047  		}
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1048  	}
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1049  
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1050  	/* LPG_RAMP_DURATION_REG is a 9bit */
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1051  	if (delta_t >= BIT(9))
e98a860f65428a Bjorn Andersson    2022-05-23  1052  		goto out_free_pattern;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1053  
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1054  	/* Find "low pause" and "high pause" in the pattern if not an NVMEM device*/
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1055  	if (!lpg->ppg_en) {
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1056  		lo_pause = pattern[0].delta_t;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1057  		hi_pause = pattern[actual_len - 1].delta_t;
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1058  	}
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1059  
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1060  	mutex_lock(&lpg->lock);
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1061  
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1062  	if (lpg->ppg_en)
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1063  		ret = lpg_lut_store_sdam(lpg, pattern, actual_len, &lo_idx, &hi_idx);
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1064  	else
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1065  		ret = lpg_lut_store(lpg, pattern, actual_len, &lo_idx, &hi_idx);
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1066  
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1067  	if (ret < 0)
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1068  		goto out_unlock;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1069  
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1070  	for (i = 0; i < led->num_channels; i++) {
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1071  		chan = led->channels[i];
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1072  
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1073  		chan->ramp_tick_ms = delta_t;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1074  		chan->ramp_ping_pong = ping_pong;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1075  		chan->ramp_oneshot = repeat != -1;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1076  
24e2d05d1b6898 Bjorn Andersson    2022-03-03 @1077  		chan->ramp_lo_pause_ms = lo_pause;
24e2d05d1b6898 Bjorn Andersson    2022-03-03 @1078  		chan->ramp_hi_pause_ms = hi_pause;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1079  
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1080  		chan->pattern_lo_idx = lo_idx;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1081  		chan->pattern_hi_idx = hi_idx;
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1082  
27f6fd95bda9b7 Anjelique Melendez 2023-07-25  1083  		chan->pattern_set = lpg->ppg_en;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1084  	}
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1085  
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1086  out_unlock:
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1087  	mutex_unlock(&lpg->lock);
e98a860f65428a Bjorn Andersson    2022-05-23  1088  out_free_pattern:
e98a860f65428a Bjorn Andersson    2022-05-23  1089  	kfree(pattern);
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1090  
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1091  	return ret;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1092  }
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1093  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
