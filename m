Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73673A8757
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 07:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857250; cv=none; b=ansBRU9tfxKawywIlep4rFhN0ehgWI6IVBu4GfQeWPi4bvQeAh23nhknE7BOZttS4kpkMeRrOoYxVd6N3TYYEptMVAsSNpJ1CxG4tU7T7FDyqI0Klr8HTqgivAAD6VIBLR2UAGAsBNBA2msh2rSRx4Ofy1gu8gIb5Aep3LP6lSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857250; c=relaxed/simple;
	bh=NEU8Av0vlUBzp5kKsTkFtklbYuwd1qHwq2q2D0FU8nY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mcq2xWsJhhrmBG5k2VGO+jRT86dlWJEaqYFcamnokjaJj97a2qGa1igBHTxjxJ1u45fzYXZ4OPggCM7Pa58+HbrCEnE8wmFqKI9hgbtHpunuX8H9b+8ZF/x/kkI0qh5KMbtA5dGj3XwsVkqurZKmpdpgBEumPmT/mXrIMXgN8bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npYsjt6C; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npYsjt6C"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439d8df7620so2919359f8f.0
        for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 00:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774857247; x=1775462047; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y8ZV7UGRrDw67LHE/kLdGf0yRxyZLc6A+RaF4e4HLAE=;
        b=npYsjt6CD5LzCSSYyy5RM1NM+HGXBxpoyb0AD1d+9mYLU7zgjmEdEjX6ISLKvOGw0t
         LQJ7MktutcP2lI5gVdjkBWcD+SGiRUnfloNtA2PoElWOFF8nCCoW2mrdzNmCx2YX+JC8
         k/+tZ9diO7s2vZC+Af96yVDmMMVrv23hgfl2LAv3Kmf9mwJY7ox+lxkfvkEVjild4+N0
         9iu5TBw6vJCIFiqoKc+OZj7LhKDCd9fVWvjJeKMJKzPTDEZp365It/3Xrc2Ye8dQGhG3
         iSrLu94T4Bre8yRvCk9DCfHsoTMhvpfi0lFD6vFGSxnovAyq1iu63PpRHKPfFj3D+zoS
         FwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857247; x=1775462047;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8ZV7UGRrDw67LHE/kLdGf0yRxyZLc6A+RaF4e4HLAE=;
        b=LdzBFAZCTj1b3Db8ZwLA7/Fv85N1cY24jud/0uuVtanUHCUtqFZ0AYls+T/EE7Dge0
         f4TcMY1BCS8IBARF37x1s7b9ggiruQmEgqElaLzbBtP0kLHhKv6/5IBXLuBGmRsyX3ke
         p9tbP6iBhp9HxMY6/ebFXvVujczqqoWZyUmgV9qvr0B5/FwjiaeMyHZc+4i1wfKxNHIW
         BnjGYLjW5b1vUD+k1HyNK1rlC6Dk/31kz5vc91uuIKsdbnifaSFk0NMwBdRqRgsaYIyr
         xQnSbZ8uC9l6fjB6GI6VFc9LI4fzB2LG9DWS5wXIEQersH4uvPdwugmO7A403wGibxKj
         9/YA==
X-Gm-Message-State: AOJu0Ywrtd0aJomKXTtTeEiZuSw4iXXAe97PSQ4nYeLbyDGnCMUOBkCs
	Bc1hDWRl7xjvs1498SpNQQO2m5RIfXOM6SoLTqOkxAb2yBbN1uvsYUm0Xp6qqA==
X-Gm-Gg: ATEYQzx6j3Qu0+6niln5qJo2hQPVZfUrmAgEvZEBHdJRt62UdrgfBdZFkUgFtsakITd
	VwTGQKYIg7L5OYGKVe0P8LBYrjMCTzOJZdmQUQaPLHP7OUSb6VtoMRX5lIXrBFAHplvvc6xX5IK
	dXuAV81ACiyUPoyMXiZPr4bgqT0+XaIudyUJOnh4QDNwUL4hESDglkBxB2+TA22QT5m9NGm+9Kp
	GOMkIItDIDbW8fCkC9p0WDS9F4t6UDqruJmNTUKU/wAWBh7Q7LUiCnfoWv4jefQ2tYLQrKvDEje
	RFQD/sva/rUgtXpbelm+wylDZD2awXjAjU1aaBS8PZmymJmwBJz+yU8IR+17QZGO1NuxWxROtWU
	Q4LxbDPjX9D58SFx6kAy9JF5QcVtOcrMW2NRyWL4fFeVbnJ8dBOE1fM022qJjnZFaCvKcUYDJIF
	kHFTdEJ6WRoJs87qsCLJ8=
