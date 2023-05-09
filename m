Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DDC2114
	for <oe-kbuild@lists.linux.dev>; Tue,  9 May 2023 05:40:40 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f41dceb9c9so18648525e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 08 May 2023 22:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683610838; x=1686202838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tlfhc11Kx7yCJym0I7Mw8R+pcgt3UjUISA434rzN7ZU=;
        b=gzaV+cshKEwEPwvpEZHakB3YQgEUqNoubuJegSbhS1vfzYxYMRZ6mCbEHcMFjr88Zx
         9cAzyZN2E8R7ogejtfjWbl/m7qD6EszWQ16V+yYD3+6VSDnbNFxUNmCbpPXmrsnEFKig
         jiRUCTEgz/36V2jIjEbD7pgkK3cqsV2crUmpPg1pGWRyY8SjT8jsGEXD8TQINOCWRkfk
         298+YLVJoHrQCGhZ3rmgHmScKFKNZwk2XUNOgyxEMOAo/3cHI/2NewIeIPS/ox0xt5Pe
         CAgjSNp7Og2ztTFBqzNLXo0+9FPLfmjRctJN53kDoelrwrv1BOTpjBAsbH+Okp+ooTvb
         6VtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683610838; x=1686202838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tlfhc11Kx7yCJym0I7Mw8R+pcgt3UjUISA434rzN7ZU=;
        b=Y12UdTNlkIRjVJB/uofX3lgi9X4mZXXuRFDBFYN45zBu9I+iwFHJqh/eaIejwnDOa/
         LVQpaGmTAYk9H/SC/3/uIH3Je7CbdqKEHGs8nyRAqdBRb022BnDuEtHTbB1/p0hMvDKn
         Z6/LrFynBX3EwlaJ0DzU/DVCYhGUzD9JvNjsSbEOgs/MUrD8v1lJlmx5zmJQLG7XjRbb
         cZjf20BJyQeLUMbsY/APgTWAxoHuTWBAUDArhc98p+NmLbe1GzbDkKTDcu2icHEpqA4l
         fBZZFfBr1ELlv1O51Yd5nXPtC14FeEj9XF6f/wtzVCa3rug1YqxF9uIX0TXQ2+kn+n1h
         Pvog==
X-Gm-Message-State: AC+VfDysuxlOCoBXTV5sr1c9ciAv5FXKesQSh+HSYzbYFUISPvtufTAd
	GDwO9mC+C1bbYamXxsPXzewk0Q==
X-Google-Smtp-Source: ACHHUZ40QaGu9oLT5BKu9KVo4Vc6JRHH+zyZDNrP8+lJBVFL12ze4ikQCpOuatixLIqVaYb+9nHPCw==
X-Received: by 2002:adf:fdca:0:b0:2f9:910b:7166 with SMTP id i10-20020adffdca000000b002f9910b7166mr7718809wrs.57.1683610838397;
        Mon, 08 May 2023 22:40:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a9-20020adfe5c9000000b0030632110586sm13432312wrn.3.2023.05.08.22.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 22:40:36 -0700 (PDT)
Date: Tue, 9 May 2023 08:40:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: kernel/rcu/srcutree.c:1644 srcu_advance_state() warn:
 inconsistent returns '&ssp->srcu_sup->srcu_gp_mutex'.
Message-ID: <30f2e760-e2f3-4941-be9b-b9c5624fd861@kili.mountain>
References: <c0937326-1cf1-429a-9883-30d9d79b01d0@kili.mountain>
 <c33b0348-7f86-47ce-913c-f1ebc6431f93@paulmck-laptop>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c33b0348-7f86-47ce-913c-f1ebc6431f93@paulmck-laptop>

