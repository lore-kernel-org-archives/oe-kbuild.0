Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D736367F2C
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 07:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773819782; cv=none; b=UGY4aQck5vzITxWh+oHgokimW7BD0u5+1sufXVrl+0ysGDBfAqEXTmA6Qq4Kdrx8XqPEjHDWKdL/Vcn7e2g6pwuxOeZfKDLCCPH4j8m5w6xOQGgKw8DK1/wvxnFVvAqDKv9Q0g7ndKtXTC08dF0XavTQvaXFUVCZaaXzK3LaZdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773819782; c=relaxed/simple;
	bh=6pT/x/Pj6+ib/BeVI20NDlN8xedo/+jqsPXJQ8mHpNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VrzID1J4BeZ/QfylMUYW2yiYfKWaixMjWex/e3yIVP3J93mC9Y2oABekKWf2XO6Y+G0GJF2ybQV29DDWLih+KHmth5OI1pA0TyowTkrulq9EkDmDAOMu7YluEAdKJXhRN+wSae5qu3J4cHKnwyTSc4gz1QizeznBn4c+7h9Gtyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vEXS2VBD; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vEXS2VBD"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4853aec185aso53708515e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 00:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773819779; x=1774424579; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GWUe2vkO7j3zKsp+duzaX4cSZivxcbRz1IRm1ygnoBw=;
        b=vEXS2VBDCK06GsoDFFM8q1JXncv4W6Ym6hjv85YqyxWYxpOnf3WnacZR9xMqqDDa8t
         xYtPpvD/+Riygvnxp8JrqLWXJ6qyDWdPQCMNQakwDKdtJRxj+dREk7u4OXLRlIx84bnk
         VwJOz373UBTtpBR56kRPjaOxMH5qKt0xgT1MLrupz/FNtFu1BLAnvRm7tfoTz8dulbs4
         pHVMJUf4wNLOMsLc9OS4LbfL+bke5tvHzWtha+FOGthxjskoxKoV7ynSL7HNQzqHm+2y
         73qxc/nLzSPmZpE442hfIIqBY9N5DmJ0GS4hkPFrPj7vTc6vkGbhHcSh7s5iI4/G6HBe
         IpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773819779; x=1774424579;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWUe2vkO7j3zKsp+duzaX4cSZivxcbRz1IRm1ygnoBw=;
        b=Sl2a0jMlCayCRQyS3MTLyuOqw8xFq8JbQkf83/xQwpVnyPlNhhjkygjR0OeuT1LYYa
         wvAZfolzt0v1byktiiMk5txolzDn5E+dAgaZ8naZCOVEVYmaMfiXCNlwP+JZHnOX2bZG
         /RJZTjXxmgx9qa23Rl+7qP/JdouobRcH6ljGRSz/ab/CWsA+F+vO0dqaAGkaK/nO1ufh
         V2OjvXOlnaFYdy9TCGUptvzDPeKagRZlSQNfcYLAGp2TArGOdAbgTn5S5vkM30mBv7Ag
         pa1iDMUmRxpzo/+re860OEt/27Q6Mhswz47/v4Ay+hhxC4LKuRjQ2L+Id0o3p3Ma88AT
         Gd8A==
X-Gm-Message-State: AOJu0YxYuw8zL+xNug/h3Dvl4mNQF5l524LAuhJlE+6961+H5zCP0S4j
	ayz7jLPwrbzBvfEMN3SlfR9Cmc3DCdK4bLtXwFqNiwn25Dk+F4SduKS0LeDC+tfCiYd/m9cdqbZ
	WQgQH
X-Gm-Gg: ATEYQzzKnqsU1g26ZgMHDq35EqcOFkU2Qopl+/wMobecegX1Dsw0+lFmcHjtPdd1pfJ
	1pL5BNWK3EwzMH/srdA4nG+YMzbckGradxdCByFjfFId+khM19vdD1qZAMyO3fRF8iKhKu721+z
	6qyiL+0NCb3lx735x4nCQDmGAsSdlRRRKsSEdbp/iiGSyLiMJWJvuHdX8vFc1F9MZd+hWvYNH24
	TCdWmAjEIf3So9NCCrnKNJgmpezb4g/1/xKYXfjeXRYDz0ZLGpa4/8ducrM6JYIbN+Fnzlj65uR
	P1gqTHDvWsrMg+Cz1+8n4J0NAc1QyiYX2y+/5uSARccfGpLBf/cIdOxU3MLD/E/piXITrMnp/qg
	RE26lAeFw9D+L4fswd/QDgj03VTR/6UOxeVi7wTbov41m4yH2vQIjfp8JicJQpZ8kH98zfepN03
	YdubJZHsxKYW0FdlKEB0ZKIlL6vpwL
X-Received: by 2002:a05:600c:1d10:b0:483:a27e:6706 with SMTP id 5b1f17b1804b1-486f442647bmr40207665e9.9.1773819778977;
        Wed, 18 Mar 2026 00:42:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4b9beb0sm23455385e9.8.2026.03.18.00.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 00:42:58 -0700 (PDT)
Date: Wed, 18 Mar 2026 10:42:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>
Subject: [jlayton:exportd-netlink 3/18] net/sunrpc/cache.c:1074
 cache_release() error: dereferencing freed memory 'rq' (line 1070)
