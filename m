Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63301F5852
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Nov 2024 08:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731571261; cv=none; b=cd4x+y2Bv0BuLgMYDuEWzhuflWpdPe5QVs/nxJZnlLvj3V3IdaaYVt90eH+Eko9AfXn/0BOEuFCwQ46B8IyFH+dIMW1ejGZvbS+xB7ug0WGJcX+HDkRMlBHmBzsz916DOOBK9odGil2w4zdoQDs9nV30ARuruVEOyJKij7Eoo4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731571261; c=relaxed/simple;
	bh=wOCWjPgHPHxlrLgnxw+VusgzvGF9XhbpJDgq//4tRjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=goM5L1wgKZZzikI0ZMAyxdNzU9krhOPzRY/xrf5KMBWntV7ADjFsVuU3jMkQ/ZgWp0Nueo3IyuKa3DQNYnrcigwWIiDKUUCeW1+XIzSDUof3C1FNE3vKY2axGZZS5AvVJC9kAbhZU/d8bsMeDpsxYtgbq8WUdsCBp62Aa00l08o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F1p9t4Zu; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F1p9t4Zu"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d55f0cf85so253489f8f.3
        for <oe-kbuild@lists.linux.dev>; Thu, 14 Nov 2024 00:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731571258; x=1732176058; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pmP4R+KTmabCCg4llADCF0oCU+tvvoVH1i02bViR8w0=;
        b=F1p9t4ZuXzkIzt+tBNgQVLt8Q1PPRGkdCly2obgqO+NugyxLg1mnGkavGtAl1U2tKe
         D3MRE0hHMLvJcJx6Z0hSqCIYWK0G05JbuzfanthRJDbbDQCylj5E+90A4ogyCA2L5up1
         ImMfmtNpTlOfO4M72Bu1cMhL5B2oDJ3CF6pPHVsZ1XuEk/cHqjwpMGThOVMNIGmcy0Hx
         q+7nuvYGBhjeJshwGOezXc96LeRY2SFNqxH6Jaiv6LrNcc3vEyOsPz/FxaylM88wTDkR
         mqPujuelnQ5qS78FxSbWJQ3+FCgo9ERqWhZrt5h9BR4RzyOT2dss4uGBfJFdWXDNxRWe
         OoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731571258; x=1732176058;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmP4R+KTmabCCg4llADCF0oCU+tvvoVH1i02bViR8w0=;
        b=grRECrxfERjX4NF7zhyuQchy8MTnoFZky2tbM72WD01M6OaBhmOM1aR1ZLSjU+7NL3
         X5X6CZlun3m0lIofgVj23aG9rnusVD8ojj/42IJCNXuBL22XHPyz6v6z3NvPBhEjXTik
         BCj1KS0sqN1zI1xCb9iaMAIz5BBir/SvRHDaJ8Dl14touTzTZYY8jHV4tDeQzwYTFc8e
         gCNGJ7wADYEB7iZN2ozk2b3My2sfd/dTIBz0bmzRjmwXfqzf8TXpUdR7y5poIwyjts86
         4yOsUkkiKjPwYAm+ELvLQHJ2i4t+1K7wY/upCkUb5QeQy0PibpotjktMn+1iI5ivVeVG
         brpA==
X-Gm-Message-State: AOJu0Yz9Us7qp5DFqWzFn182ztcM6hBsj8BiW0WWUzyw3KZxBmzNq0V2
	F8D/UTKk3Nm66R0Wllr1BUa0Y7CqGsWsrosIwPGuBcRi5v/Uh259PJSclHjGVwagmww6FCf6o0h
	P
X-Google-Smtp-Source: AGHT+IG31WYQ/X+72unRx69C1P/9iMZOs5trq1EXzJAGNdrj+lIds7pAsY6/bw5o7AELpMO6q2+fpA==
X-Received: by 2002:a5d:47ac:0:b0:37d:5282:1339 with SMTP id ffacd0b85a97d-3820df6136cmr4676316f8f.22.1731571257780;
        Thu, 14 Nov 2024 00:00:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821adae022sm748412f8f.44.2024.11.14.00.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 00:00:57 -0800 (PST)
Date: Thu, 14 Nov 2024 11:00:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-acpi@vger.kernel.org, devel@acpica.org,
	linux-pm@vger.kernel.org
