Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AEB1D61B9
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Nov 2024 09:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732269003; cv=none; b=pjZN45rgY93iEdtT9jilGrVyhUfJmDUu1jWgmJ4w/N1qcubF2NknEuGxiBVN/xZw5l+0BIvbh5C/31wclDBidEbI0sg3+S21B4TtrRQcINwbtCXjbqnOAtYHg0wXitYdb42qvUew4sHcXjtAbiC3uU1xK8JStV/Jlz2uHY+BnSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732269003; c=relaxed/simple;
	bh=PvEGdxriQ64q0nn9Stq2sPLaEpishpGozwR3OcVmBwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIzxIowhGL8re9fq7o9tUcWLqonYIOCP9FWLzUS5TxqtZKP06NfJp/F540D6UCRG8/HWRfpiVepm2bNrEDsg+bZOw9kss9I4JisfTTidc28owULxS/IE7VTlCcymFSgRGoBmcdF1cQlznBAzOr9VJ1UU5D5v8vF+0GCqOIav9Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gQ2LNKY2; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gQ2LNKY2"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2965e65ce89so1283420fac.3
        for <oe-kbuild@lists.linux.dev>; Fri, 22 Nov 2024 01:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732269001; x=1732873801; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hVK3siImP8xz7KIb6KpsrNuBusfSPJqPiJxMHJ1HiJQ=;
        b=gQ2LNKY2TtgZ4Qrw65yB50l63HSgBMwsaetiyL8UtgSF/7xj4LNZpblhs17UAXw6Ns
         iI1eid86WMdWAkJM0TmAyp8bkkCARlUhPdgY4RUC0NjeA1ou0ilt/qcuwdiiJ7WXaDnN
         Z8xmRcAzvYw8ZtAFSCaHdDurroxM5F0SLztLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732269001; x=1732873801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVK3siImP8xz7KIb6KpsrNuBusfSPJqPiJxMHJ1HiJQ=;
        b=IOAaI5nXnNeQDzEHz77KcRDTw4AF3toEVd6EA7u/ziU5ZUlqUo6101jWauYQmJ9/Vi
         mxIJG3zoY1c9Tt93tIuk8gJkeRi0APLmO4CwZVVryAMYvgMQ239FkKvK1M30xf3tEpNY
         sH9QtbJaugtR7O1qc+y2MuvP50SxSG7m/jxxGaU1yFc0TF2yGRfkPW0n3ICPNfo9VdV/
         4b8GMBrPkU3rbhub1hk60v2961Fng+VPRVWjOP2nlBJOOCdhaE2xB9CXQ7qtPytIARxP
         tpJ6w/d90D5UkGaRh/tkcA1x4oKPuRO8nj8cfWeWB6TADkf+3X5Zyc1zpT/q2cIorjNo
         5ueQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+ZYBxdSYkT20Mor6WlgmsO7G3FUIHtxIM0ARFDWwNw+WTuz2g825i55L6tcbRWKULYCqZVPpvP5I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2jaArGdF7bYy2zqFSfqZ0iz8LGtr53TgRO5PC+Uz9kGa14T1M
	pnbQv8UrZMr42D1cPEKj8v19sRah0v21O7HxbpiKuaZJv7WEsq8sgwthhYb91i1Y0nG31/4M/F4
	=
X-Gm-Gg: ASbGncu7R4C5sVkgIQmRAqk82NLwLeR42OSMNgDvlszaeIHkhiJvoSFkih9uCITlIwP
	f7t1mB5tJuKpiNWh2MCrxFY+d2OR5wfwy74314OXCenCEcVl2um/lTl3qhTVFvceUhvig7aMjeX
	ufaumHAB8dus6YU/dY0F4SuhHG6YYIwZIQSw6ahw/3kmNXRUtcB7mPysBEptqOk8P94o6zuFE1U
	AMYM9a5+USHSdnNvQXq56to3ZGu6Wypfzz5pz7M8l9gGlJWpggmuYyX4Id77Zlx52FvckpEoMhF
	ZtgMGeuegJbWrI8J
X-Google-Smtp-Source: AGHT+IEJ5cKHGLkw0EYJCPvrpeu9JZp9ZQ6TAM5Lg2VHtUEuJYmdRryYp4eUGb3i2ukyfpDcOTT/UA==
X-Received: by 2002:a05:6871:3b08:b0:297:23cf:d3db with SMTP id 586e51a60fabf-29723cfe7ddmr1269217fac.37.1732269000662;
        Fri, 22 Nov 2024 01:50:00 -0800 (PST)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com. [209.85.167.175])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2971d898b54sm464325fac.53.2024.11.22.01.49.59
        for <oe-kbuild@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 01:50:00 -0800 (PST)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3e606cba08eso991119b6e.0
        for <oe-kbuild@lists.linux.dev>; Fri, 22 Nov 2024 01:49:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW8GpvLucUdKz9rTkIjFueF7R1aSEUR4I8gv+0g+flF2Sd5y9nDf2hEF3V0urLNZJ8FzcVoUfEVW54=@lists.linux.dev
