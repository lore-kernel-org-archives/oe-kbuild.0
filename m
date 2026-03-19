Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490392F0C62
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 09:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911734; cv=none; b=q5n9AODYmux3H3wJrmDyK1YJkhAsV4eqhSm8EsTye9wR4uV0WOj9NCtD8VLfMJhXSIqle7h0G+BlIDuJAUYHvn7heFlsCpzcXznXMHYFG9e5+orh2IkY7F3qEOt+P6pKYqTMMNda3FVPFus818/YCDybZjOdhH02WB+8IuA3dY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911734; c=relaxed/simple;
	bh=1dmeRQal/ZpVm0L/ivgF5rD0HGR4kfmAEzevbZOVQvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=evM9O/hUmv+ph5A63JHf1+dWuQ79FeLKEz8mmAuMO3NECvhwVVfS0YhcqVrGt3Spy18Zmr0UwMkRw8t//L8gTFFGws1i+YeyBivE9TtjlqLilyyreEYw1/3M529/Y6vBby6hD0OLjKUxJfEEtUztZcM2DuJZkA1/teKRFmgp+Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RlTq801F; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RlTq801F"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486fb439299so3277285e9.0
        for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 02:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773911731; x=1774516531; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUSCDB83co7ppHJl5GhGBtIfWncyhJhoxXMzlAxCrYI=;
        b=RlTq801FIPqJ8LXzMsFJNmTYU/W4d457B/ogzRCF0MkrYqj8FAb7+cy1dyF17NH+cH
         CJAM5pV7Eh2UEn5V7YD3xKch2XQt3HDtnwW9f0auaWSSWS2Jpi4TUSoknPgKhm3p60Nk
         24I9AxDWpXbtwCPYxE8gDqQvdEn2CqhuUnUeQbB0s7zZ1+hqZw0AT5Q9ZC5fe9bEb3Qs
         5t8LsFb2u+mBM6NLuPKBNsOYRRZ7UFusGBaX1yNKLGREbVEENh7dju9Tnx84jLczuYSX
         9Vwf4kRzUGxphyxeUP8Td03wvEk2Eo2QhHXeWmy1JhrGKmJ3woBB7kngayFukDQd3Cs4
         FZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773911731; x=1774516531;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YUSCDB83co7ppHJl5GhGBtIfWncyhJhoxXMzlAxCrYI=;
        b=TOpENv2AnD1nec9moYc34RNm2y/ZbusuDmAV5ZKMMtZVWPWD0oremL59mTXK3Wc6d6
         kjJ5qSqnkUEa6GoneBE0BSejGQFPg6Hs5xUJtg31PPIN35f7+MScqqG1pd6YyDYvAjP5
         Kpk4rTDHhTWIVWiyFILuGGG9IVV2QDhx3wvb0e+Y9Rmohi6aw6VUpY/XtnPucTybp4u0
         8BdjJsMXK8RqhrHSltXROipK1OwoCAHKA0gbjgu4GiliXp2iyYZX4SjRSSAu9tW2eLxy
         iOXVUbkJRyBOL1E1f9jWCoZzpsd12wqlj2vh12f+Rcty3esaf2XAmE9bu2Rs6gsNZUKR
         662w==
X-Gm-Message-State: AOJu0Yz0CzEL+NmFdsaFeUoKL+8X9zW1kQWHV2vWPBJjRjyQXaFagHKB
	3ca5T2ajota72dCRrJpQsEFEw+tw24RtPfbtjdZRl0B+Mp786rjUn497Mb5OsT19htqWDLqS/da
	uf8oi
X-Gm-Gg: ATEYQzyMUDeSRj9iha9J49LKCwbgyKv4UBjJp/NSq/7TgDBIAwB/l+rmWkU8pUAU1iO
	MpwPGUj2tMDz+Y0p6Zn23at6QYxnUVcWVhnhjJkdF4Y8WRDrkIkXL6WbC5coA5G2cvzEniOa5Ee
	it5jEIRn0OwZUC6byfmc9hZZzBflcpz3uz+smvv8gFOSXkKjo3bvEUnd/2SvGx3pedSwDMN9V4c
	1CoJJycAYrJjYSda1lMzZi5q+IiJHTOJzmPnnirY52+LBp/8sjqxf/ck2FmMLVcGVl3nOWhbGH0
	jF1xpzIeXzUdOgGQ9iQU9pT54D0Wqn5QEbJqarev588XeGmh3YBBk2q6527x4SaeoIvN5Y2Odqy
	6W8vqA2t3VkC4/uCbqK5PSCNyrf4E1IOMF2ZEOMMQHnrY6bMo7AcKi2mJSYCacfkyA84g3oYxwg
	8QV4FYUHALalqRfmPa8L8HZY6mU35PCYNt0uQkyOk=
