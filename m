Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6605C1F76D5
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jan 2025 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737103102; cv=none; b=eOsW/gsf45qpDeHF1o6dOaQptxshi1vufzJIQszy6SCKLaaG/6iMojGqtgq7yvOg9beRpFV4gaJqYLGjlTWzhWx/xinL7lBzVe4JqFlMwHkk5ZazKhl7a/2/5f+IQFw4etY37EyVZ2FCaP7yGY0zenvul7QIJIbqRLJrwQoZGOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737103102; c=relaxed/simple;
	bh=19P4Hj9YhkT6c0EHEEHAIF/fjR1sMNve39J/njt5RgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=nsijcDxJRGJdurdTvjz6Mydf5+gduAHDoBmxYFtgJlm7qrcpImAA3WLhbGk2X1f3IJ0dqLRz9aiHqh+f9i5wLeAkuQvnecl2LrxbjA/pVgvcYUC/ENgAaxuhOKb5aI5FT79v8vjTVSjjylwUg/33MhXlCh2NzfrvEtotb+o0cYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yn9Y+jB3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yn9Y+jB3"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so11732145e9.1
        for <oe-kbuild@lists.linux.dev>; Fri, 17 Jan 2025 00:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737103098; x=1737707898; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eJ1ei5cf4bIYP2dhBSNsW7gRWvtxXhyGMsyM2uckNOk=;
        b=Yn9Y+jB3jiL+J1CKQSOP/nqT9QxTXeFtYOkOvPpcScW9/2wdWoOxaW5CvXA5IlrBfl
         jU2IfCdJmYp/9Vvf9hl4wLp35JLHhX0byOckqPP4Wb2rS95O1GJn58TW8l79EIQJeqPB
         oRF6b+vELbs8wJh2VpmCPpj+kRgDgfrVZCf/TEHsU+3nwIid+wjTEU1YbhiHhJCOjh03
         ganopNRPyh3zYcBIuoI8DnnyfK01gMyot7uwzpC0uw+J3uXGgmiu8EgrxIqFcnKb+lj4
         38FiUzxil1Xjp75OHDDVN8uAabc54wsbveeKzDu+dXvIWO3LPlfqMleX7/r01NeMBX13
         lTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737103098; x=1737707898;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJ1ei5cf4bIYP2dhBSNsW7gRWvtxXhyGMsyM2uckNOk=;
        b=CXcv2MrfqbS/6bu0KYGOTG7+Pj40waKKYrpD5dZ0XqHGx7mHQ8ZJYNB88dB08iFTQa
         EEf3HjIAYK9+TrsUNax1KAhP0MjJffpstLt1vj4JPisul7FBtp2gY8cOoDGMjSvtd6XR
         cK7MkIF/pF7rbW/PpVHNORGN4/9mqv0mbuN/Jx/EfuR3iN0f+LB6wLJQp9Ial34onsha
         zx8iMgioKV98jv5Pn6t1qnIsHwe9qg4CD/gmlj1SBua1B+mF1OWhs3NhZJyT6qndSYnV
         tNEraT5+GkwrDvBEstG0hF0h9pNwIxzUAtBkFtAvVy9ULmSE/j15IyiEQ1YD3JuxRg9k
         LAEg==
X-Gm-Message-State: AOJu0Yw60DVTlAOMUd4pCWyoapqm7jRvcmQt2hAmFhkl8mbkkqCQQEmZ
	ym9jvJf+grI1MXajLWZj9KYf9MmJ7p7MG04SA9fccQBuc02nmwudxDHgzgZdlyLpD8nIMmvjN1i
	c
X-Gm-Gg: ASbGncsWtbSaqrYtX0ydFlL32VaH2WLQwnzFTEUI6nWqhfhvwYuK9FgRq9V4GAN8xYn
	BWjoew9iUk75JtBh2Wnqxg41eRqYrAZWtovA5sSM9R/zPu64hXRGFvP8EC7A6gw3353sNjb1lAY
	NiUQRL7f/62dFgQt93jiqgU5fDw02/ro8OMNLOQEjteDGCjdxPhfNrR8OFz+Q0T4JVIIHWrHhQC
	bAJnVkTBm+sMTP90YLVQzCl9+DmvcEr8KxvpsJmXddT/la+EtHqs+FoGVxjiw==
X-Google-Smtp-Source: AGHT+IHHCRSsCNB3Pr//Zs9JSCQC5BMsN2QD0gja4Pnf4e3R/D/iBTCkc6sIgLA7rH4i2gWt+Va7zw==
X-Received: by 2002:a05:600c:138a:b0:434:9d62:aa23 with SMTP id 5b1f17b1804b1-4389142e88dmr14685205e9.20.1737103098043;
        Fri, 17 Jan 2025 00:38:18 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c0f03984sm81066365e9.0.2025.01.17.00.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:38:17 -0800 (PST)
Date: Fri, 17 Jan 2025 11:38:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Christian Bruel <christian.bruel@foss.st.com>, vkoul@kernel.org,
	kishon@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, p.zabel@pengutronix.de,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	fabrice.gasnier@foss.st.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Christian Bruel <christian.bruel@foss.st.com>
Subject: Re: [PATCH v2] phy: stm32: Optimize tuning values from DT.
Message-ID: <d40db5ae-5db8-4541-8d20-e7bacef4ecf2@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113092001.1344151-1-christian.bruel@foss.st.com>

