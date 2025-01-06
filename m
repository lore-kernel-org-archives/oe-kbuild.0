Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DAB17C210
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 09:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736156927; cv=none; b=az0lM/k18NZ2oOCdllW9SxabQBt3mb0/hcsGFPydULWffUKlyfaIwQLHs8mYCcjRSmGBsPQP8q81ZwsCosn/zsW9JofrLQ7pMY1yZDCfhzB4uohw6Dqf8logvE1uodpSQ77onuiSxXJyPrZAko458ssSAo94AFMFVYD801CIIuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736156927; c=relaxed/simple;
	bh=APYCS3DTa/e0jkN5JGTvJUWOvo8IXYDxlrsuDrv0AxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=JQssyZ5qtJLt8kV/N+9IIOzfSfHjpM0zxVEpAQ9wdOgWtoYC9S+lBA7P4wzHgGLg5HaKVIAdTQdLA0qIvGqrnvKjSEyaKfja4lC4g2d7CMAAKHrvZoP2mCfaSwQIqSI+9E8PsDQjimcehoN6FJ8RQUIBovHc6AvfI/BIHQcNI8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kwbt9BDH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kwbt9BDH"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436a39e4891so45696815e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Jan 2025 01:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736156923; x=1736761723; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U7DUxAhSibqlywitnIsaO/xKBm773Tj0vayibwmG2Eo=;
        b=Kwbt9BDHYiPHj/KFgyGyfRFU5S1UA5K3b175o34D59l1Icj9iH3oGByyy/qJtN+Syi
         ZzNhSsGqmpg18Rgf7tQqtBA2h8SNl8LDUVP8Xl7u+8UQX4LqJRxBk7UvZNw+Wo+BI9oN
         J8WLvB9icbwf3aArcTQNiGve8NhFRzANULChq2l6GxhD+hEPugldpMt8AAkld9XtxTNi
         h0z4Cj85IUkfWU9XT6T2vk7GiypQHRtSABBJm4KK0/dDf4Q+8+bfBi/D+AfO4ZtUGEiR
         woUc2MEsNiclMkTcvDH6MwxbeUeNqqSNVljfTIpRCy/3tUUYN3NjAGyn3GeJbQBR0kh6
         Rnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736156923; x=1736761723;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7DUxAhSibqlywitnIsaO/xKBm773Tj0vayibwmG2Eo=;
        b=Dgm7/1AkuvHpc0HUvI4uwNC3leY/tsl2Ic2t6WbAFgk5TOeh7DLjdALGBkQX53mKxQ
         I7pD+ONSMUgptoTjfn/cLf2zQsIrfZmWiAs5qjrc3CsifHjKs3TeOd9Vk44FLzLFNdOa
         G9ysprhHeKtbo5P6DJ6B/yVCycIPegpZIE/dY7mZzQOCFjrj1amL/qbaVg2qEdojbdAm
         pVcxYDSqPAfZOyfJAcTR9erRNXVq7AzOCCDCrCsXWUJURheXwU6tYNLc+jjBXPD+qhzR
         16/bYBEp0JRNe9mN3sabbUoEcvHQFRJ45SWWDqfS1FbRz5JrDiGZk/kJBM7S2ACuDoHV
         6z9Q==
X-Gm-Message-State: AOJu0YyOGA7L2Mu23wolbkv9JwcZq8xvb1TANqBfEqsWl8A5dpKLWP71
	y521Z0QfdjMpznhLLivPE2ryCGfbSPb7tsu70kNb8LAb8joWx4sFACNVy40Sk0WrTYaRa1yCa3n
	r
X-Gm-Gg: ASbGncurajjFKVKybKR/vSBhFeZnvcD1x0DTf+/eX1krZB4xAfwztf7fkIY8s1veYPU
	hWvwyMTLMAD9vogCPrpTKrZDMSA6KvXjzSEWtuuddGBVIGhI20Dwz5O6O3npSLSAwWQAMLjZsFj
	40fgaE/Qxo2sobsAqMPfUes2u/EzYQwULv4PchdCwzq8B4VIeTdNz+FpbTwYr46kFzY5CU/gg+G
	0afJKMyn/fpCtqSpB1Xg76YJjCNrXSAjQwJ/Np7SGrpB0ihftaMkpxqac+ZVQ==
X-Google-Smtp-Source: AGHT+IGh8Fp20Zq7XtaVm6KGcGqlEafo7OexWSrsYD9e1SunnlLmTNIbsGBKyA1oWnjMCpGHujCl/g==
X-Received: by 2002:a05:600c:1c1a:b0:434:eb73:b0c0 with SMTP id 5b1f17b1804b1-43668548301mr470618275e9.5.1736156923467;
        Mon, 06 Jan 2025 01:48:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e1c0sm48271951f8f.77.2025.01.06.01.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:48:43 -0800 (PST)
Date: Mon, 6 Jan 2025 12:48:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/5] drm/msm: register a fault handler for display mmu
 faults
Message-ID: <e0846cd2-c03f-44a8-9f0b-6d78b241f093@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217-abhinavk-smmu-fault-handler-v2-1-451377666cad@quicinc.com>

