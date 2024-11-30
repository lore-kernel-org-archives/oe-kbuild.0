Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08725136E21
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 09:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732960303; cv=none; b=s/CjuMwUw/YCNkttahdTYdkwZ879V0G2Gd0229JGq6Zm0PdcJczzvJ91Y708Gs9QDNepKJcQfuty/wIIq4HEmWi8Y9DHCMN8PJWdqYlmQCXx/qGV0YTFV2s2EYO40BOIHXy5Ynha5XSGYZKkvM7Tdcm5J6wNt2Pygb7ouYHG4tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732960303; c=relaxed/simple;
	bh=kKRrLUcexh83lOiUaUbKCKWvIfIwKmuP8E+WT04gVvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJ+oRcIlWUku+7/K77fuAvGNmLE5R+L9V3teq1z5Q39ELHNUKa+ek18FLH33vIapGlJVnKuWYn5YcSjx3Kv00RBVTvg+jtqEX0GC9Wb78msz4PVC/XdEsS4pEwtJ5GMrdt1vienIKR5ooAMaXTTInrwixp2WvPjkue9kIEk7g6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NXX1Tchk; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NXX1Tchk"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5cf9ef18ae9so6402988a12.1
        for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 01:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732960299; x=1733565099; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rSWtHVu+8YCZ9NtKFC73H5G6nhNqj0VGkVJgF+ZsU5Q=;
        b=NXX1TchkVg5Fh/DhTnCTqik5xl+eiyLs+sTBjGr8/32NA9+xJ494AHKLTVjy3df/Vm
         QeG4f33QX2zy3CFqZbW4kzC3vljbmMKp/QoOKOT9ggFIHbH0G3OTAT4oLMUoVrqb89m5
         6z1nWAmw0y53lZC0psIrYyhVKUdb5SWxDtPdpHVjlg/KiKXdVO6DFqkDNw8R4GMDJAaJ
         8AY4wR2NR2x1EzL5FK51SwksBqXSc0sscVR3wec5GP8w/qLSXlj/IimQvD9URIO55htt
         mPYmg4fc4RwHBW+6xMbsnXgnEFVfV1gvr2s200UOCWo7N1KuUPPVfkXa/uOR4xWOdR5e
         HoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732960299; x=1733565099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSWtHVu+8YCZ9NtKFC73H5G6nhNqj0VGkVJgF+ZsU5Q=;
        b=p86b5V8eOZdvIJE4tdk3SXrJoENEOI6ZHFxp50hr1c3LGZ+IRReQ0tOa1I7Wrq5p/P
         EMZ+w/K02TiarzHettA2kxof6ooMEQRa/OoDRAjvbFbY1GPKLM/WV29mXarraxigEWcG
         X+U6Y3EdBncoGUZbEY7vgBXS3XSL9oNEQHDzzF0bqRov5xJPsMHqfE9zmoYlFcrBrWFc
         BqtIfXMH3A8Z7Xtt8FBGcX3svFpKvilXO9vHC/GY+FYAYcbRZptIZiYaDESPs47JufY5
         b3b6Am87x3aJffeHiWqKF6S5lJMxITwegZlaPr4AhlT3AGKIdJFbLgVJrP6cKk1aQuDd
         GciQ==
X-Gm-Message-State: AOJu0YyJg2Mv8PBM4ktOx9dkRHbX41H98vUrVgzkDErz88CcAUubgw4d
	ImlDpfn9jmlOh3YeNmlilcadgmAEsoyqTh70lrJ4mc5LvL36tpd57w7o7xoXfXN3qFKI/OIfLO2
	PFNCtdQ==
X-Gm-Gg: ASbGncs0cE5y08RFERxygiMeIGp2F68ar3XpdlBpAjFTLB+EuL87gV5z0Vns4x7nJGI
	r7XK3m19w5nqDQrt/0OCRhhnRLkd8er1Vhz6tQ8HCRWo8oTOSQmB0pA8pEI2kSOi729mYO+eHid
	5hMkYrAPGarT7OXpFf6qsnNSFvfAi0b+8NzHtmnDdk12YPW8NHObGFAldtbpOBK6nl+z2LU9olt
	ab1jGgTNzxl7jjvvW7SkXGYyo0FnA1898/xJxCuxzXsYTd8iWg1XnJqE/dwLJRe7lcQV4tu
X-Google-Smtp-Source: AGHT+IHl2HNKLt+8WbRAJWvgG5RXB2PtrE7G/WuljhCmVnYPMsQv3+LZlwwJFg4dwqVFPCttA5FCJA==
X-Received: by 2002:a17:906:9ca:b0:a9a:170d:67b2 with SMTP id a640c23a62f3a-aa5946dcdebmr1151991866b.29.1732960298564;
        Sat, 30 Nov 2024 01:51:38 -0800 (PST)
Received: from localhost (h1109.n1.ips.mtn.co.ug. [41.210.145.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5999731d5sm262574966b.200.2024.11.30.01.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 01:51:38 -0800 (PST)
Date: Sat, 30 Nov 2024 12:51:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Selvin Xavier <selvin.xavier@broadcom.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
	Damodharam Ammepalli <damodharam.ammepalli@broadcom.com>
Subject: Re: drivers/infiniband/hw/bnxt_re/qplib_fp.c:1090
 bnxt_qplib_create_qp() error: we previously assumed 'res->dattr' could be
 null (see line 985)
Message-ID: <cc4ebf9f-0441-4e7a-b979-3680a899c109@stanley.mountain>
References: <38c06486-6a1d-4129-839d-a68e29b21e40@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38c06486-6a1d-4129-839d-a68e29b21e40@stanley.mountain>

Oops.  Sorry for the resend.

On Sat, Nov 30, 2024 at 12:26:41PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   9f16d5e6f220661f73b36a4be1b21575651d8833
> commit: 07f830ae4913d0b986c8c0ff88a7d597948b9bd8 RDMA/bnxt_re: Adds MSN table capability for Gen P7 adapters
> date:   12 months ago
> config: x86_64-randconfig-161-20241122 (https://download.01.org/0day-ci/archive/20241125/202411250359.DWxho9P8-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202411250359.DWxho9P8-lkp@intel.com/
> 
> New smatch warnings:
> drivers/infiniband/hw/bnxt_re/qplib_fp.c:1090 bnxt_qplib_create_qp() error: we previously assumed 'res->dattr' could be null (see line 985)
> 

regards,
dan carpenter

