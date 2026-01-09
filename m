Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A9A29B764
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 18:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767983978; cv=none; b=MDGulMzVgrK79dFnBVJ1fa/2GdQ2IqeXMn9qCkgYhvIjiEQ+YnsBGMXcLS+QCTvTolYpN0M/2B1EDBqob2aRR0dd3EFaiBxVNW+eSOi0n4ywx7vwwq5g2EN1XzZBhC5/LVBDu5Ew9H4mp0awH9LI9PIYuaim0gxVoCzYdBcVc54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767983978; c=relaxed/simple;
	bh=iii0d123ExKIJrlcwvMsxl1ja4HVBrDf1cJ4y3FJyAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5z+zm4cdtfOQXIM7epgHllkXG27JaN2HAfLHgdCd6yqfB64rZuPALXWEnSZHoyPFwgNawdgcDZFl3rkDkN5wqhEC+7Dj5262J12EDjY1ibxrdVaTe6XFkjV+/A6IsOCAxj9WS3BiXnhn7CPZPWCaUqu6zEBWC1tU7H4fxkpSCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=atHUGk6N; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="atHUGk6N"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-11f1fb91996so5611749c88.1
        for <oe-kbuild@lists.linux.dev>; Fri, 09 Jan 2026 10:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767983975; x=1768588775; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QGkAMkqR+V4OBARM5yVeFTyT/fTTXcnLUWDxaN4DzMQ=;
        b=atHUGk6N/tb1F+q1CmHhTFaqm/naoKia4M/yxBBAcZMH3s+vJLqEwRl+L1H3yBzSLQ
         2Pe12sj045bh+yKefuVzFYtl54YU7u7GkkekDK+d8L8cVt3S3+E1laV07hU2ymXSDDyl
         CyFmmO+Uq/01Rq7uXbxbNYYtd/L3hHKBhI73w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767983975; x=1768588775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QGkAMkqR+V4OBARM5yVeFTyT/fTTXcnLUWDxaN4DzMQ=;
        b=i+sxPNn/Iy2968OscJB8Oo5Gp1Fd+U8mke3hn4Buug3hMUhuwocGO5DFT4JzYrQc2z
         jvCirHaOFB3ND0p8gSae0dJq+tUSRG7qN4dvyWnkOgPlXcBEqGzDz61YvosBLuKVnlUZ
         miF5dzyPmXRpycWuJgKmmKmKkFw13KWZx+DoYd70dTdEIUl6frFZa+U8p48RzNVNom48
         +l9IGM5MhwFUiib+RfvX8fOyZBg908hvj8+Q+AbQewk54sxtX3hRNnr410k72J/iQDCL
         oI/DBm0oN/EKwud4JdLCulTYDSb36sk+r44+69OWkwNyGWF+DZXK0zz8RLF+9W9RUGiU
         WP3Q==
X-Gm-Message-State: AOJu0YyClZpVsnq6IP7fW2nByzI25HzrRUd7staQADkZRsFDKvyQz999
	2A49OOOK58TZYYhwucIyFYpdZP6Zu9b8qt0d+3K0cexK1o1eSv7MmETDN9WpgzkKVQ==
X-Gm-Gg: AY/fxX7taadtjnHBdD/AEtzes4wP1N2h1oEFBno0/mOmjNZ/3Iixe5ZJivC8Ld8YE9p
	hBgS9fLXmNcbzd61w6UCm9vhHJUtHwr57Qzy4HMyI9SU81kKvWfSmZMzICZeaa6ASzbu5uG6ANb
	99eIs96YSxzVLmMeu8z6i2p+5g8ohsfA8JUQtRyf5/fpCYUtG0JyY9hVs0ezMDvgm63DSS4qFGX
	2QM5V9sm1iqvSeIPYUTwGNrh68Y/pI1R0aXTFjKdIcqJAmy0JYoFiILgQO1K1zfGYBTJ9PrQhcY
	etmN6/Bpbs7QmKTPImBMPAzy4NE7TkJhQy51Vu5k9A/XePwcuc+LOJmtf0065qr2/0BnQbt0rUc
	QPAJMjp9Akrkqa9dJv+5hZkZy1qi39wt6u9hQTYYuV/Rif1xXmj9D6Fqu/URSHA6oFnI3Alo8Us
	fQ3eMZapQ327MXrGFUWY0QgNRL015HSGIpvOYxN79c8BYL+q6CoA==
