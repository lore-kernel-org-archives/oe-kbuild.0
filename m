Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F46F31717C
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Apr 2026 19:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776196451; cv=none; b=h9OD3W8Zv2+A9CyIajyKskCF9VBsHL5HcdmYvUnabV4yMnyx1SwZM3l8wcmbWikM2TuHwXWtN4Hps05iyaROZYJu8eC3g4E/fiVZXRLv7YPwPzfW/ihfKfzN+wR9O847iId+M6r5e37rtWzJIhX2aZf55veg7wxtTSGeblnFS/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776196451; c=relaxed/simple;
	bh=jpg7WSQaAaIZ+T6cuya4jREhqNUNNTuEigIu4S0Efl8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UooPiTYcEpsNi0oNLHUdS0PPKturKa4xiK1ei18Avorhd0BZ/fuQKy0J5MTZv/72ZCLQA0jzwWqxHzxsDDsEfa5iM3sLGWsyLg5berfCq3BGwkSAlNEVnnEZ5YeDx1AM711mJxrYwnUWUo96vYKuSSOR+KxQgJ5xGPlR1r2pTWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PcZFjFay; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PcZFjFay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776196450; x=1807732450;
  h=date:from:to:cc:subject:message-id;
  bh=jpg7WSQaAaIZ+T6cuya4jREhqNUNNTuEigIu4S0Efl8=;
  b=PcZFjFayndADJYgTCUEhqLoSqT3GJX0Njlkg10CWCPO4/KOVEbCtKyaz
   AtyPySkdGz/OQr7oIKTi1iM925mHM+rUAC4Pc+WPQxBBNSCL9tlhQUqgh
   Xe/PyAtEldqHfVQzsW9POUHQAMojX2cQfr/2l9S2QQ4XHj1mzR3ci+K9r
   cvtBMVUqw8PKPQrorp9arGtft4dkwjlfxEoCH4v1nmBSddk1egqm6pP4l
   zLrOpDOp7I0VBBXAqeiow9VrFeLZ+0UzlTyf4wSJT0MXdEcGPdB9o2dr0
   I6j37nInFXB0cPv/ra+AZMjFrnzKMwr2atJh3WB+Gpmg8Cb2JSCfY4vNO
   Q==;
X-CSE-ConnectionGUID: W3UEvcEtTzu2wpwsf5KDWQ==
X-CSE-MsgGUID: k6BBAmM3RBqvg7c8swYRBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77276524"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77276524"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 12:54:08 -0700
X-CSE-ConnectionGUID: QYoFWFDMSs+fTiZDOk5B4A==
X-CSE-MsgGUID: wVSC9rEzTZ+oNQ4c6NQDKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="260617415"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Apr 2026 12:54:06 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCjpj-000000001od-1yAu;
	Tue, 14 Apr 2026 19:54:03 +0000
Date: Wed, 15 Apr 2026 03:53:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12400/13443]
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c:174 heartbeat() error: we
 previously assumed 'rq' could be null (see line 152)
