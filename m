Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524CD34F48E
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 15:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769095630; cv=none; b=FNHykjq8a2Y5zx3wA58Yr5GKw0Hwm47Ga9b8OYiD3F4J3tTKrTkclNQ0mJrBHR5HpJD7r5KNvSf5woyYi5Mg3ZQGb+yiFlQ0RUU3jkqGYnWrwxqXW2YXce+VaDltEHQODDd6fpAMQLQwPbRXz67Cb1+Y7L+s3+RDlVEdWvbep98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769095630; c=relaxed/simple;
	bh=5BUoIn++d40d/VMhmIOatTyxHL8Dj3CAb0SkPHlDZDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o/RRrENWvSS9KCsH8IwiyPBNKR5qncKoRnnraY53ZFGR2no7ualfjeiphK2Ey89oj3o84dlw1ywX5dZTxPydOLFBEKiqT4axzBaXrepN24kh8VAxyL00R8OdOqNg2qTW5vY2iWims1DfDd0YlmLeyWOd/kWXFRxnpKD1EETc3zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CaCQ5MbT; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CaCQ5MbT"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so84575166b.2
        for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 07:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769095626; x=1769700426; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZQoMHifdLhoU8TXrVd7FsHxslofIXsWh2uVp2bESq5I=;
        b=CaCQ5MbT+Z6F1A8yzwpilzrNT1gGC3TZNqO61JdVlRcpJUJ0jwGEsXn4U5PgXkOlWa
         0OKIFas+vhRfBvNegHIl5UQFSc7fC/yoJzyE/xXfCDmt6OfY+3v2DwHFI+HKvOsw7+6w
         cqUEpVJxiBomEAEvmX9fM9ETl85JXlTjNFz4fJmyKzSK+YAsqa0cExrWIKW+SBQlhUlD
         5He3TkdXHxQWoVqCYIYuhZ+xlNtMGFjyehfdq5BKKNmrBl3xOPKMQSki3F3xdmDw2QCI
         IP4DX/wkNVUwHFILoJeg7SRG6eRJZFZpDwkJM2CZCw21Te0X5zwne6bbBwRYXSWEWdG+
         IgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769095626; x=1769700426;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQoMHifdLhoU8TXrVd7FsHxslofIXsWh2uVp2bESq5I=;
        b=Zc8BMh884O+ybZyS8RmNOJMraoDWPbQ8XiKwTgDEolDSp5/PeECQtyPOGFibldUPRy
         UvhL9VYudb3WAM17gOEPpYl4TyYRn3xAC+IFLB+A2M68A0rCcXmXGeW3+8Ol5Nbzyx8D
         5W3z+QUH1dG8dqe4wI3n27wQpGstAz2FiXXcXCNYgG5vGugiA7Ds5X1mmYXNGyxYUtRG
         RTvPGZC+kjwlmOQV7hb56pUL3Z0y7Xv1XMlRJ+zm66uAf0OZIGHaYdV428lUUvGjpI6d
         jifljgQSXXumZWJU3Tiu5N/lwQcJlWMUl6hGyldnz6CbhcfPZV0faeMiMVzIXrD+sq53
         oBkA==
X-Gm-Message-State: AOJu0Yy84DHwmNaUGJAbj6SN5Fx9ye8Jnp2T3+VvqPOQvx8qUvqsWWQH
	6umzkMUWgj2iyI6+dd0JjIYBLDgx0wztpjdHq7gPTmNiXa4EBV5umxLpflaIAr/3tO9ks3q5H2L
	11iLnz59eOi83
X-Gm-Gg: AZuq6aLTpfottHxdutKHa1o+22iF/VL8bSGSUfsaAwdaJsSqcQSikvmnYtZKyG//2d4
	1yR6owlaMonBdFTJRePZKjfMWcF69pJmB5/1NGDsqANfdEopDuBe+O9RmwSuXX/T+lb71EMfxpl
	z6HMPTEj6IdMzr0I2Wawd3HMt7QYAuVjC0HJIzf+A8NyDo9vbymNye4x5OhIHmSTauNMKcWCIyP
	Fe1+URnodIGHwoOY+dV7sflym93/HsehFKLI8Q7niEnxz2bi4LXEvqOe4yFI87OAwxIUHDQBl4N
	Au5B+pZyn8s0MqPoHAD0rguZJ9hlK0P4N+xX7LM4hzZwFF4IYOlhbE4Agc/cRz8G464crH84vDD
	E0uWKziV1+v2iIBT9XzoFewUtbaT3zDSUlpgDFcsrnvdxma+jjbqkkPrwtmnPwGem4gszWCUIca
	DzqAnqhYjAiaqgkPCM
X-Received: by 2002:a17:907:e158:b0:b88:31f9:1d9a with SMTP id a640c23a62f3a-b8831f91de8mr187964066b.62.1769095626127;
        Thu, 22 Jan 2026 07:27:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8825616964sm193054366b.46.2026.01.22.07.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:27:05 -0800 (PST)
Date: Thu, 22 Jan 2026 18:27:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix 45/75] lib/dynamic_debug.c:1844
 ddebug_drop_cached_prefix() warn: passing freed memory 'prefix' (line 1843)
Message-ID: <202601222139.VGTZ3L94-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260122152702.0ykOu0LepzlRdgkmD5eVznajiAmRFBfHO7kdMClev14@z>

tree:   https://github.com/jimc/linux.git dd-drm-fix
head:   354f9423ffa1fb2a31f8410ddeea96a7a8471ec1
commit: 37e1c3e5c714f09a36daac2b5c3c55b3b7f9fae4 [45/75] dyndbg: cache the dynamic prefixes per callsite.
config: arc-randconfig-r072-20260122 (https://download.01.org/0day-ci/archive/20260122/202601222139.VGTZ3L94-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601222139.VGTZ3L94-lkp@intel.com/

smatch warnings:
lib/dynamic_debug.c:1844 ddebug_drop_cached_prefix() warn: passing freed memory 'prefix' (line 1843)

vim +/prefix +1844 lib/dynamic_debug.c

37e1c3e5c714f0 Jim Cromie 2023-10-02  1833  static void ddebug_drop_cached_prefix(const struct _ddebug *dp)
37e1c3e5c714f0 Jim Cromie 2023-10-02  1834  {
37e1c3e5c714f0 Jim Cromie 2023-10-02  1835  	char *prefix;
37e1c3e5c714f0 Jim Cromie 2023-10-02  1836  	unsigned long key = ddebug_prefix_key(dp);
37e1c3e5c714f0 Jim Cromie 2023-10-02  1837  	unsigned long lock_flags;
37e1c3e5c714f0 Jim Cromie 2023-10-02  1838  
37e1c3e5c714f0 Jim Cromie 2023-10-02  1839  	spin_lock_irqsave(&pr_prefixes_lock, lock_flags);
37e1c3e5c714f0 Jim Cromie 2023-10-02  1840  	prefix = mtree_erase(&pr_prefixes, key);
37e1c3e5c714f0 Jim Cromie 2023-10-02  1841  	spin_unlock_irqrestore(&pr_prefixes_lock, lock_flags);
37e1c3e5c714f0 Jim Cromie 2023-10-02  1842  	if (prefix) {
37e1c3e5c714f0 Jim Cromie 2023-10-02 @1843  		kfree(prefix);
37e1c3e5c714f0 Jim Cromie 2023-10-02 @1844  		v3pr_info("drop cached prefix: %s\n", prefix);

print the string first, then free it.

37e1c3e5c714f0 Jim Cromie 2023-10-02  1845  	}
37e1c3e5c714f0 Jim Cromie 2023-10-02  1846  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

