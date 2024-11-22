Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF19187321
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Nov 2024 08:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732262816; cv=none; b=s73HFoJajQeOWfgocSIgeYQhcFJF8y7i3smn5kJh6JJGrbEwA385UUpl6OBys0fT1tGM+l3hbXaXWAgUcx90uSzMznXka+JgFag+FKvi3KRJAIyAHtJbRpv3oUewyy9FFLDhranigHhwJ+1BqYboBj/YE1WnUaMPMUv8pr8vJik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732262816; c=relaxed/simple;
	bh=Qi4/idXLvnIThje2gN76UzBa1XdNh7XOjU86E3VjFGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PPIrhbMXlRypBmt8fGs0/rnF5iERHXdWc5VPiWNjFRU1VUoUeCQjnG1JizvKyzTGhkcNIBtRuqO8Rx/oD7cSn/sqcT0H9jguBomVZpbINVPAG9raVV4mDwjGwKkResp7OvWqfL6T1/MbAcQi5Y200cS7G012Snx3jR7+zZ1Un4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C2s/TmG9; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C2s/TmG9"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-723f37dd76cso1808784b3a.0
        for <oe-kbuild@lists.linux.dev>; Fri, 22 Nov 2024 00:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732262814; x=1732867614; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EheqArWCj4tc46f2BqzjXCWprDHEPhu6m5IV043oQTA=;
        b=C2s/TmG9V+yS+L1A7j0IcktFtbCsD0geveRJ0Wi5ccrlgqKOs1JXHHFHkor7QyASiG
         wOmG8NNMoO5na947juJiI2eC9dpgce517NPcG90IFLTP5FEi0QLOyDXkeXO/LH6wt0bl
         Ql0AXB9MPG2hI4hiZZ2qmWRu+FkWfDPYkJimw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732262814; x=1732867614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EheqArWCj4tc46f2BqzjXCWprDHEPhu6m5IV043oQTA=;
        b=g32uXBh5ekEpyjwa+cU6hJDlLgk7o6Y8zr8XUJhM+WT6Dr6PJ+chxkSyivjWhqYKAw
         gUke82cEnHaE7649WGuec2sFjDa1byriHBWWYVCHfzDjXalnrdacXzRInAqOS8VGmO+2
         tcVbjnxpaQlH6LfbJfMspAF3sJi/CxxxucOUq9ah5bS2GNC2/njqTuqBKDvTmd9EWITj
         D94omRNZjAJeownVjSIKSqeGefko/oCS2mQE9GaLEo5Ft0QCnipLXiI5Hbo81gyh4aTp
         Jmh2ULG7oFkySPnf8/fVE+JZyf7Ve2zbxbUhzji1WqC326QBAOs3eqFPaC5J+5y2Xn1r
         ASJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr5B0e54FIPAOMKqseIu+t7Iw8CJaW2EywpJ/gqA2a7jgqv9S/XUvVsIjVnWOBQj201u5xEG9if7w=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUPO7RAU5YdIGi4eGM+ASq5WD8XIbEj9WdnwzxN1199gtgYKqe
	OAMVp3Pig6JIAt+NtF/4LDLhY3yP3XT1C8kMz79r/Pgs8GPnJFFYtdzaERBsXRPO60SLgQ5+m68
	=
X-Gm-Gg: ASbGncuKlIUaVw1wiXntmeiDh4axsMSTYSUeto1c+72IReem3aCEZLjsqaHWeQ+9RJr
	QKeODeiuyKhetcTqtuANGcaq5QXVmCQM7aZ6eohleHq2bStRLI2BhmuadmcmOan1lQav/nu4p3c
	GGDo8FxYwDoQbuXMHhwP3hUh282obcKlPPbsbDQsobx0fpwtvs1kRhqT7pNmJUJizof2MQV2bT+
	nARZfOaf/QxXI0BwtYKHmPWa8/Qjlb893W4WmJpjO3Oe3GC7iLmNGy4wSYE5zGoTEEey7uq5Xbw
	oGtBzGj+BuFvWPKk
