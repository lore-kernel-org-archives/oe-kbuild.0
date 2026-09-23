Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F63D51614C
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 16:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181436; cv=none; b=UqDYB+Yo2YyW3onDMANn/fREARixYgLZpA1Vu/Qfxbldvb6LSBXVE+01Q943OfZ5XYkOak8vbm6unxjB0GOJ8QHwd3p64dikJ4qmpdxkgsGovvYQ/hIQdPwwNHpSnCLXxA6yA2SfBrAm+Mw+hAf+LIDX7xP7XrMgG7LSeGZMS08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181436; c=relaxed/simple;
	bh=O9TCTLZD4yLgAgCn9JTQb1w/exGtv3YS48l8MZnFY7c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZNMGItye3OJudnpygAa3e4RIEFyWO+3rHx+XWLcxIH+gWRdFtXYnPE6WGkEWfBo1+EmMefS6ogcQJd/wsCP+4OdbFN9E2ve496I4usZn055zcXwX3GmaWxM/102iRW6WGcW/2r+0FSnlU8h21NHx+04nGW8139S85zZY0gsM13w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dymXS4Vo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dymXS4Vo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790181426; x=1821717426;
  h=date:from:to:cc:subject:message-id;
  bh=O9TCTLZD4yLgAgCn9JTQb1w/exGtv3YS48l8MZnFY7c=;
  b=dymXS4VouDIUffLpSsnvECZD1XDhO/qeFlXerVSpr3nIPsJ6z52UtvLv
   S4s5cA0j8mZLFB3HsAm+uEIJd8kzJNXtvtq1guaQWe7ng8P8gh3Pp91PC
   MRnJkx4cMAJFZgMM+IuEzAG66M0eG7v8kSJio4ycIKFTxjZJ6W6ftUM01
   dZl4Gg/s5h3Nx9LCzBahOvVL8cOcdI7TC5bzI8VBatXqjTGn3bLfcv4fs
   3hv7SG7Gs4ouI0dIiK2oSEH4AM5ojrJVcq0EXY85NRy/vaTZdWU2geZj4
   NwiqhRcI4WLXVnRGhDqlkR6Q7uZkeDWNjaB7j3TK577NLpjhfNEbNmmhO
   g==;
X-CSE-ConnectionGUID: Ur0gkQnaQ+maAAAATC7j0w==
X-CSE-MsgGUID: nZhZgCJVQuuy0IFoammQwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="116421974"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="116421974"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 09:37:03 -0700
X-CSE-ConnectionGUID: GR1tPFRzTiKeMkWXarT2iw==
X-CSE-MsgGUID: wbpDeUCyTLiFhMvvwuIlKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="272281520"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 23 Sep 2026 09:37:01 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Pxr-000000000kP-114L;
	Wed, 23 Sep 2026 16:36:59 +0000
Date: Wed, 23 Sep 2026 18:36:41 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [paulmckrcu:dev 21/25] kernel/rcu/srcutree.c:1027
 srcu_gp_end() warn: mixing irqsave and irq
Message-ID: <202609231811.oXpDzXGh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kunwu Chan <kunwu.chan@gmail.com>
CC: "Paul E. McKenney" <paulmck@kernel.org>
CC: Zqiang <qiang.zhang@linux.dev>

tree:   https://github.com/paulmckrcu/linux dev
head:   662151462e30187c342cffcd250834a32a9eb67a
commit: a1326e217e8047d4d5be01b42573276ac93a20b0 [21/25] srcutree: Preserve IRQ state in synchronize_srcu_atomic() callchain
:::::: branch date: 21 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-2200-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231811.oXpDzXGh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609231811.oXpDzXGh-lkp@intel.com/

smatch warnings:
kernel/rcu/srcutree.c:1027 srcu_gp_end() warn: mixing irqsave and irq

vim +1027 kernel/rcu/srcutree.c

