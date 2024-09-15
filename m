Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542F01C3F38
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Sep 2024 12:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726402731; cv=none; b=cCbefjQt7aq//e6m/XAVWImPv7Kd5A5Mts+J1divPc7BP3Z9GPmcxpiQHjO55CH81SOsWypGWuE8Z3IhhKvFjQT9Rg4EqEEftyRaA/NokdcA62k9PoAKIqhFmO6cyD7xOpiC+VteH+ab3dg811FVaCCzt+A4B8fPR65kLhiY/Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726402731; c=relaxed/simple;
	bh=1/bl2cw9fdXYoDr4dHILLmcOCGTwwQDuO0BjzS1SHaU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Q+oX/N+PDrVwgucff5K+9epQTbt2yxFQs6n211yuQRwEthgkRvOWO1eMp1sYnddsWJN5fgiTD93AFDUvse6Tk5USBogaCHOaNtO76zZ1m3Fq0Dy0yTOH3dHf5zGaqkv98JWQoqGXVByIP7A0To+9KdgOUKCqAHsEjnGoVYcV3jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XRz9LrPx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XRz9LrPx"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso29346985e9.2
        for <oe-kbuild@lists.linux.dev>; Sun, 15 Sep 2024 05:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726402727; x=1727007527; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PUEgg6MsjNS7xvWqYjPRgCJ1K4sv5B4HtikoOQeiwBw=;
        b=XRz9LrPx2CahgevD8j+XxMl0oQ3odj3WtTMTIy5aQKxFgCLtWvzBSAyb1VcpCN6CCK
         vonkqNCd3YUXH2K+VU2NkZAJK2Xa7y2AVpuvJ7wlWcQcy5hfAHmLsgQEBsqJhUtU4dy7
         bVYFpx8ED/1lmvZHkX4+VLZPUFABve9BBHXALRntDCeCHQRyAMddNmafR9+8acv0JHdD
         RP3klMhoFhYztGIRjT0YQvLlS3Wv7KMK5+/ZgUjl2RnwpXu/627s1eKa/HqdtZe9aODP
         HnbJW60Zzr3Ph6a2OdQNIbDK/A7njDaxXQYaFZPfI3+ZOQhlKxnbmwIjwcTfcbXhgE7o
         O95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726402727; x=1727007527;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUEgg6MsjNS7xvWqYjPRgCJ1K4sv5B4HtikoOQeiwBw=;
        b=hXYQfQboqmA6ysmXONX1VVX/ROAsDU30cvSbJNgbKlOjxF9HoYpD1lNN4TBNxJYDX8
         iFgCud+85ZHsmfjU6cp4TYVL1qy28nZN+gWz5rsCVLP/4BVkviZeHZUMsUr5pqX/KwyY
         EVtNqWi9p5C83IEG4Fjk4hwozrZKFzoXeRnTmxG4LXqb5GA0aqON5VcQAlVeq8nXwj7v
         NehkZ9lMWH5c1OoAVR5jTURDWvW2FhTLaKRTGLDKe8PlJbgsemF5cUoXe+dDJrQTdzfL
         R67WmKcDqsmrRVz9YAzGkgU5Fh3q1xiljEDh+gYKoPrrW9HmyGePHtqskfR903xXaqCY
         2iEA==
X-Gm-Message-State: AOJu0Yx42ZX82m+AsPWmk26nR5Z+Wasj+XshaoRTN3los0644EYmjSf5
	dACiUNAodaUbY014XxKdTRO7ZGEsMaWX3vD+ev39k1P4snjWQwJ+GgdDwIAv08qipPu6/1R6cB8
	L
X-Google-Smtp-Source: AGHT+IEkDdYWiyZqNa/vPFXKzwknJPX+bF59SgJO+yB70ZtxtZQVDNj1OCTdzsByclra0404S28cFg==
X-Received: by 2002:a05:600c:3514:b0:42c:bae0:f059 with SMTP id 5b1f17b1804b1-42cdb531943mr88700255e9.5.1726402726631;
        Sun, 15 Sep 2024 05:18:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b194c57sm81208855e9.48.2024.09.15.05.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 05:18:46 -0700 (PDT)
Date: Sun, 15 Sep 2024 15:18:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Josh Poimboeuf <jpoimboe@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 02/11] unwind/x86: Add HAVE_USER_UNWIND
Message-ID: <da94586c-4db1-4450-8fad-7cb3418a9161@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82ef19a767cb75e76a985ecc0d47a39400b4fdf5.1726268190.git.jpoimboe@kernel.org>

