Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747E5231A4D
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Apr 2025 08:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743583412; cv=none; b=TWmW4lSSk02+e2gEZiHKecHN/KCT4rY2dj3+QpOSGUwKpkUy3nssjcH4XQJsIiJ/609T+FLqrl7ii87/aJUZwbUcwpA/tziX4XVJdNs/EgM1Q375ROPZzVnX6BcCGXESq3m/ZIIZH4800MIInXeN2CZAnUKt0F2aae9irSuP1FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743583412; c=relaxed/simple;
	bh=Kveb9atVJLnju8DdyOzVv8KDNpYBCjT9yUm3lhdIbSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=khsPhjIVIoOasEqUY5ujNe6fdAaPYIrjRlfm1DjmE0JPKRykX8Ys9C49PVHq6MZ5GdzwC8CdPmNuHj7uiWMWqE7EwAC6nWjKZSCfNr8D07dLXkK6RSC0JADvaanWg3h+2dJS4ngHJ2wITdFotB0XU9t0KzOXLgtFo+4OcJ2aUhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=py4vCzSO; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="py4vCzSO"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3996af42857so397469f8f.0
        for <oe-kbuild@lists.linux.dev>; Wed, 02 Apr 2025 01:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743583408; x=1744188208; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MywdYD3IK46xGltB4W9LLSjkk8V2I4wOGeWZw0m6r78=;
        b=py4vCzSOHF2U5+ZuZp78lqsXJkc5ycgqx0iBF5sruccT5h0sQ4R0Lq1Pl/jpNsGNti
         uJ31Sp1svH539VcjoXMhdjlBu4ftKG9JPymj22PQan+GC+KwAJiziovmLl0sUTnd4tEX
         wIPY0Fvo5tKBq2PVUdDJYVQA5GqZH7GqAZsPB+WO6abshZJ8BBcVOBzAj8Mh0Gh59QBb
         26oaZg4z2swxp96NRs/ys0oiA5b5LiU0Lh7AGq1ex3/fsSLqznfWeJcDN9dRNlyGXm/0
         CoEMdru1qXpdpar4nORYf4JMXWnD6NhsvKA198EEW50DqdSuzQK3v6q4d0uiP7mxBwHL
         /XLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743583408; x=1744188208;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MywdYD3IK46xGltB4W9LLSjkk8V2I4wOGeWZw0m6r78=;
        b=MaoUbcxmdonOljIK2p7gqfTXSzqvqOR50HpsOtmzMPGGMofoU//8RAur57KlYXxjK/
         OU4gO5StHS1QdW7Q5UWrF2o8N3ZA+c3FdW1/kJOY6ps0uP01Qn3klaK6X3MPz/XMoVf+
         ucHGYPthE8fEOMf+sLMG7slAm9cPuaOI08VgzcaYwXA1RuOzqgOmRUdl0lxFF1E26EQg
         V2BQAyzPZfb+bR1hRKnXEFV4ytySqWO/va6+fKu45VMOAdLRraGr08aGwb/WXGW8edpL
         hJXQdO8Va6g9nnPmXWUrbY5UDc7Fh+Xe0SmnIJVGpACnXzSWku/GakubdpLWwRm1nIhy
         yPLg==
X-Gm-Message-State: AOJu0Ywl4hbw3fj2n9v03h/71S5YG1bc/gAqnRY2GC4bArUwis22ECCb
	6r8B6VJj+albxsh8qRQGvXZCKha0TMdEI1Iu3z2IvkUjEpauJYF7f11MIy0qYrT0t3mYq71V5RL
	f
X-Gm-Gg: ASbGncv0q+fc6gPK2FrlXJjmcx1X3R1OLoU+S1rWPZfupTg2kbQ9MCPmt7cl7pM092e
	3a7ud1VGD4uggiTUdqsKEuYG2IWdeC4QSEvDrXiSrJZ/Ae7PrzcB2e17uRxWV5NpDlIER3rqIoM
	QEzDTd67DV9dhlM9pWObiR1ezh8ZaJHL7nbaWrYWZOeb+G3BSk62KlRcR+IBFRJn31/r4gFMY/X
	ReJiYK6mze2qZtzbqcqiCq8Ws3hkQvCOuqgAhA1NvfZLG2b5TNtyDH4V0M60ivYyiotO4ySjkzi
	ytQYIlJ/iPeqken1rEm12Var8v/AGzL2Lm8XKSY4Md3LYPjKNw==
