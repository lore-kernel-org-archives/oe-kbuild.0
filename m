Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03781D0418
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Oct 2024 18:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729708901; cv=none; b=XP/+eSZZX2DxQaNB6iDvdlWogQk8Oj4MLwDDSsSUn7hkWVrBs8XI2Mi2npvm07ehCgJVXtOC4OVoKwCsP9nQnFsy0Zn3irQFkJHiJ+QYoo48MB5o+eUIgqZye2CrRYZoklBcYIVzt7qPMBU7VuRmnfVfiBfKu35X79X703TWZ3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729708901; c=relaxed/simple;
	bh=dH++wIz2jILlL8Cwg5Cs91oBMKbdtJDc7kkIq/+MDSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=k9HTtls9Xe7uift10SpJq6fSUDR7OHajTu/7pwnoBU+GKNOR7SsXoIkVCgXgU/N9Y/2+svuolzxjKeyhJWRWclVEW5t863MyZ6bG/R785Qvdd4kNVkyMzxQALcZQ0Wh54BDBx9eOegJU9gbsNRkZXfNbxRSZJTymtljpHUFIhQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VwywEgSH; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VwywEgSH"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d473c4bb6so10957f8f.3
        for <oe-kbuild@lists.linux.dev>; Wed, 23 Oct 2024 11:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729708898; x=1730313698; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4TqZD3SqTFJM7qgZ4e+Cj509mRJMvGph0Tf/cL3xnu4=;
        b=VwywEgSHrUr4msxEuP+D/tjF3VjsFNo2dZq3JeowM4cL3lv5HJfy4NBf8AuVn1n0R6
         uXb/xk03eUUVs1ZaXfRW0C08ri1mWKPeOtFt78fhILMAYuYsha480F06WXpGuWSCwWDd
         KsNQRQLd+wkbiRKTYxr5tNjKB18wOUAcqJPPGkDV0GMH3zYL2Qh0jMg2b3NNsxmPjmsk
         mH+nF/WkP4gDIo01b4j2QEEqzq0wNyl2snRJOBiSZ3VW5I/FbSh7cjSKCk1V92V4dXph
         wMCc+4EOXr9fxnzT0o2AQI5HtTjj1cINea1MpqkLITcAyTMjX0pBFJ7GugPnHM8c+0Kb
         c2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729708898; x=1730313698;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4TqZD3SqTFJM7qgZ4e+Cj509mRJMvGph0Tf/cL3xnu4=;
        b=nkpHPwpl38CKecOPhAcV38rTvsxzoEf7Bjdg9GCU0WuiErKP785DiN8lbkVsMjz7aG
         uRQP7h+L27R4b34dXMaSb4qm2KjWdmEiUFecqqvsve6wUL0JdYLLC0IejIsOkD+i1gg8
         KKNQUtpZfEzHEgINVh+ctSFIfWhXv6rfNrvLGKVBx3+4ur4ORp7RuA/uDJg8tVr/fO7Y
         Y075mrQstthjrBUQOcJ+m90qKRZ4uuoPdlaTy6LWUHmn+RgGbpDoTEWdLNWu2mP+ah2u
         AZG0GGR1enxtPLQF7S7+O4Bof9fXMWIyqxZ49GOgIT72Kajh7cDRa03JPRMQsHh0XQJH
         c2dA==
X-Gm-Message-State: AOJu0YwQGaKCgejtab3QWn7kOvreJLUEihIh9x8qWUBwF9U4uorb+P4g
	F5Z/3SEmw6J4jAJQh1HV9pf4p87xj1osj1ygXztmO9LlfZp4QVhSjToHyRaqL/K9dUXrL2YUcLX
	j
X-Google-Smtp-Source: AGHT+IFrynAelsTrxyfC4Y3kGm4XUvho3tTzCdhMzOW6+OsYrBd5ljOqyht4la4Kev6vsQqqbnX5Iw==
X-Received: by 2002:a05:6000:1b03:b0:37d:4cf9:e08b with SMTP id ffacd0b85a97d-37efcf1952emr2899863f8f.31.1729708897883;
        Wed, 23 Oct 2024 11:41:37 -0700 (PDT)
Received: from localhost ([41.210.146.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9cd48sm9468061f8f.111.2024.10.23.11.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 11:41:37 -0700 (PDT)
Date: Wed, 23 Oct 2024 21:41:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Keith Busch <kbusch@meta.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCHv8 6/6] nvme: enable FDP support
Message-ID: <10427c97-1952-4446-bc93-c41460ef549d@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017160937.2283225-7-kbusch@meta.com>

Hi Keith,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/block-fs-restore-kiocb-based-write-hint-processing/20241018-041459
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20241017160937.2283225-7-kbusch%40meta.com
patch subject: [PATCHv8 6/6] nvme: enable FDP support
config: nios2-randconfig-r072-20241019 (https://download.01.org/0day-ci/archive/20241020/202410200200.VgMAv2Cj-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410200200.VgMAv2Cj-lkp@intel.com/

New smatch warnings:
drivers/nvme/host/core.c:2150 nvme_fetch_fdp_plids() warn: sizeof(NUMBER)?

vim +2150 drivers/nvme/host/core.c

b5bb76d576eb00 Kanchan Joshi 2024-10-17  2139  static int nvme_fetch_fdp_plids(struct nvme_ns *ns, u32 nsid)
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2140  {
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2141  	struct nvme_fdp_ruh_status_desc *ruhsd;
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2142  	struct nvme_ns_head *head = ns->head;
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2143  	struct nvme_fdp_ruh_status *ruhs;
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2144  	struct nvme_command c = {};
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2145  	int size, ret, i;
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2146  
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2147  	if (head->plids)
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2148  		return 0;
b5bb76d576eb00 Kanchan Joshi 2024-10-17  2149  
b5bb76d576eb00 Kanchan Joshi 2024-10-17 @2150  	size = struct_size(ruhs, ruhsd, NVME_MAX_PLIDS);

NVME_MAX_PLIDS is defined as:

#define NVME_MAX_PLIDS   (NVME_CTRL_PAGE_SIZE / sizeof(16))

Probably it should be just 16.  Or possibly sizeof(int) but that seems unlikely.

regards,
dan carpenter

