Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B1214D283
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 08:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735287174; cv=none; b=nGmC9s4oJ2+1le/OxW0MWv2voi2Rpt7ny8eXVxHwOsQMHFFN4WJ5zZzGFWGunhNfC+QDeDBTxGZz7xSeW830dTx7WO3CgU+CTvv/XzIvDJrrb9YcJn/VSw5IYp8uw5FYV7mZwkkyvudj4f27XVotQ9eZg4x3mvSuHjGapiDtDTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735287174; c=relaxed/simple;
	bh=QQyr/o6Ud5BYQCNDThdv6IvcemZHF5py/Fm2IfmPORw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gEPXs5ZaQR+3mwVmzhMWEuXEeoEx1+RPDSxtDHSkjUubkXOxHUktImonv5d5CJslaxR+FIH2Cs0a/ZbqsC0WOewHQn2f9WcA95H31WJzJ2NO6fT8EpJ/5PtwXrcurVcZ1LydSKin3QJOZGMiwyAen8857125W1nFpwTSs6etFXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LT4/PTBg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LT4/PTBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735287173; x=1766823173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QQyr/o6Ud5BYQCNDThdv6IvcemZHF5py/Fm2IfmPORw=;
  b=LT4/PTBged8GNVhvobAqFl+AttPDI+RfJS6ofiJmxuPGpXwETEgEkWZb
   7PXGm2k3zhH8d7qtrf1obzDZenCdhozNF4Yx9PSs7ZR/wy1HGlsuECXgs
   IpFMvQbLM8efp7wqxc/T3V8ejdkjEgW3eLZb/c81J3P1ol+xyB4P6VT13
   +rzUrr0KpA1btydcf6H+XHP1XhU3tbAAjBop2OWNnPcP5FS9G6EZK1iwU
   ixgjYGRbVwHBx5EemZ4YQwAOBZUsH413XWXIEtuMOlUSjXJ7FM6D00dzk
   QtCSH3ZAJW0I9aMd6w0VV2jGvOyVEcHWvd6gHcSCxdJtLflbNLlZ00XqO
   Q==;
X-CSE-ConnectionGUID: 9MhBOWEUSASnvEalkUAZ4g==
X-CSE-MsgGUID: F26WyVf9TN6RSAQSO59pXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="35405466"
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="35405466"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 00:12:53 -0800
X-CSE-ConnectionGUID: qiaI6t6bRJe3Oz884Q91tw==
X-CSE-MsgGUID: /LbgXlReTyy/T7C3JQTKOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="100228000"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Dec 2024 00:12:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tR5Si-00034x-2W;
	Fri, 27 Dec 2024 08:12:48 +0000
Date: Fri, 27 Dec 2024 16:12:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [trace:trace/for-next 1/15] kernel/trace/trace.c:6111
 tracing_set_tracer() error: uninitialized symbol 'ret'.
