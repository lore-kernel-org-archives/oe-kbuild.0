Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C3919C55D
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Sep 2024 14:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725287379; cv=none; b=ejFhdYXajTpzxj6MP5zEA3V+ypNiwxqIRob2/20tYhR1i4OzQo4974/dNR/cNFCTfBAnDQyYQRT+pn3uqszD0LzKBIDtATbKrzd1uFLeDjQ8WH0h1cgbTe6jFPPwSN+M0I6e/oEtH+no5NjdxqAYXjYv2rAwXRF+K6GpPxT4Iqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725287379; c=relaxed/simple;
	bh=VTcW7mvtuUekxI4xje/K+1Lpkm2t9TmwbvkaP2/wqBE=;
	h=From:Date:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rWAVWitOfiCRAq0T6ceApHN2yl8lNk2XKgeIuTHwz3IFRhzaLj3xm5FVInPsoPnd25R8fZiK9iFYh41gpT75sm+OSbIXX8sH77agj8l733WEDBefEeu4gFk6vMEE3Kv/QyasYDNsrLGuQAFgXxH7ZwlMF8+VLT4n2h8YRP5p8t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xspvi098; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xspvi098"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f3edb2d908so44704791fa.2
        for <oe-kbuild@lists.linux.dev>; Mon, 02 Sep 2024 07:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725287374; x=1725892174; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=viUHGTpog8UaVRzx+Wzp3kQVyidPoKzv0eH0OK+v9uc=;
        b=xspvi098JGMTgc2+p01XV9fm0J2zFzRotulUz3Orl2UMJgH7PXWX86eBF2CsLm9AD1
         1rp3UGqpkbmFHqVpHE37dDpVMjTt1XKe1tf9OmYZsCoyPgMZiv9/aukpczqyL3WHWxJa
         y8oFBkPifar2GG/euSRs3iEizc9qFC+SFG5rqFQKDscA6/7UJ/proT/m+Osf7CJZdBnB
         WDrUlm9mYgvQBkAXuCSxNG0LrFhV9PbU6XMI4FEKQVrPvcbQaeVyrObQOW0NAO2tXF72
         xIcMpXrH8TK8bC6RUPcGoqDJIm1c4vEqMEXi+IYklvNC1ccifhua9Qq7ZrmX6hjLSAe9
         iWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725287374; x=1725892174;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=viUHGTpog8UaVRzx+Wzp3kQVyidPoKzv0eH0OK+v9uc=;
        b=iW9My/wMUHECIpf73dmZmgO/dXScOIc2549We7/2q5S77pxr2gXeajmhogXtseTB1P
         TZFCitkNggZe3xPK15g2LWXMC9HcWkRdgPhLh2U9tVM0Hc2EN1fTMAx3ZawSmI3tafrK
         dud/ALKebzH4HQmR1cIbGdC5vjntefzj/0tkv0qV3vw4hKPz8ZIDoZzDEpIFCuPGo8uI
         YIsH2zjIKdjoCOubapqbfvK1BsjEWwMb++HvR/veUphvM05lyiU/nHBqijPn9bCR+eO6
         SrxWXQWboQPIHNwlhJu9MQ0GFovK5o+3oJYS2snd2ZysJsCIQJLKJtIGzYeG06VvhJzg
         NTcw==
X-Gm-Message-State: AOJu0YwW8s7qAki/E4d7wvxaRQn5xjyQz2pK+NLAXBZJ6vcyZLJWpMkq
	KQD9PaQPFEn0AXrXGCpzOx/xsHZRQAcS/UKby4ny+Z++FMdlycKHSy4Z5tnpac5kPpUBk2oCgQd
	B
X-Google-Smtp-Source: AGHT+IETKd6dva/yhJN6nqr5FhIDGDTrlIBESejHLhfAr3F52FcNPA0YlIIt21PfiyOw4JYZlHmtmw==
X-Received: by 2002:a2e:be93:0:b0:2f2:9dc1:af33 with SMTP id 38308e7fff4ca-2f64440e709mr1679201fa.19.1725287374018;
        Mon, 02 Sep 2024 07:29:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c2502f86ebsm2322731a12.77.2024.09.02.07.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 07:29:33 -0700 (PDT)
