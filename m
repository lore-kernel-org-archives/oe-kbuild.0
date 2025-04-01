Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2716FCA4B;
	Tue,  1 Apr 2025 09:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743501334; cv=none; b=pp4Vwg95hvqT6imMN8Rr//z+Za74Y9woL0TbksEuy70Dj4wUpplCcsZBHNw5hSlsdzJbqNSfknQsQtm9o1BjHPn1sZxCy29tBhSdK6gKVVUNG0lWma0tyhLQz3RoJQ4qj1wad9gTBJuuCsTCXYVnK3XuqVPiR5sowxfGWUldeRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743501334; c=relaxed/simple;
	bh=DaFiu67K7g74kHH+8BROL19y49RvpLwbQzTgvg8WvEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pCkHWMELRI2DaoRCvZAjX5wykRxVB3eGcV0u1oL0MAi8Op9HqSmu97ahyETK+qmlBcJzEcZTLG2QDpxsnA7CGeAZNqUd/G7etPisfbSyrdf44JEOCa5I9WsnPoaT5/raDirSZRcA1GY0tqVsxKJY8UjWQtMJQjCtkGMyqWv+osE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86ba07fe7a4so4693683241.2;
        Tue, 01 Apr 2025 02:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743501330; x=1744106130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YiU9ESSdgUcgIcMrB/dk8doesLCwB7oQ7YmNTOXofsc=;
        b=IWm2G65wxiVPkoJo1WPK81NETMaGYFoq3C6jZhHtZv7Dlco+HQc0SVxrdGiQ6elDM/
         234bHTDC0Jzxna9NiixXif4sHPWTm6vpeaYR60+svzWm0JLrd2Rsmq5VaIpLzx+K4aLn
         jxQ8CX1HDJmoJAao8+ixCusZlZ1OaYDqwfVv5le+mOzG8xu8+VipgYjzDSLzeXWEbVlE
         rrGPpJRF8HKJWCkxhoQ9+gM4/mCHlL5hfbmSeA/+2aF29HOSSNI4eUrXjq7gtcAkPhaD
         6TvivluATs/p9Vrh3DCbWIn0qiR51cf9HbbXylCSLTxGd47tAnODZGg4q3TjNW1jpaS9
         a6Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUNRQdMVOYGC07NUzfCFy6IKTU4PWk/xAAKWs+LPeDaSgb57tTFYKVKrewzgaqEtHSvo5l+GhHeSegh@lists.linux.dev, AJvYcCVTgIm9GE4S4sfO7MqyUXQIt5Gf8o4H70+wd9mS0hphAY4W11tX56UlkTNekFjzIgVqQYElGe1IDseYEYco@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3OmGkh2iE129pgb0IGRGeDeyH3e8PEo52RFnUvn5WkaAyeWzF
	S9LcM0+5j18YWL1zX3f5pJBiXK6CxxrLeYdrKMdwLeXrhE52jsdcJyNahpaK
X-Gm-Gg: ASbGncts5KbOqFZXTtPfoJAAVXRm4Mpr8dBABP1YHfYYcxz+/hOEg0JsW5Q9XDZWtRT
	e/9+sZBfhZ+6KDClE/cj7STAKQixCyOzQlP+HHEunH/EhtHyiv83BskE4WfRxgS/9ZvHZRIA/xR
	8IiBsD1Q9F51qfZEwEJdAuF5ei4qUx37I19mrWqe+G43rf982muxChkpSVR8ArZClCph8ooQDFA
	Aqav4Hm7PtTmNWcIXkVXLUz5GSKfm/5mw6YX/lnHg7vrviL+W2J20tEJUOP6C8uoIc+eG4onDOo
	PjUBgwSKystvK9Pjh6yG7uks37DQ41/0G8vXoB1M1RvZyaNMZrqCebfmFoKveSCAAmtdLLMKz+q
	z6uBLRiU=
X-Google-Smtp-Source: AGHT+IGcgZgzF94s3buDFxiPkucZRG23Z55no0Q88DJjJt9/dxQjkLjjb/yu1ZegX1OqYVZe/2GWMw==
X-Received: by 2002:a05:6102:330b:b0:4c1:9288:906c with SMTP id ada2fe7eead31-4c6d388a314mr8218935137.9.1743501330205;
        Tue, 01 Apr 2025 02:55:30 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c6bfcb3aa9sm1933323137.11.2025.04.01.02.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 02:55:29 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86d3ac0fec0so5046434241.1;
        Tue, 01 Apr 2025 02:55:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVU/cL0x0gFvFRigr3amyexQh49tq0Gr1srqxHB5g+iW8vbmLj4OmsmzX67Hj8wD5P+X9+LFV8KW/tD@lists.linux.dev, AJvYcCXBd4muX3mGN8AwtCM06GgSbUAwAuerhHRBGnXCGFbHDS9PaXbugonyDIP7zFdg+jgPLG140QSxVU4F3e/0@lists.linux.dev
