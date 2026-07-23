Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1B2439F6E
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jul 2026 10:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801449; cv=none; b=Yj1pXxG7a2U0VAWZ9q577g80SbaGgqTFo00782kHIr2poBZZxaTXNW68qMrNOXHMogpRnABzoUAy83MVj+uNaf3AyhRK0a6LN0ePSzHTbi49AOMNS7QDPBe3dD2E/bWLvg7Sr8G+JUN4OCCjd0Bt/aclOFS951R4rUs3Dc8DlAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801449; c=relaxed/simple;
	bh=7uNqoHZJB1OLQlZYNxJ14kxabLxmbsy5jmhrZ3SSQz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m1ZV4cYEvTB6XEp4XHwkJEFYvRDmDQGWxpRRCh3fy3bb/BG1LKheWCdS+qgPWaRD8rQODjVdPgfdqSNJ/t+dw5RTqXPLDmmGDnuTc2bIUPWx+vDHHt6rxqZ0KSNHRye8s9aJxjwEwQbeJarYak4VUHN0ds3GQPlekp4t/nCrd2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQjtCi3Q; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQjtCi3Q"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49548e01d02so2579415e9.0
        for <oe-kbuild@lists.linux.dev>; Thu, 23 Jul 2026 03:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784801446; x=1785406246; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8PFnSXs9dpLQsnpvf5yV3p+yztdjyItTaeBdXVMar8c=;
        b=nQjtCi3QzlB6jGsUFErCjbQOBnP65wlXWY/ilIQZBnWJIOByjhxrC+QJtRD79TdF8T
         WId9RsRVv7kVkpQQnxiKmBfRONhSL3CX6NFFRB6H6O/a47IDGYelEja9vFA7lNh/eZno
         aIf5y1/mnitksdPvcnJFz8Em0fg+QrEEs+UWhrXCRJqHNRrYiP3Gmp4wF4xZ0xgbd0RZ
         bN2iYDOQeWy98fhVD2y1VvAQIGLmaVekGVLyxuvAzr/lcFtP6xcbQBWVgwJI4pIFc1dk
         ZBTeF1ykPvA73hcHGREpAbJUXTfUj8LICIoZqnyRzFpiJT/qYcWMG84MGOor/Kaf3T0F
         vSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784801446; x=1785406246;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8PFnSXs9dpLQsnpvf5yV3p+yztdjyItTaeBdXVMar8c=;
        b=qtdoxGvjlPQReWyUGgtpH/TE7Lxb7ooL16EkkXUJW/NHTl3+7VgCETcaDrRWlYc4MO
         OzdJNdlQ40pISs3Ufgr309FVBz7yoODfs65MGoRP3aEf4zGyw51vP+r8JkCsdXfAA7BT
         issLB9h+tW3LXwJ5pnM01cNk5VT7MSX7bG9rkrjK9s2qOe3NNv/FiJWcAeFURYygzMjZ
         IJiQBhAVhl+W63rR3xhaLwzHZG5/nJUiZ7Hx2fNt9k7SY3GzmSRL7hGEt0VW1IHHXYf7
         wh2PEa1DU5l7oi3Wq4MTlVSAhUXFOLbPUodgAoGFRfqcarw7y6pAdR9+j2j/uVr39/ee
         8S7A==
X-Gm-Message-State: AOJu0Yy6YbydLOOZ8q4teCdb/Ngbq3UccAV4iaGPP0/aniZKIpbTocmb
	aBtGP6QQo28+Cg7Bg1ddi0rOV2JFbVk+wOa6iolUoaQglZby/W3tAn53HTTwaGx7G/w=
X-Gm-Gg: AR+sD13NzmXDCKlwJfMxsdTXnzyGTnkgVCCXwHL4e77M8QYKjjzcmdvPSBECh16NNNi
	c5pNyxetas2sUWaR05nymi23/xVNzUp1VRQGp1B5parpWYgIcUqyVNZcQZlRBC+4wTe6UZ5YEYw
	FL4JAHTIlgdmhKglFGxbOyE7GrztNZ/gZWokjktdFgS9whQ5Yv0rQhjPvTHEnOWVuFNcjpw7cAY
	0n+M4TZAFtML2NY57iVaEax/Uo4zNbn9O7pvuBaKRtj7+PkHcACorW0oYibEVSn+3uJRxqDKEv8
	kdwM+rWHCZWhrlFW8UmA53MWjunzu9cPlTMpOt8XLaOGwNHhgRJ1PmZbXmVOJigBIhemzvoOScz
	GBpctE8Hk3Dzg2hDeOt5Ohl03Z5MQoBz1/3EEoseyo8TdJ1vPMTE8UL7IFooiHaNuD+9f5xk9tN
	4+W9kjxPgu
