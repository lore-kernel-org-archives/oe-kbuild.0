Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8D720B12
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Feb 2024 07:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708328096; cv=none; b=O95H6fSG6W+oYSdeKbSArawA4zLzJFLgOmbCLMH3OLYQWVEiPKUCSqp41IZ3IjvM45AvrMVvA0/FtvStMhmB4Kqwthn8rf9kRJecLwwzhT4nfNOMcTgGfhqIRjfaQYluQrd6M1BjNXVIXF/J0rzzXV+8LlMqopq1xWI9h3OAdwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708328096; c=relaxed/simple;
	bh=8U1HYbjZZj6cqQK95wGWHdtU5IbPdDTCkmANPn9BW0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=LSVAE5jUwJVu18iLRjCWc5ThTwpeNRCCmY8jFTI6E1Pjwt0IQZeTVblg9u4awb2BigJA2fosUUo4YNqVnZqUtVpPCYmlw1MR1FEL7WWXrf74hXjxofEp7IgXx5U3Nxe2JkW9bLSj/oPy/Du2TU6OV+lj+t+BmlCx22W555ACaJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pKIuwPxM; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pKIuwPxM"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a3eb1f48fa9so36108866b.1
        for <oe-kbuild@lists.linux.dev>; Sun, 18 Feb 2024 23:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708328093; x=1708932893; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yZdPEIb35UuoFivHycym2ongSZton05QwV9BQzdhVvs=;
        b=pKIuwPxMrirjQYO+jzmTEiKV5J42zPBQzr7BngmN8fOUnM/pw6zEnQjdE4ZDeJuRw/
         sH1E4ToLOdbgwlkkh8lrOZOEKGYYc+iLhoFwHxLqTs5f4n9nj2Oh54iwcn4KI+s+nr6l
         SXkMdVEzcM9/5Cdn+GZQQcPCyVsIQvbNGBV4RKZ+/7BrSR1JUwZ8T+RJ8mEpBc0L6Ott
         ivwfJhjM6qDhE8YohwwmczSBa7lGpWyE8pM1UZ3HMCpyohn+vQl/l/i552lE56+PKejt
         AoTi+gjzETMDR6fgsHayDV9pOs4xdm8sulYzN+b25K1Jwt9irGgNxFk/pJ2nVmKwjrQg
         ienw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708328093; x=1708932893;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZdPEIb35UuoFivHycym2ongSZton05QwV9BQzdhVvs=;
        b=L7NdQu1v8iMhystmh5MgE2kcgRcPJpEXSvYXquQI9vwC1YqjPlfUPtypvw+oHOGvIM
         zJbuJj2wuctibpliKzWZDR6xlfSm1O0qFekmA+aaBZLNWksohCA/ZBfko+CS7uo1QQZp
         MY848VKoUtBlAq0EhG6PyU056FBO8ZvZKdkGQcaAZSWi1a0odEcVJ2UxYnXn9VGZlfk6
         VWMvK9MftJ3+i7/BU97QbyZN9wjzdXmrDhJi6Po90Kw7gB0iq4v6riQOPzEIn8zzz5/w
         HCUVm/XpGW+5kgmYDUQztt0jn4MyzDLNwsMEJO0ihkTDGdAl99o/9embOw9Zvf3oLOOT
         jFtg==
X-Gm-Message-State: AOJu0YysadFe0Fekbl78hR4wCbUvA0i57VZ/+PO9GDoXR6KTUrdnc0TO
	Vgo4pEJZdYYWgAwsdLT1Fd3+24NhRwPxGq05HdXGQrEP7qtFi7WCXNgi3s879vo+8OL/89W2m12
	P
X-Google-Smtp-Source: AGHT+IGZe0dPY4IFHv5xvW55FAa6Fo25SafsKR/YJek9/gS2eBa0lk4mV/4J9jO0qFSs4PAJEQMjMA==
X-Received: by 2002:a17:906:3b94:b0:a3d:26b2:94f4 with SMTP id u20-20020a1709063b9400b00a3d26b294f4mr8043246ejf.73.1708328093072;
        Sun, 18 Feb 2024 23:34:53 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u13-20020a1709063b8d00b00a3c7fb8cc74sm2644221ejf.154.2024.02.18.23.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 23:34:52 -0800 (PST)
Date: Mon, 19 Feb 2024 10:34:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Uma Shankar <uma.shankar@intel.com>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
	contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
	jadahl@redhat.com, sebastian.wick@redhat.com,
	shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
	mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com,
	victoria@system76.com, daniel@ffwll.ch, quic_naseer@quicinc.com,
	quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
	arthurgrillo@riseup.net, marcan@marcan.st, Liviu.Dudau@arm.com,
	sashamcintosh@google.com, sean@poorly.run,
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Uma Shankar <uma.shankar@intel.com>
Subject: Re: [PATCH 16/28] drm/i915/color: Create a transfer function color
 pipeline
Message-ID: <103c8a84-3423-45cf-8592-6e47ef2700d6@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213064835.139464-17-uma.shankar@intel.com>

Hi Uma,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-color-pipeline-base-work/20240213-144544
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240213064835.139464-17-uma.shankar%40intel.com
patch subject: [PATCH 16/28] drm/i915/color: Create a transfer function color pipeline
config: i386-randconfig-141-20240217 (https://download.01.org/0day-ci/archive/20240218/202402180310.gMdIXaJx-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402180310.gMdIXaJx-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/display/intel_color.c:3867 intel_plane_tf_pipeline_init() error: 'colorop' dereferencing possible ERR_PTR()

vim +/colorop +3867 drivers/gpu/drm/i915/display/intel_color.c

5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3852  int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_list *list)
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3853  {
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3854  	struct intel_plane *intel_plane = to_intel_plane(plane);
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3855  	struct intel_plane_colorop *colorop;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3856  	struct drm_device *dev = plane->dev;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3857  	struct drm_i915_private *i915 = to_i915(dev);
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3858  	int ret;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3859  	struct drm_colorop *prev_op;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3860  
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3861  	colorop = intel_plane_colorop_create(CB_PLANE_PRE_CSC_LUT);

No error checking

5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3862  
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3863  	ret = drm_colorop_init(dev, &colorop->base, plane, DRM_COLOROP_1D_LUT);
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3864  	if (ret)
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3865  		return ret;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3866  
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13 @3867  	list->type = colorop->base.base.id;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3868  	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", colorop->base.base.id);
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3869  
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3870  	/* TODO: handle failures and clean up*/
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3871  	prev_op = &colorop->base;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

