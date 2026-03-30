Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9183803C6
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 07:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774854042; cv=none; b=P9AGO6aXfMQa/kM3E2UQIgStsYfLEaclJNu94f8n2ANPMh+IheSmNQnveNOwRs0Cz8pWuoFnxo9S9fiGUJmFWGmfzpHoHVeVR6CXpR9sckmwPOW/QkFyAUOJ/81E604nzaFgFeBoL7C2VObBhdbQV/q+6zIG28CBFCXIsnR6RE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774854042; c=relaxed/simple;
	bh=a2NpM7gvVGocc+Vgt1MpfyiSCmRllhFJBDZwEb6mpBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=efC3X1J9NXL2quWFQyl3Vm57eJcdsC+KbpUzwub0nVpcsq1z5gksPDKszJMYICNjFCANVcpele8FJzUvd+ZI0qk8tPLf0jXFc3ocjz5JSJy73kmBullclh+vR+TWd+Vk5SD4GQ9I7+tuADAWwk2vkm8Ybg0fW88sb92o8Ficqrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWsXClgw; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWsXClgw"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so4045417f8f.2
        for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 00:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774854039; x=1775458839; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Znm9+UsJNTdKT8r91hnoKvLjBMEEPGA+MIJkGcn/jeM=;
        b=DWsXClgwXotf5muHALvleqjnXllsaQab+UdGbqKpGSar6ckTHGrV2+hLHoVPHEax5C
         9UuxzaDG8sSuGAIdEvY85vV+vI5rTCvKMp+n7EWFVYPgHP8TjJfC1T+FrpfruErBNXmP
         RfZRmzseDeEWaHD7rPOmdHwa4svMzhLFo45QbgLjLQrJo11sSnLfHaiPUzip2Uujz60g
         M0/eDaXk04QuStFe6jaNn60euSSME3ZpGW7QF9tqI4QNW5D9vMqxOW4mAtwqqfocjVWq
         MAp4V79ENZ3wv4JIRm6OLWdcpza7dYXMWV9U/7+hnjlGFL+XC+Lon8tQL2WO2qk/LfM4
         Gd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774854039; x=1775458839;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Znm9+UsJNTdKT8r91hnoKvLjBMEEPGA+MIJkGcn/jeM=;
        b=H7bEvulYV5Fgj1/YHIeraiH6M3l8mmNGMVQOgScygZuEur8ygclPLO4Mv5p8pVGKpV
         +icCbBUGNnNT/6qA4plkfb/3ZvBTsJMqVceHxjQlab4zvPyrHdMC5YqkWGKsTb7VX1Rn
         fyBygeMbYaFQqSEMxVJwYrd0RbmBA+5+gNNE9bHPbOynbRGm7rA6B3NXIpQu47jIQPnK
         NVWifL7KAOSRsX/TYaz2GK03yDIS3Tq41hSBsps+w7KCVgBRLv/8jEtOlJabhMwJfGTe
         S6GTuh1d2zWQWKAHxfnX/vykx/YZtpIGT9UHVIITU8YXfzDENxZENkUxCg+QIzCRvKlu
         5S4g==
X-Gm-Message-State: AOJu0Yz/n/n5bkfqAFvKmh6k/QJZM+kEGVWAtVtEv+e6EQ/LTYHDNxKK
	vUCaeCkcuGq8guTCXbM26Yx0dDl7zf9JwS5zgHPbI+donP2ZpB94nBI9gvoe8Q==
X-Gm-Gg: ATEYQzw3msvf4lXAJ4ssAGQ0s0BSH6M5XvUW9HY0Qq2FE/mJ/brfUUcLVVvDPYLkghm
	/GBJcuPS2yGxIF9WMlGLtMFZj9nINDc8NIJSUUBmewbt3EM7GjMlGEGiysHBde/ctlEwVpFGOvT
	+xDYFXr6l0kgm0qc17Mz24LFK20O1OtWy9krjBx1uDSzsrHTv3bDnVunUrksvJWUfClCnLPT90L
	Iz7gjxWU7RDLb5ch5stK8yaY/B42PV5761PHodYYRyLcu0pZk7zlsRnzMgInyPTfAwZHFK8FOr8
	Dcskvm8GkpdQ9u+la4vA0aJNDywSA+ZCXNROA34emKA3zV4TriBwFhFhpZoZdtSDW18nAAloB7J
	54Ymw6fZerEMgqMsP8cb0SwWvg45aSHNGinj6RafKes8r5JSQLzHMHHCvkh+Voj64B5xGtSA4Gj
	098Y5IVRgNLG3y1i1uDSQ=
