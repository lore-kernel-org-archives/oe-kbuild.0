Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3501378
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Sep 2023 09:00:28 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2bd6611873aso52442621fa.1
        for <oe-kbuild@lists.linux.dev>; Wed, 06 Sep 2023 02:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693990826; x=1694595626; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YNR9tc9V8X845jqkup6Rb0/4lLzAX/3+ihyBS0Kt6/Y=;
        b=GxI5k1I7GYEwnIk3pc6ULbLX5qeOHiVTKTexxRHQftbGPgMqgkcIh/zg8ohOmIEglK
         6f/iIy9zlp2Tbu6eyeFNnaXGatsmr8rEpxKn00MNQwm9TyG1lKwLLxOySKzqSGd+qZ1x
         B1sXHlh5oWKdQgw4g9D4vacTkqDipUdHvEwgsLPPjmA6MAc13mnVc29okoXPW+58CXef
         5QNWnff4WFdy7gsAmvaztq8XpYmmPp89NWIlbn117I/v9zrUjXftn3DTKU6OwW4/vUPi
         BP5ItTr5hgrC09OMMJrH2DKaYUYe6IGKH0ZFbeVCKOTQmsoiH3z4ywwFvzJRr212As+b
         nEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693990826; x=1694595626;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNR9tc9V8X845jqkup6Rb0/4lLzAX/3+ihyBS0Kt6/Y=;
        b=MRemXHG5L0JnxFnjk5vOanW2wUWzK8Ne+B3bO91RS8IddPO0bwPwkNqj1s5164h6pr
         x9z3jVc2SXY+QPHnp9tXbHdSiqt5j+qFf0TsTXB0ruRRK/KTR/CdwSHy6PutcP2kFA9P
         xUnwPkdM5SxRGwxYSLb2hfxloKbozZ8xJW/5Yqd3uLbBfMtIJvnRRRvO6XwBBzT+Thqh
         FFCER4q2ARYECgkkbyphH3H5Af+jKBHeH9grdSXfi71NKvsIDsbDmXCflmsWvmlVzHim
         kvdNsn3i2JpHa4OkJU4oxY+p12tKixQ2C5Kq5l0sXy71ytL+XtrEgOJp/IuFVecyA5Bp
         F79Q==
X-Gm-Message-State: AOJu0YwsGSPzn9XsQbPw4MLnBfW0vGYUXL73X277BtXzohabIrBT/a4C
	Am3XIuWfXRjxQ56eRg8FOivvYAfDy/qLJBDZwNQ=
X-Google-Smtp-Source: AGHT+IENm9l0/7Lf8ftURYcnkrJwmqqxmbkhcKp46xPYLirM/SwAyy6pdxjcREnyxJKZ0XEvZQ9wGA==
X-Received: by 2002:a2e:3a13:0:b0:2bc:ed75:1ba with SMTP id h19-20020a2e3a13000000b002bced7501bamr1572102lja.16.1693990825833;
        Wed, 06 Sep 2023 02:00:25 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y11-20020a1c4b0b000000b003fe2b081661sm22199669wma.30.2023.09.06.02.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 02:00:25 -0700 (PDT)
Date: Wed, 6 Sep 2023 12:00:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Animesh Manna <animesh.manna@intel.com>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, jani.nikula@intel.com
Subject: Re: [Intel-gfx] [PATCH v5 3/6] drm/i915/panelreplay: Initializaton
 and compute config for panel replay
Message-ID: <31382522-4aaf-473e-a459-0368ab4cc1e2@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905073551.958368-4-animesh.manna@intel.com>

