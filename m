Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD7E2FFF91
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Dec 2025 11:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764848519; cv=none; b=bAFwNVDEGfW+1S9gk/KHmAv6KkKSZlQivwUGhTtXm7ljJy8zN+2ViZeItS1WFe8CFVJvFDBt3AkmzTx1XnDvmIazKYGyq1PP58A87di0+zlQniFtM70gsv4dDSEqShT7uij4dRfgY1jrt833UG4sYD/GkVHW0qBlzMzX7PEx3eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764848519; c=relaxed/simple;
	bh=5RK6tht8FvsF1cAX1TgQDpbJNcrpK+NgBtfzZGZoOvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gCl8oEnuByvtgsx91sFyzP8yvuAz0qEhfX3RdzhakJfprqVNwPH1WuZMWBlBh+/HiWl5iBcKUYBVPt9lbtEahcNLXxrDOuQdOmp7Ku9DS+4zNTrrSNYXzMy9wXvrLZSG0uJPmD/bljPPw5wYfWdEBERcnsKSDOvVv31juo3iLIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ps6eb7VT; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ps6eb7VT"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42e2b78d45bso407797f8f.0
        for <oe-kbuild@lists.linux.dev>; Thu, 04 Dec 2025 03:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764848515; x=1765453315; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kjFhVVOEQY6uhoEI6giKaJgk6vc37uTqDkTp4AaJoWE=;
        b=ps6eb7VTZNHqTQ6gW+f0f9R9E9AS2OwnVs3CgeBsuEujawFQGAsya5cn+iz1sss5/v
         hbfyt4MvB+xmrv7bY1DQPZjsFGOsnfmtKLlehEpU67zqv/mNSI/pLftdCypXGjG2sm7w
         d+mzl244Y6UkwCEaD4km0stSsoPUUQPHCqHPjH8pgDwFKM1KH//RnJYOELoKPM8VoM6b
         x0GGz3PdAn5wtV9Unpiy+8lg2N//iQ4qgHt185GKi/NnVhvCbS1175td1QaN5wfk87BJ
         WprJZWXCRMiVGwAomvD9W2GDmNljSI2hF3+CcpWNHf4cHrXCvum5MK8E8rWKymRC4MUt
         okWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764848516; x=1765453316;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjFhVVOEQY6uhoEI6giKaJgk6vc37uTqDkTp4AaJoWE=;
        b=GoW9Yu6Fgd/87HNn836vwYrQOwCI8TwwX/DOhEb76xB3XlJugMJf2hU8kirWZVKgtD
         DMr5KKgAVvxf4W+Ch3sQ6rPgUll3MYLww9CUzJSZV/zqmt130GXUteUhnQlT+DaJ6RU/
         Yz9UruxcRNvM0D1MEmes9fxM1x9nZTPJEGiNDz8Shkbc52ViDG6OVVOhge2L+kCK57V9
         SKEKcMmRcHMuCBvOeMsGCeYCZzsLoowRiObkPLGYuEnutkjP5q3LENQs1Ls9GWtAtyjl
         ThvyT1lObBaVQ855MsMcaAEk6UqHRWw/XZ6U86v6z0E6DSyoRwNgFPI/dNnp9GpbpTQN
         Uy/w==
X-Gm-Message-State: AOJu0YxRz6qGyUZEP+YbHTKK+Tg6oo/O+4RG7NsTOq3qFozKpylSGnFe
	hKPTXm8PRtvI+HSbWt3O07/E681uwYiLVSGP+XGd853Xa/kndREPEuVQJIGpt92OK0T/DQrrYQd
	pQUUH
X-Gm-Gg: ASbGncv66XzIdzz+7DrIOZ3KaXCdofjLqbGbTnssvB/QEXfB/uNBGA7X+e3nTDs/TkG
	WZwcLVXw0DkkJThvAPzgTYd4zJsSPU4s5oUFaVRb4kmdWmx60v+L5arKsmooKaa7NIqyVFpJQyU
	DCqEr7EUwvAprhM5JPGrMU5ZworiqANMLlPLTQWOGdebCRKR5LMRVG/cfV5fGEAA1ZJoCFBs+KT
	lF2FFaetkHWf2g2bkg+01nf6+dFtMmgCq27lzJPPWAo8eJ3vHrKCi3LpYcqMy40BWZSC1236ccp
	Qr+MfD74tWZX0J2fsS3um4eCln+1GybeejXUGoPs1iUXs+TVjJ35+SnJMSwNp6NvFddBX9yM8Yz
	FLepE9qTsixAHueyHORd5QUooW2kGdH+r8SYXlRcm5Ecl+esWptf/iGWFJulidwtxMpH+Wnl499
	cTJjt33iTCLk2Nh9m2882h6j5TlcbnzUbG2Hz3GM82VTNjbNs=
