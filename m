Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E983223775
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Apr 2024 06:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712299961; cv=none; b=cJZ6czihEyrffWrv90zst+9O05DDvNb8/BhNngWkm59pfXUa5XeyH0lJMBsenjAzOP5ve950FkUmwQuGejiJNoUXzlTd6NnYLB4CJCEn54O2/pKcmTW2amutnv+7GI2dNCErw76Qpwc6iBcu71UoFOUcvSCyWEVKJELugTDe6bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712299961; c=relaxed/simple;
	bh=QSYd4loLBDBTAA1un1YLQuRsu4iU3ElNNFm8JqyeJFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=hrP8lLkSCHtakJzADA1wmioC2rrBna6hI6j/pLjn1ZcKKfi6BUav0CmSUk3oXN7OmH3XF5WKZ9KLQgKQRz7Ai5Jy+NGwheXsqvm+PIpGlmXEQ3qdL5EKkQ7RGQinB/9nKsGWifmX38r2ckKaPXEC/GGQlmAIgyKpwQmV+yCMQf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qoBHm92T; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qoBHm92T"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a46ba938de0so253805166b.3
        for <oe-kbuild@lists.linux.dev>; Thu, 04 Apr 2024 23:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712299958; x=1712904758; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OAoWz44Vah0FBQQ++BlkUgil4y/bpkTelSJbB2HtwhU=;
        b=qoBHm92TTG5xcgG6kdXKRwhiwuDR80GXpoV4dwcdJFCvmNHxaawzBSTTBK+OqAmsB5
         sYrQwJJrpLzoSK+SmVuBNd4j1RN2nRIOAh2ZougKjSkM/aObeaj9ncYFSGzjCM1Uax/N
         ul3teFHTb5sI4WxlWqo+SRFSVH5odzxiwaDLUdVcNk/a/OJVIV2NpvB2ZpG+83UJiYLd
         5XyEjh+zLYqxDTjPYYvLdGTAWrSppkzdOhk8EU9c51HIeYsnlOxMR4BUUGJ4/oqs1/GF
         ASjHb+PGYggHs4EZP+qsBpTUvNwU9e4AHvwNzEdigcE890zN3wEKUq2WX/YRuipm6XYx
         AE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712299958; x=1712904758;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OAoWz44Vah0FBQQ++BlkUgil4y/bpkTelSJbB2HtwhU=;
        b=rTwfxCHLAqFIFvX0Ei+qZ6OtstNQ48BRHqMik54wcNcQzVBuEfZleJBW4piIiJ1Ydr
         8s0yr2l5VUXRQRnVHD+wOAdVX+3tYeIjAooUqgfI3yb1NKlPPWS3buvAeQuhnaqsCZqv
         nz2d2kZqOX3Xr05IMCaaLA+y5xKY13RDzwDVLoTkfP8pf79YBaGxnSoW4yA22sWIhLzr
         VLWajAT2vN+IaPggJecGVSDEN+9OfUgF3jdQc39m5np0YaPmsvgMLLvqqUMtJWbfVPEc
         REDcMEhZhIScOQA4HcGIquMrYtOrKKz0iv3ZUqwTbVD+Japh52v7dvvm/Nk0GOOUILjV
         Jg1A==
X-Gm-Message-State: AOJu0YwKfJFODjbGstqD/vYuYgJZp05QorsUKqf1YgWPt9bky/b3U7Hy
	pheDyrUmkxkL91IeVFpf0g9uVZZY39COFoArGubp9A6Jz/p+UT7BovoOo36OcwHcueR/b0jo0HM
	u
X-Google-Smtp-Source: AGHT+IHrwnngq+1Rt4kkQZqXldfwAXh/zqUOJ3sPDzmdU91aZ2DmDYA4tJB6sJ+Sb8yrjn9BGztDCg==
X-Received: by 2002:a17:906:a895:b0:a4e:2a5b:f94 with SMTP id ha21-20020a170906a89500b00a4e2a5b0f94mr412192ejb.6.1712299957495;
        Thu, 04 Apr 2024 23:52:37 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id se1-20020a170906ce4100b00a51a9d87570sm147217ejb.17.2024.04.04.23.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 23:52:37 -0700 (PDT)
Date: Fri, 5 Apr 2024 09:52:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
	javierm@redhat.com, jani.nikula@linux.intel.com, airlied@redhat.com,
	sean@poorly.run
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 7/7] drm/udl: Remove struct udl_connector
Message-ID: <39bfffb4-1e72-4b37-bfa7-1c52d969ddd3@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404150857.5520-8-tzimmermann@suse.de>

Hi Thomas,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-edid-Implement-drm_probe_ddc-with-drm_edid_probe_custom/20240404-231057
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240404150857.5520-8-tzimmermann%40suse.de
patch subject: [PATCH 7/7] drm/udl: Remove struct udl_connector
config: parisc-randconfig-r071-20240405 (https://download.01.org/0day-ci/archive/20240405/202404051359.Y6AgUwFi-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404051359.Y6AgUwFi-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/udl/udl_modeset.c:527 udl_modeset_init() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +527 drivers/gpu/drm/udl/udl_modeset.c

72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  518  	encoder = &udl->encoder;
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  519  	ret = drm_encoder_init(dev, encoder, &udl_encoder_funcs, DRM_MODE_ENCODER_DAC, NULL);
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  520  	if (ret)
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  521  		return ret;
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  522  	encoder->possible_crtcs = drm_crtc_mask(crtc);
5320918b9a87865 Dave Airlie       2010-12-15  523  
a80d9e00c8195dc Thomas Zimmermann 2024-04-04  524  	connector = &udl->connector;
a80d9e00c8195dc Thomas Zimmermann 2024-04-04  525  	ret = drm_connector_init(dev, connector, &udl_connector_funcs, DRM_MODE_CONNECTOR_VGA);
a80d9e00c8195dc Thomas Zimmermann 2024-04-04  526  	if (ret)
                                                        ^^^^^^^^

fe5b7c86d6068ac Daniel Vetter     2020-03-23 @527  		return PTR_ERR(connector);
                                                                       ^^^^^^^^^^^^^^^^^^^

This needs to be updated to "return ret;"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