Hi Animesh,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Animesh-Manna/drm-panelreplay-dpcd-register-definition-for-panelreplay/20230905-154811
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230905073551.958368-4-animesh.manna%40intel.com
patch subject: [Intel-gfx] [PATCH v5 3/6] drm/i915/panelreplay: Initializaton and compute config for panel replay
config: i386-randconfig-141-20230906 (https://download.01.org/0day-ci/archive/20230906/202309060644.uWp5zW4i-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230906/202309060644.uWp5zW4i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309060644.uWp5zW4i-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_dp.c:3779 intel_dp_vsc_sdp_pack() warn: was && intended here instead of ||?

vim +3779 drivers/gpu/drm/i915/display/intel_dp.c

03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3755  static ssize_t intel_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3756  				     struct dp_sdp *sdp, size_t size)
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3757  {
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3758  	size_t length = sizeof(struct dp_sdp);
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3759  
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3760  	if (size < length)
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3761  		return -ENOSPC;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3762  
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3763  	memset(sdp, 0, size);
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3764  
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3765  	/*
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3766  	 * Prepare VSC Header for SU as per DP 1.4a spec, Table 2-119
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3767  	 * VSC SDP Header Bytes
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3768  	 */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3769  	sdp->sdp_header.HB0 = 0; /* Secondary-Data Packet ID = 0 */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3770  	sdp->sdp_header.HB1 = vsc->sdp_type; /* Secondary-data Packet Type */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3771  	sdp->sdp_header.HB2 = vsc->revision; /* Revision Number */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3772  	sdp->sdp_header.HB3 = vsc->length; /* Number of Valid Data Bytes */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3773  
cafac5a9836199 Gwan-gyeong Mun 2020-05-14  3774  	/*
4dd2d4a2ffcae4 Animesh Manna   2023-09-05  3775  	 * Other than revision 0x5 which supports Pixel Encoding/Colorimetry
4dd2d4a2ffcae4 Animesh Manna   2023-09-05  3776  	 * Format as per DP 1.4a spec, revision 0x7 also supports Pixel
4dd2d4a2ffcae4 Animesh Manna   2023-09-05  3777  	 * Encoding/Colorimetry Format as per DP 2.0 spec.
cafac5a9836199 Gwan-gyeong Mun 2020-05-14  3778  	 */
4dd2d4a2ffcae4 Animesh Manna   2023-09-05 @3779  	if (vsc->revision != 0x5 || vsc->revision != 0x7)

This changes the rest of the function into a no-op.  Ideally this sort
bug would be caught in testing.

cafac5a9836199 Gwan-gyeong Mun 2020-05-14  3780  		goto out;
cafac5a9836199 Gwan-gyeong Mun 2020-05-14  3781  
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3782  	/* VSC SDP Payload for DB16 through DB18 */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3783  	/* Pixel Encoding and Colorimetry Formats  */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3784  	sdp->db[16] = (vsc->pixelformat & 0xf) << 4; /* DB16[7:4] */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3785  	sdp->db[16] |= vsc->colorimetry & 0xf; /* DB16[3:0] */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3786  
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3787  	switch (vsc->bpc) {
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3788  	case 6:
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3789  		/* 6bpc: 0x0 */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3790  		break;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3791  	case 8:
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3792  		sdp->db[17] = 0x1; /* DB17[3:0] */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3793  		break;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3794  	case 10:
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3795  		sdp->db[17] = 0x2;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3796  		break;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3797  	case 12:
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3798  		sdp->db[17] = 0x3;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3799  		break;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3800  	case 16:
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3801  		sdp->db[17] = 0x4;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3802  		break;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3803  	default:
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3804  		MISSING_CASE(vsc->bpc);
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3805  		break;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3806  	}
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3807  	/* Dynamic Range and Component Bit Depth */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3808  	if (vsc->dynamic_range == DP_DYNAMIC_RANGE_CTA)
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3809  		sdp->db[17] |= 0x80;  /* DB17[7] */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3810  
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3811  	/* Content Type */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3812  	sdp->db[18] = vsc->content_type & 0x7;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3813  
cafac5a9836199 Gwan-gyeong Mun 2020-05-14  3814  out:
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3815  	return length;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3816  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

