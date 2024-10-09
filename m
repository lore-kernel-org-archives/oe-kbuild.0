Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3856C193063
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Oct 2024 12:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728476759; cv=none; b=Sh9Jg/uUvfu3NZD9uTzwDcTlDkDzhEStc6k4gwq4Moitw+j32JVn/oilzVQBLCRzi2jQwHRT1vf4SzAzLyXHNOTC9kGCl4MTmAljJCtkcYT5k2oqet4bHBhOq6XA5Nv2wfsSqV6Q0zFfJ/dbHG0CZy3xrFaM5rkZY2alhDtJ4V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728476759; c=relaxed/simple;
	bh=+t9Uloyrid/u3FJ7PlbaraJ52Vmwo8pF4VINJn9kRRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=YhFTlBNdIRCuIteg4OU6F41leTPXPXjN6/Jqx3+rHQs7DXUeHvTcEEKN+DzytE9IC4WkPO2UtIckTQDLu0oFKbatHFHlTuyZZ+dKKNM/47EFQs1u0WldVcy6Za2WJRB10NJaWrEpZXb+BiwLZlOVhOKeTmniLN2AbIW9mYZ4VKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pDtpJfqq; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pDtpJfqq"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37cc846fbc4so5154382f8f.2
        for <oe-kbuild@lists.linux.dev>; Wed, 09 Oct 2024 05:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728476756; x=1729081556; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Kn3RexbTHWZORR721iQDI9yrjKbhGn3OwSkq7dbe4o=;
        b=pDtpJfqqoAjPV+WRixNMYDu5nMWemh6sfe49Xh4cgxhet/Cpa6SbWGaAsREFPiKwE3
         I8FA+7VNKkqD0ws2Xmz8dzlXeMWTxHj5EOMgksDBLJzQmy/6sEW+vtHiKcqUCcAMBALR
         w2umqKQD0iaeqQ5NtuhI5uOmmCLmVjjhIduXNeuxSOB+P3BU3/Vh6t01qNeV4+P8NI9o
         vE6rs8seRwRn8YuU7UZL4GzO4AYopqX+7Gmx+SjfTOkUGsQzl0qSEXyuovnK+ZhA80YH
         T9q7mnS576CEj8hzNIxoL+6Ew136QpKPdKdNKdNmxgqsm8y3JYp2YkOhy7TZ0X0m8/8j
         Iesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728476756; x=1729081556;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Kn3RexbTHWZORR721iQDI9yrjKbhGn3OwSkq7dbe4o=;
        b=f8bLtL/aO0gkBbJ1qsH6hy2Dvo5sMBF/a/O7WkTNul23GavbRJ/0Rezq59c2+u40DR
         S4qf3qhhnj3XpClsrqCHk3RaK/J4ywxLzcDHo2UWpeUFq2tTCJ0Nea2vGwv6Re8AVq+Y
         ypbWXCnNA+ViNLk5AU3m7ux43MqqrG/r2nXjN5190Vs49HX6jSoseTy2EO7pgav6tFXf
         /RkY5Z6wS3cUIf6o9xTX0w/Onn2C5R5LrxmjDItfbaeIu/Aaz/Imp03YS8CEMIzDvPVa
         Ymj1/51fwGl53lk7AWlAVw2x0t0egW/A2y00Tf8HU/XOkMNPMn6YTt1vKLnrRlrT8JCC
         xYxA==
X-Gm-Message-State: AOJu0Yx/W7jZf0yJW+Dd+FCIXpcWU50VX+nGnxkDKqeDK5UVfJpbQj3H
	ZqS3u3MVNpo+xbaxnVvcoV+zH3aEvqbRsF72lLSuq/5LyWvUofW6j/o+Rpyh2Hr5qkR/9IqB8pR
	z
X-Google-Smtp-Source: AGHT+IHDiC6I5FOoS2rlTqjxejlNi2b5hT/fIMkG7hdUwoamSyv/7Lr0j3VYOoDcaIsuG3Dy2/fVVA==
X-Received: by 2002:adf:efc5:0:b0:366:eade:bfbb with SMTP id ffacd0b85a97d-37d3aa8edb9mr1307716f8f.46.1728476756214;
        Wed, 09 Oct 2024 05:25:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1690f0b2sm10367584f8f.9.2024.10.09.05.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 05:25:55 -0700 (PDT)
Date: Wed, 9 Oct 2024 15:25:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Anand Moon <linux.amoon@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH v2 2/3] phy: rockchip-pcie: Use devm_clk_get_enabled()
 helper
Message-ID: <a86437f6-1f62-4f44-bff1-f1203d04edda@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007035616.2701-3-linux.amoon@gmail.com>

Hi Anand,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Moon/phy-rockchip-pcie-Simplify-error-handling-with-dev_err_probe/20241007-115910
base:   8f602276d3902642fdc3429b548d73c745446601
patch link:    https://lore.kernel.org/r/20241007035616.2701-3-linux.amoon%40gmail.com
patch subject: [PATCH v2 2/3] phy: rockchip-pcie: Use devm_clk_get_enabled() helper
config: loongarch-randconfig-r071-20241009 (https://download.01.org/0day-ci/archive/20241009/202410092019.vGogfPIO-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410092019.vGogfPIO-lkp@intel.com/

smatch warnings:
drivers/phy/rockchip/phy-rockchip-pcie.c:278 rockchip_pcie_phy_init() warn: missing error code 'err'

vim +/err +278 drivers/phy/rockchip/phy-rockchip-pcie.c

fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  269  static int rockchip_pcie_phy_init(struct phy *phy)
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  270  {
90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  271  	struct phy_pcie_instance *inst = phy_get_drvdata(phy);
90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  272  	struct rockchip_pcie_phy *rk_phy = to_pcie_phy(inst);
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  273  	int err = 0;
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  274  
90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  275  	mutex_lock(&rk_phy->pcie_mutex);
90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  276  
90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  277  	if (rk_phy->init_cnt++)
90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19 @278  		goto err_out;

Originally, this path just unlocked at returned zero.

90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  279  
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  280  	err = reset_control_assert(rk_phy->phy_rst);
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  281  	if (err) {
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  282  		dev_err(&phy->dev, "assert phy_rst err %d\n", err);
3114329651e74f drivers/phy/rockchip/phy-rockchip-pcie.c Anand Moon 2024-10-07  283  		goto err_out;
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  284  	}
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  285  
90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  286  	mutex_unlock(&rk_phy->pcie_mutex);
90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  287  	return 0;
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  288  
3114329651e74f drivers/phy/rockchip/phy-rockchip-pcie.c Anand Moon 2024-10-07  289  err_out:
90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  290  	rk_phy->init_cnt--;

Now it decrements the counter so presumably it leads to an underflow/use after
free.

90a7612d070d5c drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  291  	mutex_unlock(&rk_phy->pcie_mutex);
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  292  	return err;
fcffee3d54fcad drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  293  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

