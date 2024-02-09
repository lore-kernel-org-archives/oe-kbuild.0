Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E2320311
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Feb 2024 10:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707475497; cv=none; b=pgAwB/klw9HPJdAd4WAeXhdTHoYqGro6OmLIIqRP0dcyAevy0TfhCWAIqiJsKqJ9zs7ngBpmN0UB6AfWjHh+dEOlfkyw2Uc7hcMEYzHw+xxYXlae/D7njlvmxBH76hNSpV92vTzwXxQsifl29SNPws2tocszhxQ/C7KieQ4dYdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707475497; c=relaxed/simple;
	bh=0qyI/gAu4ZJlfLwIOWsskUoL5PfJkS1ylp4Ng0x+uIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=rwa5OyvNcBPiqJlsDOtVRHVOCNtqA+GLJebw8IBGIYLEsy+4k8iA7CgD7VWVHvT0D7T0V7CNTbScMO1H6g4jZEPMmuXTpyS4XtJD9DIiO3UJPNL/qYWlPYHTxFS+Iq3L0YzlWABiVpyQwwxvt39K5UUlK5zEOlBcWHZj7VMNcPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GcjbcvJF; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GcjbcvJF"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a3bf9012637so40446366b.1
        for <oe-kbuild@lists.linux.dev>; Fri, 09 Feb 2024 02:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707475494; x=1708080294; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ufiK/AwoGBnph0IZzYo7gGHR9qgDp2zpSqPlnrqsLUg=;
        b=GcjbcvJFY7ZdUW9z17FSh5g/zRJFf788GXxqeLRWPUTB74dvdbDg5lNGDLHZLBztyX
         RZs8X/QQChZddUx1Q0u7YGqfP/jDPzToCqkyyi4Oc9f32RKp5LsozA/5G4YxFCwthprJ
         J8j8SyVXQ2QHueaJGqKT8MWAdj/Yfop3gosWbZkeuj8NW0mYlLxmvYs8Af2AnhmPw2C3
         jKnJvaSHVBoXBkK7OaVP+toV/Wd3DEYcm307MZvDWx/qidYCWAjaG8tGw2M3Ih5UEGUG
         uc7rvm9fYUnEq3jJC66ZqlWKRTIm0I12/7q0wxOlsQqQw1E8Jd+21CxRxfD4Kii0ZJ0G
         d9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707475494; x=1708080294;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufiK/AwoGBnph0IZzYo7gGHR9qgDp2zpSqPlnrqsLUg=;
        b=TVWkLDOH8152sfy2dOnBR3IjJr9ZRifKZ66/lDa7Pf5JkxjdWhKNZgi8H8D37H5EeU
         FkIS5Yg6ZIAPBHeG4Tu4fqWz5hE+WhysBOUoDo2b2ItDmdaFzyCQ682P42GjR74GMcyU
         TNn+Qsg7asKFNimaE0ZsV58CmSlu42BVAXeCC+cArhX/eBfDbuuCsM7D9a9WipHZZiHd
         k/r7KI4fBeBVa+QUYqLC0hsPxgnLFUUmXxU2H5wGE7nKPX57lA/BmI1EgDlZ04LdKvVM
         AhIG6AYuXDLe9gRt1QmNUQC/1Y01dXNx/KUGXG9keLx7yVXBO5EYfYp6ppWNpjT1B/Mq
         1j+Q==
X-Gm-Message-State: AOJu0YxXVvaWciQbWQ86Y1aVZtn3KXYJCiPUCQZFErsANGKBGGeJ1u9F
	T1zyR4heG41I1IIcB4XwvfwDi/a8JsUvuNE2LkHipwBG2uEx37x5bWqe2l0fF8mT8SYKGpLnPO2
	K
