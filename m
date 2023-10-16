Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001B91C14
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Oct 2023 04:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gj0PT58J"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40684f53ef3so44395685e9.3
        for <oe-kbuild@lists.linux.dev>; Sun, 15 Oct 2023 21:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697431699; x=1698036499; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fu12J9912FJosRY3Zl1CINg2QwA6eXK65koDPwmykQo=;
        b=Gj0PT58JQHFITfNlFssYYY1UHJwbARZqHU3AKf6If5EWjZpLOQ2RENl6EoVd4fjeYo
         Gcko5e4qVMzOwDkMPM6VKS2XJD8NEZhBbKtUEadZe5JCcVFrUIplIHdg4Mdur+UpR+mX
         GYnQsmlXgdx3x4Bj4naS2JgrjYm32QlKRWg7PCBdudaN6Q7wtPU+VkvdPfuqKSkeSpLI
         6+t3iAPyKyzy7L+YXvZlmC5mBASO5FaeVfWENcde6WM+HFPDkdtdNHT8jCS4dQyGzGTt
         91gaogG5G+BevvMFr6u8JaTzpBWS7mlWi3qTw/IziVowx2agiyc29pEEgZkBVIBiLilI
         6jtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697431699; x=1698036499;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fu12J9912FJosRY3Zl1CINg2QwA6eXK65koDPwmykQo=;
        b=XbrpNEVe0XMc+3FniWVOvOzUL6g4eWYf/bX03noRA9rdY98wsI7CD83CCH+decDDCD
         rc+pi4OSlJqLmjbz9PHT2Wo4jpQ5qOAogbauasD6RtN73h0XXvgaLoLoLGqZ4TzifG2F
         FXGMqPEQSDHYPpWU6v834/QHSFgE/9kgZ+5rlabyMG8MC8S0LNqUFRu6tr+gGteJXoBP
         Nt53vXz8TRtX4mtki3hCj8maNC+zTdKVcIo4zgDy7u5rZYmf35baEDFnFekK9uYvSwZV
         rirWQ116PR/B+QAVAnqP1bjBj2R6UoamKOpdLp/iLXRaHTMKsvyxC25jD4/EH/7VLjl2
         Mvvw==
X-Gm-Message-State: AOJu0Yz8AE0WAB+vZdy2Y3Fb3dzdd5WElhkQwEbBvztTfzpfliRmsAAG
	77hCjLhXvUu3R/p6tSOEycM8ac716G6UbSx6G00=
X-Google-Smtp-Source: AGHT+IG3p7meeO/kWEA1VjmPFec9oQBfNDo8wBqLNGqkXYCndDN+PPbRxosAI7/9pxtYl4R3ZaAQYg==
X-Received: by 2002:a05:600c:2a4e:b0:405:7b92:4558 with SMTP id x14-20020a05600c2a4e00b004057b924558mr29005896wme.38.1697431698327;
        Sun, 15 Oct 2023 21:48:18 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n7-20020a05600c4f8700b00406408dc788sm6180389wmq.44.2023.10.15.21.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 21:48:17 -0700 (PDT)
Date: Mon, 16 Oct 2023 07:48:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Daniel Berlin <dberlin@dberlin.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/080-wifi 30/32]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:3971
 brcmf_get_netinfo_array() error: uninitialized symbol 'netinfo'.
