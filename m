Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB5A269811
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Aug 2025 07:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755157088; cv=none; b=PeUTS0JRWHqq+HcFss9450XnRYk8qhKUoAxt80sjjGbEnZ0Tc6+IZuUoustA06xMA5rRiwVI/R1GoBQunZ+lp+L6/+lN2kGjarOoGGPThZejz+a3NysAl5hEdiJ0XU/zI8BuMxYQszt8ca8NWL59+1PoB0wU8sgnbxm5wCqVLKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755157088; c=relaxed/simple;
	bh=eHEaaFhWxmpGZ6BsDeM96GhyH+Ja0jrZRAEmjTePpyM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djBuUbGrEquLO/nbRu7p+6vTC6h3J2piXF/QQHBjn0JuIqQSNDY2G+3mHRlxWEsAUdV4rd/gQAQGB3C8R3dsro+iTRtc9WsA/N8gRnDFd2nskkgTRtYkMaUNIZCVvdO5VBW5diWF5l3abK25bxAAR1OPeww0lZE4t3XEun4cNWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=v/9cVAWm; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="v/9cVAWm"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55ce509127bso495217e87.0
        for <oe-kbuild@lists.linux.dev>; Thu, 14 Aug 2025 00:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755157085; x=1755761885; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=V0Lxf11oo0rXpVqVkWAC0Lw3oNWPIq9I531Yo7XQFWo=;
        b=v/9cVAWmU1dGfBU9iF6LOxgz4vyzpXB/sIO0wW7PIvnaPg8ukZuqPlF1ZbK+8VaOJa
         Iw+vPdsBXbJAjqbEbUPT8TPGRacVHubi96qqHo31B5g6lYoD4kSleIgb3IwcgZjYZQ9z
         r9PlKf+Oc1w6s0XjvkryM+HhYiR9ZtsDjprzeQxv0EQ9jwcKJDZMHo8QiKRODfU2C2Dj
         Bw+7/Htm27lyvLefZttPGg4klnVmygUir9/sj9jGUM3sS/0d+n1REb3swBfnlv/vnqRx
         S35TwbhaFhZS63AXzqDFJTk/vz4DtouRuv/gAsUaoSvBqNpc57M4iWBhidNBUxCwc9rC
         E6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755157085; x=1755761885;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V0Lxf11oo0rXpVqVkWAC0Lw3oNWPIq9I531Yo7XQFWo=;
        b=VwCPsAZJgYRHTghJ+HMsQoJ1Z4MeI7AAuVrIjXfVR0SC2+jHAGPeMRDsSINi6GXixm
         QXf+tyMsDOFenY2IztHxxAHiZyYIV8HJWCvf0dG0Yyi0CHvDVZJhP9+OH1JuYt5Ifqu8
         CQnzlY68SIu0ysoU1aqlrQ5I2MwUqNOUpBdDp7kt/1URGqg3s7De32VoT/JSxRGbirCD
         h0A5M0mYVJbuyaupgLeSaFu6DUSoka5WHNeT4aFR+yH4dJ9yUCnH9Bey4G+hVoGSfy+3
         GI9EepIiHOZ9iWtCvYX8ZgYHoNEuKoqfFYGslbYLA4OzFCupR7JVcQ1knlG7JDHfPBvl
         2fog==
X-Forwarded-Encrypted: i=1; AJvYcCWpCJFE4Yl2IHR5sa9XFo7G/FfJ08Kxs06WOy0FTZ1Ew0zek9JUv2k3wXfXhATPzsn70QcNHDMKJjk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuWni4TUv7BwD8cz2gOx7MupNy9Mzu/BLqK+ZePi9Ebh/BgkGC
	HEp+FnlyDNR0hPADydfIYNpCXCf6ZTmaJwF8B0K3us7KDXussSVtRL3L1QiyMjauJ5ia7KDNIyI
	iPBg6DS4vkBHcIjqtdHUlHU3F0bcouTsuA1qbbVI9Aw==
X-Gm-Gg: ASbGncvwzTPar3X8BubZmlGESoP9y5qOpivIA/IBbI+GZ9J8kC4vbIUdzJxXZB7ka5t
	W2IjP2KaDoSiSILMB8SUWNYhP680RQckefdv3lIUb9za5M/n5J460XTS6C5fjN0h3/U9vsN16h3
	AxYfCoBDv1eNdDg9i8I6K8ti9p+xTr+Rk3Cbd/Q0M5V2EAEPTgSChlX/Ho7DGD3ptrSqs+uCsCY
	M8Y+Oqy1iLlIdOOYnwCawr1qO1u6rirSrgQOg8=