Hi Jessica,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Jessica-Zhang/drm-msm-register-a-fault-handler-for-display-mmu-faults/20241218-082950
base:   86313a9cd152330c634b25d826a281c6a002eb77
patch link:    https://lore.kernel.org/r/20241217-abhinavk-smmu-fault-handler-v2-1-451377666cad%40quicinc.com
patch subject: [PATCH v2 1/5] drm/msm: register a fault handler for display mmu faults
config: powerpc-randconfig-r072-20241223 (https://download.01.org/0day-ci/archive/20241223/202412232320.jOVlNH6W-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412232320.jOVlNH6W-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/msm_kms.c:211 msm_kms_init_aspace() error: 'aspace' dereferencing possible ERR_PTR()

vim +/aspace +211 drivers/gpu/drm/msm/msm_kms.c

506efcba31296e Dmitry Baryshkov 2023-10-09  176  struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
506efcba31296e Dmitry Baryshkov 2023-10-09  177  {
506efcba31296e Dmitry Baryshkov 2023-10-09  178  	struct msm_gem_address_space *aspace;
506efcba31296e Dmitry Baryshkov 2023-10-09  179  	struct msm_mmu *mmu;
506efcba31296e Dmitry Baryshkov 2023-10-09  180  	struct device *mdp_dev = dev->dev;
506efcba31296e Dmitry Baryshkov 2023-10-09  181  	struct device *mdss_dev = mdp_dev->parent;
0752a7416c0b8f Abhinav Kumar    2024-12-17  182  	struct msm_drm_private *priv = dev->dev_private;
0752a7416c0b8f Abhinav Kumar    2024-12-17  183  	struct msm_kms *kms = priv->kms;
506efcba31296e Dmitry Baryshkov 2023-10-09  184  	struct device *iommu_dev;
506efcba31296e Dmitry Baryshkov 2023-10-09  185  
506efcba31296e Dmitry Baryshkov 2023-10-09  186  	/*
506efcba31296e Dmitry Baryshkov 2023-10-09  187  	 * IOMMUs can be a part of MDSS device tree binding, or the
506efcba31296e Dmitry Baryshkov 2023-10-09  188  	 * MDP/DPU device.
506efcba31296e Dmitry Baryshkov 2023-10-09  189  	 */
506efcba31296e Dmitry Baryshkov 2023-10-09  190  	if (device_iommu_mapped(mdp_dev))
506efcba31296e Dmitry Baryshkov 2023-10-09  191  		iommu_dev = mdp_dev;
506efcba31296e Dmitry Baryshkov 2023-10-09  192  	else
506efcba31296e Dmitry Baryshkov 2023-10-09  193  		iommu_dev = mdss_dev;
506efcba31296e Dmitry Baryshkov 2023-10-09  194  
506efcba31296e Dmitry Baryshkov 2023-10-09  195  	mmu = msm_iommu_new(iommu_dev, 0);
506efcba31296e Dmitry Baryshkov 2023-10-09  196  	if (IS_ERR(mmu))
506efcba31296e Dmitry Baryshkov 2023-10-09  197  		return ERR_CAST(mmu);
506efcba31296e Dmitry Baryshkov 2023-10-09  198  
506efcba31296e Dmitry Baryshkov 2023-10-09  199  	if (!mmu) {
506efcba31296e Dmitry Baryshkov 2023-10-09  200  		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
506efcba31296e Dmitry Baryshkov 2023-10-09  201  		return NULL;
506efcba31296e Dmitry Baryshkov 2023-10-09  202  	}
506efcba31296e Dmitry Baryshkov 2023-10-09  203  
506efcba31296e Dmitry Baryshkov 2023-10-09  204  	aspace = msm_gem_address_space_create(mmu, "mdp_kms",
506efcba31296e Dmitry Baryshkov 2023-10-09  205  		0x1000, 0x100000000 - 0x1000);
506efcba31296e Dmitry Baryshkov 2023-10-09  206  	if (IS_ERR(aspace)) {
506efcba31296e Dmitry Baryshkov 2023-10-09  207  		dev_err(mdp_dev, "aspace create, error %pe\n", aspace);
506efcba31296e Dmitry Baryshkov 2023-10-09  208  		mmu->funcs->destroy(mmu);

This should return aspace;

506efcba31296e Dmitry Baryshkov 2023-10-09  209  	}
506efcba31296e Dmitry Baryshkov 2023-10-09  210  
0752a7416c0b8f Abhinav Kumar    2024-12-17 @211  	msm_mmu_set_fault_handler(aspace->mmu, kms, msm_kms_fault_handler);
                                                                                  ^^^^^^^^^^^
Crash.

0752a7416c0b8f Abhinav Kumar    2024-12-17  212  
506efcba31296e Dmitry Baryshkov 2023-10-09  213  	return aspace;
506efcba31296e Dmitry Baryshkov 2023-10-09  214  }
506efcba31296e Dmitry Baryshkov 2023-10-09  215  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

