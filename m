Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5086117A300
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Jun 2025 17:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751302965; cv=none; b=eaQh1T0+PVXEU2/Ra/wUjtxhbC03U4ghzamlMpgqqUcTXiNWKak4tUXPrB6H+9lLHRCDGForDiIwLz5LeWZ8JfBGIcYge8iWpwW94nF/fw3iGPOOX4KsbuYdfOBq/AgSv7DU2wDDpck9yPsm4qL6Hc57deO70jy1HEWP3bNvYLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751302965; c=relaxed/simple;
	bh=CMyeBEGlwNr4oxYgGYdega85FHznmb5nkXVY1F10Aq4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=jeBdsRCXhMbWoMC1gJzyA3eHtF6rR1uK/PHCJ7N5+Vjae/Vhx9gwHipNDouIZxECFQv4TP1YTAdXA0TydKx93sDHgwNiDIvgwQc/qwxQwk+s7IFTp/WnftHLa0+rvAaTN2XVmKZGoWcVANY9mtewREsXdP4gyLkMSI1611sHImo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MclqrJUV; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MclqrJUV"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72c27166ab3so1713194a34.1
        for <oe-kbuild@lists.linux.dev>; Mon, 30 Jun 2025 10:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751302962; x=1751907762; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s80AY0V8zsRFOqrfnCdCBKawBPLCK4PdIEA9ulbHOXw=;
        b=MclqrJUVZiovm0SAb5MKFYoFpTPbdRl1MfpgIkZ9zEDR177IBbOiB1vDfevve9VVdh
         Nlbu/4cttpKz3DdkLG2xZ2FKVft1PRdt397/2boh4BwWoIshfkYORWkuzPNGWHU6fAYc
         p7plDH3pFlv9Wj2fBMyfKuFqLGCLiKj7NLIHCtlIw3TSImjevmuhY/sG7X2ujsni1nT1
         9k43wqqgzBSX2HP0gNazAfgJ0SIhlfj21AgymXqdYUe79MP6hvf/x+dlj6NB4Asss342
         ywP7GMMQw8pprwdU0h1J9+QxRTBEhs8HIwqFpaz6mymFprsyYaBO4bT+fPIA2CQmBNq1
         eIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751302962; x=1751907762;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s80AY0V8zsRFOqrfnCdCBKawBPLCK4PdIEA9ulbHOXw=;
        b=Ozb35+0SC7uF/aa5f/SlJK/XDWlADl6f68ndzeIxtBT+AwF8dsFjYi/1qBT34266oM
         XhilYQR/Ec+y1yaaPCXxoauxbSFpUHGJ/KbfW0P9+CNql3oYSAcBDG63L30ph1jt7WWP
         haWxm7A7hVp7sWqOYUMq7L5HPLumVt2844kr8LUo2mdoHpzri7QLGn0mSnfXr+osXwN6
         TuVZ/dJdBJCLZefhZUubZQLIQzVZwMIu/GqszWuc/YU+CTddGL58L90JfAIIxcSs17EK
         6EmuZ1nG8SywgFduVykTQv2MxF08lGZKkvDYW+f2dsTE5FL044x4/f+OajTEbb0F0Edc
         Nxsw==
X-Gm-Message-State: AOJu0YyOGZmt+f5S9UyN/KOrGccvdWKztNq1YTJSGtXypXnP3Hm0h+Tv
	2cMOH9/h8yC7WDzVyAKhB16dhjmloaaWypkUB6DKAumP1NsSjdeKzE0W61UGtTrPUZuQGfzlK2Q
	6cz9IqzE=
X-Gm-Gg: ASbGncvnFVjR/d7+vL9RtevFpRWaAIDiUpjNGPNehzjlSOb02yjOUWXVVBwBnQeRw+c
	P9NP/1eciymtQWZ+ARDz3YH18HeueFCXVI0Tj9Hq9TFZ6UiZDz3fGvTVtONSPlBCWARJ9nd/CGk
	AbEpLc2c8jSPwoZQZB2Ctma3RXeTuAgWwRW4/pPZOtPjxvaASGeUcCh/X7a8mt7dtm01tsbCfLF
	aK1OrwJ02tpDzs19PCzauUUv5zV12IhubZU75c+CiktEhJfzc06DrsoJFzpkdMuZdFL8Ed+GHsj
	IOig3v0q0krf9TnV91zER5XCmHVmyMaY8tXYfzYWWnT9zR1d4VkP4mBWrh0v7TKoTV8T
