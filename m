Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0057123EA83
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Dec 2025 13:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766754774; cv=none; b=pD4aMugxDFOMuRg+z+efq0q9qQup9nME/oe4ALVHed6k+bG3Lvg/jW26ej0GdskJ+gyernCGPEZZKWK//pHHAfI3ozHnU/ipaDwnCaYi7dMXaIB+LJKD5NgQG6E0iJswt31dzs5KJ1FMSUF3ek4fvR4mYx2HITr4Nw0ODMm3XHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766754774; c=relaxed/simple;
	bh=Zzyrkv+jDg1lPu6LLx7PPcO2dvReUtPC3A4PLs347n8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I2k5iWdmW2q/+EwAli3f9EqVZwUBVd1iL27ogC7jtgyA3QUktYEMbU+jhslsbRx589liYJk1fbuI+433j+Q+FFnb6ywQoFm46R/eite7nif2msLHsUjAYcxnadcDgvsrxeWClGk4/HdzxKFpTOUfROI5nP8ZPhsbApiHYBhlsWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M++qQwDx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M++qQwDx"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47d3ffa6720so15712185e9.0
        for <oe-kbuild@lists.linux.dev>; Fri, 26 Dec 2025 05:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766754771; x=1767359571; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7jnzss7SrgncsYKHhnBFIr8PlxYdzd1neAXYIb5ojw=;
        b=M++qQwDxPrWpXwAvhoYcoQ7I5ghNn8hpbbH2NC185pEFjp3znypQfJkcTcAdvWr5Qy
         gaR3Cpp0XuqmnCbEwhYAB7+CkBExmy6wF40Ik0prWN0eSDKwgXlvvRVkAOS55ivKU39T
         RZvbi+hC6sr9Gv8NEM8ZVTRCdicRqg1CPR0K3TAvPf8oRW8DQ9/6tOA71oIyvF8b9QRg
         0LzJSii5aXI8IlVMWIYgY54K6mxUNTSSqAsgfiE+F3zsLz6XCXaIferhBoOvAkBAiaww
         C5spZs81O8L5fgaqXs8oFzeDQMON2P1DyFnu/i4KIcVnWJv2Byfi+9zq1gKtMmwB2Dig
         bvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766754771; x=1767359571;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7jnzss7SrgncsYKHhnBFIr8PlxYdzd1neAXYIb5ojw=;
        b=iWBXOHOgV12JYRmsQuJ6HI0q/HzApu1TAyDjqFy2Yi2NFnVbbpZ3mzUYiSTgNhIyGk
         MsVQxEeCI1R+PHENZi7+Ts5CFoCbca2ve4E7S/OAScvPGHDXbbdokk3h8JpLqzNvisNl
         r+/N0TMXWdY/AnLk7DpGv8tdMFC9ukEo14ILi6kfQSxetgLdAFJxfk8Ii56xsjSaBtyT
         8UhVw/Fc8bxLgWaQ7fjE1zwknKJaak2ksG43WXtGRL0RXtFbL7KckmzVdCcZRsM60HLj
         VMuTVctL8qscPn6D6mbG8jh8e/1vEkXljUKDchEuU65qpHEbRIhiylBrn25iePIrzOg2
         3kEA==
X-Gm-Message-State: AOJu0YwGwRuQAAKhGj5oYPA2G7t3DQK978Z5TdVZMQJU8N6QNcRROusP
	1hIqtkcMPf99JTn2uBlq6fosGxPmCWGO9ar8SjYqkGnHkBOZWMlyqaArwlMygdYWoawGlfmazD+
	84pn8
