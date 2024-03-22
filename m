Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76015C8DE
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Mar 2024 06:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711090060; cv=none; b=KxsnDkJTQr1HahaxdVIXa2fdVL5z/p3Yh8eZQNWDrKDXiD3kWUNoJ1GeV7rZ7ARbGA8ZnCpN6CcIfKEOL0kD7FsyKBw5305Kn4RzvUXTu/22B2EMgCiqvb81qAye7gyKjZgCnRXd1QzFd7/kCxbzqJFx4J9pLfBnkrA34ZH3pyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711090060; c=relaxed/simple;
	bh=gFqZU16vxxTe/zJ27a7yIc0LkX9tywZjiOiwWzvDfhc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CeqoPMrwUUSetRUh759DmZkzLO1rZ/87KDsE2AxZAUFlN612wOhT7p0lSjWQARxOCjXK0wCb5ZjP7pOSL+3HCtf3RX8Avi40BtbiffD9tZ6UtmYNDfOcGnFdSn+1CW3a5R7VwZ/tVIk7y2X0gBmdJei+xo0EeGKN8nEFvvXTbZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TKop6giQ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TKop6giQ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-341b9f6fb2eso29033f8f.2
        for <oe-kbuild@lists.linux.dev>; Thu, 21 Mar 2024 23:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711090056; x=1711694856; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TUy1pUFZGRZWiaEeg2Zv5YdnBWiyjqTrFVitFmUSYsE=;
        b=TKop6giQXR49ZiIwzByCqY0MOD+XuI/aqeYVlr4SlHbW5xkAEcPtQtPfDDw40QgDVH
         ZzPYawoBuL0JgXoaHfydiamYbfS/QwVJGPZ+71uVu6XAWRXANULbTL3WA64EaNd4KLZX
         cl4yZyyLI9/lNSsJg96sjy8JpyO362YyvoCbmcUps1vfqkaPkrltb07LiQST5yfOEE4G
         KBlxSL0iihB97nBaikRCJUrx3veJVkQR0xj+tNNTt229qqWCIeH3r4e44CPR00fScEnZ
         M2QFAKBXfUKAeqN6MEzQpPrDCDy9pw5chdD1bdCJtsfNHCn4/k4V/WLQz3ymDnbjL4yQ
         QZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711090056; x=1711694856;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TUy1pUFZGRZWiaEeg2Zv5YdnBWiyjqTrFVitFmUSYsE=;
        b=QD92UETlohJWsqer38amgoNE0soYFj9hAHY1TuJBYBDHNY3Ep3JFII21fVXwajZ5Ov
         Tk6LaFtwVXGp8/Zmyr5h3wNSsbrlVpYPUWik3WiejELHSpYmEI9eSwHp29TocCRT+T8N
         Yt2eTHALlPVm4Og8/EDRChFcqm3Oc3GxX6Hkid7SjLk0oTl4UFiHsOoq+uKGW1eOp4N4
         PpkBejmXB5EuICR0cmfAYWEySPXHDtEn8YHazvQoc7F1E2LEGI3IaCW6s0Op3MSW9CNA
         qfifI3ll22InnS30dWpLBNZNwVpetzg2Q8pBtbQyAu6k78t7T2YWhjkhgQQppQ7xmVIm
         2coA==
X-Gm-Message-State: AOJu0YytHc7ciIS6kvhSaNAsRnYulLpbrqRMGmbxO2vD9SHp4r6/+L0W
	Y0FURYaOUBJX6j8Nx6nJvbZAsFOAbwh/ErxS8naq7nwsMgA5h8Q7HjlyK1OqZqBOkLwn/P5zREk
	e
