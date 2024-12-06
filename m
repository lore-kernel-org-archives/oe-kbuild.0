Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697183D6B;
	Fri,  6 Dec 2024 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733473033; cv=none; b=I32o8cSeW+0eMjRPj6p+zDU7NpOpF3d5VC7IKEwdU2Ac5PtluMCIOaTMTSJFyox0RxHau7rcw1CC631FV3/wdcBpzwgCyRNSZC/rMnFZOan50Lb8A296CXAmlcAMA/fhDwT6tH5z6DjzySDrknqjkSTpGYOF4nycCOxLklcKHtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733473033; c=relaxed/simple;
	bh=cY1qhaJjdCsfHQTExQUU7al9YWuOPwC7lLLwkFrYKFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nl7W/TeT6ASWuKasjF84lPx/jyIFoiZ40IPJ7fXBZVI+ma/JmiRRUkh+Fk6burekNyCB7kW2vBNfBmbGxdJmDRJBaPupXZbR6duDYozGF2Cn+UVL8mUcCvvk1kvLJbOxlcH7YSjv1mZwGFnDLcIkY828GbkGSqwORUzUWaGzpGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GAP54FFX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LER5jXj4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GAP54FFX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LER5jXj4"
Date: Fri, 6 Dec 2024 09:17:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733473028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oMUEKOwHtV6qIk9Bpv36FKOKKeL4hYi7T0ntu/Rk9zY=;
	b=GAP54FFXXp1ZbtlNdJWJjd9R0Q0GJbpMckCLa3gjMOQBPgvJVJBtmAuMhN2OZtuy1g8Md0
	uYLbnznsmf/ZC+GiIue5GT4QGx65faw/xpquJ5KwYAJXqhfVH8YT0F7RAImZbDQ/DLLIBq
	kcQS0/iIIpL/jJBXuHNnDSOC43s63krF+JeNoRvEOlz1rfPXpsBPxVDBog8WMnNpzJxh1+
	L2ld2KpDP9eVvuLT0onQ42W9ZIIQMefPuIbrec6Mmo4aguhcgJelM9eY8vk84vWSbl+898
	x40S+AuO1duRb0gWspnySrOXcVLyv7I5P2bvBhdroo4UHZKRv8ZDjSMpAQHVVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733473028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oMUEKOwHtV6qIk9Bpv36FKOKKeL4hYi7T0ntu/Rk9zY=;
	b=LER5jXj4aXrmAjw7WGe3fxpPVAqzEjqFDwBxfIPTG6upwKowC/sW+swP42f1aJdI5AoWOI
	NxDUyeu8gdgvpOAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [bigeasy-staging:futex_local_v4 7/11] kernel/futex/core.c:1364
 futex_hash_is_invariant() warn: signedness bug returning '(-22)'
Message-ID: <20241206081707.oXCcAsUg@linutronix.de>
References: <3f216cca-7830-4aad-a4c4-21713e185590@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3f216cca-7830-4aad-a4c4-21713e185590@stanley.mountain>

On 2024-12-05 10:57:09 [+0300], Dan Carpenter wrote:
> f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1355  bool futex_hash_is_invariant(void)
> f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1356  {
> f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1357  	struct futex_hash_bucket_private *hb_p;
> f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1358  	struct mm_struct *mm;
> f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1359  
> f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1360  	mm = current->mm;
> f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1361  	guard(rcu)();
> f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1362  	hb_p = rcu_dereference(mm->futex_hash_bucket);
> f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1363  	if (!hb_p)
> f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03 @1364  		return -EINVAL;
> 
> This should probably be return false?

indeed. Thank you for spotting this.

> f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1365  	return hb_p->slots_invariant;
> f660409ae182f97 Sebastian Andrzej Siewior 2024-12-03  1366  }

Sebastian
