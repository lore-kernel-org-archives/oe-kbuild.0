Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3E722F16E
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Sep 2025 14:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758033052; cv=none; b=oe+YHq1CWYzqZOqsi3TFNEmS0IGudPBT7k87s8meOELljOdZVY41xsrOwL/+wlO7g0WzrL8oQO3C73MrGwRkmmTJfdqDFmxC9eyVs4uhKh4a6A5mIbpU9QM3RDrd3iFL+odLGofDmlFAxJ5fR00ecymL/22ELyyq3g313MtmB3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758033052; c=relaxed/simple;
	bh=7yYcx+PfwWgDTCyvf4xJyoeS4icmM+bVNdZS7wZmrS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sjwwH22l8B5L2KryYlrovxKpsj0RubCEXOvwzjkVxkWji4uS7CsGQt/eREf0Iez1P7WbvzmcLw9e0XcKmESTay1bnXen9mTCXQjE1H962cXcKtaIyI6RzXqlBvonRBg3yUwoG60PIEuwFFz5TJLrBOqV+7HrggLJpWA8P91SHL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HAlHwENL; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HAlHwENL"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-77616dce48cso3062973b3a.0
        for <oe-kbuild@lists.linux.dev>; Tue, 16 Sep 2025 07:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758033050; x=1758637850; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TiffAS7cC9zkCAeD5hrwe++ErwkU044VbYitXleZroU=;
        b=HAlHwENLfJT0k6OzNUr5ATVvvpb8THkAX40AkF2A4/+dh/Tf6ZbwChwoq/5c1bhjxt
         eGIJuz/wXHWxXhK+r0BTw2lCsaFAIkHEM1eIx3+lMgmcgN158XOlFGQNjFfPsLo0RTAy
         n9UjQmwLIXwtEtw3OaVm+ttiSw0myYrsZu2F4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758033050; x=1758637850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TiffAS7cC9zkCAeD5hrwe++ErwkU044VbYitXleZroU=;
        b=MGD1z+U3N2z03g8EH99cCBBB9L+yZHinR3FSNjQgplDSgeUtxUl3olC4yp4+wYa21p
         Xe8UhtNesQSnY/pPGmXt6Ziz7UJT13QV06iQJAqjZwzYcAGuv5veriWlBFL8LwMJfu0+
         AVApcaB44UUsknoYaiqgCyzSvVWR3b9RsSXstdd5aRFkjNYUde+v7NHnUzq89g+6sYUF
         oEGio1hVxgMyNCI4dWnRjvVCbDtEZH1E3Nh+S0HJCnN3ItCU/Se32xBe0KT10x2vYBpR
         1XqLTbtSAcmCqRuca7nJRAuocKYI+P5zS8VAjvlRkMgMc9oS1domc0QdKSKuJ0vJ05L2
         EJGQ==
X-Gm-Message-State: AOJu0YyxCZM3uptM62hfVwdl/eHsKn7LHxwEeXrU5Tooft6NwUVwD+iR
	YMLFPtreBpS7LzZtc9LfHcndkCnhLZXpzt1i/Vbr0a/Z74Fn7m55dPzAlMebazwtCkS7xD6n2pp
	gWUE=
X-Gm-Gg: ASbGnctaP61Ii+6g0NrdMFLf/7TGIwr42zBo3hoAQOwUlcF3lAEE1J1Wb0OQ0wbjw6a
	uvYlsgPi0f1ffjoIBWkWnJ+xJ4Gf3qIg4YKw0DTVfTc9QLw82w39FHVFEEZrALclUSTFFBwTQMM
	hBvu1sDePkpBe514jWy/5wux54u9sikamQ5sG8JkOVgZEU2R+QtE0aydXED4Gd3kvYoZM2Xmge4
	4IrIYqntKSAJ81FEPgN8VZJsqZFdrVdUswuHe1NMe30TC4+8lSy7H8f/Hw6afBknslvTUKnmyIv
	pZOoqTCqTZ08iD2gLKg2pezG2aFdKSilBiBztUBSxRMqhaD/EgEJV+xcQtHK0fvGxY6O1KoGW6S
	Kuaei2lSRC/0TlN067nwkFIzxoxTZp9MuHhluDEh0Gg0BzRJzH/2aknBmnweek56pZA==
