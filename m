Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975682D7DEB
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Oct 2025 06:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760942026; cv=none; b=GNvUYCdpsqL0IsxWIb36y/rq9ibdIMm05gD94lAxsdFnEc7iZFnmIfz+9B2sXnU61ZF1NTfaeYFQ4LYCr9DV+yRiC3cYO6xMyuoo2VsEmAZOxr/XK1WB4PXdkfoABInVGEtF4ZTlaQo03fADbipvk22zcZl5vPEwZtTgFwck80s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760942026; c=relaxed/simple;
	bh=mlp97g/Ep+BsSFjfD7A7N/xv9QnAORBmJOYQUYj87ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S1VBBPZStpupmlwKlK6Yuz4P+qLJEgl5fQRsoRY5uoEN3KYS5igVMGY7c/Tg5JsXlcXI283USRQ8V8mV+HKxGYwkj5vhiHSJfvoEh3IPNzcsmz9WyZ8meLdRzD7kw6ijof6+gwLtlMxgnmD+LqRl5kFXqGstIKgJSUNPzCKqnoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PichgMW0; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PichgMW0"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42420c7de22so1908579f8f.1
        for <oe-kbuild@lists.linux.dev>; Sun, 19 Oct 2025 23:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760942023; x=1761546823; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IjHG8CZxcYscygh+/z+/xpN6vFrGJ6ZliT2ZowMplRw=;
        b=PichgMW0YJspYFx7jE+Lq7f3CtKnMXZTGP9gOalQvkm087p5sXd15FraMXUrgGjDUW
         HqzSJ4DBvEm1FiRB9PnkYSU30ftib8baIkrmreMGFnrOR6bjxD22CL7oF9Vn+D5qHHug
         E1OtmO6dc56PMBwj9jT1J8jywGjEP85Xngj1hm3RCkgS85wHT16sCJcOEPB/njq8L1Ly
         5qZIKvzqCwb9qGP6K6DbNTD0g199D/vBUvzdmsPBWRqisjUDgjBKTd1L8BGqxQ/leOZH
         qAYmvW+YU61Q/rfQRzQEQBIIo2F9itPDg8GC1OWuBM5JgUHXrOt94Fdl1gpLqbTo046/
         6+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760942023; x=1761546823;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IjHG8CZxcYscygh+/z+/xpN6vFrGJ6ZliT2ZowMplRw=;
        b=ir4O8P07R/UYPxd1RtJVmNMFWVj819T5Fdoe3kxnKmeznNwDVJRH+ma4qaiEFxjT90
         WPak/iQTexLJ9ZA1gJW3ul576qBYlMJ9FhWuWSsJ3bDcR+T01rUn3WABAaN6GcH1t+ml
         iMJzuWTDxqmfnUwrgXGONwu47CEVrlX/OBdShjAs4LAlzM8CmqqNwS9TINKEulSAdQeV
         hlC6no124Uqi6fwiaaieCBo59H5rhrVVVgG6OJw7GDc6CVihJd6owQjJfLT2XnSIiwHn
         rkSgAMfku2kbxapr3zyOY8GR/T44Xkj9S6dwQ3BqZTq76ix4bmytShm3jAb0+NDBWlq9
         pR5Q==
X-Gm-Message-State: AOJu0YwFBPBdLdUdmQTE4ii8qngj+21NCKjjgCKkaJQWoGs31gGVq3rA
	FIKpv3FUBv5ImY+bH/OgGr7Py95AHW9RQzVAR6rzqrRT6M6nmc8myWtaWFqgw5o+LS7v8gom6Nl
	3mr43
X-Gm-Gg: ASbGncsjw18I9IeluDJxwuWjemhHNQkcddnySar7Q5jZruKfha9Gduut/WjI0b36kT+
	9n+1Hvlch+0Aqn6UIGR11Yh7Tt/SKVutNWtJWy19Onb57jKSdJnso4N/MT+uOHqxtxGoGpjL6dU
	GSjpkemaW+LtmRWdw4G9DCdNJjpmvVMIm6nmCLanVgPL03bu0eOGQFb3SXiW9fiDrZLjjY7kOMT
	D5ZtpvkTgpYb/z/TlbwZeLRSQHkceiB59HDDQhE98G88G9dd5L+m8Cb6xn+uXnOov/44ZUCy01U
	rnQwKPzXFcIpZ8y++kmEOkSh9jLgQ7DShjZXG0kxLfJ+/3AE07aaBU7zkx2WQwQgMREpaIam0d4
	3KFCYqrkG8LxvSWzUMLKvpoLU+L9v0YzE7KqapaKNJ2Ny5A6KB7BLiBM81M0ntQFGH8V3l/PIji
	89pIq8DA==
