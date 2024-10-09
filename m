Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4203E188917;
	Wed,  9 Oct 2024 17:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728493455; cv=none; b=ZlYbOFRm9D/kqnuz0Aj8lH7Pj5XNVVCdxzSMQO7zE8bGY5RDMJ9hzhWXYemHTJZh6+bu6p/hTSnkYDrUceEq0QrFheziZDJ0r8ql2UR0Vg3tV/2b6pWw9P6nxQBnQKMgdKzFzjEofCOKtg17SD12ubyfU+tyjrawJCPI+CUUqBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728493455; c=relaxed/simple;
	bh=GpAZrRGB56bFCpj2C99KdaRD//Z7XPl20beSs+QjVfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cKQyAiSp5DbkCMf6jo3/cf8ESFd3NX2BwULRTeRV9CAtkpCdn2ekkjqsDIxgFwGxhC1Ml+O2JxB76bhye0USu3MkYHei3OK7EDg6GGlpA60ikOp0yk+82Au+SrjLTElLRmUhLwg48SVeSO04vHe5DYf7UIgFMWeNBf96hacey1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzrvbxV9; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzrvbxV9"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53997328633so9659996e87.3;
        Wed, 09 Oct 2024 10:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728493451; x=1729098251; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bAgrg9p0IyL/cHjq8NFMqrg11vbFoHJhejVSOZpWnuI=;
        b=YzrvbxV9Wg9Io0D2ahh4ygBMGO4WT8tX/oCUzxFjPS8+IH24K/dcZN1/AnFbV5gFSD
         HdvQQcPKjwRadshSTohFA8r6w3iJJUXPZwJjeFaVPjv1LVqpPcYP27pguDf8Er6V7ZJC
         2M4VaxPUtpwCcTuxye6Ty4WPW1/ow2HINmErjdZSi8eq4kRCQs/GLRLaMhDKHdivvKrs
         TjS/rBkgjzpP2nzEzZHDbFveVDi1c+Qmn+K3MvPNVYdb8PTtlkuwn0uGnLtCvzk8eZzG
         EsIsQBODibEu+Tq3nwRZwYqsRdhF3I9EE4eRvoxhk5TPObIEIMYbZ/oOQEzfkj7N/P0s
         to9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728493451; x=1729098251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAgrg9p0IyL/cHjq8NFMqrg11vbFoHJhejVSOZpWnuI=;
        b=HSEWxI1T4cqJ4vDu892l2Th9ruQS4aRKH49qflilKX601rqF3zvJN2vfwzQBAXmCXF
         fSaEGoT3o1tCdnMlvPjgy7VJNTNcWY3j6da7NDovv84xXe0pnuI7Y6l2U47PswEwHPdQ
         6cpU0Gp429PZQ9wy8xevjC8E9NiillhFDF06cMKQcgBRoy8UUq13owDzoTYDB/kq4XL4
         Go146dotmKgRSy7fQ6O5d2MHJvFXVpBUSGikbv4BR+8na1AVV/DkosO9qEYpOKzzCRBt
         KusVrXX7QGqjS42qQZvh/HwOev9VdoHoAW0al6mRWTTmMcggOeUjzfZYx+v5AevmtLA1
         eQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvY2X/+7LWzA8PkM6nBYDvRWeDD57DW6WgpeGoHmatAV7xMIpM6eB5Fe6eu6DvxRiR6aBn8IbYOBcLpvw9@lists.linux.dev
X-Gm-Message-State: AOJu0YxbqaTRAKtL/B9EoyS/C3PgEarQVbdhCmXDaimWnYYaXOoNE5nO
	MeaDkEz45kPWRMZl0POWg9pUFh9kWa6yu2UVDTm+6dU07Yeb0ZKiv8zWjkqKmf+G8IwXSKHg0wC
	+fobdwBMFII+v/UCP8NiDu5putx8=
X-Google-Smtp-Source: AGHT+IH/I2srRvV6OFd9jUWGGQC2LsJXZB49Gad0HgloebLrdtnJxijWTQhwoBydGy2Ta8YUkJfwrY1JaK6EnGhfYQY=
X-Received: by 2002:a05:6512:3da6:b0:539:936c:9845 with SMTP id
 2adb3069b0e04-539c4957e39mr3243843e87.37.1728493451037; Wed, 09 Oct 2024
 10:04:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241007035616.2701-3-linux.amoon@gmail.com> <a86437f6-1f62-4f44-bff1-f1203d04edda@stanley.mountain>
 <CANAwSgQObCHr19fmwuc2BfQmoiV3ZgDTFumtfCH8PP_9VbQw+w@mail.gmail.com>
 <20f261b3-5917-4e3e-96be-7dbb993c5a80@stanley.mountain> <CANAwSgTRWmXbyCO0dOeKSu-C_aXAEVGpzGV8SO-BmouFGiaj+g@mail.gmail.com>
