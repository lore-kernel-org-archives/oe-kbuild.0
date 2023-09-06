Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B190362;
	Wed,  6 Sep 2023 06:56:28 +0000 (UTC)
Date: Wed, 6 Sep 2023 08:56:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1693983386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4P3mgMLyNgdvJbR13D0n1tFEyohBV/oy/ERJS86V20g=;
	b=nEaGNkX0jMyy3fC2J5lB7jTXUuMSS32MypziVY3e1QdJX4fZpLY7SBr3q5aIZ1euZZUVLF
	i4XhLrDVlsnchaVeIVnym2G0yTnTbb7s+INK6BL7vXzeo/YOdWGEmZm1uMQc5kbj1X/4R+
	GtaTt2+z+VqbID4J80mGKpmTSNZa8bjO1Xsy3rPWRDcXj2d1xyH5j+vpW1xcc6I4Au592m
	clDGuKIy15XuZhiJEPjK6AxSy0EtxsoPOQ3f0bZRN7AoFsN7oPoSnHkOIGFo5ZikVCvz0C
	T25dwcnHdRBGcLesDx2ZwI4xMYEM/4+HXpq82Go8IMjB5dVtfqX0mYpQ6Y/HmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1693983386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4P3mgMLyNgdvJbR13D0n1tFEyohBV/oy/ERJS86V20g=;
	b=iDrJTULF1HsK8nT0h1aZX9VkwFwKbXLbh8YCSJv2mSN18WP89G7fijNpya2Xw7pe911y+d
	PtCoUG8tTBEDy0CA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: John Ogness <john.ogness@linutronix.de>
Cc: oe-kbuild@lists.linux.dev, Dan Carpenter <dan.carpenter@linaro.org>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [rt-devel:linux-6.1.y-rt-rebase 21/51]
 kernel/printk/printk.c:2468 __alloc_atomic_data() warn: returning -1 instead
 of -ENOMEM is sloppy
Message-ID: <20230906065624.NQVgGNrB@linutronix.de>
References: <a6fa0763-b82f-4eff-9e50-06519db5722d@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a6fa0763-b82f-4eff-9e50-06519db5722d@kadam.mountain>

On 2023-09-05 12:43:35 [+0300], Dan Carpenter wrote:
> smatch warnings:
> kernel/printk/printk.c:2468 __alloc_atomic_data() warn: returning -1 instead of -ENOMEM is sloppy
> 
> vim +2468 kernel/printk/printk.c
> 
> 09cbc4e64a7546 John Ogness 2022-02-04  2464  static int __alloc_atomic_data(struct console_atomic_data *d, short flags)
> 09cbc4e64a7546 John Ogness 2022-02-04  2465  {
> 09cbc4e64a7546 John Ogness 2022-02-04  2466  	d->text = kmalloc(CONSOLE_LOG_MAX, GFP_KERNEL);
> 09cbc4e64a7546 John Ogness 2022-02-04  2467  	if (!d->text)
> 09cbc4e64a7546 John Ogness 2022-02-04 @2468  		return -1;
> 
> Just return -ENOMEM.  Even if it doesn't get passed back to the user,
> it's just better to do things in a normal way.

John, are you going to integrate this or did you rewrite the code to the
point that it has been "fixed"?

Sebastian