Hi Josh,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josh-Poimboeuf/unwind-Introduce-generic-user-space-unwinding-interface/20240914-070619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/82ef19a767cb75e76a985ecc0d47a39400b4fdf5.1726268190.git.jpoimboe%40kernel.org
patch subject: [PATCH v2 02/11] unwind/x86: Add HAVE_USER_UNWIND
config: x86_64-randconfig-r072-20240914 (https://download.01.org/0day-ci/archive/20240915/202409150812.Pg1WBJPn-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409150812.Pg1WBJPn-lkp@intel.com/

smatch warnings:
kernel/unwind/user.c:45 user_unwind_next() error: uninitialized symbol 'ra'.

vim +/ra +45 kernel/unwind/user.c

c970b852d500d4 Josh Poimboeuf 2024-09-14  18  int user_unwind_next(struct user_unwind_state *state)
c970b852d500d4 Josh Poimboeuf 2024-09-14  19  {
c970b852d500d4 Josh Poimboeuf 2024-09-14  20  	struct user_unwind_frame _frame;
c970b852d500d4 Josh Poimboeuf 2024-09-14  21  	struct user_unwind_frame *frame = &_frame;
c970b852d500d4 Josh Poimboeuf 2024-09-14  22  	unsigned long cfa, fp, ra;
c970b852d500d4 Josh Poimboeuf 2024-09-14  23  	int ret = -EINVAL;
c970b852d500d4 Josh Poimboeuf 2024-09-14  24  
c970b852d500d4 Josh Poimboeuf 2024-09-14  25  	if (state->done)
c970b852d500d4 Josh Poimboeuf 2024-09-14  26  		return -EINVAL;
c970b852d500d4 Josh Poimboeuf 2024-09-14  27  
c970b852d500d4 Josh Poimboeuf 2024-09-14  28  	switch (state->type) {
c970b852d500d4 Josh Poimboeuf 2024-09-14  29  	case USER_UNWIND_TYPE_FP:
c970b852d500d4 Josh Poimboeuf 2024-09-14  30  		frame = &fp_frame;
c970b852d500d4 Josh Poimboeuf 2024-09-14  31  		break;
c970b852d500d4 Josh Poimboeuf 2024-09-14  32  	default:
c970b852d500d4 Josh Poimboeuf 2024-09-14  33  		BUG();
c970b852d500d4 Josh Poimboeuf 2024-09-14  34  	}
c970b852d500d4 Josh Poimboeuf 2024-09-14  35  
c970b852d500d4 Josh Poimboeuf 2024-09-14  36  	cfa = (frame->use_fp ? state->fp : state->sp) + frame->cfa_off;
c970b852d500d4 Josh Poimboeuf 2024-09-14  37  
c970b852d500d4 Josh Poimboeuf 2024-09-14  38  	if (frame->ra_off && get_user(ra, (unsigned long *)(cfa + frame->ra_off)))
c970b852d500d4 Josh Poimboeuf 2024-09-14  39  		goto the_end;

ra not initialized on else path.  Just do "= 0".  These days the compiler is
going initialize everything to zero anyway.

c970b852d500d4 Josh Poimboeuf 2024-09-14  40  
c970b852d500d4 Josh Poimboeuf 2024-09-14  41  	if (frame->fp_off && get_user(fp, (unsigned long *)(cfa + frame->fp_off)))
c970b852d500d4 Josh Poimboeuf 2024-09-14  42  		goto the_end;
c970b852d500d4 Josh Poimboeuf 2024-09-14  43  
c970b852d500d4 Josh Poimboeuf 2024-09-14  44  	state->sp = cfa;
c970b852d500d4 Josh Poimboeuf 2024-09-14 @45  	state->ip = ra;
c970b852d500d4 Josh Poimboeuf 2024-09-14  46  	if (frame->fp_off)
c970b852d500d4 Josh Poimboeuf 2024-09-14  47  		state->fp = fp;
c970b852d500d4 Josh Poimboeuf 2024-09-14  48  
c970b852d500d4 Josh Poimboeuf 2024-09-14  49  	return 0;
c970b852d500d4 Josh Poimboeuf 2024-09-14  50  
c970b852d500d4 Josh Poimboeuf 2024-09-14  51  the_end:
c970b852d500d4 Josh Poimboeuf 2024-09-14  52  	state->done = true;
c970b852d500d4 Josh Poimboeuf 2024-09-14  53  	return ret;
c970b852d500d4 Josh Poimboeuf 2024-09-14  54  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

