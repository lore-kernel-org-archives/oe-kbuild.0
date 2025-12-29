Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5633191B4
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 18:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033237; cv=none; b=rEFYRcEO+6NiZsHaN6U4E0BtXwWVpFuB81fdpdH/bQ6Yo6bWjv2B15QRsyyj5os7YSc60gKQfNXRkW8sZ6KLpWjT0CdQNTkayEytIWQ2GfyHEAXlNm77J6vzvxwENZaDe6T86NTXjYPvPr0/DpXakc+xP+aP/ctpm9/LgdPM9+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033237; c=relaxed/simple;
	bh=+21vXwmXJAEwk44gixVVoCMou1vEFFG+9TEW7F2Necs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ezwitqezyPMv2eHpkOQiFxMEAlKN+RQi7ch+lBK2LQ/J7lfiRalfhdjSzyejLEg6LTLCkKsP3EQUCsoKAgplvP82g2UiuxjNGB9RP13OFfi056nIIYZVFbn7JkR8GuatEl1MLPEpkyBegIxn8Gje6DdWwsEiKLudx/gwcOcg5hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZzZIJXg2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZzZIJXg2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso84838895e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 10:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767033230; x=1767638030; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7z0B2zhXV5zpvQStdwY3VXDDhET9zl4MmKoAwZgoFbY=;
        b=ZzZIJXg2yPo7YfeIzmlcGdawi5Lnj5XhGBK0SfMyfBc/WPRFIiqhqZe2iKbnNw8ltS
         siWUb7J5/guVTwloxWnFhbv4NMJSAQB6Kw3s5kmksGrbZDROSr9WybVdUcQdIMtjmvp9
         TlXeHZq+L+TBQyYL/rAoQIOWadcjf00D+8EAj4nf3f6IazZ3zyxkh2HOnqUQ0C4RDVjr
         Xt/YMa1ico2rgazJDj+6iPiE+aKSXdJvpAUwTOyfgH7lvxCtF9hRhwrMjdNdualp+3jg
         9ybzun00KyBQUv6gBdjaQVNHZA3KLn128jbobGA15esWrXxsHMRxwI/RcowPWzZwGMst
         CJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033230; x=1767638030;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7z0B2zhXV5zpvQStdwY3VXDDhET9zl4MmKoAwZgoFbY=;
        b=av4UJgTcN7ILXgSUOT4sBTS79PUPpjOOKm4OjTkUhyPPbFRxuRymmFv7gdihWdYib1
         Rui0GEXlqQEYrr3AL67Gmone8qgy8HQJ3eQZtzmSjTyAgP1O2d+PeNInUZfIhbYwxt1U
         vGc+hxE9uQobVyZRig+kaDA3ai4/66kw0riZBsqBJ4XW7dv4F0soBRpsuw0y4p2yGI0y
         zOdbfrtgBqgOk3IjKZMGzXGe5X0zXHvznB3ccn9ReWrn2UjR89rkT4Q5DwAOJrjlDTHU
         A8Xr+DN+TDu2raAYPyRTTzBACNNj53RHXRwvL4x9O3aSnuEELm8ZD0imWbLjP/ydz0wU
         07LA==
X-Gm-Message-State: AOJu0Yz9KnOPGHL3yYRSjPm5leAnrCGjCpo0lBxgWn+qHWPlZtoonmLW
	01x/qTSf8DhIoN8fIyFKBADAjwcaSYlohhHxowN9XVbealXPwId3ZH+d8UEmENiHej81UuBzHDK
	qBDxE
X-Gm-Gg: AY/fxX5tGw0XTrhmTw65ulOAbS3FdwrUIRZJQdrJOqmaHsCIge1o7cWi0DmDHjV4EC0
	n0MHpCBHUrtX8hlM92Zec3xNLhQi144XQxCnxzCqOvE5FUrQgkM0Q+CTDLmlpC7b3/UmFdH9hkX
	fqzKLJsKUpiWMo7R1Cn6aiGzmdOuPa5jZpxTuFURkwuzZlzKoHESM0CoKmxYYk7bMcwhnLRIErj
	ttKU3hs20MO7k562XMZlsZav8UMwMjVHbudrGGEBPniUa4dAr8ZBrsKIKxh0YNwlL2aYQaeEg9k
	nadjgCm8C0ZFRW2Woj+nUJ1Fq8+iLjgmfqxQaSVhj3a/UkQrfc3418ZP+bux+UuNTIRwtdXfWKD
	FoxbRw+a0wWAh3BWYJq1EA6k1oucbhR/wOUyslcJWYwE0EscetXhwwOTKgGsfneSY1PEUXUBEGA
	5SClYYAQy63D2gV7Nx
X-Google-Smtp-Source: AGHT+IEHhrhFf7Jf8dL/0jQocV0GRaiwX1qkdAS5mCHJ5u+kHgrFmfG0sL3CPSPjggNXKCTNOgfCmg==
X-Received: by 2002:a05:600c:3b0e:b0:47b:deb9:fbc with SMTP id 5b1f17b1804b1-47d1955b7f4mr288107955e9.2.1767033229819;
        Mon, 29 Dec 2025 10:33:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm562809105e9.12.2025.12.29.10.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:33:49 -0800 (PST)
Date: Mon, 29 Dec 2025 21:33:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Svyatoslav Ryhel <clamor95@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] usb: phy: tegra: use phy type directly
Message-ID: <202512262345.OOsbJ2kr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223094529.7202-2-clamor95@gmail.com>
Message-ID: <20251229183346.Atas-zSsUotiXlj_B2a5KJECn2C26o17fWd5kbr738Q@z>

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/usb-phy-tegra-use-phy-type-directly/20251223-175449
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20251223094529.7202-2-clamor95%40gmail.com
patch subject: [PATCH v2 1/2] usb: phy: tegra: use phy type directly
config: arm-randconfig-r071-20251224 (https://download.01.org/0day-ci/archive/20251226/202512262345.OOsbJ2kr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512262345.OOsbJ2kr-lkp@intel.com/

smatch warnings:
drivers/usb/phy/phy-tegra-usb.c:857 tegra_usb_phy_power_off() error: uninitialized symbol 'err'.

vim +/err +857 drivers/usb/phy/phy-tegra-usb.c

1ba8216f0bc02a drivers/usb/phy/tegra_usb_phy.c Venu Byravarasu  2012-09-05  837  static int tegra_usb_phy_power_off(struct tegra_usb_phy *phy)
1ba8216f0bc02a drivers/usb/phy/tegra_usb_phy.c Venu Byravarasu  2012-09-05  838  {
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  839  	int err;
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  840  
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  841  	if (!phy->powered_on)
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  842  		return 0;
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  843  
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  844  	switch (phy->phy_type) {
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  845  	case USBPHY_INTERFACE_MODE_UTMI:
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  846  		err = utmi_phy_power_off(phy);
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  847  		break;
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  848  
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  849  	case USBPHY_INTERFACE_MODE_ULPI:
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  850  		err = ulpi_phy_power_off(phy);
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  851  		break;
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  852  
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  853  	default:
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  854  		break;

err = -EINVAL?

156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  855  	}
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  856  
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06 @857  	if (err)
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  858  		return err;
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  859  
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  860  	phy->powered_on = false;
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  861  
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  862  	return 0;
1ba8216f0bc02a drivers/usb/phy/tegra_usb_phy.c Venu Byravarasu  2012-09-05  863  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

