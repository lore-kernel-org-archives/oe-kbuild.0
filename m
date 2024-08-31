Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED6211712
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Aug 2024 14:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725115015; cv=none; b=MskHrbSs9rAlZc1IkgvMxqJkK7P7h+ELJnF0TLcVxR5X9GQHlRG2P/wzC9oYnW4sHin5W3J3XWlta2jVz5A2TO9qn8zj1W9t1Rduonpa6bwHfTFU1NXIum07GV1JTZb8ae1LGhOVpAPK+z43Wxst+i6TsjlAtAk72KFrRRVeT2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725115015; c=relaxed/simple;
	bh=Jo+1+h54Wyetpo7aO/P2L4VBPdK3T1+bVFrEV++xy3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NHiSDQZg/pN/97Ls35Whzj0XFIxZg98Z4HXVf1HswTavj55t/jo7aBcmcLxV5fjHrBMOvdSVjNUOYPmNa6k8gItt89sVnSyhC4C2XamgGttTG0zJp55G5gYHiSco/xrSssnX9N/of8l/qVG1OXBOCkwE2YXbiDwvzggkospRUU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=goS7OSQF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="goS7OSQF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42c5347b2f7so5976775e9.0
        for <oe-kbuild@lists.linux.dev>; Sat, 31 Aug 2024 07:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725115012; x=1725719812; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SnxUaZW1hiT+pez+rLDt15E0bcJfGz2A/Fx4lCrlVxY=;
        b=goS7OSQF4wJP+CRR4w4f6A5zEDIbLVjuGa4BeVWOl7hW43CDZxXaTeSTNFt0dbBP94
         SA/8VA0yV1HLxjQG2NcuFh63NmpZ+JyUxXz5l1RGh9HWK3eBdWl93Z/aGeqyOQnLtVKk
         n0finu4FeOaXNzfEzCQncOREFFX5EjEMrLyX5dFm5ZAQ9hDcmW7ry02HL2hUP9db43P4
         vnBER14s/kZLdsqu78hg/LnMgKINgOuH0hTKTe6YYq1wzMUB0eB8Oh4FS1VnHV1vQ9Om
         6kVAxCnhG+bSo33ltOYX2g3h+yj8fHCuYWt/RnEpn1Zjf4YXYICl/ZqC/tkwqxmcAUw0
         rPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725115012; x=1725719812;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SnxUaZW1hiT+pez+rLDt15E0bcJfGz2A/Fx4lCrlVxY=;
        b=ivYclNLVlc/BvIbW60m1As5OEvYw/TBwLt3NtETnyamTDz3EsYh/Ywwq8Wde9W2Q18
         FPpJsRUm2RDP8yiIyQ/hm24+cUhZQ0iHO41/14RY3BX01IrC987te7W/zTah79B7NJZd
         F5lHW5JJ1MhBz14XfoErQ7lEsvJx19PyEkWeJtv0bgiMnl/gvNUdM3EKrBlFcVP2yELV
         nXBrT8g3lg+c6KV4+zY+ITYpNjvKBBTz7sAv7bpuK+ibSlAdfGWx2yGmmabE35+SYdRg
         Hs5uckUnGs0y7zy1yYl76ZDeRw3jswrQT9WRpTCEWb3V4+NI//hA8a4MajiLGLTv6vbY
         BV2w==
X-Gm-Message-State: AOJu0YyPt/PgEzjdZS8La6wsV+7HjFE5zO0pssXLHJ6FDr9vdCo4YX7Y
	NSJx8GWq7Lt6ObBvVB2WY0IUxTrp5z4VHt5hUqvd7OHahhuYgwS5r0fdBW8QUoFt8FxUWuJz8Qf
	C
X-Google-Smtp-Source: AGHT+IGwZtvsreGHafny6AmR3dsjkdwKHgJg5LZ80KDOrZpSysvmSOeqR2omJ2QlHTbSo/0H663OFw==
X-Received: by 2002:a5d:424b:0:b0:368:6f30:ddf1 with SMTP id ffacd0b85a97d-3749b58750amr5862439f8f.59.1725115011978;
        Sat, 31 Aug 2024 07:36:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749efafb30sm6723348f8f.94.2024.08.31.07.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 07:36:51 -0700 (PDT)
Date: Sat, 31 Aug 2024 17:36:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:slub-percpu-sheaves-v1r1 13/13] mm/slub.c:5070 free_to_pcs()
 error: we previously assumed 'pcs' could be null (see line 5069)
Message-ID: <54fbc08a-43f9-4193-bf6e-f070900346fb@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v1r1
head:   000f7cce0fe19452a5ecbc350b16d7d8ac68d8ba
commit: 000f7cce0fe19452a5ecbc350b16d7d8ac68d8ba [13/13] mm, slub: cheaper locking for percpu sheaves
config: parisc-randconfig-r071-20240831 (https://download.01.org/0day-ci/archive/20240831/202408312123.B5VrU0tZ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408312123.B5VrU0tZ-lkp@intel.com/

smatch warnings:
mm/slub.c:5070 free_to_pcs() error: we previously assumed 'pcs' could be null (see line 5069)

vim +/pcs +5070 mm/slub.c

9488f19d44934d Vlastimil Babka   2023-11-15  5060  		if (!empty) {
000f7cce0fe194 Vlastimil Babka   2024-08-28  5061  			if (sheaf_flush_main(s))
9488f19d44934d Vlastimil Babka   2023-11-15  5062  				goto restart;
000f7cce0fe194 Vlastimil Babka   2024-08-28  5063  			else
000f7cce0fe194 Vlastimil Babka   2024-08-28  5064  				return false;
9488f19d44934d Vlastimil Babka   2023-11-15  5065  		}
9488f19d44934d Vlastimil Babka   2023-11-15  5066  
9488f19d44934d Vlastimil Babka   2023-11-15  5067  got_empty:
000f7cce0fe194 Vlastimil Babka   2024-08-28  5068  		pcs = cpu_sheaves_trylock(s->cpu_sheaves);
000f7cce0fe194 Vlastimil Babka   2024-08-28 @5069  		if (!pcs) {
                                                                     ^^^

000f7cce0fe194 Vlastimil Babka   2024-08-28 @5070  			barn_put_empty_sheaf(pcs->barn, empty, true);
                                                                                             ^^^^^^^^^

000f7cce0fe194 Vlastimil Babka   2024-08-28  5071  			return false;
000f7cce0fe194 Vlastimil Babka   2024-08-28  5072  		}
9488f19d44934d Vlastimil Babka   2023-11-15  5073  
9488f19d44934d Vlastimil Babka   2023-11-15  5074  		/*
9488f19d44934d Vlastimil Babka   2023-11-15  5075  		 * if we put any sheaf to barn here, it's because we raced or
9488f19d44934d Vlastimil Babka   2023-11-15  5076  		 * have been migrated to a different cpu, which should be rare
9488f19d44934d Vlastimil Babka   2023-11-15  5077  		 * enough so just ignore the barn's limits to simplify
9488f19d44934d Vlastimil Babka   2023-11-15  5078  		 */
9488f19d44934d Vlastimil Babka   2023-11-15  5079  		if (unlikely(pcs->main->size < s->sheaf_capacity)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