X-Gm-Gg: AY/fxX7ESvIADyz29bMQ9Q/MAV1f6ohB+0rCvxiEmwp7ATmfz3b/nmvMNwaqiSvoi3i
	dcC1EdQgp57IB8JCKt/DIItZKjMDw+A2pn48uyBTUW29MX4JPwyrqCyGtYBkHtSj2v6jVB7VXPQ
	ckxrAtNNfGVzt5AZS6Qi9xt4vDwFCT/L1VoMDtJjDfPm4Q7mtvpOzdK2v1nC9mUmfDMiR4aA4gh
	A4ILwjOMt4rUqzgbHEx3YpGCMTbXusEap031b1LAn/twS6JxrhRYI0+RuYm/AgGc1ImBskvgche
	U2vNntCcegaMbJih74mvcJVTFvyOE8GgqEz+dxDgsuRoHB8OkkcY8z/4IiRnJUc1A7wkaa9Khzb
	GYQj4+/FIn4E2pdYxbqUSsihsJz5j/gkHVYHj/8VsGgzonLpEnJQRJ2rsgTWvt1+OtJ4dvS6PjK
	pY1q1SZIBYi2ANGuqX
X-Google-Smtp-Source: AGHT+IGKzcbgQ+tXH1pXY7Tmn2bUwHhALa3rlAg9XLT80pEqkBwfhsO4hiRp/bMzr/tOXSWghlfGDA==
X-Received: by 2002:a05:600c:3b1f:b0:477:9b4a:a82 with SMTP id 5b1f17b1804b1-47d36c75e0cmr122805055e9.35.1766754770832;
        Fri, 26 Dec 2025 05:12:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be279c5f8sm423216845e9.9.2025.12.26.05.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 05:12:50 -0800 (PST)
Date: Fri, 26 Dec 2025 16:12:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [rafael-pm:bleeding-edge 69/72] drivers/acpi/bus.c:339
 acpi_osc_handshake() warn: variable dereferenced before check 'cap' (see
 line 332)
Message-ID: <202512242052.W4GhDauV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251226131247.9FT27evx4o93vJEZ4htvpVLHBiR_w6aQvLquWFWxzrw@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   e08ef982088f28cd65654693f29ffe430a9d4d66
commit: e5322888e6bf4ec17964a93638c9b14433a2f6f1 [69/72] ACPI: bus: Rework the handling of \_SB._OSC platform features
config: x86_64-randconfig-161-20251224 (https://download.01.org/0day-ci/archive/20251224/202512242052.W4GhDauV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512242052.W4GhDauV-lkp@intel.com/

New smatch warnings:
drivers/acpi/bus.c:339 acpi_osc_handshake() warn: variable dereferenced before check 'cap' (see line 332)
drivers/acpi/bus.c:339 acpi_osc_handshake() warn: sizeof(NUMBER)?

Old smatch warnings:
drivers/acpi/bus.c:297 acpi_run_osc() warn: sizeof(NUMBER)?

vim +/cap +339 drivers/acpi/bus.c

e5322888e6bf4e Rafael J. Wysocki 2025-12-22  328  static int acpi_osc_handshake(acpi_handle handle, const char *uuid_str,
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  329  			      int rev, struct acpi_buffer *cap)
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  330  {
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  331  	union acpi_object in_params[4], *out_obj;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22 @332  	size_t bufsize = cap->length / sizeof(u32);
                                                                         ^^^^^^^^^^^
The cap pointer is dereferenced here.

e5322888e6bf4e Rafael J. Wysocki 2025-12-22  333  	struct acpi_object_list input;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  334  	struct acpi_buffer output;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  335  	u32 *capbuf, *retbuf, test;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  336  	guid_t guid;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  337  	int ret, i;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  338  
e5322888e6bf4e Rafael J. Wysocki 2025-12-22 @339  	if (!cap || cap->length < 2 * sizeof(32) || guid_parse(uuid_str, &guid))
                                                            ^^^^
Checked too late.
                                                                                      ^^^^^^^^^^
Also this sizeof(32) should be sizeof(u32) although both are the same
so the current code works.

e5322888e6bf4e Rafael J. Wysocki 2025-12-22  340  		return -EINVAL;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  341  
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  342  	/* First evaluate _OSC with OSC_QUERY_ENABLE set. */
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  343  	capbuf = cap->pointer;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

