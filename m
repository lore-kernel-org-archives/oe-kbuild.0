Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6A51DB377
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Aug 2025 06:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754115851; cv=none; b=IQYrlLzyK0q4RFMN3CK3boWytkZdZ5ZI4ZgwpoXxIhn2H6NM9HUARRxkbcYsqMmYoAZWVlZYiKBybDo3Mg4ow+LNjJL8mLwS6A6pXoV4wI+UDyHE8JlJVRsm4I7iDSSi0Y7DSesHx0TeRf3xbyD0SvQp4HSBrQkBSqlXu4l5k+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754115851; c=relaxed/simple;
	bh=Z/lFC3wcE/9vJf+O9rI/pfdUAvrWF0fzNlThTQXrkuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p5woKdJXRfxG0nETueppviagO+WQgeQQxV+kd4q0Xgc2Z7GH+xXm0RjW4Z2d4M4c+R7D9ti99YF8bhRJjRhcH5Qu5RSxSRflwBz1iKMQ+nydYmw6AGSeK2YZoTaG8+M2ssxcLsHoRG9r1CdcIPwXmqgSpG4m924zJl4GyV5I+C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=COaIOCH7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="COaIOCH7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4560d176f97so17609195e9.0
        for <oe-kbuild@lists.linux.dev>; Fri, 01 Aug 2025 23:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754115848; x=1754720648; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JaW6Z9mIwoz4/BLM3SJFes1csza6skaZh9LB6oOgbeE=;
        b=COaIOCH7rCf3TMMJCh4JGiyHYtJvn3XY20ZurPzRp+K5z/VqfgHpKUkJljsUYbWzrz
         spJhlUYhX26Qkdb7xRniz7Me/wKshpfj7Cs192VducSHOgZOkCFsep+lVVNtIFwOcZyM
         9pyAZWGcmT9wvMo+GzbtFU1XBV7CeIb3VLoQ8Vr0Azge6y1leVhkkl1U+Ws4LLcu0bl8
         low5wWGyhYH4gHTpIX+qQxzEnj1rxo2ibAkkRziykd8pZ78mn5ZnzLrZD9lyLPDSohDK
         xCFC8jlH50BbcT6SDCey6DzTLWy5GvG0UCizbAlW/J10p2caDH/6Ch8EW2PsmwTd5rcg
         tabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754115848; x=1754720648;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JaW6Z9mIwoz4/BLM3SJFes1csza6skaZh9LB6oOgbeE=;
        b=oaZV5x0ObG2aspmwNV4zpQwCcFahIAcOfl9d9lkSp5yeLWD0F5HYb8UJNQmj2LrZzx
         f+LiLGIQ6xPT5C6AbAfdf41VfamRRmSY59SaA0qti3SrKv+ZORY0aRglCZK1kAjwyXo3
         F1kHChthsU1HGWS2xzSpwC4NTEWpys6jY5p7XfJtjwolRLQ4RdIzgIi7CTeOO1ONknhJ
         b+Mtbm8rmF6+6hvMX9eZIm/y88SQs4mpAufRVGsXtmQPPFxCS7KTIPb+6/y9V0hSxDgH
         9TvZ+ladaS3PLJDdSW9MBkGrYH52U4/cgUgoPwuCtTxFVEesD02hXYgB1QQZiR6kPdFo
         BMRw==
X-Gm-Message-State: AOJu0YzvduES0x30cO39qPw3IZtUqNSVCQVv7LqDjkAFEzltZTG1eWM1
	zNmw8rnrffS0B5yBdhAg2xNFo8cvI5ekCNWhOSd7rbR6fI8AC7ayQjUEd6gTxtgW2WK5GS5XG2b
	noB19
X-Gm-Gg: ASbGncvnuTH6b8U9+1vAxzGjknb1UH4RvSRknyNZqV3etG8k+HQyn+gieA97T2KHVkT
	HvugB6ryDEG7GABlW30ibZwSVdlECTAzHxhZp4/ORcE78czDlpZ9zINeJ2Cf52DaKsb2hcOcgQF
	q0p3JazVCS2IbLIXSE+/Mev+/2nBdnnSz3Hrw3sN2CKH1wnlayYWTHVZ8a6pBp2eiP1JttGsENx
	rouVXVI6IVhN4+8o3kZBi1bUyV+XtaJAFgteeQIEZcoQe4hJKrbXgRhPmf1K94O0Nm9Yy7RsHQV
	cRG8RitsXsmSasc/JMTw+4qQzlr22Xx2Jy2vhS4J9pY5MhQh+axPY+rTZAinc84RwaywD7L0/d/
	pPf5kntRb32AvWhNzSctrv8bJScY=
