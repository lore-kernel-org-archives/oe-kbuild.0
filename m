Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30B2273D92
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 05:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758605588; cv=none; b=sDYLHnAJaQZ3q5xSV8PnPDrCduqDSQ0GJNG3rmAFRd+8SwpSx0LJdHGQlzq9yEXEVar/mZ0EFf2Z0dFK/HjTfAaaMrGH1LH+T6uP+6voPmzDgAkdsIJbZNdrfrWTIikKeK3c3vzmWJYFktDX5TnF6L5wnDxj2TbEfoRyJqvUlnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758605588; c=relaxed/simple;
	bh=vGEJ5XUGRSnMA66oCXUJKdhQ/pGg3iEiuzNderuyTc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RH/gsxMkGVu3Srn7xy8jsXu2qnNkTo77PTM89D7ibeMzjAqsE4lK5b+YRTDSTHmYsVO5TPKZFAIjKdZt3BmgcTtdURWuHR59SzMGIbpcm6Ly9z5ON0lyPEITUyp5fY08q/AS8kF3XLp5jbnaHukmD6AE/EzaGWJAcC2xehex+Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sd5t92hQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sd5t92hQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e21249891so344385e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 22 Sep 2025 22:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758605584; x=1759210384; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJ4tZjiMhTGCrrpVFFyiu5yOXDKwDlnztNOTptC341I=;
        b=Sd5t92hQaRLmDEUW1NJTThO40r6kUoaL53vMzUAUfBmirKHoMrqcVUXC1i63ST+xFe
         bfVDmyrEV/b70EWgsr8nfeUZ9YwxIZKxXoo8pZvguH29DF215+sCP14SF5jkKYZQdnVp
         NQjV+63EAMR+VA54Tq44Krn/nHaAtVSPCiyXymZV40HODYx6dY/jHzsVjKqQWkgDaGlP
         59vsr+wO9WBoBnK3mfjC4j3ZC5XPDb3QECC8DK/iVqhlxzAtVZx69BBifbrYaWaqnS/Q
         9WmALQJpGh6Y48JAsiJy3dN50oXr4UvHac+wgeAYUqu3nRcj8vvboViSU/zvR6DQjikQ
         4YlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758605584; x=1759210384;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FJ4tZjiMhTGCrrpVFFyiu5yOXDKwDlnztNOTptC341I=;
        b=vQIn+jkeFWSsH35kVhLZY+otth4Cdd1JXhu8u7JnHM1bJRSqYsOXdfEDKoT9qkh1wn
         pQ6CRzLMKcOZFsEjQ4TpPyqDqa86Lv8bnPq8r6wRjBQTAyqFbN54GAD3L6BNONTYvkwj
         kQa6/6A1gozbNT0tTyIiLB7PNDsJi3vvi81FPTuZQlVnFJtXyyBpsf4+xgNxj0Rsks4K
         zeoGpXqVK08sNEyL0S3ZUuGcbf+hn7zWtJBCp7UVPzJHebvMpDTrmTLJqP7XfRiTcXPw
         olZCf+7MvvRH8U9m3omAA3VwP914Khm5Y25W+i9tNgFe1GTQt0H5ft4/i/xgvdwmWDr2
         mC5A==
X-Gm-Message-State: AOJu0YxWpAxqQf2Xone7wIlE3EWRAa0do774nc4ZKSipKsE+Idat25el
	1zbxMLs67EZ/B7KlRasMn3nhCFPdDGjWo6oWnKMaf68UgpoBWuK2HJysfjibcjS33f7bkee/kdl
	a5+CH
X-Gm-Gg: ASbGncvpTnfY8RUS054mki5FkN7NsJFV4XI0/PQnAW+23bMcUuLGWk00KqzZcL34a7J
	IdZ3lyaw7SvJX0EVr+WkUgzpaCtpmiymMPdsDcFn23w0/j1b9mbd6ifMTNEyzv22LdSbg/et59P
	9S5wQV3NC7PLHcCQbOpLHXzwUx68vEof06HKpwsOYY48qDI9HXhwzdfEWnGVutHcj3MNPlcF8rL
	MpgB3HtwXDQuZ+y04/omZg1FL9wfMJ+Zjk6acRsIz9SOGhuRdcbnuLKTWOYyuMGlF/REu27bR3d
	/sFCqDVCfbSyYXAy7xURo8LfGHeoCsR+rEWYazgqdZb/QTIKgAEkzdeUCmzWzR/N3Z4eQl9Zf4A
	91k1vXM2Kk67lpoHB/oUBy5DUBFzC
X-Google-Smtp-Source: AGHT+IGaW/wTjlF3vX/5ngxVawIqkqRfb+lQmNOxNFOw9CCk7KAF4WbfcNbfXVLS3PoI4R9q3MCZWQ==
X-Received: by 2002:a05:600c:1c05:b0:45d:d505:a1c3 with SMTP id 5b1f17b1804b1-46e1dae0d4bmr9065765e9.37.1758605583740;
        Mon, 22 Sep 2025 22:33:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-461391232e7sm264631205e9.6.2025.09.22.22.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 22:33:03 -0700 (PDT)
Date: Tue, 23 Sep 2025 08:32:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>
Subject: [arm64:for-next/perf 5/28] drivers/perf/dwc_pcie_pmu.c:418
 dwc_pcie_pmu_validate_group() error: uninitialized symbol 'time_event'.
Message-ID: <202509231223.gZsX6Eio-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250923053259.7tbqHHCDsVpP-YJio2GEL9xOwXI8S_TWbkXjYGnusuU@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/perf
head:   6d2f913fda5683fbd4c3580262e10386c1263dfb
commit: 71396cfac97d0249fa7d8dcc8e649b6ba4c090e4 [5/28] perf/dwc_pcie: Support counting multiple lane events in parallel
config: sparc64-randconfig-r072-20250922 (https://download.01.org/0day-ci/archive/20250923/202509231223.gZsX6Eio-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509231223.gZsX6Eio-lkp@intel.com/

smatch warnings:
drivers/perf/dwc_pcie_pmu.c:418 dwc_pcie_pmu_validate_group() error: uninitialized symbol 'time_event'.

vim +/time_event +418 drivers/perf/dwc_pcie_pmu.c

71396cfac97d02 Ilkka Koskinen 2025-08-28  401  static int dwc_pcie_pmu_validate_group(struct perf_event *event)
71396cfac97d02 Ilkka Koskinen 2025-08-28  402  {
71396cfac97d02 Ilkka Koskinen 2025-08-28  403  	struct perf_event *sibling, *leader = event->group_leader;
71396cfac97d02 Ilkka Koskinen 2025-08-28  404  	DECLARE_BITMAP(val_lane_events, 2 * DWC_PCIE_LANE_MAX_EVENTS_PER_GROUP);
71396cfac97d02 Ilkka Koskinen 2025-08-28  405  	bool time_event;
71396cfac97d02 Ilkka Koskinen 2025-08-28  406  	int type;
71396cfac97d02 Ilkka Koskinen 2025-08-28  407  
71396cfac97d02 Ilkka Koskinen 2025-08-28  408  	type = DWC_PCIE_EVENT_TYPE(leader);
71396cfac97d02 Ilkka Koskinen 2025-08-28  409  	if (type == DWC_PCIE_TIME_BASE_EVENT)
71396cfac97d02 Ilkka Koskinen 2025-08-28  410  		time_event = true;
71396cfac97d02 Ilkka Koskinen 2025-08-28  411  	else
71396cfac97d02 Ilkka Koskinen 2025-08-28  412  		if (dwc_pcie_pmu_validate_add_lane_event(leader, val_lane_events))
71396cfac97d02 Ilkka Koskinen 2025-08-28  413  			return -ENOSPC;
71396cfac97d02 Ilkka Koskinen 2025-08-28  414  
71396cfac97d02 Ilkka Koskinen 2025-08-28  415  	for_each_sibling_event(sibling, leader) {
71396cfac97d02 Ilkka Koskinen 2025-08-28  416  		type = DWC_PCIE_EVENT_TYPE(sibling);
71396cfac97d02 Ilkka Koskinen 2025-08-28  417  		if (type == DWC_PCIE_TIME_BASE_EVENT) {
71396cfac97d02 Ilkka Koskinen 2025-08-28 @418  			if (time_event)

time_event is never set to false.  I really encourage developers to
use CONFIG_INIT_STACK_ALL_PATTERN=y for testing.  (Use
CONFIG_INIT_STACK_ALL_ZERO for production obviously).

71396cfac97d02 Ilkka Koskinen 2025-08-28  419  				return -ENOSPC;
71396cfac97d02 Ilkka Koskinen 2025-08-28  420  
71396cfac97d02 Ilkka Koskinen 2025-08-28  421  			time_event = true;
71396cfac97d02 Ilkka Koskinen 2025-08-28  422  			continue;
71396cfac97d02 Ilkka Koskinen 2025-08-28  423  		}
71396cfac97d02 Ilkka Koskinen 2025-08-28  424  
71396cfac97d02 Ilkka Koskinen 2025-08-28  425  		if (dwc_pcie_pmu_validate_add_lane_event(sibling, val_lane_events))
71396cfac97d02 Ilkka Koskinen 2025-08-28  426  			return -ENOSPC;
71396cfac97d02 Ilkka Koskinen 2025-08-28  427  	}
71396cfac97d02 Ilkka Koskinen 2025-08-28  428  
71396cfac97d02 Ilkka Koskinen 2025-08-28  429  	return 0;
71396cfac97d02 Ilkka Koskinen 2025-08-28  430  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

