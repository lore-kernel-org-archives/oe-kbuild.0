Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0131D48CC8
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Nov 2023 14:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KX0T3yir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701353701; x=1732889701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tAcDm0cYWPYO8+fFZb+BxYmDtnj+tEYz6WH3d1JVdbA=;
  b=KX0T3yirAE42wuRqiKVklJR4b9cOncgAzalvdgvQj34SRrlVP6UE5VtR
   PRsEaOXnrttLD8Np7Qzh55Jx1SFuwOatDPRfDOQI6MLK+/hOe2FH7Tuvr
   RDoU2cKyQbXAI2LiPw4jvbi6FLhk6gPAHeSwNXpqDUQu8zRYtFupXeA+N
   8Nke0ge7fkTvOytUb1Pvlj2c/N+oDR9X9fXimTvmsUlTBSIMZb/NVAAXk
   cDufK6CZamDgo8GzSqUqukDwxHaw53ZnGhJvbKNeu5xmSZb5B2pCCvI/X
   P6BXZ6Ipk45MHpiWFf0RGwQ1oBsRfkKxaS0Ks6QUEfg4W5jh0XIuiU4Uw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="14877281"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="14877281"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:15:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="860208241"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="860208241"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Nov 2023 06:14:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8hoe-00026F-21;
	Thu, 30 Nov 2023 14:14:56 +0000
Date: Thu, 30 Nov 2023 22:14:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 4/7] leds: rgb: leds-qcom-lpg: Add support for PPG
 through single SDAM
Message-ID: <202311302200.RcTP9m0Y-lkp@intel.com>
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
In-Reply-To: <20231130013615.14287-5-quic_amelende@quicinc.com>
References: <20231130013615.14287-5-quic_amelende@quicinc.com>
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
CC: quic_gurus@quicinc.com
CC: linux-leds@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: linux-pwm@vger.kernel.org
CC: Anjelique Melendez <quic_amelende@quicinc.com>