Message-ID: <202412271654.nJVBuwmF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Steven Rostedt <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
head:   cff6d93eab00bacf8b6bffdef775fc2de0273c96
commit: d33b10c0c73adca00f72bf4a153a07b7f5f34715 [1/15] tracing: Switch trace.c code over to use guard()
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-161-20241227 (https://download.01.org/0day-ci/archive/20241227/202412271654.nJVBuwmF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412271654.nJVBuwmF-lkp@intel.com/

smatch warnings:
kernel/trace/trace.c:6111 tracing_set_tracer() error: uninitialized symbol 'ret'.

vim +/ret +6111 kernel/trace/trace.c

09d23a1d8a82e8 Steven Rostedt (Red Hat  2015-02-03  6072) 
9c5b9d3d65e485 Masami Hiramatsu         2020-01-11  6073  int tracing_set_tracer(struct trace_array *tr, const char *buf)
09d23a1d8a82e8 Steven Rostedt (Red Hat  2015-02-03  6074) {
bc0c38d139ec7f Steven Rostedt           2008-05-12  6075  	struct tracer *t;
12883efb670c28 Steven Rostedt (Red Hat  2013-03-05  6076) #ifdef CONFIG_TRACER_MAX_TRACE
34600f0e9c33c9 Steven Rostedt           2013-01-22  6077  	bool had_max_tr;
12883efb670c28 Steven Rostedt (Red Hat  2013-03-05  6078) #endif
d33b10c0c73adc Steven Rostedt           2024-12-24  6079  	int ret;
bc0c38d139ec7f Steven Rostedt           2008-05-12  6080  
d33b10c0c73adc Steven Rostedt           2024-12-24  6081  	guard(mutex)(&trace_types_lock);
1027fcb206a0fb Steven Rostedt           2009-03-12  6082  
7a1d1e4b9639ff Steven Rostedt (Google   2024-06-12  6083) 	update_last_data(tr);
7a1d1e4b9639ff Steven Rostedt (Google   2024-06-12  6084) 
a1f157c7a3bb34 Zheng Yejian             2023-09-06  6085  	if (!tr->ring_buffer_expanded) {
2b6080f28c7cc3 Steven Rostedt           2012-05-11  6086  		ret = __tracing_resize_ring_buffer(tr, trace_buf_size,
438ced1720b584 Vaibhav Nagarnaik        2012-02-02  6087  						RING_BUFFER_ALL_CPUS);
73c5162aa362a5 Steven Rostedt           2009-03-11  6088  		if (ret < 0)
d33b10c0c73adc Steven Rostedt           2024-12-24  6089  			return ret;
73c5162aa362a5 Steven Rostedt           2009-03-11  6090  		ret = 0;
73c5162aa362a5 Steven Rostedt           2009-03-11  6091  	}
73c5162aa362a5 Steven Rostedt           2009-03-11  6092  
bc0c38d139ec7f Steven Rostedt           2008-05-12  6093  	for (t = trace_types; t; t = t->next) {
bc0c38d139ec7f Steven Rostedt           2008-05-12  6094  		if (strcmp(t->name, buf) == 0)
bc0c38d139ec7f Steven Rostedt           2008-05-12  6095  			break;
bc0c38d139ec7f Steven Rostedt           2008-05-12  6096  	}
d33b10c0c73adc Steven Rostedt           2024-12-24  6097  	if (!t)
d33b10c0c73adc Steven Rostedt           2024-12-24  6098  		return -EINVAL;
d33b10c0c73adc Steven Rostedt           2024-12-24  6099  
2b6080f28c7cc3 Steven Rostedt           2012-05-11  6100  	if (t == tr->current_trace)
d33b10c0c73adc Steven Rostedt           2024-12-24  6101  		return 0;
bc0c38d139ec7f Steven Rostedt           2008-05-12  6102  
a35873a0993b4d Tom Zanussi              2019-02-13  6103  #ifdef CONFIG_TRACER_SNAPSHOT
a35873a0993b4d Tom Zanussi              2019-02-13  6104  	if (t->use_max_tr) {
c0a581d7126c0b Waiman Long              2022-09-22  6105  		local_irq_disable();
a35873a0993b4d Tom Zanussi              2019-02-13  6106  		arch_spin_lock(&tr->max_lock);
a35873a0993b4d Tom Zanussi              2019-02-13  6107  		if (tr->cond_snapshot)
a35873a0993b4d Tom Zanussi              2019-02-13  6108  			ret = -EBUSY;
a35873a0993b4d Tom Zanussi              2019-02-13  6109  		arch_spin_unlock(&tr->max_lock);
c0a581d7126c0b Waiman Long              2022-09-22  6110  		local_irq_enable();
a35873a0993b4d Tom Zanussi              2019-02-13 @6111  		if (ret)
d33b10c0c73adc Steven Rostedt           2024-12-24  6112  			return ret;
a35873a0993b4d Tom Zanussi              2019-02-13  6113  	}
a35873a0993b4d Tom Zanussi              2019-02-13  6114  #endif
c7b3ae0bd2ca65 Ziqian SUN (Zamir        2017-09-11  6115) 	/* Some tracers won't work on kernel command line */
c7b3ae0bd2ca65 Ziqian SUN (Zamir        2017-09-11  6116) 	if (system_state < SYSTEM_RUNNING && t->noboot) {
c7b3ae0bd2ca65 Ziqian SUN (Zamir        2017-09-11  6117) 		pr_warn("Tracer '%s' is not allowed on command line, ignored\n",
c7b3ae0bd2ca65 Ziqian SUN (Zamir        2017-09-11  6118) 			t->name);
d33b10c0c73adc Steven Rostedt           2024-12-24  6119  		return 0;
c7b3ae0bd2ca65 Ziqian SUN (Zamir        2017-09-11  6120) 	}
c7b3ae0bd2ca65 Ziqian SUN (Zamir        2017-09-11  6121) 
607e2ea167e56d Steven Rostedt (Red Hat  2013-11-06  6122) 	/* Some tracers are only allowed for the top level buffer */
d33b10c0c73adc Steven Rostedt           2024-12-24  6123  	if (!trace_ok_for_array(t, tr))
d33b10c0c73adc Steven Rostedt           2024-12-24  6124  		return -EINVAL;
607e2ea167e56d Steven Rostedt (Red Hat  2013-11-06  6125) 
cf6ab6d9143b15 Steven Rostedt (Red Hat  2014-12-15  6126) 	/* If trace pipe files are being read, we can't change the tracer */
d33b10c0c73adc Steven Rostedt           2024-12-24  6127  	if (tr->trace_ref)
d33b10c0c73adc Steven Rostedt           2024-12-24  6128  		return -EBUSY;
cf6ab6d9143b15 Steven Rostedt (Red Hat  2014-12-15  6129) 
9f029e83e968e5 Steven Rostedt           2008-11-12  6130  	trace_branch_disable();
613f04a0f51e6e Steven Rostedt (Red Hat  2013-03-14  6131) 
50512ab576e1ce Steven Rostedt (Red Hat  2014-01-14  6132) 	tr->current_trace->enabled--;
613f04a0f51e6e Steven Rostedt (Red Hat  2013-03-14  6133) 
2b6080f28c7cc3 Steven Rostedt           2012-05-11  6134  	if (tr->current_trace->reset)
2b6080f28c7cc3 Steven Rostedt           2012-05-11  6135  		tr->current_trace->reset(tr);
613f04a0f51e6e Steven Rostedt (Red Hat  2013-03-14  6136) 

:::::: The code at line 6111 was first introduced by commit
:::::: a35873a0993b4d38b40871f10fa4356c088c7140 tracing: Add conditional snapshot

:::::: TO: Tom Zanussi <tom.zanussi@linux.intel.com>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