X-Received: by 2002:a05:6000:2f8a:b0:43b:47ee:4586 with SMTP id ffacd0b85a97d-43b9ea4aac1mr18937756f8f.29.1774857246627;
        Mon, 30 Mar 2026 00:54:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm15835567f8f.29.2026.03.30.00.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:54:05 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:54:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 7/7] mm/cma.c:927 __cma_alloc()
 error: we previously assumed 'cma' could be null (see line 921)
Message-ID: <202603290833.9K8Zc8aA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260330075402.4EK6lN94ezSj01boMQzBDJ8dhQLUcxeXpaVTqSKnRWY@z>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   233c0add490b678592b7a7bf767018cece8826b2
commit: 5d61ead66dce096277985e4f198cd88bb43f3e68 [7/7] ANDROID: mm: Allow GFP_ATOMIC for GCMA
config: i386-randconfig-141-20260328 (https://download.01.org/0day-ci/archive/20260329/202603290833.9K8Zc8aA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603290833.9K8Zc8aA-lkp@intel.com/

smatch warnings:
mm/cma.c:927 __cma_alloc() error: we previously assumed 'cma' could be null (see line 921)
mm/cma.c:932 __cma_alloc() warn: variable dereferenced before check 'cma' (see line 927)

vim +/cma +927 mm/cma.c

8a504fbd272ac3 Carlos Llamas        2025-04-21  914  struct page *__cma_alloc(struct cma *cma, unsigned long count,
c009da4258f988 Frank van der Linden 2025-02-28  915  		       unsigned int align, gfp_t gfp)
c009da4258f988 Frank van der Linden 2025-02-28  916  {
c009da4258f988 Frank van der Linden 2025-02-28  917  	struct page *page = NULL;
c009da4258f988 Frank van der Linden 2025-02-28  918  	int ret = -ENOMEM, r;
5d61ead66dce09 Vincent Donnefort    2026-03-19  919  	gfp_t gfp_allowed;
c009da4258f988 Frank van der Linden 2025-02-28  920  	unsigned long i;
c009da4258f988 Frank van der Linden 2025-02-28 @921  	const char *name = cma ? cma->name : NULL;
                                                                           ^^^

c009da4258f988 Frank van der Linden 2025-02-28  922  
5d61ead66dce09 Vincent Donnefort    2026-03-19  923  	/*
5d61ead66dce09 Vincent Donnefort    2026-03-19  924  	 * GCMA allows GFP_ATOMIC, while CMA can only do GFP_KERNEL.
5d61ead66dce09 Vincent Donnefort    2026-03-19  925  	 * Both support optional flags NOWARN|NORETRY
5d61ead66dce09 Vincent Donnefort    2026-03-19  926  	 */
5d61ead66dce09 Vincent Donnefort    2026-03-19 @927  	gfp_allowed = GFP_KERNEL | (cma->gcma ? GFP_ATOMIC : 0);
                                                                                    ^^^
This adds an unchecked dereference in between two NULL checks.

5d61ead66dce09 Vincent Donnefort    2026-03-19  928  	if (WARN_ON_ONCE((gfp & gfp_allowed) == 0 ||
5d61ead66dce09 Vincent Donnefort    2026-03-19  929  		(gfp & ~(gfp_allowed | __GFP_NOWARN | __GFP_NORETRY)) != 0))
e20c2e5ba70ac5 Suren Baghdasaryan   2025-05-02  930  		return page;
e20c2e5ba70ac5 Suren Baghdasaryan   2025-05-02  931  
c009da4258f988 Frank van der Linden 2025-02-28 @932  	if (!cma || !cma->count)
                                                            ^^^^

c009da4258f988 Frank van der Linden 2025-02-28  933  		return page;
c009da4258f988 Frank van der Linden 2025-02-28  934  
c009da4258f988 Frank van der Linden 2025-02-28  935  	pr_debug("%s(cma %p, name: %s, count %lu, align %d)\n", __func__,
c009da4258f988 Frank van der Linden 2025-02-28  936  		(void *)cma, cma->name, count, align);
c009da4258f988 Frank van der Linden 2025-02-28  937  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