Hi Christian,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Bruel/phy-stm32-Optimize-tuning-values-from-DT/20250113-172435
base:   v6.13-rc7
patch link:    https://lore.kernel.org/r/20250113092001.1344151-1-christian.bruel%40foss.st.com
patch subject: [PATCH v2] phy: stm32: Optimize tuning values from DT.
config: arm-randconfig-r071-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171619.0XDYDyBZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501171619.0XDYDyBZ-lkp@intel.com/

New smatch warnings:
drivers/phy/st/phy-stm32-combophy.c:147 stm32_impedance_tune() error: buffer overflow 'imp_lookup' 8 <= 8 (assuming for loop doesn't break)
drivers/phy/st/phy-stm32-combophy.c:564 stm32_combophy_probe() warn: passing zero to 'dev_err_probe'

vim +147 drivers/phy/st/phy-stm32-combophy.c

31219ca5436f01 Christian Bruel 2025-01-13  119  static void stm32_impedance_tune(struct stm32_combophy *combophy)
47e1bb6b4ba098 Christian Bruel 2024-09-30  120  {
47e1bb6b4ba098 Christian Bruel 2024-09-30  121  	u8 imp_of, vswing_of;
2de679ecd724b8 Arnd Bergmann   2024-11-11  122  	u32 regval;
47e1bb6b4ba098 Christian Bruel 2024-09-30  123  
31219ca5436f01 Christian Bruel 2025-01-13  124  	if (combophy->microohm) {
2de679ecd724b8 Arnd Bergmann   2024-11-11  125  		regval = 0;
2de679ecd724b8 Arnd Bergmann   2024-11-11  126  		for (imp_of = 0; imp_of < ARRAY_SIZE(imp_lookup); imp_of++) {
31219ca5436f01 Christian Bruel 2025-01-13  127  			if (imp_lookup[imp_of].microohm <= combophy->microohm) {
2de679ecd724b8 Arnd Bergmann   2024-11-11  128  				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of);
47e1bb6b4ba098 Christian Bruel 2024-09-30  129  				break;
2de679ecd724b8 Arnd Bergmann   2024-11-11  130  			}
2de679ecd724b8 Arnd Bergmann   2024-11-11  131  		}

If we don't hit the break sttaement above

47e1bb6b4ba098 Christian Bruel 2024-09-30  132  
47e1bb6b4ba098 Christian Bruel 2024-09-30  133  		dev_dbg(combophy->dev, "Set %u micro-ohms output impedance\n",
47e1bb6b4ba098 Christian Bruel 2024-09-30  134  			imp_lookup[imp_of].microohm);
                                                                                   ^^^^^^
Then this is an out of bounds access.

47e1bb6b4ba098 Christian Bruel 2024-09-30  135  
47e1bb6b4ba098 Christian Bruel 2024-09-30  136  		regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
47e1bb6b4ba098 Christian Bruel 2024-09-30  137  				   STM32MP25_PCIEPRG_IMPCTRL_OHM,
2de679ecd724b8 Arnd Bergmann   2024-11-11  138  				   regval);
47e1bb6b4ba098 Christian Bruel 2024-09-30  139  	} else {
31219ca5436f01 Christian Bruel 2025-01-13  140  		/* default is 50 ohm */
31219ca5436f01 Christian Bruel 2025-01-13  141  		imp_of = 3;
47e1bb6b4ba098 Christian Bruel 2024-09-30  142  	}
47e1bb6b4ba098 Christian Bruel 2024-09-30  143  
31219ca5436f01 Christian Bruel 2025-01-13  144  	if (combophy->microvolt) {
2de679ecd724b8 Arnd Bergmann   2024-11-11  145  		regval = 0;
2de679ecd724b8 Arnd Bergmann   2024-11-11  146  		for (vswing_of = 0; vswing_of < ARRAY_SIZE(imp_lookup[imp_of].vswing); vswing_of++) {
31219ca5436f01 Christian Bruel 2025-01-13 @147  			if (imp_lookup[imp_of].vswing[vswing_of] >= combophy->microvolt) {
2de679ecd724b8 Arnd Bergmann   2024-11-11  148  				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of);
47e1bb6b4ba098 Christian Bruel 2024-09-30  149  				break;
2de679ecd724b8 Arnd Bergmann   2024-11-11  150  			}
2de679ecd724b8 Arnd Bergmann   2024-11-11  151  		}
47e1bb6b4ba098 Christian Bruel 2024-09-30  152  
47e1bb6b4ba098 Christian Bruel 2024-09-30  153  		dev_dbg(combophy->dev, "Set %u microvolt swing\n",
47e1bb6b4ba098 Christian Bruel 2024-09-30  154  			 imp_lookup[imp_of].vswing[vswing_of]);
47e1bb6b4ba098 Christian Bruel 2024-09-30  155  
47e1bb6b4ba098 Christian Bruel 2024-09-30  156  		regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
47e1bb6b4ba098 Christian Bruel 2024-09-30  157  				   STM32MP25_PCIEPRG_IMPCTRL_VSWING,
2de679ecd724b8 Arnd Bergmann   2024-11-11  158  				   regval);
47e1bb6b4ba098 Christian Bruel 2024-09-30  159  	}
47e1bb6b4ba098 Christian Bruel 2024-09-30  160  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

