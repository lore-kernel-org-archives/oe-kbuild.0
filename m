Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC0E14A4F7
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Oct 2024 19:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728156622; cv=none; b=t4EDp69Ts6lD/dqvVK5tKKDRGn3HXC1Q7KLzVJN7Ot3cb1HbbhdPLpbEhLx8HVH+wqcQaYgje45lNPGxmSfYl/h23s9AAoKNod1vSWkeblSgoJJKpO3gr6BBdr8NzGQPL0ssG47Bfnrr4pzmSwV0h/H4kf+FQKtB77w1T5hrPrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728156622; c=relaxed/simple;
	bh=zXwfvmJApLD9tnOzOuIJ7ZIUhfNsrLaaqCjeWXV7Elk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tU8s6/6InCtDX2hfSl4/M9lH9IQnfXLo9nkbo+k2/vXhULlbuSSq0+jkQ743tkotcYzDUKf0nimICVqX85axtnEemaKbnnAnC0P8S9qxzdMxrYqNqjZdmNUGarXppD9UkDz5wi+MVEzf0ibA+0b5d9lR0Xw0hWLMTMHFpfhD0EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=THJsO73R; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="THJsO73R"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20b01da232aso25485355ad.1
        for <oe-kbuild@lists.linux.dev>; Sat, 05 Oct 2024 12:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728156618; x=1728761418; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2mCkEtcNei0RywUlinCjtM9b0gDURZfM0UOxs82SjYE=;
        b=THJsO73RlfFlQDCZ+XrG0Y9IDE/Jley8hNKJv/ToSgEprDcz05AAnbu8aiY+GoZPoP
         +nH2FvKwfJSrWu2tRQ82Y4wUSa03WtaLvYYFGHzq3Yp6Bz0El3C6nTOM02603X6Gk1IK
         VAML79NDvokqXSC+SFIJuL3ZcDyfgnYAH1fhGW6KzvHWtl3G3EoQg05ZLwivSBKiHIle
         OxiWCkcjnp12mcVUhTlM4mqFgeNDKsKEb/KeRWg52JJLw4MA8wNLusmFtiW2jUwhVfyA
         68BSGkRcA2LeWRg1KaQVldbULgznS7SD6uRXEWDap/gt7qYZges9rqelW0Nr5soXbzVV
         HnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728156618; x=1728761418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mCkEtcNei0RywUlinCjtM9b0gDURZfM0UOxs82SjYE=;
        b=P/ff7qblCe8pCF4o/R7ofWqvU6fKnkVpuaJCPOWuUJcGR+rTjBIi+B7VhniWRbd7l0
         vxoQUmg5HbBX2fNp/wFEeQcXpUB+E4UwAeRUX2ErUCkjrLOejFMQNGGhtTumahh16X4Q
         TUdTZ887pt0HVzPu5k7FdaEAovsiM/BJMsZr9RUVUrJkl540yk1syW9vCIAldto8V0/2
         xps96O7TYp9HbcWxEHU63EAsgV3m0ulxbHzWMFGiOnGzbbz5f6+PA3WRfVApC180DNyq
         SgkAhsY0NlsRhfvAmzlyRTwZOMypJtx3oRuL8KoGFulGeldBawG/5tP0q3tu3fYe4NwD
         7tWA==
X-Gm-Message-State: AOJu0Yx7iqOsV5zn9/9SIj/rck4iqARPa8X7WRYn4tyhajBUVzrAhGSi
	O1Q8JTQNOW7G12/6hlkMwoopKUNXlFvisqbpzXlV2fiSuQSfXe5CAjT5FZj9EmY=
X-Google-Smtp-Source: AGHT+IEnJr3VbfJgt6Bq6ck7F7NugIDnpMGYJKRaSAWYSIaYNPPuWja5Wzr70A66h9+W+yD0RZ0b9A==
X-Received: by 2002:a17:902:f547:b0:207:794c:ef24 with SMTP id d9443c01a7336-20bff37b1b3mr110878845ad.4.1728156618572;
        Sat, 05 Oct 2024 12:30:18 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1398ac48sm16210815ad.275.2024.10.05.12.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 12:30:18 -0700 (PDT)
Date: Sat, 5 Oct 2024 12:30:16 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/8] pinctrl: Add driver for the T-Head TH1520 SoC
Message-ID: <ZwGTyOBUAppE5WAM@x1>
References: <20240930-th1520-pinctrl-v3-2-32cea2bdbecb@tenstorrent.com>
 <9f76efc9-c9c6-4097-a7a0-80e1b941866d@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f76efc9-c9c6-4097-a7a0-80e1b941866d@stanley.mountain>

On Wed, Oct 02, 2024 at 06:54:48PM +0300, Dan Carpenter wrote:
> Hi Drew,
> 
> kernel test robot noticed the following build warnings:
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Drew-Fustini/dt-bindings-pinctrl-Add-thead-th1520-pinctrl-bindings/20241001-035421
> base:   9852d85ec9d492ebef56dc5f229416c925758edc
> patch link:    https://lore.kernel.org/r/20240930-th1520-pinctrl-v3-2-32cea2bdbecb%40tenstorrent.com
> patch subject: [PATCH v3 2/8] pinctrl: Add driver for the T-Head TH1520 SoC
> config: s390-randconfig-r072-20241002 (https://download.01.org/0day-ci/archive/20241002/202410022336.xyWlV0Tf-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202410022336.xyWlV0Tf-lkp@intel.com/

I put these tags in the patch I'm about to send but I get this
checkpatch warning:

-----------------------------------------------------------
WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report
#9:
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>

total: 0 errors, 1 warnings, 7 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

Commit 8d7cdbc31c9f ("pinctrl: th1520: Fix return value for unknown pin error") has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.
-----------------------------------------------------------

If I remove the first Reported-by, then checkpatch no longer complains.

Am I missing something?

Thanks,
Drew