X-Google-Smtp-Source: AGHT+IEOaAmw28t0tTl5hVeX2Mum9jtXSSUj4P5msGdFfKzt/vfxMyF8KUN/tmW3mGxNhYt7HmFFGQ==
X-Received: by 2002:a05:6000:3112:b0:427:854:770 with SMTP id ffacd0b85a97d-42f731c2baamr5972162f8f.43.1764848515445;
        Thu, 04 Dec 2025 03:41:55 -0800 (PST)
Received: from localhost (h1f65.n1.ips.mtn.co.ug. [41.210.159.101])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7d331a4fsm2856951f8f.33.2025.12.04.03.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 03:41:54 -0800 (PST)
Date: Thu, 4 Dec 2025 14:41:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 5/5] fs/f2fs/super.c:412
 f2fs_printk() error: we previously assumed 'sbi' could be null (see line
 405)
Message-ID: <202512041824.Rr334IOp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251204114151.5y3KpdTjDn9IeMkzkZHUVxQcoG-1_KUnFvrIbfHPRwY@z>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   ef2f661f7812939553f0ae21dbc880750b09a1c8
commit: 1444d806aafbff95eed142f5fdfe178c3541c889 [5/5] ANDROID: vendor_hooks: add hooks for f2fs_printk
config: i386-randconfig-141-20251204 (https://download.01.org/0day-ci/archive/20251204/202512041824.Rr334IOp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512041824.Rr334IOp-lkp@intel.com/

smatch warnings:
fs/f2fs/super.c:412 f2fs_printk() error: we previously assumed 'sbi' could be null (see line 405)

vim +/sbi +412 fs/f2fs/super.c

b1c9d3f833ba60 Chao Yu     2024-01-26  385  void f2fs_printk(struct f2fs_sb_info *sbi, bool limit_rate,
b1c9d3f833ba60 Chao Yu     2024-01-26  386  					const char *fmt, ...)
a07ef784356cf9 Namjae Jeon 2012-12-30  387  {
a07ef784356cf9 Namjae Jeon 2012-12-30  388  	struct va_format vaf;
a07ef784356cf9 Namjae Jeon 2012-12-30  389  	va_list args;
dcbb4c10e6d969 Joe Perches 2019-06-18  390  	int level;
a07ef784356cf9 Namjae Jeon 2012-12-30  391  
a07ef784356cf9 Namjae Jeon 2012-12-30  392  	va_start(args, fmt);
dcbb4c10e6d969 Joe Perches 2019-06-18  393  
dcbb4c10e6d969 Joe Perches 2019-06-18  394  	level = printk_get_level(fmt);
dcbb4c10e6d969 Joe Perches 2019-06-18  395  	vaf.fmt = printk_skip_level(fmt);
a07ef784356cf9 Namjae Jeon 2012-12-30  396  	vaf.va = &args;
b1c9d3f833ba60 Chao Yu     2024-01-26  397  	if (limit_rate)
19c4b380f23e5a Hongbo Li   2025-07-10  398  		if (sbi)
                                                            ^^^

b1c9d3f833ba60 Chao Yu     2024-01-26  399  			printk_ratelimited("%c%cF2FS-fs (%s): %pV\n",
b1c9d3f833ba60 Chao Yu     2024-01-26  400  				KERN_SOH_ASCII, level, sbi->sb->s_id, &vaf);
b1c9d3f833ba60 Chao Yu     2024-01-26  401  		else
19c4b380f23e5a Hongbo Li   2025-07-10  402  			printk_ratelimited("%c%cF2FS-fs: %pV\n",
19c4b380f23e5a Hongbo Li   2025-07-10  403  				KERN_SOH_ASCII, level, &vaf);
19c4b380f23e5a Hongbo Li   2025-07-10  404  	else
19c4b380f23e5a Hongbo Li   2025-07-10 @405  		if (sbi)
                                                            ^^^
The existing code assumes sbi can be NULL

dcbb4c10e6d969 Joe Perches 2019-06-18  406  			printk("%c%cF2FS-fs (%s): %pV\n",
dcbb4c10e6d969 Joe Perches 2019-06-18  407  				KERN_SOH_ASCII, level, sbi->sb->s_id, &vaf);
19c4b380f23e5a Hongbo Li   2025-07-10  408  		else
19c4b380f23e5a Hongbo Li   2025-07-10  409  			printk("%c%cF2FS-fs: %pV\n",
19c4b380f23e5a Hongbo Li   2025-07-10  410  				KERN_SOH_ASCII, level, &vaf);
dcbb4c10e6d969 Joe Perches 2019-06-18  411  
1444d806aafbff Rui Chen    2025-02-10 @412  	trace_android_vh_f2fs_printk(sbi->s_flag, &vaf, level, limit_rate);
                                                                             ^^^^^^^^^^^
But this code dereferences it without checking.

a07ef784356cf9 Namjae Jeon 2012-12-30  413  	va_end(args);
a07ef784356cf9 Namjae Jeon 2012-12-30  414  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

