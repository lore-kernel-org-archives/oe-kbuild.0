Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E263246BCA;
	Tue, 10 Jun 2025 13:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562020; cv=none; b=m4RdAmap5UP+M06SzvpD8/E+MlbZPBxPWW0jcJEry6jY6580oz7h3VfoHrdhzYtdcJ+0VSJ7cKFlWu+84b1g/hs0CC6HFnLnlE/uiTWlNItaHyAvNkAtfWs+2NRi6DmMo57/26CUJkJiOyyKmIDfQTHjdr3upFc8Bmqsq2CACsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562020; c=relaxed/simple;
	bh=ZiBRei9QtSJonoTiFP0Ix9DJIL9tJYAGg1B2FI2nmME=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EJNrEYmaKGnsH569N2xNLQe/bPjk/30fXimZ+su1s/qOOMaNx4UiaDM1qHdcXCE3jqBtP6IXNDz4XfRWZnlY8NE+EfFICBjTxtNdNhWDs9bCw3MfLLxdj4NHi3UBxc8R7/rGJ0Gl5LJ7bU4qAcrstVv1MTmCIon+va0m4RsugcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 995FF1A034A;
	Tue, 10 Jun 2025 13:26:56 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf09.hostedemail.com (Postfix) with ESMTPA id 0952120025;
	Tue, 10 Jun 2025 13:26:54 +0000 (UTC)
Date: Tue, 10 Jun 2025 09:28:25 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] tracing: Fix regression of filter waiting a long time
 on RCU synchronization
Message-ID: <20250610092825.7f137dbf@gandalf.local.home>
In-Reply-To: <202506070424.lCiNreTI-lkp@intel.com>
References: <20250605161701.35f7989a@gandalf.local.home>
	<202506070424.lCiNreTI-lkp@intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0952120025
X-Stat-Signature: 8ugho4eib47ka73bycg4p35c3ezmtkjg
X-Rspamd-Server: rspamout07
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18RJbmtto4WBz1eke5ZyyCwgvDyA3ZLCdA=
X-HE-Tag: 1749562014-440800
X-HE-Meta: U2FsdGVkX1/Sg0qVsnVtxfiofVwNECkgeDjrQG9r6ug8u26pw6hs/mJAAISILaVVpRKkOXn9wsOJF5t3GTrj1jJ+blOrRvYRp4g2hIiuDEWEqOyeVWdrIWYLha6IuykrMDQ01SDuwUpmhjvYjCdYy8NDFnNbq6GT7HPBU2+23V6/mPUrMKkZ//XpsMqwhVvp9V43EDY+n2h15lR4nedO7NyLS3IrGF5UzI/zH6v/ExdXde254UY3v3GCRpk97u1PtElJiSig8bKy0NMhArbAbo+WafMbKcL2ucEQfoGQeaezLj2Iqobgk/ml+2sjfNyg+LPv6EDXa1F7FwJWiUR7YH8SWaXtlzHcJqrBaHQHOh1GcnWrRI6PVfS/g2x2guzr

On Tue, 10 Jun 2025 12:24:34 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> 7967b3e0c40ff7 Steven Rostedt (Red Hat  2015-05-13  1412) static void filter_free_subsystem_filters(struct trace_subsystem_dir *dir,
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1413  					  struct trace_array *tr,
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1414  					  struct event_filter *filter)
> f306cc82a93d6b Tom Zanussi              2013-10-24  1415  {
> 7f1d2f8210195c Steven Rostedt (Red Hat  2015-05-05  1416) 	struct trace_event_file *file;
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1417  	struct filter_head *head;
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1418  	struct filter_list *item;
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1419  
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1420  	head = kmalloc(sizeof(*head), GFP_KERNEL);
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1421  	if (!head)
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1422  		goto free_now;
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1423  
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1424  	INIT_LIST_HEAD(&head->list);
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1425  
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1426  	item = kmalloc(sizeof(*item), GFP_KERNEL);
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1427  	if (!item) {
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1428  		kfree(head);
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1429  		goto free_now;
> 
> 
> head is freed.

Ah, that's a mistake. It shouldn't be freed.

> 
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1430  	}
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1431  
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1432  	item->filter = filter;
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1433  	list_add_tail(&item->list, &head->list);
> cfb180f3e71b2a Tom Zanussi              2009-03-22  1434  
> f306cc82a93d6b Tom Zanussi              2013-10-24  1435  	list_for_each_entry(file, &tr->events, list) {
> bb9ef1cb7d8668 Oleg Nesterov            2014-07-15  1436  		if (file->system != dir)
> 8e254c1d183f02 Li Zefan                 2009-08-31  1437  			continue;
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1438  		item = kmalloc(sizeof(*item), GFP_KERNEL);
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1439  		if (!item)
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1440  			goto free_now;
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1441  		item->filter = file->filter;
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1442  		list_add_tail(&item->list, &head->list);
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1443  		file->filter = NULL;
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1444  	}
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1445  
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1446  	delay_free_filter(head);
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1447  	return;
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1448   free_now:
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1449  	tracepoint_synchronize_unregister();
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1450  
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1451  	if (head)
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05 @1452  		free_filter_list(&head->rcu);
> 
> This is a use after free.  Smatch calls is a "double free" because
> free_filter_list() has "free" in the name, but Smatch is wrong.
> However, still a bug.

Right. I'll remove the freeing of head.

Thanks,

-- Steve

> 
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1453  
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1454  	list_for_each_entry(file, &tr->events, list) {
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1455  		if (file->system != dir || !file->filter)
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1456  			continue;
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1457  		__free_filter(file->filter);
> cfb180f3e71b2a Tom Zanussi              2009-03-22  1458  	}
> b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1459  	__free_filter(filter);
> cfb180f3e71b2a Tom Zanussi              2009-03-22  1460  }
