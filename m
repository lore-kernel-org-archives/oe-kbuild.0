Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A51D23AB
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Oct 2024 05:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728279044; cv=none; b=KDEMM9+sEah5IPwcmlY/vLFJDNmaQ5pI04yb+uWMw5wjjIMMmHIkHUbmJ8lAoAZ8uUP5gfgZyii5FYXgQY7RM+FRP/AHO1e2EliphMd99a7W+eZ6U5Fr0bEwCYWuYBqMYPnVdBJyeQ2XHQap1rHluj+em7Q8t725TTFeNQbaEm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728279044; c=relaxed/simple;
	bh=61/XHsZ1jopf5NYw7UwLjUO8TPJmLxd7e7ifHWlBgCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOw+8ZmH4UpmEeGxDZgcNUKY79E5S7psnxGlK71mdn3JGqkRzkvmj880L7fzbc26LCggt6fgugWfcfuTVsMCG0X9z7a8N6Tr3PWwPS1Evex6aY/TbL3G2rE4pXPGYs/OXl8ovifAUgIgIliPZeoMjspM17kbN7HCa/OSN1hJeOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tY91Gt2j; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tY91Gt2j"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cb806623eso35662145e9.2
        for <oe-kbuild@lists.linux.dev>; Sun, 06 Oct 2024 22:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728279040; x=1728883840; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o6L3wlCulCIZNXp2nhC0ahsNA3//0FQzh25y5h+mTbQ=;
        b=tY91Gt2jVY0ihLnzBa8UwNb7tZ1CDkHsFudtT577ry6DYSJtTE7a2BMKabH18wL6UP
         IaJrXsZphdRdU5psS8GG5ZPyOuRNcPZUfwDvsOjaC50EyxFl3lhuM0R8KqE6I977XgW7
         zMU0Pof50cirmpV5A+2DcVWPB0MceqMKXzaFzTAuXAPWYxyYvSdDl13PXW7xrQtZr/o/
         /UAYvWyAgme3akqJ2C1ihEDT7slqcCDamUZepSKNWf+RrO7lCIG5LFWf7Ou+KryTcuJV
         DFKb9x7K9AmX0T85l3EObPNQ+7QOSwCthUEAnOFoa8YPf3qcVs7TjrhoYAtgXBACv/cG
         Pr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728279040; x=1728883840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6L3wlCulCIZNXp2nhC0ahsNA3//0FQzh25y5h+mTbQ=;
        b=eXgNafbKFpR01i1tbt5R6Sqo2qz3xNjLJ95tCLlA177J62jzR5EZ+OxUzlbDPTPcU7
         t82GtwHk/OOzxDuElSExqgstWxhGiMiMcx1dkEonZyK5sYWJy47545fHqYvyuJZjf9Qg
         16a6MUj+36FfNSVx9cn/LfgSoHtvUiqqj/OwEY7n2Gx88EMMj8zU4Pyxn6OjOw3g1usd
         juIKinw3MCU939qV88Id0h2yGx9elYedHA+oDNgYtM7M/siXZw90xRp+t3KNgXnGqzS3
         0ncKX/c7ue3+tYOGPR7wIDoRsFl0N0pkOF5oVfxwqIihFaHIdn3JauofuEWI47XexP1P
         XFKw==
X-Gm-Message-State: AOJu0YykRjDl9FBUgdfaOLNPXtiP/GQLhim3m7KVGe1YhAa8yR32q7Q+
	aiY/L4+jqrit1BH45z2OFndIgEFQan67i38U1UAYbf+z97JhVvQl8bAhuJV/2Wc=
X-Google-Smtp-Source: AGHT+IEZ90bHngHVwoQKHkLzmfhGD8UpyENEYH+9iVQjSdoASN9U4OqWs1lk4tSsee4VK9TMar3thQ==
X-Received: by 2002:a05:600c:1907:b0:42c:bb96:340e with SMTP id 5b1f17b1804b1-42f85af89ebmr77791015e9.31.1728279039828;
        Sun, 06 Oct 2024 22:30:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f89eaabd0sm63666035e9.24.2024.10.06.22.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 22:30:39 -0700 (PDT)
Date: Mon, 7 Oct 2024 08:30:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/8] pinctrl: Add driver for the T-Head TH1520 SoC
Message-ID: <ecb31065-6d66-4295-b3ba-73e26b62dcaf@stanley.mountain>
References: <20240930-th1520-pinctrl-v3-2-32cea2bdbecb@tenstorrent.com>
 <9f76efc9-c9c6-4097-a7a0-80e1b941866d@stanley.mountain>
 <ZwGTyOBUAppE5WAM@x1>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwGTyOBUAppE5WAM@x1>

On Sat, Oct 05, 2024 at 12:30:16PM -0700, Drew Fustini wrote:
> On Wed, Oct 02, 2024 at 06:54:48PM +0300, Dan Carpenter wrote:
> > Hi Drew,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Drew-Fustini/dt-bindings-pinctrl-Add-thead-th1520-pinctrl-bindings/20241001-035421
> > base:   9852d85ec9d492ebef56dc5f229416c925758edc
> > patch link:    https://lore.kernel.org/r/20240930-th1520-pinctrl-v3-2-32cea2bdbecb%40tenstorrent.com
> > patch subject: [PATCH v3 2/8] pinctrl: Add driver for the T-Head TH1520 SoC
> > config: s390-randconfig-r072-20241002 (https://download.01.org/0day-ci/archive/20241002/202410022336.xyWlV0Tf-lkp@intel.com/config)
> > compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202410022336.xyWlV0Tf-lkp@intel.com/
> 
> I put these tags in the patch I'm about to send but I get this
> checkpatch warning:
> 
> -----------------------------------------------------------
> WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report
> #9:
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> total: 0 errors, 1 warnings, 7 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or --fix-inplace.
> 
> Commit 8d7cdbc31c9f ("pinctrl: th1520: Fix return value for unknown pin error") has style problems, please review.
> 
> NOTE: If any of the errors are false positives, please report
>       them to the maintainer, see CHECKPATCH in MAINTAINERS.
> -----------------------------------------------------------
> 
> If I remove the first Reported-by, then checkpatch no longer complains.

You can always ignore checkpatch.  It's just a script, not an emperor.

regards,
dan carpenter

