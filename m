Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA6B148314
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Feb 2024 07:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706774278; cv=none; b=EV+Jh+2Gxdnhh0NWrL0qfJGn+gobweu6fbRlXyz8H6w3lEyiiJMDXdx8DEPIB2/1XtzjC0Ll/ZVJCsu0g+9Tcfzaouq4WhySzSYKrRFZxo7nMOtFUE0Q8iv+LXVhoblOHoa2rkXhSu7AR0ZDBlAr7lT5mJcPRr64tivm59fFKME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706774278; c=relaxed/simple;
	bh=zHgx1yxPEtJn6I5ZMjqwRi/auLuBLlrirM0lCJZ4obU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AfRaym1Y5/ES776BKOog5c8liuocduo7plhMXHX1ZfBMHIzl7pXdP4LpO7kxig3C+qXKXk5KpnzB7xslsVsKBK/uTGvH9uMkzPzOwZ80PEEtrvMbjayYLiTVuH1x0r4Hvssb2m9aBgEhoGP5J6tmjCnr0DDcC/VK8F5T07CA7pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=t+lMhHtG; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="t+lMhHtG"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4bfe7d5ed66so235711e0c.2
        for <oe-kbuild@lists.linux.dev>; Wed, 31 Jan 2024 23:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706774275; x=1707379075; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOd+Adh4tMnpIBR501+yaSVTpr2C2rl5IPddMYlorWw=;
        b=t+lMhHtGfUvOUskQNi2L6nf7puXqzXopOfhr92LzQFDR7cqXUwPt+NsM5Y+URsxPmX
         WRRMnK3B20aIeeW8PgSbqr5psAQuJjEA8sBGJ/2JcB13DSO8+tbcDnM89bns5n5MLsta
         wFMEEgiNC36lgyi2KD5DWXC3EHS9rspn8YCAs/VIKv97H3vk5jQIjW8/nIxarvtvomJ5
         ufGk2cEyPmuviEed2sOZd2IsebYGyrt8WqvrElw8TpMoa7Hj6ihuanF4ODt+aSyC12Z7
         9AHth78p+zJLB94CKFykS8n+K6EBhy2e7EYsGwWOiAmdmUpb/fWdmi+KOddSqo+44h9P
         lBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706774275; x=1707379075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IOd+Adh4tMnpIBR501+yaSVTpr2C2rl5IPddMYlorWw=;
        b=Fkt/2h/yMVMvrusk16pLKtEUUccn3bzxAQt7PfpN12cvPBpd6BFqxSKEW+bkm583tP
         w8HDugxcXBvoNog/ZqPeyAZvhnkE1jcG0ypxoE2xhel1BBUfN4jWsKDuc518uweI4oqF
         kyT/r10PLAUgqAKdBqdlwoUO8q34xiJl38plAtEHg7n2nZaoyGgfNFx+GsfnROvJboPK
         BBlVPjGVsMcutj0m3uOgo8wmWQZ3IW12bJbFnN0T56Gp1T35dylMJ2AeU65sJNgokuEl
         XVq1qSqWQHrNyMBNnfrmG2/OiAkEua/bdFdDaMgZOe58QouZEafHit7kQ0DhZfZQdVrI
         bmKA==
X-Gm-Message-State: AOJu0YwUD5BVQxaVDKWKZXF7JA/LZ6PxrgipU50XLLw842Cwz3s0TGW7
	eKn0vlgd259m0KSknzljZzM0xCXpfYvQX1mzxYp6kMvjWao1GrxnPQWEYCv35ixm8WBxschFQ5v
	6yYI63lTeaYtEdFmLzfzBQnZhSJXtd4eSPW+dSw==
X-Google-Smtp-Source: AGHT+IHBEAlHhTj2gP6eGsaWQjwt4taQ94hYG+agdoXKRJW3+84Zo2FhNUORU0nJaxJzcAij0bWpM0hK7sfu3CDKYW4=
X-Received: by 2002:a05:6122:280b:b0:4b6:bfae:3285 with SMTP id
 en11-20020a056122280b00b004b6bfae3285mr3894123vkb.4.1706774274886; Wed, 31
 Jan 2024 23:57:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240130124828.14678-21-brgl@bgdev.pl> <3ab71aad-757f-4d5e-ac09-fdad75238fa3@moroto.mountain>
In-Reply-To: <3ab71aad-757f-4d5e-ac09-fdad75238fa3@moroto.mountain>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 1 Feb 2024 08:57:44 +0100
Message-ID: <CAMRc=Mdi3DqHsri7Da3xPisC1FyOOwZoYra75qhAWvuneD16Vw@mail.gmail.com>
Subject: Re: [PATCH 20/22] gpio: protect the pointer to gpio_chip in
 gpio_device with SRCU
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>, 
	Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Wolfram Sang <wsa-dev@sang-engineering.com>, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 1, 2024 at 6:03=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> Hi Bartosz,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewsk=
