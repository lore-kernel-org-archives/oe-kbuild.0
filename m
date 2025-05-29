Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508B22D052
	for <oe-kbuild@lists.linux.dev>; Thu, 29 May 2025 14:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748528561; cv=none; b=j+l3OsdejO2aKjOaXXrSxK7CM1RDsA1Sqmdz4Ul/wE+uls7Emo9xUFzlhwtKNnR1ohBPL8ExiE/YFjwGhzODg29YPm//W//K6FVTGOJBPbdAAL4JowWAHHMseDSI1JWIIiYWPq+zoI+P6PTQ4R39+MDPguxpFoJipeXbF+n6lrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748528561; c=relaxed/simple;
	bh=SJeJDn0eb10YU45ltQlXDHBzhwugvkDPZfzcXcshxjo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=j0+QuwEtwBHkn62uXmB6VQs8TPML+g9SXUCo18rcaosD+rphHzUI9L0koCk7xwL8+GPGx9O+zoekQ0WgDmpOfpr2YbQWw/u3p7ah6iyOk/ivJpTLLe6hudYpURnMHo+r+WbWQmZyuQcjUd3YniFybKt1y7kzxWR1xuP3Be2Yvz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hs2BQsde; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hs2BQsde"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748528558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tOfUOHsT5A2N3sIIw2kS94sCl5daw9Gv4uw0XwOhtn0=;
	b=hs2BQsdepeCT1K2QH/SpQ1SkfG8gPMmxBgglUK7WpT+Ej68LcrKkUl+3EFfrtPQ5Ts08qr
	+mdYiMlH52NwOif2N78duywqpyXclv0V3h2dYcgNxCwLL+sGxYMKVxHSymehUkn0YBXfkN
	AOBqnX9T5LmMZi34oHn7iWjaAppuZmQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-110-QToTBfK4ME6BckVAbmEjKg-1; Thu,
 29 May 2025 10:22:36 -0400
X-MC-Unique: QToTBfK4ME6BckVAbmEjKg-1
X-Mimecast-MFC-AGG-ID: QToTBfK4ME6BckVAbmEjKg_1748528555
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A14771956095;
	Thu, 29 May 2025 14:22:35 +0000 (UTC)
Received: from [10.22.80.20] (unknown [10.22.80.20])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D3A1F1955D88;
	Thu, 29 May 2025 14:22:33 +0000 (UTC)
Date: Thu, 29 May 2025 16:22:29 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
cc: oe-kbuild@lists.linux.dev, Benjamin Marzinski <bmarzins@redhat.com>, 
    lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 10969/12618] drivers/md/dm-mpath.c:2104
 probe_active_paths() warn: mixing irqsave and irq
In-Reply-To: <202505221209.UJOI2rXT-lkp@intel.com>
Message-ID: <440f7ce7-da6a-da3d-b314-aaf4525c0a4d@redhat.com>
References: <202505221209.UJOI2rXT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ERB_tSU0eQJV1xmqDdovcgYmFRuA279c-YQ0tfKEBLw_1748528555
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII

Hi

This was already fixed in the commit 
050a3e71ce24c6f18d70679d68056f76375ff51c

Mikulas

