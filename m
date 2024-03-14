Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD6371723
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Mar 2024 15:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710431220; cv=none; b=fLGXbAE3RSTxJEf1QhwpWU3D5YkNk7nklr84/6vxbnjBvRwFyHwmHj0ldX5PHqXPp9c8LB6qyq4I5fG8ssDG4mVpwFzZMdq4OCuC1WHZaZOLStNtXvQtRbsuPvTuemM5dX8SuhWNL5rb3PeKmMO+qoO6a29BgYVGAz/U2ZUOow8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710431220; c=relaxed/simple;
	bh=sSv1Qf860Ffd9kbhrZtIa9pgrs73h4MVO7THJHIW3uU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TzqiarA3OQ8XQIVuAIPy7hWADmfmHWvM4/HS0okIsrhm+n/PjeLxwTdxKBdr4jJXo35rGKzz0QQ20itNRvDm/fRxi4R55TgEPLxFZqKWY3nxpR3OlT/PmGwoDrlqo/ozbkgA1mkRrOhKBJ8LuVU2tNH03LW6d9Abo6VHiSykVAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YdEQtjNA; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YdEQtjNA"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33e6aca1ca9so826062f8f.2
        for <oe-kbuild@lists.linux.dev>; Thu, 14 Mar 2024 08:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710431216; x=1711036016; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3yW75s8KI/i3d1vlPmclWzYsLJEU6olPxtwFaMdL3eU=;
        b=YdEQtjNA8xfOiNS8qZyrAvxAAoSf2CDf/0Z3NW0s8yg3LYBcFh5kZIBfOMlZUfpCXY
         G3HU54z/jc5EEmGOJBu2Uyhw7+jD+Cp5H3AFrxXC9UbXarCuMhgCvW4BU04CMhLW5jcV
         fKGEKfq0EV0VvlIqmqAJwbRSlb+Yu81gUU7qkMvoaQVc9axq2yC60K+eF4KO6YY+Mlrl
         lInZvAyDpgDkm2yEHI/9d99mba/EwdeeVNOaFqxjwQtG+SZldtK9bdL9F+eDGHt898PD
         2Lik9uUOwc54vzbHrH1fTYIuzBr5W3ITP2bCgkXK1DRP8MnZvegAucykOZKlsInkEyeB
         GzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710431216; x=1711036016;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3yW75s8KI/i3d1vlPmclWzYsLJEU6olPxtwFaMdL3eU=;
        b=HDMLyB3RqxPX+Vil5GOaiLnOfk76i7CY1dyfEBHUPXo7u4BEcdD+SOCvtVTlYLQegQ
         NGXLcFayH90oh52jyGrHaduG82c9H46yqY0vbn4Au426aA3y+c/cOPy1QPrVfQz4s5uo
         REkz8RvyUz+WbrzWOr4bzm4+enbffBXFFgkMH/JBgtlGdbTRCpJOftTxz4jT0RhSkzPb
         +oa4HFOxtPGFpq2UY2jTlhRXEky1VmpUwyIaMXf6GHoSrtEfIhJaJtAafKkLldrCGjUC
         AhtgXPq1nUpKdBRY87m+BNX92RoKGtDPfL/xJzmvDKm9m54r/cjh/FRm7sayLm4eymAr
         ZxIw==
X-Gm-Message-State: AOJu0YzRq6t+ozn4euBDqvakEuT6KhpKkBgVMibHSesq3jn7QkQOrZPB
	WXnQjrJwKXUHObPw9v09M201QadG/jJPHcZfdi2JyypDQfNZxi2kYEtspYCe3lOX4gnmHx/y1G9
	3