X-Google-Smtp-Source: AGHT+IHpwhLDqRapIlu66G2J3dMTMPNIHznYNeglqdg8ydW1switl8iLg14HH6Hb8NK/lWJs9J3NEw==
X-Received: by 2002:a17:906:ce32:b0:a38:9ff:571c with SMTP id sd18-20020a170906ce3200b00a3809ff571cmr826572ejb.9.1707475493711;
        Fri, 09 Feb 2024 02:44:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXxmx2xbvCtX9cdjQK7LWMARKC4KfxZaOTLJ1aOxw/b6X1nBR3D0/gcULbBz+tTFmUrigGigD57yCCNn8t1CB3Zo2TmGsUZp7iFsHHdnetrKztQCb6bVe4ZI4OE5KMmsJl7J7hXaqSx5lJlHQ5UJUJbSmo0ISFXrWjVJiAH6BKmOH0LAVC7j32IPan/0tlKpBJaiXQrrIT50QISg+8snRtDeNvo3pA8fSG09Lxp/tIb7K109IVl89ef0NZ0HBg2J5ZsmCi0nzWllNArK1NSMayVDmDmeFSIoErSKRjrDoOx3Kk5gtQlprjhtaScnRSYWJiw+ppsfEFZHLUwvf92hQAwNHF8RrmrHBzqUcOE+mRxM6aFEiSiONVg4ytuPhqaRfOP0g6YFuvbnwOMT4MxBkthE0sGZN+icCQb18k89kXNUOLCTxGJpf3WYG3ILO4sucvkKA9SCCI++4muNlMklW9oZSfd5+wc139jAy0qpa1MHhiBobBpx9zn/XeK7H83pfaHyW6JF3mguM6ZUjyiOOdUNfdxUNuYqMg1rtKoJsUpnTJANEX1bjI+Omu1vK/0cPkH+DgcC1qAIfN11K2Bq54pIIM6XY3Crcxs8SArFssDN9Bc8dvnfgFgNB4NqnWQP0ZKiNfJYfOuNdlG9M8w3L8=
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id gr1-20020a170906e2c100b00a311ab95fbdsm638306ejb.63.2024.02.09.02.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 02:44:53 -0800 (PST)
Date: Fri, 9 Feb 2024 13:44:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jagadeesh Kona <quic_jkona@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: Re: [PATCH 2/5] clk: qcom: videocc-sm8550: Add support for SM8650
 videocc
Message-ID: <63a0302d-8f36-4675-b390-75f546261c6e@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206113145.31096-3-quic_jkona@quicinc.com>

Hi Jagadeesh,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jagadeesh-Kona/dt-bindings-clock-qcom-Add-video-clock-bindings-for-SM8650/20240206-194148
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20240206113145.31096-3-quic_jkona%40quicinc.com
patch subject: [PATCH 2/5] clk: qcom: videocc-sm8550: Add support for SM8650 videocc
config: arm64-randconfig-r071-20240207 (https://download.01.org/0day-ci/archive/20240209/202402091804.SdrSLt10-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402091804.SdrSLt10-lkp@intel.com/

smatch warnings:
drivers/clk/qcom/videocc-sm8550.c:590 video_cc_sm8550_probe() error: uninitialized symbol 'offset'.

vim +/offset +590 drivers/clk/qcom/videocc-sm8550.c

f53153a37969c1 Jagadeesh Kona   2023-05-24  543  static int video_cc_sm8550_probe(struct platform_device *pdev)
f53153a37969c1 Jagadeesh Kona   2023-05-24  544  {
f53153a37969c1 Jagadeesh Kona   2023-05-24  545  	struct regmap *regmap;
f53153a37969c1 Jagadeesh Kona   2023-05-24  546  	int ret;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  547  	u32 offset;
f53153a37969c1 Jagadeesh Kona   2023-05-24  548  
f53153a37969c1 Jagadeesh Kona   2023-05-24  549  	ret = devm_pm_runtime_enable(&pdev->dev);
f53153a37969c1 Jagadeesh Kona   2023-05-24  550  	if (ret)
f53153a37969c1 Jagadeesh Kona   2023-05-24  551  		return ret;
f53153a37969c1 Jagadeesh Kona   2023-05-24  552  
f53153a37969c1 Jagadeesh Kona   2023-05-24  553  	ret = pm_runtime_resume_and_get(&pdev->dev);
f53153a37969c1 Jagadeesh Kona   2023-05-24  554  	if (ret)
f53153a37969c1 Jagadeesh Kona   2023-05-24  555  		return ret;
f53153a37969c1 Jagadeesh Kona   2023-05-24  556  
f53153a37969c1 Jagadeesh Kona   2023-05-24  557  	regmap = qcom_cc_map(pdev, &video_cc_sm8550_desc);
f53153a37969c1 Jagadeesh Kona   2023-05-24  558  	if (IS_ERR(regmap)) {
f53153a37969c1 Jagadeesh Kona   2023-05-24  559  		pm_runtime_put(&pdev->dev);
f53153a37969c1 Jagadeesh Kona   2023-05-24  560  		return PTR_ERR(regmap);
f53153a37969c1 Jagadeesh Kona   2023-05-24  561  	}
f53153a37969c1 Jagadeesh Kona   2023-05-24  562  
5ab3df7257a04f Jagadeesh Kona   2024-02-06  563  	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8550-videocc")) {
5ab3df7257a04f Jagadeesh Kona   2024-02-06  564  		video_cc_sm8550_clocks[VIDEO_CC_MVS0_SHIFT_CLK] = NULL;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  565  		video_cc_sm8550_clocks[VIDEO_CC_MVS0C_SHIFT_CLK] = NULL;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  566  		video_cc_sm8550_clocks[VIDEO_CC_MVS1_SHIFT_CLK] = NULL;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  567  		video_cc_sm8550_clocks[VIDEO_CC_MVS1C_SHIFT_CLK] = NULL;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  568  		video_cc_sm8550_clocks[VIDEO_CC_XO_CLK_SRC] = NULL;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  569  		offset = 0x8140;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  570  	} else  if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8650-videocc")) {
5ab3df7257a04f Jagadeesh Kona   2024-02-06  571  		video_cc_pll0_config.l = 0x1e;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  572  		video_cc_pll0_config.alpha = 0xa000;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  573  		video_cc_pll1_config.l = 0x2b;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  574  		video_cc_pll1_config.alpha = 0xc000;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  575  		video_cc_mvs0_clk_src.freq_tbl = ftbl_video_cc_mvs0_clk_src_sm8650;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  576  		video_cc_mvs1_clk_src.freq_tbl = ftbl_video_cc_mvs1_clk_src_sm8650;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  577  		offset = 0x8150;
5ab3df7257a04f Jagadeesh Kona   2024-02-06  578  	}

