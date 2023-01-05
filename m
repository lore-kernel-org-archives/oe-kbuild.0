Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862A9636;
	Thu,  5 Jan 2023 04:32:45 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so461138wma.1;
        Wed, 04 Jan 2023 20:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yKDYQovoyQyyVAppAevicmydYycu3YFAtwMJ7JKg5FI=;
        b=i/9I/yrP1jhhlIrogEYg+zTeBNA3wb80YWC/mpKALE2FP3AbCABpm/Xh/SHXPFukSB
         LXDlfQinnb540wW5PH6vdQwWVH7kj+d3uR7Lpa4uGJZOPJbcTViMOPq0T+MHcGHWoQOe
         hwITYVbBpXprGce8X4jQjb3Ndl/ZJfKmIPUiXMJ7ZIlx0TR0voFc/6ByGvTXGx30Ob0B
         x8EH352Jeo/hkE39fzEsvr0/i4rq1vtYucUSpWZxNKnb+EPCsI2i3OUvUDOnnaa+jugp
         PuxuS4WzhUWC1XQiaOd9IOHoyPnP09vwnZKaogVKQJ4/Akb7I/Gnb5De4Vha8JfvWGhR
         dArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yKDYQovoyQyyVAppAevicmydYycu3YFAtwMJ7JKg5FI=;
        b=I8PrMZPqEIuIwBemT+wNL64gz/77OL8TGr05K7BF0jwC7/t2qKSo39XIxjHDNWnJaz
         bv4uA04yRdfvzXP+K6RtW5cg7Ghr6jxpYJWi+1e2MwGyiHVXpvMWoG5y0UjYcKVu14Aj
         O3Ei4jYkabVuSyw8nyqenWUdxPWGDuDQxa7MPYBak+SfzzgfbI6Wor3x5eiFTO5l+wx6
         2wLE/Vmw/esSPNYLhCE+61lDY5A0IAZLZFnptRcNqRzoHgPZkPuOMjY67TnSEVLVnxnU
         YyNeEcR0Fo7Et5iF/88V1j/UbxeUPV/2UM/Agx+SFcJIo4e3cNzinWdKzMqVGLlMBBah
         wtHQ==
X-Gm-Message-State: AFqh2kpQEhYam6Y7c1LE2i7vkh48vlzFCdPjyyaFp1z9zo4BX8g0HkOZ
	O55WzVhqIWjvAjf4eJYy1/gGRuHfzSdM2Q==
X-Google-Smtp-Source: AMrXdXuw5nWTW/9AMASl5bZUcFMJdpVhVgnffy9zAL0A7dvsClrZEPhzcc5JAqbISL+u6Nnns4hDbQ==
X-Received: by 2002:a05:600c:35ca:b0:3d1:f2de:195a with SMTP id r10-20020a05600c35ca00b003d1f2de195amr38485396wmq.32.1672893163517;
        Wed, 04 Jan 2023 20:32:43 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bg41-20020a05600c3ca900b003d1e34bcbb2sm987206wmb.13.2023.01.04.20.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 20:32:43 -0800 (PST)
Date: Thu, 5 Jan 2023 07:32:40 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Cristian Marussi <cristian.marussi@arm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: [sudeep-holla:for-next/scmi 23/30]
 drivers/firmware/arm_scmi/driver.c:2531 scmi_debugfs_common_setup() error:
 uninitialized symbol 'c_ptr'.
Message-ID: <202301050721.xSWIWpwP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230105043240.uUb395uDko1rnTCFDHOlbiqJ_1giUqcSJUiPL5LDpn4@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git for-next/scmi
head:   0b4d8ff8d58dc9cd19bae9c109b313830263c928
commit: 0868ff68bdf60d4fd3ea542ca568ecf40697a2b5 [23/30] firmware: arm_scmi: Populate a common SCMI debugsfs root
config: parisc-randconfig-m041-20230102
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
drivers/firmware/arm_scmi/driver.c:2531 scmi_debugfs_common_setup() error: uninitialized symbol 'c_ptr'.

vim +/c_ptr +2531 drivers/firmware/arm_scmi/driver.c

