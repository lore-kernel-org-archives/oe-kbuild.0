Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505C23191AC
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 18:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766601460; cv=none; b=ZFmpy9Luqcwm/5jt0Jl5eTXVT2+qcDMlyAJu7O7v0vMRMf19p9vgaJ5uk/NnPKlt6ebBkFdjtjuDLrEzubAQ6lBk9ErUV1q2bxSjO2tXPZKZAj7nlbGHUw0iUA8y04KBFvwiM5Pq8x72JeFEcZKW1AmTGZHkkH5KcC0iQi5Bcuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766601460; c=relaxed/simple;
	bh=3a1nU1pDZdH5UKeeSBIYLG/JYuREQZMehqNquOcv1qY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h7YLmnZHCNb+X77BjBfMn1fEx/pbK5cZ1IH1acYCELbwThq5pUMNc6GBGnTVPe2ClAImS1S2k9k1vr2x+vzm0EAu2243UQcQIrsNeDzYDrZKRtCQSz89bmDjqZiHyBzyJUDOPU4rhoMHWhciZPPXqoTiR+iRD+EAdlN1+OYSGlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jdl1Edff; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wg2zJBFx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jdl1Edff";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wg2zJBFx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOC4jAZ913434
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 18:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y34wwlrYh726wMd2mYCDWV2ZBneD9Frc61QlZxGENNI=; b=Jdl1EdfffUalQIQx
	lvtQyk+ysJKgNCESTusnnmUNson8V037TFJIB5vuCkevCG69oT8cpIYrQU4Njc0v
	FETD0IzHVKn3HckU43+pKXS9wQioLOJjEOfOyhJh+RAgKEMNsYVQA2XvAmrcam1w
	ADlx6yiOZBXK1NHieUIgN5fiT7p6gDzvJUWJhTyO+p1iEqntP5QreSaIBI1zD/Ko
	4Gg+Z0wsqzcJ1B8kioB3AN3UI1MmUkcXwPot3FTHaVVbE727qrkTwBO+Ws/7qZLS
	jYqKjsQhCg8jh+Q6gRmfOziZ38M4BtQZihEXdb6QTaKVcilZj9wlcjBG1sxHglR1
	GoJctQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2kx55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 18:37:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0d59f0198so81798545ad.1
        for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 10:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766601456; x=1767206256; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y34wwlrYh726wMd2mYCDWV2ZBneD9Frc61QlZxGENNI=;
        b=Wg2zJBFxBCAPpDfoVmNwaNuWF5gzJZQd9y+Icgo/8UXAm4Skjy+0EMN5S8wEcPXiGU
         HmSb4VPwiHnVcoued9GmIOwdclEKCbe1G/5SsQ7aITls2NlqnzBIL+PS74ijeyhQnHBd
         tzBm9jKnTkgd3ujm+WNsMRn4yEkcvKTryJxIU5tlF9Sssq8afLHnUSrdreH282t5qOq8
         oE8F7osksTHCVi6NQQRVAoy6k0SVSEz8BF9tKc3wRVJD8NpnPRlZoY0KNGis4FKSy8AD
         mKYovcABAUYASDWWEvkpt+ksjAj952BbZfSzbZpXSuo5oYLAAdwTAyl0CGM5uwgxmbeg
         6+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766601456; x=1767206256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y34wwlrYh726wMd2mYCDWV2ZBneD9Frc61QlZxGENNI=;
        b=iS2/LCeuKdHRb7/DwrkeAn1tCHJZpqZGxXoeh7e19GYxqSh1PmTPqQrPN89Mp7gQ2u
         jsbUeU9WyQkYsF+EP8R/RPtzdOZF4xClLbcX/PsTa9EiL+QSV7blm/TZR3s2Zr83eMuk
         4Yy1utDg8wDkkOlvOSr7jayOFFulEgVgD99IaTPQGtlHoaxbHjijtJ21MJxxeQ8j1rUs
         EOp5Dv5isAW+5bIYo45R4JSFLxPGyySUy9wB/TaxcniZukxCxwIGP/NHNMgkbS1ODgCz
         N0OUg8swUhLQr+qPvurrFvea8Qg+hTR/DkOohB1/2hKUTF5Hi2+Sk/awqdjpcHCL6QEg
         tfzw==
X-Forwarded-Encrypted: i=1; AJvYcCUxyi38LxGPX2NgGnfnAfXBtXKBtyVDsTww55FKLE/xXXSjKSmbMuyP8tMMvwLFK4TLR/2Un9aPGr4=@lists.linux.dev
X-Gm-Message-State: AOJu0YybhDlmMW0QCuvmciH86uM3Qbxq2qP2NdqUheZs0KvO3/JQ1z/x
	SJFqgA+nNcZj0Mduc6srEDHfzSC81qxBZKE1uhDJfWAgohuibUIIPbTJjictO/CUMzq0ImR5jvr
	svzi3cEYH1NRv8JcXAerZfxokshb7BkevW23lBkbtJgiYlb/wthB0fVdwFwjN4Cg=
