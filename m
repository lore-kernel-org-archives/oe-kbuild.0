Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA85365A03
	for <oe-kbuild@lists.linux.dev>; Wed, 27 May 2026 19:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779909193; cv=none; b=AGGeQf5tMs6c7P55/gfpRx2AetEpqsLPsSfyfRjcKj3pwJmnfy0q+LqDN6qkbKPPPw+xHZlEI1Du3pPcrdIp+9v/OECa5YY2yNPt6CR1WLwz6t48cH7k4vNANNDDfCA79vGzhbwBfmLV2s/6OW+1m9tRJ3GiH8sWWOaeqYqfhLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779909193; c=relaxed/simple;
	bh=z3kvo3WLagg06+RgWih/Ik0h/y0BaH1lzt2bmYD0gMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uUfaJ2sSL9VHCItVmLMZ12lOxII8oS7Z3qbC94j7jq47RFz9cXUt5Z4kd6T3M6zNDWYEZuAKn/E3qBtzQpLwRbToyrOJkMXNvy2LkGYdEi3w1LVnF/75WRVB86qqwsp/ad4rVHMBtvPUl6ChKGsMbd0cYmWpSwmhSxoHQ7aRSeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vtl/2H8H; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vtl/2H8H"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48fde648a71so80066215e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 27 May 2026 12:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779909190; x=1780513990; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jpxBKDh5pDd0JFZBOF4cl+ZIfpcNg83H3YdC1zjzFa8=;
        b=Vtl/2H8HHZgvsaxTGbbSlsZBI8QQ1Xm/NrdcR8XEgU+iFnYPDUpkCVq/3w/4OQrk3M
         rrHosvQqRgQ/9il3/J4pY7gZegDtLB6zwiEzMdXKNKK0lP9kGpXqNi13kYiAZDYtNGo9
         ilj7ZHoFLOQ4tCYKo9wHkaFt0fHJ0aW4wf5rz49pbL1TqCGsrkNlqGmXZvqP1FgIFsgl
         T6FhgWU/+e7xBD0xIFnin6/sas/P9RmRayHFxLhdezoAbIviSHl5WjmaRaSsX5p8SzZH
         jnK4N8dtPU2+M67oG71kUAmGUgYgF5rqAq6ZB1/OoGJIj/HQAhUR5PXUuqEvHbkG5ZZU
         NSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779909190; x=1780513990;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpxBKDh5pDd0JFZBOF4cl+ZIfpcNg83H3YdC1zjzFa8=;
        b=MGF6wokQ9fUlShT0hU3Tq+A8SxzKRB7tZCVDKbzuSlD+GPrfLdQar7h96gZEulnUyT
         jqUuhaQo4YAuiyyqARMxC+eJ9I9Dsn65v4VOgTDAT6dcaftrXs5gpcBMEUlHZw0DEIE8
         3g57NxhBNVE8JMVEQqFeFjiw/Si/Wj2cYgrgFxAtyq59Xi91Y65E1QDymj9RrEnj06ke
         8vpECzb4h7W2dwSNJX/9KzU/ajX8SlCu1XltZv7iiZfPD9nJ16pGf/N5euCN5uFnc+7v
         0wsHUp5FkxoiRNhmuRxONTaqJfiJ2CWkem+jzDYnnUikfhNb5O1UjNXmLeUBLPmdsidi
         5VqA==
X-Gm-Message-State: AOJu0YyQ+5aVFNlP7dSrTHYfHNVIjrwDoOshfrGKzPpqssCLKarWQwXH
	eWQrGBy4LruBStrrns0M+Vz1H6bQkpnDZnhsaejP0C0mTFqS7QqrJtUM7KtMbw==
