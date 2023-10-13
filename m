Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9A8111B2
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Oct 2023 09:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ay9PECxf"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40572aeb73cso20289925e9.3
        for <oe-kbuild@lists.linux.dev>; Fri, 13 Oct 2023 02:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697191084; x=1697795884; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ocJBZLEi9wSRp8rh8uk67sPMdfWE3WWFx693+fh+hI=;
        b=Ay9PECxfNha2Xlp1S4+hk4mdnoDoV27n/z7I9NVlAIa3DpIPPZEdDqp+UQq1qNcIqp
         cQJy7RMvQmZk7Ffg+9wakbtFII/7sTF2gJEUhRiCkaeDroWwom2leUAGSrMjcOGQJzGj
         Mn8BiAt486j5VPcHnsW1X9cwe9kpOqP0aTMXKVqtZyPT80zO9G5aHLxhzM2Hs8gf1DXd
         1hR9+ANqRvpYkV8JtDGpBCWNHfnT11//n1HKoVlHHL3VamObVZmqQckBiAGmZj2YqwUT
         6Q2OAMPnciZhyOV1XWlQre0i5a5apGp5OlesHNqWMKYtfrkfzAEordzCa46wSyHy93yh
         TViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697191084; x=1697795884;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ocJBZLEi9wSRp8rh8uk67sPMdfWE3WWFx693+fh+hI=;
        b=lO6oHoBLOdl5PfuTm3au4k9XqvSi6pC0A3m12gsXg6qbcnDGTEBdo2iD2W2HAYd4EU
         uf0OSOYvZTOaIgGSLlOJYtkeCcm9/sKQHwar8b5zMaAzndCAxm4by9gnZieokRwBI+wV
         4I4ba8ISm4NjGyH7T2ExUFZwgReO+b9XwUJHIvg6s542UV7vgG0eHy/62YepGPsLd0ch
         7l0ZR2Mh4IEqcvzDhD0Ui/1Nl8Mb7fpYqrvEbz8/3JT62Ih3dv2lQQYpOtLZRPD+/F1l
         xAOWCk3sa82/RZ0aXTUargia1pn9EfgnhkQ77fcJ2lbenus5QAQju1aJXgBtbD8ewIuV
         HPqA==
X-Gm-Message-State: AOJu0YzH1IMx3dzxyh+IXdLSAcUyILBle4GFQ2ozzDGy8Gw0wh19gcDH
	88hAtc4UJ8a93MUS5a1d66iuZ6yFymjcIokkAAY=
X-Google-Smtp-Source: AGHT+IGRLyIbOn2Y3t2dM0ZahoRGxdRGOL8osg/l6kwEUTXpflIhGwtDi3zcaF+cLb3S9+vp3FfXQw==
X-Received: by 2002:adf:e19d:0:b0:32c:ea14:89e5 with SMTP id az29-20020adfe19d000000b0032cea1489e5mr11113769wrb.39.1697191084016;
        Fri, 13 Oct 2023 02:58:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w14-20020adfee4e000000b0032d2489a399sm2958801wro.49.2023.10.13.02.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 02:58:03 -0700 (PDT)
Date: Fri, 13 Oct 2023 12:58:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 11/37] drm/connector: hdmi: Add Infoframes
 generation
Message-ID: <45d3c7ec-4a29-46b4-908c-fcca0e80e937@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920-kms-hdmi-connector-state-v2-11-17932daddd7d@kernel.org>

Hi Maxime,

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-connector-Introduce-an-HDMI-connector/20230920-224045
base:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
patch link:    https://lore.kernel.org/r/20230920-kms-hdmi-connector-state-v2-11-17932daddd7d%40kernel.org
patch subject: [PATCH RFC v2 11/37] drm/connector: hdmi: Add Infoframes generation
config: i386-randconfig-141-20230921 (https://download.01.org/0day-ci/archive/20231013/202310131716.jCWEzGsA-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310131716.jCWEzGsA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310131716.jCWEzGsA-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_atomic_state_helper.c:938 hdmi_generate_vendor_infoframe() warn: ignoring unreachable code.

vim +938 drivers/gpu/drm/drm_atomic_state_helper.c

ae7d8bc7dd1dbf Maxime Ripard 2023-09-20  921  static int hdmi_generate_vendor_infoframe(const struct drm_connector *connector,
ae7d8bc7dd1dbf Maxime Ripard 2023-09-20  922  					  struct drm_connector_state *state)
ae7d8bc7dd1dbf Maxime Ripard 2023-09-20  923  {
ae7d8bc7dd1dbf Maxime Ripard 2023-09-20  924  	const struct drm_display_mode *mode =
ae7d8bc7dd1dbf Maxime Ripard 2023-09-20  925  		connector_state_get_adjusted_mode(state);
ae7d8bc7dd1dbf Maxime Ripard 2023-09-20  926  	struct drm_connector_hdmi_infoframe *infoframe =
ae7d8bc7dd1dbf Maxime Ripard 2023-09-20  927  		&state->hdmi.infoframes.vendor;
ae7d8bc7dd1dbf Maxime Ripard 2023-09-20  928  	struct hdmi_vendor_infoframe *frame =
ae7d8bc7dd1dbf Maxime Ripard 2023-09-20  929  		&infoframe->data.vendor.hdmi;
ae7d8bc7dd1dbf Maxime Ripard 2023-09-20  930  	int ret;
ae7d8bc7dd1dbf Maxime Ripard 2023-09-20  931  
ae7d8bc7dd1dbf Maxime Ripard 2023-09-20  932  	ret = drm_hdmi_vendor_infoframe_from_display_mode(frame, connector, mode);
ae7d8bc7dd1dbf Maxime Ripard 2023-09-20  933  	if (ret == -EINVAL)
ae7d8bc7dd1dbf Maxime Ripard 2023-09-20  934  		return 0;
ae7d8bc7dd1dbf Maxime Ripard 2023-09-20  935  	else
ae7d8bc7dd1dbf Maxime Ripard 2023-09-20  936  		return ret;

This was probably intended as:

	if (ret) {
		if (ret == -EINVAL)
			return 0;
		return ret;
	}

ae7d8bc7dd1dbf Maxime Ripard 2023-09-20  937  
ae7d8bc7dd1dbf Maxime Ripard 2023-09-20 @938  	infoframe->set = true;

Unreachable.

ae7d8bc7dd1dbf Maxime Ripard 2023-09-20  939  
ae7d8bc7dd1dbf Maxime Ripard 2023-09-20  940  	return 0;
ae7d8bc7dd1dbf Maxime Ripard 2023-09-20  941  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