X-Received: by 2002:a05:600c:6994:b0:483:79ad:f3b9 with SMTP id 5b1f17b1804b1-486f445facdmr102611195e9.28.1773911731261;
        Thu, 19 Mar 2026 02:15:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4b818aasm36720405e9.16.2026.03.19.02.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 02:15:30 -0700 (PDT)
Date: Thu, 19 Mar 2026 12:15:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-block@vger.kernel.org
Subject: [linux-next:master 6496/7246]
 drivers/block/drbd/drbd_legacy_84.c:466 drbd_conn_str_84() error: buffer
 overflow 'drbd_conn_s_names' 24 <= u32max
Message-ID: <202603190716.h5QMTLBc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20260319091526.8Dwfr0SsKeZi8QCRp37aKFMeXctG3dtVvQsJfKDqvAQ@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
commit: 7d6deec50773e43a5840f798ea0a730f20f74700 [6496/7246] drbd: remove BROKEN for DRBD
config: openrisc-randconfig-r072-20260319 (https://download.01.org/0day-ci/archive/20260319/202603190716.h5QMTLBc-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603190716.h5QMTLBc-lkp@intel.com/

New smatch warnings:
drivers/block/drbd/drbd_legacy_84.c:466 drbd_conn_str_84() error: buffer overflow 'drbd_conn_s_names' 24 <= u32max
drivers/block/drbd/drbd_transport_tcp.c:742 dtt_wait_for_connect() warn: variable dereferenced before check 'path' (see line 751)
drivers/block/drbd/drbd_transport_tcp.c:1297 dtt_connect() error: we previously assumed 'csocket' could be null (see line 1179)
drivers/block/drbd/drbd_transport_tcp.c:1339 dtt_connect() error: we previously assumed 'dsocket' could be null (see line 1179)
drivers/block/drbd/drbd_req.c:995 mod_rq_state() error: we previously assumed 'peer_device' could be null (see line 924)
drivers/block/drbd/drbd_req.c:1245 __req_mod() error: we previously assumed 'peer_device' could be null (see line 1155)
drivers/block/drbd/drbd_req.c:1996 drbd_unplug() warn: variable dereferenced before check 'req' (see line 1993)
drivers/block/drbd/drbd_sender.c:551 w_e_send_csum() warn: missing error code 'err'
drivers/block/drbd/drbd_sender.c:2341 w_e_end_ov_req() warn: missing error code 'err'
drivers/block/drbd/drbd_state.c:5178 change_cluster_wide_state() error: we previously assumed 'target_connection' could be null (see line 5170)
drivers/block/drbd/drbd_state.c:6305 calc_data_accessible() warn: variable dereferenced before check 'nc' (see line 6303)
drivers/block/drbd/drbd_main.c:4575 drbd_init() warn: missing error code 'err'
drivers/block/drbd/drbd_nl.c:689 drbd_khelper() warn: variable dereferenced before check 'connection' (see line 585)
drivers/block/drbd/drbd_receiver.c:280 drbd_sync_rule_str() error: buffer overflow 'sync_rule_names' 22 <= 22
drivers/block/drbd/drbd_receiver.c:289 strategy_descriptor() error: buffer overflow 'sync_descriptors' 18 <= 18

vim +/drbd_conn_s_names +466 drivers/block/drbd/drbd_legacy_84.c

a5747bff1fbd8c Christoph Böhmwalder 2025-12-16  463  static const char *drbd_conn_str_84(enum drbd_conn_state s)
a5747bff1fbd8c Christoph Böhmwalder 2025-12-16  464  {
a5747bff1fbd8c Christoph Böhmwalder 2025-12-16  465  	/* enums are unsigned... */
a5747bff1fbd8c Christoph Böhmwalder 2025-12-16 @466  	return (int)s > (int)L_BEHIND ? "TOO_LARGE" : drbd_conn_s_names[s];

We *want* them to be unsigned.  Now if someone passes a negative s
value then it will result in an out of bounds read where if we removed
the casts to (int) then we can easily verify the code is safe.

a5747bff1fbd8c Christoph Böhmwalder 2025-12-16  467  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

