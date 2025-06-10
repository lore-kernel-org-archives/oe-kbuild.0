Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D82328AB00
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Jun 2025 09:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549312; cv=none; b=o/KkINpoDDF77FDLckpBnqIhZrgxXJXzOelHYsSenDG89ASQefWEmTH7EpfrgO/rDpnZj9uknu0NprX4zZgkEGQSpMoz6KHwuwG5ePaDMLqPGgXm/Z+7ek4oPvOscUbXijhjgJcEHZX1t0MwsVRPwes2b5DZugf69NaIGN069O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549312; c=relaxed/simple;
	bh=JjbHD2phY8KlGPS0WX77CAnJphdtY5wlrsTzFvbYvVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=CCIUA7Z5R0SWwnN0Z3xz5S+urnlEa91VeS02/dxtaiCL7fmzJ91o6mHxAsuejwbCVUR/QqUyYf39K5s1zY3DnwF4eFBowZUACbwJt0AJi/WbBSpRzOO+L2Nsp2c5JJJCK/UDavsOiERIaaGcpxj4NTPDVwTpGOTPCs9zJq0cWa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AH80Hnma; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AH80Hnma"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so10299753a12.3
        for <oe-kbuild@lists.linux.dev>; Tue, 10 Jun 2025 02:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749549308; x=1750154108; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BDc/79+RuAdlSY4uZ7KWYfQD+mg4JnBPNq2hVHtFBD4=;
        b=AH80Hnma9VN+oWdGaiJUdjb/WW4wPg8zTzCkIETba1FAiGgilKRE3Erzj9BP6Scuxn
         rENgaDPp06cOwMM6zYe3pVJfa5qy2JZRE1PbN28GccZYYfAWXZYRUm8ru3ULX/ZDCdJu
         RIhcA3CdgfhRS6/UX+XeSvlB0AbtnwXenRfba+3q+LSvyEyGVRGO0ltZAH7NpoqffVa+
         fHUqSsmjhbpiUN8LKK5P3P6MMGRwssApQTg3AOLJNIL38CGIeaQEJ0aGJCjuB8+Mz/+y
         9IynysjT/846Ijnl/NAd5f8trHd8+Q7K8SjePriqGTUWERF2BVwDpvbHUxOHtBe5jQQz
         CJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549308; x=1750154108;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDc/79+RuAdlSY4uZ7KWYfQD+mg4JnBPNq2hVHtFBD4=;
        b=w6v9kjuwQajqHx2lid4uWY7Ho3LPMSdRxFUvZW7xapy7eu16wORB1EYibiqUNmn1t1
         PMKF2JNzU6kqxegTkqSqk5gjYlE5gxlNklXfuGXXDdJdu/XT5ahN8IGppjRz0C2eyJzB
         icS2AcuTBUG2fEtE35etlQ87ZlJqJAul3gX0QKL/xIB26p24Hl/vSau+V0lLG9ByN8QZ
         uMByjA6J1Itu2RVdHLl7v4c5hEiCqz4bHgMjsBqmmWvsKFcAmp1EfnlBRyBQp74tzBNg
         /2GUyzo1pLMZVWaK806eoznz5da56qk7XSOeacZ5k2NVZ9pgm9FXIc2aN4x3JDSJSlhF
         pNHQ==
X-Gm-Message-State: AOJu0YzGoqqCO/M7LA4uIpehjM4ndQ7eCAPYcsaAZLlofu3OZj2snyCK
	CGqYYVAVwbKG6izJD9uya2oFsmUnB2fCMYSmT2cOTVtXvCNlFEiCYroo5kvURqkjZDUHWkxrm9d
	uC09y
X-Gm-Gg: ASbGncumM3AhB3LNwyLtfQu+LEPClffxRF+NicemrV5aKPboIWrmh+huTCHGtxdqmZD
	mV6umfFOWbveF6qND2p5rXxjuACLQSo+KCxPCEgSEs/jSPSDv+50BKJZ1vge8SQWjLrZUIQXrOY
	R/1CL32aRaQ6bXD+1T9wAucMo8Ft/7Mtsyb4ngKk2293N9bJZi8oRzOi1ShIg17oz7WZLOxhT5G
	7Ha/lcZPllbETrNoul7U0F2eOfV+ov4PaJc4rOpT43a9grF5T+YF5p9l8sNvzz88dN9/8qPrEUk
	wbCqi41srklE41maMWJGAL2xxRn/kct5XIAJS2poF7Ta1JVI7KR/pVSBPKXLuQHB0JU=
