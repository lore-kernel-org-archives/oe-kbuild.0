Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65CA25A65B
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Oct 2025 12:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761914121; cv=none; b=uIhP0c9ktVkW9W3fOdGhjAf522+Vdmhr7Pv2k5qm2t6JNID1hKNCir4ejZRMtmtEUBQQarwCrCIKx8iQjzvhH9oM/BIZuIGiRio+Kbh3N7QhaB/2NzMoILJNN6nU0AP+9oWNbwbJkCl+YhzF4XD+s06EcgNfTuJ7LOQh0N56/dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761914121; c=relaxed/simple;
	bh=TkJyylerZ/EJW54jkDhmC15P/b48nFxWYve/peXtcdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TnbCrMqe33EtAkj74qW3WqNDAQK8x2ytBr3auqerBI0N5pplNax7jc1quicJpJdjgio2esQAM+ibeLYn/3KKvoRv4TZJ0Qrz7nqtMO2llt/98YrN7LgSSKrnwPnvEudtcrjuaYhX5LowHiwsKcNRRqeRouYa0flWaFJTcv0hLlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u3NiRou1; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u3NiRou1"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-471191ac79dso24376285e9.3
        for <oe-kbuild@lists.linux.dev>; Fri, 31 Oct 2025 05:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761914118; x=1762518918; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l2U9+tDawzzkqbAl3lwqClZpr93cqow93wrirf2CWfM=;
        b=u3NiRou1fzhI6stO5HdRFgHYflqQYPEX7I3suApxSSgtMT+LeE6waJ+aJ+NKYYFni5
         bLHurwh98R61E43VqOS8kJoL6gcqHf5QqPpsX+kNwEijPasgrKPpUqHgiV/kHXoinCrG
         USWOaVehDeMfv6+j1rRnvoI+54JMoD+27sGqFRAJndQv4eNAbOVy6I4ru2DB5Wl830jP
         X+Kzj/D2LlB7RXnM62LBgZYiFLuvc7qUcooXh+uceTHfsdSXfJlLnV/HKAPs6EfdW9JV
         kyR6k2cxNoQ8Hrq91PfX1+x8VDVosCUTymB1i6QcDiDnDWQ4R0jTz89GW5R3Q3HMtUFp
         YUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761914118; x=1762518918;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l2U9+tDawzzkqbAl3lwqClZpr93cqow93wrirf2CWfM=;
        b=bPa08G1i2jGErBp+HY6KdzYp2qTudLHwJsB8Kh+FVEAVSdoG+nfqDNjOtu6u6VxVd/
         hxFlwOPEbCiHEo+YyCsFB9Y1XU6LRwIxW9LeUgTX/Hz5citpFwlf+BpwZR8VN5yN0wYQ
         6CWocZ9HrE4E2dFYXkJQ7VMeUr5p9htY7ZvuUiomCeLuGwI46Ta5tg4tchCpGMCW0SpN
         q2IKHdORzxipyusP9l3aXjsyKeNc60Quh/HYYMAMfG4ff6vi41W4hGqZgawEMCKgveNS
         PTid50wW92tNm+rBqHJ/sLG2jHULptGBdUjp7JAPUv6wGiO5/LAJ2hpgbim+5TJmqpTk
         t58w==
X-Gm-Message-State: AOJu0YyG27RQyG31XscbvpGUm9eEc6SQe1HINR+H0ftHEhUI49PTEij9
	mHFLVcKh2rmk+NjW9/IZEWM3j6qq31VvkwJL4RzVmXF1CYbQxpZW2Xi2wVB06imZtnEY45I00on
	P2qE9
X-Gm-Gg: ASbGncuU1aMpNohnJ+N264mbudVfpxCsMI39JsyNs9+HDsJPyPC6RuEqZiy2/CpnOMm
	0PvkL22RenP6+KU5kC2Us+auvpVO+XuM+BAnJEx2cwJRrQrTKtjShaFRZaBsXd5FS5taEyH9m8e
	B0EV6HKVg+nf2ezXtKMdzbbAk9T7copq7F0nsQDG1uR3E4UuNd8gANyQcb2dUJZgR+rPaZto5RN
	gJN4+z/CnT8DErNFsBwzkQ1tt45rWpmzPhHhftI0ivTbl5/2s5m8ja4sZhMiVvbgANENB04oIKz
	c1n+MjjadXg0oaHn6MIhJOouh1PJoa2Re1MN/YGGOX88Q7dUebJylk6e70knour/aESqYLBBjCp
	4cZLLQxHb8KoWBmRwPJsoxK/pLdd/gUqY8QWtoIxh+fGv1CRK5W9bN5w+jn9HmC0V40G1UKJuuF
	xSgClRHAJldQ1jktzF
X-Google-Smtp-Source: AGHT+IF23sXV+3jOUkChJFWuERclNMLGutiObvRxwU/8t2vHi9p8YTUWbkaNRmeVr3/20c/vjCeIwg==
X-Received: by 2002:a05:600c:3590:b0:471:115e:624b with SMTP id 5b1f17b1804b1-477308595f6mr31410365e9.17.1761914117756;
        Fri, 31 Oct 2025 05:35:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47733023256sm32489495e9.17.2025.10.31.05.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:35:17 -0700 (PDT)
Date: Fri, 31 Oct 2025 15:35:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/2] block/blk.h:347
 bio_may_exceed_limits() error: we previously assumed 'bio->bi_io_vec' could
 be null (see line 343)
Message-ID: <202510311917.TDY9r0nH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251031123513.cdZWxPgFoyif3kywsGRSDFQDHPuvdsfyUJVm4-AZS5Q@z>

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   3e2aa22eb7df590670c63f75b44f1cd3894c1de1
commit: 24edb63b854ab73fa1bf86b4dde98cdb648cba35 [2/2] Reapply "ANDROID: block: Add support for filesystem requests and small segments"
config: x86_64-randconfig-r071-20251031 (https://download.01.org/0day-ci/archive/20251031/202510311917.TDY9r0nH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510311917.TDY9r0nH-lkp@intel.com/

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
24edb63b854ab7 Bart Van Assche   2023-06-12  340  	 * Check whether bio splitting should be performed. This check may
24edb63b854ab7 Bart Van Assche   2023-06-12  341  	 * trigger the bio splitting code even if splitting is not necessary.
abd45c159df5fc Jens Axboe        2021-10-13  342  	 */
24edb63b854ab7 Bart Van Assche   2023-06-12 @343  	if (blk_queue_sub_page_limits(lim) && bio->bi_io_vec &&
                                                                                              ^^^^^^^^^^^^^^
Check for NULL

24edb63b854ab7 Bart Van Assche   2023-06-12  344  	    bio->bi_io_vec->bv_len > lim->max_segment_size)
24edb63b854ab7 Bart Van Assche   2023-06-12  345  		return true;
c55ddd9082f757 Christoph Hellwig 2022-07-27  346  	return lim->chunk_sectors || bio->bi_vcnt != 1 ||
abd45c159df5fc Jens Axboe        2021-10-13 @347  		bio->bi_io_vec->bv_len + bio->bi_io_vec->bv_offset > PAGE_SIZE;
                                                                ^^^^^^^^^^^^^^
Unchecked dereference

abd45c159df5fc Jens Axboe        2021-10-13  348  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

