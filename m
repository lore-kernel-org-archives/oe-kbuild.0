Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4183F9C5
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Sep 2025 18:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757616942; cv=none; b=X+ZIyjP/jzkcq8NvDojJso78lLqcfoHSyYkCJQ8vWuJrXm8d1MMJyHczXZJJi5EobpGVUIwHssT+OFMBNKKL0IzTacOvAhaRSGjYjZXKoOhFm028EkIsMgxeronQ9LyKCikBZBcjaU0pjHIlkAZN3BIo10UJMUkXEd2UVYQPlH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757616942; c=relaxed/simple;
	bh=lzd6NtgHgkyDSLWMrj81lFHwBZJAe5JfV+GPhZaKTV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aXyPQPWm3KAP3OsnyGzicvLfZ6wvRk8yXsoHtauD0NtUDU7AOLFhkcNduAlsh4JQcFopb22bxOHY0copcF1kBMa3UYayvJbMMOVtYin+140FPfN4Fr/j9UVAjLimr9OTuhXzLDFxFehRA6Ns0MZUQST5kBPeptK8r2pR6t5Ngkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eujxYCtw; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eujxYCtw"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3e4b5aee522so748590f8f.1
        for <oe-kbuild@lists.linux.dev>; Thu, 11 Sep 2025 11:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757616939; x=1758221739; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=on1LxH3XCPAWDrhUZ5T3eqLBDppv1GkqfxuP4NdAa8M=;
        b=eujxYCtwE8e1+PIftn2rYH8Wqs8ZEQQcNgMOo7wafTzwGysrWe52TKJccLoWhcYQDP
         5j8v67XbWILERYCnE3ryM6dEg2c3ARO4w25AG1DS222bqZp0rExdbCDGVXZEGUNDRfkw
         36pMHJ01J71fwzML3eepd1HZ0jNeTW/GSo0O2lDO0qEapnP94LsQDWAceAcb2xEkstHt
         jH+3eOCfXQtAn4siXT/f8tk+ks/5hsGvQ4lpse5kM6ZjFVJU6JLoUnXPZXU4WVNaFI9g
         tVRq8Ns2aERUVgWaCCbsQ78NfrYp0nigZo+my08U0G3BQSnuwtqq1T35QVPmqzWzYntH
         0opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757616939; x=1758221739;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=on1LxH3XCPAWDrhUZ5T3eqLBDppv1GkqfxuP4NdAa8M=;
        b=eXXzQ+SUdw9oG/UgT/FfPDaTEnBgZjO88kerU+yiz69koCJw9mu2h5UJHRlfX/UR8Y
         VH3ovJRaQFyWmynD6mz88SSl5eb0ys2GCkOb3naQcfVO4xfeA3G8nzXDcJtW/OK/se/R
         esj2fUbH2UR3WNGpZwnh1cmlc8jncgzprS7wRxIzALIoJGexI3Fjbgw7l79JBteGUXCh
         LWmPDP7hZCmffPsZE+lYBLOHyDOMRHYEPeo/1xzk3YP4L7H/JTO80CjtVWvxwbvITakw
         RAdLH6DoU47T5wvQ0xoOUnAn1w31AdXFlfIBz6TxFobBTTnm+E/n5z5jbQuqt8U4+q6u
         onZw==
X-Gm-Message-State: AOJu0YxvmdO6d8I438cSyGjo7157ugE9bAPndobTPZCEIF8E2osIdyVJ
	21+e1ZEvs151FdnVSvIHjn3aiHiQJ+BiCWa0hfkS2oWdX6hsJvMuz8kZIZDVh+9PRc0dTnoDbKD
	jcbwY
X-Gm-Gg: ASbGncvPBpEq1cNz+ua0Yzl1enRqh0dONTeNF1RypIJOmWYtCQC6HhDD4KXtxSszPF/
	4MPF6MeohouyV5/NnjI7EYeEMq5QoVJ8/UylsjJsxqkL/KpCmT0swi0KKuW2HZc+zCfmNjtgBtu
	hUWyotgGBm3CQHFHIqdGhoZwNMitXr2sGuVq8ZxxrLQtkSLRK87j0HWq6O/D+LXiy0xL8Y7AaEu
	elwRNb9x1R5W/DdNXhCWWMVRQbVejnozMqP/+onYEbCBDnbJro8rG86Vcsnx7jiC/w1e6fECXkH
	7I0C8S5Ih9IO0tQA99obOTjAIxeuKC+hFzhlnFMC1eXkTHITXdiL7DN/oWbQkMl9Xbn+jVDEyZ8
	meSbVzOuRgFRjwrYqfmexu7DH+C4=
