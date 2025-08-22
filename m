Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFB521858D
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Aug 2025 17:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755883053; cv=none; b=uP9Tydfqx/9KeIneSgPhY44zLhmBcVXSmd4v1vU1t6I6kK9mccHU5HeK/Q5Q/Sjj/nyyV/xGXEG8cbSQnywd4JsLGsTgprQvE+hOiVuNo92GsQ0XH9k6kQDbPWmaERGjv1pcDzPjZDk0JEEzSAyB2ybU39Tw3Yen3wWmflx1/9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755883053; c=relaxed/simple;
	bh=5Udo/f8ent/K3o9ISDeOwIWa6pto6XFRhDz1qdZBK/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T9biFeCvk3YCGhB0I+VD7/h+31VT/j3L26kpOmoAPb6g+ZP/+rgBXy13WjCo6tPcs87UHn1IjAUx892gJyv3OSKoX6Yp1pBLmMIf4wcYDVGkaLjzZ+CkRFkc6JJhbBTYU3zqzIXxqIA3PPJfqB+aBOEElOJjjxBOa3oQDk837jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QvKBpqrx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QvKBpqrx"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b00a65fso11801695e9.0
        for <oe-kbuild@lists.linux.dev>; Fri, 22 Aug 2025 10:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755883049; x=1756487849; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nG60mJTcfDhZrN0Chr9ou2fiLnhkow+tZ1jRLbxcJ6I=;
        b=QvKBpqrxExOlTeP/hf1QNxq/OyJjoL7jBQNzpdQ8sLN8BGhl17rygW04b8F8p+6FKg
         9aBq4kZoQeaANxXEug+oBeE5BGkgWZE4PYtRgqQow7Au+QvJYVUjo3uIk8Oj05Rb7QV0
         cz46HGZE4r/jxpHKn1oFBVvzFd+hA8iuGB6qnFHsZcxcNzv6qq+PnUTlnWYpzX1goiER
         auc+49ct+6n8qcrOKt+pleQ5xYkdimi86f4vZjdGYvC3tNwGHDvZSb5SREkjznWWaRee
         m11vaBgP5gRbrAbmmUYdXwReAD/L17ku5ZQEp5TtI9CGIErH3j6nslxjPSFBJ1HXQfPq
         vDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755883049; x=1756487849;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nG60mJTcfDhZrN0Chr9ou2fiLnhkow+tZ1jRLbxcJ6I=;
        b=QVN3hip/xdgaBeXh6wlvKf/GcsGdMzis97n5MwuNF2PI/xjXAT48y3P1BVqTA4+LJJ
         L3AOq4+PIPtBFUG415OJ4I7lV4beVqs/LZ6Ro5MYOH5Yx4jVFfMvwgPCjArR1ZUEgFPU
         ngIiLj+Bj+g0JA5sn673Y7GCtObAkkesTFbfUWSetmuhAsClOYSDTrqbIdHeKlJWxOSE
         GXvEPC24Y4u+fMJxtWtqWtSQOl3+9cOwP1wRMkuxs56AoFPFJC+DrJyamIEZf4zjqo1y
         8ORobYLj4cXoyTq0WGXNLx96wkNnUJmax757YI6lFCd9yOf1HH47eEIrOGGHmqyZqzIn
         +IlQ==
X-Gm-Message-State: AOJu0YxPMth6QoAlNEjN02y/oM2u+r2JQlQf+DEU4XMr3csSdfEcuVuH
	S/3NDBxPKm1fCqtoHOjhawMLncUFzpKi4Bb9/Edkz+wPUSHWx4yup8ifa/rLgJAuhPobUT3JHwl
	UJcHO
