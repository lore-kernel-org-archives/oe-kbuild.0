Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B14330B02
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Nov 2025 16:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762361304; cv=none; b=Z2eZt8W4nF1dOvkBjGUXxu/bfhF82MEckQIC4a2V1dTO2CrySaCPeVK/DAnAIhRxoI3+ATpjSRyqGFxJFdMUUfrd92DCNZrhjkgyCLSaNayllxw0RvtrtFQBHDLTuaNYsEfzxR5jJtzh58cCS6rlkwnNdX2prrY/vmAdz+tJZtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762361304; c=relaxed/simple;
	bh=613CfTeB04BMDfbYpCzU4r1GHXVyQQQOK+q1bwUH4As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCFm9rV/WAuWtjQ+SBQTbESlRTXGZrnvzjJLXBBD/NREjQJRzVQz0Kx2QjNBgKzRoMvrL94SMH4P8w8RHMsBK89ke/BkcVQP0PYj2H5N5GQfE3ncL1dr0O/THZGTAp+1AKG0nkYZb5KmXMcpmytdk1yDjbUErqeXTOvSxXTUFds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fbzO6DWf; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fbzO6DWf"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b70bee93dc4so624066b.3
        for <oe-kbuild@lists.linux.dev>; Wed, 05 Nov 2025 08:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762361301; x=1762966101; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XmFotMcFPtd7mRBsLfVlVk451p+y5nFGd9HEIFSHePA=;
        b=fbzO6DWfLeo+NVw2EKadtbXd+DXV6ncvU7l6XwL2LXN7NjuU5PfwZfMLu12rFfmfXu
         9fcaYX9doy5mOx95IwtMXZFGSDRx3uKhQ9U+BpSq5za6YmFOGhHZ/jWZVU2BEf2UIC/T
         Kq5JRWj/UpInpbRIoA9uAKWlDQ9KSzpiOpALm41bBiHXzMjpGTLOdm07jRrRxD/CLA1U
         vVEJjnGRBcoaZx9tQmI7ogkPH2XvbR/8ddj1kXcjp1B4ShWWy7bbBD6fIiRAtrx5eogN
         mdXbzPIfdy566XiyM/EtOce1VS3ox63iS/7VCA0nnuyv5B7R5jn/N1rqQULPcbRq0F3w
         nI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762361301; x=1762966101;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XmFotMcFPtd7mRBsLfVlVk451p+y5nFGd9HEIFSHePA=;
        b=XvvKuHpgnUpS8z1Gx9ZIdc/xzsCnr+Dktm1EOxJdLS+LA2xIyEMcM2XQipluF93BsS
         MMHfGjIigg31YMO2LUO5EOT2fc+CpapA5HVnnxBjKdUPkMDInKlRp4THHLgFtE34+FtP
         0PEQZQSnNMnsgLg3aY3X3esjsF6W4+q4ak44RdpmLwNXv3IHTT2WiBWjgV6qh3CBAjdP
         g9cwcvIdqshGkpkzzntvDPuaYIN3nSQ4LjmUEhhipXWrD2cHO+J+fN7dPMonl69z1HHv
         tHosk6EXpRSK0p0tUMQuv6lDCHeGmSMI6J/TzNNjNqUJTQNVxD/jeeIpVa2//yNBP15d
         fjwA==
X-Gm-Message-State: AOJu0Yx6bVgnOY98tOEUlKYzoBZUybMB5cKr/m9aoBuq0PhgXXn3cnVY
	HDnh5yHZoM/qRTnSeaTzKXMrdyV1/j7Iqb8c926tY6x+f5pSEYUQacFkPxi36cFHebM=
