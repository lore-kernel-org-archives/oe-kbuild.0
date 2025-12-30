Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F035D190664
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Dec 2025 16:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767113232; cv=none; b=cV/33/9Ll0k4hefbQbfClk5DHEiaRpTfCv/VMgR880QQTIwbMTajPPf4Y42oAA6G8VVA76Gae21wLczP7eYIKvOIugRTmxZMpq9p/j3pTrL0ZKzm3MWTzMrYqNdej1TbagtB8rFlE2ofLMpN3Ofzi4sWkoIzPSVxGLx1vRjjmnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767113232; c=relaxed/simple;
	bh=azMGZ+Y/w738X1gTmr+Ft9ox9muQzUuW+4LiLYeeONg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=eyEQAWbPFIbY4KJ5fqcCj97HdPYO6oeIdUj3Qum/meipByViJ0LenhwvxoBfia6cQXLR8n1buuq5DP/zWOhxr/5jh6+bitgXCx3KykkWGSgyRpbhV3jboeORAaBTrXPqPr7Jq+5W37JfL1TqvVfoi5iE9fyh5UmwY8H4YzD4Www=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A7leU5gS; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A7leU5gS"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fbc3056afso5473199f8f.2
        for <oe-kbuild@lists.linux.dev>; Tue, 30 Dec 2025 08:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767113229; x=1767718029; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3pfquFHr2E1uP9KAC57iEkcByjX7EFnU9BkMGY8sqcI=;
        b=A7leU5gSZPjMreO/ZSvaDJ2qiy/CwEoiqqyiR0cZe8Gucg2NnmFiI6/89/jZXn1L5w
         Mtz5hlXIzkeUBiUIBgNNQjvxjtwEJrc4rKkyYRunovnI3j9T8wc6jcYrQVh94tKsBpQD
         F1IEBYzGyecygyTaJYIB57zTBi1sKrDrlt7Ev5J2z5SlA/LcvuWqPTRzWkRbn8EcWLBk
         c+iSJ37wJEKI0f7FeFN71zwScxi/X8H3mBTqf/yUnYHCqLCdrBhrqeYkpMk8XeuhMNq0
         K5gSTwC8bu1FOMKO3j4qqlr6E6tId1wwtQ2tvG1yqDvkCwVYs/4JNoxhgZLcH3+WLoUR
         /6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767113229; x=1767718029;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pfquFHr2E1uP9KAC57iEkcByjX7EFnU9BkMGY8sqcI=;
        b=Ma+eKWOUQ9yIMMCujppgH13ED4ZYcTPMhhODFdAtZGLMDlhBZ9d2fbXd5pUTjvUGQ6
         LyMqDibBdwVi0PE2dOacPSC7dSyRxE1tC/SCLJmojkEtCUSt0fukB2jQ/jVYRgiL3Jhr
         gtwiwKymNIZ3UesU361k5vTmOz+CLkRvdtnwnQEsgI0flZPpYD7JN/ptS7qbBw93GBda
         DqaWTKnj5ZpTSrlIFtXgMVm8kLDFSdoIHgessmR6nG6SUswpjLKxTBVS4PvQohaLqbCg
         VS7NhcSzVlKNYyP/rrmjYXVs9Cc9vSn2vz4M51ZPtUWS0Zs4cfQ3fcBJ+FzNyBnt2nPs
         588g==
X-Gm-Message-State: AOJu0YwKIrhH61eImYnnSFedmTIMzVvadixPOKFtPNeVhPxVTo/mt3Y0
	c0SpsWwxBLb36VBTSB/lzdu5xl9yPdYBQ2kKptVs5BsNMlFJRpKk24GlVvLn4SGb/9oauWx1UrC
	RIoR4
X-Gm-Gg: AY/fxX4YhRgYe3RAnycaRTaxFWRUE4KmA23LDu/38oHYGZejF+82TK9Q7pYja+CHmVD
	2b2LBfvgoBs1a5hSF5SpbbB1AN3g3rGaLR7v0IFSJgPqNPG02tX5UrixogX/hdSpjz1g2Q/lehu
	2nYdCWolhMfMGa8BOTY/mn3OrpYqabwhvICCVe3Y42S0SWynN0Gt/Ud1HbydVukV7synwIEmI/Z
	UyLFUHLBxPvkfHnGamV0F5X95m/d3l1aBpQjfrPXfrl92yylFN+l9gX2D+BeHc+YZBxoj8bHuVt
	1YvA4JgAsXcEx4MDf1ht30oUt8+2IXn1nwkFQp1XUUjKwK4ApyJ8VVELpIjgKEW2EmZHILGs9LO
	uLRbTXpUsKQYqUJHoYOefp4PfOzcVTGBXrlehfvU2JNFkccnapSiC0zPAByF0/WgyjF++aLSdD0
	M1RwkZaRy3ZFx9T5rx
