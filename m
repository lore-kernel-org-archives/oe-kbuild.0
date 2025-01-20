Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513361AED5C
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Jan 2025 10:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737368277; cv=none; b=nxHtJU+2jSddQCACrNs4nXxRuN6Zr/A7rVjp4C4d0p/o5/oQVSy0jmHEOuH4Ma4O4zuVzjpiwwXU7wGjbtEeYXEnJAF90jfcqNNGLHHvPx99RcMWTJgoLVu9LZG0RazACbYFAgTDMVhrTpfq+Sl7XJUEPhsmCssB1N+lktMxSi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737368277; c=relaxed/simple;
	bh=yBYGHyAAXbHIV4ubx5/Tlxv3MUGD7y8Iw5p+OGIynSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fHrOT5Ls45kHEP/kku5zNKYHJ+NaXuGDyJZGS5dG+g9mAPcOAOgPGOtoc9f23m1eCFw/nePFVTFoDFUtaAzvpMQ5cE25N1RwM/LQWqFWr5UK5dtaomcWZne+hhULYHV1LUz3oCB9TJRFM7f2feajsoqS6V/KSKPVYyGJkzZ0Mg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iuVBAiM5; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iuVBAiM5"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43635796b48so26957545e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 20 Jan 2025 02:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737368273; x=1737973073; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yf0uhM0UA3SnHKS9Js8nec/sH05C5InnAKBuraTy3/I=;
        b=iuVBAiM531Xi3LBw8OHwCXOBmOgVIR/pC+kI4bp/mJtu0rEgj4eYoaq9If89MWcg23
         I7IHwdkKCWaaEbwiLgFbbN2kz2/t8Soz/2tfrTLfakqOz8oeXZUrK0Uq6IzvXc7dbAK7
         QR9hj9Z5S9w86MOAeu/bgwTmQ3tfKr30EhPvuBSt03obsOAa8lxtRz3NWw/k4Whseakx
         JPtwVq+mcT9RfMlse1plKynKaWAO0IcxYOQPE/dUVgzCLE7DdS5ve/Fjdt6RX2M6ZJ+j
         Ea4WFS6nFrdGSnv6e0c5cOW/Icl9/kZwGJMqYnYUmh3LJMXRYJWVy8h/4yPVFPxCBd/X
         a/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737368273; x=1737973073;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yf0uhM0UA3SnHKS9Js8nec/sH05C5InnAKBuraTy3/I=;
        b=mZYB2PQlcKLm7EBSRCnZP/uA9k/rnAncl7V4vJ06eopXWe3qLbkKvMsbd2jeKFAd1t
         BpOmQHpbEFXh69GBczsPqPdpj3MIuyfjCBabdo9gpUxLJuCemQHUyp2X9Q1iGMJN11PE
         SYHkhVzy1icatcqihEvmgfVfA3gzUmUXFVxfgBoVRAMVzaGssL/CTmn/e992Ikvc6cgp
         nbjRqBLsTpCpJJr+4IitI1PRuSZYA3EKPvDfzZ3Cdn2aySGMbu4jBfnagnK9qc3/ewzo
         QUByEFVarAEDL1QsFzcRMBBMGesmRXAETw5ign7nBKdnEABJ6KaY36URM0LiGXL+Pn8B
         LlPg==
X-Gm-Message-State: AOJu0YxIrQHhqkadg8LgKDRcJe3mToYYU6LcHWUm4UqL3gzMNizyAxgi
	QK4qIlFI78JECKGHK821CVzvzYIrDUarnOGniQ+Qfl6R0OiUl8SRwWh1kKLG8bA=
X-Gm-Gg: ASbGncvXEWFOvLRWrq9DTgxGIn+P3xpFjaL3ztPGgD1La9baVr2KWpI/sTWJhYuJkAI
	QqXMpVvA1agAF59nBSgC9aTu+3UHeZJ0dH2gNGkwBkqTfFUdCJ0KJogoBceEQiJCiOL6R+0lXGR
	hZ2fdi8FTwWCYgu0gC2q6bT9Ka8PCtZNjfij/XI7xlaevbnupL4iKYWKhJvU7zvjKTZ96o5xEzr
	At2yHVY3ewHQBBpJ+I+JQhcQYobVQK6n9ddIrjVxSymLKrIJsBb0f5KVsdtzZw0r9ErdGwBVV0=
