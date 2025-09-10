Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEAD285CA7
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Sep 2025 11:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757504871; cv=none; b=LvaiV7dwxqEV2QZnkGL1hT4jT9XH9KIwYS9iabPuhDj/KWGrzynyZQMKCNElt1y+3ZRLOCd1O52OZ9lwLTdoT8RB//OMat2fQMZgHznmx8Iav58T6kyj7e3AlItlJcpTRAL+R8Y+Rz53XMLyFy+T5UxmWst6nTDXpBU6Hdq8v9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757504871; c=relaxed/simple;
	bh=WbEtV0CPIKyH7FQXM3VCsQudJJTxDRA8dDx1E0cAO8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=A4wO86h/wkBiLDkKpALLNaWqAj8GHL9LzMY0B44PJUMwE6ENrCK4EyFglMAKvrH+7KQwndixF58eT5T5S+J5eiTEq1Oj5UaoDuPQ/OSe2KSkJoVgLL8R1ngPw3pV5/nabR7RuBDiuq9b8O8XqcOD1t6YHUU7t5NS46CnQi2VuLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lYfVPm7A; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lYfVPm7A"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3e537dc30c7so5108846f8f.3
        for <oe-kbuild@lists.linux.dev>; Wed, 10 Sep 2025 04:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757504867; x=1758109667; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wg2Ph+PhoATIteAbw+PWkWD/06VwBl1ynTVTQY5RYgk=;
        b=lYfVPm7Ami7Zd4dpSP1bMYj7j4/HC0u2FLwXZEUf2kmxU7OFFoQs3eO55A7FkGPv+A
         vOdpkmjEeS7O6shVAPcfL0hgK5OlBr065kAevUbPQSXtqebkElLpHJtRDoH/gZ0Is0EB
         9Ff8+Wfc9kgyp5+se4MaPe+Id3rmbPDbD37CNcBXAoz9D328jZjf5k4UrA+xQfEL+JOn
         ma2FHav6DVBykkIxylgRMw2WII1Ms9QZdRG7oU8Lk7weklJh5O8HWX1+iIPFeujHShO+
         yJ3XOMmoAiMO4FY9MdgPlsXd6rR0ZyTY1/RWMLaQro7cKrUObSUBwhqqBf8Gj7Eod3x4
         RULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757504867; x=1758109667;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wg2Ph+PhoATIteAbw+PWkWD/06VwBl1ynTVTQY5RYgk=;
        b=xLsOYY8cY0+HGhH4zZ2l6/dfzWwTvbfcco88Ezxepe1Zg0BSFb+0KGW4zt7lVY2lXd
         LEwu4qcMlwJiqILYWP5aInY7+Ax1nxMA0jclZa69YV/0esMgpPVgZqo/UmVtl/EGoPnX
         52W0he64PUANliyM7NyxXgyMZ9w2JjoWrpVkVOAjM4mw4gbsCfGGan8AztloQyRRSCo3
         N+L1eGksK75FWl4yioE1eOP0iAZ/V1uNsO4N3Cw/cfSMZtIZWsCyymoU4klv9myNr/ac
         Wl4me2P1WkMu/DkdT9pUj1+maMuqyu8AeBTH9qePYtSlrklayA8+XQls3bzPU5G4s/u4
         HTuQ==
X-Gm-Message-State: AOJu0Yx83aM8IO15umFLNvAHb23M5gFTSpP4GGXfsvf2+qlvB14YbsLx
	7LfE5K3q0d8jRxxcjGVh/SUR68pG8WsjIWsdVbvMAnyBLlO9m2dXSX3m+8oQXgnbp5lylxBIvOO
	/ApzL
X-Gm-Gg: ASbGncvBPxfM5FnGp5KxPG/StQnNf7a9D4Jq7CFiHAlc5tqfhLp6C+c4UJVNXVlLP1F
	32urqHVZI55J23SF2DRV8hpojKAq6BrlpMoBt1KISKzM9aGSFf08xkuGe+1UCmcV5bppy/QRau9
	e19hlAZl21SBc6XcBSvzeclXgBdz0KWG4FQun4P7Rd5Lu1bpB6yalA0GoZZLXfPstqvLL4ts/Ge
	/KKNoSAD7ERYbgXUyOPZnLV1DPHKnhW62MMFKoVe1wpqZym9VuwPnhJBwR/Xc+EfoNqx2BBnRkB
	SZwP76Bd6DsKFxned0Rc5LpmdvEsWkqcEwaBDNHrBTMuOWyxKVSDoi0tnoeUnBuZSIGjyadPpGZ
	cqry07/HZmVMwO2bHgKM4UZgUlRk=
X-Google-Smtp-Source: AGHT+IHpMaxaSaJ4cnLK/bK8wa1YrfXhxVJLuuDTkuh1vmaIEZ84Pcyd9YYbH8IfZoLQCxj9xtJuUA==
X-Received: by 2002:adf:b350:0:b0:3e7:41ac:45f8 with SMTP id ffacd0b85a97d-3e741ac4939mr7821201f8f.55.1757504867368;
        Wed, 10 Sep 2025 04:47:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e7521bfe00sm6893713f8f.5.2025.09.10.04.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 04:47:46 -0700 (PDT)
Date: Wed, 10 Sep 2025 14:47:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, GuangFei Luo <luogf2025@163.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	luogf2025@163.com
Subject: Re: [PATCH] ACPI: battery: prevent sysfs_add_battery re-entry on
 rapid events
Message-ID: <202509101620.yI0HZ5gT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907035154.223983-1-luogf2025@163.com>
Message-ID: <20250910114743.xde2H12_tgLl-62Syp9DlO9_7Ys9kF4NiHPh5nlONTo@z>