X-Google-Smtp-Source: AGHT+IGCbd5+C0lvF6hqq/A2SzFcoSrAVnxQ2N0dbWUUQ2bfNAxuGp4CbA4bM8Qe1/rPncZRiMsPyw==
X-Received: by 2002:a05:6000:1a86:b0:3e7:490c:1b2 with SMTP id ffacd0b85a97d-3e7659c4d6dmr335557f8f.36.1757616939077;
        Thu, 11 Sep 2025 11:55:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e7607cd415sm3403567f8f.30.2025.09.11.11.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:55:38 -0700 (PDT)
Date: Thu, 11 Sep 2025 21:55:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 8010/8263] io_uring/query.c:98 io_query() error:
 uninitialized symbol 'ret'.
Message-ID: <202509120150.hzd9vw51-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250911185534.nwLvpJ5U5N13GribWux_6VzwaV_cK_qzWC7ZfCXLNMY@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8f21d9da46702c4d6951ba60ca8a05f42870fe8f
commit: d9b7dbb7f34aa7a8485fd39ffe4bba65e20692cf [8010/8263] io_uring/query: check for loops in in_query()
config: x86_64-randconfig-161-20250911 (https://download.01.org/0day-ci/archive/20250912/202509120150.hzd9vw51-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509120150.hzd9vw51-lkp@intel.com/

smatch warnings:
io_uring/query.c:98 io_query() error: uninitialized symbol 'ret'.

vim +/ret +98 io_uring/query.c

c265ae75f900ce Pavel Begunkov 2025-09-08  76  int io_query(struct io_ring_ctx *ctx, void __user *arg, unsigned nr_args)
c265ae75f900ce Pavel Begunkov 2025-09-08  77  {
c265ae75f900ce Pavel Begunkov 2025-09-08  78  	char entry_buffer[IO_MAX_QUERY_SIZE];
c265ae75f900ce Pavel Begunkov 2025-09-08  79  	void __user *uhdr = arg;
d9b7dbb7f34aa7 Jens Axboe     2025-09-10  80  	int ret, nr = 0;
c265ae75f900ce Pavel Begunkov 2025-09-08  81  
c265ae75f900ce Pavel Begunkov 2025-09-08  82  	memset(entry_buffer, 0, sizeof(entry_buffer));
c265ae75f900ce Pavel Begunkov 2025-09-08  83  
c265ae75f900ce Pavel Begunkov 2025-09-08  84  	if (nr_args)
c265ae75f900ce Pavel Begunkov 2025-09-08  85  		return -EINVAL;
c265ae75f900ce Pavel Begunkov 2025-09-08  86  
c265ae75f900ce Pavel Begunkov 2025-09-08  87  	while (uhdr) {

This comes from the syscall so it could be NULL at the start.

c265ae75f900ce Pavel Begunkov 2025-09-08  88  		u64 next_hdr;
c265ae75f900ce Pavel Begunkov 2025-09-08  89  
c265ae75f900ce Pavel Begunkov 2025-09-08  90  		ret = io_handle_query_entry(ctx, entry_buffer, uhdr, &next_hdr);
c265ae75f900ce Pavel Begunkov 2025-09-08  91  		if (ret)
d9b7dbb7f34aa7 Jens Axboe     2025-09-10  92  			break;
c265ae75f900ce Pavel Begunkov 2025-09-08  93  		uhdr = u64_to_user_ptr(next_hdr);
d9b7dbb7f34aa7 Jens Axboe     2025-09-10  94  		/* Have some limit to avoid a potential loop */
d9b7dbb7f34aa7 Jens Axboe     2025-09-10  95  		if (++nr >= 1024)
d9b7dbb7f34aa7 Jens Axboe     2025-09-10  96  			break;
c265ae75f900ce Pavel Begunkov 2025-09-08  97  	}
d9b7dbb7f34aa7 Jens Axboe     2025-09-10 @98  	return nr ?: ret;
                                                             ^^^
leading to an uninitialized "ret" variable.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

