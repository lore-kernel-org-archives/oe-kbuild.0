Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB63178395
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 17:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729532683; cv=none; b=Lb+c54cAl/VpE7vm4f8QJulloGAXpftX2xwKMXlrlrwWAh0O7hRO1gn/JmkU0/fJ2m5DqXXqzv9maeLChMq6yvIqlSCj41SkBhLWoLRTZu3O2eJq+0E0f9cn7PFr3FisS8kHeq9MMn3UYUL96odh1X6AbrZe2dDO4gO5+0gaxkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729532683; c=relaxed/simple;
	bh=W6HmAE5sAkho1DdIM7dQ16bpFIcDwcTqTEGD0SZwkXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F54acnEdNuYc2EZbRtlSmzw1/oxJC/WVzuLkoLAI6o/rmHNDJ/UC/NgR5KzhuYa+nhQ2cZMMlxe1v3dKH89JuqaOIhrQ4+2tNLE3XzECUgMBErHeNxHSouQV8QH6Z5AtjPLjNo91j7mar0qVsK+RjSkh4NVM08afd/AiclihOrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GXrflhC0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GXrflhC0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729532681; x=1761068681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W6HmAE5sAkho1DdIM7dQ16bpFIcDwcTqTEGD0SZwkXw=;
  b=GXrflhC0zisCpSJXibtZAYgaUzSwHVQzIoD9wBNawCjiPZUEwqwVXqjZ
   m5U/QS6rEIL/nmvRTQsoRLsILCP83qplNuRd83IiIbdmOLJNbvLQ+jl7Z
   vDzY/iVb4FUkYjSy7A1gPLwAaP7CSS0NppJfgBcl/9PTm6gPqLGHy9KBd
   maGPAKmI08hNgF7C+kF/gTnoJtfeI8O+PLgpbP4wdz2wjeVXv8rd2smYE
   iS9+FDCblueyC9rQNH7365DZyk717TZ/RtG/B8BmB/P7PfGI7EJvexspo
   aVq83jFTbdBHHrzkDuamj6qt/GVmsKiZw1UzDs1MyxxRaKKkIvl/PUGay
   Q==;
X-CSE-ConnectionGUID: YeUdfpCGRTWtbEY+74L9Rg==
X-CSE-MsgGUID: L4LJGPEFSluNK9AyuF+ulw==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="32960835"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="32960835"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 10:44:40 -0700
X-CSE-ConnectionGUID: VhKnSAGBRceQU5hRM2157g==
X-CSE-MsgGUID: vDThbpo8T+abXIzTGSKusg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="79229673"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Oct 2024 10:44:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2wSL-000STy-10;
	Mon, 21 Oct 2024 17:44:37 +0000
Date: Tue, 22 Oct 2024 01:44:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/trace/fgraph.c:1317 register_ftrace_graph() warn:
 inconsistent returns '&ftrace_lock'.
Message-ID: <202410220121.wxg0olfd-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Steven Rostedt <rostedt@goodmis.org>