da915ad5cf25b5 Paul E. McKenney 2017-04-05   972  
da915ad5cf25b5 Paul E. McKenney 2017-04-05   973  /*
da915ad5cf25b5 Paul E. McKenney 2017-04-05   974   * Note the end of an SRCU grace period.  Initiates callback invocation
da915ad5cf25b5 Paul E. McKenney 2017-04-05   975   * and starts a new grace period if needed.
da915ad5cf25b5 Paul E. McKenney 2017-04-05   976   *
da915ad5cf25b5 Paul E. McKenney 2017-04-05   977   * The ->srcu_cb_mutex acquisition does not protect any data, but
da915ad5cf25b5 Paul E. McKenney 2017-04-05   978   * instead prevents more than one grace period from starting while we
da915ad5cf25b5 Paul E. McKenney 2017-04-05   979   * are initiating callback invocation.  This allows the ->srcu_have_cbs[]
da915ad5cf25b5 Paul E. McKenney 2017-04-05   980   * array to have a finite number of elements.
da915ad5cf25b5 Paul E. McKenney 2017-04-05   981   */
dab06d6f93798f Paul E. McKenney 2026-08-18   982  static void srcu_gp_end(struct srcu_struct *ssp, bool is_atomic)
da915ad5cf25b5 Paul E. McKenney 2017-04-05   983  {
4f2bfd9494a072 Neeraj Upadhyay  2022-07-01   984  	unsigned long cbdelay = 1;
da915ad5cf25b5 Paul E. McKenney 2017-04-05   985  	bool cbs;
8ddbd8832d2546 Ildar Ismagilov  2018-01-31   986  	bool last_lvl;
c350c008297643 Paul E. McKenney 2017-05-03   987  	int cpu;
a1326e217e8047 Kunwu Chan       2026-09-14   988  	unsigned long flags;
da915ad5cf25b5 Paul E. McKenney 2017-04-05   989  	unsigned long gpseq;
da915ad5cf25b5 Paul E. McKenney 2017-04-05   990  	int idx;
c7e88067c1ae89 Paul E. McKenney 2017-04-18   991  	unsigned long mask;
c350c008297643 Paul E. McKenney 2017-05-03   992  	struct srcu_data *sdp;
cbdc98e93efa7b Paul E. McKenney 2022-01-26   993  	unsigned long sgsne;
da915ad5cf25b5 Paul E. McKenney 2017-04-05   994  	struct srcu_node *snp;
e2f638365dd628 Paul E. McKenney 2022-01-24   995  	int ss_state;
6c366522e10f2b Paul E. McKenney 2023-03-18   996  	struct srcu_usage *sup = ssp->srcu_sup;
da915ad5cf25b5 Paul E. McKenney 2017-04-05   997  
da915ad5cf25b5 Paul E. McKenney 2017-04-05   998  	/* Prevent more than one additional grace period. */
dab06d6f93798f Paul E. McKenney 2026-08-18   999  	if (!is_atomic)
6c366522e10f2b Paul E. McKenney 2023-03-18  1000  		mutex_lock(&sup->srcu_cb_mutex);
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1001  
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1002  	/* End the current grace period. */
a1326e217e8047 Kunwu Chan       2026-09-14  1003  	raw_spin_lock_irqsave_rcu_node(sup, flags);
6c366522e10f2b Paul E. McKenney 2023-03-18  1004  	idx = rcu_seq_state(sup->srcu_gp_seq);
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1005  	WARN_ON_ONCE(idx != SRCU_STATE_SCAN2);
e3d67186776286 Paul E. McKenney 2024-10-15  1006  	if (srcu_gp_is_expedited(ssp))
4f2bfd9494a072 Neeraj Upadhyay  2022-07-01  1007  		cbdelay = 0;
4f2bfd9494a072 Neeraj Upadhyay  2022-07-01  1008  
6c366522e10f2b Paul E. McKenney 2023-03-18  1009  	WRITE_ONCE(sup->srcu_last_gp_end, ktime_get_mono_fast_ns());
6c366522e10f2b Paul E. McKenney 2023-03-18  1010  	rcu_seq_end(&sup->srcu_gp_seq);
6c366522e10f2b Paul E. McKenney 2023-03-18  1011  	gpseq = rcu_seq_current(&sup->srcu_gp_seq);
6c366522e10f2b Paul E. McKenney 2023-03-18  1012  	if (ULONG_CMP_LT(sup->srcu_gp_seq_needed_exp, gpseq))
6c366522e10f2b Paul E. McKenney 2023-03-18  1013  		WRITE_ONCE(sup->srcu_gp_seq_needed_exp, gpseq);
a1326e217e8047 Kunwu Chan       2026-09-14  1014  	raw_spin_unlock_irqrestore_rcu_node(sup, flags);
dab06d6f93798f Paul E. McKenney 2026-08-18  1015  	if (!is_atomic)
6c366522e10f2b Paul E. McKenney 2023-03-18  1016  		mutex_unlock(&sup->srcu_gp_mutex);
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1017  	/* A new grace period can start at this point.  But only one. */
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1018  
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1019  	/* Initiate callback invocation as needed. */
6c366522e10f2b Paul E. McKenney 2023-03-18  1020  	ss_state = smp_load_acquire(&sup->srcu_size_state);
840b8874bf2a71 Kunwu Chan       2026-09-07  1021  	if (!is_atomic && ss_state < SRCU_SIZE_WAIT_BARRIER) {
7f24626d6dd844 Pingfan Liu      2022-10-31  1022  		srcu_schedule_cbs_sdp(per_cpu_ptr(ssp->sda, get_boot_cpu_id()),
7f24626d6dd844 Pingfan Liu      2022-10-31  1023  					cbdelay);
840b8874bf2a71 Kunwu Chan       2026-09-07  1024  	} else if (!is_atomic) {
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1025  		idx = rcu_seq_ctr(gpseq) % ARRAY_SIZE(snp->srcu_have_cbs);
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1026  		srcu_for_each_node_breadth_first(ssp, snp) {
175b45ed343a9c Paul E. McKenney 2026-03-14 @1027  			raw_spin_lock_irq_rcu_node(snp);
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1028  			cbs = false;
6c366522e10f2b Paul E. McKenney 2023-03-18  1029  			last_lvl = snp >= sup->level[rcu_num_lvls - 1];
8ddbd8832d2546 Ildar Ismagilov  2018-01-31  1030  			if (last_lvl)
c69a00a12e26cf Paul E. McKenney 2022-01-25  1031  				cbs = ss_state < SRCU_SIZE_BIG || snp->srcu_have_cbs[idx] == gpseq;
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1032  			snp->srcu_have_cbs[idx] = gpseq;
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1033  			rcu_seq_set_state(&snp->srcu_have_cbs[idx], 1);
cbdc98e93efa7b Paul E. McKenney 2022-01-26  1034  			sgsne = snp->srcu_gp_seq_needed_exp;
cbdc98e93efa7b Paul E. McKenney 2022-01-26  1035  			if (srcu_invl_snp_seq(sgsne) || ULONG_CMP_LT(sgsne, gpseq))
7ff8b4502bc0f5 Paul E. McKenney 2019-12-22  1036  				WRITE_ONCE(snp->srcu_gp_seq_needed_exp, gpseq);
c69a00a12e26cf Paul E. McKenney 2022-01-25  1037  			if (ss_state < SRCU_SIZE_BIG)
c69a00a12e26cf Paul E. McKenney 2022-01-25  1038  				mask = ~0;
c69a00a12e26cf Paul E. McKenney 2022-01-25  1039  			else
c7e88067c1ae89 Paul E. McKenney 2017-04-18  1040  				mask = snp->srcu_data_have_cbs[idx];
c7e88067c1ae89 Paul E. McKenney 2017-04-18  1041  			snp->srcu_data_have_cbs[idx] = 0;
175b45ed343a9c Paul E. McKenney 2026-03-14  1042  			raw_spin_unlock_irq_rcu_node(snp);
a3883df3935e10 Paul E. McKenney 2017-05-09  1043  			if (cbs)
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1044  				srcu_schedule_cbs_snp(ssp, snp, mask, cbdelay);
994f706872e6ce Paul E. McKenney 2022-01-24  1045  		}
994f706872e6ce Paul E. McKenney 2022-01-24  1046  	}
c350c008297643 Paul E. McKenney 2017-05-03  1047  
c350c008297643 Paul E. McKenney 2017-05-03  1048  	/* Occasionally prevent srcu_data counter wrap. */
994f706872e6ce Paul E. McKenney 2022-01-24  1049  	if (!(gpseq & counter_wrap_check))
994f706872e6ce Paul E. McKenney 2022-01-24  1050  		for_each_possible_cpu(cpu) {
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1051  			sdp = per_cpu_ptr(ssp->sda, cpu);
a1326e217e8047 Kunwu Chan       2026-09-14  1052  			raw_spin_lock_irqsave_rcu_node(sdp, flags);
994f706872e6ce Paul E. McKenney 2022-01-24  1053  			if (ULONG_CMP_GE(gpseq, sdp->srcu_gp_seq_needed + 100))
c350c008297643 Paul E. McKenney 2017-05-03  1054  				sdp->srcu_gp_seq_needed = gpseq;
994f706872e6ce Paul E. McKenney 2022-01-24  1055  			if (ULONG_CMP_GE(gpseq, sdp->srcu_gp_seq_needed_exp + 100))
a35d13ec368661 Ildar Ismagilov  2018-01-31  1056  				sdp->srcu_gp_seq_needed_exp = gpseq;
a1326e217e8047 Kunwu Chan       2026-09-14  1057  			raw_spin_unlock_irqrestore_rcu_node(sdp, flags);
c350c008297643 Paul E. McKenney 2017-05-03  1058  		}
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1059  
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1060  	/* Callback initiation done, allow grace periods after next. */
dab06d6f93798f Paul E. McKenney 2026-08-18  1061  	if (!is_atomic)
6c366522e10f2b Paul E. McKenney 2023-03-18  1062  		mutex_unlock(&sup->srcu_cb_mutex);
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1063  
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1064  	/* Start a new grace period if needed. */
a1326e217e8047 Kunwu Chan       2026-09-14  1065  	raw_spin_lock_irqsave_rcu_node(sup, flags);
6c366522e10f2b Paul E. McKenney 2023-03-18  1066  	gpseq = rcu_seq_current(&sup->srcu_gp_seq);
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1067  	if (!rcu_seq_state(gpseq) &&
6c366522e10f2b Paul E. McKenney 2023-03-18  1068  	    ULONG_CMP_LT(gpseq, sup->srcu_gp_seq_needed)) {
dab06d6f93798f Paul E. McKenney 2026-08-18  1069  		WARN_ON_ONCE(ssp->srcu_reader_flavor & SRCU_READ_FLAVOR_ATOMIC);
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1070  		srcu_gp_start(ssp);
a1326e217e8047 Kunwu Chan       2026-09-14  1071  		raw_spin_unlock_irqrestore_rcu_node(sup, flags);
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1072  		srcu_reschedule(ssp, 0);
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1073  	} else {
a1326e217e8047 Kunwu Chan       2026-09-14  1074  		raw_spin_unlock_irqrestore_rcu_node(sup, flags);
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1075  	}
e2f638365dd628 Paul E. McKenney 2022-01-24  1076  
b19888cb203839 Kunwu Chan       2026-09-11  1077  	/* Transition to big if needed, but never for atomic SRCU. */
b19888cb203839 Kunwu Chan       2026-09-11  1078  	if (ssp->srcu_reader_flavor == SRCU_READ_FLAVOR_ATOMIC && ss_state != SRCU_SIZE_SMALL) {
b19888cb203839 Kunwu Chan       2026-09-11  1079  		WARN_ON_ONCE(1);
b19888cb203839 Kunwu Chan       2026-09-11  1080  	} else if (ss_state != SRCU_SIZE_SMALL && ss_state != SRCU_SIZE_BIG) {
e2f638365dd628 Paul E. McKenney 2022-01-24  1081  		if (ss_state == SRCU_SIZE_ALLOC)
c69a00a12e26cf Paul E. McKenney 2022-01-25  1082  			init_srcu_struct_nodes(ssp, GFP_KERNEL);
e2f638365dd628 Paul E. McKenney 2022-01-24  1083  		else
6c366522e10f2b Paul E. McKenney 2023-03-18  1084  			smp_store_release(&sup->srcu_size_state, ss_state + 1);
e2f638365dd628 Paul E. McKenney 2022-01-24  1085  	}
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1086  }
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1087  

:::::: The code at line 1027 was first introduced by commit
:::::: 175b45ed343a9c547b5f45293d3ea08d38a7b6f4 srcu: Use raw spinlocks so call_srcu() can be used under preempt_disable()

:::::: TO: Paul E. McKenney <paulmck@kernel.org>
:::::: CC: Boqun Feng <boqun@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
