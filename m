Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7687C1EC012
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 10:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730975888; cv=none; b=GViIa0hvvFkIbVDJqieDA2NdJRTgiFNhUv+Ep+lXT+2DFt+oPSc+0bt7LFVhtLx5pcXf2FdIkQD2Uuk47tW1omLpYSmVfKG7Q+Avcmpi246n6rQd67qkF+WEYgaC68NGYZ8keS7yr//EptsrYspYjMbVNm9OdcfwBvo5XprSTEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730975888; c=relaxed/simple;
	bh=DZ5mEUpN6Q5Kzlaoh3QrkJ+qQmq/r5X83d34Sn9kDzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=pIlj4kDCxAJYKBWZ0m3LSKHVykookNMRAqK2UrhGyg1z9ymTqA6Kk7eJtYdPgvm2YOi3gEQjnBR7may2iH6HV97AQGZl5wTVeeFvESrIupyyfDvjm5nG8wN4qJbfYzDoNFuqh8xCKuBYMH1wWCw50nPm4NcVT+vPbgiUPws4eto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EitsHwXT; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EitsHwXT"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d50fad249so558160f8f.1
        for <oe-kbuild@lists.linux.dev>; Thu, 07 Nov 2024 02:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730975884; x=1731580684; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ea2x5q1iMawp9uzNjcI5iHXvZAYMp3llBYpFWmiscrQ=;
        b=EitsHwXTn+hNu5S2w0mtyOVpyb5e1HO3D+E8ZqGaTjZTdasymm/wls5sHJ+7Hq2YD6
         ijvw8xB92g/rTUk4QgMbz/mS3Y+sq8waZ1T9LUUWpxLSK7Ylu6+v+ki2De7kwc3/355Z
         xex87WLyxUDMErMdNvdKy6hq0rKjgVztrLw9EaNc5LKtbZyjiICyA1xG1SDpNW3ceMHh
         CuAu246u9ojPJxqRoeqBSG3ZYGjE4JqXs02cn1U8lXRZlkcOZ7oaJXnvmThYncg16gWi
         Uw4dNqnrxPn50qqds8MQQAJqONf7EcYlFW0Oo2crSzgUMWZsnzJ3LPt0tQVDOpaFHaS5
         mv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730975884; x=1731580684;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ea2x5q1iMawp9uzNjcI5iHXvZAYMp3llBYpFWmiscrQ=;
        b=HMPkSHbDUB+gRLwiWLQ9zcuvcXUErb0kqKV/bAGbRNIHGJ8xZiWX9gB2iotZMd/9Dt
         tXLjR8YOGwetk4zkxpRLisTSwGXUduSFCfg8dMAzUHiw2Fc/bRaGuqT8/9YCp7oaiAy5
         mHlrNLCWli7eSc1LPa0veRoa3T+g9GX5jocBqguEwE88C/VstDclPA9l0jSCgxfbfi7p
         96qfSxFA6NDkgGmFC5jPC4THnl2SesyNv8jbFhHADGuB9Ll7Ko6Lm/mFgNswJJNiyn5I
         aeAbRrMnRsUN30+Dti1BRS1byHvDEzFbsjXPiPb6R5T8Ob3h/NqR8UC9hOzz3xO7gWYb
         fv/A==
X-Gm-Message-State: AOJu0Yw3o0hMg0SU3F/Mvoj0i/TSX/crqA9AD9gXu3/JQjwYfSvW1dQT
	vNpNXJ5fSXl44gETLiaaT005AXH8iKrrMM4TmZn7NGYFUzFOhoMJBHjy8E/S76GH2Elyk5RMKAG
	RLDg=
X-Google-Smtp-Source: AGHT+IE/JyUY2849SdaTntRM722nrvqF2Ek0pKx7giJ2CxkVbfrvqDorwDiGkVI96IfoO0Q1OO0+jw==
X-Received: by 2002:a05:6000:104a:b0:37d:2de4:d64 with SMTP id ffacd0b85a97d-38061162c32mr28765698f8f.35.1730975884157;
        Thu, 07 Nov 2024 02:38:04 -0800 (PST)
Received: from localhost ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9707c8sm1359412f8f.17.2024.11.07.02.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 02:38:03 -0800 (PST)
Date: Thu, 7 Nov 2024 13:38:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Fangzhi Zuo <Jerry.Zuo@amd.com>,
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, lyude@redhat.com,
	jani.nikula@intel.com, imre.deak@intel.com, simona@ffwll.ch,
	wayne.lin@amd.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, harry.wentland@amd.com,
	rodrigo.siqueira@amd.com, Fangzhi Zuo <Jerry.Zuo@amd.com>
Subject: Re: [PATCH v3 1/2] drm/display/dsc: Refactor DRM MST DSC
 Determination Policy
Message-ID: <a1720b79-e59f-4f69-a089-c03f3a6cbba9@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106150444.424579-2-Jerry.Zuo@amd.com>

Hi Fangzhi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fangzhi-Zuo/drm-display-dsc-Refactor-DRM-MST-DSC-Determination-Policy/20241106-230854
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20241106150444.424579-2-Jerry.Zuo%40amd.com
patch subject: [PATCH v3 1/2] drm/display/dsc: Refactor DRM MST DSC Determination Policy
config: i386-randconfig-141-20241107 (https://download.01.org/0day-ci/archive/20241107/202411071102.0CMTIEIo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411071102.0CMTIEIo-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/display/drm_dp_mst_topology.c:6043 drm_dp_mst_dsc_aux_for_port() warn: variable dereferenced before check 'port' (see line 6033)

vim +/port +6043 drivers/gpu/drm/display/drm_dp_mst_topology.c

c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6031  struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6032  {
fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06 @6033  	struct drm_dp_mst_topology_mgr *mgr = port->mgr;
                                                                                                                                      ^^^^^^^^^
Dereferenced

fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06  6034  	struct drm_dp_mst_port *immediate_upstream_port = NULL;
fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06  6035  	struct drm_dp_mst_port *fec_port = NULL;
fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06  6036  	struct drm_dp_mst_port *dsc_port = NULL;
fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06  6037  	struct drm_dp_aux *upstream_aux;
fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06  6038  	bool end_has_dpcd = (port->dpcd_rev > 0);
fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06  6039  	u8 endpoint_dsc = 0;
70a6587dca37a3 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak     2024-09-09  6040  	u8 upstream_dsc;
fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06  6041  	u8 fec_cap;
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6042  
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26 @6043  	if (!port)
                                                                                                    ^^^^^
Checked too late.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