X-Gm-Gg: ASbGncufuTSQ9g/jH9wH9DI+SXGg1kE/NVvqq6AevQkHXp6tKgl3256BdDBRj3WPD2N
	AF43wDHhQ0x8xB1qKqW6CtmxoyFKKJ0Qg9E6I3ZDf+TQgcbT2JHSZQiaUA8RSgxjpscsodDun69
	J0+vm33UlA1pdWpdhx+W825nBt46bAeygTvgYXQd2hLG0CiLSdi9U8gqSpqk0dDuiu71oRGrvyP
	FzNy+iO88DPDSe9mdku+b73z/HnSL9HgprGF2rJQfDEkdc24Pk3WUfmBnENN+M3657HKZVAVmt5
	HxgqSzdj+rrD1ofADOum/HAiW42zv1ZCy8CI4BK878x8zlTfaVCTILe0wJPzKDHdcmm0qIk46bc
	hfO+vmTLikrQ6fyOOTgWVL9geBcvMwmZ93wCLahFB4BffcMK6eTydCeFLmSw5RzcRXWwIkrTJ9L
	E8fyMP/n2fN8d4
X-Google-Smtp-Source: AGHT+IGm3Wa56XUydCTKudmGMentGaT4iUui9wuImfhosfZAtqWdEBdlJW8tn8ToaWyI3p+ndFALWA==
X-Received: by 2002:a17:907:3e0b:b0:b70:b3cb:3b30 with SMTP id a640c23a62f3a-b726567fa67mr356526566b.59.1762361300655;
        Wed, 05 Nov 2025 08:48:20 -0800 (PST)
Received: from localhost ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72893cbc72sm3380366b.29.2025.11.05.08.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:48:20 -0800 (PST)
Date: Wed, 5 Nov 2025 19:48:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Phil Elwell <phil@raspberrypi.com>
Cc: oe-kbuild@lists.linux.dev, Jai Luthra <jai.luthra@ideasonboard.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <uajain@igalia.com>
Subject: Re: [PATCH v3 6/7] platform/raspberrypi: Destage VCHIQ interface
Message-ID: <99c95bb6-6595-4b68-afa7-1614f619a20f@suswa.mountain>
References: <20251029-vchiq-destage-v3-6-da8d6c83c2c5@ideasonboard.com>
 <f11dd2de-d8fd-4d8f-ba29-6974ba923b4e@suswa.mountain>
 <CAMEGJJ1Rsjsa9CGB4Hv6ukf=xi41TTDRNf7nkrX4nQniEp+8zw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMEGJJ1Rsjsa9CGB4Hv6ukf=xi41TTDRNf7nkrX4nQniEp+8zw@mail.gmail.com>

On Wed, Nov 05, 2025 at 03:17:01PM +0000, Phil Elwell wrote:
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  583  static long
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  584  vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  585  {
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  586   struct vchiq_instance *instance = file->private_data;
> > 3414994ba84042 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2022-12-23  587   int status = 0;
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  588   struct vchiq_service *service = NULL;
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  589   long ret = 0;
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  590   int i, rc;
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  591
> > 96622d58f50b8f drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Thomas Weißschuh 2025-03-11  592   dev_dbg(instance->state->dev, "arm: instance %p, cmd %s, arg %lx\n", instance,
> > 8757f705d936ad drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Gaston Gonzalez  2021-09-12  593           ((_IOC_TYPE(cmd) == VCHIQ_IOC_MAGIC) && (_IOC_NR(cmd) <= VCHIQ_IOC_MAX)) ?
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  594           ioctl_names[_IOC_NR(cmd)] : "<invalid>", arg);
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  595
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  596   switch (cmd) {
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  597   case VCHIQ_IOC_SHUTDOWN:
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  598           if (!instance->connected)
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  599                   break;
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  600
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  601           /* Remove all services */
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21 @602           i = 0;
> >
> > i is not used any more.  Delete.
> 
> No, don't do that. It's passed as an in/out parameter to
> next_service_by_instance - it maintains the iterator position. This is
> a false positive.
> 

Uh...  Crud.  You're right.

I knew this check was generating false positives but I try to filter it
manually.  Which is lazy.  I will fix this false positive.

regards,
dan carpenter