X-Google-Smtp-Source: AGHT+IErtMNluGJqLpQ6IvXLyXXU3xsWHi+RjVcEzBvYxTHuw8Xp0gigRtrByUhZ29F0th2SUN1x/Q==
X-Received: by 2002:a05:6830:3494:b0:73b:267c:497b with SMTP id 46e09a7af769-73b267c4bf2mr3846280a34.16.1751302961369;
        Mon, 30 Jun 2025 10:02:41 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb122bb7sm1735479a34.60.2025.06.30.10.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 10:02:40 -0700 (PDT)
Date: Mon, 30 Jun 2025 20:02:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, quic_satyap@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@oss.qualcomm.com,
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Subject: Re: [PATCH v2] soc: qcom: llcc: Add per slice counter and common
 llcc slice descriptor
Message-ID: <b8ce895f-0c7a-4b69-a2ce-27e41af96fb9@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-llcc_refcount-v2-1-d05ec8169734@oss.qualcomm.com>

Hi Unnathi,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Unnathi-Chalicheemala/soc-qcom-llcc-Add-per-slice-counter-and-common-llcc-slice-descriptor/20250627-060459
base:   f02769e7f272d6f42b9767f066c5a99afd2338f3
patch link:    https://lore.kernel.org/r/20250626-llcc_refcount-v2-1-d05ec8169734%40oss.qualcomm.com
patch subject: [PATCH v2] soc: qcom: llcc: Add per slice counter and common llcc slice descriptor
config: um-randconfig-r071-20250630 (https://download.01.org/0day-ci/archive/20250630/202506301401.m1NkXwJf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506301401.m1NkXwJf-lkp@intel.com/

smatch warnings:
drivers/soc/qcom/llcc-qcom.c:3859 llcc_slice_getd() warn: passing zero to 'ERR_CAST'

vim +/ERR_CAST +3859 drivers/soc/qcom/llcc-qcom.c

a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3853  struct llcc_slice_desc *llcc_slice_getd(u32 uid)
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3854  {
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3855  	const struct llcc_slice_config *cfg;
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3856  	u32 sz, count;
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3857  
bc13c2450f770e drivers/soc/qcom/llcc-qcom.c  Unnathi Chalicheemala 2025-06-26  3858  	if (IS_ERR(drv_data) || !drv_data)

Why are we adding a NULL check here?  So far as I can see, this
can only be NULL in probe() between the failed allocation and
the error handling.  Can actually reach this function during that
stage of the probe()?

Also it feels like it's not done consistenly at all.  Why does
llcc_update_act_ctrl() not check for NULL?

Right now we're returning:
1) -EPROBE_DEFER if probe hasn't been called
2) NULL if it hasn't succeeded and we hit a (very narrow) race window
3) or -EPROBE_DEFER if probe() has failed.

If we really hit a NULL here then we should probably return
-EPROBE_DEFER and not ERR_CAST(NULL).  It needs to be documented.
Btw, I've written a blog about how NULL and error pointers are
supposed to work when you use a mix or error pointers and NULL.

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

regards,
dan carpenter

72d1cd033154f5 drivers/soc/qcom/llcc-slice.c Jordan Crouse         2018-12-11 @3859  		return ERR_CAST(drv_data);
72d1cd033154f5 drivers/soc/qcom/llcc-slice.c Jordan Crouse         2018-12-11  3860  
bc13c2450f770e drivers/soc/qcom/llcc-qcom.c  Unnathi Chalicheemala 2025-06-26  3861  	if (IS_ERR_OR_NULL(drv_data->desc) || !drv_data->cfg)
bc13c2450f770e drivers/soc/qcom/llcc-qcom.c  Unnathi Chalicheemala 2025-06-26  3862  		return ERR_PTR(-ENODEV);
bc13c2450f770e drivers/soc/qcom/llcc-qcom.c  Unnathi Chalicheemala 2025-06-26  3863  
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3864  	cfg = drv_data->cfg;
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3865  	sz = drv_data->cfg_size;
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3866  
bc13c2450f770e drivers/soc/qcom/llcc-qcom.c  Unnathi Chalicheemala 2025-06-26  3867  	for (count = 0; count < sz; count++, cfg++)
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3868  		if (cfg->usecase_id == uid)
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3869  			break;
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3870  
bc13c2450f770e drivers/soc/qcom/llcc-qcom.c  Unnathi Chalicheemala 2025-06-26  3871  	if (count == sz)
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3872  		return ERR_PTR(-ENODEV);
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3873  
bc13c2450f770e drivers/soc/qcom/llcc-qcom.c  Unnathi Chalicheemala 2025-06-26  3874  	return &drv_data->desc[count];
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3875  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

