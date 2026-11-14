Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677244;
	b=bJp0S6VzDT9Nuqu1BBR5TK6UEorvwkU+dtHomqdSVFUGxbcAR4iyIg+/vjTsse7OfmYO
	 JmzyD5DSgbGwR+6rXokb/ocPErHVeqRxWXiuI+X9ISHdOqiARlqNhiFPKEua3YIVVgBTK
	 Bb71DWr0VsMzDmli9C1bIBCnj7rpEx8BH28Q44C92DmMQhWvUToRf97Ct+9NVpBHqzycb
	 RRKa/TrUdPQaMHOlh9ldQ80tuBW3FTNK8fAWNdysPEUavx977nf/zre2hbGnR1hIRsWQL
	 NohuVUDW7zZzEulun2vY6A6FDcFplUWGagsj2YLwAKQXlTE6xcnK+T2veguR1WQOXdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=LbwHycMnCUoAeSBJjI2Fsa4O86qIihNxHNgA079pRlo=;
	b=iupYbTQ9H/MxooeqQ11LnwTUTwvB5jnc1NFz47jZyJ3uKGr/mcU1jlbqfZ7Km7DJdwKW
	 1NsTIE4akN8rWp/eiXfZ6TyF7UKfvlCqp5Vtl7PLvF4N+Sv8luM24kIHHiOqKz2q18vq8
	 FlueyjU/SiNBCCvfpDtcc16VC/8W4ninyB3qeF42yBte3U0s4jmZiIM3pqjnWhkP0GbNv
	 2H/uzy8vjsRYcoGmP0hqbPlWN4Q1/vHzmyDmnpqMSb2U9iQL/zUCzifdjNubyJ/szZ2aY
	 ax3rsAo5Gd6ewr9+eSQ1HgeFJbB/urMrKRJN9VbloAqtOv/nPzWMKBajib5BAur7ajg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H8cEEnrs;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3C9606A329
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 17:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E3C9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H8cEEnrs
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso23976855e9.3
        for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 09:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677242; x=1795282042; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LbwHycMnCUoAeSBJjI2Fsa4O86qIihNxHNgA079pRlo=;
        b=H8cEEnrsw+rzvZIVCp++APeN0gDvu+0lC0NgGBCE4lknBX2B509MEwVEnM6JstnIrl
         UJBZl9Ew6VXj2PKE1RpuJdrLpJ7XIdrnF3SwkwwtK2yXf1c4QrMUs3hhpq9unpOJZPPk
         cUbMfUY7cw1shYxpG7bAVhKCfNpqgdhoIFu26TFDS1JbLVCkXeEk27fbZmpIOv5toaWD
         OUZkEZgpX2DJJFz+hMi4Xu/QgZADkp9G5VQWi/1a5PKG3Ri8vYvdv8doG5wjY/7HMY0m
         K+b5U29pNkfEpyOLmhUUX5veXWI4G92vbb+qop+V9rnFuGLmRfv2Jld1kqvFJ1FRHRFw
         pFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794677242; x=1795282042;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LbwHycMnCUoAeSBJjI2Fsa4O86qIihNxHNgA079pRlo=;
        b=lNwo+EB/C097n1vlqhPpuEQZMUl1XpEiTr7i8wE2yZJ5l0xV2RBfP++DxtJR7lAwpa
         Pf//msXc6L+1eBKoRIhTNTYvOkOuimvIUEkm3TonhZtC1JukROrhzlfHYr9oQHx/YaxY
         E3G7PskelN7sLqkKlSnyiCsekf0BJkbFmM8+2eaPASnk3GjjmiLp4KsFWiYywMmh4eao
         L90eDdgHWlll0cLWC00CeOWDjI9EHNKnqxXsnqTqLn64kZdVD9yjvFolcZfYu0MHQiVq
         xJPS1U/qysqQyKZv7ws+fnZPhq7Pt2jkojB32nUazULsuk3mWrWljHOhK277/LRUL4ei
         lavA==
X-Gm-Message-State: APuU4Z9NwdWEV9VefUy9iJ5XMKW+CDrNMnXzF9TOltRGhCAkjf2uzHWa
	cwJ6doibKD4twpcHsHzXsz9ecTQNS1OHoToaA0FwSc4MUZ6q/BGRNr+CFSNXE0K9IWxEH5a2
