Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5997603F
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 09:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736156630; cv=none; b=EusEkcaC9jrhI5Spbm1++ieaUViMzlpLkUMi68/wIDdCvWIvna8np85aD0IXLsraNtoAq7hrv130CEiNvwv25kCIOXD/UQwBi0esi1DlXpJ9vrdEbwVZ+kzRJ5VrhLGnM/eaivSZyCbTfvv5MsFlY9Cd6lsaT3dnrf0DqP307Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736156630; c=relaxed/simple;
	bh=nn88hpp6nf5t1s45ZH0IpdaFSlKDUzV8ZiHfDn7X76s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ndXlGThfQAb2zoT6bzzDcLbhuCtSO2l7x5XHgZymL9z+rdmrb0oCsQRySGF2WjJyWb4DindSzQkl/4peTCoQLC6jpiIQElyHWHIOuVy+r2eTh7n8zMAvcJaqa+bbIUioYGlJJOeVcfJT4FPpg5kLEmEUXgLAip99Dsu5//WPnyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lg59vwNE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lg59vwNE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso101157305e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Jan 2025 01:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736156626; x=1736761426; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8+dNzGeurdxTiF3lweD7uy5ZExBGDAhgDE2t5fP9vpw=;
        b=Lg59vwNEtzcDD/lh+EpFJ8baxjGC4Nr7tGJP3ptNm+aXPOEZVlZGxSvp8EClHNr+fx
         HNg55ga6KekDifT9dOXohX/1RzWG4urYV+b3VmIKoNRXcXGfxoDihBvaTQhoLJ0ZtkRv
         Hxf4aAdUKbBHzojkvdfKPPQ4uVjUCFAxfPgGkfcvNF6s4oIIcQiATBlR91FwH2vahSH6
         mNF0pDbyV0JoptZ3SqEonHyujE0q1/LlQ/BH7kpF6O1zeJVSPjeBR5oYdreLEsCiCDVj
         oPwrqoiBBRGZqYc5ntDC+CiJN6Np730mUx6RTmVtL/G3e57OlYr8aNoxW/oeLrrFT0zn
         MSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736156626; x=1736761426;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+dNzGeurdxTiF3lweD7uy5ZExBGDAhgDE2t5fP9vpw=;
        b=k+AP+AkrqG+6p3Uqb+G+GYhw+BqpwqpuzJ7osf8uaP61OujmVje4fcv1CUk6/lssj9
         3S43icmBJrwY0JaFiluH4SzLfuODxVn5VM5jTef+AtohrlVVyhNwL8vzAnDnamAm1l56
         UgX359M06MHpD3JEkXzH433aABUsX+v9lltQuU1Mcj0EYr4+g5wS+KvQMc3vqh+cKoyl
         tCGx5HCgP2G0oviCYNJKMtiLtkTeUTtnC6XtqWxvbYt/SQZ0JDcnMMumUGkvgQYqNCCU
         XT8uFkoGayp/2nRpWjy/gT4uwIjVoBPu8Xs4uVnmgObOiTCn31LQbev2gnCciDyodnyJ
         qTRA==
X-Gm-Message-State: AOJu0YxBl/VrN9vkLt+5Dt+0UPsLhs6Ye0NoNIBbpmwB+qynuxkTEkcX
	gs4dadEANeZ5WF5WCNlaJlNan0L+sxTvGPuBnUU0s4WuyGgqTBWRc0yUk9DXt/8EhaSSCZgFyrE
	8
X-Gm-Gg: ASbGnct6L6gPGk+9vJ6JLzoIJWXBzy1ii3DrSztnbCCVx7P45L1SYOyTLNP8nmBBzAG
	YewlmCvVFP6f9oz4bzWJ9DF6A8s9k0oPJ3Zie0hx92vJRR2AlRypl5k8or1plBBnKub+B9I0AN/
	M75mZyouo0LCWw9mG1J6XSFTw3t5NL/wuEtfMbBn+Wh5cAbGBenuenB9/f4+LVwLiIdr8GoCRq8
	STRmys/iDzU7sLYK8m0coUqavRynwBoNKWjltZitzvGpZknAVj/HPru9X/9sQ==
