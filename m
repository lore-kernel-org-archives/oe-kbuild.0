Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7697A4964F
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Aug 2026 03:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787628376; cv=none; b=a0GU5LyDX+iGcvrx2Owk+X76UPDQp9J56SicSwaBOcKO8h5Yxr2S4cfD7YJyKBw4VROxBVdWHZ3knssO1HzZY5qWhPNbPb6L5EmmjEP75yi02Jf+deOl/bEbOH4MJeRqGwFwYT/TpmenbafElxr/8w+0Pf819x0xw6btaNS2Yio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787628376; c=relaxed/simple;
	bh=0Iq+8CjY4ZPIiOriWQmD01BsmpXhA2rQgthiEBXnUaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BubFzbmQoRtVmoypiL3VuEm+42YbH7Q+SQGERVeyE6P72CFzGWyiccKScSxUDDpWfE6NUnvaFLmKpdMJgd6HDRPakkviNIJIB7uVYOW44rs0sHvrO8fXZMuS1cFLLNhlg8KCneCbztXc0ehz9kfNzVhJhjZTbEMXYdxTYb4g4Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MYeX8euC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MYeX8euC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787628373; x=1819164373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Iq+8CjY4ZPIiOriWQmD01BsmpXhA2rQgthiEBXnUaQ=;
  b=MYeX8euCOYaScdcC02kPEfSslc+DtiirOebclxhyzlFRvfvpU6f8NuEI
   MkQcY/8FSeYeFiJ6NfQ86hNgB74n66HuIH37TbDYz5vhCKsC/Zg6dhtLy
   XnV+wDqqOnBSRBpUs7pqZficQtvEwlmvaHXHUhWZ9QVEqjbCcsCJB//GW
   +YH2JBr7X5ujH4MgpqFcLoSdITrrlCTcxRHD06SPv49qidtsFvoNtvqug
   BU2TOokgZRZ4jTTL3C+7w0Ocdl+2+NBzNCZwCPA88AaHtP6Q2gXdMXa/x
   DDxdS49n/cLmF3xvaBlzsj+3qXIMe1UXwZOHD+R3ks8Ql2ugMCGN2MWXF
   Q==;
X-CSE-ConnectionGUID: SVEPuPFwRiS0wqQLzT0/3Q==
X-CSE-MsgGUID: hKvx1SXaQuOJU+1SfJJhtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87216046"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="87216046"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 20:26:10 -0700
X-CSE-ConnectionGUID: bjnRTcKwSUuHrOcSToq77A==
X-CSE-MsgGUID: Ge3fmd+oReyNPEGsnM48sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="265852977"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Aug 2026 20:26:09 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyhna-000000004sP-28W4;
	Tue, 25 Aug 2026 03:26:06 +0000
Date: Tue, 25 Aug 2026 11:25:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] perf/bpf: Fix data races in BPF perf event handling
Message-ID: <202608251117.NUwDpYQx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260813060528.365959-1-kartikey406@gmail.com>
References: <20260813060528.365959-1-kartikey406@gmail.com>
TO: Deepanshu Kartikey <kartikey406@gmail.com>
TO: peterz@infradead.org
TO: mingo@redhat.com
TO: acme@kernel.org
TO: namhyung@kernel.org
TO: mark.rutland@arm.com
TO: alexander.shishkin@linux.intel.com
TO: jolsa@kernel.org
TO: olsajiri@gmail.com
TO: irogers@google.com
TO: adrian.hunter@intel.com
TO: james.clark@linaro.org
TO: song@kernel.org
TO: kpsingh@kernel.org
TO: mattbobrowski@google.com
TO: ast@kernel.org
TO: daniel@iogearbox.net
TO: andrii@kernel.org
TO: eddyz87@gmail.com
TO: memxor@gmail.com
TO: martin.lau@linux.dev
TO: yonghong.song@linux.dev
TO: emil@etsalapatis.com
TO: rostedt@goodmis.org
TO: mhiramat@kernel.org
TO: mathieu.desnoyers@efficios.com
CC: linux-perf-users@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: bpf@vger.kernel.org
CC: linux-trace-kernel@vger.kernel.org
CC: Deepanshu Kartikey <kartikey406@gmail.com>