X-Google-Smtp-Source: AGHT+IHuGkfhP6LswjK6X24v3iy2Hfu75dhMWCk1YzdRlxR4/+qzy8dcbrlq5R7Th+gUMwHqecl15Q==
X-Received: by 2002:a5d:45c8:0:b0:33d:7e9e:4eb with SMTP id b8-20020a5d45c8000000b0033d7e9e04ebmr1687198wrs.12.1710431216271;
        Thu, 14 Mar 2024 08:46:56 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id w16-20020adff9d0000000b0033ec7e71178sm1019149wrr.77.2024.03.14.08.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 08:46:56 -0700 (PDT)
Date: Thu, 14 Mar 2024 18:46:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-recvsend-bundle 16/16]
 io_uring/io_uring.c:2878 io_mem_alloc() warn: 'ret' is an error pointer or
 valid
Message-ID: <ce235fec-0ad9-4d13-a92d-3bba53847793@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-recvsend-bundle
head:   57fd6bfcfb482b2e57219118e3a9a2c0c95b0f45
commit: 57fd6bfcfb482b2e57219118e3a9a2c0c95b0f45 [16/16] io_uring: alloc ring memory as a compound page, if possible
config: i386-randconfig-141-20240314 (https://download.01.org/0day-ci/archive/20240314/202403142336.zEgQS4hl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202403142336.zEgQS4hl-lkp@intel.com/

New smatch warnings:
io_uring/io_uring.c:2878 io_mem_alloc() warn: 'ret' is an error pointer or valid

vim +/ret +2878 io_uring/io_uring.c

469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2860  void *io_mem_alloc(struct page ***out_pages, unsigned short *npages,
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2861  		   size_t size)
b9bd2bea0f22f5 fs/io_uring.c       Pavel Begunkov 2021-08-09  2862  {
73572984481907 io_uring/io_uring.c Jens Axboe     2022-06-13  2863  	gfp_t gfp = GFP_KERNEL_ACCOUNT | __GFP_ZERO | __GFP_NOWARN | __GFP_COMP;
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2864  	struct page **pages;
57fd6bfcfb482b io_uring/io_uring.c Jens Axboe     2024-03-13  2865  	int nr_pages;
e27cef86a0edd4 io_uring/io_uring.c Jens Axboe     2021-11-05  2866  	void *ret;
b9bd2bea0f22f5 fs/io_uring.c       Pavel Begunkov 2021-08-09  2867  
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2868  	nr_pages = (size + PAGE_SIZE - 1) >> PAGE_SHIFT;
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2869  	pages = kvmalloc_array(nr_pages, sizeof(struct page *), gfp);
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2870  	if (!pages)
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2871  		return NULL;
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2872  
57fd6bfcfb482b io_uring/io_uring.c Jens Axboe     2024-03-13  2873  	ret = io_mem_alloc_compound(pages, nr_pages, size, gfp);
57fd6bfcfb482b io_uring/io_uring.c Jens Axboe     2024-03-13  2874  	if (ret)
57fd6bfcfb482b io_uring/io_uring.c Jens Axboe     2024-03-13  2875  		goto done;
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2876  
57fd6bfcfb482b io_uring/io_uring.c Jens Axboe     2024-03-13  2877  	ret = io_mem_alloc_single(pages, nr_pages, size, gfp);
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13 @2878  	if (ret) {
                                                                            ^^^
if (!IS_ERR(ret)) {

57fd6bfcfb482b io_uring/io_uring.c Jens Axboe     2024-03-13  2879  done:
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2880  		*out_pages = pages;
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2881  		*npages = nr_pages;
e27cef86a0edd4 io_uring/io_uring.c Jens Axboe     2021-11-05  2882  		return ret;
469421fb116f26 io_uring/io_uring.c Jens Axboe     2024-03-13  2883  	}
57fd6bfcfb482b io_uring/io_uring.c Jens Axboe     2024-03-13  2884  
57fd6bfcfb482b io_uring/io_uring.c Jens Axboe     2024-03-13  2885  	return NULL;
73572984481907 io_uring/io_uring.c Jens Axboe     2022-06-13  2886  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

