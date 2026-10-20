Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792527403;
	b=Qg3FI/f5tvV2BUlfzODS69tiYJE8n2abjNYqAbZwlg6HAJXMmLfkjXTzXA5JIngiAQ7G
	 978XRblAHnwK4HjFPX4bx6VyyacO942ctTcgHzVYyFa3OoNiWio4H2aIG79tVG5AitCv1
	 2f73mu4WQ0QxTb0YO2YsMcULCfNV50nsfa7qgkLnNPDRqeiy7pESNAhNwYXtQcdKecRrB
	 GFgFJRTNaoaWVrAA8dRX5cuADUrZJ3xbPq/X8XqSnKX6Hn28fy4GsbdHqt2JqBERVXo5a
	 D2jgeJeXymf/7t1bMnSmx1YuvXTWfJZthXQQb7++zEsTqS2H5fUP+qWEv/1yW/ulqcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792527403;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=GQX61GVZRjgaR79AC8F0uhMiZIqo3Ea6JBvgLkwjBtc=;
	b=zstIeG/P/lVXqblbT6lNf8thNKJfumLHk/8LajaAoMBZGykmQ3of0JBQA5fc+bXc9KRu
	 wyaiAX0VAV8UTIV+OS/Kuykgtuztra3yfo5vr/4Th9+kFDf4phHGlH0Eq7DyorW5cfgGz
	 N4Bk8tnuqmP4twJv02VMz2w6XMrcqSSrV9IhBzH6F4iE23qfpi8ENnn4TH5shpVt/GYrP
	 /Y/J6Y8aNq8EeSO9P7wXcRB+zSbKwCvJTqqhqrZbUefETj6iSeg8J6rbg2hkMGz6uN6GM
	 AINKZtALnL6fqVgnBcmyj+hRENJFx+0Y++L+PTlDTPA2aSz8oo+0G76KP6ibc6oPbdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CYNDIv9s;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BDF606A31F
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Oct 2026 20:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0BDF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CYNDIv9s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792527402; x=1824063402;
  h=date:from:to:cc:subject:message-id;
  bh=YUmTDGnGRbt27qKQtGHN/SB2hx7p5JOP5iTRL/iVelA=;
  b=CYNDIv9sf9BVuGXBACHI0Vufna2rbzrV1qD9s5vQxVAuwpaoZ1ojSq3a
   RC3HbZLXjODJN5jKiTx0Oq6cPC+cTkmtAF1883m6b5yRDOnpOFwP9glqt
   AbqmvjSEyfpZgDa/MehhumZbBqOVTfyT4gP7nnYeVe563lBbBalmWIUY0
   i+so5tALjZSmFhXFRHfSei+tBsJc2G0Ry6L7ratFg0Sh+W0DKEXzxJmQq
   Gjo2S5k/B4/Zesg+HOmVcKX8K7siCH8S9EzdFHMJOpIzFEfbkVsG3muPG
   dRnfc1DCJAnHv6PBWzTchZ7KaFvmfLLRc57s0bLKkjk4gAH4NLFCX3Gvc
   A==;
X-CSE-ConnectionGUID: VyeAnp+QRm2cTBMG21wJYQ==
X-CSE-MsgGUID: IlsYVqplSQeJPf8q/hhJfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1135058"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1135058"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 13:16:42 -0700
X-CSE-ConnectionGUID: o/gxktHUSq2hRXP201xacw==
X-CSE-MsgGUID: s6vkHJF4RKmx8ENbMWiXpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3011030"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 20 Oct 2026 13:16:42 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJGGF-000000006Qn-2GV6;
	Tue, 20 Oct 2026 20:16:39 +0000
Date: Tue, 20 Oct 2026 22:15:52 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kkdwivedi:fermata 18/146] kernel/bpf/ringbuf.c:857:17:
 error: undefined named operand 'unwound'
Message-ID: <202610202202.TrW5w6UE-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>