X-Received: by 2002:a05:6102:3e24:b0:4bb:cf34:3757 with SMTP id
 ada2fe7eead31-4c6d39bce4cmr7728911137.17.1743501329327; Tue, 01 Apr 2025
 02:55:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <f8480c68-70e3-478b-927f-d21f9d0cef14@stanley.mountain> <Z-u2hqjCjqUDA4PS@errol.ini.cmu.edu>
In-Reply-To: <Z-u2hqjCjqUDA4PS@errol.ini.cmu.edu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Apr 2025 11:55:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUypkzrb_LmUhac656NpgXPoj4jf8fxBV3YrPQ_BXnL=Q@mail.gmail.com>
X-Gm-Features: AQ5f1Jqm5sNdNKE7gp8jTy35mcnqmANOvn19adIXgdwvZ-OMTvk5fnDnOm1oYMg
Message-ID: <CAMuHMdUypkzrb_LmUhac656NpgXPoj4jf8fxBV3YrPQ_BXnL=Q@mail.gmail.com>
Subject: Re: [litex-hub:litex-rebase 6/15] drivers/gpio/gpio-litex.c:228
 litex_gpio_irq_set_type() warn: inconsistent returns '&gpio_s->gpio_lock'.
To: "Gabriel L. Somlo" <gsomlo@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev, 
	Robert Winkler <rwinkler@internships.antmicro.com>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, Marek Czerski <m.czerski@ap-tech.pl>, 
	Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Gabriel,

On Tue, 1 Apr 2025 at 11:48, Gabriel L. Somlo <gsomlo@gmail.com> wrote:
> I've added a fix as `28882b03f381` in the current (for now) litex-rebase
> against current (for now) master `08733088b566`.
>
> I will eventually squash it on top of the original commit, unless
> anyone (Geert?) notices anything still amiss... :)

LGTM.

Alternatively, you could have used the new
scoped_guard(spinlock_irqsave, &gpio_s->gpio_lock), but I like your
current solution that avoids writing to LITEX_GPIO_MODE_OFFSET unless
really needed.

> On Mon, Mar 31, 2025 at 12:38:43PM +0300, Dan Carpenter wrote:
> > tree:   https://github.com/litex-hub/linux litex-rebase
> > head:   896969d069ea7223671dd1aac991c551baa91bac
> > commit: 3eb679a2997bf7eb6be1760544632505440a563f [6/15] LiteX: driver for LiteGPIO interface
> > config: s390-randconfig-r072-20250330 (https://download.01.org/0day-ci/archive/20250330/202503301335.C7M94pcE-lkp@intel.com/config)
> > compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202503301335.C7M94pcE-lkp@intel.com/
> >
> > smatch warnings:
> > drivers/gpio/gpio-litex.c:228 litex_gpio_irq_set_type() warn: inconsistent returns '&gpio_s->gpio_lock'.
> >
> > vim +228 drivers/gpio/gpio-litex.c
> >
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  188  static int litex_gpio_irq_set_type(struct irq_data *idata, unsigned int type)
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  189  {
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  190         struct gpio_chip *chip = irq_data_get_irq_chip_data(idata);
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  191         struct litex_gpio *gpio_s = gpiochip_get_data(chip);
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  192         int offset = irqd_to_hwirq(idata) % GPIO_PINS_MAX;
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  193         unsigned long flags;
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  194         u32 bit = BIT(offset);
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  195         u32 mode, edge;
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  196
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  197         spin_lock_irqsave(&gpio_s->gpio_lock, flags);
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  198
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  199         mode = litex_gpio_get_reg(gpio_s, LITEX_GPIO_MODE_OFFSET);
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  200         edge = litex_gpio_get_reg(gpio_s, LITEX_GPIO_EDGE_OFFSET);
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  201
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  202         switch (type & IRQ_TYPE_SENSE_MASK) {
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  203                 case IRQ_TYPE_NONE:
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  204                         break;
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  205
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  206                 case IRQ_TYPE_EDGE_RISING:
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  207              mode &= ~bit;
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  208                         edge &= ~bit;
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  209                         break;
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  210
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  211                 case IRQ_TYPE_EDGE_FALLING:
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  212              mode &= ~bit;
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  213                         edge |= bit;
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  214                         break;
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  215
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  216          case IRQ_TYPE_EDGE_BOTH:
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  217                         mode |= bit;
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  218              break;
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  219
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  220                 default:
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  221                         return -EINVAL;
> >
> > unlock before returning.
> >
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  222         }
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  223         litex_gpio_set_reg(gpio_s, LITEX_GPIO_MODE_OFFSET, mode);
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  224         litex_gpio_set_reg(gpio_s, LITEX_GPIO_EDGE_OFFSET, edge);
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  225
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  226         spin_unlock_irqrestore(&gpio_s->gpio_lock, flags);
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  227
> > 3eb679a2997bf7 Robert Winkler 2020-12-22 @228         return 0;
> > 3eb679a2997bf7 Robert Winkler 2020-12-22  229  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
