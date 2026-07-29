Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F41044C674
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Jul 2026 10:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785319626; cv=none; b=hXKDaoxnboUpfXX0sCqvHoYcawBjmZq0d5hERwirswhF59lDIP8+pWbt0oEmOirereKD4mQd3ej4j3L8JR/q0JCUZ0TBRHobO1e1lntWbnJ3TqYUqjiRft+7nvbtZ0VhtXTktX3QEMu5XBJ8WLmanu+82IeMiKQiMQOVgA3ixs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785319626; c=relaxed/simple;
	bh=GgCcrNbHdCBD7xXFMVJvPxLFI+c7q21jZNU5tbMpJXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PhazLsGzZ1HRTvRy13HFAl3U8igwazoR4wMxUFpTg9PwTYf9nRG82UwT/fXA32pMbbcs0QFwzqm1Vgx9bPw5ecsOk/X2KyiB7uWrr2v5YdVmiHA3f1v5BNpSr0Hc2JBu2KuBp/Gn/NZQHbiM94lJxzk3YJbgnwIoRokX05N6opQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZPAD41+; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZPAD41+"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceaf8a1265so9369885ad.2
        for <oe-kbuild@lists.linux.dev>; Wed, 29 Jul 2026 03:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785319625; x=1785924425; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ltiyfcpncL+fK7rWL3LABJqprUpnAddinkICIJvoFBQ=;
        b=iZPAD41+JNWXZseuNFZuBzZabqVZNpEtojDuXDj++jglneSMp/DEad4uJi9DwHISER
         N89owEnstVg3hjGLqPnbxpUSDoRHD3jHmbLt3O43whRXNknrsBgD/7yUMB+sMyqTC6tK
         Y0zlYEGPI+5XuU1e51gHryTCX/bMNgbQ8ud6zs2kWRN4dFHDSMze9pF0VmNDdnUCpcsa
         UTQZMUOtlxXWcvO19GheDP+EBJbqwQER/g51uMeQdPqL+tZ+nNsOHUtdW6kuWIs2QNst
         06G6mbPx95ddhtpnYD7qYVuz/E3IQPA03jZmoarbp/JO+39I1Q8F5gHUMUko9YJU5ZrD
         xvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785319625; x=1785924425;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltiyfcpncL+fK7rWL3LABJqprUpnAddinkICIJvoFBQ=;
        b=PQa8aB9kkAjxIPyOeVkjcLkA7f2ljttin304Qr3yS+OMgy2LW61X6WP80613BBR2ik
         Wk4clex4TFxtdPlqHzdddl8Z5BqCzZa4TJqL3bgyub/T8l+A/NY1Lj2V7HVlgI8RGmIV
         QG7KrLWS3yVLmFo0uJ9V7M+2nyW9+og/jMAR2lb8kbSoDQraopCLMsLWbDlWhTPjys+x
         iThdjVn7zubsH915Ln1GBW+pVYjl4UmY/cNafQreEk1toUrpz1q5F6HXKqGhg91YfKSI
         rAudQA0BWyDG21E5k0H8Yh3q0g95eb1GHMTYl2P5s4PKXU2vqMkj2OrBTca3QclwxQeP
         sJQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqk3CK71hdFoITu7MnmkfZH8viNAcvNUGFXZh/FPzPlDzA78qrLIGpM93PnkgwQOac5lMPOet2WqPo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFQGy32eFPvx4IYaVjghbsSSkBc+LR7QmIR8DwOms3bQbbFONL
	tqqTTICy9ghiGEqCf7LFqjP0Hdehv2W1tw+hmFJgmt1SXlf0F/Zwrhog
X-Gm-Gg: AR+sD13urmzJ0KdA5HvjDo3jBIkbMq3O0Au2ivf0eTmZahyA+odEVGfMuKJ0IKsTkb4
	dfaLimP9Rt7UfzXayYlZmfP8glsZ9fkjq58hl4wrsz9quKq8ec0djLg20lH7BAyT7nIvAXsnVXF
	KeMHKX/l2ROqhDYfnQE4Q6d6ul1uKlcgatUHdkshcoj3jPD+Vy8cTB435bDqabwBlv2GKBG5bfJ
	KiJ06y5wvuFkhXwPF4g/1FOehC8RPY77Phgo1ninFJHhMr2ajDPTuYhO6Grjg37DjPFLVZE0hJC
	L5ukEOZxwec1IQdW7Rh5UMap+uUoYjU79csc48SDHc4Z4/XnAX5tZT9NSoltvBsPfRxNNmYOY9x
	r1p82St1alt3gOW3ODOedBcOXAuQgn6R79qboR5D0yOKDhd0gEPyij1SBcLiWXtITxqdUIurJW/
	t+Tu/Sx/jp1VzRhxmmX+m2tcaUQx690oFYao+iRm14+cq0G2LuzG8x2TI=
X-Received: by 2002:a17:902:f54f:b0:2ca:f40a:be76 with SMTP id d9443c01a7336-2d015d94cb0mr62989015ad.36.1785319624787;
        Wed, 29 Jul 2026 03:07:04 -0700 (PDT)
Received: from localhost ([172.216.252.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf39b5sm8827915ad.57.2026.07.29.03.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 03:07:04 -0700 (PDT)
Date: Wed, 29 Jul 2026 13:06:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
Cc: "lkp@intel.com" <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	"oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>
Subject: Re: sound/soc/codecs/tac5xx2-sdw.c:984 tac5xx2_jack_init() warn:
 missing error code 'ret'
Message-ID: <amnQwkLaHtbkH2Me@stanley.mountain>
References: <202607291308.8OeeiyIv-lkp@intel.com>
 <8a416f4caf9d41168a38e04140486aef@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a416f4caf9d41168a38e04140486aef@ti.com>

On Wed, Jul 29, 2026 at 09:56:57AM +0000, Holalu Yogendra, Niranjan wrote:
> > On 11:16-20260729, Dan Carpenter wrote:
> > Subject: sound/soc/codecs/tac5xx2-sdw.c:984 tac5xx2_jack_init() warn: missing error code 'ret's
> > 
> > smatch warnings:
> > sound/soc/codecs/tac5xx2-sdw.c:984 tac5xx2_jack_init() warn: missing error
> > code 'ret'
> > 
> > vim +/ret +984 sound/soc/codecs/tac5xx2-sdw.c
> > 
> > 38c89fededd5a9 Niranjan H Y 2026-05-05   979  static int tac5xx2_jack_init(struct tac5xx2_prv *tac_dev)
> > 38c89fededd5a9 Niranjan H Y 2026-05-05   980  {
> > 38c89fededd5a9 Niranjan H Y 2026-05-05   981  	int ret = 0;
> > 38c89fededd5a9 Niranjan H Y 2026-05-05   982
> > 38c89fededd5a9 Niranjan H Y 2026-05-05   983  	if (!tac_dev->hs_jack)
> > 38c89fededd5a9 Niranjan H Y 2026-05-05  @984  		goto disable_interrupts;
> > 
> > Is this supposed to be an error path?  tac_dev->hs_jack can't be NULL
> > in real life.
> 
> We added this as defensive strategy in case someone calls like this
>    snd_soc_component_set_jack(component, NULL, NULL);

Should it return zero or an error code?  I feel like it should
return an error code since it disables interrupts which
pretty much stops the driver.

regards,
dan carpenter