no else statement.

5ab3df7257a04f Jagadeesh Kona   2024-02-06  579  
a2620539ae2529 Dmitry Baryshkov 2023-10-16  580  	clk_lucid_ole_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
a2620539ae2529 Dmitry Baryshkov 2023-10-16  581  	clk_lucid_ole_pll_configure(&video_cc_pll1, regmap, &video_cc_pll1_config);
f53153a37969c1 Jagadeesh Kona   2023-05-24  582  
f53153a37969c1 Jagadeesh Kona   2023-05-24  583  	/*
f53153a37969c1 Jagadeesh Kona   2023-05-24  584  	 * Keep clocks always enabled:
f53153a37969c1 Jagadeesh Kona   2023-05-24  585  	 *	video_cc_ahb_clk
f53153a37969c1 Jagadeesh Kona   2023-05-24  586  	 *	video_cc_sleep_clk
f53153a37969c1 Jagadeesh Kona   2023-05-24  587  	 *	video_cc_xo_clk
f53153a37969c1 Jagadeesh Kona   2023-05-24  588  	 */
f53153a37969c1 Jagadeesh Kona   2023-05-24  589  	regmap_update_bits(regmap, 0x80f4, BIT(0), BIT(0));
5ab3df7257a04f Jagadeesh Kona   2024-02-06 @590  	regmap_update_bits(regmap, offset, BIT(0), BIT(0));
f53153a37969c1 Jagadeesh Kona   2023-05-24  591  	regmap_update_bits(regmap, 0x8124, BIT(0), BIT(0));
f53153a37969c1 Jagadeesh Kona   2023-05-24  592  
f53153a37969c1 Jagadeesh Kona   2023-05-24  593  	ret = qcom_cc_really_probe(pdev, &video_cc_sm8550_desc, regmap);
f53153a37969c1 Jagadeesh Kona   2023-05-24  594  
f53153a37969c1 Jagadeesh Kona   2023-05-24  595  	pm_runtime_put(&pdev->dev);
f53153a37969c1 Jagadeesh Kona   2023-05-24  596  
f53153a37969c1 Jagadeesh Kona   2023-05-24  597  	return ret;
f53153a37969c1 Jagadeesh Kona   2023-05-24  598  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

