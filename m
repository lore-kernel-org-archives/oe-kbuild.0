Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B703618C181
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Jul 2024 14:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721055078; cv=none; b=o9s1vj1qXJ9Qut3lvu6Xadf76/RtUTw/WmchpgktCa3wcQkb22253CBdtxhanyR59jADxLn/ifJ5PPV3iwgQz14BcpRkRYxdb9dCHODUjJuCb0bI9IIRmonyBvfxMAg9kpebKWQsyWlUeKW2NJE/qz6BMDFhtI2Z/bXzV6mGprY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721055078; c=relaxed/simple;
	bh=nthuvQD+DNGmn3aJ3BKSgc2MSJnyBKZM1mG1UKU/w/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cWU3bAqkpx6qZRn7/mDE/mFFyjSQ+8d6iFZJSh+RgunXGtQ2Slg1NY6UmyT/g5Q0S/3hN7dChxlspIlGkrc17eYpMxrW6HQGrjLuIIX5kDrEwF/9Goo00HyKn5B9AdXBJRIzUx66xJCBJhWYERwQfVJPiknvdmfguIwb5wlP0ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zj+o+cHV; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zj+o+cHV"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-25dfb580d1fso2384029fac.2
        for <oe-kbuild@lists.linux.dev>; Mon, 15 Jul 2024 07:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721055075; x=1721659875; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gu064F1bhvLoivqP+zAON1vMmCh6ajwHL4a1oHeOk5s=;
        b=zj+o+cHVPdcbbAOe08HE4JPqNgFrtFtx5O6ZhlaZycZcqRrf7JtLowZnPOI/WOOxrG
         0Yn55UHsUm0+oVHO24Kzks6qHtWy4riCj5eo2VzrGIoZ2Y79cXe6wFTTBsjCJTJMrcKE
         WXMTWH6VUo6AvdgY/VnocNpRZXMC00OxKtX9kiRd+XMf2wyegmELSezliWM7ogxrYxwC
         rlJmZSLUCcaz80p+ixg7kpkW4DR0RPVo46DUqshtpR7Telbbwwf45BtuBv9l19Ko1opi
         buO5VPgHp17I7tR6EvZoQgtsT8+irx84KcuH23CXDVk+tPhHyVCJdom9e3zK5erAQoBc
         nh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721055075; x=1721659875;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gu064F1bhvLoivqP+zAON1vMmCh6ajwHL4a1oHeOk5s=;
        b=BF04RPnSD2ruzpxjXquTwGrk+KXnYSybHeCg42pg2b7g+fH2prxBghBAbQEqEcP6ST
         U8BdzdFaLa940k35/TdVDcNHbYMlBWWYDjjb+yhyCztnHln5nkeYIUbX0+psvMrfXjLT
         Lz6proRvgjduYM9Lc+vzCd/JcHv1kx5RO+z8NVLpVrFrBMR1QzZjAqhW9XJVyFudVLWV
         UHiw0t2QJPwV/yhc4WHlgc0n44RhPNrtSjR9pV5Jbe4kW/LpTMmkceJODwfLMabPrweP
         LJ0lsbLMX/R2xtaBGi1w1BaHMtE7cYMB/N2nPV8hsyYFo57RRMtrrXt1+l2old/fY60T
         RvJQ==
X-Gm-Message-State: AOJu0YzzMD/Nag6kaS9rT+dQ4R9f064sNFLYUDsswYypn+HGVoajTOwp
	NuGl4hkmWygCiFbpexVVDwi/i23nfLEgUpP8MrXCfjaLsq2MOR5Fl8dGoqvwcPWIxigUFkcMcFY
	h
X-Google-Smtp-Source: AGHT+IHC09C2ayNn5u/5ImSq6J/hrehHZqOfFx+yCGOG8vTQzi86OTIznWoaY+enChGNOpbxlBa/FQ==
X-Received: by 2002:a05:6870:b14e:b0:24f:e100:ba2d with SMTP id 586e51a60fabf-25eaec603f4mr17218889fac.54.1721055074969;
        Mon, 15 Jul 2024 07:51:14 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:358f:3413:c118:4021])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-26075176a08sm964764fac.33.2024.07.15.07.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 07:51:14 -0700 (PDT)
Date: Mon, 15 Jul 2024 09:51:12 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip-rt-rebase 96/9999] kernel/softirq.c:973
 __tasklet_schedule_common() warn: inconsistent returns 'flags'.