From: kernel test robot <dan.carpenter@linaro.org>
X-Google-Original-From: kernel test robot <lkp@intel.com>
Date: Mon, 2 Sep 2024 17:29:29 +0300
To: oe-kbuild@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [linux-next:master 6570/8400] drivers/gpu/drm/tegra/output.c:42
 tegra_output_connector_get_modes() error: uninitialized symbol 'drm_edid'.
Message-ID: <ZtXLyXxew7z6H2bD@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ecc768a84f0b8e631986f9ade3118fa37852fef0
commit: 98365ca74cbfae16b793b62a7ecabb5be8d77785 [6570/8400] drm/tegra: convert to struct drm_edid
config: nios2-randconfig-r072-20240902 (https://download.01.org/0day-ci/archive/20240902/202409022236.7pEcEksT-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409022236.7pEcEksT-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/tegra/output.c:42 tegra_output_connector_get_modes() error: uninitialized symbol 'drm_edid'.

vim +/drm_edid +42 drivers/gpu/drm/tegra/output.c

132085d84fca65 Thierry Reding 2014-11-28  21  int tegra_output_connector_get_modes(struct drm_connector *connector)
d8f4a9eda00678 Thierry Reding 2012-11-15  22  {
d8f4a9eda00678 Thierry Reding 2012-11-15  23  	struct tegra_output *output = connector_to_output(connector);
98365ca74cbfae Jani Nikula    2024-08-22  24  	const struct drm_edid *drm_edid;

There used to be an = NULL here.

d8f4a9eda00678 Thierry Reding 2012-11-15  25  	int err = 0;
d8f4a9eda00678 Thierry Reding 2012-11-15  26  
acde541324dcfe Thierry Reding 2014-01-13  27  	/*
acde541324dcfe Thierry Reding 2014-01-13  28  	 * If the panel provides one or more modes, use them exclusively and
acde541324dcfe Thierry Reding 2014-01-13  29  	 * ignore any other means of obtaining a mode.
acde541324dcfe Thierry Reding 2014-01-13  30  	 */
9be7d864cf0763 Thierry Reding 2013-08-30  31  	if (output->panel) {
06c4a9c2ae606a Sam Ravnborg   2019-12-07  32  		err = drm_panel_get_modes(output->panel, connector);
9be7d864cf0763 Thierry Reding 2013-08-30  33  		if (err > 0)
9be7d864cf0763 Thierry Reding 2013-08-30  34  			return err;
9be7d864cf0763 Thierry Reding 2013-08-30  35  	}
9be7d864cf0763 Thierry Reding 2013-08-30  36  
98365ca74cbfae Jani Nikula    2024-08-22  37  	if (output->drm_edid)
98365ca74cbfae Jani Nikula    2024-08-22  38  		drm_edid = drm_edid_dup(output->drm_edid);
d8f4a9eda00678 Thierry Reding 2012-11-15  39  	else if (output->ddc)
98365ca74cbfae Jani Nikula    2024-08-22  40  		drm_edid = drm_edid_read_ddc(connector, output->ddc);

I mean presumably either ->drm_edid or ->ddc is true, but you can see why the
checker complains.

d8f4a9eda00678 Thierry Reding 2012-11-15  41  
98365ca74cbfae Jani Nikula    2024-08-22 @42  	drm_edid_connector_update(connector, drm_edid);
98365ca74cbfae Jani Nikula    2024-08-22  43  	cec_notifier_set_phys_addr(output->cec,
98365ca74cbfae Jani Nikula    2024-08-22  44  				   connector->display_info.source_physical_address);
d8f4a9eda00678 Thierry Reding 2012-11-15  45  
98365ca74cbfae Jani Nikula    2024-08-22  46  	err = drm_edid_connector_add_modes(connector);
98365ca74cbfae Jani Nikula    2024-08-22  47  	drm_edid_free(drm_edid);
d8f4a9eda00678 Thierry Reding 2012-11-15  48  
d8f4a9eda00678 Thierry Reding 2012-11-15  49  	return err;
d8f4a9eda00678 Thierry Reding 2012-11-15  50  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