X-Google-Smtp-Source: AGHT+IG9Sl+u2grYbtl9VyHR7FB/EIlQJH9069FCUB+rot4YASaNIAY4/eCkV0SN9BOXHpsLTMBv/3IhK6/GlJjDcdg=
X-Received: by 2002:a05:6512:1443:20b0:553:2dce:3aad with SMTP id
 2adb3069b0e04-55ce5032e9dmr473870e87.7.1755157085087; Thu, 14 Aug 2025
 00:38:05 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Aug 2025 03:38:04 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Aug 2025 03:38:04 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <202508132044.XYcvSpm4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202508132044.XYcvSpm4-lkp@intel.com>
Date: Thu, 14 Aug 2025 03:38:04 -0400
X-Gm-Features: Ac12FXwIeOZwq8h4NYacnkD7oHaEb0grLTUUlutgQw1Q4iS255cFgjytfxzGOEg
Message-ID: <CAMRc=Me+5CSzH0bO=DvMvzdm9eAGHJpz=9NK=O8_E1gVXRvnUg@mail.gmail.com>
Subject: Re: [PATCH v4 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, oe-kbuild@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Aug 2025 16:17:12 +0200, Dan Carpenter
<dan.carpenter@linaro.org> said:
> Hi Bartosz,
>
> kernel test robot noticed the following build warnings:
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/devres-provide-devm_kmemdup_const/20250812-170336
> base:   8f5ae30d69d7543eee0d70083daf4de8fe15d585
> patch link:    https://lore.kernel.org/r/20250812-pinctrl-gpio-pinfuncs-v4-12-bb3906c55e64%40linaro.org
> patch subject: [PATCH v4 12/15] pinctrl: allow to mark pin functions as requestable GPIOs
> config: um-randconfig-r072-20250813 (https://download.01.org/0day-ci/archive/20250813/202508132044.XYcvSpm4-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202508132044.XYcvSpm4-lkp@intel.com/
>
> smatch warnings:
> drivers/pinctrl/pinmux.c:96 pinmux_can_be_used_for_gpio() warn: variable dereferenced before check 'desc' (see line 92)
>
> vim +/desc +96 drivers/pinctrl/pinmux.c
>
> 7cc4e6b0e4ddf6 Andy Shevchenko     2023-11-29   88  bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned int pin)
> 472a61e777fe78 Stefan Wahren       2019-08-14   89  {
> 472a61e777fe78 Stefan Wahren       2019-08-14   90  	struct pin_desc *desc = pin_desc_get(pctldev, pin);
> 472a61e777fe78 Stefan Wahren       2019-08-14   91  	const struct pinmux_ops *ops = pctldev->desc->pmxops;
> 6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  @92  	const struct pinctrl_setting_mux *mux_setting = desc->mux_setting;
>                                                                                                         ^^^^^^^^^^^^^^^^^
> Patch adds a new dereference.
>
> 6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12   93  	bool func_is_gpio = false;
> 472a61e777fe78 Stefan Wahren       2019-08-14   94
> 472a61e777fe78 Stefan Wahren       2019-08-14   95  	/* Can't inspect pin, assume it can be used */
> 6ba2fd391ac58c Alexandre Torgue    2019-12-04  @96  	if (!desc || !ops)
>                                                             ^^^^^
> The old code assumed desc could be NULL.
>
> 472a61e777fe78 Stefan Wahren       2019-08-14   97  		return true;
> 472a61e777fe78 Stefan Wahren       2019-08-14   98
> 5a3e85c3c397c7 Mukesh Ojha         2024-10-15   99  	guard(mutex)(&desc->mux_lock);
> 6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  100  	if (mux_setting && ops->function_is_gpio)
> 6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  101  		func_is_gpio = ops->function_is_gpio(pctldev, mux_setting->func);
> 6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  102
> 6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  103  	if (ops->strict && desc->mux_usecount && !func_is_gpio)
> 472a61e777fe78 Stefan Wahren       2019-08-14  104  		return false;
> 472a61e777fe78 Stefan Wahren       2019-08-14  105
> 472a61e777fe78 Stefan Wahren       2019-08-14  106  	return !(ops->strict && !!desc->gpio_owner);
> 472a61e777fe78 Stefan Wahren       2019-08-14  107  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>

Thanks for the heads-up, I'll fix it in v5.

Bartosz
