Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ED91B4156
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Aug 2025 14:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755094641; cv=none; b=f2iZ9PEu4Qi2OAVZc97yB30KQmcJL3cQAUlsT/QoaqSm9oJyhyqsxuf2Oxc7usE7smE60Ji5Q6kaWivTSeqKPpB2+JZESsJjuf7L6whJRU88B5oe34IiDTwR3Z2LldrlRQeHgRt2iyzxhKwXfIBc/8Ezu1qlSj2ILDrN1Z1NQUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755094641; c=relaxed/simple;
	bh=1mSZldsWdWCxke6BuMqVOJ3P1vSpvBSc28O3RhuVlno=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=knuCu67zYiT6f+cgNh9aigkS2z4Zxf1IYbYxO2Xuvat65s9UnPgsij5wLzkDnPyCEwDwyD0kh1dt1LoUC5V9FhA0kZXXib1HamdkRAJ/9AoerwkjPT7b2/Jq5BpNNX/8dZalvuhgTG76ujgGPtmns5NWbGGCE74ARLcZ3mkzkoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T9u0KzD0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T9u0KzD0"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-458c063baeaso36330345e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 13 Aug 2025 07:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755094636; x=1755699436; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xFS6u4c/Ebcc668GacdL60NXtwjSwFQiJomUL8MmBtI=;
        b=T9u0KzD0ciz1M7pmajrUP8LnjjujtP0stgNCQCN9aQ6Zidzf+ofWuVarlsWwDliNiV
         4fvAhzHDYA7Y1vGtFjK7GYYHcQl4RXet30U+QNzqf/hYNPAecaRTuzkS6QJ3tpbiX4EB
         +XPWop4cj+qgsDgj2Bww3sSLgBcFVMrwrzGgClIXbxfRGXEWNaPJVYwiy2UaCdcGeXQa
         0VqU+HvQFJSOV5tkPMRrvSHs61+IQL+MX24XFPeqRY7VDORwASt+YY2WqobZqjC2xSlu
         Iv9tl+wZ0amxNKz7MacyfgyEUJO/Wryk8SpLS/2OOX9Qr1YXyL2VuBsNsKzDBsSNFDGU
         T7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755094636; x=1755699436;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFS6u4c/Ebcc668GacdL60NXtwjSwFQiJomUL8MmBtI=;
        b=aA2Su269KmOhxUv40VDA2m965+5ulNLTuevXEvoUjEv5MSHMMpU0mh2453w9VpCr72
         0hCkyjFliFFq+H4k8g/xXabgx4mU2xedCNIEv6+dveN0qza3fWm1znlMntNhG1Vy+vdZ
         2qDfTBpW/4EUDZLTkqt1REJlarQvIWa6cYgR3WjK/FfF0o/qO65jSynL7DpQXj+4kH0n
         EykAnNqRz6QAYLgLCB658cXXug7jAtao/liTqOTqwx0w2lVdaijvwDfdAu7vmet1txm4
         zphiOSFYUvfAsO92lT1M6cXl9pk+PsBT8YOdfPr+gQqNIz7g7aYsmAA2zzfy840MgjLJ
         3cfA==
X-Gm-Message-State: AOJu0YzifjGU6YCbQX3szS5f3GIk+f8wZbeXS61whaMVmluqwUPc4pI6
	PSNyddOoK3pYyOKOOq5tjeBGzdEfOrr9kvU9CxIv/Sk2hTOyr7Rpf0Qfg15+RYq+Vq4CMG4aRAN
	CkAhd
X-Gm-Gg: ASbGnctUq2eEu30MgS2jRMeqJxztht6uRVqvWGpWRPHNIPizttsTLfOMw5G//u7fbgE
	K0G8A0H/eHYTIDyVDhMWKSYJ29jBi0oH5z87yRCH8b8Dkb9YwqWDTHaBKL0rm3aDJUDqr9qD6vq
	0bI8DK/ORydTrTtmKWOeYshUa2vbAi64Vhg2DxXbN7Ty3TH2OgAk8Ief5RXE6FBD0S0cqoGzUQR
	38aw7zqftTBJ5YfLBJ587clHYAnj9BP2RuINIIEZEcjl7t2j+OwYvJHRPAKya7kcbWD38wpi8q8
	cDkTSxfJQ7LT7t7CZV0DlgFxSN8zWj48X0DJ6FkF2eFSXJe2oJtbW+jfxFu6CgA9ytYTVNvwECQ
	dQaz7DLPQyCQZ/pSTo6QPI1lyf508FaTWXRVHU40x+7Q=