tree:   https://github.com/kkdwivedi/linux fermata
head:   7b45e27f0f0faaa13da429815b6143b99eaa232c
commit: 539555d3c94ba07286fc1563a61d9016e586afca [18/146] bpf: Call the callbacks of bpf_find_vma and bpf_user_ringbuf_drain with a pad
:::::: branch date: 6 hours ago
:::::: commit date: 9 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261020/202610202202.TrW5w6UE-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610202202.TrW5w6UE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610202202.TrW5w6UE-lkp@intel.com/

Note: the kkdwivedi/fermata HEAD 7b45e27f0f0faaa13da429815b6143b99eaa232c builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   kernel/bpf/ringbuf.c: In function '____bpf_user_ringbuf_drain':
>> kernel/bpf/ringbuf.c:857:17: error: undefined named operand 'unwound'
     857 |                 bpf_call_cb(callback, &dynptr, callback_ctx, 0, 0, 0, ret, unwound_at);
         |                 ^~~~~~~~~~~


vim +/unwound +857 kernel/bpf/ringbuf.c

20571567384428 David Vernet            2022-09-19  817  
20571567384428 David Vernet            2022-09-19  818  BPF_CALL_4(bpf_user_ringbuf_drain, struct bpf_map *, map,
20571567384428 David Vernet            2022-09-19  819  	   void *, callback_fn, void *, callback_ctx, u64, flags)
20571567384428 David Vernet            2022-09-19  820  {
20571567384428 David Vernet            2022-09-19  821  	struct bpf_ringbuf *rb;
20571567384428 David Vernet            2022-09-19  822  	long samples, discarded_samples = 0, ret = 0;
20571567384428 David Vernet            2022-09-19  823  	bpf_callback_t callback = (bpf_callback_t)callback_fn;
20571567384428 David Vernet            2022-09-19  824  	u64 wakeup_flags = BPF_RB_NO_WAKEUP | BPF_RB_FORCE_WAKEUP;
539555d3c94ba0 Kumar Kartikeya Dwivedi 2026-10-20  825  	bool unwound = false;
20571567384428 David Vernet            2022-09-19  826  	int busy = 0;
20571567384428 David Vernet            2022-09-19  827  
20571567384428 David Vernet            2022-09-19  828  	if (unlikely(flags & ~wakeup_flags))
20571567384428 David Vernet            2022-09-19  829  		return -EINVAL;
20571567384428 David Vernet            2022-09-19  830  
20571567384428 David Vernet            2022-09-19  831  	rb = container_of(map, struct bpf_ringbuf_map, map)->rb;
20571567384428 David Vernet            2022-09-19  832  
20571567384428 David Vernet            2022-09-19  833  	/* If another consumer is already consuming a sample, wait for them to finish. */
20571567384428 David Vernet            2022-09-19  834  	if (!atomic_try_cmpxchg(&rb->busy, &busy, 1))
20571567384428 David Vernet            2022-09-19  835  		return -EBUSY;
20571567384428 David Vernet            2022-09-19  836  
20571567384428 David Vernet            2022-09-19  837  	for (samples = 0; samples < BPF_MAX_USER_RINGBUF_SAMPLES && ret == 0; samples++) {
20571567384428 David Vernet            2022-09-19  838  		int err;
20571567384428 David Vernet            2022-09-19  839  		u32 size;
20571567384428 David Vernet            2022-09-19  840  		void *sample;
20571567384428 David Vernet            2022-09-19  841  		struct bpf_dynptr_kern dynptr;
20571567384428 David Vernet            2022-09-19  842  
20571567384428 David Vernet            2022-09-19  843  		err = __bpf_user_ringbuf_peek(rb, &sample, &size);
20571567384428 David Vernet            2022-09-19  844  		if (err) {
20571567384428 David Vernet            2022-09-19  845  			if (err == -ENODATA) {
20571567384428 David Vernet            2022-09-19  846  				break;
20571567384428 David Vernet            2022-09-19  847  			} else if (err == -EAGAIN) {
20571567384428 David Vernet            2022-09-19  848  				discarded_samples++;
20571567384428 David Vernet            2022-09-19  849  				continue;
20571567384428 David Vernet            2022-09-19  850  			} else {
20571567384428 David Vernet            2022-09-19  851  				ret = err;
20571567384428 David Vernet            2022-09-19  852  				goto schedule_work_return;
20571567384428 David Vernet            2022-09-19  853  			}
20571567384428 David Vernet            2022-09-19  854  		}
20571567384428 David Vernet            2022-09-19  855  
20571567384428 David Vernet            2022-09-19  856  		bpf_dynptr_init(&dynptr, sample, BPF_DYNPTR_TYPE_LOCAL, 0, size);
539555d3c94ba0 Kumar Kartikeya Dwivedi 2026-10-20 @857  		bpf_call_cb(callback, &dynptr, callback_ctx, 0, 0, 0, ret, unwound_at);
539555d3c94ba0 Kumar Kartikeya Dwivedi 2026-10-20  858  		if (0) {
539555d3c94ba0 Kumar Kartikeya Dwivedi 2026-10-20  859  unwound_at:
539555d3c94ba0 Kumar Kartikeya Dwivedi 2026-10-20  860  			/*
539555d3c94ba0 Kumar Kartikeya Dwivedi 2026-10-20  861  			 * The callback left with unwind_exit. The sample is
539555d3c94ba0 Kumar Kartikeya Dwivedi 2026-10-20  862  			 * consumed like after a return, and the helper leaves
539555d3c94ba0 Kumar Kartikeya Dwivedi 2026-10-20  863  			 * through the door below, as the error paths do.
539555d3c94ba0 Kumar Kartikeya Dwivedi 2026-10-20  864  			 */
539555d3c94ba0 Kumar Kartikeya Dwivedi 2026-10-20  865  			unwound = true;
539555d3c94ba0 Kumar Kartikeya Dwivedi 2026-10-20  866  			ret = 0;
539555d3c94ba0 Kumar Kartikeya Dwivedi 2026-10-20  867  		}
20571567384428 David Vernet            2022-09-19  868  		__bpf_user_ringbuf_sample_release(rb, size, flags);
539555d3c94ba0 Kumar Kartikeya Dwivedi 2026-10-20  869  		if (unwound)
539555d3c94ba0 Kumar Kartikeya Dwivedi 2026-10-20  870  			goto schedule_work_return;
20571567384428 David Vernet            2022-09-19  871  	}
20571567384428 David Vernet            2022-09-19  872  	ret = samples - discarded_samples;
20571567384428 David Vernet            2022-09-19  873  
20571567384428 David Vernet            2022-09-19  874  schedule_work_return:
20571567384428 David Vernet            2022-09-19  875  	/* Prevent the clearing of the busy-bit from being reordered before the
20571567384428 David Vernet            2022-09-19  876  	 * storing of any rb consumer or producer positions.
20571567384428 David Vernet            2022-09-19  877  	 */
06646da0145868 Paul E. McKenney        2023-10-18  878  	atomic_set_release(&rb->busy, 0);
20571567384428 David Vernet            2022-09-19  879  
20571567384428 David Vernet            2022-09-19  880  	if (flags & BPF_RB_FORCE_WAKEUP)
20571567384428 David Vernet            2022-09-19  881  		irq_work_queue(&rb->work);
20571567384428 David Vernet            2022-09-19  882  	else if (!(flags & BPF_RB_NO_WAKEUP) && samples > 0)
20571567384428 David Vernet            2022-09-19  883  		irq_work_queue(&rb->work);
539555d3c94ba0 Kumar Kartikeya Dwivedi 2026-10-20  884  	if (unwound)
539555d3c94ba0 Kumar Kartikeya Dwivedi 2026-10-20  885  		bpf_unwind_leave();
20571567384428 David Vernet            2022-09-19  886  	return ret;
20571567384428 David Vernet            2022-09-19  887  }
20571567384428 David Vernet            2022-09-19  888  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