X-Google-Smtp-Source: AGHT+IGXyfzClNPiHyW2GNgTFvRt33m5nLlGBHLrrlc1xwKG0qtkGFBadXCTz9nR7y031prj/lvvTw==
X-Received: by 2002:a05:600c:46ce:b0:434:fdbc:5ce5 with SMTP id 5b1f17b1804b1-43668b78d1fmr459372995e9.29.1736156626486;
        Mon, 06 Jan 2025 01:43:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366e210cecsm527334305e9.2.2025.01.06.01.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:43:45 -0800 (PST)
Date: Mon, 6 Jan 2025 12:43:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [lumag-msm:msm-next-lumag 13/20]
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1042
 dpu_plane_virtual_atomic_check() error: uninitialized symbol 'crtc_state'.
Message-ID: <849910b1-10d0-45bb-aae4-87c55d2b6dea@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/lumag/msm msm-next-lumag
head:   c9261bcc1546a564407513e148c35a79a58bc2b9
commit: 774bcfb731765d092992136b54c34958d7c64bea [13/20] drm/msm/dpu: add support for virtual planes
config: powerpc-randconfig-r072-20241223 (https://download.01.org/0day-ci/archive/20241223/202412231937.tOzYv4oB-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412231937.tOzYv4oB-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1042 dpu_plane_virtual_atomic_check() error: uninitialized symbol 'crtc_state'.
drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1130 dpu_assign_plane_resources() error: uninitialized symbol 'ret'.

vim +/crtc_state +1042 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c

774bcfb731765d Dmitry Baryshkov 2024-12-15  1027  static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
774bcfb731765d Dmitry Baryshkov 2024-12-15  1028  					  struct drm_atomic_state *state)
774bcfb731765d Dmitry Baryshkov 2024-12-15  1029  {
774bcfb731765d Dmitry Baryshkov 2024-12-15  1030  	struct drm_plane_state *plane_state =
774bcfb731765d Dmitry Baryshkov 2024-12-15  1031  		drm_atomic_get_plane_state(state, plane);
774bcfb731765d Dmitry Baryshkov 2024-12-15  1032  	struct drm_plane_state *old_plane_state =
774bcfb731765d Dmitry Baryshkov 2024-12-15  1033  		drm_atomic_get_old_plane_state(state, plane);
774bcfb731765d Dmitry Baryshkov 2024-12-15  1034  	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
774bcfb731765d Dmitry Baryshkov 2024-12-15  1035  	struct drm_crtc_state *crtc_state;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1036  	int ret;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1037  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1038  	if (plane_state->crtc)
774bcfb731765d Dmitry Baryshkov 2024-12-15  1039  		crtc_state = drm_atomic_get_new_crtc_state(state,
774bcfb731765d Dmitry Baryshkov 2024-12-15  1040  							   plane_state->crtc);

crtc_state not initialized on else path.

774bcfb731765d Dmitry Baryshkov 2024-12-15  1041  
774bcfb731765d Dmitry Baryshkov 2024-12-15 @1042  	ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
                                                                                                                ^^^^^^^^^^
uninitialized.  My guess is that it isn't used in this case, however passing
uninitialized variables is still considered a bug.  If
dpu_plane_atomic_check_nosspp() were inlined (it's not) and the variable
isn't used then that's fine.

774bcfb731765d Dmitry Baryshkov 2024-12-15  1043  	if (ret)
774bcfb731765d Dmitry Baryshkov 2024-12-15  1044  		return ret;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1045  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1046  	if (!plane_state->visible) {
774bcfb731765d Dmitry Baryshkov 2024-12-15  1047  		/*
774bcfb731765d Dmitry Baryshkov 2024-12-15  1048  		 * resources are freed by dpu_crtc_assign_plane_resources(),

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

