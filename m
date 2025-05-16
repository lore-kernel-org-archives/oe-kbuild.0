Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C3817AE11;
	Fri, 16 May 2025 15:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747407617; cv=none; b=IWAE3YXpekC8d1OU+qyXZmoXsh6zND/3gVpUsmL1Yj6kIyHRtvKp4xSolJZTNedC6iAaAXf7EEspAo7HpO6J8Z86gvnGO+3CVJ/0BXv+Oxe/h7k4H9BU6pINZ8wtjJrmedNiyWFcDSSkPs3twQz1y2o+UEBTH9inOd1RfcnGJ6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747407617; c=relaxed/simple;
	bh=v96n5iiAHHqMfFUbaCXpj7ufULHqoumXcVKDhrv6qCk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Hz/5p/10jca53WFV8BfUn7bKHwnagcwYz0sTkTeNJmA72fAxNYkpG3QpwThgOyTMUvRNxbaMg48s0KlMkq9FTlNqsWeuY7YI9VZwe875QaonY9b5iGm7/HjPlC0PND6djdYWZDSmr8J0gVmIbHm3brlGwBS2V2Gf3NfEfO+N4Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Hrp1CwwW; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Hrp1CwwW"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 33BA943959;
	Fri, 16 May 2025 15:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747407613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bZ6faYT8fnXQ6ScBXuSsIagMYz8he0aFldvIQNvvFho=;
	b=Hrp1CwwWIbEeHSIYxnu5ov3sGoO7SSECi6tFGMR1jRnsDnLzSdSjgZTgd/Zg0sda5ZCqrx
	cFqhneUudGV60u63qnUNVPnvIyfvtkBWM8nPuqi7w66TmBwm6VVZFu28lVkJU0ZnKypsSF
	OVBL7TmpgbMRqxG1cxsRF4ORKJGfehLEhG5VqEWNfpiX6sC09QrLL1sCAiFMH/mALUt/UN
	AghhU1KJ6miE+Y+zw8oQueSkOt0CA/R5+JUu+yLDEvElNiCFRByKpds9NKmkPJD/uBgwtS
	nOcYouqExGDwUrsPbJXOXdUFvgcza2O2Vo3gR6u+mY+bl05NA+vFFcpGJu747A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev,  Keguang Zhang <keguang.zhang@gmail.com>,
  lkp@intel.com,  oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 6048/10031]
 drivers/mtd/nand/raw/loongson1-nand-controller.c:374
 ls1x_nand_dma_transfer() warn: passing zero to 'PTR_ERR'
In-Reply-To: <1f6eea14-762f-47ab-ab84-4e9d1e95883b@suswa.mountain> (Dan
	Carpenter's message of "Tue, 13 May 2025 17:42:12 +0300")
References: <1f6eea14-762f-47ab-ab84-4e9d1e95883b@suswa.mountain>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 16 May 2025 17:00:12 +0200
Message-ID: <87cyc8d2ir.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeftdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvieduudejvefgvdevuedvfeejgeevjeduhfeuteekteefuefggeevfeeuveehhfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpddtuddrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepuggrnhdrtggrrhhpvghnthgvrheslhhinhgrrhhordhorhhgpdhrtghpthhtohepohgvqdhksghuihhlugeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehkvghguhgrnhhgrdiihhgrnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhop
 ehovgdqkhgsuhhilhguqdgrlhhlsehlihhsthhsrdhlihhnuhigrdguvghv
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Dan,

On 13/05/2025 at 17:42:12 +03, Dan Carpenter <dan.carpenter@linaro.org> wro=
te:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   ed61cb3d78d585209ec775933078e268544fe9a4
> commit: d2d10ede04b1671dc4762479a2d06f183aaafbba [6048/10031] mtd: rawnan=
d: Add Loongson-1 NAND Controller Driver
> config: microblaze-randconfig-r072-20250511
> (https://download.01.org/0day-ci/archive/20250511/202505111115.FfRZilcq-l=
kp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 14.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202505111115.FfRZilcq-lkp@intel.com/

Thanks for the report, but I believe it is a duplicate of:
https://lore.kernel.org/linux-mtd/174706014455.62075.9908160461728250420.b4=
-ty@bootlin.com/

Thanks,
Miqu=C3=A8l