X-Gm-Gg: Acq92OElQfjVTgRWy17c5UW/RuX1OlmDxsLOUOn9MiIKppSq7IoH+9U7R2Yrm87fK1p
	aKQ9ZlvHU3dzdBe/I6pRV14PBUUSFSzY5ssCi3nncn2np0NFBYsQ+h4XY62wdiw+FBrs/6bmdEN
	dNe9nV9HatLbTuxiJL8hIfeZLv8xCUDWt4RBNFJtGWy2FZkoc/ylWsqlaOYLiO805RnTVSbiE5X
	1MuFVvmA+4tZLW1k33wqoR6x7Jp+fAvfs45cBmHRCMyiVG5Cas6D4yHNoo8DcLb1xJd2SIhzsVS
	H6EU0f6cpX7bvssmXsflO/MeZMjJb9Wph68eTFsy8VeeNZKjvqXTc8PI0FRQYjGtaX/6JhSN52L
	Nm1Djv6FbOmH8m8d5M2wHbLxa46ek0b8XO4SNCFdLSH6PvKaMZ3gZUCnvQ59zUGlR3sQ2om4hhI
	INori7eBA6F9//KUwNhDeOUJlG/cji6brDsg==
X-Received: by 2002:a05:600c:6b12:b0:488:7d5b:125d with SMTP id 5b1f17b1804b1-49035f2e4f2mr309955995e9.7.1779909190118;
        Wed, 27 May 2026 12:13:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5b2bbfsm8509775f8f.32.2026.05.27.12.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 12:13:09 -0700 (PDT)
Date: Wed, 27 May 2026 22:13:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Dave Penkler <dpenkler@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/gpib/ines/ines_gpib.c:917 ines_isa_attach() warn:
 'config->ibbase' from __request_region() not released on lines: 913.
Message-ID: <202605271229.d8wGTffx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260527191306.Q9fC3BtevmC4pVYSesaFCVyXFXr-u7QutrYQw9DGDY4@z>

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eb3f4b7426cfd2b79d65b7d37155480b32259a11
commit: e6ab504633e4c06e35377ecf3c8cbc304de79858 staging: gpib: Destage gpib
config: alpha-randconfig-r071-20260527 (https://download.01.org/0day-ci/archive/20260527/202605271229.d8wGTffx-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e6ab504633e4 ("staging: gpib: Destage gpib")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605271229.d8wGTffx-lkp@intel.com/

New smatch warnings:
drivers/gpib/ines/ines_gpib.c:917 ines_isa_attach() warn: 'config->ibbase' from __request_region() not released on lines: 913.

vim +917 drivers/gpib/ines/ines_gpib.c

cfa6673eae0281 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2025-05-02  889  static int ines_isa_attach(struct gpib_board *board, const struct gpib_board_config *config)
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  890  {
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  891  	struct ines_priv *ines_priv;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  892  	struct nec7210_priv *nec_priv;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  893  	int isr_flags = 0;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  894  	int retval;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  895  
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  896  	retval = ines_generic_attach(board);
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  897  	if (retval)
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  898  		return retval;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  899  
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  900  	ines_priv = board->private_data;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  901  	nec_priv = &ines_priv->nec7210_priv;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  902  
0de51244e7b7e3 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2025-02-20  903  	if (!request_region(config->ibbase, ines_isa_iosize, DRV_NAME)) {
0de51244e7b7e3 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2025-02-20  904  		dev_err(board->gpib_dev, "ioports at 0x%x already in use\n",
0de51244e7b7e3 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2025-02-20  905  			config->ibbase);
0de51244e7b7e3 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2025-02-20  906  		return -EBUSY;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  907  	}
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  908  	nec_priv->iobase = config->ibbase;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  909  	nec_priv->offset = 1;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  910  	nec7210_board_reset(nec_priv, board);
0de51244e7b7e3 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2025-02-20  911  	if (request_irq(config->ibirq, ines_pci_interrupt, isr_flags, DRV_NAME, board)) {
0de51244e7b7e3 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2025-02-20  912  		dev_err(board->gpib_dev, "failed to allocate IRQ %d\n", config->ibirq);

Need to called request_region() before returning and maybe something
to clean up the ines_generic_attach()?

bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  913  		return -1;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  914  	}
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  915  	ines_priv->irq = config->ibirq;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  916  	ines_online(ines_priv, board, 1);
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18 @917  	return 0;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  918  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

