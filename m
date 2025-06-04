Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73131E5B9F
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Jun 2025 16:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749055344; cv=fail; b=gGn7lv74aXwmcwD83dGRqca5aeA5aaFU5/SwhG2CpoPiUq+Gb6/1ONUZQkX/DWgMFwwDja84Ms0cmoZexRpF9/mUj/J0yEPhHvRrz4YlSdpPOxUW67XNVKXNl13hrn+rydtNJkAU2tPTw5IqCnsEkfcojxQNO0IE18NVvn/zCrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749055344; c=relaxed/simple;
	bh=/S9rf6VzKpE61RcehZAvPdtnT1c470ZubspSzJWLnMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QCWXZdmyA3QYvOmOxXS6gXfryqfX2JlItSsp+BbLB3fhdRJDbLvV/VAvNJ0Fcd7NBT7fazcrUHyLGNeuLrFs18EmszIuT+kn1QSjdP7pA1XNncrHsZScSKGQey+EabZIc0UC/s6XRuHeJq3UceYWeyogxcFd7fr+t7yBF9pcfnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=fail (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n2GOVQ4p reason="signature verification failed"; arc=fail smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2GOVQ4p"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so14022678a12.2
        for <oe-kbuild@lists.linux.dev>; Wed, 04 Jun 2025 09:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749055340; x=1749660140;
        h=dkim-signature:content-disposition:mime-version:message-id:subject
         :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfvZmaO26B4SK7YZwuEZZbHrx94IG+c+gJCWrwJAEfw=;
        b=EpmtnVhySApRDlEjzDa29FOfp1mgXZ/N9koZy/VeuYDcu0GQ5joRUdkmBzBOs/GueG
         op95HDhFYTxNSFrEgIr0ztERbCi7bOlsJWcgjNP90cxDSOWSArvmB3IJVwoT34xjTZcd
         XDj4mjeN5w/U35dkZCl1bPuX9gMem22AXzEtT8AUowpgRUTKPywqUo7QwsMEHXu38Wak
         J2y7M7YOY0imnoJtXiV7ITH1HGOtfJghOmN67eyP1IhaZj0mEAsy1ClL7ZGRVA5Z/HYL
         MBoyktb5IfzVFidOdbQoNqElMFwnNAq3UApKcOIbjkoa4zUu8p0uorskwktepRzWdMB6
         v5Eg==
X-Gm-Message-State: AOJu0YwT2r/927aD/8LTETeK+UeuWR8n5oyxAiTaEpO8tuYrdnLZDOrn
	yu+4L6dFoh819GW59KwPEJehNn+RRcWm4g0IKP4D7SiPkYgfPBq3cq6/T57xTgI3ji/IDY3kaHf
	Ey1/+
X-Gm-Gg: ASbGncsURAcsYG1wmJkfZ9kEPlzsgDHK6/LTC1saS6VpaKfQgNttfODQIl0Xz23Dsxg
	UoJEZK3qDg0qla47OM/qH2JRp375/1uLrleHGpRjCylNHUIq4wzXJFa8h5d8kKOM/iUj4eqap9n
	+MCc6XdsQBJuW5ahuAlxpegBWGDsQtKsNkGfo/UmPtbEkIigTmVZtgGLIut+LV18jAibSJklJfM
	rzrqJDtqV9lSgvnefUMAE/05kd2NGUNtccu15sSFfnZUfKpltzAR18IeA8ifNBS0g8EgTDkSrR8
	TkuKqs9HyLdiOPN2WF1pd09hoEDWS7nmdi/eai8wJA3i+iqaVQb+Ntc4mirIXt2mRg==
X-Google-Smtp-Source: AGHT+IG5RLQxjLf8KCl+HoVt+HmNopSFFQxpne1lA5CdQ6LwkA8APiJ7NNfus6agczG2ljXcPCJhFA==
X-Received: by 2002:a05:6402:5c9:b0:5fd:c426:9d17 with SMTP id 4fb4d7f45d1cf-606ea38e9edmr3764697a12.34.1749055339571;
        Wed, 04 Jun 2025 09:42:19 -0700 (PDT)
Received: from localhost ([41.210.155.222])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6070d3961aasm448809a12.36.2025.06.04.09.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 09:42:19 -0700 (PDT)
Date: Wed, 4 Jun 2025 19:42:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] media: i2c: ds90ub960: Add support for DS90UB954-Q1
Message-ID: <202506042333.FlFAp4mW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received: from imap.gmail.com (108.177.15.109:993) by stanley.mountain with
 IMAP4-SSL getmail6 msgid:674269650/317222; 04 Jun 2025 15:46:29 -0000