Message-ID: <202603180258.r8Bt94T2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260318074255.LXy7pS6oGPvopv2dJcxfFoWCHs2X8TwP8nU_6p0zbog@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git exportd-netlink
head:   4599c5d95d86c6bc932897f19b1f5a573e7c4637
commit: e344b49528c8ef457ee714bb65e2da4c121132c2 [3/18] Merge branch 'mrchuck/nfsd-testing'
config: x86_64-randconfig-161-20260317 (https://download.01.org/0day-ci/archive/20260318/202603180258.r8Bt94T2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603180258.r8Bt94T2-lkp@intel.com/

smatch warnings:
net/sunrpc/cache.c:1074 cache_release() error: dereferencing freed memory 'rq' (line 1070)

vim +/rq +1074 net/sunrpc/cache.c

173912a6add00f Trond Myklebust  2009-08-09  1040  static int cache_release(struct inode *inode, struct file *filp,
173912a6add00f Trond Myklebust  2009-08-09  1041  			 struct cache_detail *cd)
^1da177e4c3f41 Linus Torvalds   2005-04-16  1042  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  1043  	struct cache_reader *rp = filp->private_data;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1044  
^1da177e4c3f41 Linus Torvalds   2005-04-16  1045  	if (rp) {
17ad31b3a43b72 Jeff Layton      2026-02-23  1046  		struct cache_request *rq = NULL;
17ad31b3a43b72 Jeff Layton      2026-02-23  1047  
b00567a1495f66 Jeff Layton      2026-02-23  1048  		spin_lock(&cd->queue_lock);
^1da177e4c3f41 Linus Torvalds   2005-04-16  1049  		if (rp->offset) {
812936f74067e6 Jeff Layton      2026-02-23  1050  			struct cache_request *cr;
812936f74067e6 Jeff Layton      2026-02-23  1051  
812936f74067e6 Jeff Layton      2026-02-23  1052  			cr = cache_next_request(cd, rp->next_seqno);
812936f74067e6 Jeff Layton      2026-02-23  1053  			if (cr) {
17ad31b3a43b72 Jeff Layton      2026-02-23  1054  				cr->readers--;
17ad31b3a43b72 Jeff Layton      2026-02-23  1055  				if (cr->readers == 0 &&
17ad31b3a43b72 Jeff Layton      2026-02-23  1056  				    !test_bit(CACHE_PENDING,
17ad31b3a43b72 Jeff Layton      2026-02-23  1057  					      &cr->item->flags)) {
812936f74067e6 Jeff Layton      2026-02-23  1058  					list_del(&cr->list);
17ad31b3a43b72 Jeff Layton      2026-02-23  1059  					rq = cr;
17ad31b3a43b72 Jeff Layton      2026-02-23  1060  				}
^1da177e4c3f41 Linus Torvalds   2005-04-16  1061  			}
^1da177e4c3f41 Linus Torvalds   2005-04-16  1062  			rp->offset = 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1063  		}
812936f74067e6 Jeff Layton      2026-02-23  1064  		list_del(&rp->list);
b00567a1495f66 Jeff Layton      2026-02-23  1065  		spin_unlock(&cd->queue_lock);
^1da177e4c3f41 Linus Torvalds   2005-04-16  1066  
0b88d5fcde160d Jeff Layton      2026-02-23  1067  		if (rq) {
0b88d5fcde160d Jeff Layton      2026-02-23  1068  			cache_put(rq->item, cd);
0b88d5fcde160d Jeff Layton      2026-02-23  1069  			kfree(rq->buf);
0b88d5fcde160d Jeff Layton      2026-02-23 @1070  			kfree(rq);
                                                                        ^^^^^^^^^

0b88d5fcde160d Jeff Layton      2026-02-23  1071  		}
^1da177e4c3f41 Linus Torvalds   2005-04-16  1072  
17ad31b3a43b72 Jeff Layton      2026-02-23  1073  		if (rq) {
17ad31b3a43b72 Jeff Layton      2026-02-23 @1074  			cache_put(rq->item, cd);
17ad31b3a43b72 Jeff Layton      2026-02-23  1075  			kfree(rq->buf);
17ad31b3a43b72 Jeff Layton      2026-02-23  1076  			kfree(rq);
                                                                        ^^^^^^^^^

17ad31b3a43b72 Jeff Layton      2026-02-23  1077  		}

Looks like a bad merge.

17ad31b3a43b72 Jeff Layton      2026-02-23  1078  
^1da177e4c3f41 Linus Torvalds   2005-04-16  1079  		filp->private_data = NULL;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1080  		kfree(rp);
64a38e840ce594 Dave Wysochanski 2019-07-26  1081  	}
64a38e840ce594 Dave Wysochanski 2019-07-26  1082  	if (filp->f_mode & FMODE_WRITE) {
64a38e840ce594 Dave Wysochanski 2019-07-26  1083  		atomic_dec(&cd->writers);
c5b29f885afe89 NeilBrown        2010-08-12  1084  		cd->last_close = seconds_since_boot();
^1da177e4c3f41 Linus Torvalds   2005-04-16  1085  	}
f7e86ab92f2198 Trond Myklebust  2009-08-19  1086  	module_put(cd->owner);
^1da177e4c3f41 Linus Torvalds   2005-04-16  1087  	return 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1088  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

