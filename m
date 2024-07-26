Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5C017CA09
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Jul 2024 16:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722010072; cv=none; b=a6TL2F3/oPR9nx8QjCJ2NynXNs5DXBUGMzv17ep+cV7ypbw+ZFaVFJzidjdHRIgiA6eSK3tnDvRCoXXZ/1DXKs7d3K645QoyI3jh6qfA0f9cEd4nC0CRiORqWCA0EcYpzzrfuiyA9ce2ec5qwmJk615aT32LgbClOgx/BpwgTdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722010072; c=relaxed/simple;
	bh=+b5eHldBdXoIQmya1EbgVXgWZfV7H2mjF2BLM92WqxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G2wLbNShAmqfqmhsJA3Kt8dp927qO50HFtIice4tag0Wu1SHl8nmUznSN2ufXeki/egjLyVNVJANIhYRrOOCFRJ6qr4E95x9n92uaBH7VQmiy51GQ9ZE9+Uh65aJuGBXdBQDfXjbzREt+2f08jLHM1r8LVWGY/ajUwl3G3FWWGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M33VbBk4; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M33VbBk4"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-709339c91f9so528818a34.0
        for <oe-kbuild@lists.linux.dev>; Fri, 26 Jul 2024 09:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722010069; x=1722614869; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nqF601Ls/ZCZ6RgbuqKdnwEFjCBMLdevjlgvmIymbbo=;
        b=M33VbBk4+T6DMVeSjqXpe2mgpFRw+7KWMbTZtg8U/fajLfg+ZuA5UQyx7trt9Muw7A
         UNTcGyZ5kR9KffwkDtOcsEtr3JJvk8XqWpOq/9ikkaJdFBR0NwAPGEqp4GHdtQAK4GyY
         a3K5oy27nTvZq3gPgdUUxx+OY4KRikbyq8HIJPpwWU9ioFSt1V1CBxTJpvcyJLlV0HmV
         6lbxhWLDwcSPOFM1cqP+7YxL/Q9bdffRldurqhSv3jt63ZsIDNhieaZbbjPRha5TvAiA
         BZmKQFzkuYFcPa1ltr69D5cxs+L0DfMMbE8udq2rET8OcHAF+kgiycwdThNnvDQH8Zy9
         tZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722010069; x=1722614869;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nqF601Ls/ZCZ6RgbuqKdnwEFjCBMLdevjlgvmIymbbo=;
        b=b0D4K87u1qSQJw6upmOsPVP2CWIt/FWWJy0cwwNF08CgDZCDdKfqs1jAJaPL/5ja/q
         6lhdV22JTNfbbKbKwP0m7StDOW0x1yJw2UKF/LCfwSGY3ioHUhLXD4+G9CciWtY+G5QN
         DmHN2iy2l1KGse1Lr92kxcFNvoc7HAa9Y0WezpGB9PhpQkhjfvF3q0nFCa7xO+eZxXB2
         yZJF+oD+LAKoUmkDQiiGwVDs5ReM6CIY1S06NrP/3CiOaPlrylDpcoAtzS5tNn/EKsHE
         i5op4UnGyjEttI+vBtrZU3/zY6RBuvuN/eSqkwe44/Pqx8ZSp6k4Oy4eyYNlMaC/ywH5
         AQxg==
X-Gm-Message-State: AOJu0YyWcV5+rSsjpzvnP3/Q7FV3+soCQTCmbAYinPaQtoTatBYDgQQN
	gKtVPhZpvobyc8j1WQ0W2QsEC59AWKXHigPaiuKc7vvcTStiiE31UiFgXa7O4qIDNZOydQ6p+vd
	nOkA=
X-Google-Smtp-Source: AGHT+IEyHym/WNFw6ux66/fq0LNrsA34DJJRNfWMb29xkOiA7AAf4zSI1IoLgO95S4T6tdYPqnQ/4w==
X-Received: by 2002:a05:6830:6f0a:b0:703:651b:382f with SMTP id 46e09a7af769-70940bfe06amr82942a34.3.1722010069322;
        Fri, 26 Jul 2024 09:07:49 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:928f:fdbe:c604:7b3f])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70930722531sm786585a34.38.2024.07.26.09.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 09:07:48 -0700 (PDT)