X-Google-Smtp-Source: AGHT+IEq5AyJvyfkAYOQNHVYQnJdJSzXFp0qMXOGP7jHRhwFCgQMtVCjP5tnRbVTk9qXo7aPsdXytw==
X-Received: by 2002:a05:6a00:928b:b0:771:e1bf:bddc with SMTP id d2e1a72fcca58-7761208d656mr18115877b3a.13.1758033049596;
        Tue, 16 Sep 2025 07:30:49 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com. [209.85.215.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7760793b6b1sm16379805b3a.20.2025.09.16.07.30.47
        for <oe-kbuild@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 07:30:48 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b49b56a3f27so3264058a12.1
        for <oe-kbuild@lists.linux.dev>; Tue, 16 Sep 2025 07:30:47 -0700 (PDT)
X-Received: by 2002:a17:903:3885:b0:267:fac6:f099 with SMTP id
 d9443c01a7336-267fac6f0bdmr882655ad.38.1758033047184; Tue, 16 Sep 2025
 07:30:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250910183353.2045339-1-john.ripple@keysight.com> <202509161344.FPfsjq01-lkp@intel.com>
In-Reply-To: <202509161344.FPfsjq01-lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 16 Sep 2025 07:30:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZ8=o3D4iQ+hMFKup+8LuUh74BOyf7YLX-VHRkcU7TrA@mail.gmail.com>
X-Gm-Features: AS18NWDcO5yWc3JLU6eUzWEdoHiHgHWEJMNFpIAQ3YTFuxgHuOAPRPJlbYq6e8M
Message-ID: <CAD=FV=VZ8=o3D4iQ+hMFKup+8LuUh74BOyf7YLX-VHRkcU7TrA@mail.gmail.com>
Subject: Re: [PATCH V3] drm/bridge: ti-sn65dsi86: Add support for DisplayPort
 mode with HPD
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, John Ripple <john.ripple@keysight.com>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, Laurent.pinchart@ideasonboard.com, 
	airlied@gmail.com, andrzej.hajda@intel.com, blake.vermeer@keysight.com, 
	dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
	linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
	matt_laubhan@keysight.com, mripard@kernel.org, neil.armstrong@linaro.org, 
	rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 15, 2025 at 10:46=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> Hi John,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20250911-02=
3707/John-Ripple/drm-bridge-ti-sn65dsi86-break-probe-dependency-loop/202508=
20-235209
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20250910183353.2045339-1-john.ri=
pple%40keysight.com
> patch subject: [PATCH V3] drm/bridge: ti-sn65dsi86: Add support for Displ=
ayPort mode with HPD
> config: x86_64-randconfig-161-20250916 (https://download.01.org/0day-ci/a=
rchive/20250916/202509161344.FPfsjq01-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202509161344.FPfsjq01-lkp@intel.com/
>
> smatch warnings:
> drivers/gpu/drm/bridge/ti-sn65dsi86.c:1385 ti_sn_bridge_interrupt() error=
: uninitialized symbol 'status'.
>
> vim +/status +1385 drivers/gpu/drm/bridge/ti-sn65dsi86.c
>
> b8670cf7e6a41b John Ripple  2025-09-10  1365  static irqreturn_t ti_sn_br=
idge_interrupt(int irq, void *private)
> b8670cf7e6a41b John Ripple  2025-09-10  1366  {
> b8670cf7e6a41b John Ripple  2025-09-10  1367    struct ti_sn65dsi86 *pdat=
a =3D private;
> b8670cf7e6a41b John Ripple  2025-09-10  1368    struct drm_device *dev =
=3D pdata->bridge.dev;
> b8670cf7e6a41b John Ripple  2025-09-10  1369    u8 status;
> b8670cf7e6a41b John Ripple  2025-09-10  1370    int ret;
> b8670cf7e6a41b John Ripple  2025-09-10  1371    bool hpd_event =3D false;
> b8670cf7e6a41b John Ripple  2025-09-10  1372
> b8670cf7e6a41b John Ripple  2025-09-10  1373    mutex_lock(&pdata->hpd_mu=
tex);
> b8670cf7e6a41b John Ripple  2025-09-10  1374    if (!pdata->hpd_enabled) =
{
> b8670cf7e6a41b John Ripple  2025-09-10  1375            mutex_unlock(&pda=
ta->hpd_mutex);
> b8670cf7e6a41b John Ripple  2025-09-10  1376            return IRQ_HANDLE=
D;
> b8670cf7e6a41b John Ripple  2025-09-10  1377    }
> b8670cf7e6a41b John Ripple  2025-09-10  1378
> b8670cf7e6a41b John Ripple  2025-09-10  1379    ret =3D ti_sn65dsi86_read=
_u8(pdata, SN_IRQ_STATUS_REG, &status);
> b8670cf7e6a41b John Ripple  2025-09-10  1380    if (ret)
> b8670cf7e6a41b John Ripple  2025-09-10  1381            pr_err("Failed to=
 read IRQ status: %d\n", ret);
>
> status isn't initialized on error.
>
> b8670cf7e6a41b John Ripple  2025-09-10  1382    else
> b8670cf7e6a41b John Ripple  2025-09-10  1383            hpd_event =3D sta=
tus & (HPD_REMOVAL_STATUS | HPD_INSERTION_STATUS);
> b8670cf7e6a41b John Ripple  2025-09-10  1384
> b8670cf7e6a41b John Ripple  2025-09-10 @1385    if (status) {
>                                                     ^^^^^^
> warning

It looks like the bot reported this on an old version. The newest is
v7 [1] and things should be OK there. Yell if I missed something. :-)

[1] https:/lore.kernel.org/r/20250915174543.2564994-1-john.ripple@keysight.=
com