X-Google-Smtp-Source: AGHT+IF+iwxN0Wn2Qgp9zceiF70dnTKZUmoxnsQ+EXXtbsTV8HUbRMaapCpwEul2gA5BkOaWNMWH8A==
X-Received: by 2002:a05:6000:2507:b0:427:370:20a3 with SMTP id ffacd0b85a97d-42704d96174mr8890713f8f.38.1760942022395;
        Sun, 19 Oct 2025 23:33:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4710ed9e7d7sm110465655e9.3.2025.10.19.23.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:33:41 -0700 (PDT)
Date: Mon, 20 Oct 2025 09:33:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-quota-cleanups 14/20] fs/xfs/scrub/quotacheck.c:605
 xqcheck_compare_dquot() warn: inconsistent returns '&dq->q_qlock'.
Message-ID: <202510191855.DAo2A5zX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251020063338.w2pV0bUf4s_HDJfqzNcIwh_5DGfWIb1at8bdtiD1W7Y@z>

tree:   git://git.infradead.org/users/hch/xfs xfs-quota-cleanups
head:   65122be191ff384c885bb15ab86d84951a501c49
commit: 2b4f89bdf5696bbc066f43533a17b891f4cd3ef9 [14/20] xfs: move q_qlock locking into xqcheck_compare_dquot
config: i386-randconfig-141-20251015 (https://download.01.org/0day-ci/archive/20251019/202510191855.DAo2A5zX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510191855.DAo2A5zX-lkp@intel.com/

smatch warnings:
fs/xfs/scrub/quotacheck.c:605 xqcheck_compare_dquot() warn: inconsistent returns '&dq->q_qlock'.

vim +605 fs/xfs/scrub/quotacheck.c

48dd9117a34fe9a Darrick J. Wong   2024-02-22  551  STATIC int
48dd9117a34fe9a Darrick J. Wong   2024-02-22  552  xqcheck_compare_dquot(
48dd9117a34fe9a Darrick J. Wong   2024-02-22  553  	struct xqcheck		*xqc,
48dd9117a34fe9a Darrick J. Wong   2024-02-22  554  	xfs_dqtype_t		dqtype,
48dd9117a34fe9a Darrick J. Wong   2024-02-22  555  	struct xfs_dquot	*dq)
48dd9117a34fe9a Darrick J. Wong   2024-02-22  556  {
48dd9117a34fe9a Darrick J. Wong   2024-02-22  557  	struct xqcheck_dquot	xcdq;
48dd9117a34fe9a Darrick J. Wong   2024-02-22  558  	struct xfarray		*counts = xqcheck_counters_for(xqc, dqtype);
48dd9117a34fe9a Darrick J. Wong   2024-02-22  559  	int			error;
48dd9117a34fe9a Darrick J. Wong   2024-02-22  560  
200491875ce144f Darrick J. Wong   2024-02-22  561  	if (xchk_iscan_aborted(&xqc->iscan)) {
200491875ce144f Darrick J. Wong   2024-02-22  562  		xchk_set_incomplete(xqc->sc);
200491875ce144f Darrick J. Wong   2024-02-22  563  		return -ECANCELED;
200491875ce144f Darrick J. Wong   2024-02-22  564  	}
200491875ce144f Darrick J. Wong   2024-02-22  565  
2b4f89bdf5696bb Christoph Hellwig 2025-09-20  566  	mutex_lock(&dq->q_qlock);
48dd9117a34fe9a Darrick J. Wong   2024-02-22  567  	mutex_lock(&xqc->lock);
48dd9117a34fe9a Darrick J. Wong   2024-02-22  568  	error = xfarray_load_sparse(counts, dq->q_id, &xcdq);
48dd9117a34fe9a Darrick J. Wong   2024-02-22  569  	if (error)
48dd9117a34fe9a Darrick J. Wong   2024-02-22  570  		goto out_unlock;
48dd9117a34fe9a Darrick J. Wong   2024-02-22  571  
48dd9117a34fe9a Darrick J. Wong   2024-02-22  572  	if (xcdq.icount != dq->q_ino.count)
48dd9117a34fe9a Darrick J. Wong   2024-02-22  573  		xchk_qcheck_set_corrupt(xqc->sc, dqtype, dq->q_id);
48dd9117a34fe9a Darrick J. Wong   2024-02-22  574  
48dd9117a34fe9a Darrick J. Wong   2024-02-22  575  	if (xcdq.bcount != dq->q_blk.count)
48dd9117a34fe9a Darrick J. Wong   2024-02-22  576  		xchk_qcheck_set_corrupt(xqc->sc, dqtype, dq->q_id);
48dd9117a34fe9a Darrick J. Wong   2024-02-22  577  
48dd9117a34fe9a Darrick J. Wong   2024-02-22  578  	if (xcdq.rtbcount != dq->q_rtb.count)
48dd9117a34fe9a Darrick J. Wong   2024-02-22  579  		xchk_qcheck_set_corrupt(xqc->sc, dqtype, dq->q_id);
48dd9117a34fe9a Darrick J. Wong   2024-02-22  580  
48dd9117a34fe9a Darrick J. Wong   2024-02-22  581  	xcdq.flags |= (XQCHECK_DQUOT_COMPARE_SCANNED | XQCHECK_DQUOT_WRITTEN);
48dd9117a34fe9a Darrick J. Wong   2024-02-22  582  	error = xfarray_store(counts, dq->q_id, &xcdq);
48dd9117a34fe9a Darrick J. Wong   2024-02-22  583  	if (error == -EFBIG) {
48dd9117a34fe9a Darrick J. Wong   2024-02-22  584  		/*
48dd9117a34fe9a Darrick J. Wong   2024-02-22  585  		 * EFBIG means we tried to store data at too high a byte offset
48dd9117a34fe9a Darrick J. Wong   2024-02-22  586  		 * in the sparse array.  IOWs, we cannot complete the check and
48dd9117a34fe9a Darrick J. Wong   2024-02-22  587  		 * must notify userspace that the check was incomplete.  This
200491875ce144f Darrick J. Wong   2024-02-22  588  		 * should never happen outside of the collection phase.
48dd9117a34fe9a Darrick J. Wong   2024-02-22  589  		 */
48dd9117a34fe9a Darrick J. Wong   2024-02-22  590  		xchk_set_incomplete(xqc->sc);
48dd9117a34fe9a Darrick J. Wong   2024-02-22  591  		error = -ECANCELED;
48dd9117a34fe9a Darrick J. Wong   2024-02-22  592  	}
48dd9117a34fe9a Darrick J. Wong   2024-02-22  593  	mutex_unlock(&xqc->lock);
2b4f89bdf5696bb Christoph Hellwig 2025-09-20  594  	mutex_unlock(&dq->q_qlock);
48dd9117a34fe9a Darrick J. Wong   2024-02-22  595  	if (error)
48dd9117a34fe9a Darrick J. Wong   2024-02-22  596  		return error;
48dd9117a34fe9a Darrick J. Wong   2024-02-22  597  
48dd9117a34fe9a Darrick J. Wong   2024-02-22  598  	if (xqc->sc->sm->sm_flags & XFS_SCRUB_OFLAG_CORRUPT)
48dd9117a34fe9a Darrick J. Wong   2024-02-22  599  		return -ECANCELED;
48dd9117a34fe9a Darrick J. Wong   2024-02-22  600  
48dd9117a34fe9a Darrick J. Wong   2024-02-22  601  	return 0;
48dd9117a34fe9a Darrick J. Wong   2024-02-22  602  
48dd9117a34fe9a Darrick J. Wong   2024-02-22  603  out_unlock:
48dd9117a34fe9a Darrick J. Wong   2024-02-22  604  	mutex_unlock(&xqc->lock);

Needs a mutex_unlock(&dq->q_qlock);

48dd9117a34fe9a Darrick J. Wong   2024-02-22 @605  	return error;
48dd9117a34fe9a Darrick J. Wong   2024-02-22  606  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