Date: Fri, 26 Jul 2024 11:07:47 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Paul E. McKenney" <paulmck@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2024.07.18b 23/89] kernel/rcu/rcutorture.c:1502
 rcu_torture_writer() error: we previously assumed 'cur_ops->get_comp_state'
 could be null (see line 1436)
Message-ID: <f5816862-4a9d-4861-b250-3fa8b69aa092@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2024.07.18b
head:   a6c7779283d67a409b81616a5b485ac21637d7e7
commit: 45e1c92f5e5c4b6c18ae06f075daf4b0471bb80a [23/89] rcutorture: Remove redundant rcu_torture_ops get_gp_completed fields
config: i386-randconfig-141-20240726 (https://download.01.org/0day-ci/archive/20240726/202407261510.wlO5jrpo-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407261510.wlO5jrpo-lkp@intel.com/

smatch warnings:
kernel/rcu/rcutorture.c:1502 rcu_torture_writer() error: we previously assumed 'cur_ops->get_comp_state' could be null (see line 1436)
kernel/rcu/rcutorture.c:1522 rcu_torture_writer() error: we previously assumed 'cur_ops->get_comp_state_full' could be null (see line 1451)

vim +1502 kernel/rcu/rcutorture.c

a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney   2005-10-30  1401  	do {
ad0dc7f94dbf41 kernel/rcu/rcutorture.c Paul E. McKenney   2014-02-19  1402  		rcu_torture_writer_state = RTWS_FIXED_DELAY;
1eba0ef981fd3b kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-17  1403  		torture_hrtimeout_us(500, 1000, &rand);
a71fca58b7f4ab kernel/rcutorture.c     Paul E. McKenney   2009-09-18  1404  		rp = rcu_torture_alloc();
a71fca58b7f4ab kernel/rcutorture.c     Paul E. McKenney   2009-09-18  1405  		if (rp == NULL)
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney   2005-10-30  1406  			continue;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney   2005-10-30  1407  		rp->rtort_pipe_count = 0;
c507e195016ccc kernel/rcu/rcutorture.c Paul E. McKenney   2024-03-06  1408  		ASSERT_EXCLUSIVE_WRITER(rp->rtort_pipe_count);
ad0dc7f94dbf41 kernel/rcu/rcutorture.c Paul E. McKenney   2014-02-19  1409  		rcu_torture_writer_state = RTWS_DELAY;
51b1130eb5823d kernel/rcu/rcutorture.c Paul E. McKenney   2014-01-27  1410  		udelay(torture_random(&rand) & 0x3ff);
ad0dc7f94dbf41 kernel/rcu/rcutorture.c Paul E. McKenney   2014-02-19  1411  		rcu_torture_writer_state = RTWS_REPLACE;
0ddea0ead2ced9 kernel/rcutorture.c     Paul E. McKenney   2010-09-19  1412  		old_rp = rcu_dereference_check(rcu_torture_current,
0ddea0ead2ced9 kernel/rcutorture.c     Paul E. McKenney   2010-09-19  1413  					       current == writer_task);
996417d2c4eb58 kernel/rcutorture.c     Paul E. McKenney   2005-11-18  1414  		rp->rtort_mbtest = 1;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney   2005-10-30  1415  		rcu_assign_pointer(rcu_torture_current, rp);
9b2619aff0332e kernel/rcutorture.c     Paul E. McKenney   2009-09-23  1416  		smp_wmb(); /* Mods to old_rp must follow rcu_assign_pointer() */
c8e5b163101c5d kernel/rcutorture.c     Josh Triplett      2007-05-08  1417  		if (old_rp) {
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney   2005-10-30  1418  			i = old_rp->rtort_pipe_count;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney   2005-10-30  1419  			if (i > RCU_TORTURE_PIPE_LEN)
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney   2005-10-30  1420  				i = RCU_TORTURE_PIPE_LEN;
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney   2005-10-30  1421  			atomic_inc(&rcu_torture_wcount[i]);
202489101f2e6c kernel/rcu/rcutorture.c Paul E. McKenney   2019-12-21  1422  			WRITE_ONCE(old_rp->rtort_pipe_count,
202489101f2e6c kernel/rcu/rcutorture.c Paul E. McKenney   2019-12-21  1423  				   old_rp->rtort_pipe_count + 1);
c507e195016ccc kernel/rcu/rcutorture.c Paul E. McKenney   2024-03-06  1424  			ASSERT_EXCLUSIVE_WRITER(old_rp->rtort_pipe_count);
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1425  
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1426  			// Make sure readers block polled grace periods.
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1427  			if (cur_ops->get_gp_state && cur_ops->poll_gp_state) {
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1428  				idx = cur_ops->readlock();
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1429  				cookie = cur_ops->get_gp_state();
37d6ade31cf833 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-02  1430  				WARN_ONCE(cur_ops->poll_gp_state(cookie),
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1431  					  "%s: Cookie check 1 failed %s(%d) %lu->%lu\n",
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1432  					  __func__,
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1433  					  rcu_torture_writer_state_getname(),
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1434  					  rcu_torture_writer_state,
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1435  					  cookie, cur_ops->get_gp_state());
45e1c92f5e5c4b kernel/rcu/rcutorture.c Paul E. McKenney   2024-06-14 @1436  				if (cur_ops->get_comp_state) {

Can ->get_comp_state be NULL?

45e1c92f5e5c4b kernel/rcu/rcutorture.c Paul E. McKenney   2024-06-14  1437  					cookie = cur_ops->get_comp_state();
d0eac20f9909de kernel/rcu/rcutorture.c Paul E. McKenney   2022-04-13  1438  					WARN_ON_ONCE(!cur_ops->poll_gp_state(cookie));
d0eac20f9909de kernel/rcu/rcutorture.c Paul E. McKenney   2022-04-13  1439  				}
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1440  				cur_ops->readunlock(idx);
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1441  			}
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1442  			if (cur_ops->get_gp_state_full && cur_ops->poll_gp_state_full) {
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1443  				idx = cur_ops->readlock();
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1444  				cur_ops->get_gp_state_full(&cookie_full);
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1445  				WARN_ONCE(cur_ops->poll_gp_state_full(&cookie_full),
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1446  					  "%s: Cookie check 5 failed %s(%d) online %*pbl\n",
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1447  					  __func__,
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1448  					  rcu_torture_writer_state_getname(),
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1449  					  rcu_torture_writer_state,
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1450  					  cpumask_pr_args(cpu_online_mask));
45e1c92f5e5c4b kernel/rcu/rcutorture.c Paul E. McKenney   2024-06-14 @1451  				if (cur_ops->get_comp_state_full) {

Or ->get_comp_state_full?

45e1c92f5e5c4b kernel/rcu/rcutorture.c Paul E. McKenney   2024-06-14  1452  					cur_ops->get_comp_state_full(&cookie_full);
91a967fd6934ab kernel/rcu/rcutorture.c Paul E. McKenney   2022-07-28  1453  					WARN_ON_ONCE(!cur_ops->poll_gp_state_full(&cookie_full));
91a967fd6934ab kernel/rcu/rcutorture.c Paul E. McKenney   2022-07-28  1454  				}
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1455  				cur_ops->readunlock(idx);
d594231aa50a0f kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-01  1456  			}
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1457  			switch (synctype[torture_random(&rand) % nsynctypes]) {
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1458  			case RTWS_DEF_FREE:
ad0dc7f94dbf41 kernel/rcu/rcutorture.c Paul E. McKenney   2014-02-19  1459  				rcu_torture_writer_state = RTWS_DEF_FREE;
0acc512cb1a296 kernel/rcutorture.c     Paul E. McKenney   2009-06-25  1460  				cur_ops->deferred_free(old_rp);
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1461  				break;
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1462  			case RTWS_EXP_SYNC:
ad0dc7f94dbf41 kernel/rcu/rcutorture.c Paul E. McKenney   2014-02-19  1463  				rcu_torture_writer_state = RTWS_EXP_SYNC;
ccb42229fb34bc kernel/rcu/rcutorture.c Paul E. McKenney   2022-07-29  1464  				do_rtws_sync(&rand, cur_ops->exp_sync);
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1465  				rcu_torture_pipe_update(old_rp);
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1466  				break;
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1467  			case RTWS_COND_GET:
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1468  				rcu_torture_writer_state = RTWS_COND_GET;
fd56f64b4e3b9c kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1469  				gp_snap = cur_ops->get_gp_state();
ea31fd9ca87399 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-17  1470  				torture_hrtimeout_jiffies(torture_random(&rand) % 16, &rand);
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1471  				rcu_torture_writer_state = RTWS_COND_SYNC;
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1472  				cur_ops->cond_sync(gp_snap);
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1473  				rcu_torture_pipe_update(old_rp);
a48f3fad4f97fe kernel/rcu/rcutorture.c Paul E. McKenney   2014-03-18  1474  				break;
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1475  			case RTWS_COND_GET_EXP:
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1476  				rcu_torture_writer_state = RTWS_COND_GET_EXP;
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1477  				gp_snap = cur_ops->get_gp_state_exp();
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1478  				torture_hrtimeout_jiffies(torture_random(&rand) % 16, &rand);
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1479  				rcu_torture_writer_state = RTWS_COND_SYNC_EXP;
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1480  				cur_ops->cond_sync_exp(gp_snap);
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1481  				rcu_torture_pipe_update(old_rp);
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1482  				break;
b6fe4917ae4353 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1483  			case RTWS_COND_GET_FULL:
b6fe4917ae4353 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1484  				rcu_torture_writer_state = RTWS_COND_GET_FULL;
b6fe4917ae4353 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1485  				cur_ops->get_gp_state_full(&gp_snap_full);
b6fe4917ae4353 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1486  				torture_hrtimeout_jiffies(torture_random(&rand) % 16, &rand);
b6fe4917ae4353 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1487  				rcu_torture_writer_state = RTWS_COND_SYNC_FULL;
b6fe4917ae4353 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1488  				cur_ops->cond_sync_full(&gp_snap_full);
b6fe4917ae4353 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1489  				rcu_torture_pipe_update(old_rp);
b6fe4917ae4353 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1490  				break;
8df13f01608ea4 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1491  			case RTWS_COND_GET_EXP_FULL:
8df13f01608ea4 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1492  				rcu_torture_writer_state = RTWS_COND_GET_EXP_FULL;
8df13f01608ea4 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1493  				cur_ops->get_gp_state_full(&gp_snap_full);
8df13f01608ea4 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1494  				torture_hrtimeout_jiffies(torture_random(&rand) % 16, &rand);
8df13f01608ea4 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1495  				rcu_torture_writer_state = RTWS_COND_SYNC_EXP_FULL;
8df13f01608ea4 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1496  				cur_ops->cond_sync_exp_full(&gp_snap_full);
8df13f01608ea4 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1497  				rcu_torture_pipe_update(old_rp);
8df13f01608ea4 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-04  1498  				break;
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1499  			case RTWS_POLL_GET:
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1500  				rcu_torture_writer_state = RTWS_POLL_GET;
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1501  				for (i = 0; i < ARRAY_SIZE(ulo); i++)
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25 @1502  					ulo[i] = cur_ops->get_comp_state();

These don't check

0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1503  				gp_snap = cur_ops->start_gp_poll();
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1504  				rcu_torture_writer_state = RTWS_POLL_WAIT;
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1505  				while (!cur_ops->poll_gp_state(gp_snap)) {
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1506  					gp_snap1 = cur_ops->get_gp_state();
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1507  					for (i = 0; i < ARRAY_SIZE(ulo); i++)
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1508  						if (cur_ops->poll_gp_state(ulo[i]) ||
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1509  						    cur_ops->same_gp_state(ulo[i], gp_snap1)) {
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1510  							ulo[i] = gp_snap1;
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1511  							break;
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1512  						}
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1513  					WARN_ON_ONCE(i >= ARRAY_SIZE(ulo));
ea31fd9ca87399 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-17  1514  					torture_hrtimeout_jiffies(torture_random(&rand) % 16,
ea31fd9ca87399 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-17  1515  								  &rand);
1324d95b1c22d1 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1516  				}
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1517  				rcu_torture_pipe_update(old_rp);
0fd0548db13346 kernel/rcu/rcutorture.c Paul E. McKenney   2020-11-13  1518  				break;
76ea364161e72b kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-02  1519  			case RTWS_POLL_GET_FULL:
76ea364161e72b kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-02  1520  				rcu_torture_writer_state = RTWS_POLL_GET_FULL;
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1521  				for (i = 0; i < ARRAY_SIZE(rgo); i++)
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25 @1522  					cur_ops->get_comp_state_full(&rgo[i]);

Same

76ea364161e72b kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-02  1523  				cur_ops->start_gp_poll_full(&gp_snap_full);
76ea364161e72b kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-02  1524  				rcu_torture_writer_state = RTWS_POLL_WAIT_FULL;
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1525  				while (!cur_ops->poll_gp_state_full(&gp_snap_full)) {
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1526  					cur_ops->get_gp_state_full(&gp_snap1_full);
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1527  					for (i = 0; i < ARRAY_SIZE(rgo); i++)
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1528  						if (cur_ops->poll_gp_state_full(&rgo[i]) ||
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1529  						    cur_ops->same_gp_state_full(&rgo[i],
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1530  										&gp_snap1_full)) {
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1531  							rgo[i] = gp_snap1_full;
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1532  							break;
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1533  						}
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1534  					WARN_ON_ONCE(i >= ARRAY_SIZE(rgo));
76ea364161e72b kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-02  1535  					torture_hrtimeout_jiffies(torture_random(&rand) % 16,
76ea364161e72b kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-02  1536  								  &rand);
1d5ebc351f0100 kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-25  1537  				}
76ea364161e72b kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-02  1538  				rcu_torture_pipe_update(old_rp);
76ea364161e72b kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-02  1539  				break;
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1540  			case RTWS_POLL_GET_EXP:
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1541  				rcu_torture_writer_state = RTWS_POLL_GET_EXP;
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1542  				gp_snap = cur_ops->start_gp_poll_exp();
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1543  				rcu_torture_writer_state = RTWS_POLL_WAIT_EXP;
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1544  				while (!cur_ops->poll_gp_state_exp(gp_snap))
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1545  					torture_hrtimeout_jiffies(torture_random(&rand) % 16,
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1546  								  &rand);
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1547  				rcu_torture_pipe_update(old_rp);
11d62f0f43a35d kernel/rcu/rcutorture.c Paul E. McKenney   2022-02-01  1548  				break;
6c502b14ba66da kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-03  1549  			case RTWS_POLL_GET_EXP_FULL:
6c502b14ba66da kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-03  1550  				rcu_torture_writer_state = RTWS_POLL_GET_EXP_FULL;
6c502b14ba66da kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-03  1551  				cur_ops->start_gp_poll_exp_full(&gp_snap_full);
6c502b14ba66da kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-03  1552  				rcu_torture_writer_state = RTWS_POLL_WAIT_EXP_FULL;
6c502b14ba66da kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-03  1553  				while (!cur_ops->poll_gp_state_full(&gp_snap_full))
6c502b14ba66da kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-03  1554  					torture_hrtimeout_jiffies(torture_random(&rand) % 16,
6c502b14ba66da kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-03  1555  								  &rand);
6c502b14ba66da kernel/rcu/rcutorture.c Paul E. McKenney   2022-08-03  1556  				rcu_torture_pipe_update(old_rp);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