Hi Anjelique,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on lee-leds/for-leds-next linus/master v6.7-rc3 next-20231130]
[cannot apply to pavel-leds/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anjelique-Melendez/dt-bindings-soc-qcom-Add-qcom-pbs-bindings/20231130-094701
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231130013615.14287-5-quic_amelende%40quicinc.com
patch subject: [PATCH v7 4/7] leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: csky-randconfig-r071-20231130 (https://download.01.org/0day-ci/archive/20231130/202311302200.RcTP9m0Y-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311302200.RcTP9m0Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311302200.RcTP9m0Y-lkp@intel.com/

smatch warnings:
drivers/leds/rgb/leds-qcom-lpg.c:1055 lpg_pattern_set() error: uninitialized symbol 'lo_pause'.
drivers/leds/rgb/leds-qcom-lpg.c:1056 lpg_pattern_set() error: uninitialized symbol 'hi_pause'.

vim +/lo_pause +1055 drivers/leds/rgb/leds-qcom-lpg.c

24e2d05d1b6898 Bjorn Andersson    2022-03-03   903  
e98a860f65428a Bjorn Andersson    2022-05-23   904  static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
24e2d05d1b6898 Bjorn Andersson    2022-03-03   905  			   u32 len, int repeat)
24e2d05d1b6898 Bjorn Andersson    2022-03-03   906  {
24e2d05d1b6898 Bjorn Andersson    2022-03-03   907  	struct lpg_channel *chan;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   908  	struct lpg *lpg = led->lpg;
e98a860f65428a Bjorn Andersson    2022-05-23   909  	struct led_pattern *pattern;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   910  	unsigned int brightness_a;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   911  	unsigned int brightness_b;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   912  	unsigned int actual_len;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   913  	unsigned int hi_pause;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   914  	unsigned int lo_pause;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   915  	unsigned int delta_t;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   916  	unsigned int lo_idx;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   917  	unsigned int hi_idx;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   918  	unsigned int i;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   919  	bool ping_pong = true;
e98a860f65428a Bjorn Andersson    2022-05-23   920  	int ret = -EINVAL;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   921  
24e2d05d1b6898 Bjorn Andersson    2022-03-03   922  	/* Hardware only support oneshot or indefinite loops */
24e2d05d1b6898 Bjorn Andersson    2022-03-03   923  	if (repeat != -1 && repeat != 1)
24e2d05d1b6898 Bjorn Andersson    2022-03-03   924  		return -EINVAL;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   925  
e98a860f65428a Bjorn Andersson    2022-05-23   926  	/*
e98a860f65428a Bjorn Andersson    2022-05-23   927  	 * The standardized leds-trigger-pattern format defines that the
e98a860f65428a Bjorn Andersson    2022-05-23   928  	 * brightness of the LED follows a linear transition from one entry
e98a860f65428a Bjorn Andersson    2022-05-23   929  	 * in the pattern to the next, over the given delta_t time. It
e98a860f65428a Bjorn Andersson    2022-05-23   930  	 * describes that the way to perform instant transitions a zero-length
e98a860f65428a Bjorn Andersson    2022-05-23   931  	 * entry should be added following a pattern entry.
e98a860f65428a Bjorn Andersson    2022-05-23   932  	 *
e98a860f65428a Bjorn Andersson    2022-05-23   933  	 * The LPG hardware is only able to perform the latter (no linear
e98a860f65428a Bjorn Andersson    2022-05-23   934  	 * transitions), so require each entry in the pattern to be followed by
e98a860f65428a Bjorn Andersson    2022-05-23   935  	 * a zero-length transition.
e98a860f65428a Bjorn Andersson    2022-05-23   936  	 */
e98a860f65428a Bjorn Andersson    2022-05-23   937  	if (len % 2)
e98a860f65428a Bjorn Andersson    2022-05-23   938  		return -EINVAL;
e98a860f65428a Bjorn Andersson    2022-05-23   939  
e98a860f65428a Bjorn Andersson    2022-05-23   940  	pattern = kcalloc(len / 2, sizeof(*pattern), GFP_KERNEL);
e98a860f65428a Bjorn Andersson    2022-05-23   941  	if (!pattern)
e98a860f65428a Bjorn Andersson    2022-05-23   942  		return -ENOMEM;
e98a860f65428a Bjorn Andersson    2022-05-23   943  
e98a860f65428a Bjorn Andersson    2022-05-23   944  	for (i = 0; i < len; i += 2) {
e98a860f65428a Bjorn Andersson    2022-05-23   945  		if (led_pattern[i].brightness != led_pattern[i + 1].brightness)
e98a860f65428a Bjorn Andersson    2022-05-23   946  			goto out_free_pattern;
e98a860f65428a Bjorn Andersson    2022-05-23   947  		if (led_pattern[i + 1].delta_t != 0)
e98a860f65428a Bjorn Andersson    2022-05-23   948  			goto out_free_pattern;
e98a860f65428a Bjorn Andersson    2022-05-23   949  
e98a860f65428a Bjorn Andersson    2022-05-23   950  		pattern[i / 2].brightness = led_pattern[i].brightness;
e98a860f65428a Bjorn Andersson    2022-05-23   951  		pattern[i / 2].delta_t = led_pattern[i].delta_t;
e98a860f65428a Bjorn Andersson    2022-05-23   952  	}
e98a860f65428a Bjorn Andersson    2022-05-23   953  
e98a860f65428a Bjorn Andersson    2022-05-23   954  	len /= 2;
e98a860f65428a Bjorn Andersson    2022-05-23   955  
24e2d05d1b6898 Bjorn Andersson    2022-03-03   956  	/*
24e2d05d1b6898 Bjorn Andersson    2022-03-03   957  	 * Specifying a pattern of length 1 causes the hardware to iterate
24e2d05d1b6898 Bjorn Andersson    2022-03-03   958  	 * through the entire LUT, so prohibit this.
24e2d05d1b6898 Bjorn Andersson    2022-03-03   959  	 */
24e2d05d1b6898 Bjorn Andersson    2022-03-03   960  	if (len < 2)
e98a860f65428a Bjorn Andersson    2022-05-23   961  		goto out_free_pattern;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   962  
24e2d05d1b6898 Bjorn Andersson    2022-03-03   963  	/*
24e2d05d1b6898 Bjorn Andersson    2022-03-03   964  	 * The LPG plays patterns with at a fixed pace, a "low pause" can be
24e2d05d1b6898 Bjorn Andersson    2022-03-03   965  	 * used to stretch the first delay of the pattern and a "high pause"
24e2d05d1b6898 Bjorn Andersson    2022-03-03   966  	 * the last one.
24e2d05d1b6898 Bjorn Andersson    2022-03-03   967  	 *
24e2d05d1b6898 Bjorn Andersson    2022-03-03   968  	 * In order to save space the pattern can be played in "ping pong"
24e2d05d1b6898 Bjorn Andersson    2022-03-03   969  	 * mode, in which the pattern is first played forward, then "high
24e2d05d1b6898 Bjorn Andersson    2022-03-03   970  	 * pause" is applied, then the pattern is played backwards and finally
24e2d05d1b6898 Bjorn Andersson    2022-03-03   971  	 * the "low pause" is applied.
24e2d05d1b6898 Bjorn Andersson    2022-03-03   972  	 *
24e2d05d1b6898 Bjorn Andersson    2022-03-03   973  	 * The middle elements of the pattern are used to determine delta_t and
24e2d05d1b6898 Bjorn Andersson    2022-03-03   974  	 * the "low pause" and "high pause" multipliers are derrived from this.
24e2d05d1b6898 Bjorn Andersson    2022-03-03   975  	 *
24e2d05d1b6898 Bjorn Andersson    2022-03-03   976  	 * The first element in the pattern is used to determine "low pause".
24e2d05d1b6898 Bjorn Andersson    2022-03-03   977  	 *
24e2d05d1b6898 Bjorn Andersson    2022-03-03   978  	 * If the specified pattern is a palindrome the ping pong mode is
24e2d05d1b6898 Bjorn Andersson    2022-03-03   979  	 * enabled. In this scenario the delta_t of the middle entry (i.e. the
24e2d05d1b6898 Bjorn Andersson    2022-03-03   980  	 * last in the programmed pattern) determines the "high pause".
05c1d2a258599b Anjelique Melendez 2023-11-29   981  	 *
05c1d2a258599b Anjelique Melendez 2023-11-29   982  	 * SDAM-based devices do not support "ping-pong", "low pause" or "high pause"
24e2d05d1b6898 Bjorn Andersson    2022-03-03   983  	 */
24e2d05d1b6898 Bjorn Andersson    2022-03-03   984  
24e2d05d1b6898 Bjorn Andersson    2022-03-03   985  	/* Detect palindromes and use "ping pong" to reduce LUT usage */
05c1d2a258599b Anjelique Melendez 2023-11-29   986  	if (lpg->lut_base) {
24e2d05d1b6898 Bjorn Andersson    2022-03-03   987  		for (i = 0; i < len / 2; i++) {
24e2d05d1b6898 Bjorn Andersson    2022-03-03   988  			brightness_a = pattern[i].brightness;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   989  			brightness_b = pattern[len - i - 1].brightness;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   990  
24e2d05d1b6898 Bjorn Andersson    2022-03-03   991  			if (brightness_a != brightness_b) {
24e2d05d1b6898 Bjorn Andersson    2022-03-03   992  				ping_pong = false;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   993  				break;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   994  			}
24e2d05d1b6898 Bjorn Andersson    2022-03-03   995  		}
05c1d2a258599b Anjelique Melendez 2023-11-29   996  	} else
05c1d2a258599b Anjelique Melendez 2023-11-29   997  		ping_pong = false;
24e2d05d1b6898 Bjorn Andersson    2022-03-03   998  
24e2d05d1b6898 Bjorn Andersson    2022-03-03   999  	/* The pattern length to be written to the LUT */
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1000  	if (ping_pong)
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1001  		actual_len = (len + 1) / 2;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1002  	else
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1003  		actual_len = len;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1004  
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1005  	/*
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1006  	 * Validate that all delta_t in the pattern are the same, with the
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1007  	 * exception of the middle element in case of ping_pong.
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1008  	 */
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1009  	delta_t = pattern[1].delta_t;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1010  	for (i = 2; i < len; i++) {
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1011  		if (pattern[i].delta_t != delta_t) {
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1012  			/*
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1013  			 * Allow last entry in the full or shortened pattern to
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1014  			 * specify hi pause. Reject other variations.
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1015  			 */
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1016  			if (i != actual_len - 1)
e98a860f65428a Bjorn Andersson    2022-05-23  1017  				goto out_free_pattern;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1018  		}
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1019  	}
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1020  
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1021  	/* LPG_RAMP_DURATION_REG is a 9bit */
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1022  	if (delta_t >= BIT(9))
e98a860f65428a Bjorn Andersson    2022-05-23  1023  		goto out_free_pattern;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1024  
05c1d2a258599b Anjelique Melendez 2023-11-29  1025  	/*
05c1d2a258599b Anjelique Melendez 2023-11-29  1026  	 * Find "low pause" and "high pause" in the pattern in the LUT case.
05c1d2a258599b Anjelique Melendez 2023-11-29  1027  	 * SDAM-based devices require equal duration of all steps
05c1d2a258599b Anjelique Melendez 2023-11-29  1028  	 */
05c1d2a258599b Anjelique Melendez 2023-11-29  1029  	if (lpg->lut_base) {
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1030  		lo_pause = pattern[0].delta_t;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1031  		hi_pause = pattern[actual_len - 1].delta_t;
05c1d2a258599b Anjelique Melendez 2023-11-29  1032  	} else {
05c1d2a258599b Anjelique Melendez 2023-11-29  1033  		if (delta_t != pattern[0].delta_t || delta_t != pattern[actual_len - 1].delta_t)
05c1d2a258599b Anjelique Melendez 2023-11-29  1034  			goto out_free_pattern;
05c1d2a258599b Anjelique Melendez 2023-11-29  1035  	}
05c1d2a258599b Anjelique Melendez 2023-11-29  1036  
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1037  
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1038  	mutex_lock(&lpg->lock);
05c1d2a258599b Anjelique Melendez 2023-11-29  1039  
05c1d2a258599b Anjelique Melendez 2023-11-29  1040  	if (lpg->lut_base)
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1041  		ret = lpg_lut_store(lpg, pattern, actual_len, &lo_idx, &hi_idx);
05c1d2a258599b Anjelique Melendez 2023-11-29  1042  	else
05c1d2a258599b Anjelique Melendez 2023-11-29  1043  		ret = lpg_lut_store_sdam(lpg, pattern, actual_len, &lo_idx, &hi_idx);
05c1d2a258599b Anjelique Melendez 2023-11-29  1044  
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1045  	if (ret < 0)
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1046  		goto out_unlock;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1047  
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1048  	for (i = 0; i < led->num_channels; i++) {
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1049  		chan = led->channels[i];
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1050  
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1051  		chan->ramp_tick_ms = delta_t;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1052  		chan->ramp_ping_pong = ping_pong;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1053  		chan->ramp_oneshot = repeat != -1;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1054  
24e2d05d1b6898 Bjorn Andersson    2022-03-03 @1055  		chan->ramp_lo_pause_ms = lo_pause;
24e2d05d1b6898 Bjorn Andersson    2022-03-03 @1056  		chan->ramp_hi_pause_ms = hi_pause;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1057  
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1058  		chan->pattern_lo_idx = lo_idx;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1059  		chan->pattern_hi_idx = hi_idx;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1060  	}
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1061  
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1062  out_unlock:
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1063  	mutex_unlock(&lpg->lock);
e98a860f65428a Bjorn Andersson    2022-05-23  1064  out_free_pattern:
e98a860f65428a Bjorn Andersson    2022-05-23  1065  	kfree(pattern);
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1066  
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1067  	return ret;
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1068  }
24e2d05d1b6898 Bjorn Andersson    2022-03-03  1069  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
