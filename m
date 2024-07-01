Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D42D53AC
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jul 2024 15:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719848693; cv=none; b=ID95IaqtdzrJK69IuWgQ1t39dmnmLJ9SGprWtHNRoeH1m/2ETTV96C3XOMjlnAoD9Fe8Gu5ERpAfnJrajPj5P4xOIKHgj1ffiWGm6ieGXMaMfDbtloWPSOnvpXexCVVSGHUn4uAF7SBvARmfhXwPtuD3elYOfWuA7StUmtzETNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719848693; c=relaxed/simple;
	bh=VmhP/DqI3/DC+RCFnRY97vWoIPaKXNyGiWJICSA6kak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tn+XDHjYWQLDjGR9Ba6KmJfNlCrue3CcY6XXrIMb8TSbEEZt8PkKSvMKYyFM452eQ93BsZnkUfN6JHgXMMSFOAmS9vX+xnjxk4Qk4R4TLgofE3S5LSxNBTlZdPkBa1C1O6V2Z1LZjXE3o0ysF6EsHRCnM6xm8PSSK862jwzQWas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RVXQjbqI; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RVXQjbqI"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52cdf4bc083so4692106e87.2
        for <oe-kbuild@lists.linux.dev>; Mon, 01 Jul 2024 08:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719848689; x=1720453489; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mfut94CXDwmtEg0KE4qH64hQMu242J0CBA5kPfzN1CE=;
        b=RVXQjbqIfVBTXmrojbmng2YFKWebx7m5hfA7WUmVd+sR3yRJeywiNBBGv1q0/FoW94
         CJZwz/DzhU68xgYt3PGAnBtngR9XbKUc1SfMotODi0KmCZDItzz9g2FqZEHkYADn5ccP
         SM8kYi3NPfRXvD76dW8s7px8mKallaj6CDRQP6WLhWx2EQiGRiO4UyrAqaik/uMHjNpt
         PRGEvwq4wmoAORIw25GPNlm+t2Thcg4tLRfhtsX+q+C+JBOqaQPo9fm3WSLBZeGrE29O
         Vu6oF0uRpFlu/7nbDGcVx/32/2+WKs6jkC4zx/BaTWHTh6uVrTSDR44/0f3BG9PAesF7
         UD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719848689; x=1720453489;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mfut94CXDwmtEg0KE4qH64hQMu242J0CBA5kPfzN1CE=;
        b=NxflibTJIJ+Ofam9Z8ocvTfdyuVL3IuZPwjGvq6l9eP+oN1cZOcutEspTz4Gn+FclO
         6FZE+LlphxUkpx9+ygjmEsvRw3+guDW88lzEYOAvm5NxK+hE/W19BHlcJR7vi3Pr40WK
         IMvD4oQ/XXZ/4kWiHte4x4QMWcs6boVU7ts/wK7uT0MxiTynFw2aTtCysCmYjyGwJVfM
         0BMunsBSztANs6vpMgGWSSCPxJg9syH3yq3ML/Uoc/nty9L0vFOg5hSwCVyDEYt8SYQd
         zOxQsaBs6+C7UVHrd92bgnB8bdRZYNt+oL4Tde8/qzsEF+169UqH/jbtvs+NX/PZJnyd
         GPGw==
X-Gm-Message-State: AOJu0YwSW5AsWEWZvD12Ae0R7gilC+D+fA06gTat8f3cwCw/gJfruDWF
	1k43iDY2NALCOERooqJjDj+zkfInHQ8Y8tO0UGV5PFlIPsFOga3FYeg8ydvDiAL9PaPcm4g8ocE
	8
X-Google-Smtp-Source: AGHT+IGWCt/0JLV1k6alOnu00qU3v0Jv/qG1wNcZIWrTOsvizj5b7E6638LK4hM12opmwTLbJng0dw==
X-Received: by 2002:a05:6512:3f0b:b0:52c:de8f:2e6c with SMTP id 2adb3069b0e04-52e82727fc5mr3923687e87.57.1719848686523;
        Mon, 01 Jul 2024 08:44:46 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:e8c6:2364:637f:c70e])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab27bdbsm1453262e87.171.2024.07.01.08.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 08:44:45 -0700 (PDT)
Date: Mon, 1 Jul 2024 17:44:42 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next-6.10-rebase 30/35] io_uring/zcrx.c:812
 io_zcrx_recv_skb() warn: check likely/unlikely parentheses
Message-ID: <75318c18-bf2a-427d-b9bb-aa54fa3e0a3c@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next-6.10-rebase
head:   1bc9807cd5e670cbc5f1a650daf7470d33fb94d7
commit: 217b71934ad9ee4fffd5eb975aae285911a16052 [30/35] io_uring/zcrx: prevent endless unresponsive execution
config: x86_64-randconfig-161-20240626 (https://download.01.org/0day-ci/archive/20240626/202406261243.sPJ6xyvQ-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406261243.sPJ6xyvQ-lkp@intel.com/

smatch warnings:
io_uring/zcrx.c:812 io_zcrx_recv_skb() warn: check likely/unlikely parentheses

vim +812 io_uring/zcrx.c

f9ab1c1cb8fd3a David Wei      2024-03-05  800  static int
f9ab1c1cb8fd3a David Wei      2024-03-05  801  io_zcrx_recv_skb(read_descriptor_t *desc, struct sk_buff *skb,
f9ab1c1cb8fd3a David Wei      2024-03-05  802  		 unsigned int offset, size_t len)
f9ab1c1cb8fd3a David Wei      2024-03-05  803  {
f9ab1c1cb8fd3a David Wei      2024-03-05  804  	struct io_zcrx_args *args = desc->arg.data;
f9ab1c1cb8fd3a David Wei      2024-03-05  805  	struct io_zcrx_ifq *ifq = args->ifq;
f9ab1c1cb8fd3a David Wei      2024-03-05  806  	struct io_kiocb *req = args->req;
f9ab1c1cb8fd3a David Wei      2024-03-05  807  	struct sk_buff *frag_iter;
4eb3e10e62f790 Pavel Begunkov 2024-03-05  808  	unsigned start, start_off = offset;
f9ab1c1cb8fd3a David Wei      2024-03-05  809  	int i, copy, end, off;
f9ab1c1cb8fd3a David Wei      2024-03-05  810  	int ret = 0;
f9ab1c1cb8fd3a David Wei      2024-03-05  811  
217b71934ad9ee Pavel Begunkov 2024-04-17 @812  	if (unlikely(args->nr_skbs++) > IO_SKBS_PER_CALL_LIMIT)
                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^
unlikely() returns true/false.  Surprised checkpatch doesn't catch this.

217b71934ad9ee Pavel Begunkov 2024-04-17  813  		return -EAGAIN;
217b71934ad9ee Pavel Begunkov 2024-04-17  814  
4eb3e10e62f790 Pavel Begunkov 2024-03-05  815  	if (unlikely(offset < skb_headlen(skb))) {
4eb3e10e62f790 Pavel Begunkov 2024-03-05  816  		ssize_t copied;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