X-Google-Smtp-Source: AGHT+IG4kq4B/k0aOy67kcdi2FASS6phoKi/+WMSCcssfYjF9DnttMupTJHXdVJRkNmINvKpdBWMXA==
X-Received: by 2002:a05:600c:6d3:b0:458:aed1:f82c with SMTP id 5b1f17b1804b1-458b719088bmr7653945e9.22.1754115847654;
        Fri, 01 Aug 2025 23:24:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c47ae8esm8050737f8f.61.2025.08.01.23.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 23:24:07 -0700 (PDT)
Date: Sat, 2 Aug 2025 09:24:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, John David Anglin <dave.anglin@bell.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>
Subject: arch/parisc/lib/memcpy.c:44 raw_copy_from_user() warn: if statement
 not indented
Message-ID: <e0a7bc4c-aa14-4326-b2fd-7aae797892ba@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a6923c06a3b2e2c534ae28c53a7531e76cc95cfa
commit: 91428ca9320edbab1211851d82429d33b9cd73ef parisc: Check region is readable by user in raw_copy_from_user()
config: parisc-randconfig-r071-20250801 (https://download.01.org/0day-ci/archive/20250802/202508021047.Mp1T16dT-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508021047.Mp1T16dT-lkp@intel.com/

smatch warnings:
arch/parisc/lib/memcpy.c:44 raw_copy_from_user() warn: if statement not indented

vim +44 arch/parisc/lib/memcpy.c

f64fd180ec2c0b Al Viro           2017-03-24  33  unsigned long raw_copy_from_user(void *dst, const void __user *src,
9e91db6b4abecd Helge Deller      2016-10-06  34  			       unsigned long len)
^1da177e4c3f41 Linus Torvalds    2005-04-16  35  {
91428ca9320edb John David Anglin 2025-07-21  36  	unsigned long start = (unsigned long) src;
91428ca9320edb John David Anglin 2025-07-21  37  	unsigned long end = start + len;
91428ca9320edb John David Anglin 2025-07-21  38  	unsigned long newlen = len;
91428ca9320edb John David Anglin 2025-07-21  39  
360bd6c658076f Helge Deller      2022-02-17  40  	mtsp(get_user_space(), SR_TEMP1);
360bd6c658076f Helge Deller      2022-02-17  41  	mtsp(get_kernel_space(), SR_TEMP2);
91428ca9320edb John David Anglin 2025-07-21  42  
91428ca9320edb John David Anglin 2025-07-21  43  	/* Check region is user accessible */
91428ca9320edb John David Anglin 2025-07-21 @44  	if (start)

Was the if statement accidentally deleted?  Otherwise it should
have been indented and multi-line indents get curly braces for
readability even when they are not required by C.

91428ca9320edb John David Anglin 2025-07-21  45  	while (start < end) {
91428ca9320edb John David Anglin 2025-07-21  46  		if (!prober_user(SR_TEMP1, start)) {
91428ca9320edb John David Anglin 2025-07-21  47  			newlen = (start - (unsigned long) src);
91428ca9320edb John David Anglin 2025-07-21  48  			break;
91428ca9320edb John David Anglin 2025-07-21  49  		}
91428ca9320edb John David Anglin 2025-07-21  50  		start += PAGE_SIZE;
91428ca9320edb John David Anglin 2025-07-21  51  		/* align to page boundry which may have different permission */
91428ca9320edb John David Anglin 2025-07-21  52  		start = PAGE_ALIGN_DOWN(start);
91428ca9320edb John David Anglin 2025-07-21  53  	}
91428ca9320edb John David Anglin 2025-07-21  54  	return len - newlen + pa_memcpy(dst, (void __force *)src, newlen);
^1da177e4c3f41 Linus Torvalds    2005-04-16  55  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

