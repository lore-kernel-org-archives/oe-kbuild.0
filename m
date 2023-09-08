Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C476AA2;
	Fri,  8 Sep 2023 15:19:34 +0000 (UTC)
Date: Fri, 8 Sep 2023 17:19:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1694186367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=skOvLYqG5OrnXpxmdSsXQwhSdOfiX2OXfLsUUUfu68Y=;
	b=rEfAHmMOcCEDJdVj7iBf4302n87rdfSnUdjJWDcZJ+yHnw4AItXGPdVmHbQqDsEyIG8nVN
	oO/VGDxJ546SCPStrst7CbLqZew8wWXb/A34GlyVnkxxdw3Cf3RjS4zKGKRBVAK7GaOLgK
	8gtNPTZmK1wjyrHmGDo9e6N3J+At4iTkWWdzFcdw1sCXutoE3C+v8sfLcts3OJiXPU5YlE
	nCmhKztw2kbd7E+gK97BD/9QtYdAoUhdsDEr+8CHpCpb+T63I4Db93MMyfeazjD7sUmwQu
	KKatJguZ99gwBZXbDHRXnqH8wUrUIynkF9iy357AZQBFN+Ytm98ZKd/DogfQQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1694186367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=skOvLYqG5OrnXpxmdSsXQwhSdOfiX2OXfLsUUUfu68Y=;
	b=eVsEwaFD2Ol/nxffkQxu6cfXscXWSkMRFYZc3wrqKp2wLmugCvVIdwvDsuQ/vB9OTIVzTc
	5y+2/mWpE8CSzTDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, John Ogness <john.ogness@linutronix.de>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [rt-devel:linux-6.1.y-rt-rebase 21/51]
 kernel/printk/printk.c:2468 __alloc_atomic_data() warn: returning -1 instead
 of -ENOMEM is sloppy
Message-ID: <20230908151924.S37nvge4@linutronix.de>
References: <a6fa0763-b82f-4eff-9e50-06519db5722d@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a6fa0763-b82f-4eff-9e50-06519db5722d@kadam.mountain>

On 2023-09-05 12:43:35 [+0300], Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel=
=2Egit linux-6.1.y-rt-rebase
> head:   90d96fee668dc306dd748393383c0fc74b798eee
> commit: cf8dd889ea20ae7091d3b27029b07bef13298291 [21/51] serial: 8250: im=
plement write_atomic
> config: i386-randconfig-141-20230828 (https://download.01.org/0day-ci/arc=
hive/20230828/202308281100.1LIdaKaP-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230828/202308281100=
=2E1LIdaKaP-lkp@intel.com/reproduce)

Now that I looked again at it. The 6.1 is outdated and no longer
updated. The -1 vs -ENOMEM is not present in the v6.5 series which
current so I can't fix it there=E2=80=A6

The 6.1 tree itself is stable maintained. If you want this fixed in the
stable tree for 6.1
	https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git

and I assume it is there, then I would send Clark a patch=E2=80=A6

Sebastian