Hi GuangFei,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/GuangFei-Luo/ACPI-battery-prevent-sysfs_add_battery-re-entry-on-rapid-events/20250907-115505
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250907035154.223983-1-luogf2025%40163.com
patch subject: [PATCH] ACPI: battery: prevent sysfs_add_battery re-entry on rapid events
config: x86_64-randconfig-161-20250909 (https://download.01.org/0day-ci/archive/20250910/202509101620.yI0HZ5gT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509101620.yI0HZ5gT-lkp@intel.com/

smatch warnings:
drivers/acpi/battery.c:1046 acpi_battery_update() warn: inconsistent returns '&battery->sysfs_lock'.

vim +1046 drivers/acpi/battery.c

9e50bc14a7f58b5 Lan Tianyu              2014-05-04  1001  static int acpi_battery_update(struct acpi_battery *battery, bool resume)
508df92d1f8d192 Andrey Borzenkov        2007-10-28  1002  {
82f2d30570b7ecd Lucas Rangit Magasweran 2018-07-14  1003  	int result = acpi_battery_get_status(battery);
82f2d30570b7ecd Lucas Rangit Magasweran 2018-07-14  1004  
508df92d1f8d192 Andrey Borzenkov        2007-10-28  1005  	if (result)
508df92d1f8d192 Andrey Borzenkov        2007-10-28  1006  		return result;
82f2d30570b7ecd Lucas Rangit Magasweran 2018-07-14  1007  
508df92d1f8d192 Andrey Borzenkov        2007-10-28  1008  	if (!acpi_battery_present(battery)) {
508df92d1f8d192 Andrey Borzenkov        2007-10-28  1009  		sysfs_remove_battery(battery);
97749cd9adbb298 Alexey Starikovskiy     2008-01-01  1010  		battery->update_time = 0;
508df92d1f8d192 Andrey Borzenkov        2007-10-28  1011  		return 0;
508df92d1f8d192 Andrey Borzenkov        2007-10-28  1012  	}
9e50bc14a7f58b5 Lan Tianyu              2014-05-04  1013  
9e50bc14a7f58b5 Lan Tianyu              2014-05-04  1014  	if (resume)
9e50bc14a7f58b5 Lan Tianyu              2014-05-04  1015  		return 0;
9e50bc14a7f58b5 Lan Tianyu              2014-05-04  1016  
82f2d30570b7ecd Lucas Rangit Magasweran 2018-07-14  1017  	if (!battery->update_time) {
97749cd9adbb298 Alexey Starikovskiy     2008-01-01  1018  		result = acpi_battery_get_info(battery);
97749cd9adbb298 Alexey Starikovskiy     2008-01-01  1019  		if (result)
97749cd9adbb298 Alexey Starikovskiy     2008-01-01  1020  			return result;
97749cd9adbb298 Alexey Starikovskiy     2008-01-01  1021  		acpi_battery_init_alarm(battery);
97749cd9adbb298 Alexey Starikovskiy     2008-01-01  1022  	}
12c78ca2ab5e64b Carlos Garnacho         2016-08-10  1023  
12c78ca2ab5e64b Carlos Garnacho         2016-08-10  1024  	result = acpi_battery_get_state(battery);
12c78ca2ab5e64b Carlos Garnacho         2016-08-10  1025  	if (result)
12c78ca2ab5e64b Carlos Garnacho         2016-08-10  1026  		return result;
12c78ca2ab5e64b Carlos Garnacho         2016-08-10  1027  	acpi_battery_quirks(battery);
12c78ca2ab5e64b Carlos Garnacho         2016-08-10  1028  
ce5e61beaad5c5a GuangFei Luo            2025-09-07  1029  	mutex_lock(&battery->sysfs_lock);
297d716f6260cc9 Krzysztof Kozlowski     2015-03-12  1030  	if (!battery->bat) {
eb03cb02b74df6d Stefan Hajnoczi         2011-07-12  1031  		result = sysfs_add_battery(battery);
eb03cb02b74df6d Stefan Hajnoczi         2011-07-12  1032  		if (result)
eb03cb02b74df6d Stefan Hajnoczi         2011-07-12  1033  			return result;

mutex_unlock(&battery->sysfs_lock) before returning.

eb03cb02b74df6d Stefan Hajnoczi         2011-07-12  1034  	}
ce5e61beaad5c5a GuangFei Luo            2025-09-07  1035  	mutex_unlock(&battery->sysfs_lock);
e0d1f09e311fafa Zhang Rui               2014-05-28  1036  
e0d1f09e311fafa Zhang Rui               2014-05-28  1037  	/*
e0d1f09e311fafa Zhang Rui               2014-05-28  1038  	 * Wakeup the system if battery is critical low
e0d1f09e311fafa Zhang Rui               2014-05-28  1039  	 * or lower than the alarm level
e0d1f09e311fafa Zhang Rui               2014-05-28  1040  	 */
e0d1f09e311fafa Zhang Rui               2014-05-28  1041  	if ((battery->state & ACPI_BATTERY_STATE_CRITICAL) ||
e0d1f09e311fafa Zhang Rui               2014-05-28  1042  	    (test_bit(ACPI_BATTERY_ALARM_PRESENT, &battery->flags) &&
e0d1f09e311fafa Zhang Rui               2014-05-28  1043  	     (battery->capacity_now <= battery->alarm)))
33e4f80ee69b516 Rafael J. Wysocki       2017-06-12  1044  		acpi_pm_wakeup_event(&battery->device->dev);
e0d1f09e311fafa Zhang Rui               2014-05-28  1045  
557d58687dcdee6 Zhang Rui               2010-10-22 @1046  	return result;
4bd35cdb1e2d1a1 Vladimir Lebedev        2007-02-10  1047  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