X-Google-Smtp-Source: AGHT+IGzuWpLJuvNNJ5G9B9m8QYKEPNmPDW9ChoxRm2mznTfjw5Y68DUVnNnmXJLDm0ZXKwRPdzcYw==
X-Received: by 2002:a05:600c:64c3:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-4520143721amr196461635e9.10.1749547479396;
        Tue, 10 Jun 2025 02:24:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4530f7ed8cfsm63035915e9.11.2025.06.10.02.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:24:38 -0700 (PDT)
Date: Tue, 10 Jun 2025 12:24:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] tracing: Fix regression of filter waiting a long time on
 RCU synchronization
Message-ID: <202506070424.lCiNreTI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605161701.35f7989a@gandalf.local.home>
Message-ID: <20250610092434.PJFMDnA_wXMzU8_anh2QKiVrTTqGHVmyEG2XiD1TW9I@z>

Hi Steven,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Fix-regression-of-filter-waiting-a-long-time-on-RCU-synchronization/20250606-041722
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20250605161701.35f7989a%40gandalf.local.home
patch subject: [PATCH] tracing: Fix regression of filter waiting a long time on RCU synchronization
config: riscv-randconfig-r072-20250606 (https://download.01.org/0day-ci/archive/20250607/202506070424.lCiNreTI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506070424.lCiNreTI-lkp@intel.com/

smatch warnings:
kernel/trace/trace_events_filter.c:1452 filter_free_subsystem_filters() warn: 'head' double freed

vim +/head +1452 kernel/trace/trace_events_filter.c

7967b3e0c40ff7 Steven Rostedt (Red Hat  2015-05-13  1412) static void filter_free_subsystem_filters(struct trace_subsystem_dir *dir,
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1413  					  struct trace_array *tr,
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1414  					  struct event_filter *filter)
f306cc82a93d6b Tom Zanussi              2013-10-24  1415  {
7f1d2f8210195c Steven Rostedt (Red Hat  2015-05-05  1416) 	struct trace_event_file *file;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1417  	struct filter_head *head;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1418  	struct filter_list *item;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1419  
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1420  	head = kmalloc(sizeof(*head), GFP_KERNEL);
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1421  	if (!head)
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1422  		goto free_now;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1423  
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1424  	INIT_LIST_HEAD(&head->list);
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1425  
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1426  	item = kmalloc(sizeof(*item), GFP_KERNEL);
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1427  	if (!item) {
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1428  		kfree(head);
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1429  		goto free_now;


head is freed.

b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1430  	}
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1431  
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1432  	item->filter = filter;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1433  	list_add_tail(&item->list, &head->list);
cfb180f3e71b2a Tom Zanussi              2009-03-22  1434  
f306cc82a93d6b Tom Zanussi              2013-10-24  1435  	list_for_each_entry(file, &tr->events, list) {
bb9ef1cb7d8668 Oleg Nesterov            2014-07-15  1436  		if (file->system != dir)
8e254c1d183f02 Li Zefan                 2009-08-31  1437  			continue;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1438  		item = kmalloc(sizeof(*item), GFP_KERNEL);
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1439  		if (!item)
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1440  			goto free_now;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1441  		item->filter = file->filter;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1442  		list_add_tail(&item->list, &head->list);
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1443  		file->filter = NULL;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1444  	}
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1445  
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1446  	delay_free_filter(head);
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1447  	return;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1448   free_now:
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1449  	tracepoint_synchronize_unregister();
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1450  
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1451  	if (head)
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05 @1452  		free_filter_list(&head->rcu);

This is a use after free.  Smatch calls is a "double free" because
free_filter_list() has "free" in the name, but Smatch is wrong.
However, still a bug.

b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1453  
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1454  	list_for_each_entry(file, &tr->events, list) {
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1455  		if (file->system != dir || !file->filter)
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1456  			continue;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1457  		__free_filter(file->filter);
cfb180f3e71b2a Tom Zanussi              2009-03-22  1458  	}
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1459  	__free_filter(filter);
cfb180f3e71b2a Tom Zanussi              2009-03-22  1460  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

