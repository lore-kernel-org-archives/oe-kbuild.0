Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715CC36AB5F
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 10:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770807468; cv=none; b=REwl4jD+RgY6+F4sKFPWgp+xkscOkels/23yPereKriFVdp2hBz5w/+ZXhdSbDRuMxz1edGkHIoHDbXIom/m0zM57b9DH1YGAKESucCW+/JyI7VI37jCOYPznB9Kj5o7A97/m2QvLHXTlydPd63C4YUT8HGYMb4MJmTNUXK0HNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770807468; c=relaxed/simple;
	bh=YkNcQ3NtAJBYnY/PDYgBtDin1rYL1T6RPzvptBiXatI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=qco5begnP+QzCFcB2ZowCnaCbxL5C0xHN0wW73LM8Xenq3PIucOAZM3MKOZeuuImF1qtUMb3wiWCbmwocGLeRwpGmYQwUcRtFatbzjMYLwDWb2b/oJf/eus8965741IwpP3uQ+b1kEDI26/UUyGWEmnUOay12cT+MAW3JRROufA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KSVALg35; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KSVALg35"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so54701025e9.2
        for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 02:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770807464; x=1771412264; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1f6efIeKsPBmBdsMP945v7o1I22Mg2iVh32MUI/KTBg=;
        b=KSVALg35HhZlG7u8PtyIgqJL1rm2SQdxYEExDGX9IHTBfR26YVJ1MqLUgKzVl898j7
         T0KwSL9IaMTQOAp3bSc/Ujx6z/lc5evbemA+F1gN88kSCMxzmo6vMYFTXgrGRil8y5hH
         daRw9V/9TZwXW2WqUo0ESUb9JI08w5cq1e680+uqszYeqeriS+cbY6mm7Ugj2KLBZSif
         6p694ZTUNNSTJaIK/Zyk+r1nOsuqm7rvhelveOlvao/dzCtlfdqhLVBHOStw8tkFz1Qi
         74eBYln8RRYzE6yrz/skHj7/V6HGUrTlh0sODHRMgI3t+fmOCJCqctDGOw6cjkIWZZpH
         ZPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770807464; x=1771412264;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1f6efIeKsPBmBdsMP945v7o1I22Mg2iVh32MUI/KTBg=;
        b=NGCKxJ9gB2KiaJL+jvy90sw1Q3q1P657Eyx/XP1N5aBZ8pKYhSSpSkCL0NmXS+oO/x
         saHDTy7PZgquwo2cyDEBzP13laPHGO6fkdbNuoYQgnvWLMNwUtKt8li62T7JDZKPpTTs
         61BeOxbjT3zoB/5QQgFuIR4P9t3t1Ln9FGPz4roXLYDbCKpn5qJhVd11c8u7tayGWsqo
         v/4cdvxRTIOz7sURTcSKXOt9l6hgYt+HGWD4Tvy/jj4fTn0ff3GeAQjvZRUq7m9ZD5yw
         IfxH2uP4PfBack8tm15kycvX/m5bKG/184kRONItdjz21WfgIZgd+uSy0GFKRFHVG1Sy
         4s0A==
X-Gm-Message-State: AOJu0Yzy2AlSUh6ElKidDSdxchlap1XzZVvkzb7/xMFBpsyaZKec0bXN
	Cf5CeOnvoxQwmoeg0SUXja2UwkiuGevtO0p7k4IxSz/pqNmDTSRJpxd//95T0A2v/k2d122gi6Y
	RqAjU
X-Gm-Gg: AZuq6aLgmPnwy0MU+dMkoWGmoces43s1ZCSrMz6gfpjd5vrMcBHCqwhXTlfCWXm6yS0
	b14JvNcTWLPxcD7NMsLFFf6zCgVNVvINUx4pJchgOfHulsAOWHAbZYzB8RiXUHL7MfSxaGzzASi
	fVrAMcDRtW6snMl3ZDo0Nun/k14VGrtXs6yXmofaEeowwciU5Ve2wMYj8H+g5D0Vj1L9ldg/cWT
	wivMzkliZHGhQZ2o99tISn3S3nIYhwzsbhcf5F2GU9LT63E2GU6ICYuDVSrrdy+AkgGVBb3JtUh
	T/Cntwe2xVcU8JM65OeGXPH4e1y7tF9rwVnPMx9ILrZIsY181wUd/jkCpa5wQZjSjNPB9GrBVXn
	QWQv8Auij4RC2xy5y2QLq1J5IAMwACsjuOnOdMKdTnW8TtIU4N4unE3IweTvWiVx8Ol+Lumc1te
	ZmCswDzcqdeif0FvX+1HlDjvDB9xw3ESKLBnLX3O4=
X-Received: by 2002:a05:600d:17:b0:47e:e20e:bb9c with SMTP id 5b1f17b1804b1-4835dd89039mr20323065e9.8.1770807463537;
        Wed, 11 Feb 2026 02:57:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836131d4d9sm5222705e9.25.2026.02.11.02.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 02:57:43 -0800 (PST)
Date: Wed, 11 Feb 2026 13:57:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ethan Ferguson <ethan.ferguson@zetier.com>,
	hirofumi@mail.parknet.co.jp
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ethan Ferguson <ethan.ferguson@zetier.com>
Subject: Re: [PATCH 1/2] fat: Add FS_IOC_GETFSLABEL ioctl
Message-ID: <202602111747.QIBXIwpw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210222310.357755-2-ethan.ferguson@zetier.com>
Message-ID: <20260211105739.Fk4TGKJjZpMYKPnBWgAjgT0FfuIa2Nyfel2g6-2H9Rs@z>

Hi Ethan,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Ethan-Ferguson/fat-Add-FS_IOC_GETFSLABEL-ioctl/20260211-062606
base:   9f2693489ef8558240d9e80bfad103650daed0af
patch link:    https://lore.kernel.org/r/20260210222310.357755-2-ethan.ferguson%40zetier.com
patch subject: [PATCH 1/2] fat: Add FS_IOC_GETFSLABEL ioctl
config: riscv-randconfig-r071-20260211 (https://download.01.org/0day-ci/archive/20260211/202602111747.QIBXIwpw-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602111747.QIBXIwpw-lkp@intel.com/

smatch warnings:
fs/fat/file.c:160 fat_ioctl_get_volume_label() warn: maybe return -EFAULT instead of the bytes remaining?

vim +160 fs/fat/file.c

5fc1746d68b8fb Ethan Ferguson 2026-02-10  156  static int fat_ioctl_get_volume_label(struct inode *inode, char __user *arg)
5fc1746d68b8fb Ethan Ferguson 2026-02-10  157  {
5fc1746d68b8fb Ethan Ferguson 2026-02-10  158  	struct msdos_sb_info *sbi = MSDOS_SB(inode->i_sb);
5fc1746d68b8fb Ethan Ferguson 2026-02-10  159  
5fc1746d68b8fb Ethan Ferguson 2026-02-10 @160  	return copy_to_user(arg, sbi->vol_label, MSDOS_NAME);

This should be:

	if (copy_to_user(arg, sbi->vol_label, MSDOS_NAME))
		return -EFAULT;

	return 0;

5fc1746d68b8fb Ethan Ferguson 2026-02-10  161  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

