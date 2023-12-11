Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2AA20B01
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Dec 2023 08:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZQH/lubv"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5510479806dso1399789a12.0
        for <oe-kbuild@lists.linux.dev>; Mon, 11 Dec 2023 00:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702281702; x=1702886502; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U5f0a3lTlUFh5il4cTLQ9hvyeurD3ss1k0xSKahuq5s=;
        b=ZQH/lubvTvl9La/W3naY5dPJPwZ632qsjW9ufWFaUCDEmwSaucZiG9fcbG3V5Mxw6C
         1g0mZdPyk1QGomhiLRUiBtV2Py+7qkBhvEUvPny+l9V8Jk2ULEtb1k276ZrqsmsWVhFy
         sC+ImqvmuRCOH5nz5RlZ+igQ9wmELH00aqroLaP7QRmf2Pw0smjLnNA9vgiPHrx6fTaX
         nEA2JasvOTxyUzXOwofulC9olBVBDpZNzIszCHfB7vvU+ct5Kfk2sg/jJi/fW/6y2j73
         vMKnmjofBrEhjxZWX+xJmnjKGEpOQiqxuu2IMH28mqem9PbZAth+9IBhtro7+am2bBZR
         ft9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702281702; x=1702886502;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U5f0a3lTlUFh5il4cTLQ9hvyeurD3ss1k0xSKahuq5s=;
        b=sFvA/gPfuUvfXz0piFGRlg2ZHK83BIC44s50lPoBYbCuvO7SmuR3m1Owi9Qkt0CXfS
         PYrZQFTmottpxGUma1nBJ+H4zzpYloXlc33Ednr8Ys4aBfFL0vioqJXueqayp2RH8nTf
         D36ADc/qwnny6HceYzVng5gvn2s5RX0m2NUb2yPMiSYYfRi1Gko4ZRSRv6Zv21x3yQIR
         5jqdcbSzqh3jInvSLc6Ub1FgqoN85b/hfTeK8KV+TVlD0xDoi96qcWAilPG8AUIxUeXc
         qkMfVqBfYgtrcDtfBfWu1atZUXTgmLL/uJCziuYJeYp4lCcjf8HfYTSRArwC2q23CON0
         BYlg==
X-Gm-Message-State: AOJu0YwA5hYZy06crUyotxHGm0i96t3tQj41Jj3dy3UrBgt3Ba/wkint
	+95OXB/oJZxz3sQY2pQsyoizNghohQwiXgjOzo4=
X-Google-Smtp-Source: AGHT+IFvY8tFcCBjmcXCGCSBGotrwP1HNVM4kehg3DwcBlQkd7VK0C+M1DwYuehyKDepu3daGRQb1w==
X-Received: by 2002:a50:aad7:0:b0:550:1ed8:45d9 with SMTP id r23-20020a50aad7000000b005501ed845d9mr1228246edc.64.1702281702099;
        Mon, 11 Dec 2023 00:01:42 -0800 (PST)
Received: from localhost (hf89.n1.ips.mtn.co.ug. [41.210.143.137])
        by smtp.gmail.com with ESMTPSA id t28-20020a50d71c000000b0054b1360dd03sm3497419edi.58.2023.12.11.00.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 00:01:41 -0800 (PST)
Date: Mon, 11 Dec 2023 11:01:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfile-page-caching 61/205] fs/xfs/scrub/rtsummary.c:288
 xchk_rtsum_compare() warn: missing error code? 'error'
Message-ID: <68785c4f-126c-4dc7-b760-66fe4c0af771@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   ae5732f1c245c24e63c885992c35f723f36f79ff
commit: 47301ab5762a101097a4c924722ffdb4f36776a2 [61/205] xfs: check rt summary file geometry more thoroughly
config: x86_64-randconfig-161-20231211 (https://download.01.org/0day-ci/archive/20231211/202312111046.AVIXqABS-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312111046.AVIXqABS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312111046.AVIXqABS-lkp@intel.com/

smatch warnings:
fs/xfs/scrub/rtsummary.c:288 xchk_rtsum_compare() warn: missing error code? 'error'

vim +/error +288 fs/xfs/scrub/rtsummary.c

47301ab5762a10 Darrick J. Wong 2023-10-13  268  	for (off = 0; off < endoff; off++) {
47301ab5762a10 Darrick J. Wong 2023-10-13  269  		union xfs_suminfo_raw	*ondisk_info;
47301ab5762a10 Darrick J. Wong 2023-10-13  270  
526aab5f5790e2 Darrick J. Wong 2023-08-10  271  		/* Read a block's worth of ondisk rtsummary file. */
47301ab5762a10 Darrick J. Wong 2023-10-13  272  		error = xfs_rtsummary_read_buf(&rts->args, off);
526aab5f5790e2 Darrick J. Wong 2023-08-10  273  		if (!xchk_fblock_process_error(sc, XFS_DATA_FORK, off, &error))
526aab5f5790e2 Darrick J. Wong 2023-08-10  274  			return error;
526aab5f5790e2 Darrick J. Wong 2023-08-10  275  
526aab5f5790e2 Darrick J. Wong 2023-08-10  276  		/* Read a block's worth of computed rtsummary file. */
47301ab5762a10 Darrick J. Wong 2023-10-13  277  		error = xfsum_copyout(sc, sumoff, rts->words, mp->m_blockwsize);
526aab5f5790e2 Darrick J. Wong 2023-08-10  278  		if (error) {
47301ab5762a10 Darrick J. Wong 2023-10-13  279  			xfs_rtbuf_cache_relse(&rts->args);
526aab5f5790e2 Darrick J. Wong 2023-08-10  280  			return error;
526aab5f5790e2 Darrick J. Wong 2023-08-10  281  		}
526aab5f5790e2 Darrick J. Wong 2023-08-10  282  
47301ab5762a10 Darrick J. Wong 2023-10-13  283  		ondisk_info = xfs_rsumblock_infoptr(&rts->args, 0);
47301ab5762a10 Darrick J. Wong 2023-10-13  284  		if (memcmp(ondisk_info, rts->words,
47301ab5762a10 Darrick J. Wong 2023-10-13  285  					mp->m_blockwsize << XFS_WORDLOG) != 0) {
526aab5f5790e2 Darrick J. Wong 2023-08-10  286  			xchk_fblock_set_corrupt(sc, XFS_DATA_FORK, off);
47301ab5762a10 Darrick J. Wong 2023-10-13  287  			xfs_rtbuf_cache_relse(&rts->args);
47301ab5762a10 Darrick J. Wong 2023-10-13 @288  			return error;

"error" is zero here.  I feel like this is a bug, but if it's not, it
would be better to return a literal zero.  Probably it should have a
comment as well.  But probably it's a bug.

47301ab5762a10 Darrick J. Wong 2023-10-13  289  		}
526aab5f5790e2 Darrick J. Wong 2023-08-10  290  
47301ab5762a10 Darrick J. Wong 2023-10-13  291  		xfs_rtbuf_cache_relse(&rts->args);
526aab5f5790e2 Darrick J. Wong 2023-08-10  292  		sumoff += mp->m_blockwsize;
526aab5f5790e2 Darrick J. Wong 2023-08-10  293  	}
526aab5f5790e2 Darrick J. Wong 2023-08-10  294  
526aab5f5790e2 Darrick J. Wong 2023-08-10  295  	return 0;
526aab5f5790e2 Darrick J. Wong 2023-08-10  296  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