Subject: [rafael-pm:bleeding-edge 447/448] drivers/thermal/testing/zone.c:333
 tt_zone_add_trip() error: uninitialized symbol 'tt_zone'.
Message-ID: <d8da45d7-0a98-41c9-a9a8-49043caaa7af@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   d1bf954af846f66ac2ea07b2457b4a089a009c08
commit: 498ea32432db6f2a0bce88fd521e529a58a370c4 [447/448] thermal: testing: Use DEFINE_FREE() and __free() to simplify code
config: x86_64-randconfig-161-20241113 (https://download.01.org/0day-ci/archive/20241114/202411140825.w4TfKdbS-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411140825.w4TfKdbS-lkp@intel.com/

New smatch warnings:
drivers/thermal/testing/zone.c:333 tt_zone_add_trip() error: uninitialized symbol 'tt_zone'.
drivers/thermal/testing/zone.c:333 tt_zone_add_trip() error: uninitialized symbol 'tt_zone'.

Old smatch warnings:
drivers/thermal/testing/zone.c:188 tt_add_tz() error: uninitialized symbol 'tt_work'.
drivers/thermal/testing/zone.c:240 tt_del_tz() error: uninitialized symbol 'tt_work'.
drivers/thermal/testing/zone.c:335 tt_zone_add_trip() error: uninitialized symbol 'tt_trip'.
drivers/thermal/testing/zone.c:390 tt_zone_register_tz() error: uninitialized symbol 'trips'.

vim +/tt_zone +333 drivers/thermal/testing/zone.c

f6a034f2df426e Rafael J. Wysocki 2024-08-22  331  int tt_zone_add_trip(const char *arg)
f6a034f2df426e Rafael J. Wysocki 2024-08-22  332  {
498ea32432db6f Rafael J. Wysocki 2024-11-10 @333  	struct tt_thermal_zone *tt_zone __free(put_tt_zone);

These __free() pointers need to be initialized to NULL otherwise it leads to an
uninitialized variable when we return before they're assigned.

f6a034f2df426e Rafael J. Wysocki 2024-08-22  334  	struct tt_work *tt_work __free(kfree);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  335  	struct tt_trip *tt_trip __free(kfree);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  336  	int id;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  337  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  338  	tt_work = kzalloc(sizeof(*tt_work), GFP_KERNEL);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  339  	if (!tt_work)
f6a034f2df426e Rafael J. Wysocki 2024-08-22  340  		return -ENOMEM;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  341  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  342  	tt_trip = kzalloc(sizeof(*tt_trip), GFP_KERNEL);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  343  	if (!tt_trip)
f6a034f2df426e Rafael J. Wysocki 2024-08-22  344  		return -ENOMEM;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  345  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  346  	tt_zone = tt_get_tt_zone(arg);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  347  	if (IS_ERR(tt_zone))
f6a034f2df426e Rafael J. Wysocki 2024-08-22  348  		return PTR_ERR(tt_zone);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  349  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  350  	id = ida_alloc(&tt_zone->ida, GFP_KERNEL);
498ea32432db6f Rafael J. Wysocki 2024-11-10  351  	if (id < 0)
f6a034f2df426e Rafael J. Wysocki 2024-08-22  352  		return id;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  353  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  354  	tt_trip->trip.type = THERMAL_TRIP_ACTIVE;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  355  	tt_trip->trip.temperature = THERMAL_TEMP_INVALID;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  356  	tt_trip->trip.flags = THERMAL_TRIP_FLAG_RW;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  357  	tt_trip->id = id;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  358  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  359  	guard(tt_zone)(tt_zone);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  360  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  361  	list_add_tail(&tt_trip->list_node, &tt_zone->trips);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  362  	tt_zone->num_trips++;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  363  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  364  	INIT_WORK(&tt_work->work, tt_zone_add_trip_work_fn);
498ea32432db6f Rafael J. Wysocki 2024-11-10  365  	tt_work->tt_zone = no_free_ptr(tt_zone);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  366  	tt_work->tt_trip = no_free_ptr(tt_trip);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  367  	schedule_work(&(no_free_ptr(tt_work)->work));
f6a034f2df426e Rafael J. Wysocki 2024-08-22  368  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  369  	return 0;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  370  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

