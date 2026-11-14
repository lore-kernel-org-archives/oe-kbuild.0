Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794617655;
	b=Pt0Qo0I4UW58QjL4uWjso2S/M2MVqP0deZYI4b1OJAq0+XtuxkmkQfcogtgylOQ6nFjQ
	 DgzlQPhZ6hVMzDnskO6/mTkS2Y0gJhZOKQpLx0mDhtXbjq/JJBSUKVI5rOJpvMxFwFmXg
	 7LuOFFpdIsv02Dn0qwZ/5exRchefYs8OmC1GAKr5eEMH4i6NMGlDO7lO9GqQtBxeZ73TL
	 XUZS2kSZT+sA04/1/z1V7fk752qvscb5AEdTEVqRt5mCZ+r5bDI6b88XeBdC2Eav9cO6b
	 6KA5B8FQdemnd/3jCZjPHs15N4YWPL5DCA9rGWtydOzeH2FQMjTjzS+y/lTBHK5M8SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794617655;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wecl+3vh4ESLRoZYslqR2mJMpEJBqJo6nuXzyTrIWl4=;
	b=c96P7A4ps6LTFZMBlFyo6x9G48IGiE0cPVB0Jdi1tPJV+DvmYhxjNsDyV9OUzRx1FLwQ
	 HBbCjC1o5SiGphFsT0yVMeKhQkFncqj+Uz32DJSdyjI2M6u8lhMLcpgO1DWpWsgKuO2Md
	 1GcXxEaVMhhiUUMTJ/m+WHWJEp+eJoVh/zq1ycQkGQGCDqe5aENg/Q/YDIBnYoTY8g6lJ
	 1xvq6CQu4nGIK74XlMZFyVyY/ndzyYRYfZlWxZRn81McR64OQ6YLtzIFcGTXagqXC77NM
	 /Tp9/iPjPPDtYBf8LTcj3KL2qAKtRn1DKixNDBpuN/o1uLRhALjDYZyuOshI7aVGeQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UaKGABZY;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30932606A334
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 00:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30932606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UaKGABZY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794617655; x=1826153655;
  h=date:from:to:cc:subject:message-id;
  bh=gkU3uLx6RoY60tACwexFvYiqx4STgmiI5qlgNxJbM94=;
  b=UaKGABZYDhlSRmmaCzX3KSu8Q8VBAoqJRQu8uVDGTEFOuyqWDhwz8mNK
   FXR+M+ka4wktE6tvQkhnIszdq3W56z48O8+rvBlE67I05c+S6R/mWdVBS
   /C8UIOWpOyaYYjETZFwnFf/R4Ne/IuFZuOWKxzglI/ZogL0UknFh0b/OV
   s706F5dcQu7MVREm4WLEkNNfGIDXxSFbMh7kGJrwlU1lYgkcRQyBbk2lh
   iPeL1/JTj8HraZDr7vjXdHYukAAsy3Q1Yzjtd6o6MOLYbeeh5/cHe8e24
   qUwZAm7PMO8vnMM+wmUHDDRg0U8nmACiTEaFIq74SzhLnoFKpc18KWxpA
   Q==;
X-CSE-ConnectionGUID: OkTkbFR/R4WYcmul4kQTAw==
X-CSE-MsgGUID: ce22clodTai+cbxCiKcZLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3427218"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3427218"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 16:54:14 -0800
X-CSE-ConnectionGUID: 7mm9mXSvRtuYKfEHLf/XEQ==
X-CSE-MsgGUID: 6yWZpeFDRNarib6kTNIzGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9226905"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2026 16:54:12 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS21y-000000001RH-0I7t;
	Sat, 14 Nov 2026 00:54:10 +0000
Date: Sat, 14 Nov 2026 01:54:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jpirko-mlxsw:wip_attestation_all_2 48/68]
 lib/ctlv/tests/event_kunit.c:281 ctlv_event_test_creator_misuse() warn:
 passing zero to 'PTR_ERR'