On Fri, 23 May 2025, Dan Carpenter wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   7bac2c97af4078d7a627500c9bcdd5b033f97718
> commit: 5c977f1023156938915c57d362fddde8fad2b052 [10969/12618] dm-mpath: Don't grab work_mutex while probing paths
> config: i386-randconfig-141-20250521 (https://download.01.org/0day-ci/archive/20250522/202505221209.UJOI2rXT-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202505221209.UJOI2rXT-lkp@intel.com/
> 
> smatch warnings:
> drivers/md/dm-mpath.c:2104 probe_active_paths() warn: mixing irqsave and irq
> 
> vim +2104 drivers/md/dm-mpath.c
> 
> 7734fb4ad98c3f Kevin Wolf         2025-04-29  2095  static int probe_active_paths(struct multipath *m)
> 7734fb4ad98c3f Kevin Wolf         2025-04-29  2096  {
> 7734fb4ad98c3f Kevin Wolf         2025-04-29  2097  	struct pgpath *pgpath;
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2098  	struct priority_group *pg = NULL;
> 7734fb4ad98c3f Kevin Wolf         2025-04-29  2099  	unsigned long flags;
> 7734fb4ad98c3f Kevin Wolf         2025-04-29  2100  	int r = 0;
> 7734fb4ad98c3f Kevin Wolf         2025-04-29  2101  
> 7734fb4ad98c3f Kevin Wolf         2025-04-29  2102  	spin_lock_irqsave(&m->lock, flags);
> 
> _irqsave() is for if we don't know if the caller has disabled IRQs or
> not.
> 
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2103  	if (test_bit(MPATHF_DELAY_PG_SWITCH, &m->flags)) {
> 5c977f10231569 Benjamin Marzinski 2025-05-15 @2104  		wait_event_lock_irq(m->probe_wait,
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2105  				    !test_bit(MPATHF_DELAY_PG_SWITCH, &m->flags),
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2106  				    m->lock);
> 
> The wait_event_lock_irq() macro calls spin_unlock_irq(), so hopefully
> none of the callers of probe_active_paths() actually relied on having
> IRQs disabled.
> 
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2107  		/*
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2108  		 * if we waited because a probe was already in progress,
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2109  		 * and it probed the current active pathgroup, don't
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2110  		 * reprobe. Just return the number of valid paths
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2111  		 */
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2112  		if (m->current_pg == m->last_probed_pg)
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2113  			goto skip_probe;
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2114  	}
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2115  	if (!m->current_pg || m->is_suspending ||
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2116  	    test_bit(MPATHF_QUEUE_IO, &m->flags))
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2117  		goto skip_probe;
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2118  	set_bit(MPATHF_DELAY_PG_SWITCH, &m->flags);
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2119  	pg = m->last_probed_pg = m->current_pg;
> 7734fb4ad98c3f Kevin Wolf         2025-04-29  2120  	spin_unlock_irqrestore(&m->lock, flags);
> 7734fb4ad98c3f Kevin Wolf         2025-04-29  2121  
> 7734fb4ad98c3f Kevin Wolf         2025-04-29  2122  	list_for_each_entry(pgpath, &pg->pgpaths, list) {
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2123  		if (pg != READ_ONCE(m->current_pg) ||
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2124  		    READ_ONCE(m->is_suspending))
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2125  			goto out;
> 7734fb4ad98c3f Kevin Wolf         2025-04-29  2126  		if (!pgpath->is_active)
> 7734fb4ad98c3f Kevin Wolf         2025-04-29  2127  			continue;
> 7734fb4ad98c3f Kevin Wolf         2025-04-29  2128  
> 7734fb4ad98c3f Kevin Wolf         2025-04-29  2129  		r = probe_path(pgpath);
> 7734fb4ad98c3f Kevin Wolf         2025-04-29  2130  		if (r < 0)
> 7734fb4ad98c3f Kevin Wolf         2025-04-29  2131  			goto out;
> 7734fb4ad98c3f Kevin Wolf         2025-04-29  2132  	}
> 7734fb4ad98c3f Kevin Wolf         2025-04-29  2133  
> 7734fb4ad98c3f Kevin Wolf         2025-04-29  2134  out:
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2135  	spin_lock_irqsave(&m->lock, flags);
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2136  	clear_bit(MPATHF_DELAY_PG_SWITCH, &m->flags);
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2137  	if (test_and_clear_bit(MPATHF_NEED_PG_SWITCH, &m->flags)) {
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2138  		m->current_pgpath = NULL;
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2139  		m->current_pg = NULL;
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2140  	}
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2141  skip_probe:
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2142  	if (r == 0 && !atomic_read(&m->nr_valid_paths))
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2143  		r = -ENOTCONN;
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2144  	spin_unlock_irqrestore(&m->lock, flags);
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2145  	if (pg)
> 5c977f10231569 Benjamin Marzinski 2025-05-15  2146  		wake_up(&m->probe_wait);
> 7734fb4ad98c3f Kevin Wolf         2025-04-29  2147  	return r;
> 7734fb4ad98c3f Kevin Wolf         2025-04-29  2148  }
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

