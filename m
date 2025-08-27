Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCCA276022
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Aug 2025 13:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756299992; cv=none; b=RTOezUQvwlSYw6PAR6k8xu3PWW9pzndmvDlQqjQCVoYpMS6+/MF++DkJvWuTTJQou78r5Bj2J1zQJTUp/dvpPV3AKEghIhlb9/jEIBJ6NA4/YGkuuAxdjjXz8gc8lWg3UqFe6XwGYLFqGXoFpHs8dbtux+D1PUMqtX3N7nP/cXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756299992; c=relaxed/simple;
	bh=J6tlttBlgZ6DdU9dlu0VuCFWzKR1/21U0OOFFKpK/Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUEFFR+H+QCi2N73QofIXGGfY8aiOnLnUxM2ZvbEbzEJJlHXAbB01s1otqcZ6JBNBjaQ6qcywLHogMWi5ZiCA/oZLKnh2/Vc2UoNvqxUks6Dy+RZ6woP+fYrlJXCKndKPFZAEMgxmON51Jq+46Jw5W9M+voHaJr68AEhmgF8mNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FTEXaN6G; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FTEXaN6G"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45a1b04f8b5so41947875e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 27 Aug 2025 06:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756299989; x=1756904789; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hK+6X7If3iibz8tYO8lX48Dx7ObpMSFEmkT7sgjJ+No=;
        b=FTEXaN6G5xnV6F7/cnUg8syTsO9Xdvx9iZU1tNtQVrRdS5e+PTzJFrtIidZPxuyBiX
         pL0cuH+EpzbPObInM5Bn2k+yR/mm2W2o9RYqblxpkYuMAJxcUpO/289h9R1l7KgPGil9
         cRsF2m8+ogNa+bEl8iozGnKGsOGE2KW/kQmQvi0FFCn+3Mzg/Eicy7jbOcp/H+RjyBsO
         +fSHdsGQqQVlmMV0bwFd6sM+GbtC2mRai4nFkPIYBQSpj6c3x+CK1A5Xj1xAJ8yrVQbL
         4WlorCYZIsplIXChO0yt/hsrXkKqDW46gdyuxrAkp4D2ZTbslh4XbkAVvM57vfYjdizt
         cW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756299989; x=1756904789;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hK+6X7If3iibz8tYO8lX48Dx7ObpMSFEmkT7sgjJ+No=;
        b=mmREpu4NiyTBPwBWSFkhjxSXx+lPHJjBIyyZCMVMLWv5QzWJbXKUoVkwHg0x/305CB
         ndXGx/D9W+T3VN4NEs+ofU/8PwOTKHdIVM/43QUSThLOH1reknFQ9H+GFcYH/w4J9vco
         Vay8tMFc1z4Rt+CWLfQfqIHwovIQ4l9kmxA8J6d8rtVD4G605LnR9Garlro6D9TMP9+k
         +O9iYdV+xjyYUrCboLYXeLNvdB84nOACM/VIeAdaEbZdSbygP+eOordzMZoONDr94W4N
         /JIrK1LPSj3ecclz1hSzK3VRyMj4uSkGhk4JUPRXQJ8iC9g5mUHGMAf/cftVtUVfFjh4
         swIg==
X-Gm-Message-State: AOJu0Yy/kG37jkwuEwnZYJxdYpqItmdevHVLLYZEycjq0u6Q8vgZdtI+
	eB17cZY+BL6OAjFY4swtBmH/AdDpcZynbo/AuB/n7QfOkLLGUoqenNmib7XBh36GuIg=
X-Gm-Gg: ASbGncugEXNoAQjiBi79cIVMsrdalRW75t1o3Hu0gskxp3gQ748skMU+pBUyWrb8VZM
	JwZ/akSKz3KtKRR0Tgo1rJQ6up8ktcJ5YuJDGE1yhbZ6kGQ69R+0d6j8YrlrBShvqukek05R9z5
	K0JBJIkfAcOLX4WKrxdZuO1BMK17XA6vxKyAfWxhA52LGhug0uGixmdO6Yz2AwRwPGD/U3e+uum
	tlWieUbnLkvdulPgGl89Nk18i4We7QFJKFDuvhnI5JP2uNBYUsMpvWYlEGROiUxiXCfIWgvf370
	KkxXHZgsGY7OPErcloNq+7hyGG0gDU7ZPg5ZH7t+jUlrzGRG/W1Y83jVSo95WuTmemG01BQEysy
	/4OgI4u4BgaTV7f2iTqE0z3m+Ynk=
X-Google-Smtp-Source: AGHT+IEXDXRBapmJnNzs3yvXudhRz+Tvr8DgSaDCekM2NjQJUOq12kV9vyfi7g4u8CZNTYZm5ZKuaA==
X-Received: by 2002:a05:600c:3b15:b0:458:c059:7db1 with SMTP id 5b1f17b1804b1-45b517d4580mr189191765e9.30.1756299988612;
        Wed, 27 Aug 2025 06:06:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c711212924sm20651459f8f.33.2025.08.27.06.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 06:06:28 -0700 (PDT)
Date: Wed, 27 Aug 2025 16:06:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild@lists.linux.dev,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [sailus-media-tree:cleanup 30/54]
 drivers/media/i2c/imx214.c:1109 imx214_ctrls_init() error: we previously
 assumed 'imx214->link_freq' could be null (see line 1017)
Message-ID: <aK8C0InZVhV-VnXr@stanley.mountain>
References: <202508270603.MDqIVFss-lkp@intel.com>
 <aK7MAiDuq6tqEW7X@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aK7MAiDuq6tqEW7X@kekkonen.localdomain>

On Wed, Aug 27, 2025 at 12:12:34PM +0300, Sakari Ailus wrote:
> > 4f302d004bd0fc André Apitzsch 2023-12-06  1012  
> > 4f302d004bd0fc André Apitzsch 2023-12-06  1013  	imx214->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, NULL,
> > 4f302d004bd0fc André Apitzsch 2023-12-06  1014  						   V4L2_CID_LINK_FREQ,
> > b9b359662952ff André Apitzsch 2025-05-24  1015  						   imx214->bus_cfg.nr_of_link_frequencies - 1,
> > b9b359662952ff André Apitzsch 2025-05-24  1016  						   0, imx214->bus_cfg.link_frequencies);
> > 4f302d004bd0fc André Apitzsch 2023-12-06 @1017  	if (imx214->link_freq)
> >                                                             ^^^^^^^^^^^^^^^^^
> > This assumes ->link_freq can be NULL.
> 
> This seems to be a false positive: the control handler's error is set if
> adding the LINK_FREQ control isn't successful and that is checked for later
> on, before calling imx214_pll_update(). Probably smatch can't figure that
> out?
> 

Yeah.  You're right.  Smatch knows that v4l2_ctrl_new() sets
ctrl_hdlr->error on failure but when it gets returned from
v4l2_ctrl_new_int_menu() then that information is lost.

I should investigate why that is...

Thanks for looking at this.

regards,
dan carpenter