Received: by 2002:a5d:5902:0:b0:3a4:dc6b:d73b with SMTP id v2csp3225283wrd;
 Wed, 4 Jun 2025 08:46:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2;
 AJvYcCUQqPyTqWxDic94IDvLR0V3soTYHeG7TaMvfWgv/eIufK7BlFPGwfCBjMfZO35k0hyh7OoaHf2f@gmail.com
X-Received: by 2002:a05:6300:8986:b0:218:d024:11f5 with SMTP id
 adf61e73a8af0-21d362a1f56mr31444637.3.1749051968065;        Wed, 04 Jun 2025
 08:46:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749051968; cv=none;        d=google.com;
 s=arc-20240605;
 b=OKKRUQI94hYYSL4hRib44DVDJ6BrpoPycLecNHMBQCpu715lbuGQ+uhbKiJhvd7CzK
 lKtEKSXEXWrCXVFcVYOY6rYOEESwq7Lcw+Rj2PUBy7J8iSbwmthCguaSUm4z/kICJ/ex
 b3++Zj4j1uCapdbXJpG+GKvOEbdzWfSr4HLFFq/wMloWsFbR9NVFq1lTXvDdEtACPl6C
 zfMXz0PwvB6o8nimxJYRjq3p98JcfiKz4NKQQ9c5EEXZMRReG0YEmybbew53pQ5AI3u3
 KWpshfwbv+9WrgDgJZgo/yAdDiPgZhqCUHzXt2rb2JjXsku+ZJFWPcY4PvT8z0Geliww XsKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :dkim-signature; bh=OlkgarZ3+t6l774+JAVP7rL8t/r14nmp2wKLKTYIRzU=;
 fh=STwU/6nAwSVI2oUzRWkoH/BhmoKW+LI2Ifd8kl7IM00=;
 b=CaDIDkEgMHhP8Fkmc/5aenNy3a7RpaZi2Q/6zZweSQCzC2eTVGdkiTH0/7uHQGJR7C
 6tzAyXg6FxJY9sl07qVWRRjNF2DZ/VFQZcDww1z6eXcKFwaVawlFpbLUSCgEmAcygykL
 3LjpI4RSWeLf6FXj2cBp+VkWkaY5ZeiWp4Aab4uFrmGbp70zE4bULHDQxCkjgCRFh1RX
 jRmKl4bC7BgXB552rWotmTD5CXcSOGeErHlsrTE6quRJlfFaWuBftvRLPjdKYul2druW
 SuGkOH/W5yrGmKdZSnQ8esLppRSUCcd2ciHurCu1dY99s0o/ty3l+FXd2cIXfeKhI8l5 f3JA==;
 dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;       dkim=pass
 header.i=@intel.com header.s=Intel header.b=n2GOVQ4p;       spf=pass
 (google.com: domain of lkp@intel.com designates 192.198.163.13 as permitted
 sender) smtp.mailfrom=lkp@intel.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=intel.com
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.13]) by
 mx.google.com with ESMTPS id
 41be03b00d2f7-b2eceaf8a17si16019676a12.129.2025.06.04.08.46.07        for
 <dan.carpenter@linaro.org>        (version=TLS1_2
 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);        Wed, 04 Jun 2025
 08:46:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of lkp@intel.com designates
 192.198.163.13 as permitted sender) client-ip=192.198.163.13;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;  d=intel.com;
 i=@intel.com; q=dns/txt; s=Intel;  t=1749051968; x=1780587968;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=5d9mrXwGKPol2PIuu1H8s8JKI/XUBuCPvViEAgmKikQ=;
 b=n2GOVQ4plClU0OgeY029YHBCxLWtGqQb8b76bi9ANyFRx/75b07UYqbE
 SPYOqmELv4pr+WBiwcKKk9N7pMHFyYyg2Z+U3ODdTMQMrpaP/+EBE9Mt0
 2kwX5HbilUf1TYHU5DR3i56e8moPskrTClrH4DMkmR5pJaEQYBErMO6wd
 tARYEm8euXHVgU18CroGpEDvEivuZSpQkM4GZ4VuaZAwI9x3z3//QPW5x
 fqekUyhIx+Galyu+15+f2gtDsobxr17XKU5IbV0kg4XbvaOndu7ZrXaqL
 f8UXu/rwY6a0gZh0wmiUHk0Dwg9ON+kVZ/ZjfYy7ufLiwZSN0wo3rpXbF   g==;
X-CSE-ConnectionGUID: WuIBlnmrRZyUU2HKGRvZcA==
X-CSE-MsgGUID: giYovQFDSn6VGjTewnQigw==
Received: from fmviesa002.fm.intel.com ([10.60.135.142])  by
 fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun
 2025 08:46:07 -0700
X-CSE-ConnectionGUID: lNAoFiVpR4GDsLwlNhK3rw==
X-CSE-MsgGUID: 7T6Et79rTrShj3Sb0uQG5g==
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2)
 ([10.239.97.150])  by fmviesa002.fm.intel.com with ESMTP; 04 Jun 2025
 08:46:05 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96) (envelope-from
 <lkp@intel.com>) id 1uMqJX-0003GD-2A; Wed, 04 Jun 2025 15:46:03 +0000
Message-ID: <20250604164214.gwmLcTDRVbfFP1Nj5jJddwZt7F4khAppPxzsbW45Saw@z>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250523083655.3876005-3-y-abhilashchandra@ti.com>
References: <20250523083655.3876005-3-y-abhilashchandra@ti.com>
TO: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
TO: tomi.valkeinen@ideasonboard.com
TO: mchehab@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: hverkuil@xs4all.nl
CC: sakari.ailus@linux.intel.com
CC: laurent.pinchart@ideasonboard.com
CC: vaishnav.a@ti.com
CC: u-kumar1@ti.com
CC: jai.luthra@linux.dev
CC: linux-media@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: y-abhilashchandra@ti.com

