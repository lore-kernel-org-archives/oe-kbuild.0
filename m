Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ED6125AF;
	Fri,  8 Sep 2023 16:21:52 +0000 (UTC)
Date: Fri, 8 Sep 2023 18:21:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1694190110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vmVvjAj3001Wx5JOO/QMi2AXcneSQhKaOdDVVCmBwUA=;
	b=2zU3KKQFI9J/tF6WM74ZPuX9ipTwfVcv9dd7mnx5IKsKtmEOy0IABBLnmkIOQTD+bVaLeM
	68LCE5CmUDe4mwTOH0b/c4aY7X7Gg4gdEsu169R/GmKzXUaaTwh6kGv6hqjSPB4OGkGo6i
	BKDVYCeD9CwD+w4oLn06WaUa8MxDPRar2B4SRnupiTOiI+2ERjMGksgZ7ZK+CvXx8XCvkW
	nKDQLyjIps92p4w4xyusDSAQ4Py2O73kM3zQ8EMSw9o83GLcg2tiQ5SatY2p2fvKwwnyVU
	UwHUzCQkw+AfWMQEijWy1JcqFcN/B0N6174mTSGcc7jgyXSn/jAzhqlGTcrETA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1694190110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vmVvjAj3001Wx5JOO/QMi2AXcneSQhKaOdDVVCmBwUA=;
	b=sp5UVc8UH5Qfb/tMfbKjQJBpAkqax4ueUacvfZJ3n2zWf+JpIPR7ETMWVv/nVCbIz6AzVi
	L9c+Xb4S5xfREiBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, John Ogness <john.ogness@linutronix.de>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [rt-devel:linux-6.1.y-rt-rebase 21/51]
 kernel/printk/printk.c:2468 __alloc_atomic_data() warn: returning -1 instead
 of -ENOMEM is sloppy
Message-ID: <20230908162149.MFz67ycS@linutronix.de>
References: <a6fa0763-b82f-4eff-9e50-06519db5722d@kadam.mountain>
 <20230908151924.S37nvge4@linutronix.de>
 <3e2976e8-57c7-47eb-97a5-8fd5254c89e9@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3e2976e8-57c7-47eb-97a5-8fd5254c89e9@kadam.mountain>

On 2023-09-08 19:15:31 [+0300], Dan Carpenter wrote:
> Forget about it.  This doesn't matter at all.  I thought since kbuild
> was reporting it then the code was new.  Sorry for the noise.

Okay, no worries.
If you find something in the for-kbuild-bot/current-stable branch I'm
all yours.

> regards,
> dan carpenter

Sebastian