X-Google-Smtp-Source: AGHT+IE5eJjzFzKgLbEhHe/LWXL3GWvq9N0z7X0b0Tq6//QeucYYtfOz5/gw451nA9yosCEuAa7qpQ==
X-Received: by 2002:a5d:584f:0:b0:38d:ba8e:7327 with SMTP id ffacd0b85a97d-39c2a668cb9mr1095356f8f.8.1743583408087;
        Wed, 02 Apr 2025 01:43:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b7a3d66sm16162069f8f.81.2025.04.02.01.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:43:27 -0700 (PDT)
Date: Wed, 2 Apr 2025 11:43:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Melissa Wen <mwen@igalia.com>
Subject: drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations() error:
 uninitialized symbol 'ret'.
Message-ID: <f5dd7fb6-6a99-407f-846f-0de2d0abe177@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1
commit: 04630796c437a9285643097825cbd3cd06603f47 drm/vc4: Use DRM Execution Contexts
date:   2 months ago
config: arm64-randconfig-r073-20250402 (https://download.01.org/0day-ci/archive/20250402/202504021500.3AM1hKKS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202504021500.3AM1hKKS-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations() error: uninitialized symbol 'ret'.

vim +/ret +604 drivers/gpu/drm/vc4/vc4_gem.c

cdec4d3613230f Eric Anholt 2017-04-12  589  static int
04630796c437a9 Maíra Canal 2024-12-20  590  vc4_lock_bo_reservations(struct vc4_exec_info *exec,
04630796c437a9 Maíra Canal 2024-12-20  591  			 struct drm_exec *exec_ctx)
cdec4d3613230f Eric Anholt 2017-04-12  592  {
04630796c437a9 Maíra Canal 2024-12-20  593  	int ret;
cdec4d3613230f Eric Anholt 2017-04-12  594  
cdec4d3613230f Eric Anholt 2017-04-12  595  	/* Reserve space for our shared (read-only) fence references,
cdec4d3613230f Eric Anholt 2017-04-12  596  	 * before we commit the CL to the hardware.
cdec4d3613230f Eric Anholt 2017-04-12  597  	 */
04630796c437a9 Maíra Canal 2024-12-20  598  	drm_exec_init(exec_ctx, DRM_EXEC_INTERRUPTIBLE_WAIT, exec->bo_count);
04630796c437a9 Maíra Canal 2024-12-20  599  	drm_exec_until_all_locked(exec_ctx) {
04630796c437a9 Maíra Canal 2024-12-20  600  		ret = drm_exec_prepare_array(exec_ctx, exec->bo,
04630796c437a9 Maíra Canal 2024-12-20  601  					     exec->bo_count, 1);

This is a false positive in Smatch.  I can silence the warning on my
end easily enough to say that we always enter the drm_exec_until_all_locked()
loop.  But the question is why do we only test the last "ret" instead of
testing all of them?

04630796c437a9 Maíra Canal 2024-12-20  602  	}
cdec4d3613230f Eric Anholt 2017-04-12  603  
cdec4d3613230f Eric Anholt 2017-04-12 @604  	if (ret) {
04630796c437a9 Maíra Canal 2024-12-20  605  		drm_exec_fini(exec_ctx);
cdec4d3613230f Eric Anholt 2017-04-12  606  		return ret;
7edabee06a5622 Eric Anholt 2016-09-27  607  	}
d5b1a78a772f1e Eric Anholt 2015-11-30  608  
cdec4d3613230f Eric Anholt 2017-04-12  609  	return 0;
cdec4d3613230f Eric Anholt 2017-04-12  610  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

