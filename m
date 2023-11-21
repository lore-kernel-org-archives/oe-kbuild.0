Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF62C495EF;
	Tue, 21 Nov 2023 15:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AE8EXQSg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rBx7RlY2"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1700579849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=amG8dsb0Xi5CtDBhMAipVmfkMv2qVhstklyGL0NmvUc=;
	b=AE8EXQSgyYEbENLUIvGZTC6aH2sOYQgml+6/ceS1hSJiCJhSFVf/EpZ57LIitTkCwu9fOf
	AhPI5iwhnBp/ykrN+ZuTEQTGzwJ0LuJRANCcukjude86DTlbTCzLg+3egDwYzl0ZlYcALb
	kM2eM2lt1mFSxRVPuDmkBu5kE5Y+5owjvybBYmotqRz9wokCl2EUtteeOlJs3z7oj3besp
	5Bk2ESeJBhARSnhaTxZz3yBgrn8nKZ+DNt6l0Jw6BRJdR86Ej/vFP+ihBz189wTEGdWyJY
	cuj0JFDKu1MeMBNpPn/a3xqbi/D6usIpBuxjWzTewGbd+8rRU+5PfmzZesU+Gg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1700579849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=amG8dsb0Xi5CtDBhMAipVmfkMv2qVhstklyGL0NmvUc=;
	b=rBx7RlY2MyayD0JZkpgpdomjyHpcDcDhykjvQxFLPNHOGCiJHeESJ5shUwFaI93dOfG0ln
	ockmbZh9WNhBaFAw==
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 Andrzej Hajda <andrzej.hajda@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [tglx-devel:queue/core 1/1] lib/debugobjects.c:730
 debug_object_activate() error: 'obj' dereferencing possible ERR_PTR()
In-Reply-To: <2999d03c-4002-474f-9654-e9eded9af8c3@suswa.mountain>
References: <2999d03c-4002-474f-9654-e9eded9af8c3@suswa.mountain>
Date: Tue, 21 Nov 2023 16:17:29 +0100
Message-ID: <87pm0316gm.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Nov 20 2023 at 03:55, Dan Carpenter wrote:
> smatch warnings:
> lib/debugobjects.c:730 debug_object_activate() error: 'obj' dereferencing possible ERR_PTR()
>
> vim +/obj +730 lib/debugobjects.c
>
> aedcade6f4fa9a Stephen Boyd     2020-08-14  694  int debug_object_activate(void *addr, const struct debug_obj_descr *descr)
> 3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  695  {
> 63a759694eed61 Thomas Gleixner  2023-04-12  696  	struct debug_obj o = { .object = addr, .state = ODEBUG_STATE_NOTAVAILABLE, .descr = descr };
> 3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  697  	struct debug_bucket *db;
> 3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  698  	struct debug_obj *obj;
> 3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  699  	unsigned long flags;
> 3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  700  
> 3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  701  	if (!debug_objects_enabled)
> b778ae25366e6f Paul E. McKenney 2013-04-23  702  		return 0;
> 3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  703  
> 0af462f19e635a Thomas Gleixner  2023-05-01  704  	debug_objects_fill_pool();
> 0af462f19e635a Thomas Gleixner  2023-05-01  705  
> 3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  706  	db = get_bucket((unsigned long) addr);
> 3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  707  
> aef9cb05247df3 Thomas Gleixner  2009-11-17  708  	raw_spin_lock_irqsave(&db->lock, flags);
> 3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  709  
> 63a759694eed61 Thomas Gleixner  2023-04-12  710  	obj = lookup_object_or_alloc(addr, db, descr, false, true);
> 265c43c4e983ed Andrzej Hajda    2023-10-25  711  	if (unlikely(!obj)) {
> 265c43c4e983ed Andrzej Hajda    2023-10-25  712  		raw_spin_unlock_irqrestore(&db->lock, flags);
> 265c43c4e983ed Andrzej Hajda    2023-10-25  713  		debug_objects_oom();
> 265c43c4e983ed Andrzej Hajda    2023-10-25  714  		return 0;
> 265c43c4e983ed Andrzej Hajda    2023-10-25  715  	} else if (likely(!IS_ERR(obj))) {
>                                                                           ^^^^^^^^^^^^
> obj is an error pointer

Ah. Right that's silly. lookup_object_or_alloc() either returns a valid
pointer or NULL. Let me amend that before I move it over to tip.

Thanks,

        tglx