X-Received: by 2002:a05:600c:4b1a:b0:495:518a:5cbf with SMTP id 5b1f17b1804b1-49573d08bafmr15545315e9.32.1784801445705;
        Thu, 23 Jul 2026 03:10:45 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b0395f7sm91287285e9.3.2026.07.23.03.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:10:45 -0700 (PDT)
Date: Thu, 23 Jul 2026 11:37:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Gleb Markov <markov.gi@npc-ksb.ru>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	George Zhang <george.zhang@amd.com>
Subject: [linux-next:master 5380/8209]
 drivers/gpu/drm/amd/amdgpu/../display/dc/hubp/dcn10/dcn10_hubp.c:775
 hubp1_is_flip_pending() error: we previously assumed 'hubp' could be null
 (see line 760)
Message-ID: <202607222312.rWq7Txie-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260723083719.NlTVJSUcuu3DfQq9u4MUoiSkAZY0HreN7Bk47cTmO5w@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   290aaf24a551d5a0dce037e3fab30820f9113a10
commit: b736792e5bd4a62f24e8d1e310bf4a75bfbeaaaa [5380/8209] drm/amd/display: Remove unused-but-set variable hubp from
config: x86_64-randconfig-161-20260721 (https://download.01.org/0day-ci/archive/20260722/202607222312.rWq7Txie-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607222312.rWq7Txie-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/hubp/dcn10/dcn10_hubp.c:775 hubp1_is_flip_pending() error: we previously assumed 'hubp' could be null (see line 760)

vim +/hubp +775 drivers/gpu/drm/amd/amdgpu/../display/dc/hubp/dcn10/dcn10_hubp.c

8feabd03d34e45 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yue Hin Lau        2017-10-02  754  bool hubp1_is_flip_pending(struct hubp *hubp)
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  755  {
db3bc05034a4b0 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Dmytro Laktyushkin 2017-06-28  756  	uint32_t flip_pending = 0;
8feabd03d34e45 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yue Hin Lau        2017-10-02  757  	struct dcn10_hubp *hubp1 = TO_DCN10_HUBP(hubp);
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  758  	struct dc_plane_address earliest_inuse_address;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  759  
e8cb7a4dd9dfff drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c      Aric Cyr           2020-08-21 @760  	if (hubp && hubp->power_gated)
                                                                                                                    ^^^^
This check can be deleted.  If you have cross function analysis then
Smatch knows that the NULL check is harmless but if you don't then it
warns that the NULL check doesn't make sense.

e8cb7a4dd9dfff drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c      Aric Cyr           2020-08-21  761  		return false;
e8cb7a4dd9dfff drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c      Aric Cyr           2020-08-21  762  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  763  	REG_GET(DCSURF_FLIP_CONTROL,
db3bc05034a4b0 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Dmytro Laktyushkin 2017-06-28  764  			SURFACE_FLIP_PENDING, &flip_pending);
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  765  
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  766  	REG_GET(DCSURF_SURFACE_EARLIEST_INUSE,
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  767  			SURFACE_EARLIEST_INUSE_ADDRESS, &earliest_inuse_address.grph.addr.low_part);
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  768  
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  769  	REG_GET(DCSURF_SURFACE_EARLIEST_INUSE_HIGH,
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  770  			SURFACE_EARLIEST_INUSE_ADDRESS_HIGH, &earliest_inuse_address.grph.addr.high_part);
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  771  
db3bc05034a4b0 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Dmytro Laktyushkin 2017-06-28  772  	if (flip_pending)
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  773  		return true;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  774  
b736792e5bd4a6 drivers/gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c Gleb Markov        2026-06-29 @775  	if (earliest_inuse_address.grph.addr.quad_part != hubp->request_address.grph.addr.quad_part)
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  776  		return true;
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  777  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  778  	return false;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  779  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