X-Gm-Gg: AY/fxX47DQmDcdVYR8t2N61m3oWgXThmXH4nYqf4/JHMD8pCrEIYnHykMGm5FIM7/jl
	E2AysrKm9P1YizIHKQwhm6yaQpy8CZhM/LvUiPfMR+zKsDVHLMijOsEgK39/v/uMWWy+F6GbEzG
	zLqv+frRerN8HnQ36wdKkgParuLq5DOhnQsKs8MmBDj3qiz2aVs1i6j/19NAOcr3JETEOZLpl3d
	FyYV+4iA9mgtaYdw6kALVzPy0QkOsDuo4z2H92uBHzkf6Ymz4l1lgm5jPZ4DM0khoo+MJSBEcgH
	VdcdeTQ7fTRrjDQUvLOS48oG210sI/ToO/8Og5TGVtYdhBm6/LUG3DWnPE7iML0ZY/lppkqsBy0
	YkrH1/gTJ++LB/4nIs6HbgVFwf0WE7q2r
X-Received: by 2002:a17:903:298b:b0:2a1:5f23:7ddf with SMTP id d9443c01a7336-2a2f2202fb9mr199041345ad.6.1766601455734;
        Wed, 24 Dec 2025 10:37:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGaRD3iCAFBOKZhjUWb1qixEJsP8I5iul70uv+L8iFWWkMW2k5LCRgJ/BBBBxC2AXYDqSCu4A==
X-Received: by 2002:a17:903:298b:b0:2a1:5f23:7ddf with SMTP id d9443c01a7336-2a2f2202fb9mr199041155ad.6.1766601455214;
        Wed, 24 Dec 2025 10:37:35 -0800 (PST)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d428sm161338815ad.73.2025.12.24.10.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 10:37:34 -0800 (PST)
Message-ID: <ca0bebc1-849e-47a9-8a75-9fe7ba0064f2@oss.qualcomm.com>
Date: Thu, 25 Dec 2025 00:07:31 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/gpu/drm/msm/adreno/a2xx_gpu.c:503 a2xx_gpu_init() warn:
 variable dereferenced before check 'pdev' (see line 500)
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>
References: <202512082235.2rH8XoPX-lkp@intel.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <202512082235.2rH8XoPX-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDE2NSBTYWx0ZWRfX3A5iISA+gAib
 VINRqVE24uYSUs8XR/YHt5Rbk8Rd93cDJlEcAfl2o0ozhjKsJIhSZHWBTwi4fNeXx9xOhSIYP5r
 uFIvZURy8B8nnhoPE6ruIcj1ES3xCu7I2txj2gZ8Iz40ZnSQra8c50W5aUcEQSTJoMWkuo4e/nJ
 0PQS5Ujrf6AFESwEt5jtjGM3M+sUKOEebkzIfNBh1f9aPG4kgiiBPOeGqVQ2kX9lHZqGJrCYpM7
 iey4kvbXBDLaJcC8rHHZ90m5uEGbUkNU3/pRby+LF2fwuHO1Z3ehT7rE7B+3aqpLLv6w/mjJCIQ
 LdyTgEYHGcfcbSRvAdKgZt4Y+yxqwmqQtWZoFc47m/HO2vUlPgeqwtx7N/VRre9cCpHd04hKSb6
 27/aZiZc1p+bLGLJP+o4j8Awi/44TsegfzGLZ69aiT2Yxkgwgwx+6G1vMfH0UCVT/YF2WBtMRsz
 +W8jjs8JXoRb7BW96vg==
X-Proofpoint-GUID: _kDGPGpLOL56tIIskt6dzBEEcIss7kNJ
X-Proofpoint-ORIG-GUID: _kDGPGpLOL56tIIskt6dzBEEcIss7kNJ
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694c32f1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8
 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8 a=q4Z2K2Yn1fhMbv9_qXoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=mmqRlSCDY2ywfjPLJ4af:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240165