Message-ID: <202604150324.9rnylxTF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
CC: Krzysztof Karas <krzysztof.karas@intel.com>
CC: Andi Shyti <andi.shyti@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1c7cc4904160c6fc6377564140062d68a3dc93a0
commit: 4c71fd099513bfa8acab529b626e1f0097b76061 [12400/13443] drm/i915/gt: fix refcount underflow in intel_engine_park_heartbeat
:::::: branch date: 28 hours ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20260414 (https://download.01.org/0day-ci/archive/20260415/202604150324.9rnylxTF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604150324.9rnylxTF-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c:174 heartbeat() error: we previously assumed 'rq' could be null (see line 152)

vim +/rq +174 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c

058179e72e0956a Chris Wilson        2019-10-23  138  
058179e72e0956a Chris Wilson        2019-10-23  139  static void heartbeat(struct work_struct *wrk)
058179e72e0956a Chris Wilson        2019-10-23  140  {
eb5c10cbbc2fc6c Chris Wilson        2021-01-20  141  	struct i915_sched_attr attr = { .priority = I915_PRIORITY_MIN };
058179e72e0956a Chris Wilson        2019-10-23  142  	struct intel_engine_cs *engine =
058179e72e0956a Chris Wilson        2019-10-23  143  		container_of(wrk, typeof(*engine), heartbeat.work.work);
058179e72e0956a Chris Wilson        2019-10-23  144  	struct intel_context *ce = engine->kernel_context;
058179e72e0956a Chris Wilson        2019-10-23  145  	struct i915_request *rq;
aab4707fdd754d4 Chris Wilson        2020-07-02  146  	unsigned long serial;
058179e72e0956a Chris Wilson        2019-10-23  147  
5948938700446ac Chris Wilson        2020-06-15  148  	/* Just in case everything has gone horribly wrong, give it a kick */
5948938700446ac Chris Wilson        2020-06-15  149  	intel_engine_flush_submission(engine);
5948938700446ac Chris Wilson        2020-06-15  150  
4c71fd099513bfa Sebastian Brzezinka 2026-04-01  151  	rq = xchg(&engine->heartbeat.systole, NULL);
4c71fd099513bfa Sebastian Brzezinka 2026-04-01 @152  	if (rq) {
4c71fd099513bfa Sebastian Brzezinka 2026-04-01  153  		if (i915_request_completed(rq))
058179e72e0956a Chris Wilson        2019-10-23  154  			i915_request_put(rq);
4c71fd099513bfa Sebastian Brzezinka 2026-04-01  155  		else
4c71fd099513bfa Sebastian Brzezinka 2026-04-01  156  			engine->heartbeat.systole = rq;
058179e72e0956a Chris Wilson        2019-10-23  157  	}
058179e72e0956a Chris Wilson        2019-10-23  158  
3466a3def2c01e0 Chris Wilson        2019-11-06  159  	if (!intel_engine_pm_get_if_awake(engine))
3466a3def2c01e0 Chris Wilson        2019-11-06  160  		return;
3466a3def2c01e0 Chris Wilson        2019-11-06  161  
058179e72e0956a Chris Wilson        2019-10-23  162  	if (intel_gt_is_wedged(engine->gt))
058179e72e0956a Chris Wilson        2019-10-23  163  		goto out;
058179e72e0956a Chris Wilson        2019-10-23  164  
c41ee2873eb37ff Matthew Brost       2021-07-26  165  	if (i915_sched_engine_disabled(engine->sched_engine)) {
c41ee2873eb37ff Matthew Brost       2021-07-26  166  		reset_engine(engine, engine->heartbeat.systole);
c41ee2873eb37ff Matthew Brost       2021-07-26  167  		goto out;
c41ee2873eb37ff Matthew Brost       2021-07-26  168  	}
c41ee2873eb37ff Matthew Brost       2021-07-26  169  
058179e72e0956a Chris Wilson        2019-10-23  170  	if (engine->heartbeat.systole) {
2827ce6e543086d Chris Wilson        2021-02-04  171  		long delay = READ_ONCE(engine->props.heartbeat_interval_ms);
2827ce6e543086d Chris Wilson        2021-02-04  172  
2827ce6e543086d Chris Wilson        2021-02-04  173  		/* Safeguard against too-fast worker invocations */
2827ce6e543086d Chris Wilson        2021-02-04 @174  		if (!time_after(jiffies,
2827ce6e543086d Chris Wilson        2021-02-04  175  				rq->emitted_jiffies + msecs_to_jiffies(delay)))
2827ce6e543086d Chris Wilson        2021-02-04  176  			goto out;
2827ce6e543086d Chris Wilson        2021-02-04  177  
ba03a63d76ac813 Chris Wilson        2020-05-28  178  		if (!i915_sw_fence_signaled(&rq->submit)) {
ba03a63d76ac813 Chris Wilson        2020-05-28  179  			/*
ba03a63d76ac813 Chris Wilson        2020-05-28  180  			 * Not yet submitted, system is stalled.
ba03a63d76ac813 Chris Wilson        2020-05-28  181  			 *
ba03a63d76ac813 Chris Wilson        2020-05-28  182  			 * This more often happens for ring submission,
ba03a63d76ac813 Chris Wilson        2020-05-28  183  			 * where all contexts are funnelled into a common
ba03a63d76ac813 Chris Wilson        2020-05-28  184  			 * ringbuffer. If one context is blocked on an
ba03a63d76ac813 Chris Wilson        2020-05-28  185  			 * external fence, not only is it not submitted,
ba03a63d76ac813 Chris Wilson        2020-05-28  186  			 * but all other contexts, including the kernel
ba03a63d76ac813 Chris Wilson        2020-05-28  187  			 * context are stuck waiting for the signal.
ba03a63d76ac813 Chris Wilson        2020-05-28  188  			 */
3f623e06cd56573 Matthew Brost       2021-06-17  189  		} else if (engine->sched_engine->schedule &&
058179e72e0956a Chris Wilson        2019-10-23  190  			   rq->sched.attr.priority < I915_PRIORITY_BARRIER) {
058179e72e0956a Chris Wilson        2019-10-23  191  			/*
058179e72e0956a Chris Wilson        2019-10-23  192  			 * Gradually raise the priority of the heartbeat to
058179e72e0956a Chris Wilson        2019-10-23  193  			 * give high priority work [which presumably desires
058179e72e0956a Chris Wilson        2019-10-23  194  			 * low latency and no jitter] the chance to naturally
058179e72e0956a Chris Wilson        2019-10-23  195  			 * complete before being preempted.
058179e72e0956a Chris Wilson        2019-10-23  196  			 */
ffc02c67bf8d490 Nirmoy Das          2023-10-23  197  			attr.priority = I915_PRIORITY_NORMAL;
058179e72e0956a Chris Wilson        2019-10-23  198  			if (rq->sched.attr.priority >= attr.priority)
eb5c10cbbc2fc6c Chris Wilson        2021-01-20  199  				attr.priority = I915_PRIORITY_HEARTBEAT;
058179e72e0956a Chris Wilson        2019-10-23  200  			if (rq->sched.attr.priority >= attr.priority)
058179e72e0956a Chris Wilson        2019-10-23  201  				attr.priority = I915_PRIORITY_BARRIER;
058179e72e0956a Chris Wilson        2019-10-23  202  
058179e72e0956a Chris Wilson        2019-10-23  203  			local_bh_disable();
3f623e06cd56573 Matthew Brost       2021-06-17  204  			engine->sched_engine->schedule(rq, &attr);
058179e72e0956a Chris Wilson        2019-10-23  205  			local_bh_enable();
058179e72e0956a Chris Wilson        2019-10-23  206  		} else {
c41ee2873eb37ff Matthew Brost       2021-07-26  207  			reset_engine(engine, rq);
058179e72e0956a Chris Wilson        2019-10-23  208  		}
2827ce6e543086d Chris Wilson        2021-02-04  209  
2827ce6e543086d Chris Wilson        2021-02-04  210  		rq->emitted_jiffies = jiffies;
058179e72e0956a Chris Wilson        2019-10-23  211  		goto out;
058179e72e0956a Chris Wilson        2019-10-23  212  	}
058179e72e0956a Chris Wilson        2019-10-23  213  
aab4707fdd754d4 Chris Wilson        2020-07-02  214  	serial = READ_ONCE(engine->serial);
aab4707fdd754d4 Chris Wilson        2020-07-02  215  	if (engine->wakeref_serial == serial)
058179e72e0956a Chris Wilson        2019-10-23  216  		goto out;
058179e72e0956a Chris Wilson        2019-10-23  217  
aab4707fdd754d4 Chris Wilson        2020-07-02  218  	if (!mutex_trylock(&ce->timeline->mutex)) {
aab4707fdd754d4 Chris Wilson        2020-07-02  219  		/* Unable to lock the kernel timeline, is the engine stuck? */
aab4707fdd754d4 Chris Wilson        2020-07-02  220  		if (xchg(&engine->heartbeat.blocked, serial) == serial)
aab4707fdd754d4 Chris Wilson        2020-07-02  221  			intel_gt_handle_error(engine->gt, engine->mask,
aab4707fdd754d4 Chris Wilson        2020-07-02  222  					      I915_ERROR_CAPTURE,
aab4707fdd754d4 Chris Wilson        2020-07-02  223  					      "no heartbeat on %s",
aab4707fdd754d4 Chris Wilson        2020-07-02  224  					      engine->name);
aab4707fdd754d4 Chris Wilson        2020-07-02  225  		goto out;
aab4707fdd754d4 Chris Wilson        2020-07-02  226  	}
058179e72e0956a Chris Wilson        2019-10-23  227  
fe7bcfaeb2b775f Chris Wilson        2020-12-24  228  	rq = heartbeat_create(ce, GFP_NOWAIT | __GFP_NOWARN);
058179e72e0956a Chris Wilson        2019-10-23  229  	if (IS_ERR(rq))
058179e72e0956a Chris Wilson        2019-10-23  230  		goto unlock;
058179e72e0956a Chris Wilson        2019-10-23  231  
fe7bcfaeb2b775f Chris Wilson        2020-12-24  232  	heartbeat_commit(rq, &attr);
058179e72e0956a Chris Wilson        2019-10-23  233  
058179e72e0956a Chris Wilson        2019-10-23  234  unlock:
058179e72e0956a Chris Wilson        2019-10-23  235  	mutex_unlock(&ce->timeline->mutex);
058179e72e0956a Chris Wilson        2019-10-23  236  out:
4c71fd099513bfa Sebastian Brzezinka 2026-04-01  237  	if (!engine->i915->params.enable_hangcheck || !next_heartbeat(engine)) {
4c71fd099513bfa Sebastian Brzezinka 2026-04-01  238  		rq = xchg(&engine->heartbeat.systole, NULL);
4c71fd099513bfa Sebastian Brzezinka 2026-04-01  239  		if (rq)
4c71fd099513bfa Sebastian Brzezinka 2026-04-01  240  			i915_request_put(rq);
4c71fd099513bfa Sebastian Brzezinka 2026-04-01  241  	}
058179e72e0956a Chris Wilson        2019-10-23  242  	intel_engine_pm_put(engine);
058179e72e0956a Chris Wilson        2019-10-23  243  }
058179e72e0956a Chris Wilson        2019-10-23  244  

:::::: The code at line 174 was first introduced by commit
:::::: 2827ce6e543086deb24a46ddedc5a8a072275670 drm/i915/gt: Double check heartbeat timeout before resetting

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