X-Google-Smtp-Source: AGHT+IHsrR439sEHsJbiPwk2UVMID4BcJeh1sR/CnTPnMX9/K5wl36XW4n6vPXAdSJ64ww4ctsoWow==
X-Received: by 2002:a05:600c:8712:b0:436:1b0b:2633 with SMTP id 5b1f17b1804b1-438918d9008mr112456105e9.9.1737368273517;
        Mon, 20 Jan 2025 02:17:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3278f06sm9981587f8f.70.2025.01.20.02.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 02:17:53 -0800 (PST)
Date: Mon, 20 Jan 2025 13:17:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pin-yen Lin <treapking@chromium.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [wens:mtk-wip 24/48]
 drivers/gpu/drm/bridge/analogix/anx7625.c:2658 anx7625_typec_mux_set()
 error: 'port' dereferencing possible ERR_PTR()
Message-ID: <a56bee01-e1fe-40b2-80d8-2e1434be7897@stanley.mountain>
References: <a7c24973-cebe-44e0-a5f4-9c2497dd3206@stanley.mountain>
 <CAEXTbpfcBtBRDcMcDuaOPQeYJLrd0qkP5P1hOmsgky0BOZkFfQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEXTbpfcBtBRDcMcDuaOPQeYJLrd0qkP5P1hOmsgky0BOZkFfQ@mail.gmail.com>

On Mon, Jan 20, 2025 at 05:17:41PM +0800, Pin-yen Lin wrote:
> Hi Dan,
> 
> On Mon, Jan 20, 2025 at 1:36 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-wip
> > head:   a2f8143f6e1e6b3d8dac24f675646fbfdfc03202
> > commit: d62036e150e84eff425756d90cf8f060d86beb17 [24/48] drm/bridge: anx7625: Register Type C mode switches
> > config: arm-randconfig-r071-20250117 (https://download.01.org/0day-ci/archive/20250118/202501180409.LUg1bFSN-lkp@intel.com/config)
> > compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202501180409.LUg1bFSN-lkp@intel.com/
> >
> > smatch warnings:
> > drivers/gpu/drm/bridge/analogix/anx7625.c:2658 anx7625_typec_mux_set() error: 'port' dereferencing possible ERR_PTR()
> >
> > vim +/port +2658 drivers/gpu/drm/bridge/analogix/anx7625.c
> >
> > d62036e150e84e Pin-yen Lin 2023-03-31  2654  static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
> > d62036e150e84e Pin-yen Lin 2023-03-31  2655                              struct typec_mux_state *state)
> > d62036e150e84e Pin-yen Lin 2023-03-31  2656  {
> > d62036e150e84e Pin-yen Lin 2023-03-31  2657     struct drm_dp_typec_port_data *port = typec_mux_get_drvdata(mux);
> >                                                                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^
> > typec_mux_get_drvdata() this returns ERR_PTR(-EOPNOTSUPP) if CONFIG_TYPEC
> > is disabled.  I assumed that the Kconfig specified that CONFIG_TYPEC had
> > to be enabled unless COMPILE_TEST was enabled but I didn't find that in
> > the KConfig when I looked.
> 
> This is a callback that is only registered through
> `typec_mux_register()`, which also returns ERR_PTR(-EOPNOTSUPP) when
> CONFIG_TYPEC is disabled.
> 
> So, anx7625_typec_mux_set() should never be called when CONFIG_TYPEC
> is disabled.
> >
> > Does the Kconfig have a depend/select/imply on CONFIG_TYPEC that I missed?
> 
> The Kconfig around this is "depends on TYPEC || TYPEC=n", though this
> is not directly related to the warning here.
> 

Ah thanks...

drivers/gpu/drm/bridge/analogix/anx7625.c
  2902          /* Add work function */
  2903          if (platform->pdata.intp_irq)
  2904                  queue_work(platform->workqueue, &platform->work);
  2905  
  2906          ret = anx7625_register_typec_switches(dev, platform);
  2907          if (ret && ret != -ENODEV)
  2908                  dev_warn(dev, "Didn't register Type-C switches, err: %d\n", ret);

If TYPEC is disabled then anx7625_register_typec_switches() will return
-EOPNOTSUPP.  We normally would not print this dev_warn() if the feature
was disabled deliberately.  To be honest, we would normally return NULL
when a feature is disabled deliberately but it's probably too late to fix
that...

  2909  
  2910          if (platform->pdata.audio_en)
  2911                  anx7625_register_audio(dev, platform);

regards,
dan carpenter