X-Received: by 2002:a05:6000:2511:b0:43b:4d25:95ac with SMTP id ffacd0b85a97d-43b9e987ae0mr18400469f8f.1.1774854039117;
        Mon, 30 Mar 2026 00:00:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2487sm17621939f8f.5.2026.03.30.00.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:00:37 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:00:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 7/7] mm/damon/tests/sysfs-kunit.h:80
 damon_sysfs_test_add_targets() error: dereferencing freed memory
 'sysfs_target' (line 79)
Message-ID: <202603290111.IIC2UeIB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260330070034.3Dvl7HYZEmJxpAyAy7ejTVS_QAllkyQMSMXGAeo9H_0@z>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   1eeff75d058d17b506a97fa282e7bbb55074c8d1
commit: 33cf4171196debf6009e33d96dccdd7929071db5 [7/7] mm/damon/tests/sysfs-kunit: handle alloc failures on damon_sysfs_test_add_targets()
config: i386-randconfig-141-20260328 (https://download.01.org/0day-ci/archive/20260329/202603290111.IIC2UeIB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603290111.IIC2UeIB-lkp@intel.com/

smatch warnings:
mm/damon/tests/sysfs-kunit.h:80 damon_sysfs_test_add_targets() error: dereferencing freed memory 'sysfs_target' (line 79)

vim +/sysfs_target +80 mm/damon/tests/sysfs-kunit.h

2caef83db9f8e0 mm/damon/sysfs-test.h        SeongJae Park 2024-06-18  41  static void damon_sysfs_test_add_targets(struct kunit *test)
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  42  {
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  43  	struct damon_sysfs_targets *sysfs_targets;
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  44  	struct damon_sysfs_target *sysfs_target;
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  45  	struct damon_ctx *ctx;
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  46  
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  47  	sysfs_targets = damon_sysfs_targets_alloc();
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  48  	if (!sysfs_targets)
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  49  		kunit_skip(test, "sysfs_targets alloc fail");
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  50  	sysfs_targets->nr = 1;
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  51  	sysfs_targets->targets_arr = kmalloc_array(1,
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  52  			sizeof(*sysfs_targets->targets_arr), GFP_KERNEL);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  53  	if (!sysfs_targets->targets_arr) {
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  54  		kfree(sysfs_targets);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  55  		kunit_skip(test, "targets_arr alloc fail");
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  56  	}
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  57  
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  58  	sysfs_target = damon_sysfs_target_alloc();
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  59  	if (!sysfs_target) {
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  60  		kfree(sysfs_targets->targets_arr);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  61  		kfree(sysfs_targets);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  62  		kunit_skip(test, "sysfs_target alloc fail");
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  63  	}
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  64  	sysfs_target->pid = __damon_sysfs_test_get_any_pid(12, 100);
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  65  	sysfs_target->regions = damon_sysfs_regions_alloc();
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  66  	if (!sysfs_target->regions) {
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  67  		kfree(sysfs_targets->targets_arr);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  68  		kfree(sysfs_targets);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  69  		kfree(sysfs_target);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  70  		kunit_skip(test, "sysfs_regions alloc fail");
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  71  	}
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  72  
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  73  	sysfs_targets->targets_arr[0] = sysfs_target;
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  74  
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  75  	ctx = damon_new_ctx();
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  76  	if (!ctx) {
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  77  		kfree(sysfs_targets->targets_arr);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  78  		kfree(sysfs_targets);
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01 @79  		kfree(sysfs_target);
                                                                                              ^^^^^^^^^^^^^
Freed

33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01 @80  		kfree(sysfs_target->regions);
                                                                                              ^^^^^^^^^^^^^^^^^^^^^
Use after free

33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  81  		kunit_skip(test, "ctx alloc fail");
33cf4171196deb mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  82  	}
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  83  
2caef83db9f8e0 mm/damon/sysfs-test.h        SeongJae Park 2024-06-18  84  	damon_sysfs_add_targets(ctx, sysfs_targets);
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  85  	KUNIT_EXPECT_EQ(test, 1u, nr_damon_targets(ctx));
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  86  
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  87  	sysfs_target->pid = __damon_sysfs_test_get_any_pid(
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  88  			sysfs_target->pid + 1, 200);
2caef83db9f8e0 mm/damon/sysfs-test.h        SeongJae Park 2024-06-18  89  	damon_sysfs_add_targets(ctx, sysfs_targets);
d96727a251fd2b mm/damon/sysfs-test.h        SeongJae Park 2024-06-18  90  	KUNIT_EXPECT_EQ(test, 2u, nr_damon_targets(ctx));
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  91  
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  92  	damon_destroy_ctx(ctx);
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  93  	kfree(sysfs_targets->targets_arr);
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  94  	kfree(sysfs_targets);
2d6a1c835685de mm/damon/tests/sysfs-kunit.h Jinjie Ruan   2024-10-10  95  	kfree(sysfs_target->regions);
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  96  	kfree(sysfs_target);
b8ee5575f763c2 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  97  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