X-Gm-Gg: AYBFou17m5+NS8dLS1pCEwwyAPxE2sWfjJK2TYWpzAc+NwzMZpAxudfcPGxO4eFUtHC
	wBDMq/f4Weu9CR2Q8PmQI+GPWAuYwLO3Wr5F9TJthdhAUkNUQ8AjIH5ozAowu7CIMpgYFZl/SCO
	kZpmoqwTqqDu8q3Orv3HBUgVREFO7+psZP6ARs7JTeMW2QcnEOZFdn/1wh9UxWeGbRDfJ7D9pla
	K0LroV5Oq+SA4ehzFCCdWIfKnPq9lEBGkbKAcCCFGrwzIFyQX6jx6y1hzAJJNbRQBBGWsTqV9Pc
	DzAjgH+iYXLh32Mi0dJelwHBGKEq7aJhOE08TEcRneUGVyLF5wvaUuXLRG3OZw9kB05C6/7ZtFl
	+Pxi/U8jdZHzKePsF2Q7UZHlXQorXKNdXstxoAfFmkg0zs5GMZQvmhhN4jM9QFrIY3GtNGMt6Xg
	QoI23A6asozMkVl8KlKSvARiw2kjv3XCFRwSe86WVzuXQ2EVoQtlyYuxsWW6qdjLPSK+dNvuwOb
	2k3obF90sjUEBIWPl8xZNeJnWI76i39OzqLWNdKfDoh/md5Y13hulx7cD2A3n670wn9KELPN1PS
	AEQvj64C2YQezuITM4P85kAWkT9jWi9v3H9iyYPWwmqownNn1CU580WnjOYP2fIUMGkV2NpZYl2
	agq01df4/LQgQwYRPjTnh6E5PlBpkY8siXAha2szS5tQshKjetVyfsPKnpnzDqfIQB3If
X-Received: by 2002:a05:600c:4e45:b0:4bb:56bb:1196 with SMTP id 5b1f17b1804b1-4bb56bb49f3mr119986415e9.23.1794677242263;
        Sat, 14 Nov 2026 09:27:22 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm403283805e9.1.2026.11.14.09.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:27:21 -0800 (PST)
Date: Sat, 14 Nov 2026 20:27:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] mm/damon/tests/sysfs-kunit.h:80
 damon_sysfs_test_add_targets() error: dereferencing freed memory
 'sysfs_target' (line 79)
Message-ID: <202611141540.dikinyHI-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20261114172717.RW6NIBj_r9rD7uos-Mv6Cfk49LUcagZvWLeOBboweOo@z>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   793c58ba801e0ec6ed0c3b71d1a1f091a42d299c
commit: 8a2944f5a54f0b3cece27a265e319c499ca40cb2 [1/1] mm/damon/tests/sysfs-kunit: handle alloc failures on damon_sysfs_test_add_targets()
config: arm-randconfig-2200-20261113 (https://download.01.org/0day-ci/archive/20261114/202611141540.dikinyHI-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611141540.dikinyHI-lkp@intel.com/

smatch warnings:
mm/damon/tests/sysfs-kunit.h:80 damon_sysfs_test_add_targets() error: dereferencing freed memory 'sysfs_target' (line 79)

vim +/sysfs_target +80 mm/damon/tests/sysfs-kunit.h

2caef83db9f8e08 mm/damon/sysfs-test.h        SeongJae Park 2024-06-18  41  static void damon_sysfs_test_add_targets(struct kunit *test)
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  42  {
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  43  	struct damon_sysfs_targets *sysfs_targets;
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  44  	struct damon_sysfs_target *sysfs_target;
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  45  	struct damon_ctx *ctx;
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  46  
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  47  	sysfs_targets = damon_sysfs_targets_alloc();
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  48  	if (!sysfs_targets)
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  49  		kunit_skip(test, "sysfs_targets alloc fail");
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  50  	sysfs_targets->nr = 1;
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  51  	sysfs_targets->targets_arr = kmalloc_array(1,
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  52  			sizeof(*sysfs_targets->targets_arr), GFP_KERNEL);
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  53  	if (!sysfs_targets->targets_arr) {
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  54  		kfree(sysfs_targets);
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  55  		kunit_skip(test, "targets_arr alloc fail");
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  56  	}
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  57  
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  58  	sysfs_target = damon_sysfs_target_alloc();
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  59  	if (!sysfs_target) {
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  60  		kfree(sysfs_targets->targets_arr);
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  61  		kfree(sysfs_targets);
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  62  		kunit_skip(test, "sysfs_target alloc fail");
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  63  	}
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  64  	sysfs_target->pid = __damon_sysfs_test_get_any_pid(12, 100);
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  65  	sysfs_target->regions = damon_sysfs_regions_alloc();
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  66  	if (!sysfs_target->regions) {
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  67  		kfree(sysfs_targets->targets_arr);
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  68  		kfree(sysfs_targets);
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  69  		kfree(sysfs_target);
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  70  		kunit_skip(test, "sysfs_regions alloc fail");
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  71  	}
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  72  
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  73  	sysfs_targets->targets_arr[0] = sysfs_target;
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  74  
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  75  	ctx = damon_new_ctx();
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  76  	if (!ctx) {
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  77  		kfree(sysfs_targets->targets_arr);
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  78  		kfree(sysfs_targets);
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01 @79  		kfree(sysfs_target);

Freed

8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01 @80  		kfree(sysfs_target->regions);

UAF

8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  81  		kunit_skip(test, "ctx alloc fail");
8a2944f5a54f0b3 mm/damon/tests/sysfs-kunit.h SeongJae Park 2025-11-01  82  	}
b8ee5575f763c23 mm/damon/sysfs-test.h        SeongJae Park 2023-10-22  83  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