Message-ID: <202611140128.XwkaCdD4-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jiri Pirko <jiri@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_2
head:   7ff5e548abbc2312431d4eea9ad283347963a6e2
commit: 3e5d2a45aaa3688da1de5a2430c2993c39451793 [48/68] ctlv: Add KUnit tests
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: um-randconfig-2200-20261114 (https://download.01.org/0day-ci/archive/20261114/202611140128.XwkaCdD4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611140128.XwkaCdD4-lkp@intel.com/

New smatch warnings:
lib/ctlv/tests/event_kunit.c:281 ctlv_event_test_creator_misuse() warn: passing zero to 'PTR_ERR'
lib/ctlv/tests/event_kunit.c:310 ctlv_event_test_a_dead_device() warn: passing zero to 'PTR_ERR'
lib/ctlv/tests/event_kunit.c:364 ctlv_event_test_explicit_loss() warn: passing zero to 'PTR_ERR'
lib/ctlv/tests/event_kunit.c:649 ctlv_event_test_context_lifetime() warn: passing zero to 'PTR_ERR'
lib/ctlv/tests/blob_kunit.c:608 ctlv_blob_test_a_blob_outside_the_buffer() warn: passing zero to 'PTR_ERR'
lib/ctlv/tests/blob_kunit.c:632 ctlv_blob_test_stale_cursor_is_rejected() warn: passing zero to 'PTR_ERR'
lib/ctlv/tests/blob_kunit.c:851 ctlv_blob_test_aliased_device_mappings() warn: passing zero to 'PTR_ERR'
lib/ctlv/tests/blob_kunit.c:904 ctlv_blob_test_cpu_and_device_access_are_serial() warn: passing zero to 'PTR_ERR'
lib/ctlv/tests/blob_kunit.c:979 ctlv_blob_test_exporter_failures() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
lib/ctlv/tests/event_kunit.c:287 ctlv_event_test_creator_misuse() warn: passing zero to 'PTR_ERR'
lib/ctlv/tests/event_kunit.c:290 ctlv_event_test_creator_misuse() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +281 lib/ctlv/tests/event_kunit.c

3e5d2a45aaa368 Jiri Pirko 2026-08-26  270  
3e5d2a45aaa368 Jiri Pirko 2026-08-26  271  static void ctlv_event_test_creator_misuse(struct kunit *test)
3e5d2a45aaa368 Jiri Pirko 2026-08-26  272  {
3e5d2a45aaa368 Jiri Pirko 2026-08-26  273  	struct ctlv_event_test_fixture *fx = ctlv_event_test_fixture_open(test);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  274  	struct ctlv_cursor *payload;
3e5d2a45aaa368 Jiri Pirko 2026-08-26  275  	struct ctlv_op_ctx *ctx;
3e5d2a45aaa368 Jiri Pirko 2026-08-26  276  
3e5d2a45aaa368 Jiri Pirko 2026-08-26  277  	kunit_warning_suppress(test) {
3e5d2a45aaa368 Jiri Pirko 2026-08-26  278  		/* An op of this device that is executed rather than emitted. */
3e5d2a45aaa368 Jiri Pirko 2026-08-26  279  		ctx = ctlv_event_create(&fx->ctlv, CTLV_FIXTURE_OP_NOOP,
3e5d2a45aaa368 Jiri Pirko 2026-08-26  280  					&payload, GFP_KERNEL);
3e5d2a45aaa368 Jiri Pirko 2026-08-26 @281  		KUNIT_EXPECT_EQ(test, PTR_ERR(ctx), -EINVAL);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  282  		/* An op of a family this device is not of. */
3e5d2a45aaa368 Jiri Pirko 2026-08-26  283  		ctx = ctlv_event_create(&fx->ctlv,
3e5d2a45aaa368 Jiri Pirko 2026-08-26  284  					CTLV_OP(CTLV_FAMILY_FIXTURE + 1,
3e5d2a45aaa368 Jiri Pirko 2026-08-26  285  						1),
3e5d2a45aaa368 Jiri Pirko 2026-08-26  286  					&payload, GFP_KERNEL);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  287  		KUNIT_EXPECT_EQ(test, PTR_ERR(ctx), -EINVAL);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  288  		/* And one of no family at all. */
3e5d2a45aaa368 Jiri Pirko 2026-08-26  289  		ctx = ctlv_event_create(&fx->ctlv, 0, &payload, GFP_KERNEL);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  290  		KUNIT_EXPECT_EQ(test, PTR_ERR(ctx), -EINVAL);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  291  		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 3);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  292  	}
3e5d2a45aaa368 Jiri Pirko 2026-08-26  293  	KUNIT_EXPECT_EQ(test, ctlv_event_test_queued(fx), 0);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  294  	KUNIT_EXPECT_EQ(test, fx->cfile.sequence, 0);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  295  }
3e5d2a45aaa368 Jiri Pirko 2026-08-26  296  
3e5d2a45aaa368 Jiri Pirko 2026-08-26  297  static void ctlv_event_test_a_dead_device(struct kunit *test)
3e5d2a45aaa368 Jiri Pirko 2026-08-26  298  {
3e5d2a45aaa368 Jiri Pirko 2026-08-26  299  	struct ctlv_event_test_fixture *fx = ctlv_event_test_fixture_open(test);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  300  	struct ctlv_cursor *payload;
3e5d2a45aaa368 Jiri Pirko 2026-08-26  301  	struct ctlv_op_ctx *ctx;
3e5d2a45aaa368 Jiri Pirko 2026-08-26  302  	struct ctlv_event *event;
3e5d2a45aaa368 Jiri Pirko 2026-08-26  303  
3e5d2a45aaa368 Jiri Pirko 2026-08-26  304  	ctlv_event_test_subscribe(test, fx, CTLV_FIXTURE_OP_PINGED);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  305  	WRITE_ONCE(fx->ctlv.family, NULL);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  306  	ctlv_event_device_dead(&fx->ctlv);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  307  
3e5d2a45aaa368 Jiri Pirko 2026-08-26  308  	ctx = ctlv_event_create(&fx->ctlv, CTLV_FIXTURE_OP_PINGED, &payload,
3e5d2a45aaa368 Jiri Pirko 2026-08-26  309  				GFP_KERNEL);
3e5d2a45aaa368 Jiri Pirko 2026-08-26 @310  	KUNIT_EXPECT_EQ(test, PTR_ERR(ctx), -ENODEV);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  311  
3e5d2a45aaa368 Jiri Pirko 2026-08-26  312  	/* What was queued instead, out of storage this open reserved. */
3e5d2a45aaa368 Jiri Pirko 2026-08-26  313  	event = ctlv_event_test_take(fx);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  314  	KUNIT_ASSERT_NOT_NULL(test, event);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  315  	KUNIT_EXPECT_TRUE(test, event->reserved);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  316  	KUNIT_EXPECT_EQ(test, event->hdr.op_id, CTLV_OP_DEVICE_REMOVED);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  317  	KUNIT_EXPECT_EQ(test, event->hdr.sequence, 1);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  318  	KUNIT_EXPECT_EQ(test, event->hdr.length, event->len);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  319  	KUNIT_EXPECT_EQ(test, fx->cfile.queue_used, fx->ctlv.queue_reserved);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  320  	KUNIT_EXPECT_EQ(test, ctlv_event_test_queued(fx), 0);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  321  }
3e5d2a45aaa368 Jiri Pirko 2026-08-26  322  
3e5d2a45aaa368 Jiri Pirko 2026-08-26  323  /* Dropped without queueing, and without taking a sequence number. */
3e5d2a45aaa368 Jiri Pirko 2026-08-26  324  static void ctlv_event_test_an_event_nobody_wants(struct kunit *test)
3e5d2a45aaa368 Jiri Pirko 2026-08-26  325  {
3e5d2a45aaa368 Jiri Pirko 2026-08-26  326  	struct ctlv_event_test_fixture *fx = ctlv_event_test_fixture_open(test);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  327  	struct ctlv_cursor *payload;
3e5d2a45aaa368 Jiri Pirko 2026-08-26  328  	struct ctlv_op_ctx *ctx;
3e5d2a45aaa368 Jiri Pirko 2026-08-26  329  
3e5d2a45aaa368 Jiri Pirko 2026-08-26  330  	ctx = ctlv_event_create(&fx->ctlv, CTLV_FIXTURE_OP_PINGED, &payload,
3e5d2a45aaa368 Jiri Pirko 2026-08-26  331  				GFP_KERNEL);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  332  	KUNIT_ASSERT_FALSE(test, IS_ERR(ctx));
3e5d2a45aaa368 Jiri Pirko 2026-08-26  333  	KUNIT_EXPECT_EQ(test, ctlv_event_emit(ctx), 0);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  334  
3e5d2a45aaa368 Jiri Pirko 2026-08-26  335  	KUNIT_EXPECT_EQ(test, ctlv_event_test_queued(fx), 0);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  336  	KUNIT_EXPECT_EQ(test, fx->cfile.sequence, 0);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  337  	KUNIT_EXPECT_EQ(test, fx->cfile.queue_used, fx->ctlv.queue_reserved);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  338  }
3e5d2a45aaa368 Jiri Pirko 2026-08-26  339  
3e5d2a45aaa368 Jiri Pirko 2026-08-26  340  static void ctlv_event_test_explicit_loss(struct kunit *test)
3e5d2a45aaa368 Jiri Pirko 2026-08-26  341  {
3e5d2a45aaa368 Jiri Pirko 2026-08-26  342  	struct ctlv_event_test_fixture *fx = ctlv_event_test_fixture_open(test);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  343  	struct ctlv_event_test_reader_waiter waiter = {
3e5d2a45aaa368 Jiri Pirko 2026-08-26  344  		.cfile = &fx->cfile,
3e5d2a45aaa368 Jiri Pirko 2026-08-26  345  	};
3e5d2a45aaa368 Jiri Pirko 2026-08-26  346  	struct ctlv_file *other = ctlv_event_test_other_open(test, fx);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  347  	struct task_struct *task;
3e5d2a45aaa368 Jiri Pirko 2026-08-26  348  	struct ctlv_cursor *payload;
3e5d2a45aaa368 Jiri Pirko 2026-08-26  349  	struct ctlv_op_ctx *ctx;
3e5d2a45aaa368 Jiri Pirko 2026-08-26  350  
3e5d2a45aaa368 Jiri Pirko 2026-08-26  351  	init_completion(&waiter.entered);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  352  	init_completion(&waiter.done);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  353  	ctlv_event_test_subscribe(test, fx, CTLV_FIXTURE_OP_PINGED);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  354  	task = kthread_run(ctlv_event_test_reader_wait, &waiter, "ctlv-event-reader");
3e5d2a45aaa368 Jiri Pirko 2026-08-26  355  	KUNIT_ASSERT_FALSE(test, IS_ERR(task));
3e5d2a45aaa368 Jiri Pirko 2026-08-26  356  	wait_for_completion(&waiter.entered);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  357  
3e5d2a45aaa368 Jiri Pirko 2026-08-26  358  	kunit_activate_static_stub(test, ctlv_event_create,
3e5d2a45aaa368 Jiri Pirko 2026-08-26  359  				   ctlv_event_test_create_nomem);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  360  	kunit_activate_static_stub(test, ctlv_event_alloc,
3e5d2a45aaa368 Jiri Pirko 2026-08-26  361  				   ctlv_event_test_record_unexpected);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  362  	ctx = ctlv_event_create(&fx->ctlv, CTLV_FIXTURE_OP_PINGED,
3e5d2a45aaa368 Jiri Pirko 2026-08-26  363  				&payload, GFP_KERNEL);
3e5d2a45aaa368 Jiri Pirko 2026-08-26 @364  	KUNIT_EXPECT_EQ(test, PTR_ERR(ctx), -ENOMEM);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  365  	KUNIT_EXPECT_EQ(test, fx->cfile.sequence, 0);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  366  	ctlv_event_lost(&fx->ctlv, CTLV_FIXTURE_OP_PINGED);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  367  	kunit_deactivate_static_stub(test, ctlv_event_alloc);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  368  	kunit_deactivate_static_stub(test, ctlv_event_create);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  369  
3e5d2a45aaa368 Jiri Pirko 2026-08-26  370  	KUNIT_EXPECT_NE(test, wait_for_completion_timeout(&waiter.done, HZ),
3e5d2a45aaa368 Jiri Pirko 2026-08-26  371  			0UL);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  372  	kthread_stop(task);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  373  	KUNIT_EXPECT_EQ(test, waiter.result, 0);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  374  
3e5d2a45aaa368 Jiri Pirko 2026-08-26  375  	ctx = ctlv_event_create(&fx->ctlv, CTLV_FIXTURE_OP_PINGED,
3e5d2a45aaa368 Jiri Pirko 2026-08-26  376  				&payload, GFP_KERNEL);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  377  	KUNIT_ASSERT_FALSE(test, IS_ERR(ctx));
3e5d2a45aaa368 Jiri Pirko 2026-08-26  378  	KUNIT_EXPECT_EQ(test, ctlv_event_emit(ctx), 0);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  379  	ctlv_event_lost(&fx->ctlv, CTLV_FIXTURE_OP_PINGED);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  380  
3e5d2a45aaa368 Jiri Pirko 2026-08-26  381  	KUNIT_EXPECT_EQ(test, fx->cfile.sequence, 3);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  382  	KUNIT_EXPECT_TRUE(test, fx->cfile.overflowing);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  383  	KUNIT_EXPECT_EQ(test, fx->cfile.first_dropped, 1);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  384  	KUNIT_EXPECT_EQ(test, fx->cfile.last_dropped, 3);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  385  	KUNIT_EXPECT_EQ(test, fx->cfile.dropped, 3);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  386  	KUNIT_EXPECT_EQ(test, ctlv_event_test_queued(fx), 1);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  387  	KUNIT_EXPECT_EQ(test, other->sequence, 0);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  388  	KUNIT_EXPECT_FALSE(test, other->overflowing);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  389  	KUNIT_EXPECT_EQ(test, ctlv_event_test_file_queued(other), 0);
3e5d2a45aaa368 Jiri Pirko 2026-08-26  390  }
3e5d2a45aaa368 Jiri Pirko 2026-08-26  391  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