On Sat, May 06, 2023 at 11:45:35AM -0700, Paul E. McKenney wrote:
> On Sat, May 06, 2023 at 10:22:04AM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   418d5c98319f67b9ae651babea031b5394425c18
> > commit: e3a6ab25cfa0fcdcb31c346b9871a566d440980d srcu: Move ->srcu_gp_mutex from srcu_struct to srcu_usage
> > config: x86_64-randconfig-m001-20230501 (https://download.01.org/0day-ci/archive/20230506/202305060951.I8mz6eHt-lkp@intel.com/config)
> > compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Link: https://lore.kernel.org/r/202305060951.I8mz6eHt-lkp@intel.com/
> > 
> > smatch warnings:
> > kernel/rcu/srcutree.c:1644 srcu_advance_state() warn: inconsistent returns '&ssp->srcu_sup->srcu_gp_mutex'.
> > 
> > vim +1644 kernel/rcu/srcutree.c
> > 
> > aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1584  static void srcu_advance_state(struct srcu_struct *ssp)
> > dad81a2026841b Paul E. McKenney 2017-03-25  1585  {
> > dad81a2026841b Paul E. McKenney 2017-03-25  1586  	int idx;
> > dad81a2026841b Paul E. McKenney 2017-03-25  1587  
> > e3a6ab25cfa0fc Paul E. McKenney 2023-03-17  1588  	mutex_lock(&ssp->srcu_sup->srcu_gp_mutex);
> > da915ad5cf25b5 Paul E. McKenney 2017-04-05  1589  
> > dad81a2026841b Paul E. McKenney 2017-03-25  1590  	/*
> > dad81a2026841b Paul E. McKenney 2017-03-25  1591  	 * Because readers might be delayed for an extended period after
> > da915ad5cf25b5 Paul E. McKenney 2017-04-05  1592  	 * fetching ->srcu_idx for their index, at any point in time there
> > dad81a2026841b Paul E. McKenney 2017-03-25  1593  	 * might well be readers using both idx=0 and idx=1.  We therefore
> > dad81a2026841b Paul E. McKenney 2017-03-25  1594  	 * need to wait for readers to clear from both index values before
> > dad81a2026841b Paul E. McKenney 2017-03-25  1595  	 * invoking a callback.
> > dad81a2026841b Paul E. McKenney 2017-03-25  1596  	 *
> > dad81a2026841b Paul E. McKenney 2017-03-25  1597  	 * The load-acquire ensures that we see the accesses performed
> > dad81a2026841b Paul E. McKenney 2017-03-25  1598  	 * by the prior grace period.
> > dad81a2026841b Paul E. McKenney 2017-03-25  1599  	 */
> > aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1600  	idx = rcu_seq_state(smp_load_acquire(&ssp->srcu_gp_seq)); /* ^^^ */
> > dad81a2026841b Paul E. McKenney 2017-03-25  1601  	if (idx == SRCU_STATE_IDLE) {
> > b3fb11f7e9c3c6 Paul E. McKenney 2023-03-17  1602  		spin_lock_irq_rcu_node(ssp->srcu_sup);
> > aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1603  		if (ULONG_CMP_GE(ssp->srcu_gp_seq, ssp->srcu_gp_seq_needed)) {
> > aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1604  			WARN_ON_ONCE(rcu_seq_state(ssp->srcu_gp_seq));
> > b3fb11f7e9c3c6 Paul E. McKenney 2023-03-17  1605  			spin_unlock_irq_rcu_node(ssp->srcu_sup);
> > e3a6ab25cfa0fc Paul E. McKenney 2023-03-17  1606  			mutex_unlock(&ssp->srcu_sup->srcu_gp_mutex);
> > dad81a2026841b Paul E. McKenney 2017-03-25  1607  			return;
> > dad81a2026841b Paul E. McKenney 2017-03-25  1608  		}
> > aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1609  		idx = rcu_seq_state(READ_ONCE(ssp->srcu_gp_seq));
> > dad81a2026841b Paul E. McKenney 2017-03-25  1610  		if (idx == SRCU_STATE_IDLE)
> > aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1611  			srcu_gp_start(ssp);
> > b3fb11f7e9c3c6 Paul E. McKenney 2023-03-17  1612  		spin_unlock_irq_rcu_node(ssp->srcu_sup);
> > da915ad5cf25b5 Paul E. McKenney 2017-04-05  1613  		if (idx != SRCU_STATE_IDLE) {
> > e3a6ab25cfa0fc Paul E. McKenney 2023-03-17  1614  			mutex_unlock(&ssp->srcu_sup->srcu_gp_mutex);
> > dad81a2026841b Paul E. McKenney 2017-03-25  1615  			return; /* Someone else started the grace period. */
> > dad81a2026841b Paul E. McKenney 2017-03-25  1616  		}
> > da915ad5cf25b5 Paul E. McKenney 2017-04-05  1617  	}
> > dad81a2026841b Paul E. McKenney 2017-03-25  1618  
> > aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1619  	if (rcu_seq_state(READ_ONCE(ssp->srcu_gp_seq)) == SRCU_STATE_SCAN1) {
> > aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1620  		idx = 1 ^ (ssp->srcu_idx & 1);
> > aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1621  		if (!try_check_zero(ssp, idx, 1)) {
> > e3a6ab25cfa0fc Paul E. McKenney 2023-03-17  1622  			mutex_unlock(&ssp->srcu_sup->srcu_gp_mutex);
> > dad81a2026841b Paul E. McKenney 2017-03-25  1623  			return; /* readers present, retry later. */
> > da915ad5cf25b5 Paul E. McKenney 2017-04-05  1624  		}
> > aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1625  		srcu_flip(ssp);
> > b3fb11f7e9c3c6 Paul E. McKenney 2023-03-17  1626  		spin_lock_irq_rcu_node(ssp->srcu_sup);
> > aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1627  		rcu_seq_set_state(&ssp->srcu_gp_seq, SRCU_STATE_SCAN2);
> > 282d8998e9979c Paul E. McKenney 2022-03-08  1628  		ssp->srcu_n_exp_nodelay = 0;
> > b3fb11f7e9c3c6 Paul E. McKenney 2023-03-17  1629  		spin_unlock_irq_rcu_node(ssp->srcu_sup);
> > dad81a2026841b Paul E. McKenney 2017-03-25  1630  	}
> > dad81a2026841b Paul E. McKenney 2017-03-25  1631  
> > aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1632  	if (rcu_seq_state(READ_ONCE(ssp->srcu_gp_seq)) == SRCU_STATE_SCAN2) {
> > 
> > We don't mutex_unlock(&ssp->srcu_sup->srcu_gp_mutex) if this if
> > statement is false.
> 
> Hmmm...
> 
> I could make the above line read something like the following:
> 
> 	if (!WARN_ON_ONCE(rcu_seq_state(READ_ONCE(ssp->srcu_sup->srcu_gp_seq)) != SRCU_STATE_SCAN2)) {

Smatch ignores WARN_ON().  WARNings are triggered all the time, so it's
not like a BUG() which stops the code flow.

> 
> The theory is that there are only three legal values for ->srcu_gp_seq.
> Because we hold ->srcu_gp_mutex, no one else can change it.   The first
> "if" statement either returns or sets that state to SRCU_STATE_SCAN1.
> The second "if" statement also either returns or sets that state to
> SRCU_STATE_SCAN2.  So that statement should not be false.

Smatch can't figure out that the statement is true.  The issue there is
that ssp->srcu_sup->srcu_gp_seq stores a value in the low bits and a
different value in the high bits.  This seems like something that might
be worth handling correctly at some point, but that point is in the
distant future...

Just ignore this one.

regards,
dan carpenter

