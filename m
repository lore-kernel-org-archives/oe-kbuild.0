Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57A72135B8
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 10:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765882057; cv=none; b=TXcoQYswvk0etJ4IovwQ6DW0O+IzA1mBr/DNnP2wpLvpjwEytg9NBObKjb52qYUpHfmWlmVr4bJsffLDM2vNM4ZxHwudpBpmq+iN+fgDn5EII/4SsEWJqZXyIRWSyEaXh3kAIGD7vgapLazFcmTeic+83lfv4EPji9IAFiXfN10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765882057; c=relaxed/simple;
	bh=p0Xl7lTDHNmDWhAb09vb8qc5+gfAXMpAV2BU4d7CQcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fe9NIH4tW8IH1+spHE55U6ADjjUfo4NNapWUGmrg+7/8WTjG4Vh+/okWQLvwhgZVRzzgKS3XFE3mwhKaJVgSP9ORqJH+Rkgvf280V2rZJFH5mG+zZJ1biCJMYDYOoKscufjn1uo0LZSQyG2A1J4S6xabGM0MFN/34j5JP4I7k+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BWqzLZK3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BWqzLZK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765882056; x=1797418056;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=p0Xl7lTDHNmDWhAb09vb8qc5+gfAXMpAV2BU4d7CQcY=;
  b=BWqzLZK3uHP+6DphJSHu2ELV5sEqPs1CmT9HuhmyBcRAVsNciHWGWRP4
   ndsk/lbI5/MDvZHC3tJ2sai06Xx1swqC939kHdPizoXyw3Oyq6cx95YTH
   71uBGximcQzMWaPKe2IwUduoUHaGUd6oO1MmVFRylc1yxgEUgS76f9vZv
   kHqV4RhDoWPuiVIZFbtCqlO8GXqdRDVrg6bw9Od6APwHBLX3q4bDu3pxQ
   qrO94qsfd9xOS8vaYTkXi/LizC+G5pMJNaqY7hVyWsalXT1XmBvkUThtP
   Mtw44ie34G4DGBYID1uvaqFWrt4dmHNPbm1xoL1Ji+1l+XzQzDIK7I0+e
   g==;
X-CSE-ConnectionGUID: 3r0E/uyuRRmKMfQEBE2ABw==
X-CSE-MsgGUID: iPIrbiRxT1K2qUPZCKXbuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78916121"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78916121"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 02:47:33 -0800
X-CSE-ConnectionGUID: kPB4YjjKQsuOvfP/SPNo3Q==
X-CSE-MsgGUID: TNHHbgDkQ+agun24h/rH1A==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 16 Dec 2025 02:47:31 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVSaX-000000001Vs-1YAt;
	Tue, 16 Dec 2025 10:47:29 +0000
Date: Tue, 16 Dec 2025 18:47:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pwm/core.c:2291 pwm_cdev_ioctl() warn: maybe return -EFAULT
 instead of the bytes remaining?
