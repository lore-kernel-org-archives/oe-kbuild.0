Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4E82EC0B0;
	Fri, 29 May 2026 08:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780044832; cv=none; b=Hmsnuk4YhZcKUN+IMjSzr/0sEtntg3EcILmts+Gu/xkUog2fipyDgU1Ff0PFhrCMML9NKatHqccN+7z5LE0W94c6Tl45V02T8USoxJJDlIeA8HF03RpTtPbU2XEcTTc4UnFZqrzDaWNWQbw81UeqgVg86+RWGacoUKmP/KyLU5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780044832; c=relaxed/simple;
	bh=YK5mmg4ZFL2N2KQuKAdzGY9b67CYNIYCA7NTCQpfAoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+rSwDdOs03Qc650FMyCDd66nNYLVvXoOekA9F0RV3vPIHWSMAqUE1w1l/+fhMxWo9GhxTL8gwBFQP0Kt/u/FqRyBnX7kMokrM4kAaSzTMlOQeuRGAcyr7sNCa/ySi+t1PNIkzWKwwPHGkbC4RnBq4YiT/XMKzTsy2oX3fN9mxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M4PrkdPD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QsA8tKY4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M4PrkdPD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QsA8tKY4"
Date: Fri, 29 May 2026 10:53:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780044828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MNWmO9WOVqMwMAfQbe12V136EMySKd/BTb2XrZNUavw=;
	b=M4PrkdPDUgvMPM/9tNiPXGGhc/v+zrO61XRPdsgyq0pZwRrCREFaEToMsA1Zd01UEOVA6q
	rvp+8e4upW5IRthKqNKddiAT8LNdb8y9erPuzlawATfz/Bd6Hkw03+pscQ+gGv4BUFsWny
	dU7oXgIhNbG/RDRw0ldSIw8iCRow+QfJcMwiwe9fua+KxfnLqmD1yKebYVV3jMIRX5yFWg
	8JlwFuAD0alG3uvD1CgTo7ToQtDQWGC7EICULSmaKUKiefonqxFIMT6gOHOZUacoopaAmH
	QSPN7zh8tubYgVmSeNkuaint6z0IY+DyVKKMdokDtzAVjaNMMFTjmd8HStoakA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780044828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MNWmO9WOVqMwMAfQbe12V136EMySKd/BTb2XrZNUavw=;
	b=QsA8tKY4Xj7kYxMvULvFkcrhtqCUJAFpmL0JOGr9Lv2iI8w/HUfMXYi+NrHPjFas2Xh3BA
	BjINfqXVK9lxr6Bw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [bigeasy-staging:b4/hsr_ptp 3/9] net/hsr/hsr_forward.c:381
 hsr_create_tagged_frame() error: use kfree_skb() here instead of kfree(skb)
Message-ID: <20260529085347.m2iV71fz@linutronix.de>
References: <202605291505.4v18xVW0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202605291505.4v18xVW0-lkp@intel.com>

On 2026-05-29 11:00:19 [+0300], Dan Carpenter wrote:
> 0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  380  err:
> 0acc8103869743 Sebastian Andrzej Siewior 2026-05-19 @381  	kfree(skb);
> 
> This should be kfree_skb()

Yes, thank you.

Sebastian
