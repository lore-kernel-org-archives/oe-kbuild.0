Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9027729A8;
	Sat, 12 Nov 2022 17:41:14 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668274867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TcoyRNAdDGi2GFtPX5lXyeqindlf/1rXODkCe/Mq7m8=;
	b=J+I06WlmZx3TZaRprCPcfUdFK9PZTmWViLEOn5G8Jxs01npQJqfqTTtX5/oUCkF5Gedsjt
	51ALTmN7Bsz2RTqQoT7fbqOntfjInE5zrpoF9Urww7paCOmhsKCrtx4xg3pxZBNsJvUKEP
	E5PS+9rxUA+KV/ueBCthDzsNnKmiLrVB4f/hbovWCUaWD+oNUhsWB3xIYmExT5iRB7qSlQ
	8pQmu0+FvufxnoRhB/0b+3rpL6ctd4AcQCKMvfF7mGIg8ON31CpzUiaKWozEE2DvPVFzO7
	yopS7bF6Q1iCbNGmDM5jsohrqKFionhbXX5LY8WCYH+gjc0XhOewTnpdVutD1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668274867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TcoyRNAdDGi2GFtPX5lXyeqindlf/1rXODkCe/Mq7m8=;
	b=O1RZFG3z+xLK3eDulsXE3zVDpB50SAxHrh9aUh+ej81/NWzxcz4Ng/iQ/6KujdRKDWcvJb
	G6jJ0KUi+zv0AvBQ==
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev, "Ahmed S.
 Darwish" <darwi@linutronix.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Ammar Faizi
 <ammarfaizi2@gnuweeb.org>, GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: Re: [ammarfaizi2-block:tglx/devel/devmsi 46/86]
 kernel/irq/msi.c:399 msi_domain_get_virq() warn: inconsistent returns
 '&dev->msi.data->mutex'.
In-Reply-To: <202211070346.0vaondmd-lkp@intel.com>
References: <202211070346.0vaondmd-lkp@intel.com>
Date: Sat, 12 Nov 2022 18:41:06 +0100
Message-ID: <87a64wcbpp.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Nov 07 2022 at 15:39, Dan Carpenter wrote:
> smatch warnings:
> kernel/irq/msi.c:399 msi_domain_get_virq() warn: inconsistent returns '&dev->msi.data->mutex'.
>
> vim +399 kernel/irq/msi.c
>
> 495c66aca3da70 Thomas Gleixner  2021-12-06  378  	msi_lock_descs(dev);
> 022573e1aaf074 Ahmed S. Darwish 2022-11-03  379  
> 022573e1aaf074 Ahmed S. Darwish 2022-11-03  380  	base = msi_get_domain_base_index(dev, domid);
> 022573e1aaf074 Ahmed S. Darwish 2022-11-03  381  	if (base < 0)
> 022573e1aaf074 Ahmed S. Darwish 2022-11-03  382  		return 0;
>
> msi_unlock_descs();?

Indeed.