X-Google-Smtp-Source: AGHT+IFQVKMSuayh/HxTBQ1FEx8ZnIBjMw+kNTZelmm0ds2gq+mUAt7QOMh3QsWj7BFZNdcmdXCzEw==
X-Received: by 2002:a05:600c:19cf:b0:458:bfe1:4a91 with SMTP id 5b1f17b1804b1-45a166350a2mr26900635e9.20.1755094636463;
        Wed, 13 Aug 2025 07:17:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c4534b3sm47750500f8f.47.2025.08.13.07.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 07:17:16 -0700 (PDT)
Date: Wed, 13 Aug 2025 17:17:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v4 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
Message-ID: <202508132044.XYcvSpm4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-12-bb3906c55e64@linaro.org>
Message-ID: <20250813141712.kRZyh0jsYm_HmCqfY5l6eiDJX3EG4NVLtXYK5RCrTTo@z>

Hi Bartosz,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/devres-provide-devm_kmemdup_const/20250812-170336
base:   8f5ae30d69d7543eee0d70083daf4de8fe15d585
patch link:    https://lore.kernel.org/r/20250812-pinctrl-gpio-pinfuncs-v4-12-bb3906c55e64%40linaro.org
patch subject: [PATCH v4 12/15] pinctrl: allow to mark pin functions as requestable GPIOs
config: um-randconfig-r072-20250813 (https://download.01.org/0day-ci/archive/20250813/202508132044.XYcvSpm4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508132044.XYcvSpm4-lkp@intel.com/

smatch warnings:
drivers/pinctrl/pinmux.c:96 pinmux_can_be_used_for_gpio() warn: variable dereferenced before check 'desc' (see line 92)

vim +/desc +96 drivers/pinctrl/pinmux.c

7cc4e6b0e4ddf6 Andy Shevchenko     2023-11-29   88  bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned int pin)
472a61e777fe78 Stefan Wahren       2019-08-14   89  {
472a61e777fe78 Stefan Wahren       2019-08-14   90  	struct pin_desc *desc = pin_desc_get(pctldev, pin);
472a61e777fe78 Stefan Wahren       2019-08-14   91  	const struct pinmux_ops *ops = pctldev->desc->pmxops;
6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  @92  	const struct pinctrl_setting_mux *mux_setting = desc->mux_setting;
                                                                                                        ^^^^^^^^^^^^^^^^^
Patch adds a new dereference.

6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12   93  	bool func_is_gpio = false;
472a61e777fe78 Stefan Wahren       2019-08-14   94  
472a61e777fe78 Stefan Wahren       2019-08-14   95  	/* Can't inspect pin, assume it can be used */
6ba2fd391ac58c Alexandre Torgue    2019-12-04  @96  	if (!desc || !ops)
                                                            ^^^^^
The old code assumed desc could be NULL.

472a61e777fe78 Stefan Wahren       2019-08-14   97  		return true;
472a61e777fe78 Stefan Wahren       2019-08-14   98  
5a3e85c3c397c7 Mukesh Ojha         2024-10-15   99  	guard(mutex)(&desc->mux_lock);
6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  100  	if (mux_setting && ops->function_is_gpio)
6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  101  		func_is_gpio = ops->function_is_gpio(pctldev, mux_setting->func);
6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  102  
6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  103  	if (ops->strict && desc->mux_usecount && !func_is_gpio)
472a61e777fe78 Stefan Wahren       2019-08-14  104  		return false;
472a61e777fe78 Stefan Wahren       2019-08-14  105  
472a61e777fe78 Stefan Wahren       2019-08-14  106  	return !(ops->strict && !!desc->gpio_owner);
472a61e777fe78 Stefan Wahren       2019-08-14  107  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