i/gpio-protect-the-list-of-GPIO-devices-with-SRCU/20240130-205537
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gp=
io/for-next
> patch link:    https://lore.kernel.org/r/20240130124828.14678-21-brgl%40b=
gdev.pl
> patch subject: [PATCH 20/22] gpio: protect the pointer to gpio_chip in gp=
io_device with SRCU
> config: i386-randconfig-141-20240131 (https://download.01.org/0day-ci/arc=
hive/20240201/202402010641.idtEaO24-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009=
708b4367171ccdbf4b5905cb6a803753fe18)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202402010641.idtEaO24-lkp@intel.com/
>
> New smatch warnings:
> drivers/gpio/gpiolib.c:4776 gpiolib_dbg_show() error: we previously assum=
ed 'gc' could be null (see line 4773)
>
>
> vim +/gc +4776 drivers/gpio/gpiolib.c
>
> fdeb8e1547cb9d Linus Walleij       2016-02-10  4762  static void gpiolib_=
dbg_show(struct seq_file *s, struct gpio_device *gdev)
> d2876d08d86f22 David Brownell      2008-02-04  4763  {
> 0338f6a6fb659f Bartosz Golaszewski 2023-12-21  4764     bool active_low, =
is_irq, is_out;
> 0338f6a6fb659f Bartosz Golaszewski 2023-12-21  4765     unsigned int gpio=
 =3D gdev->base;
> 3de69ae1c407da Andy Shevchenko     2022-04-08  4766     struct gpio_desc =
*desc;
> 2796d5332f8ac8 Bartosz Golaszewski 2024-01-30  4767     struct gpio_chip =
*gc;
> 3de69ae1c407da Andy Shevchenko     2022-04-08  4768     int value;
> d2876d08d86f22 David Brownell      2008-02-04  4769
> 2796d5332f8ac8 Bartosz Golaszewski 2024-01-30  4770     guard(srcu)(&gdev=
->srcu);
> 2796d5332f8ac8 Bartosz Golaszewski 2024-01-30  4771
> 2796d5332f8ac8 Bartosz Golaszewski 2024-01-30  4772     gc =3D rcu_derefe=
rence(gdev->chip);
> 2796d5332f8ac8 Bartosz Golaszewski 2024-01-30 @4773     if (!gc)
>                                                             ^^^
> The patch adds a NULL check
>
> 2796d5332f8ac8 Bartosz Golaszewski 2024-01-30  4774             seq_puts(=
s, "Underlying GPIO chip is gone\n");
> 2796d5332f8ac8 Bartosz Golaszewski 2024-01-30  4775
> 3de69ae1c407da Andy Shevchenko     2022-04-08 @4776     for_each_gpio_des=
c(gc, desc) {
>                                                                          =
  ^^
> But this dereference isn't checked...  Probably it should return after
> the seq_puts().
>

Of course it should. Thanks. I fixed it for v2.

Bart

> bedc56b1695b27 Bartosz Golaszewski 2024-01-30  4777             guard(src=
u)(&desc->srcu);
> 3de69ae1c407da Andy Shevchenko     2022-04-08  4778             if (test_=
bit(FLAG_REQUESTED, &desc->flags)) {
> 3de69ae1c407da Andy Shevchenko     2022-04-08  4779                     g=
piod_get_direction(desc);
> 3de69ae1c407da Andy Shevchenko     2022-04-08  4780                     i=
s_out =3D test_bit(FLAG_IS_OUT, &desc->flags);
> 234c52097ce416 Andy Shevchenko     2022-04-08  4781                     v=
alue =3D gpio_chip_get_value(gc, desc);
> 3de69ae1c407da Andy Shevchenko     2022-04-08  4782                     i=
s_irq =3D test_bit(FLAG_USED_AS_IRQ, &desc->flags);
> 3de69ae1c407da Andy Shevchenko     2022-04-08  4783                     a=
ctive_low =3D test_bit(FLAG_ACTIVE_LOW, &desc->flags);
> 3de69ae1c407da Andy Shevchenko     2022-04-08  4784                     s=
eq_printf(s, " gpio-%-3d (%-20.20s|%-20.20s) %s %s %s%s\n",
> 32648f473c7f46 Bartosz Golaszewski 2024-01-30  4785                      =
          gpio, desc->name ?: "", gpiod_get_label(desc),
> d2876d08d86f22 David Brownell      2008-02-04  4786                      =
          is_out ? "out" : "in ",
> 3de69ae1c407da Andy Shevchenko     2022-04-08  4787                      =
          value >=3D 0 ? (value ? "hi" : "lo") : "?  ",
> 90fd227029a25b Linus Walleij       2018-10-01  4788                      =
          is_irq ? "IRQ " : "",
> 90fd227029a25b Linus Walleij       2018-10-01  4789                      =
          active_low ? "ACTIVE LOW" : "");
> 3de69ae1c407da Andy Shevchenko     2022-04-08  4790             } else if=
 (desc->name) {
> 3de69ae1c407da Andy Shevchenko     2022-04-08  4791                     s=
eq_printf(s, " gpio-%-3d (%-20.20s)\n", gpio, desc->name);
> 3de69ae1c407da Andy Shevchenko     2022-04-08  4792             }
> 3de69ae1c407da Andy Shevchenko     2022-04-08  4793
> 3de69ae1c407da Andy Shevchenko     2022-04-08  4794             gpio++;
> d2876d08d86f22 David Brownell      2008-02-04  4795     }
> d2876d08d86f22 David Brownell      2008-02-04  4796  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