Message-ID: <a8ee2d7b-91ad-4e59-9b99-4be87ed98e92@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   2fac67e22f6cf7c8b1261e1bc9a33de738859b89
commit: 3952a7bc01860b0efa4efc162197fc0ddafe7187 [30/32] Finish 6G support by supporting new scan structures
config: x86_64-randconfig-161-20231013 (https://download.01.org/0day-ci/archive/20231014/202310140546.cCy7xVip-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310140546.cCy7xVip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310140546.cCy7xVip-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:3971 brcmf_get_netinfo_array() error: uninitialized symbol 'netinfo'.
drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:3995 brcmf_get_netinfo_v3_array() error: uninitialized symbol 'netinfo'.

vim +/netinfo +3971 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c

53e3a80d80c80b Arend Van Spriel    2016-11-23  3948  static struct brcmf_pno_net_info_le *
53e3a80d80c80b Arend Van Spriel    2016-11-23  3949  brcmf_get_netinfo_array(struct brcmf_pno_scanresults_le *pfn_v1)
53e3a80d80c80b Arend Van Spriel    2016-11-23  3950  {
53e3a80d80c80b Arend Van Spriel    2016-11-23  3951  	struct brcmf_pno_scanresults_v2_le *pfn_v2;
53e3a80d80c80b Arend Van Spriel    2016-11-23  3952  	struct brcmf_pno_net_info_le *netinfo;
53e3a80d80c80b Arend Van Spriel    2016-11-23  3953  
53e3a80d80c80b Arend Van Spriel    2016-11-23  3954  	switch (pfn_v1->version) {
53e3a80d80c80b Arend Van Spriel    2016-11-23  3955  	default:
53e3a80d80c80b Arend Van Spriel    2016-11-23  3956  		WARN_ON(1);
0bde10dc553d27 Gustavo A. R. Silva 2020-08-21  3957  		fallthrough;
53e3a80d80c80b Arend Van Spriel    2016-11-23  3958  	case cpu_to_le32(1):
53e3a80d80c80b Arend Van Spriel    2016-11-23  3959  		netinfo = (struct brcmf_pno_net_info_le *)(pfn_v1 + 1);
53e3a80d80c80b Arend Van Spriel    2016-11-23  3960  		break;
53e3a80d80c80b Arend Van Spriel    2016-11-23  3961  	case cpu_to_le32(2):
53e3a80d80c80b Arend Van Spriel    2016-11-23  3962  		pfn_v2 = (struct brcmf_pno_scanresults_v2_le *)pfn_v1;
53e3a80d80c80b Arend Van Spriel    2016-11-23  3963  		netinfo = (struct brcmf_pno_net_info_le *)(pfn_v2 + 1);
53e3a80d80c80b Arend Van Spriel    2016-11-23  3964  		break;
3952a7bc01860b Daniel Berlin       2023-10-05  3965  	case cpu_to_le32(3):
3952a7bc01860b Daniel Berlin       2023-10-05  3966  		brcmf_err(
3952a7bc01860b Daniel Berlin       2023-10-05  3967  			"This should use the brcmf_get_netinfo_v3_array function to retrieve the array\n");

netinfo not set here.

3952a7bc01860b Daniel Berlin       2023-10-05  3968  		break;
3952a7bc01860b Daniel Berlin       2023-10-05  3969  	}
3952a7bc01860b Daniel Berlin       2023-10-05  3970  
3952a7bc01860b Daniel Berlin       2023-10-05 @3971  	return netinfo;
3952a7bc01860b Daniel Berlin       2023-10-05  3972  }
3952a7bc01860b Daniel Berlin       2023-10-05  3973  
3952a7bc01860b Daniel Berlin       2023-10-05  3974  static struct brcmf_pno_net_info_v3_le *
3952a7bc01860b Daniel Berlin       2023-10-05  3975  brcmf_get_netinfo_v3_array(struct brcmf_pno_scanresults_le *pfn_v1)
3952a7bc01860b Daniel Berlin       2023-10-05  3976  {
3952a7bc01860b Daniel Berlin       2023-10-05  3977  	struct brcmf_pno_scanresults_v2_le *pfn_v2;
3952a7bc01860b Daniel Berlin       2023-10-05  3978  	struct brcmf_pno_net_info_v3_le *netinfo;
3952a7bc01860b Daniel Berlin       2023-10-05  3979  
3952a7bc01860b Daniel Berlin       2023-10-05  3980  	switch (pfn_v1->version) {
3952a7bc01860b Daniel Berlin       2023-10-05  3981  	default:
3952a7bc01860b Daniel Berlin       2023-10-05  3982  		WARN_ON(1);
3952a7bc01860b Daniel Berlin       2023-10-05  3983  		fallthrough;
3952a7bc01860b Daniel Berlin       2023-10-05  3984  	case cpu_to_le32(1):
3952a7bc01860b Daniel Berlin       2023-10-05  3985  	case cpu_to_le32(2):
3952a7bc01860b Daniel Berlin       2023-10-05  3986  		brcmf_err(
3952a7bc01860b Daniel Berlin       2023-10-05  3987  			"This should use the brcmf_get_netinfo_array function to retrieve the array\n");

Not set here.

3952a7bc01860b Daniel Berlin       2023-10-05  3988  		break;
3952a7bc01860b Daniel Berlin       2023-10-05  3989  	case cpu_to_le32(3):
3952a7bc01860b Daniel Berlin       2023-10-05  3990  		pfn_v2 = (struct brcmf_pno_scanresults_v2_le *)pfn_v1;
3952a7bc01860b Daniel Berlin       2023-10-05  3991  		netinfo = (struct brcmf_pno_net_info_v3_le *)(pfn_v2 + 1);
3952a7bc01860b Daniel Berlin       2023-10-05  3992  		break;
53e3a80d80c80b Arend Van Spriel    2016-11-23  3993  	}
53e3a80d80c80b Arend Van Spriel    2016-11-23  3994  
53e3a80d80c80b Arend Van Spriel    2016-11-23 @3995  	return netinfo;
53e3a80d80c80b Arend Van Spriel    2016-11-23  3996  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