Hi Deepanshu,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools linus/master v7.2 next-20260821]
[cannot apply to linux-review/Deepanshu-Kartikey/perf-bpf-Fix-data-race-in-__perf_event_overflow/20260812-052331 acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepanshu-Kartikey/perf-bpf-Fix-data-races-in-BPF-perf-event-handling/20260813-113528
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20260813060528.365959-1-kartikey406%40gmail.com
patch subject: [PATCH v2] perf/bpf: Fix data races in BPF perf event handling
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: sh-randconfig-r072-20260825 (https://download.01.org/0day-ci/archive/20260825/202608251117.NUwDpYQx-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608251117.NUwDpYQx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608251117.NUwDpYQx-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/events/core.c: In function '__perf_event_overflow':
>> kernel/events/core.c:10771:14: error: too many arguments to function 'bpf_overflow_handler'
   10771 |             !bpf_overflow_handler(event, data, regs, prog))
         |              ^~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:10726:19: note: declared here
   10726 | static inline int bpf_overflow_handler(struct perf_event *event,
         |                   ^~~~~~~~~~~~~~~~~~~~


vim +/bpf_overflow_handler +10771 kernel/events/core.c

4c03fe11b96bda kernel/events/core.c  Kyle Huey                 2024-04-11  10744  
475113d937adfd kernel/events/core.c  Jiri Olsa                 2016-12-28  10745  /*
475113d937adfd kernel/events/core.c  Jiri Olsa                 2016-12-28  10746   * Generic event overflow handling, sampling.
475113d937adfd kernel/events/core.c  Jiri Olsa                 2016-12-28  10747   */
475113d937adfd kernel/events/core.c  Jiri Olsa                 2016-12-28  10748  
475113d937adfd kernel/events/core.c  Jiri Olsa                 2016-12-28  10749  static int __perf_event_overflow(struct perf_event *event,
475113d937adfd kernel/events/core.c  Jiri Olsa                 2016-12-28  10750  				 int throttle, struct perf_sample_data *data,
475113d937adfd kernel/events/core.c  Jiri Olsa                 2016-12-28  10751  				 struct pt_regs *regs)
475113d937adfd kernel/events/core.c  Jiri Olsa                 2016-12-28  10752  {
475113d937adfd kernel/events/core.c  Jiri Olsa                 2016-12-28  10753  	int events = atomic_read(&event->event_limit);
475113d937adfd kernel/events/core.c  Jiri Olsa                 2016-12-28  10754  	int ret = 0;
6910c8cf9c180b kernel/events/core.c  Deepanshu Kartikey        2026-08-13  10755  	struct bpf_prog *prog;
475113d937adfd kernel/events/core.c  Jiri Olsa                 2016-12-28  10756  
475113d937adfd kernel/events/core.c  Jiri Olsa                 2016-12-28  10757  	/*
475113d937adfd kernel/events/core.c  Jiri Olsa                 2016-12-28  10758  	 * Non-sampling counters might still use the PMI to fold short
475113d937adfd kernel/events/core.c  Jiri Olsa                 2016-12-28  10759  	 * hardware counters, ignore those.
475113d937adfd kernel/events/core.c  Jiri Olsa                 2016-12-28  10760  	 */
475113d937adfd kernel/events/core.c  Jiri Olsa                 2016-12-28  10761  	if (unlikely(!is_sampling_event(event)))
475113d937adfd kernel/events/core.c  Jiri Olsa                 2016-12-28  10762  		return 0;
475113d937adfd kernel/events/core.c  Jiri Olsa                 2016-12-28  10763  
475113d937adfd kernel/events/core.c  Jiri Olsa                 2016-12-28  10764  	ret = __perf_event_account_interrupt(event, throttle);
cc1582c231ea04 kernel/events/core.c  Jin Yao                   2017-05-25  10765  
18d92bb57c3950 kernel/events/core.c  Adrian Hunter             2024-10-22  10766  	if (event->attr.aux_pause)
18d92bb57c3950 kernel/events/core.c  Adrian Hunter             2024-10-22  10767  		perf_event_aux_pause(event->aux_event, true);
18d92bb57c3950 kernel/events/core.c  Adrian Hunter             2024-10-22  10768  
6910c8cf9c180b kernel/events/core.c  Deepanshu Kartikey        2026-08-13  10769  	prog = READ_ONCE(event->prog);
6910c8cf9c180b kernel/events/core.c  Deepanshu Kartikey        2026-08-13  10770  	if (prog && prog->type == BPF_PROG_TYPE_PERF_EVENT &&
6910c8cf9c180b kernel/events/core.c  Deepanshu Kartikey        2026-08-13 @10771  	    !bpf_overflow_handler(event, data, regs, prog))
18d92bb57c3950 kernel/events/core.c  Adrian Hunter             2024-10-22  10772  		goto out;
c4fcc7d1f41532 kernel/events/core.c  Kyle Huey                 2024-04-11  10773  
2023b359214bbc kernel/perf_counter.c Peter Zijlstra            2009-05-05  10774  	/*
2023b359214bbc kernel/perf_counter.c Peter Zijlstra            2009-05-05  10775  	 * XXX event_limit might not quite work as expected on inherited
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar               2009-09-21  10776  	 * events
2023b359214bbc kernel/perf_counter.c Peter Zijlstra            2009-05-05  10777  	 */
2023b359214bbc kernel/perf_counter.c Peter Zijlstra            2009-05-05  10778  
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar               2009-09-21  10779  	event->pending_kill = POLL_IN;
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar               2009-09-21  10780  	if (events && atomic_dec_and_test(&event->event_limit)) {
79f146415623fe kernel/perf_counter.c Peter Zijlstra            2009-04-06  10781  		ret = 1;
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar               2009-09-21  10782  		event->pending_kill = POLL_HUP;
5aab90ce1ec449 kernel/events/core.c  Jiri Olsa                 2016-10-26  10783  		perf_event_disable_inatomic(event);
18dbcbfabfffc4 kernel/events/core.c  Kan Liang                 2025-08-11  10784  		event->pmu->stop(event, 0);
79f146415623fe kernel/perf_counter.c Peter Zijlstra            2009-04-06  10785  	}
79f146415623fe kernel/perf_counter.c Peter Zijlstra            2009-04-06  10786  
ca6c21327c6af0 kernel/events/core.c  Peter Zijlstra            2022-10-06  10787  	if (event->attr.sigtrap) {
030a976efae83f kernel/events/core.c  Peter Zijlstra            2022-11-19  10788  		/*
030a976efae83f kernel/events/core.c  Peter Zijlstra            2022-11-19  10789  		 * The desired behaviour of sigtrap vs invalid samples is a bit
030a976efae83f kernel/events/core.c  Peter Zijlstra            2022-11-19  10790  		 * tricky; on the one hand, one should not loose the SIGTRAP if
030a976efae83f kernel/events/core.c  Peter Zijlstra            2022-11-19  10791  		 * it is the first event, on the other hand, we should also not
030a976efae83f kernel/events/core.c  Peter Zijlstra            2022-11-19  10792  		 * trigger the WARN or override the data address.
030a976efae83f kernel/events/core.c  Peter Zijlstra            2022-11-19  10793  		 */
030a976efae83f kernel/events/core.c  Peter Zijlstra            2022-11-19  10794  		bool valid_sample = sample_is_allowed(event, regs);
bb88f9695460be kernel/events/core.c  Marco Elver               2022-10-31  10795  		unsigned int pending_id = 1;
c5d93d23a26012 kernel/events/core.c  Sebastian Andrzej Siewior 2024-07-04  10796  		enum task_work_notify_mode notify_mode;
bb88f9695460be kernel/events/core.c  Marco Elver               2022-10-31  10797  
bb88f9695460be kernel/events/core.c  Marco Elver               2022-10-31  10798  		if (regs)
bb88f9695460be kernel/events/core.c  Marco Elver               2022-10-31  10799  			pending_id = hash32_ptr((void *)instruction_pointer(regs)) ?: 1;
c5d93d23a26012 kernel/events/core.c  Sebastian Andrzej Siewior 2024-07-04  10800  
c5d93d23a26012 kernel/events/core.c  Sebastian Andrzej Siewior 2024-07-04  10801  		notify_mode = in_nmi() ? TWA_NMI_CURRENT : TWA_RESUME;
c5d93d23a26012 kernel/events/core.c  Sebastian Andrzej Siewior 2024-07-04  10802  
c5d93d23a26012 kernel/events/core.c  Sebastian Andrzej Siewior 2024-07-04  10803  		if (!event->pending_work &&
c5d93d23a26012 kernel/events/core.c  Sebastian Andrzej Siewior 2024-07-04  10804  		    !task_work_add(current, &event->pending_task, notify_mode)) {
c5d93d23a26012 kernel/events/core.c  Sebastian Andrzej Siewior 2024-07-04  10805  			event->pending_work = pending_id;
79bd2330108594 kernel/events/core.c  Ben Gainey                2024-07-30  10806  			local_inc(&event->ctx->nr_no_switch_fast);
56799bc0356587 kernel/events/core.c  Frederic Weisbecker       2025-03-04  10807  			WARN_ON_ONCE(!atomic_long_inc_not_zero(&event->refcount));
058244c683111d kernel/events/core.c  Sebastian Andrzej Siewior 2024-07-04  10808  
058244c683111d kernel/events/core.c  Sebastian Andrzej Siewior 2024-07-04  10809  			event->pending_addr = 0;
058244c683111d kernel/events/core.c  Sebastian Andrzej Siewior 2024-07-04  10810  			if (valid_sample && (data->sample_flags & PERF_SAMPLE_ADDR))
058244c683111d kernel/events/core.c  Sebastian Andrzej Siewior 2024-07-04  10811  				event->pending_addr = data->addr;
c5d93d23a26012 kernel/events/core.c  Sebastian Andrzej Siewior 2024-07-04  10812  
030a976efae83f kernel/events/core.c  Peter Zijlstra            2022-11-19  10813  		} else if (event->attr.exclude_kernel && valid_sample) {
bb88f9695460be kernel/events/core.c  Marco Elver               2022-10-31  10814  			/*
bb88f9695460be kernel/events/core.c  Marco Elver               2022-10-31  10815  			 * Should not be able to return to user space without
c5d93d23a26012 kernel/events/core.c  Sebastian Andrzej Siewior 2024-07-04  10816  			 * consuming pending_work; with exceptions:
bb88f9695460be kernel/events/core.c  Marco Elver               2022-10-31  10817  			 *
bb88f9695460be kernel/events/core.c  Marco Elver               2022-10-31  10818  			 *  1. Where !exclude_kernel, events can overflow again
bb88f9695460be kernel/events/core.c  Marco Elver               2022-10-31  10819  			 *     in the kernel without returning to user space.
bb88f9695460be kernel/events/core.c  Marco Elver               2022-10-31  10820  			 *
bb88f9695460be kernel/events/core.c  Marco Elver               2022-10-31  10821  			 *  2. Events that can overflow again before the IRQ-
bb88f9695460be kernel/events/core.c  Marco Elver               2022-10-31  10822  			 *     work without user space progress (e.g. hrtimer).
bb88f9695460be kernel/events/core.c  Marco Elver               2022-10-31  10823  			 *     To approximate progress (with false negatives),
bb88f9695460be kernel/events/core.c  Marco Elver               2022-10-31  10824  			 *     check 32-bit hash of the current IP.
bb88f9695460be kernel/events/core.c  Marco Elver               2022-10-31  10825  			 */
c5d93d23a26012 kernel/events/core.c  Sebastian Andrzej Siewior 2024-07-04  10826  			WARN_ON_ONCE(event->pending_work != pending_id);
ca6c21327c6af0 kernel/events/core.c  Peter Zijlstra            2022-10-06  10827  		}
ca6c21327c6af0 kernel/events/core.c  Peter Zijlstra            2022-10-06  10828  	}
ca6c21327c6af0 kernel/events/core.c  Peter Zijlstra            2022-10-06  10829  
aa6a5f3cb2b2ed kernel/events/core.c  Alexei Starovoitov        2016-09-01  10830  	READ_ONCE(event->overflow_handler)(event, data, regs);
453f19eea7dbad kernel/perf_event.c   Peter Zijlstra            2009-11-20  10831  
fed66e2cdd4f12 kernel/events/core.c  Peter Zijlstra            2015-06-11  10832  	if (*perf_event_fasync(event) && event->pending_kill) {
f506b3dc0ec454 kernel/events/core.c  Peter Zijlstra            2011-05-26  10833  		event->pending_wakeup = 1;
ca6c21327c6af0 kernel/events/core.c  Peter Zijlstra            2022-10-06  10834  		irq_work_queue(&event->pending_irq);
f506b3dc0ec454 kernel/events/core.c  Peter Zijlstra            2011-05-26  10835  	}
18d92bb57c3950 kernel/events/core.c  Adrian Hunter             2024-10-22  10836  out:
18d92bb57c3950 kernel/events/core.c  Adrian Hunter             2024-10-22  10837  	if (event->attr.aux_resume)
18d92bb57c3950 kernel/events/core.c  Adrian Hunter             2024-10-22  10838  		perf_event_aux_pause(event->aux_event, false);
f506b3dc0ec454 kernel/events/core.c  Peter Zijlstra            2011-05-26  10839  
79f146415623fe kernel/perf_counter.c Peter Zijlstra            2009-04-06  10840  	return ret;
f6c7d5fe58b484 kernel/perf_counter.c Peter Zijlstra            2009-04-06  10841  }
f6c7d5fe58b484 kernel/perf_counter.c Peter Zijlstra            2009-04-06  10842  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