On 12/9/2025 1:40 PM, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   c2f2b01b74be8b40a2173372bcd770723f87e7b2
> commit: 491fadb2b818e1d900229a1f8243de6458381306 drm/msm/adreno: Move adreno_gpu_func to catalogue
> config: arm64-randconfig-r072-20251207 (https://download.01.org/0day-ci/archive/20251208/202512082235.2rH8XoPX-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202512082235.2rH8XoPX-lkp@intel.com/
> 
> smatch warnings:
> drivers/gpu/drm/msm/adreno/a2xx_gpu.c:503 a2xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 500)
> drivers/gpu/drm/msm/adreno/a3xx_gpu.c:530 a3xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 525)
> drivers/gpu/drm/msm/adreno/a4xx_gpu.c:642 a4xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 637)
> 
> vim +/pdev +503 drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> 
> 491fadb2b818e1 Akhil P Oommen 2025-11-18  493  static struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
> 21af872cd8c695 Jonathan Marek 2018-11-21  494  {
> 21af872cd8c695 Jonathan Marek 2018-11-21  495  	struct a2xx_gpu *a2xx_gpu = NULL;
> 21af872cd8c695 Jonathan Marek 2018-11-21  496  	struct adreno_gpu *adreno_gpu;
> 21af872cd8c695 Jonathan Marek 2018-11-21  497  	struct msm_gpu *gpu;
> 21af872cd8c695 Jonathan Marek 2018-11-21  498  	struct msm_drm_private *priv = dev->dev_private;
> 21af872cd8c695 Jonathan Marek 2018-11-21  499  	struct platform_device *pdev = priv->gpu_pdev;
> 491fadb2b818e1 Akhil P Oommen 2025-11-18 @500  	struct adreno_platform_config *config = pdev->dev.platform_data;
>                                                                                         ^^^^^^^^^
> Patch adds a dereference.
> 
> 21af872cd8c695 Jonathan Marek 2018-11-21  501  	int ret;
> 21af872cd8c695 Jonathan Marek 2018-11-21  502  
> 21af872cd8c695 Jonathan Marek 2018-11-21 @503  	if (!pdev) {
> 
> but the old code checked for NULL.  Probably this NULL check can be
> removed?

Yes, we can remove this unnecessary check. I will send a patch. Thanks.

-Akhil.

> 
> 21af872cd8c695 Jonathan Marek 2018-11-21  504  		dev_err(dev->dev, "no a2xx device\n");
> 21af872cd8c695 Jonathan Marek 2018-11-21  505  		ret = -ENXIO;
> 21af872cd8c695 Jonathan Marek 2018-11-21  506  		goto fail;
> 21af872cd8c695 Jonathan Marek 2018-11-21  507  	}
> 21af872cd8c695 Jonathan Marek 2018-11-21  508  
> 21af872cd8c695 Jonathan Marek 2018-11-21  509  	a2xx_gpu = kzalloc(sizeof(*a2xx_gpu), GFP_KERNEL);
> 21af872cd8c695 Jonathan Marek 2018-11-21  510  	if (!a2xx_gpu) {
> 21af872cd8c695 Jonathan Marek 2018-11-21  511  		ret = -ENOMEM;
> 21af872cd8c695 Jonathan Marek 2018-11-21  512  		goto fail;
> 21af872cd8c695 Jonathan Marek 2018-11-21  513  	}
> 21af872cd8c695 Jonathan Marek 2018-11-21  514  
> 21af872cd8c695 Jonathan Marek 2018-11-21  515  	adreno_gpu = &a2xx_gpu->base;
> 21af872cd8c695 Jonathan Marek 2018-11-21  516  	gpu = &adreno_gpu->base;
> 21af872cd8c695 Jonathan Marek 2018-11-21  517  
> 21af872cd8c695 Jonathan Marek 2018-11-21  518  	gpu->perfcntrs = perfcntrs;
> 21af872cd8c695 Jonathan Marek 2018-11-21  519  	gpu->num_perfcntrs = ARRAY_SIZE(perfcntrs);
> 21af872cd8c695 Jonathan Marek 2018-11-21  520  
> 491fadb2b818e1 Akhil P Oommen 2025-11-18  521  	ret = adreno_gpu_init(dev, pdev, adreno_gpu, config->info->funcs, 1);
> db07ce5da8b26b Fabio Estevam  2023-06-20  522  	if (ret)
> db07ce5da8b26b Fabio Estevam  2023-06-20  523  		goto fail;
> db07ce5da8b26b Fabio Estevam  2023-06-20  524  
> 21af872cd8c695 Jonathan Marek 2018-11-21  525  	if (adreno_is_a20x(adreno_gpu))
> 21af872cd8c695 Jonathan Marek 2018-11-21  526  		adreno_gpu->registers = a200_registers;
> 21af872cd8c695 Jonathan Marek 2018-11-21  527  	else if (adreno_is_a225(adreno_gpu))
> 21af872cd8c695 Jonathan Marek 2018-11-21  528  		adreno_gpu->registers = a225_registers;
> 21af872cd8c695 Jonathan Marek 2018-11-21  529  	else
> 21af872cd8c695 Jonathan Marek 2018-11-21  530  		adreno_gpu->registers = a220_registers;
> 21af872cd8c695 Jonathan Marek 2018-11-21  531  
> 21af872cd8c695 Jonathan Marek 2018-11-21  532  	return gpu;
> 21af872cd8c695 Jonathan Marek 2018-11-21  533  
> 21af872cd8c695 Jonathan Marek 2018-11-21  534  fail:
> 21af872cd8c695 Jonathan Marek 2018-11-21  535  	if (a2xx_gpu)
> 21af872cd8c695 Jonathan Marek 2018-11-21  536  		a2xx_destroy(&a2xx_gpu->base.base);
> 21af872cd8c695 Jonathan Marek 2018-11-21  537  
> 21af872cd8c695 Jonathan Marek 2018-11-21  538  	return ERR_PTR(ret);
> 21af872cd8c695 Jonathan Marek 2018-11-21  539  }
> 