Message-ID: <202512161840.rzIo5czd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
commit: 9c06f26ba5f5da14bcac405c7a652dcf578a785d pwm: Add support for pwmchip devices for faster and easier userspace access
date:   5 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 months ago
config: sparc-randconfig-r072-20251213 (https://download.01.org/0day-ci/archive/20251216/202512161840.rzIo5czd-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512161840.rzIo5czd-lkp@intel.com/

New smatch warnings:
drivers/pwm/core.c:2291 pwm_cdev_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
drivers/pwm/core.c:2325 pwm_cdev_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?

vim +2291 drivers/pwm/core.c

9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2228  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2229  static long pwm_cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2230  {
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2231  	int ret = 0;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2232  	struct pwm_cdev_data *cdata = file->private_data;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2233  	struct pwm_chip *chip = cdata->chip;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2234  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2235  	guard(mutex)(&pwm_lock);
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2236  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2237  	if (!chip->operational)
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2238  		return -ENODEV;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2239  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2240  	switch (cmd) {
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2241  	case PWM_IOCTL_REQUEST:
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2242  		{
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2243  			unsigned int hwpwm = arg;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2244  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2245  			return pwm_cdev_request(cdata, hwpwm);
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2246  		}
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2247  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2248  	case PWM_IOCTL_FREE:
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2249  		{
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2250  			unsigned int hwpwm = arg;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2251  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2252  			return pwm_cdev_free(cdata, hwpwm);
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2253  		}
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2254  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2255  	case PWM_IOCTL_ROUNDWF:
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2256  		{
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2257  			struct pwmchip_waveform cwf;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2258  			struct pwm_waveform wf;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2259  			struct pwm_device *pwm;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2260  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2261  			ret = copy_from_user(&cwf,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2262  					     (struct pwmchip_waveform __user *)arg,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2263  					     sizeof(cwf));
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2264  			if (ret)
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2265  				return -EFAULT;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2266  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2267  			if (cwf.__pad != 0)
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2268  				return -EINVAL;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2269  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2270  			pwm = pwm_cdev_get_requested_pwm(cdata, cwf.hwpwm);
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2271  			if (IS_ERR(pwm))
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2272  				return PTR_ERR(pwm);
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2273  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2274  			wf = (struct pwm_waveform) {
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2275  				.period_length_ns = cwf.period_length_ns,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2276  				.duty_length_ns = cwf.duty_length_ns,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2277  				.duty_offset_ns = cwf.duty_offset_ns,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2278  			};
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2279  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2280  			ret = pwm_round_waveform_might_sleep(pwm, &wf);
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2281  			if (ret < 0)
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2282  				return ret;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2283  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2284  			cwf = (struct pwmchip_waveform) {
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2285  				.hwpwm = cwf.hwpwm,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2286  				.period_length_ns = wf.period_length_ns,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2287  				.duty_length_ns = wf.duty_length_ns,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2288  				.duty_offset_ns = wf.duty_offset_ns,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2289  			};
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2290  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30 @2291  			return copy_to_user((struct pwmchip_waveform __user *)arg,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2292  					    &cwf, sizeof(cwf));
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2293  		}
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2294  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2295  	case PWM_IOCTL_GETWF:
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2296  		{
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2297  			struct pwmchip_waveform cwf;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2298  			struct pwm_waveform wf;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2299  			struct pwm_device *pwm;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2300  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2301  			ret = copy_from_user(&cwf,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2302  					     (struct pwmchip_waveform __user *)arg,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2303  					     sizeof(cwf));
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2304  			if (ret)
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2305  				return -EFAULT;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2306  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2307  			if (cwf.__pad != 0)
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2308  				return -EINVAL;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2309  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2310  			pwm = pwm_cdev_get_requested_pwm(cdata, cwf.hwpwm);
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2311  			if (IS_ERR(pwm))
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2312  				return PTR_ERR(pwm);
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2313  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2314  			ret = pwm_get_waveform_might_sleep(pwm, &wf);
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2315  			if (ret)
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2316  				return ret;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2317  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2318  			cwf = (struct pwmchip_waveform) {
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2319  				.hwpwm = cwf.hwpwm,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2320  				.period_length_ns = wf.period_length_ns,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2321  				.duty_length_ns = wf.duty_length_ns,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2322  				.duty_offset_ns = wf.duty_offset_ns,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2323  			};
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2324  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2325  			return copy_to_user((struct pwmchip_waveform __user *)arg,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2326  					    &cwf, sizeof(cwf));
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2327  		}
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2328  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2329  	case PWM_IOCTL_SETROUNDEDWF:
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2330  	case PWM_IOCTL_SETEXACTWF:
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2331  		{
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2332  			struct pwmchip_waveform cwf;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2333  			struct pwm_waveform wf;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2334  			struct pwm_device *pwm;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2335  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2336  			ret = copy_from_user(&cwf,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2337  					     (struct pwmchip_waveform __user *)arg,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2338  					     sizeof(cwf));
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2339  			if (ret)
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2340  				return -EFAULT;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2341  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2342  			if (cwf.__pad != 0)
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2343  				return -EINVAL;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2344  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2345  			wf = (struct pwm_waveform){
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2346  				.period_length_ns = cwf.period_length_ns,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2347  				.duty_length_ns = cwf.duty_length_ns,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2348  				.duty_offset_ns = cwf.duty_offset_ns,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2349  			};
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2350  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2351  			if (!pwm_wf_valid(&wf))
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2352  				return -EINVAL;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2353  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2354  			pwm = pwm_cdev_get_requested_pwm(cdata, cwf.hwpwm);
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2355  			if (IS_ERR(pwm))
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2356  				return PTR_ERR(pwm);
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2357  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2358  			ret = pwm_set_waveform_might_sleep(pwm, &wf,
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2359  							   cmd == PWM_IOCTL_SETEXACTWF);
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2360  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2361  			/*
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2362  			 * If userspace cares about rounding deviations it has
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2363  			 * to check the values anyhow, so simplify handling for
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2364  			 * them and don't signal uprounding. This matches the
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2365  			 * behaviour of PWM_IOCTL_ROUNDWF which also returns 0
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2366  			 * in that case.
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2367  			 */
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2368  			if (ret == 1)
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2369  				ret = 0;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2370  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2371  			return ret;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2372  		}
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2373  
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2374  	default:
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2375  		return -ENOTTY;
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2376  	}
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2377  }
9c06f26ba5f5da Uwe Kleine-König 2025-04-30  2378  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