X-Google-Smtp-Source: AGHT+IGbKjxqqIZAIbwwt2SMljk30paWqYEdUeXvGC+QNms9hxkoR1ACr3MscyEyBggmvLkEKrgmIw==
X-Received: by 2002:adf:f109:0:b0:341:8ba6:2ffc with SMTP id r9-20020adff109000000b003418ba62ffcmr840701wro.39.1711090056369;
        Thu, 21 Mar 2024 23:47:36 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id c5-20020adfc045000000b0033e34c53354sm1325504wrf.56.2024.03.21.23.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 23:47:36 -0700 (PDT)
Date: Fri, 22 Mar 2024 09:47:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 6/8] block/blk.h:347
 bio_may_exceed_limits() error: we previously assumed 'bio->bi_io_vec' could
 be null (see line 343)
Message-ID: <1f393614-3f76-4753-b5de-d317299da931@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   24850809220d9e09bb48c47d83b971a3d247e467
commit: 8a2f432fcb4a6c2deed12afa3d2b76fcb6dc8ada [6/8] ANDROID: block: Add support for filesystem requests and small segments
config: x86_64-randconfig-161-20240321 (https://download.01.org/0day-ci/archive/20240322/202403220441.8DiNyGzH-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202403220441.8DiNyGzH-lkp@intel.com/

New smatch warnings:
block/blk.h:347 bio_may_exceed_limits() error: we previously assumed 'bio->bi_io_vec' could be null (see line 343)

vim +347 block/blk.h

c55ddd9082f757 Christoph Hellwig 2022-07-27  327  static inline bool bio_may_exceed_limits(struct bio *bio,
c55ddd9082f757 Christoph Hellwig 2022-07-27  328  		struct queue_limits *lim)
abd45c159df5fc Jens Axboe        2021-10-13  329  {
abd45c159df5fc Jens Axboe        2021-10-13  330  	switch (bio_op(bio)) {
abd45c159df5fc Jens Axboe        2021-10-13  331  	case REQ_OP_DISCARD:
abd45c159df5fc Jens Axboe        2021-10-13  332  	case REQ_OP_SECURE_ERASE:
abd45c159df5fc Jens Axboe        2021-10-13  333  	case REQ_OP_WRITE_ZEROES:
abd45c159df5fc Jens Axboe        2021-10-13  334  		return true; /* non-trivial splitting decisions */
abd45c159df5fc Jens Axboe        2021-10-13  335  	default:
abd45c159df5fc Jens Axboe        2021-10-13  336  		break;
abd45c159df5fc Jens Axboe        2021-10-13  337  	}
abd45c159df5fc Jens Axboe        2021-10-13  338  
abd45c159df5fc Jens Axboe        2021-10-13  339  	/*
8a2f432fcb4a6c Bart Van Assche   2023-06-12  340  	 * Check whether bio splitting should be performed. This check may
8a2f432fcb4a6c Bart Van Assche   2023-06-12  341  	 * trigger the bio splitting code even if splitting is not necessary.
abd45c159df5fc Jens Axboe        2021-10-13  342  	 */
8a2f432fcb4a6c Bart Van Assche   2023-06-12 @343  	if (blk_queue_sub_page_limits(lim) && bio->bi_io_vec &&
                                                                                              ^^^^^^^^^^^^^^
This assumes bio->bi_io_vec can be NULL

8a2f432fcb4a6c Bart Van Assche   2023-06-12  344  	    bio->bi_io_vec->bv_len > lim->max_segment_size)
8a2f432fcb4a6c Bart Van Assche   2023-06-12  345  		return true;
c55ddd9082f757 Christoph Hellwig 2022-07-27  346  	return lim->chunk_sectors || bio->bi_vcnt != 1 ||
abd45c159df5fc Jens Axboe        2021-10-13 @347  		bio->bi_io_vec->bv_len + bio->bi_io_vec->bv_offset > PAGE_SIZE;
                                                                ^^^^^^^^^^^^^^^^^^^^^^   ^^^^^^^^^^^^^^^^^^^^^^^^^
Unchecked dereferences.

abd45c159df5fc Jens Axboe        2021-10-13  348  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

