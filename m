Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA431A2544;
	Wed,  9 Oct 2024 14:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728484197; cv=none; b=hk7aEUheyCeSiuGOpaOuoxV8HsKaqn62YZWjblWXZoEUED4yqsaGEwn3ROcN9XSPrbDuAzLLkXMDu/zcmhLb4rW8ieXBBJdy7A9JAN82wmNi4NR0WldTEP4LEWXyaoMjNpJeryH8k/mIkiNaEMN1BPuuhlwNWLfu3N1D8x5/QcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728484197; c=relaxed/simple;
	bh=6rg8fudV2HDi1NEoULsMUGCnazkZy5kFAgN4WeYPYbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cUwndNOfUwn7Mslmf/DVhtEQ8bFZPZSQQL4sVkp20Bjy4amjTaf7YbNBD9vkfGYqBJzh5uRrk5Sf404jul3Ag21wJnKnrHe9ZHPdiqlbfJ6Ozm2g7i9g0it4QDPqRsPVhw0EqlP/VYvzIunY5vE8RsGIcSmP8kxzuHJI1rYi0Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMhnvl6Y; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMhnvl6Y"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5e7ff233e12so907080eaf.1;
        Wed, 09 Oct 2024 07:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728484195; x=1729088995; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1HJ5l2YJxm3O72neDz3rx650xEJBhAU/4equGAO1fYw=;
        b=BMhnvl6YTa5OJrVUKtWgm3tTnhS6IHgmnEVRbIvkF0itHQUYHckIXbR2Nz3qirPP1/
         hyWX8BKcpxfimeeX+lZR56Id92tnrSciEM89NI8IEBrwvC928juu4ty5IZwHbN4WY5zt
         414lai0hmOhBGXDriGJqUtr/LPQ0rjLLtuVX+W3m/jjx7j28iTLXaP57mqSsj3nkezCP
         4LCl5xp9TjfYK1lh0wseKk0sD5IdW32Edgu/nQjvxOEB/bx+PG7IZes1T3UeGn2KWLht
         nYBQ0p8r+IHPo7tpoNYe1t96WPwalSVwAhzbGMLrLiXiet5eRMaAHMI2fjBC/OGTmewI
         hvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728484195; x=1729088995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1HJ5l2YJxm3O72neDz3rx650xEJBhAU/4equGAO1fYw=;
        b=koQqHT/oVDbXqh6foVqRV/+jyHq9nBoWfTQSkVvOHgPnM+5XcURXdUXt7+VbIATxau
         Xvftz+FvR0YGnkAh0unOB/p7nyEyyM0mF8HBh1ne6+LKmlnwxraYOw7btyH07/EUgMtM
         gF+ZjTMDX6+VBZ1rBUuJf0PT9v5E4X7Z14FUepNSMOmphHTmk5oTWhjMAfNkzvbyu4oW
         CPWdgOyDNVD08TxE6V+mWEkW5C7kmt1fgjcaNe3GD+sWhKgzngbHFzjQkqI9vGxDN9JI
         ghecqjfzwciMlAz4QtkwB2MsZrvy4CWCEChM0/V83qYLQolwUxaymLOXjUGzFKfhyFoj
         zhgA==
X-Forwarded-Encrypted: i=1; AJvYcCVQA3PFKouA9BckXVKCUI4EkVE0KrZSLTZJdGqp0KIpYyOVNxacKHBypgirrfv+dnjF/B2G18GFjvZL3FpY@lists.linux.dev
X-Gm-Message-State: AOJu0YzB7KGABksdvMMKNS8PAx6COHjTnZe37l0yzcQPsWWaRl+HnOvB
	HpF5FgPyXGeOSm6KQjDVCM6M9PKuMmGiWeO/z/owb71DtEPenzQ+/7cJD5ge0RVrfKmokWHJwCn
	FtlEjaa9OE1Ql3pFjkBuYTsx/Kl4=
X-Google-Smtp-Source: AGHT+IHOrvLRQI0/DuijimlqP0nw80CW8kMD/I1XWLU6FBTX4UZBqAZ7fjEFo17vF1pCXjI4KLjeFyqN7tzpy6H2yAQ=
X-Received: by 2002:a05:6820:308c:b0:5e8:4dd:46cb with SMTP id
 006d021491bc7-5e987b8b2c2mr1453420eaf.8.1728484195021; Wed, 09 Oct 2024
 07:29:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241007035616.2701-3-linux.amoon@gmail.com> <a86437f6-1f62-4f44-bff1-f1203d04edda@stanley.mountain>