X-Received: by 2002:a05:6808:1590:b0:3e7:6468:1fd5 with SMTP id
 5614622812f47-3e915a5886cmr2412276b6e.34.1732268998797; Fri, 22 Nov 2024
 01:49:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <54307d9c-a9bf-4bc1-b15d-60c5ba53d0ea@stanley.mountain>
 <Z0A6Rc-HUPcsIw8z@kekkonen.localdomain> <CANiDSCuQFmrPTLTFs0GPJ209EEKN=MCg8cK3xcsxp8c2eEMhVg@mail.gmail.com>
 <Z0A8njOPBMtkb5wJ@valkosipuli.retiisi.eu>
In-Reply-To: <Z0A8njOPBMtkb5wJ@valkosipuli.retiisi.eu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 22 Nov 2024 10:49:47 +0100
X-Gmail-Original-Message-ID: <CANiDSCtRife4KNYmCFX56hroGJCHTQvSWdwwMRHGC7mpVbKCYQ@mail.gmail.com>
Message-ID: <CANiDSCtRife4KNYmCFX56hroGJCHTQvSWdwwMRHGC7mpVbKCYQ@mail.gmail.com>
Subject: Re: drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready()
 warn: iterator 'i' not incremented
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Fri, 22 Nov 2024 at 09:11, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Ricardo,
>
> On Fri, Nov 22, 2024 at 09:06:40AM +0100, Ricardo Ribalda wrote:
> > Hi
> >
> > On Fri, 22 Nov 2024 at 09:01, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Dan,
> > >
> > > On Fri, Nov 22, 2024 at 10:45:53AM +0300, Dan Carpenter wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > > head:   28eb75e178d389d325f1666e422bc13bbbb9804c
> > > > commit: 93da10eee90b2ffa4b496dd4a6ea276c57461fb6 media: intel/ipu6: Fix direct dependency Kconfig error
> > > > config: alpha-randconfig-r072-20241122 (https://download.01.org/0day-ci/archive/20241122/202411221147.N6w23gDo-lkp@intel.com/config)
> > > > compiler: alpha-linux-gcc (GCC) 14.2.0
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > | Closes: https://lore.kernel.org/r/202411221147.N6w23gDo-lkp@intel.com/
> > > >
> > > > smatch warnings:
> > > > drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready() warn: iterator 'i' not incremented
> > > >
> > > > vim +/i +752 drivers/media/pci/intel/ipu-bridge.c
> > > >
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  745  static int ipu_bridge_ivsc_is_ready(void)
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  746  {
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  747     struct acpi_device *sensor_adev, *adev;
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  748     struct device *csi_dev;
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  749     bool ready = true;
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  750     unsigned int i;
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  751
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03 @752     for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {
> > > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  753  #if IS_ENABLED(CONFIG_ACPI)
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  754             const struct ipu_sensor_config *cfg =
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  755                     &ipu_supported_sensors[i];
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  756
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  757             for_each_acpi_dev_match(sensor_adev, cfg->hid, NULL, -1) {
> > > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  758  #else
> > > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  759             while (true) {
> > > >                                                                                                         ^^^^^^^^^^^^^^
> > > >
> > > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  760                     sensor_adev = NULL;
> > > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  761  #endif
> > > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  762                     if (!ACPI_PTR(sensor_adev->status.enabled))
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  763                             continue;
> > > >
> > > >
> > > > These continues make sense in for_each_acpi_dev_match() but not in a while (true) {
> > > > loop.  We're stuck forever.
> > >
> > > The non-ACPI case is there just for the looks... I think what should be
> > > done is to make the entire loop conditional to CONFIG_ACPI. I can post a
> > > patch.
> >
> > I saw your mail after I sent my patch :)
> > https://patchwork.linuxtv.org/project/linux-media/patch/20241122-fix-ipu-v1-1-246e254cb77c@chromium.org/
> >
> > If we make the entire loop conditional then we would not compile test the
> > loop.
>
> I'm fine with the patch as such but don't you think we might get just a
> different warning from this one? :-) I'm fine trying this though.

I have send a new series to fix it for real. Until the acpi guys
review the code we can land the first patch of the series. I have
tested it with smatch and sparse and it seems to be fine.

>
> --
> Sakari Ailus



-- 
Ricardo Ribalda