X-Google-Smtp-Source: AGHT+IHqb+b6BLIcPyQm3fFuHphtGBEAepYGXuLImppdK6ACXBUeJPg/EtFpxIbg2r1ah347HJQgqQ==
X-Received: by 2002:a05:6a00:3318:b0:724:e582:1a03 with SMTP id d2e1a72fcca58-724e5821ab9mr1059357b3a.9.1732262813695;
        Fri, 22 Nov 2024 00:06:53 -0800 (PST)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com. [209.85.215.181])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc1d21d3sm1055492a12.21.2024.11.22.00.06.52
        for <oe-kbuild@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 00:06:52 -0800 (PST)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7ea8de14848so1591558a12.2
        for <oe-kbuild@lists.linux.dev>; Fri, 22 Nov 2024 00:06:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV39m1FQV6WlgXYx3XX5cNhIjcV/g/ny6cc4dG7lMDlFA0ixex+cGDfhD2h7ztty1TmojRN8TZakSg=@lists.linux.dev
X-Received: by 2002:a05:6a21:999d:b0:1db:e328:dd13 with SMTP id
 adf61e73a8af0-1e09e3fe116mr2932241637.11.1732262812168; Fri, 22 Nov 2024
 00:06:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <54307d9c-a9bf-4bc1-b15d-60c5ba53d0ea@stanley.mountain> <Z0A6Rc-HUPcsIw8z@kekkonen.localdomain>
In-Reply-To: <Z0A6Rc-HUPcsIw8z@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 22 Nov 2024 09:06:40 +0100
X-Gmail-Original-Message-ID: <CANiDSCuQFmrPTLTFs0GPJ209EEKN=MCg8cK3xcsxp8c2eEMhVg@mail.gmail.com>
Message-ID: <CANiDSCuQFmrPTLTFs0GPJ209EEKN=MCg8cK3xcsxp8c2eEMhVg@mail.gmail.com>
Subject: Re: drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready()
 warn: iterator 'i' not incremented
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

On Fri, 22 Nov 2024 at 09:01, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Dan,
>
> On Fri, Nov 22, 2024 at 10:45:53AM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   28eb75e178d389d325f1666e422bc13bbbb9804c
> > commit: 93da10eee90b2ffa4b496dd4a6ea276c57461fb6 media: intel/ipu6: Fix direct dependency Kconfig error
> > config: alpha-randconfig-r072-20241122 (https://download.01.org/0day-ci/archive/20241122/202411221147.N6w23gDo-lkp@intel.com/config)
> > compiler: alpha-linux-gcc (GCC) 14.2.0
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202411221147.N6w23gDo-lkp@intel.com/
> >
> > smatch warnings:
> > drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready() warn: iterator 'i' not incremented
> >
> > vim +/i +752 drivers/media/pci/intel/ipu-bridge.c
> >
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  745  static int ipu_bridge_ivsc_is_ready(void)
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  746  {
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  747     struct acpi_device *sensor_adev, *adev;
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  748     struct device *csi_dev;
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  749     bool ready = true;
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  750     unsigned int i;
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  751
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03 @752     for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {
> > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  753  #if IS_ENABLED(CONFIG_ACPI)
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  754             const struct ipu_sensor_config *cfg =
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  755                     &ipu_supported_sensors[i];
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  756
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  757             for_each_acpi_dev_match(sensor_adev, cfg->hid, NULL, -1) {
> > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  758  #else
> > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  759             while (true) {
> >                                                                                                         ^^^^^^^^^^^^^^
> >
> > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  760                     sensor_adev = NULL;
> > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  761  #endif
> > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  762                     if (!ACPI_PTR(sensor_adev->status.enabled))
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  763                             continue;
> >
> >
> > These continues make sense in for_each_acpi_dev_match() but not in a while (true) {
> > loop.  We're stuck forever.
>
> The non-ACPI case is there just for the looks... I think what should be
> done is to make the entire loop conditional to CONFIG_ACPI. I can post a
> patch.

I saw your mail after I sent my patch :)
https://patchwork.linuxtv.org/project/linux-media/patch/20241122-fix-ipu-v1-1-246e254cb77c@chromium.org/

If we make the entire loop conditional then we would not compile test the loop.

Regards!



>
> >
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  764
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  765                     adev = ipu_bridge_get_ivsc_acpi_dev(sensor_adev);
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  766                     if (!adev)
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  767                             continue;
> >                                                                                                                         ^^^^^^^^
> >
> >
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  768
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  769                     csi_dev = ipu_bridge_get_ivsc_csi_dev(adev);
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  770                     if (!csi_dev)
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  771                             ready = false;
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  772
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  773                     put_device(csi_dev);
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  774                     acpi_dev_put(adev);
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  775             }
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  776     }
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  777
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  778     return ready;
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  779  }
> >
>
> --
> Kind regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda
