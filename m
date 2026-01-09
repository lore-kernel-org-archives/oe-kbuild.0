Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E6B33BBB2
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 11:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956536; cv=none; b=R4a9P7qEJIkq4LL4H0k4y+dlrZxGImxvgyvZ8Fi/GPTYu4mN0RXBzUEjchii7IPdT+KOnlXLXEzYIvpSxyYbfO3Odf3OUgZYwt71ELQqBx1g7I31AXt2prq3DHliKbLs0iJNjGEGCD0l50RcBYvKpa1jW9aRbBxsg2trTnIID/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956536; c=relaxed/simple;
	bh=unnzlzKdz7+4ys3fNzAnT3ActZDULosSet73g3yW8XU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JNABhxZ9u4JoSkT+x3Fdp3OeGnQdmck37W30DZNu/MTdvFEupeZPaMiCm181wH68UHeg2s165tBP66fwSsVm7XDbIflDwL+3eaaAL2lC1wBXMVeER01ouDuNfu43EA6fJmxFto+bphyamaQjwJrwKMyN9O5z7rrF6BrKClClxMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XE3LBmz8; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XE3LBmz8"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so1969359f8f.3
        for <oe-kbuild@lists.linux.dev>; Fri, 09 Jan 2026 03:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767956533; x=1768561333; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h7B8LHXmNZwI578mO2uE441BM//edoTtfT9Cj5GtXsI=;
        b=XE3LBmz8pu+yx+w39oE1r+jVTm0tDxQ0papQGJFBA5x9B6UacCdLvfhF6RtsaTuLKi
         eLzfcjEH7daNyyTc6ZK/cHA3BIJdGVDnwpNrtRUio+oxrUG1HaUSlzgck1q73vCZXdW6
         GP3LR1fNo8/4P2CxdBcvmyuTSMGUd2hWTatzuE+obm6qlW+tMB3WqtyvnvQh6Rczybi9
         +TWi3Zv4+LYd8WbJG75CCNDK8Ef/Fe5hP5XukPmIv2EfudndmeY3UAA4kFpLMoAsW3u8
         Pd33hX0z0Rmf06SSVR8Y18KznN16NP+oDk4ITVG6ZPaemrAClFBVwqKH98Nv8eH/m6qK
         I+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956533; x=1768561333;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h7B8LHXmNZwI578mO2uE441BM//edoTtfT9Cj5GtXsI=;
        b=Q+9+/YjUS27sElCbPm+3/WyKP4A7HzHx68rGWsSMWQTIYgOD9ctpd1+9QR7dEK8LdL
         BT4Q6ZQGnMgK0R0Iculwn4I0T/8kO4daVqC9WJLxlOChmbiAQyhHkLjPFpx3NqGRO56T
         GXnqKrqdnckpUlxSoTolvSROe4+UXSGEzPGTEv7aQA6iq75h44PhrwUlU24f4RAcw9Rv
         YjCJf5l3F+Un3vcUbrWBdSKn8eZ9oIXfSBH+JGinn6omYpAmNddWlYXzEGrdx0/Jjgam
         bcDzG8lClC51DT926ilqibFoIHNAhm9VgG42T8LUDM6xrtLirBzvbD5HCA9exa2Q46NK
         FIJg==
X-Gm-Message-State: AOJu0Yyg+V2sSrvJCIQt+lI4t5rwI5qwXLVKUH0kUgSVBIH/7mA5wcaF
	q4w+teI3rrU99/vXqL5BWpN+NDYUP+JdXNmZePOa+pgAMVJrpH84ifUpH1Kost5QuaQX/4Ay1ey
	NnWJd
X-Gm-Gg: AY/fxX6AN626IcMu4AV5j0EWAACLUD6v0DynbwtmWRNVPhzwX+4zNpSOu3R97o8JXNX
	Te0ztabSuQfcabx+qA8btE6f8h4RBSkFr+11kfPrpHjaHsbMWnFLx+xQSu8mlCnbRYdL0+xQ8Yp
	wdgzvm9LSoGKXWNs2BGMVmSOxMOfjDO3nFqZZuH2IQRF9PIYLZF6XvQShtfqkTDQnafGxTzV2sP
	GZXU0DJvHfRKLCmMCFaPbxJpAYHzCpffvrYrEP0tlvmfTf6Itcn/p4ZyOEpTe9TPQsGFjs3LzEB
	5QO6gxeOnXhyp6xiQ/W9DknwhYa4h9Q2DiYPNjOJD6GkJS+R1/ewCewGOkqNWHi82hacXq8x45S
	r9XEm3fqNOFpu5XaiynsTVpUkUXVZdGgD+S6hKhIGVNhatERNQz4VzIqrLrxvneZ6jM7GK5CEb4
	hDK35Plt/qT/McuMRY
X-Google-Smtp-Source: AGHT+IHtZQD3lyZahBuogsv0efT5rIOdiTCSiSRMPBKBytEpayQpnudygIFup55X2R9m1Syyq0idWw==
X-Received: by 2002:a05:6000:1862:b0:430:f58d:40da with SMTP id ffacd0b85a97d-432c3628038mr10599502f8f.10.1767956532938;
        Fri, 09 Jan 2026 03:02:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ede7esm21731924f8f.32.2026.01.09.03.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 03:02:12 -0800 (PST)
Date: Fri, 9 Jan 2026 14:02:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Brian Norris <briannorris@chromium.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: drivers/base/power/runtime-test.c:22 pm_runtime_depth_test() warn:
 pm_runtime_get_sync() also returns 1 on success
Message-ID: <202601091832.YueBSiOb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260109110209.MHe57b0Bk0m87LkvjcglXBgFQL3IL_F41y-Z-LpRlCk@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   623fb9912f6af600cda3b6bd166ac738c1115ef4
commit: 7f7acd193ba8aaa8ed07cfadc335bb17a991fd42 PM: runtime: Add basic kunit tests for API contracts
config: x86_64-randconfig-161-20260109 (https://download.01.org/0day-ci/archive/20260109/202601091832.YueBSiOb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601091832.YueBSiOb-lkp@intel.com/

New smatch warnings:
drivers/base/power/runtime-test.c:22 pm_runtime_depth_test() warn: pm_runtime_get_sync() also returns 1 on success
drivers/base/power/runtime-test.c:78 pm_runtime_idle_test() warn: pm_runtime_get_sync() also returns 1 on success
drivers/base/power/runtime-test.c:182 pm_runtime_error_test() warn: pm_runtime_get_sync() also returns 1 on success

Old smatch warnings:
drivers/base/power/runtime-test.c:185 pm_runtime_error_test() warn: pm_runtime_get_sync() also returns 1 on success

vim +22 drivers/base/power/runtime-test.c

7f7acd193ba8aa Brian Norris 2025-09-25   13  static void pm_runtime_depth_test(struct kunit *test)
7f7acd193ba8aa Brian Norris 2025-09-25   14  {
7f7acd193ba8aa Brian Norris 2025-09-25   15  	struct device *dev = kunit_device_register(test, DEVICE_NAME);
7f7acd193ba8aa Brian Norris 2025-09-25   16  
7f7acd193ba8aa Brian Norris 2025-09-25   17  	KUNIT_ASSERT_PTR_NE(test, NULL, dev);
7f7acd193ba8aa Brian Norris 2025-09-25   18  
7f7acd193ba8aa Brian Norris 2025-09-25   19  	pm_runtime_enable(dev);
7f7acd193ba8aa Brian Norris 2025-09-25   20  
7f7acd193ba8aa Brian Norris 2025-09-25   21  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aa Brian Norris 2025-09-25  @22  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_get_sync(dev));

Use pm_runtime_resume_and_get()?

7f7acd193ba8aa Brian Norris 2025-09-25   23  	KUNIT_EXPECT_TRUE(test, pm_runtime_active(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   24  	KUNIT_EXPECT_EQ(test, 1, pm_runtime_get_sync(dev)); /* "already active" */
7f7acd193ba8aa Brian Norris 2025-09-25   25  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   26  	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   27  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
7f7acd193ba8aa Brian Norris 2025-09-25   28  }