Hi Steven,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   42f7652d3eb527d03665b09edac47f85fb600924
commit: 2c02f7375e658ae93d57a31a66f91b62754ef8f1 fgraph: Use CPU hotplug mechanism to initialize idle shadow stacks
date:   3 days ago
:::::: branch date: 19 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20241020 (https://download.01.org/0day-ci/archive/20241022/202410220121.wxg0olfd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410220121.wxg0olfd-lkp@intel.com/

smatch warnings:
kernel/trace/fgraph.c:1317 register_ftrace_graph() warn: inconsistent returns '&ftrace_lock'.

vim +1317 kernel/trace/fgraph.c

2c02f7375e658ae Steven Rostedt            2024-10-18  1246  
688f7089d8851b1 Steven Rostedt (VMware    2018-11-15  1247) int register_ftrace_graph(struct fgraph_ops *gops)
e73e679f656e678 Steven Rostedt (VMware    2018-11-15  1248) {
2c02f7375e658ae Steven Rostedt            2024-10-18  1249  	static bool fgraph_initialized;
c132be2c4fcc115 Steven Rostedt (VMware    2024-06-03  1250) 	int command = 0;
e73e679f656e678 Steven Rostedt (VMware    2018-11-15  1251) 	int ret = 0;
6d4786592ac88aa Masami Hiramatsu (Google  2024-06-03  1252) 	int i = -1;
e73e679f656e678 Steven Rostedt (VMware    2018-11-15  1253) 
e73e679f656e678 Steven Rostedt (VMware    2018-11-15  1254) 	mutex_lock(&ftrace_lock);
e73e679f656e678 Steven Rostedt (VMware    2018-11-15  1255) 
2c02f7375e658ae Steven Rostedt            2024-10-18  1256  	if (!fgraph_initialized) {
2c02f7375e658ae Steven Rostedt            2024-10-18  1257  		ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "fgraph_idle_init",
2c02f7375e658ae Steven Rostedt            2024-10-18  1258  					fgraph_cpu_init, NULL);
2c02f7375e658ae Steven Rostedt            2024-10-18  1259  		if (ret < 0) {
2c02f7375e658ae Steven Rostedt            2024-10-18  1260  			pr_warn("fgraph: Error to init cpu hotplug support\n");
2c02f7375e658ae Steven Rostedt            2024-10-18  1261  			return ret;
2c02f7375e658ae Steven Rostedt            2024-10-18  1262  		}
2c02f7375e658ae Steven Rostedt            2024-10-18  1263  		fgraph_initialized = true;
2c02f7375e658ae Steven Rostedt            2024-10-18  1264  		ret = 0;
2c02f7375e658ae Steven Rostedt            2024-10-18  1265  	}
2c02f7375e658ae Steven Rostedt            2024-10-18  1266  
518d6804a865772 Steven Rostedt (VMware    2024-06-03  1267) 	if (!fgraph_array[0]) {
518d6804a865772 Steven Rostedt (VMware    2024-06-03  1268) 		/* The array must always have real data on it */
518d6804a865772 Steven Rostedt (VMware    2024-06-03  1269) 		for (i = 0; i < FGRAPH_ARRAY_SIZE; i++)
518d6804a865772 Steven Rostedt (VMware    2024-06-03  1270) 			fgraph_array[i] = &fgraph_stub;
6d4786592ac88aa Masami Hiramatsu (Google  2024-06-03  1271) 		fgraph_lru_init();
518d6804a865772 Steven Rostedt (VMware    2024-06-03  1272) 	}
518d6804a865772 Steven Rostedt (VMware    2024-06-03  1273) 
6d4786592ac88aa Masami Hiramatsu (Google  2024-06-03  1274) 	i = fgraph_lru_alloc_index();
6d4786592ac88aa Masami Hiramatsu (Google  2024-06-03  1275) 	if (i < 0 || WARN_ON_ONCE(fgraph_array[i] != &fgraph_stub)) {
c132be2c4fcc115 Steven Rostedt (VMware    2024-06-03  1276) 		ret = -ENOSPC;
e73e679f656e678 Steven Rostedt (VMware    2018-11-15  1277) 		goto out;
e73e679f656e678 Steven Rostedt (VMware    2018-11-15  1278) 	}
7aa1eaef9f4282c Steven Rostedt (VMware    2024-06-03  1279) 	gops->idx = i;
e73e679f656e678 Steven Rostedt (VMware    2018-11-15  1280) 
e73e679f656e678 Steven Rostedt (VMware    2018-11-15  1281) 	ftrace_graph_active++;
518d6804a865772 Steven Rostedt (VMware    2024-06-03  1282) 
cc60ee813b50334 Steven Rostedt (Google    2024-06-03  1283) 	if (ftrace_graph_active == 2)
cc60ee813b50334 Steven Rostedt (Google    2024-06-03  1284) 		ftrace_graph_disable_direct(true);
cc60ee813b50334 Steven Rostedt (Google    2024-06-03  1285) 
518d6804a865772 Steven Rostedt (VMware    2024-06-03  1286) 	if (ftrace_graph_active == 1) {
a069a22f391019e Masami Hiramatsu (Google  2024-08-18  1287) 		ftrace_graph_enable_direct(false, gops);
518d6804a865772 Steven Rostedt (VMware    2024-06-03  1288) 		register_pm_notifier(&ftrace_suspend_notifier);
e73e679f656e678 Steven Rostedt (VMware    2018-11-15  1289) 		ret = start_graph_tracing();
c132be2c4fcc115 Steven Rostedt (VMware    2024-06-03  1290) 		if (ret)
c132be2c4fcc115 Steven Rostedt (VMware    2024-06-03  1291) 			goto error;
e73e679f656e678 Steven Rostedt (VMware    2018-11-15  1292) 		/*
2fbb549983763b2 Steven Rostedt (VMware    2024-06-03  1293) 		 * Some archs just test to see if these are not
2fbb549983763b2 Steven Rostedt (VMware    2024-06-03  1294) 		 * the default function
e73e679f656e678 Steven Rostedt (VMware    2018-11-15  1295) 		 */
2fbb549983763b2 Steven Rostedt (VMware    2024-06-03  1296) 		ftrace_graph_return = return_run;
2fbb549983763b2 Steven Rostedt (VMware    2024-06-03  1297) 		ftrace_graph_entry = entry_run;
c132be2c4fcc115 Steven Rostedt (VMware    2024-06-03  1298) 		command = FTRACE_START_FUNC_RET;
4497412a1f7b5d9 Steven Rostedt (VMware    2024-06-03  1299) 	} else {
4497412a1f7b5d9 Steven Rostedt (VMware    2024-06-03  1300) 		init_task_vars(gops->idx);
c132be2c4fcc115 Steven Rostedt (VMware    2024-06-03  1301) 	}
df3ec5da6a1e7f6 Steven Rostedt (Google    2024-06-03  1302) 	/* Always save the function, and reset at unregistering */
df3ec5da6a1e7f6 Steven Rostedt (Google    2024-06-03  1303) 	gops->saved_func = gops->entryfunc;
df3ec5da6a1e7f6 Steven Rostedt (Google    2024-06-03  1304) 
c132be2c4fcc115 Steven Rostedt (VMware    2024-06-03  1305) 	ret = ftrace_startup_subops(&graph_ops, &gops->ops, command);
a069a22f391019e Masami Hiramatsu (Google  2024-08-18  1306) 	if (!ret)
a069a22f391019e Masami Hiramatsu (Google  2024-08-18  1307) 		fgraph_array[i] = gops;
a069a22f391019e Masami Hiramatsu (Google  2024-08-18  1308) 
c132be2c4fcc115 Steven Rostedt (VMware    2024-06-03  1309) error:
c132be2c4fcc115 Steven Rostedt (VMware    2024-06-03  1310) 	if (ret) {
c132be2c4fcc115 Steven Rostedt (VMware    2024-06-03  1311) 		ftrace_graph_active--;
df3ec5da6a1e7f6 Steven Rostedt (Google    2024-06-03  1312) 		gops->saved_func = NULL;
6d4786592ac88aa Masami Hiramatsu (Google  2024-06-03  1313) 		fgraph_lru_release_index(i);
518d6804a865772 Steven Rostedt (VMware    2024-06-03  1314) 	}
e73e679f656e678 Steven Rostedt (VMware    2018-11-15  1315) out:
e73e679f656e678 Steven Rostedt (VMware    2018-11-15  1316) 	mutex_unlock(&ftrace_lock);
e73e679f656e678 Steven Rostedt (VMware    2018-11-15 @1317) 	return ret;
e73e679f656e678 Steven Rostedt (VMware    2018-11-15  1318) }
e73e679f656e678 Steven Rostedt (VMware    2018-11-15  1319) 

:::::: The code at line 1317 was first introduced by commit
:::::: e73e679f656e678b0e7f8961094201f3544f4541 fgraph: Move function graph specific code into fgraph.c

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