Message-ID: <694a631c-8998-4a84-9ed9-f722e9efbbe4@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   642e819a3c30d3536e6d66a631b761886a0316e7
commit: 62d0a2a30cd01fabc7f6555df2cfae7dd3d9fad8 [96/9999] tasklet: Address a race resulting in double-enqueue
config: i386-randconfig-141-20240714 (https://download.01.org/0day-ci/archive/20240714/202407142205.22hVCdHd-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407142205.22hVCdHd-lkp@intel.com/

smatch warnings:
kernel/softirq.c:973 __tasklet_schedule_common() warn: inconsistent returns 'flags'.

vim +/flags +973 kernel/softirq.c

6498ddad301c7a Ingo Molnar    2018-02-27  929  static void __tasklet_schedule_common(struct tasklet_struct *t,
6498ddad301c7a Ingo Molnar    2018-02-27  930  				      struct tasklet_head __percpu *headp,
6498ddad301c7a Ingo Molnar    2018-02-27  931  				      unsigned int softirq_nr)
^1da177e4c3f41 Linus Torvalds 2005-04-16  932  {
6498ddad301c7a Ingo Molnar    2018-02-27  933  	struct tasklet_head *head;
^1da177e4c3f41 Linus Torvalds 2005-04-16  934  	unsigned long flags;
^1da177e4c3f41 Linus Torvalds 2005-04-16  935  
^1da177e4c3f41 Linus Torvalds 2005-04-16  936  	local_irq_save(flags);
4a8c8d729198e3 Ingo Molnar    2011-11-29  937  	if (!tasklet_trylock(t)) {
4a8c8d729198e3 Ingo Molnar    2011-11-29  938  		local_irq_restore(flags);
4a8c8d729198e3 Ingo Molnar    2011-11-29  939  		return;
4a8c8d729198e3 Ingo Molnar    2011-11-29  940  	}
4a8c8d729198e3 Ingo Molnar    2011-11-29  941  
6498ddad301c7a Ingo Molnar    2018-02-27  942  	head = this_cpu_ptr(headp);
4a8c8d729198e3 Ingo Molnar    2011-11-29  943  again:
4a8c8d729198e3 Ingo Molnar    2011-11-29  944  	/* We may have been preempted before tasklet_trylock
4a8c8d729198e3 Ingo Molnar    2011-11-29  945  	 * and __tasklet_action may have already run.
4a8c8d729198e3 Ingo Molnar    2011-11-29  946  	 * So double check the sched bit while the takslet
4a8c8d729198e3 Ingo Molnar    2011-11-29  947  	 * is locked before adding it to the list.
4a8c8d729198e3 Ingo Molnar    2011-11-29  948  	 */
4a8c8d729198e3 Ingo Molnar    2011-11-29  949  	if (test_bit(TASKLET_STATE_SCHED, &t->state)) {
62d0a2a30cd01f Zhang Xiao     2020-03-17  950  		if (test_and_set_bit(TASKLET_STATE_CHAINED, &t->state)) {
62d0a2a30cd01f Zhang Xiao     2020-03-17  951  			tasklet_unlock(t);

local_irq_restore(flags);

62d0a2a30cd01f Zhang Xiao     2020-03-17  952  			return;
62d0a2a30cd01f Zhang Xiao     2020-03-17  953  		}
48f20a9a9488c4 Olof Johansson 2008-03-04  954  		t->next = NULL;
6498ddad301c7a Ingo Molnar    2018-02-27  955  		*head->tail = t;
6498ddad301c7a Ingo Molnar    2018-02-27  956  		head->tail = &(t->next);
6498ddad301c7a Ingo Molnar    2018-02-27  957  		raise_softirq_irqoff(softirq_nr);
4a8c8d729198e3 Ingo Molnar    2011-11-29  958  		tasklet_unlock(t);
4a8c8d729198e3 Ingo Molnar    2011-11-29  959  	} else {
4a8c8d729198e3 Ingo Molnar    2011-11-29  960  		/* This is subtle. If we hit the corner case above
4a8c8d729198e3 Ingo Molnar    2011-11-29  961  		 * It is possible that we get preempted right here,
4a8c8d729198e3 Ingo Molnar    2011-11-29  962  		 * and another task has successfully called
4a8c8d729198e3 Ingo Molnar    2011-11-29  963  		 * tasklet_schedule(), then this function, and
4a8c8d729198e3 Ingo Molnar    2011-11-29  964  		 * failed on the trylock. Thus we must be sure
4a8c8d729198e3 Ingo Molnar    2011-11-29  965  		 * before releasing the tasklet lock, that the
4a8c8d729198e3 Ingo Molnar    2011-11-29  966  		 * SCHED_BIT is clear. Otherwise the tasklet
4a8c8d729198e3 Ingo Molnar    2011-11-29  967  		 * may get its SCHED_BIT set, but not added to the
4a8c8d729198e3 Ingo Molnar    2011-11-29  968  		 * list
4a8c8d729198e3 Ingo Molnar    2011-11-29  969  		 */
4a8c8d729198e3 Ingo Molnar    2011-11-29  970  		if (!tasklet_tryunlock(t))
4a8c8d729198e3 Ingo Molnar    2011-11-29  971  			goto again;
4a8c8d729198e3 Ingo Molnar    2011-11-29  972  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16 @973  	local_irq_restore(flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  974  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

