Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD8134D4C1
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 11:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765885332; cv=none; b=ht0831ijR1Olwxa3s6pboB2Rm7AxFp0yeE9R6/6TBXyCoaNu40YiG1GVJWWCDWz2ipN1Aq1nKF7VoRwOv2P1oHLQ3lbDsWZU0IOtuMQ+Oq37KUFvCW1Ueo53+2YeTUnRjs4j1tRkszowQqJ9XehCtjir8xKrY9kjdGmFwAxbNv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765885332; c=relaxed/simple;
	bh=LS6fHj4Cnrh9HQfAH21nptOSuCnFeXP94vV/010fSv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F6ZaaGprOlNlhT0OzjGrGMf/1zqiaN0r/RQE7RhnBFEpyM68YRqYcQGbX+alQEs31qcbkGnQBymoKWxff/cT6YmxgqKun5vNOVTEz9387bslATfY2n4f+HMtaizUKd+cG2CoTtgHg+emnGZLVC489dhKUqV1eDtsrNDgEdxhtVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PENXBQaM; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PENXBQaM"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42f9ece6387so1797081f8f.0
        for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 03:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765885328; x=1766490128; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XKkEeXJIdCM0jA3R+AX01WwX7p/Le5WGR4y6SVX7Ow=;
        b=PENXBQaMdqMb7QZSTRL8Oh7dl+rce1kiYViWzUwt7VmrPrYj1YtYhdnfMS7IgGcnky
         Dc1y1el+rNBscmLR0yNCXA1Uey2fBhR4MiMsaGsvlG+nIU3by5jlq6EzdWQjIcTB/4w7
         QgSsj2xeDrIi03qfV5VfHB9aJmPCiM/Fj2NikDUkbHWApkGiTdZms3Ya5xHPA3Cq5ZUb
         +9yiLnW+qTM4cJdP+vATJ8NqWQNoIJICYp636CgPr3uBcVfLMz5lNnq9fxznnyEM0xx/
         sRWGQ+lZLva5C2q1uUmR/vOE8T0D+gXQOEd1RZNKdjBQmBBhjZqB8jRuqQkhjdk8KSGB
         qsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765885328; x=1766490128;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/XKkEeXJIdCM0jA3R+AX01WwX7p/Le5WGR4y6SVX7Ow=;
        b=X/sOfLAAmh02AfIv/KT7W7XSrLt81ZoHbD7dQrZcTyqgQHelP6/uAVZcvivFEZZnu6
         qDUYNL+MpudAWGGRlNHgdAZBbbRpZn0yi2Sbeq2/EGGMSB2IfiDmw/GqjP9BLuDpVJQU
         2gcK72115XzTF4HS2cbXVsVAslhkJkDh7ffIhpXbu1d28RKfLET6kaa8AvEdT7PJoPHy
         d5FEtRr56fg4+mnbP4lYFGjJcvegr0fv6sbdwliJZB+4WmORy5eepdH8X/UIiKl6JknF
         NAGHplqfKlEq4vdv22JiqW9pH+nCy6TPvH5s3etginkWIsnCpZBxLnLMQY+4w0Fc+Arg
         6x5g==
X-Gm-Message-State: AOJu0YwHSm2Jho1A3d66dwLEbf7NGvNCwEbLPmRmCcbkBPwUTtA/dMUt
	hOcmn7t4lrX9kmSeWwypGeDVlvBaZE3qvgAhspbWiM+b3xUJjzsKMDgfCHNumc7kVNGqRRkI3tv
	2hz0b
X-Gm-Gg: AY/fxX6gkhBOQ2YGinJlFtz0yx0wxdCM/ObNi8xdnMytQW8Avy83RcC9cAvo9WVOAMf
	FawtfJJao/Sv+OC7nuqxtkSoQqf7667+cC3QtmkM9rJegAugR+mj6yCnLAJcLs5vSexCmUG1Tl5
	z5BkkLQ3xZ71vyI7UNbbQk107dLgkY3+c2DDvZuGdHVp9wO6XmI2nnV5SvF32QMuLeuxdsKR9jR
	MfoOkGaXwCdJafdFNSOMV8CctLHObhrrLI12fK7zLfoPUHKSuD3Je5ku3zgQyUpGq8a6ZnqHCLW
	fbRWwlJumDuhuYoHTF0zSbyvh0n2CvWivsv/xLoq0v1NGWQeps4V1dAZpfceFrB3/IyCIqfdTSD
	5vOv6Fif7W9eFhIu4frmQ/DtYp9QXfIjR7e81mjLqkxXDppbiC+5KMf2dwfx3OuQkj7Tz0WoJqh
	Wzxd8xvCJ5l3OM52zLD9O0yG6DAQo=
X-Google-Smtp-Source: AGHT+IGYircDHvtSekzbxSgDHV2UIce5BfnsB9amgS4pKRQRgbZkVeArmF0q0QCGbcAP1ltba53F0Q==
X-Received: by 2002:a5d:4584:0:b0:430:96bd:411b with SMTP id ffacd0b85a97d-43096bd49cbmr10350650f8f.58.1765885328097;
        Tue, 16 Dec 2025 03:42:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b85d1esm35406315f8f.26.2025.12.16.03.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 03:42:07 -0800 (PST)
Date: Tue, 16 Dec 2025 14:42:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
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
Message-ID: <20251216114204.DUEk606TFhUPrxHoDvbGq4sMRkwWV6VBNvlsVl-WS4A@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
commit: 9c06f26ba5f5da14bcac405c7a652dcf578a785d pwm: Add support for pwmchip devices for faster and easier userspace access
config: sparc-randconfig-r072-20251213 (https://download.01.org/0day-ci/archive/20251216/202512161840.rzIo5czd-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512161840.rzIo5czd-lkp@intel.com/

New smatch warnings:
drivers/pwm/core.c:2291 pwm_cdev_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
drivers/pwm/core.c:2325 pwm_cdev_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?

vim +2291 drivers/pwm/core.c

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

if (copy_to_user())
	return -EFAULT;
return 0;

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

if (copy_to_user())
	return -EFAULT;

return 0;

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

