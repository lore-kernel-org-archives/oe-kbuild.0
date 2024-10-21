Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C941F7089
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 17:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729533560; cv=none; b=McLgx8GvRIWxyJ9PaHvCCMtqvsYQ/cxKdk+3y69Uup4u4pHFQJBM7fX1cjSiE5/K2Mtmvebu0kgm6QOHXSNegUmoqotlhQjVbEn+5bcTJg3hQk1eEu8inJX4xW0pGEr8kN4A/EIqTbIAgPN1Qb2rVVbFevYC4WompgS/uqpxDTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729533560; c=relaxed/simple;
	bh=zBxOz2PKiAMcUdIlDQcdTkv9bm2UiCEpiRRjP6g7cig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e/wqTKAV36wu89A/5kJ4SjDPAyx8XtjDu6GBBIL9BDhwnKC2Flir09MU5gxiO39F6tmBW0odrQbbDbHuaE34jjveu1QHqHU64ZdrdedB4oJrEkUDsNW4jVK7ByFvDVpt6Et5FT76yKKb0+f6hcgvTIne9lK1i98kfG6Gf/4wml4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gtq54ESS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gtq54ESS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43163667f0eso32313075e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 10:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729533554; x=1730138354; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EvKRXFh670I33kQAOezgjUTcilQDzlgbUdaDIibWXsc=;
        b=gtq54ESStFEsfPu68dJNrzvXQhzIslsTcqIkwR+BcU8D6XWbo/RhhSv2fH7HbC7v9F
         f+9EYedDzr+Hw/fW4zQpdwAejteoR+5tclM6YGCSZCnN1dZb7Xaa+akg43S6jYfI2D9q
         qWIv472aCr8Vd+kZ6+hy1ripU8NaOFlqmiG+pXHzKuRVp7Bj9Qs0lxC6lbcH33YSUlKj
         UZM3fVWTTH6QlZ4B5/m2wBruC9N69dL0wLBcVLGUB7ys8eAC3dGlVbdcpWu2UijroBuR
         CwmIito85UUMEOQd5gZxbZio0OSMakF8UGLeGAdL4i4DNWYAk+86dyIrLA+5oNYXvt15
         YjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729533554; x=1730138354;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EvKRXFh670I33kQAOezgjUTcilQDzlgbUdaDIibWXsc=;
        b=UzIRwuHItTUqyyMTjq9t6aoXjenZJFNMPq39E1DLTjHqRXRDihA0+oO9YsMcmYwhG/
         ymYST4bfINCnfHWj5S5Bf3mFfgr+f7NhYaDepSRkMr5JVLoTsrxRg3QVURbjxn8K2LL1
         A0G4yI6P36E78klIVmTK12xiCIYmkK+lfun2qfx3KQt4+1eQ3CDHvpYBgHwOYQPSO7TS
         H/snP6AksvL12dUy0TZNMuCSFp6lHdC1a/6tV5QS2oIvdzogro+/iRDHN1Yz6c+R31B2
         k3ed2hT1I6+nWn893Rx24qjmDyD+JmOXZ+NSFFXGVRGFlBHF0MO7qTT7KilgLgaz9UxZ
         0ksA==
X-Gm-Message-State: AOJu0Yxgs6Rc+SfpXBAf+0UV7fC3oYDjiyKjuC4IU+rweXF6MvfqjKKT
	7UpyWBi/vh7C8lpyB9zvqNv52KN64/H6lzrFLuJ2kFg/MaW7elJ27eLnHR1vTOMUkC2RzYTgAKz
	i
X-Google-Smtp-Source: AGHT+IEqdF36w84AIL9DGp2PjmsBi2+c4cwa4SuwVQPFm8W4VrEsvQKiJ2W2wr7gOatdjMMLouAh1g==
X-Received: by 2002:a05:600c:5490:b0:431:5aea:95f with SMTP id 5b1f17b1804b1-4316165a78cmr112152615e9.16.1729533554534;
        Mon, 21 Oct 2024 10:59:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4317c623dd1sm549415e9.0.2024.10.21.10.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 10:59:14 -0700 (PDT)
Date: Mon, 21 Oct 2024 20:59:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: kernel/trace/fgraph.c:1317 register_ftrace_graph() warn:
 inconsistent returns '&ftrace_lock'.
Message-ID: <0152510c-a9ac-4990-b062-c56204e42c1a@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steven,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   42f7652d3eb527d03665b09edac47f85fb600924
commit: 2c02f7375e658ae93d57a31a66f91b62754ef8f1 fgraph: Use CPU hotplug mechanism to initialize idle shadow stacks
config: x86_64-randconfig-161-20241020 (https://download.01.org/0day-ci/archive/20241022/202410220121.wxg0olfd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410220121.wxg0olfd-lkp@intel.com/

smatch warnings:
kernel/trace/fgraph.c:1317 register_ftrace_graph() warn: inconsistent returns '&ftrace_lock'.

vim +1317 kernel/trace/fgraph.c

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

goto out;

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