0868ff68bdf60d Cristian Marussi 2022-12-29  2512  static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
0868ff68bdf60d Cristian Marussi 2022-12-29  2513  {
0868ff68bdf60d Cristian Marussi 2022-12-29  2514  	int ret;
0868ff68bdf60d Cristian Marussi 2022-12-29  2515  	const char *c_ptr;
0868ff68bdf60d Cristian Marussi 2022-12-29  2516  	char top_dir[16];
0868ff68bdf60d Cristian Marussi 2022-12-29  2517  	struct dentry *trans, *top_dentry;
0868ff68bdf60d Cristian Marussi 2022-12-29  2518  	struct scmi_debug_info *dbg;
0868ff68bdf60d Cristian Marussi 2022-12-29  2519  
0868ff68bdf60d Cristian Marussi 2022-12-29  2520  	dbg = devm_kzalloc(info->dev, sizeof(*dbg), GFP_KERNEL);
0868ff68bdf60d Cristian Marussi 2022-12-29  2521  	if (!dbg)
0868ff68bdf60d Cristian Marussi 2022-12-29  2522  		return NULL;
0868ff68bdf60d Cristian Marussi 2022-12-29  2523  
0868ff68bdf60d Cristian Marussi 2022-12-29  2524  	dbg->name = kstrdup(of_node_full_name(info->dev->of_node), GFP_KERNEL);
0868ff68bdf60d Cristian Marussi 2022-12-29  2525  	if (!dbg->name) {
0868ff68bdf60d Cristian Marussi 2022-12-29  2526  		devm_kfree(info->dev, dbg);
0868ff68bdf60d Cristian Marussi 2022-12-29  2527  		return ERR_PTR(-ENOMEM);
0868ff68bdf60d Cristian Marussi 2022-12-29  2528  	}
0868ff68bdf60d Cristian Marussi 2022-12-29  2529  
0868ff68bdf60d Cristian Marussi 2022-12-29  2530  	of_property_read_string(info->dev->of_node, "compatible", &c_ptr);
0868ff68bdf60d Cristian Marussi 2022-12-29 @2531  	dbg->type = kstrdup(c_ptr, GFP_KERNEL);

My instinct is to agree with the checker on this and say that it does
feel like we should check if of_property_read_string() read something.

0868ff68bdf60d Cristian Marussi 2022-12-29  2532  	if (!dbg->type) {
0868ff68bdf60d Cristian Marussi 2022-12-29  2533  		kfree(dbg->name);
0868ff68bdf60d Cristian Marussi 2022-12-29  2534  		devm_kfree(info->dev, dbg);
0868ff68bdf60d Cristian Marussi 2022-12-29  2535  		return ERR_PTR(-ENOMEM);
0868ff68bdf60d Cristian Marussi 2022-12-29  2536  	}
0868ff68bdf60d Cristian Marussi 2022-12-29  2537  
0868ff68bdf60d Cristian Marussi 2022-12-29  2538  	snprintf(top_dir, 16, "%d", info->id);
0868ff68bdf60d Cristian Marussi 2022-12-29  2539  	top_dentry = debugfs_create_dir(top_dir, scmi_top_dentry);
0868ff68bdf60d Cristian Marussi 2022-12-29  2540  	if (IS_ERR(top_dentry)) {
0868ff68bdf60d Cristian Marussi 2022-12-29  2541  		kfree(dbg->name);
0868ff68bdf60d Cristian Marussi 2022-12-29  2542  		kfree(dbg->type);
0868ff68bdf60d Cristian Marussi 2022-12-29  2543  		devm_kfree(info->dev, dbg);
0868ff68bdf60d Cristian Marussi 2022-12-29  2544  		return NULL;
0868ff68bdf60d Cristian Marussi 2022-12-29  2545  	}
0868ff68bdf60d Cristian Marussi 2022-12-29  2546  
0868ff68bdf60d Cristian Marussi 2022-12-29  2547  	trans = debugfs_create_dir("transport", top_dentry);
0868ff68bdf60d Cristian Marussi 2022-12-29  2548  	if (IS_ERR(trans)) {
0868ff68bdf60d Cristian Marussi 2022-12-29  2549  		debugfs_remove_recursive(top_dentry);
0868ff68bdf60d Cristian Marussi 2022-12-29  2550  		kfree(dbg->name);
0868ff68bdf60d Cristian Marussi 2022-12-29  2551  		kfree(dbg->type);
0868ff68bdf60d Cristian Marussi 2022-12-29  2552  		devm_kfree(info->dev, dbg);
0868ff68bdf60d Cristian Marussi 2022-12-29  2553  		return NULL;
0868ff68bdf60d Cristian Marussi 2022-12-29  2554  	}
0868ff68bdf60d Cristian Marussi 2022-12-29  2555  
0868ff68bdf60d Cristian Marussi 2022-12-29  2556  	dbg->is_atomic = info->desc->atomic_enabled &&
0868ff68bdf60d Cristian Marussi 2022-12-29  2557  				is_transport_polling_capable(info->desc);
0868ff68bdf60d Cristian Marussi 2022-12-29  2558  
0868ff68bdf60d Cristian Marussi 2022-12-29  2559  	debugfs_create_str("instance_name", 0400, top_dentry,
0868ff68bdf60d Cristian Marussi 2022-12-29  2560  			   (char **)&dbg->name);
0868ff68bdf60d Cristian Marussi 2022-12-29  2561  
0868ff68bdf60d Cristian Marussi 2022-12-29  2562  	debugfs_create_u32("atomic_threshold_us", 0400, top_dentry,
0868ff68bdf60d Cristian Marussi 2022-12-29  2563  			   &info->atomic_threshold);
0868ff68bdf60d Cristian Marussi 2022-12-29  2564  
0868ff68bdf60d Cristian Marussi 2022-12-29  2565  	debugfs_create_str("type", 0400, trans, (char **)&dbg->type);
0868ff68bdf60d Cristian Marussi 2022-12-29  2566  
0868ff68bdf60d Cristian Marussi 2022-12-29  2567  	debugfs_create_bool("is_atomic", 0400, trans, &dbg->is_atomic);
0868ff68bdf60d Cristian Marussi 2022-12-29  2568  
0868ff68bdf60d Cristian Marussi 2022-12-29  2569  	debugfs_create_u32("max_rx_timeout_ms", 0400, trans,
0868ff68bdf60d Cristian Marussi 2022-12-29  2570  			   (u32 *)&info->desc->max_rx_timeout_ms);
0868ff68bdf60d Cristian Marussi 2022-12-29  2571  
0868ff68bdf60d Cristian Marussi 2022-12-29  2572  	debugfs_create_u32("max_msg_size", 0400, trans,
0868ff68bdf60d Cristian Marussi 2022-12-29  2573  			   (u32 *)&info->desc->max_msg_size);
0868ff68bdf60d Cristian Marussi 2022-12-29  2574  
0868ff68bdf60d Cristian Marussi 2022-12-29  2575  	debugfs_create_u32("tx_max_msg", 0400, trans,
0868ff68bdf60d Cristian Marussi 2022-12-29  2576  			   (u32 *)&info->tx_minfo.max_msg);
0868ff68bdf60d Cristian Marussi 2022-12-29  2577  
0868ff68bdf60d Cristian Marussi 2022-12-29  2578  	debugfs_create_u32("rx_max_msg", 0400, trans,
0868ff68bdf60d Cristian Marussi 2022-12-29  2579  			   (u32 *)&info->rx_minfo.max_msg);
0868ff68bdf60d Cristian Marussi 2022-12-29  2580  
0868ff68bdf60d Cristian Marussi 2022-12-29  2581  	dbg->top_dentry = top_dentry;
0868ff68bdf60d Cristian Marussi 2022-12-29  2582  
0868ff68bdf60d Cristian Marussi 2022-12-29  2583  	ret = devm_add_action_or_reset(info->dev,
0868ff68bdf60d Cristian Marussi 2022-12-29  2584  				       scmi_debugfs_common_cleanup, dbg);
0868ff68bdf60d Cristian Marussi 2022-12-29  2585  	if (ret) {
0868ff68bdf60d Cristian Marussi 2022-12-29  2586  		scmi_debugfs_common_cleanup(dbg);
0868ff68bdf60d Cristian Marussi 2022-12-29  2587  		return NULL;
0868ff68bdf60d Cristian Marussi 2022-12-29  2588  	}
0868ff68bdf60d Cristian Marussi 2022-12-29  2589  
0868ff68bdf60d Cristian Marussi 2022-12-29  2590  	return dbg;
0868ff68bdf60d Cristian Marussi 2022-12-29  2591  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