X-Gm-Gg: ASbGncuCwToxcw7u+8RSppFuyUYIo2Pc8vtyR7/lObPPa0iwCHiQJNSO+GfVoeNUgpj
	kZNZhWEoB9JC+x1r6NWJPCn2iLTQCZAfAQryJadiBlJ+ARtlR6XeLmSoOBEkbKWBMdjd5+RhBUm
	yzj3s5U3RUGDRLYtyzDedLN5b6uzdyK/GmRiDUgRWtIFIsD8rjogXYM3KMp32LwePHls05Nd8In
	kl8SqCOUKZNiLuqN68LlUjfjC/ZXh8+w/TptqQN27psamaNhaVfyXqP1msRROaH2BL5jqaSgszP
	/hiYbnpyZOhGHBWxgQ6Fp2QuxiZIg0UvkhMMTqXmRuoldWaUxLQIFffBPJ+IBIwpGfVYKrSh3OA
	dgAyvDm3Gj8AfP64oLiSK7hxHZwk=
X-Google-Smtp-Source: AGHT+IE6I2k6xPHD429XkzRqTgiEYzD1yR/BB8fOScRUjLp3oce39ToFkb+CldfR2IO0M4Ry6HmIRg==
X-Received: by 2002:a05:600c:4fcb:b0:458:bc58:850c with SMTP id 5b1f17b1804b1-45b5179f436mr29795645e9.1.1755883049157;
        Fri, 22 Aug 2025 10:17:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c7117d5977sm207666f8f.51.2025.08.22.10.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:17:28 -0700 (PDT)
Date: Fri, 22 Aug 2025 20:17:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Rob Clark <robdclark@chromium.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Antonino Maniscalco <antomani103@gmail.com>
Subject: drivers/gpu/drm/msm/msm_iommu.c:778 msm_iommu_gpu_new() error: we
 previously assumed 'adreno_smmu' could be null (see line 767)
Message-ID: <202508230010.dMoERmOs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250822171725.D_xP4dPbChpBc1Lk-EEID-jJ82ssG82z4LTul6EDz1o@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cf6fc5eefc5bbbbff92a085039ff74cdbd065c29
commit: e601ea31d66ba83d565cae9cfa45cbbcdd8286dd drm/msm: Support pgtable preallocation
config: arm64-randconfig-r071-20250822 (https://download.01.org/0day-ci/archive/20250823/202508230010.dMoERmOs-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508230010.dMoERmOs-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/msm_iommu.c:778 msm_iommu_gpu_new() error: we previously assumed 'adreno_smmu' could be null (see line 767)

vim +/adreno_smmu +778 drivers/gpu/drm/msm/msm_iommu.c

8cceb773f565f3 Dmitry Baryshkov 2023-02-14  756  struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks)
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  757  {
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  758  	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(dev);
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  759  	struct msm_iommu *iommu;
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  760  	struct msm_mmu *mmu;
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  761  
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  762  	mmu = msm_iommu_new(dev, quirks);
db40d2928d245f Luca Weiss       2023-05-08  763  	if (IS_ERR_OR_NULL(mmu))
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  764  		return mmu;
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  765  
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  766  	iommu = to_msm_iommu(mmu);
e601ea31d66ba8 Rob Clark        2025-06-29 @767  	if (adreno_smmu && adreno_smmu->cookie) {
                                                            ^^^^^^^^^^^
Check for NULL.  Hopefully this can be removed.

e601ea31d66ba8 Rob Clark        2025-06-29  768  		const struct io_pgtable_cfg *cfg =
e601ea31d66ba8 Rob Clark        2025-06-29  769  			adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
e601ea31d66ba8 Rob Clark        2025-06-29  770  		size_t tblsz = get_tblsz(cfg);
e601ea31d66ba8 Rob Clark        2025-06-29  771  
e601ea31d66ba8 Rob Clark        2025-06-29  772  		iommu->pt_cache =
e601ea31d66ba8 Rob Clark        2025-06-29  773  			kmem_cache_create("msm-mmu-pt", tblsz, tblsz, 0, NULL);
e601ea31d66ba8 Rob Clark        2025-06-29  774  	}
f66f3cf6bc42ab Abhinav Kumar    2025-02-19  775  	iommu_set_fault_handler(iommu->domain, msm_gpu_fault_handler, iommu);
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  776  
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  777  	/* Enable stall on iommu fault: */
8cceb773f565f3 Dmitry Baryshkov 2023-02-14 @778  	if (adreno_smmu->set_stall)
                                                            ^^^^^^^^^^^^^^^^^^^^^^
Because otherwise we are toasted.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

