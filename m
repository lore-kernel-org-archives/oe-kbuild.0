Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6684F1A5B5;
	Wed, 22 Nov 2023 09:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="v6CvPxfJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="B4Bgtlf8"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1700644871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lB2NLdBcb9xAkWEgD6EILecguP/al1SLoHeC1PeJ7hM=;
	b=v6CvPxfJHd6Gphi4okPTeYUoJtB4omPyyFmp0E7YLBi7k35f8+4YvVBcyu0WgvVrqWhvI1
	G86Z98IKJnanMKIwZqTE7K+Y42zlXRB1gPqgKk1Hi9ZS7y+bs1fgJ/qQRPLxF2yiBDv57Z
	PpZDX9tEGqkfTe7HYOgpugomTOnQSx6+xoo+KYnnkZgRmwu4u22UaOy2xus439cUU3Sqk2
	qz5XGw481KXF10/sIFO0zJGO3rFPGgyOZMCX2Ut8Ra9CEp11yYsDdJgzECRxmYL0E0FWWq
	4FzjMjy2iQ1r8GDcvn3vbJcOtfG48xU+TTNyv/9yol0DjgSEfAA07Kk3IVj2TA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1700644871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lB2NLdBcb9xAkWEgD6EILecguP/al1SLoHeC1PeJ7hM=;
	b=B4Bgtlf8KF7nqLG5rYDbaDkU3T5n24zoGg279QbU8GRO95OA2bXn55yGQKKy20FmqbtZaE
	fGvlo6epjB01McAw==
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 Andrzej Hajda <andrzej.hajda@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [tglx-devel:queue/core 1/1] lib/debugobjects.c:730
 debug_object_activate() error: 'obj' dereferencing possible ERR_PTR()
In-Reply-To: <87pm0316gm.ffs@tglx>
References: <2999d03c-4002-474f-9654-e9eded9af8c3@suswa.mountain>
 <87pm0316gm.ffs@tglx>
Date: Wed, 22 Nov 2023 10:21:11 +0100
Message-ID: <87edgi16uw.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Nov 21 2023 at 16:17, Thomas Gleixner wrote:
> On Mon, Nov 20 2023 at 03:55, Dan Carpenter wrote:
>> 265c43c4e983ed Andrzej Hajda    2023-10-25  715  	} else if (likely(!IS_ERR(obj))) {
>>                                                                           ^^^^^^^^^^^^
>> obj is an error pointer
>
> Ah. Right that's silly. lookup_object_or_alloc() either returns a valid
> pointer or NULL. Let me amend that before I move it over to tip.

Bah it does return an error pointer. Let me stare more.
