Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E11182B4;
	Tue,  4 Feb 2025 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738680603; cv=none; b=oRGyJHQh5L0nfPD7uQRcIgbIqb8iemWE1RymDq6kERgyniPc6CAT448CbZg9imsDTCoGEiRcudGZ1Ft7TBiI77bv597NOATXVhnCPHPJZVvwv7Lix1NXk2D7ACvxis9J06Wm7VaTrKHeKfGwFVx1Qy80jSpFRBkxSFVFgkdZO0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738680603; c=relaxed/simple;
	bh=0+ukvEOkcev5T7X/Gi8dKsQQHoJs2aN/AWiHhDjuy2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M2wgrunYpcwNbJDC3qYc/n+MKXPiXekJ3w9q9SorpbKWGrCxSXebDlIfG/q2ElBE3Du0H/ZfrmUxgMoWRRlgCj1CjzqOJRmCojCc518l0uwfMrrp+IwFd/9SgTT7o57K63F7vp3PPjAB/sSv2NAat7ffYgYONM2ffXf1ArR/yc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-85ba92b3acfso2718855241.1;
        Tue, 04 Feb 2025 06:50:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680599; x=1739285399;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DkT+LrzpczfsZTA9/FxaGyjcsVl5JMb+YWZwB3xFHaA=;
        b=quZVWGT5DDX8RnfsfEv5ah6XTMp4cpq0CPbXuUxJ9SjBKKT61LXoeU+jJGVwZQ1m54
         7X5joN+REmJ6agqSBKy5DGn0SPHaMc3oYlhae12nmBkNs6ee6IIAQ8R8MpnbcjGkSdOG
         ID74fqPNqz2VTZtFipQ278IgU8XB1dvHnEUaT15kw1dmXg18sykCFrzX4JhT1ADc1paM
         eMwZPqJW7qzzYX4gVa71QZNL3AMFtCot0Drf/t/O6Fh3MRMnfSVQiy8r7b+UtvYtQRGh
         uwCG1YDyaV49B7vnZ5DO34AsFZhCZAD1nLLX9A/7o9+pEIHhxgdVYubZ0XKHUWF1VRiw
         67hA==
X-Forwarded-Encrypted: i=1; AJvYcCX0C9e+n0B0ZDOT3IKupnoTg74tMmHZYRW8VlEYMnKMQsAwzPof4n7WvoBebDVfxO3RhDSV5OwQDuSvVLgF@lists.linux.dev
X-Gm-Message-State: AOJu0YxKC7V0kXXXjdfmc4wdtEFYP1t8aVPZJp7UPgitalKSpUj//ATS
	rFyLW3dJGxTd+yHqhpJg9OKDAwMDN2OIZABz0bEOVSY2bQ4ZOf4FcsdYf5hI
X-Gm-Gg: ASbGnctPUMGExWofU9VOEIGhtVZ7SmGt3cn2oG/lYO9Rf39Nz0Szqesg7QOtMtHmzJe
	wB5RUfv9jnOnzCrPSunrmhCYTCB1u+HCMUDacr1aiFpVTEd+COHFuKkSqvDhAjwr3pKJpxCT78L
	hYRTbc8oC8hv4S/CwNruZbn5hHQlHitxurrUbPt63k8nyYJav1/1o5trHm5ZmDiIvvRM9W32GcS
	Tkr+wuU/ElIoK/DTVElRl3UV51lalOaP9hAnlgioSwWygE9LN+X6LAniX57L0bJiCLo+FNzHuxP
	4E86FwEtr12dgLmNutSQizLRzDTuZRMzaxRg23u4VxZvNxQ71FGuVA==
X-Google-Smtp-Source: AGHT+IEKkLFaNHZtkQ3R2iONZlW+vaSQF2DUd/WmIbSDe5DTmCe2/yADjy1kX8eE8pRZiP19v3Vg0A==
X-Received: by 2002:a67:f08d:0:b0:4b2:cc94:1d6a with SMTP id ada2fe7eead31-4b9a5272b08mr13864514137.19.1738680599200;
        Tue, 04 Feb 2025 06:49:59 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866e00a0afbsm118193241.6.2025.02.04.06.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 06:49:58 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4affbc4dc74so3487418137.0;
        Tue, 04 Feb 2025 06:49:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmIgE0/eLoacCZDCce+t7eXbbV8L1Omw0XKZUGvCuOMiEpyDdTK2cV4bMZo7Yg1s0Yq/vfdrnV9DTxbCm8@lists.linux.dev
X-Received: by 2002:a05:6102:2ad4:b0:4b2:45a3:59fb with SMTP id
 ada2fe7eead31-4b9a4f267efmr20763723137.2.1738680596865; Tue, 04 Feb 2025
 06:49:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2d9d0dab-8892-43ae-bac5-213246705e31@stanley.mountain>
In-Reply-To: <2d9d0dab-8892-43ae-bac5-213246705e31@stanley.mountain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Feb 2025 15:49:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVBXH6++4yLuP6GMyNLVztEkZjrpL-mxLT5vgTXSOVx-w@mail.gmail.com>
X-Gm-Features: AWEUYZll-6EadHF3EhUGdUDG2eHKsKX4IJzgRUARZXUHThsDxZnThsLJQKQBg6I
Message-ID: <CAMuHMdVBXH6++4yLuP6GMyNLVztEkZjrpL-mxLT5vgTXSOVx-w@mail.gmail.com>
Subject: Re: [litex-hub:litex-rebase 14/15] drivers/clk/clk-litex.c:81
 litex_clk_regs_addr_init() error: buffer overflow 'm.clkout' 7 <= 7
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, 
	Pawel Czarnecki <pczarnecki@internships.antmicro.com>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, Gabriel Somlo <gsomlo@gmail.com>, 
	Mateusz Holenko <mholenko@antmicro.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Mon, 3 Feb 2025 at 21:51, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> tree:   https://github.com/litex-hub/linux litex-rebase
> head:   e6c6fef5f6b404cbbbabf0039fbb30acd3b49517
> commit: b6d2dbb4bbd797c6254403bdf67b3b200d08bfa6 [14/15] LiteX: driver for MMCM
> config: csky-randconfig-r072-20250204 (https://download.01.org/0day-ci/archive/20250204/202502040309.E3ppqhfo-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 14.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202502040309.E3ppqhfo-lkp@intel.com/
>
> New smatch warnings:
> drivers/clk/clk-litex.c:81 litex_clk_regs_addr_init() error: buffer overflow 'm.clkout' 7 <= 7
> drivers/clk/clk-litex.c:539 litex_clk_set_filt() warn: should this be a bitwise op?
> drivers/clk/clk-litex.c:558 litex_clk_set_lock() warn: should this be a bitwise op?
> drivers/clk/clk-litex.c:942 litex_clk_calc_phase_normal() warn: inconsistent indenting
>
> vim +81 drivers/clk/clk-litex.c
>
> b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  66  static struct litex_clk_regs_addr litex_clk_regs_addr_init(void)
> b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  67  {
> b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  68          struct litex_clk_regs_addr m;
> b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  69          u32 i, addr;
> b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  70
> b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  71          addr = CLKOUT0_REG1;
> b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  72          for (i = 0; i <= CLKOUT_MAX; i++) {
>
> Presumably this should be < CLKOUT_MAX instead of <=.

Indeed.

And in litex_clk_read_clkout_dts(), we have the inverse bug:

        if (dt_num > CLKOUT_MAX) {
                   ^^
should be >=

                pr_err("%s: Invalid CLKOUT index!", child->name);
                return -EINVAL;
        }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
