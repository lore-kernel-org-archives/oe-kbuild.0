Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF4A18EAD
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Oct 2024 14:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728485385; cv=none; b=PFQz+jNBqPBoQYfF0ejEvof4MQGbsOF4Iz/8VWDmSPFdTMQiYRPaheoN8qaUMJHTW1MTgG/klD00404dEcmNi840LJL+FnCD7JgCnnG5bhDR6HF9TEY6//J2Quf0Oaz0cfNQDOY60IPua0NLJxqhDLLfASipXulaedMWh/jpJK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728485385; c=relaxed/simple;
	bh=bOggnDixrO5nLbLSpilrKci2gazaENMnsyI8ZOFbLVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uannT89Oj8d5XCUfR/hb5OHsXMSF74UiUYPL7Bx91FXtsMN8acjlnAvXzthlTodCmyVu2pNHwv2HuMR8xrwiY/W+EIJbe23nyqa7wExnMh25WiKYe/m7GhBefsA8rh38SELYfVv951su0WctUtmmPDeS+CKaS0WNNZDkSDH5i7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rie/0Bre; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rie/0Bre"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cc8782869so70587815e9.2
        for <oe-kbuild@lists.linux.dev>; Wed, 09 Oct 2024 07:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728485382; x=1729090182; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W57EVEdRC/Melvgphr74WZFGUZg5zsL69X6rPgnjboU=;
        b=Rie/0BreJVfVdL481d5k9XhIyFeZK2cWAb89gWP7X5FrmV1d41hTkE1QBqdpAZlDFM
         qm3S5rwATPRfXrEqhF1Yy3uPRs6a2qssOVmPnOR+UxLBqrvDiEtrNqAeFqNDnoShC1dE
         804d/ZLY+dMY+yLIZzYGQd0MXUCPKMyGjsrr+I8Mk7PDvZ/fmEKxQw80h7ddelyH0IPv
         quc9luaTO3yrInIzy2HnOe1nuVV+yKfspE3XDkFJkrNG8EwogFzt+/Z32Y0+AFEMxiz/
         N/PWuu7/wLPCSKmDjHl2An7ikYW4Mk3PC1aTq0UHq4NqWIIv/Wj+TX6dz/9dDtZItDE7
         dmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728485382; x=1729090182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W57EVEdRC/Melvgphr74WZFGUZg5zsL69X6rPgnjboU=;
        b=BTwS+UCDechh044CKVzNHuPNRmbt6HqO7Wq7EpN9mcxxELP5uS5ZH550gE9G1AFUFx
         RiQwBjLcJoFlvZOrv0f8jHP5jFxwFPnm0igkNwW19iXTRdkDS9jN8qglFhny7bUXxyHa
         m8gUYbeQz0l2xAmQx10urlv+3NFdLri6xeFGq3XQX4eFRUxafOwEAKI7Z3WKmYcrlhsL
         jQhr+mJbQPuk3Ox0J+kmNFvtyJw6Px/u8TdQGtHEVAynn027ttkJpUcMxT3a7cIDjeOc
         ZL/5wX84YTcHB+FbF1d3JlotDBqVpns8VilNn/jvjXMqWxv2Tyx/wjW8yUQCvVLUrBiG
         JrWg==
X-Gm-Message-State: AOJu0YxgZw6w1imsxo67RxCZllgR1TavI04RjIB0c055rTiBHvygp87v
	XB5RMLWDZUSsk8FwImVgGs0LEzsEn4uBP5X/7QhVjQzeI5GBfXmx5Hu70sjoYe5g2AzzrJEUYJC
	E
X-Google-Smtp-Source: AGHT+IG8lQlSrbDZ+GnOoRNnzmoSfZFSnsDqQssE7hw5pITsIWWfL/VJLC4SiGTGQTR7CJAM1wuBFw==
X-Received: by 2002:a05:600c:3b87:b0:42c:b5f1:44ff with SMTP id 5b1f17b1804b1-430d6facb85mr23077635e9.24.1728485382199;
        Wed, 09 Oct 2024 07:49:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430c908b8f6sm22933035e9.0.2024.10.09.07.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 07:49:41 -0700 (PDT)
Date: Wed, 9 Oct 2024 17:49:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/3] phy: rockchip-pcie: Use devm_clk_get_enabled()
 helper
Message-ID: <20f261b3-5917-4e3e-96be-7dbb993c5a80@stanley.mountain>
References: <20241007035616.2701-3-linux.amoon@gmail.com>
 <a86437f6-1f62-4f44-bff1-f1203d04edda@stanley.mountain>
 <CANAwSgQObCHr19fmwuc2BfQmoiV3ZgDTFumtfCH8PP_9VbQw+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANAwSgQObCHr19fmwuc2BfQmoiV3ZgDTFumtfCH8PP_9VbQw+w@mail.gmail.com>