X-Google-Smtp-Source: AGHT+IHonbgs6ZEi4A+cvUsv/vZJaz7TJOTduFOwUmD0NihA9pCUnmtwr83vFvcpz3aX6hWOmbkJ4w==
X-Received: by 2002:a05:7022:698a:b0:11b:9386:a3bf with SMTP id a92af1059eb24-121f8b64dc4mr10304781c88.42.1767983975254;
        Fri, 09 Jan 2026 10:39:35 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:b4c7:3d26:a6c4:9c0e])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-121f24984a3sm18424854c88.13.2026.01.09.10.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 10:39:34 -0800 (PST)
Date: Fri, 9 Jan 2026 10:39:32 -0800
From: Brian Norris <briannorris@chromium.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: drivers/base/power/runtime-test.c:22 pm_runtime_depth_test()
 warn: pm_runtime_get_sync() also returns 1 on success
Message-ID: <aWFLZJxddp0b3bkS@google.com>
References: <202601091832.YueBSiOb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601091832.YueBSiOb-lkp@intel.com>

On Fri, Jan 09, 2026 at 02:02:09PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   623fb9912f6af600cda3b6bd166ac738c1115ef4
> commit: 7f7acd193ba8aaa8ed07cfadc335bb17a991fd42 PM: runtime: Add basic kunit tests for API contracts
> config: x86_64-randconfig-161-20260109 (https://download.01.org/0day-ci/archive/20260109/202601091832.YueBSiOb-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> smatch version: v0.5.0-8985-g2614ff1a
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202601091832.YueBSiOb-lkp@intel.com/
> 
> New smatch warnings:
> drivers/base/power/runtime-test.c:22 pm_runtime_depth_test() warn: pm_runtime_get_sync() also returns 1 on success
> drivers/base/power/runtime-test.c:78 pm_runtime_idle_test() warn: pm_runtime_get_sync() also returns 1 on success
> drivers/base/power/runtime-test.c:182 pm_runtime_error_test() warn: pm_runtime_get_sync() also returns 1 on success
> 
> Old smatch warnings:
> drivers/base/power/runtime-test.c:185 pm_runtime_error_test() warn: pm_runtime_get_sync() also returns 1 on success

FWIW, these are all false positives. These are unit tests which are
purposely exercising the return codes of this notably-complex API under
controlled conditions.

Brian

> vim +22 drivers/base/power/runtime-test.c
> 
> 7f7acd193ba8aa Brian Norris 2025-09-25   13  static void pm_runtime_depth_test(struct kunit *test)
> 7f7acd193ba8aa Brian Norris 2025-09-25   14  {
> 7f7acd193ba8aa Brian Norris 2025-09-25   15  	struct device *dev = kunit_device_register(test, DEVICE_NAME);
> 7f7acd193ba8aa Brian Norris 2025-09-25   16  
> 7f7acd193ba8aa Brian Norris 2025-09-25   17  	KUNIT_ASSERT_PTR_NE(test, NULL, dev);
> 7f7acd193ba8aa Brian Norris 2025-09-25   18  
> 7f7acd193ba8aa Brian Norris 2025-09-25   19  	pm_runtime_enable(dev);
> 7f7acd193ba8aa Brian Norris 2025-09-25   20  
> 7f7acd193ba8aa Brian Norris 2025-09-25   21  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
> 7f7acd193ba8aa Brian Norris 2025-09-25  @22  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_get_sync(dev));
> 
> Use pm_runtime_resume_and_get()?
> 
> 7f7acd193ba8aa Brian Norris 2025-09-25   23  	KUNIT_EXPECT_TRUE(test, pm_runtime_active(dev));
> 7f7acd193ba8aa Brian Norris 2025-09-25   24  	KUNIT_EXPECT_EQ(test, 1, pm_runtime_get_sync(dev)); /* "already active" */
> 7f7acd193ba8aa Brian Norris 2025-09-25   25  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync(dev));
> 7f7acd193ba8aa Brian Norris 2025-09-25   26  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync(dev));
> 7f7acd193ba8aa Brian Norris 2025-09-25   27  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
> 7f7acd193ba8aa Brian Norris 2025-09-25   28  }
> 