X-Google-Smtp-Source: AGHT+IHMq3rkyfVIFLOAgqrtI8Kd81444k2H0h1pzFPyc4MxuoT1oRDzP4THcxMscABTwCEuwuAx4Q==
X-Received: by 2002:a05:6000:144c:b0:430:ff81:2965 with SMTP id ffacd0b85a97d-4324e50bb11mr43495198f8f.49.1767113228812;
        Tue, 30 Dec 2025 08:47:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43277b82a58sm35493375f8f.6.2025.12.30.08.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 08:47:08 -0800 (PST)
Date: Tue, 30 Dec 2025 19:47:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	Sebastian Reichel <sre@kernel.org>,
	Bartosz Golaszewski <bgolasze@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: Re: [PATCH v22 2/2] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
Message-ID: <202512271806.n2lycyZw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-next-15nov_expose_sysfs-v22-2-2d153438ba19@oss.qualcomm.com>
Message-ID: <20251230164705.SHV2BfiJ4cF0prBX7o027Alq_qOhXeS7rUA2A6tlSV0@z>

Hi Shivendra,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Shivendra-Pratap/Documentation-ABI-Add-sysfs-class-reboot-mode-reboot_modes/20251227-025914
base:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
patch link:    https://lore.kernel.org/r/20251227-next-15nov_expose_sysfs-v22-2-2d153438ba19%40oss.qualcomm.com
patch subject: [PATCH v22 2/2] power: reset: reboot-mode: Expose sysfs for registered reboot_modes
config: x86_64-randconfig-161-20251227 (https://download.01.org/0day-ci/archive/20251227/202512271806.n2lycyZw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512271806.n2lycyZw-lkp@intel.com/

smatch warnings:
drivers/power/reset/reboot-mode.c:147 reboot_mode_create_device() error: we previously assumed 'head' could be null (see line 112)

vim +/head +147 drivers/power/reset/reboot-mode.c

e5f49083a20ae0 Shivendra Pratap 2025-12-27  103  static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
e5f49083a20ae0 Shivendra Pratap 2025-12-27  104  {
e5f49083a20ae0 Shivendra Pratap 2025-12-27  105  	struct sysfs_data *sysfs_info;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  106  	struct sysfs_data *next;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  107  	struct list_head *head;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  108  	struct mode_info *info;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  109  	int ret;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  110  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  111  	head = kzalloc(sizeof(*head), GFP_KERNEL);
e5f49083a20ae0 Shivendra Pratap 2025-12-27 @112  	if (!head) {
e5f49083a20ae0 Shivendra Pratap 2025-12-27  113  		ret = -ENOMEM;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  114  		goto error;

This should just be return -ENOMEM;

e5f49083a20ae0 Shivendra Pratap 2025-12-27  115  	}
e5f49083a20ae0 Shivendra Pratap 2025-12-27  116  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  117  	INIT_LIST_HEAD(head);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  118  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  119  	list_for_each_entry(info, &reboot->head, list) {
e5f49083a20ae0 Shivendra Pratap 2025-12-27  120  		sysfs_info = kzalloc(sizeof(*sysfs_info), GFP_KERNEL);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  121  		if (!sysfs_info) {
e5f49083a20ae0 Shivendra Pratap 2025-12-27  122  			ret = -ENOMEM;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  123  			goto error;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  124  		}
e5f49083a20ae0 Shivendra Pratap 2025-12-27  125  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  126  		sysfs_info->mode = kstrdup_const(info->mode, GFP_KERNEL);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  127  		if (!sysfs_info->mode) {
e5f49083a20ae0 Shivendra Pratap 2025-12-27  128  			kfree(sysfs_info);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  129  			ret = -ENOMEM;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  130  			goto error;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  131  		}
e5f49083a20ae0 Shivendra Pratap 2025-12-27  132  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  133  		list_add_tail(&sysfs_info->list, head);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  134  	}
e5f49083a20ae0 Shivendra Pratap 2025-12-27  135  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  136  	reboot->reboot_mode_device = device_create(&reboot_mode_class, NULL, 0,
e5f49083a20ae0 Shivendra Pratap 2025-12-27  137  						   (void *)head, reboot->dev->driver->name);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  138  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  139  	if (IS_ERR(reboot->reboot_mode_device)) {
e5f49083a20ae0 Shivendra Pratap 2025-12-27  140  		ret = PTR_ERR(reboot->reboot_mode_device);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  141  		goto error;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  142  	}
e5f49083a20ae0 Shivendra Pratap 2025-12-27  143  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  144  	return 0;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  145  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  146  error:
e5f49083a20ae0 Shivendra Pratap 2025-12-27 @147  	list_for_each_entry_safe(sysfs_info, next, head, list) {
                                                                                                   ^^^^
But it is a crash instead.

e5f49083a20ae0 Shivendra Pratap 2025-12-27  148  		list_del(&sysfs_info->list);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  149  		kfree_const(sysfs_info->mode);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  150  		kfree(sysfs_info);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  151  	}
e5f49083a20ae0 Shivendra Pratap 2025-12-27  152  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  153  	kfree(head);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  154  	reboot->reboot_mode_device = NULL;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  155  	return ret;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  156  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

