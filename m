Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64531552E0
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 08:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727253411; cv=none; b=HBqeCqxCx4MsjlrF25ybAc0xyWkjKSR/dkb6xZ9v2OmNiuAE08ipKGe+Iv8k83NVACJWxzRuW2STRJH5UdXizLTimQNlXQVzHMuxupkYbr2q9aURxikLxkqu2S1q1qgrQjBi1UPzNdue6XvdOuhx5ic2TfvRz6NGO/wpavSl2WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727253411; c=relaxed/simple;
	bh=hFX5MsOVvjcdZd2f+saKTifXHbdQI2NeLDIcbXQLoh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SFTumeGu/z2WAfwtIHRm/5Y9a7U2hQ0nMBn4hHhmC0E0aFNCvKWQ6fZI+G+HPDZsKAwx+o380jGpOYLjGNjufAa3rHQrBQfybW5qZAxoVc7o/pVkX2AFSUcmN7939q5qYLWyTjx+ydc62VpNJ8oAmgPLLm7lTO4HJwRD9coI/S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uWBLsas9; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uWBLsas9"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37cc9aeb01dso132491f8f.2
        for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 01:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727253407; x=1727858207; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=24TAtbArscHpN8Q5Ya3k/SGwY5zHz1+8qMhqhIxqNPQ=;
        b=uWBLsas9XL5m93IttCJselAIvsjr7k2lMvsRC1h4AwEDzjmPp8e17UplokEZV3ezgQ
         4mT7AehIAqjWxHFcd1zJTv/ve2aaxhRWPEjy3/fqC56Mi092yxjrY/fQfYPqJfw/FRgw
         /cPxJe/Em2iu2P2FWU47/cQ59h+0pRnvg112oUI2htVlJTWH/BMbcBnAdp0InX9+5Y0X
         P+LJr9CoOT+6CA784PikqOhM0Q0AL9SCv94QC7BLHpG91NcfuCyGnyBrT5If1yHW6pFq
         3s+Opi32uXM4hKOchZrBwI7Cqna1HCYJ9CKFpShWzBbysPtZ46tNkjAUnVcVQHTYlruk
         ZJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727253407; x=1727858207;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24TAtbArscHpN8Q5Ya3k/SGwY5zHz1+8qMhqhIxqNPQ=;
        b=OlLUkFCX9tR0VBvOk5uAhjkt/ZZro8lRm70gdn4OwOSqKOA2x8D5YjU+puU1+kPbIW
         b+nom39yoGp3gj66ra8YhPU2M/Pj8ySE+EheL0jM7uJ7FdlMOOUNxL/1p6mPDhd9a/pk
         5zrNNdkqe06SqbvCCZ1vwb0jSlaO6dUkrCmtYgalwSimnEUSDay2ZjQMpQ1P5RIkuZij
         Es/O4NS9u8v/h1DXPaoVAF9nABZCjV7ctygSA9CLmEjnFjommMU4VSo74jrXnKyxTFTN
         SfXimm/CD5DpZZ2zaAzD4G66iKGKkXK0Hrc2eXg2ZPpAb4wlpe1WkgJY4uPXS/PU98kh
         UFqQ==
X-Gm-Message-State: AOJu0Yx/iTjP0cRF2PggE9AxfHciXT8+iqxs7uuNO9u09r0QmCvD4mJB
	45HamEnCiL8w2geQ//iscL6UP5LszJEVIWlowqKZQJeqtMftxC+txNWKNR1PqHkI4xFjyqxWGAV
	q
X-Google-Smtp-Source: AGHT+IGxLktfoNE2e2EE4CrdWmjS2fFk7LgFAgB99YMRslWo9edoYR8GVryJlZM+pVzqAnkQDLGUXA==
X-Received: by 2002:a5d:4946:0:b0:374:c1a9:b989 with SMTP id ffacd0b85a97d-37cc2464e4fmr1398488f8f.1.1727253407268;
        Wed, 25 Sep 2024 01:36:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc31f33bsm3383526f8f.97.2024.09.25.01.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:36:46 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:36:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Fangzhi Zuo <Jerry.Zuo@amd.com>,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org, lyude@redhat.com,
	jani.nikula@intel.com, imre.deak@intel.com, simona@ffwll.ch,
	wayne.lin@amd.com, Harry.Wentland@amd.com, rodrigo.siqueira@amd.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Fangzhi Zuo <Jerry.Zuo@amd.com>
Subject: Re: [PATCH] drm/display/dsc: Refactor MST DSC Determination Policy
Message-ID: <e817b705-2147-4c69-a43c-704eaf07eeee@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919173944.256887-1-Jerry.Zuo@amd.com>

Hi Fangzhi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fangzhi-Zuo/drm-display-dsc-Refactor-MST-DSC-Determination-Policy/20240920-014114
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240919173944.256887-1-Jerry.Zuo%40amd.com
patch subject: [PATCH] drm/display/dsc: Refactor MST DSC Determination Policy
config: microblaze-randconfig-r071-20240922 (https://download.01.org/0day-ci/archive/20240923/202409231002.bMP89Ipm-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409231002.bMP89Ipm-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/display/drm_dp_mst_topology.c:6046 drm_dp_mst_dsc_aux_for_port() warn: variable dereferenced before check 'port' (see line 6035)

vim +/port +6046 drivers/gpu/drm/display/drm_dp_mst_topology.c

cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6033  void drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26  6034  {
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19 @6035  	struct drm_dp_mst_topology_mgr *mgr = port->mgr;
                                                                                                                                              ^^^^^^^^^
The patch adds an unchecked dereference

cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6036  	struct drm_dp_mst_port *immediate_upstream_port = NULL;
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6037  	struct drm_dp_mst_port *fec_port = NULL;
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6038  	struct drm_dp_mst_port *dsc_port = NULL;
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6039  	struct drm_dp_aux *upstream_aux;
53965dbe5396d2 drivers/gpu/drm/drm_dp_mst_topology.c         Paul E. McKenney 2020-02-19  6040  	struct drm_dp_desc desc = {};
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6041  	bool end_has_dpcd = (port->dpcd_rev > 0);
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6042  	u8 endpoint_dsc = 0;
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6043  	u8 upstream_dsc;
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6044  	u8 fec_cap;
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26  6045  
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26 @6046  	if (!port)
                                                                                                            ^^^^^
But the old code assumed port could be NULL.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