In-Reply-To: <a86437f6-1f62-4f44-bff1-f1203d04edda@stanley.mountain>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 9 Oct 2024 19:59:38 +0530
Message-ID: <CANAwSgQObCHr19fmwuc2BfQmoiV3ZgDTFumtfCH8PP_9VbQw+w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] phy: rockchip-pcie: Use devm_clk_get_enabled() helper
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

Thanks for the report.

On Wed, 9 Oct 2024 at 17:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Hi Anand,
>
> kernel test robot noticed the following build warnings:
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Moon/phy-rockchip-pcie-Simplify-error-handling-with-dev_err_probe/20241007-115910
> base:   8f602276d3902642fdc3429b548d73c745446601
> patch link:    https://lore.kernel.org/r/20241007035616.2701-3-linux.amoon%40gmail.com
> patch subject: [PATCH v2 2/3] phy: rockchip-pcie: Use devm_clk_get_enabled() helper
> config: loongarch-randconfig-r071-20241009 (https://download.01.org/0day-ci/archive/20241009/202410092019.vGogfPIO-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.1.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202410092019.vGogfPIO-lkp@intel.com/
>
> smatch warnings:
> drivers/phy/rockchip/phy-rockchip-pcie.c:278 rockchip_pcie_phy_init() warn: missing error code 'err'
>

All the functions in this file explicitly return 0 instead of err, I
will fix this.

> vim +/err +278 drivers/phy/rockchip/phy-rockchip-pcie.c
>
> fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  269  static int rockchip_pcie_phy_init(struct phy *phy)
> fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  270  {
> 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  271      struct phy_pcie_instance *inst = phy_get_drvdata(phy);
> 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  272      struct rockchip_pcie_phy *rk_phy = to_pcie_phy(inst);
> fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  273      int err = 0;
> fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  274
> 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  275      mutex_lock(&rk_phy->pcie_mutex);
> 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  276
> 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  277      if (rk_phy->init_cnt++)
> 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19 @278              goto err_out;
>
> Originally, this path just unlocked at returned zero.
>
> 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  279
> fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  280      err = reset_control_assert(rk_phy->phy_rst);
> fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  281      if (err) {
> fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  282              dev_err(&phy->dev, "assert phy_rst err %d\n", err);
> 3114329651e74f drivers/phy/rockchip/phy-rockchip-pcie.c Anand Moon 2024-10-07  283              goto err_out;
> fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  284      }
> fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  285
> 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  286      mutex_unlock(&rk_phy->pcie_mutex);
> 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  287      return 0;
> fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  288
> 3114329651e74f drivers/phy/rockchip/phy-rockchip-pcie.c Anand Moon 2024-10-07  289  err_out:
> 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  290      rk_phy->init_cnt--;
>
> Now it decrements the counter so presumably it leads to an underflow/use after
> free.

I was planning to replace the mutex_lock / mutex_unlock
with guard(mutex)(&rk_phy->pcie_mutex) in the follow up patch.
I will add this in the next revision.

>
> 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  291      mutex_unlock(&rk_phy->pcie_mutex);
> fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  292      return err;
> fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  293  }
>

Here are my modified changes on top of my changes for the review process.
-----8<----------8<----------8<----------8<----------8<----------8<-----
diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c
b/drivers/phy/rockchip/phy-rockchip-pcie.c
index 2c4d6f68f02a..09685dc3fe17 100644
--- a/drivers/phy/rockchip/phy-rockchip-pcie.c
+++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
@@ -248,20 +248,19 @@ static int rockchip_pcie_phy_init(struct phy *phy)

        mutex_lock(&rk_phy->pcie_mutex);

-       if (rk_phy->init_cnt++)
-               goto err_out;
+       if (rk_phy->init_cnt++) {
+               mutex_unlock(&rk_phy->pcie_mutex);
+               return err;
+       }

        err = reset_control_assert(rk_phy->phy_rst);
        if (err) {
                dev_err(&phy->dev, "assert phy_rst err %d\n", err);
-               goto err_out;
+               rk_phy->init_cnt--;
+               mutex_unlock(&rk_phy->pcie_mutex);
+               return err;
        }

-       mutex_unlock(&rk_phy->pcie_mutex);
-       return 0;
-
-err_out:
-       rk_phy->init_cnt--;
        mutex_unlock(&rk_phy->pcie_mutex);
        return err;
 }

Thanks
-Anand