In-Reply-To: <CANAwSgTRWmXbyCO0dOeKSu-C_aXAEVGpzGV8SO-BmouFGiaj+g@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 9 Oct 2024 22:33:51 +0530
Message-ID: <CANAwSgROrML0zW-G0aPh6qsdCodOv+7pE8hhaSA4ismJP4G=6g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] phy: rockchip-pcie: Use devm_clk_get_enabled() helper
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Wed, 9 Oct 2024 at 21:38, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Dan,
>
> On Wed, 9 Oct 2024 at 20:19, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Wed, Oct 09, 2024 at 07:59:38PM +0530, Anand Moon wrote:
> > > Hi Dan,
> > >
> > > Thanks for the report.
> > >
> > > On Wed, 9 Oct 2024 at 17:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > > >
> > > > Hi Anand,
> > > >
> > > > kernel test robot noticed the following build warnings:
> > > >
> > > > url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Moon/phy-rockchip-pcie-Simplify-error-handling-with-dev_err_probe/20241007-115910
> > > > base:   8f602276d3902642fdc3429b548d73c745446601
> > > > patch link:    https://lore.kernel.org/r/20241007035616.2701-3-linux.amoon%40gmail.com
> > > > patch subject: [PATCH v2 2/3] phy: rockchip-pcie: Use devm_clk_get_enabled() helper
> > > > config: loongarch-randconfig-r071-20241009 (https://download.01.org/0day-ci/archive/20241009/202410092019.vGogfPIO-lkp@intel.com/config)
> > > > compiler: loongarch64-linux-gcc (GCC) 14.1.0
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > | Closes: https://lore.kernel.org/r/202410092019.vGogfPIO-lkp@intel.com/
> > > >
> > > > smatch warnings:
> > > > drivers/phy/rockchip/phy-rockchip-pcie.c:278 rockchip_pcie_phy_init() warn: missing error code 'err'
> > > >
> > >
> > > All the functions in this file explicitly return 0 instead of err, I
> > > will fix this.
> > >
> > > > vim +/err +278 drivers/phy/rockchip/phy-rockchip-pcie.c
> > > >
> > > > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  269  static int rockchip_pcie_phy_init(struct phy *phy)
> > > > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  270  {
> > > > 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  271      struct phy_pcie_instance *inst = phy_get_drvdata(phy);
> > > > 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  272      struct rockchip_pcie_phy *rk_phy = to_pcie_phy(inst);
> > > > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  273      int err = 0;
> > > > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  274
> > > > 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  275      mutex_lock(&rk_phy->pcie_mutex);
> > > > 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  276
> > > > 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  277      if (rk_phy->init_cnt++)
> > > > 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19 @278              goto err_out;
> > > >
> > > > Originally, this path just unlocked at returned zero.
> > > >
> > > > 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  279
> > > > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  280      err = reset_control_assert(rk_phy->phy_rst);
> > > > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  281      if (err) {
> > > > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  282              dev_err(&phy->dev, "assert phy_rst err %d\n", err);
> > > > 3114329651e74f drivers/phy/rockchip/phy-rockchip-pcie.c Anand Moon 2024-10-07  283              goto err_out;
> > > > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  284      }
> > > > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  285
> > > > 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  286      mutex_unlock(&rk_phy->pcie_mutex);
> > > > 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  287      return 0;
> > > > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  288
> > > > 3114329651e74f drivers/phy/rockchip/phy-rockchip-pcie.c Anand Moon 2024-10-07  289  err_out:
> > > > 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  290      rk_phy->init_cnt--;
> > > >
> > > > Now it decrements the counter so presumably it leads to an underflow/use after
> > > > free.
> > >
> > > I was planning to replace the mutex_lock / mutex_unlock
> > > with guard(mutex)(&rk_phy->pcie_mutex) in the follow up patch.
> > > I will add this in the next revision.
> > >
> > > >
> > > > 90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  291      mutex_unlock(&rk_phy->pcie_mutex);
> > > > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  292      return err;
> > > > fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  293  }
> > > >
> > >
> >
> > Thanks!
> >
> > > Here are my modified changes on top of my changes for the review process.
> > > -----8<----------8<----------8<----------8<----------8<----------8<-----
> > > diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c
> > > b/drivers/phy/rockchip/phy-rockchip-pcie.c
> > > index 2c4d6f68f02a..09685dc3fe17 100644
> > > --- a/drivers/phy/rockchip/phy-rockchip-pcie.c
> > > +++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
> > > @@ -248,20 +248,19 @@ static int rockchip_pcie_phy_init(struct phy *phy)
> > >
> > >         mutex_lock(&rk_phy->pcie_mutex);
> > >
> > > -       if (rk_phy->init_cnt++)
> > > -               goto err_out;
> > > +       if (rk_phy->init_cnt++) {
> > > +               mutex_unlock(&rk_phy->pcie_mutex);
> > > +               return err;
> >
> > Please make this a return 0.  It's faster to not have to look up what a variable
> > is.
> >
> Ok.
> > > +       }
> > >
> > >         err = reset_control_assert(rk_phy->phy_rst);
> > >         if (err) {
> > >                 dev_err(&phy->dev, "assert phy_rst err %d\n", err);
> > > -               goto err_out;
> > > +               rk_phy->init_cnt--;
> > > +               mutex_unlock(&rk_phy->pcie_mutex);
> > > +               return err;
> > >         }
> > >
> > > -       mutex_unlock(&rk_phy->pcie_mutex);
> > > -       return 0;
> > > -
> > > -err_out:
> > > -       rk_phy->init_cnt--;
> > >         mutex_unlock(&rk_phy->pcie_mutex);
> > >         return err;
> >
> > return 0; here too.
The above warning " missing error code 'err'"
so it's correct to return err. here.
> >
> Ok. I will update the patch.
> > regards,
> > dan carpenter
> >
>
Thanks
-Anand