Hi Yemike,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yemike-Abhilash-Chandra/media-dt-bindings-ti-ds90ub960-Add-bindings-for-DS90UB954-Q1/20250523-164041
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250523083655.3876005-3-y-abhilashchandra%40ti.com
patch subject: [PATCH 2/2] media: i2c: ds90ub960: Add support for DS90UB954-Q1
config: arc-randconfig-r071-20250604 (https://download.01.org/0day-ci/archive/20250604/202506042333.FlFAp4mW-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506042333.FlFAp4mW-lkp@intel.com/

smatch warnings:
drivers/media/i2c/ds90ub960.c:5046 ub960_enable_core_hw() error: uninitialized symbol 'refclk_freq'.

vim +/refclk_freq +5046 drivers/media/i2c/ds90ub960.c

afe267f2d368f5 Tomi Valkeinen          2023-06-19  4981  static int ub960_enable_core_hw(struct ub960_data *priv)
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4982  {
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4983  	struct device *dev = &priv->client->dev;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4984  	u8 rev_mask;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4985  	int ret;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4986  	u8 dev_sts;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4987  	u8 refclk_freq;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4988  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4989  	ret = regulator_enable(priv->vddio);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4990  	if (ret)
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4991  		return dev_err_probe(dev, ret,
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4992  				     "failed to enable VDDIO regulator\n");
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4993  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4994  	ret = clk_prepare_enable(priv->refclk);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4995  	if (ret) {
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4996  		dev_err_probe(dev, ret, "Failed to enable refclk\n");
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4997  		goto err_disable_vddio;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4998  	}
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4999  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5000  	if (priv->pd_gpio) {
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5001  		gpiod_set_value_cansleep(priv->pd_gpio, 1);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5002  		/* wait min 2 ms for reset to complete */
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5003  		fsleep(2000);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5004  		gpiod_set_value_cansleep(priv->pd_gpio, 0);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5005  		/* wait min 2 ms for power up to finish */
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5006  		fsleep(2000);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5007  	}
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5008  
8f512c3113756c Tomi Valkeinen          2025-03-03  5009  	ret = ub960_reset(priv, true);
8f512c3113756c Tomi Valkeinen          2025-03-03  5010  	if (ret)
8f512c3113756c Tomi Valkeinen          2025-03-03  5011  		goto err_pd_gpio;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5012  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5013  	/* Runtime check register accessibility */
24868501a74402 Tomi Valkeinen          2025-03-03  5014  	ret = ub960_read(priv, UB960_SR_REV_MASK, &rev_mask, NULL);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5015  	if (ret) {
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5016  		dev_err_probe(dev, ret, "Cannot read first register, abort\n");
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5017  		goto err_pd_gpio;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5018  	}
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5019  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5020  	dev_dbg(dev, "Found %s (rev/mask %#04x)\n", priv->hw_data->model,
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5021  		rev_mask);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5022  
24868501a74402 Tomi Valkeinen          2025-03-03  5023  	ret = ub960_read(priv, UB960_SR_DEVICE_STS, &dev_sts, NULL);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5024  	if (ret)
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5025  		goto err_pd_gpio;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5026  
ba3bdb93947c90 Tomi Valkeinen          2024-12-06  5027  	if (priv->hw_data->is_ub9702)
24868501a74402 Tomi Valkeinen          2025-03-03  5028  		ret = ub960_read(priv, UB9702_SR_REFCLK_FREQ, &refclk_freq,
24868501a74402 Tomi Valkeinen          2025-03-03  5029  				 NULL);
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5030  	else if (priv->hw_data->is_ub954) {
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5031  		/* From DS90UB954-Q1 datasheet:
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5032  		 * "REFCLK_FREQ measurement is not synchronized. Value in this
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5033  		 * register should read twice and only considered valid if
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5034  		 * REFCLK_FREQ is unchanged between reads."
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5035  		 */
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5036  		unsigned long timeout = jiffies + msecs_to_jiffies(100);
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5037  
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5038  		do {
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5039  			u8 refclk_new;
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5040  
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5041  			ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_new,
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5042  					 NULL);
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5043  			if (ret)
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5044  				goto err_pd_gpio;
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5045  
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23 @5046  			if (refclk_new == refclk_freq)
                                                                                                  ^^^^^^^^^^^
This is uninitialized on the first iteration.

8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5047  				break;
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5048  			refclk_freq = refclk_new;
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5049  		} while (time_before(jiffies, timeout));
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5050  	}
ba3bdb93947c90 Tomi Valkeinen          2024-12-06  5051  	else
24868501a74402 Tomi Valkeinen          2025-03-03  5052  		ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_freq,
24868501a74402 Tomi Valkeinen          2025-03-03  5053  				 NULL);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5054  	if (ret)
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5055  		goto err_pd_gpio;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5056  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5057  	dev_dbg(dev, "refclk valid %u freq %u MHz (clk fw freq %lu MHz)\n",
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5058  		!!(dev_sts & BIT(4)), refclk_freq,
a56fac44beced4 Tomi Valkeinen          2024-12-06  5059  		clk_get_rate(priv->refclk) / HZ_PER_MHZ);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5060  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5061  	/* Disable all RX ports by default */
24868501a74402 Tomi Valkeinen          2025-03-03  5062  	ret = ub960_write(priv, UB960_SR_RX_PORT_CTL, 0, NULL);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5063  	if (ret)
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5064  		goto err_pd_gpio;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5065  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5066  	/* release GPIO lock */
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5067  	if (priv->hw_data->is_ub9702) {
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5068  		ret = ub960_update_bits(priv, UB960_SR_RESET,
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5069  					UB960_SR_RESET_GPIO_LOCK_RELEASE,
24868501a74402 Tomi Valkeinen          2025-03-03  5070  					UB960_SR_RESET_GPIO_LOCK_RELEASE,
24868501a74402 Tomi Valkeinen          2025-03-03  5071  					NULL);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5072  		if (ret)
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5073  			goto err_pd_gpio;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5074  	}
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5075  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5076  	return 0;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5077  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5078  err_pd_gpio:
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5079  	gpiod_set_value_cansleep(priv->pd_gpio, 1);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5080  	clk_disable_unprepare(priv->refclk);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5081  err_disable_vddio:
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5082  	regulator_disable(priv->vddio);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5083  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5084  	return ret;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5085  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

