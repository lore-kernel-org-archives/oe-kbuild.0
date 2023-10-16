Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF43A1C14
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Oct 2023 04:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CqK46nZL"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-31f71b25a99so3868747f8f.2
        for <oe-kbuild@lists.linux.dev>; Sun, 15 Oct 2023 21:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697431781; x=1698036581; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJc90FRFU3fOsiAP8JukZC8xlwxkOrVqaLNoVS0Lq4M=;
        b=CqK46nZLzHUAby+OmYxtq44GKZptT67y51+6LiqZqyM1q2WPe4deeG28J34fX0llNm
         3n/USaDZMVk5Lm8gJOv03zjPBpd4B3d2E5KQ9GASWWOqb+MgUyS4ThiMNYHHuAftxCJ+
         DneTAz6Dar4FG3GEHeGBXda9CTuKpo9CGvqy/0EM5KV/19D7a8hwLRxxWyFNe/JMj9fZ
         kpMYBL9ieueM7SQaiwBDZIKPQO1R/qQKePwF92g1XHq3lJkWKdwK4wsIIFjgdTupwsxe
         +aA1K/mmz4byJbCc2x8/lmUfPSzOp7+xLBsHxaH3Jef/hZ7jyYGNGh4wbpk6cLkJ1xKx
         HxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697431781; x=1698036581;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJc90FRFU3fOsiAP8JukZC8xlwxkOrVqaLNoVS0Lq4M=;
        b=JbwX0rCLdT0Ayse9HlSkJ7Ck6BmoOpjTNv2Cx8opgq02nxm+2Ky6fz4xtbetOvb85R
         dZvI+OyHrUADSu8GPn3mRr3kPsgu2Chm5zkenMN1FXnfdoKO01RZLvy8Z8vUKdJHHbz2
         2Vtr++2zU0OIg6sYFKjPayxvWtoBJEKLWjRT2gVLrAWntdXycdrgZQu4IKvt9fWVreZy
         7qs80YYwbX8hoks4GtbwIAX4uH9LVg52+SDLoaI6DQwFybEQWu2X+CLef3VRfi110NC6
         83tW+mFFgxGP1LNQEQUbRGeYGZO4hsMKXpxSkqC0LPYqi2IQua8TwXPJUpnCnrqc7FZB
         fUiA==
X-Gm-Message-State: AOJu0YzwJvXcZKUGvrHY7D7NtC1WYOcELYCKFXSM5cKp37ZQLAaUU2IL
	Q0vp+CVlkGA+MxmAHN6tXxYZEle2HXpxIlsPuhM=
X-Google-Smtp-Source: AGHT+IGINi4RbUZA551UH4M/OGEIgiB22bM6ASrHKDQ1dD2i12AWj6YGtV7XQ76MxhpCgN4zCuhxbQ==
X-Received: by 2002:a5d:5258:0:b0:32d:9701:90e5 with SMTP id k24-20020a5d5258000000b0032d970190e5mr7772173wrc.34.1697431781686;
        Sun, 15 Oct 2023 21:49:41 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n6-20020adffe06000000b003140f47224csm26227635wrr.15.2023.10.15.21.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 21:49:41 -0700 (PDT)
Date: Mon, 16 Oct 2023 07:49:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Daniel Berlin <dberlin@dberlin.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:pr/208 1/1]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7455
 brcmf_get_bwcap() warn: ignoring unreachable code.
Message-ID: <80aba4c9-6677-485e-aa7f-8bc5cd672ede@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/AsahiLinux/linux pr/208
head:   f82c1849a64ad37b55d74b1cc4681e819c068b93
commit: f82c1849a64ad37b55d74b1cc4681e819c068b93 [1/1] Fix invalid frequency issues and issues with HE supporting/only AP's
config: x86_64-randconfig-161-20231013 (https://download.01.org/0day-ci/archive/20231014/202310140627.FEmReRFq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310140627.FEmReRFq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310140627.FEmReRFq-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7455 brcmf_get_bwcap() warn: ignoring unreachable code.

vim +7455 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c

f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08  7440  static void brcmf_get_bwcap(struct brcmf_if *ifp, u32 bw_cap[], bool has_6g)
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7441  {
16e64676839633 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Rafał Miłecki       2019-02-15  7442  	struct brcmf_pub *drvr = ifp->drvr;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7443  	u32 band, mimo_bwcap;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7444  	int err;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7445  
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7446  	band = WLC_BAND_2G;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7447  	err = brcmf_fil_iovar_int_get(ifp, "bw_cap", &band);
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7448  	if (!err) {
57fbcce37be7c1 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Johannes Berg       2016-04-12  7449  		bw_cap[NL80211_BAND_2GHZ] = band;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7450  		band = WLC_BAND_5G;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7451  		err = brcmf_fil_iovar_int_get(ifp, "bw_cap", &band);
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7452  		if (!err) {
57fbcce37be7c1 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Johannes Berg       2016-04-12  7453  			bw_cap[NL80211_BAND_5GHZ] = band;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7454  			return;
                                                                                                                                        ^^^^^^^
Ancient return statement

f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08 @7455  			if (!has_6g)

Unreachable new code

f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08  7456  				return;
f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08  7457  			band = WLC_BAND_6G;
f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08  7458  			err = brcmf_fil_iovar_int_get(ifp, "bw_cap", &band);
f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08  7459  			if (!err) {
f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08  7460  				bw_cap[NL80211_BAND_6GHZ] = band;
f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08  7461  				return;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7462  			}
f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08  7463  			return;
f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08  7464  		}
f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08  7465  
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7466  		WARN_ON(1);
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7467  		return;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