On Wed, Oct 09, 2024 at 07:59:38PM +0530, Anand Moon wrote:
> Hi Dan,
> 
> Thanks for the report.
> 
> On Wed, 9 Oct 2024 at 17:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > Hi Anand,
> >
> > kernel test robot noticed the following build warnings:
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Moon/phy-rockchip-pcie-Simplify-error-handling-with-dev_err_probe/20241007-115910
> > base:   8f602276d3902642fdc3429b548d73c745446601
> > patch link:    https://lore.kernel.org/r/20241007035616.2701-3-linux.amoon%40gmail.com
> > patch subject: [PATCH v2 2/3] phy: rockchip-pcie: Use devm_clk_get_enabled() helper
> > config: loongarch-randconfig-r071-20241009 (https://download.01.org/0day-ci/archive/20241009/202410092019.vGogfPIO-lkp@intel.com/config)
> > compiler: loongarch64-linux-gcc (GCC) 14.1.0
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202410092019.vGogfPIO-lkp@intel.com/
> >
> > smatch warnings:
> > drivers/phy/rockchip/phy-rockchip-pcie.c:278 rockchip_pcie_phy_init() warn: missing error code 'err'
> >
> 
> All the functions in this file explicitly return 0 instead of err, I
> will fix this.
> 
> > vim +/err +278 drivers/phy/rockchip/phy-rockchip-pcie.c
> >
> > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  269  static int rockchip_pcie_phy_init(struct phy *phy)
> > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  270  {
> > 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  271      struct phy_pcie_instance *inst = phy_get_drvdata(phy);
> > 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  272      struct rockchip_pcie_phy *rk_phy = to_pcie_phy(inst);
> > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  273      int err = 0;
> > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  274
> > 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  275      mutex_lock(&rk_phy->pcie_mutex);
> > 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  276
> > 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  277      if (rk_phy->init_cnt++)
> > 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19 @278              goto err_out;
> >
> > Originally, this path just unlocked at returned zero.
> >
> > 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  279
> > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  280      err = reset_control_assert(rk_phy->phy_rst);
> > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  281      if (err) {
> > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  282              dev_err(&phy->dev, "assert phy_rst err %d\n", err);
> > 3114329651e74f drivers/phy/rockchip/phy-rockchip-pcie.c Anand Moon 2024-10-07  283              goto err_out;
> > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  284      }
> > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  285
> > 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  286      mutex_unlock(&rk_phy->pcie_mutex);
> > 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  287      return 0;
> > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  288
> > 3114329651e74f drivers/phy/rockchip/phy-rockchip-pcie.c Anand Moon 2024-10-07  289  err_out:
> > 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  290      rk_phy->init_cnt--;
> >
> > Now it decrements the counter so presumably it leads to an underflow/use after
> > free.
> 
> I was planning to replace the mutex_lock / mutex_unlock
> with guard(mutex)(&rk_phy->pcie_mutex) in the follow up patch.
> I will add this in the next revision.
> 
> >
> > 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  291      mutex_unlock(&rk_phy->pcie_mutex);
> > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  292      return err;
> > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  293  }
> >
> 

Thanks!

> Here are my modified changes on top of my changes for the review process.
> -----8<----------8<----------8<----------8<----------8<----------8<-----
> diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c
> b/drivers/phy/rockchip/phy-rockchip-pcie.c
> index 2c4d6f68f02a..09685dc3fe17 100644
> --- a/drivers/phy/rockchip/phy-rockchip-pcie.c
> +++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
> @@ -248,20 +248,19 @@ static int rockchip_pcie_phy_init(struct phy *phy)
> 
>         mutex_lock(&rk_phy->pcie_mutex);
> 
> -       if (rk_phy->init_cnt++)
> -               goto err_out;
> +       if (rk_phy->init_cnt++) {
> +               mutex_unlock(&rk_phy->pcie_mutex);
> +               return err;

Please make this a return 0.  It's faster to not have to look up what a variable
is.

> +       }
> 
>         err = reset_control_assert(rk_phy->phy_rst);
>         if (err) {
>                 dev_err(&phy->dev, "assert phy_rst err %d\n", err);
> -               goto err_out;
> +               rk_phy->init_cnt--;
> +               mutex_unlock(&rk_phy->pcie_mutex);
> +               return err;
>         }
> 
> -       mutex_unlock(&rk_phy->pcie_mutex);
> -       return 0;
> -
> -err_out:
> -       rk_phy->init_cnt--;
>         mutex_unlock(&rk_phy->pcie_mutex);
>         return err;

return 0; here too.

regards,
dan carpenter

