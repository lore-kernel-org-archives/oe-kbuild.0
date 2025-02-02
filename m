Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE9914A0BC
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Feb 2025 16:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738514240; cv=none; b=GZogJ3Gmi5kthshiC1pZyy3bu8pQc6gceGu2MSGb8IVkMEx2JfjT/homfYKbaWio8/cZEFvNKxs+no0aW/NwYKGOyQJE09EpHmaqdVOshthq8yXXspL9mvZhDSJdLOPgv6/6AbYLr/LrcA6pgyv8qlWSeMI0H4YfxQv9johkSHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738514240; c=relaxed/simple;
	bh=/tB14NYSaijoYPS4FpgJhdnq0Z4fpHgkv9sBwwcg6Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m0Ne/300D4EN9PgnHqdJ+trPmDKpDGQaCZhnon9aXCmHw8aSNw/mX7tt2iiMX41r3dbI1GfKZ4F8qhZWlj9pF0j8MoclE0hyr87rcmkER3M+HVwfyFxyO4eceu65KHtKZuBrY899nC8HOOpe9iwF0gQuPgxSrZzL/q0PKNq+/1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CV/lgTTa; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CV/lgTTa"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso2019032f8f.3
        for <oe-kbuild@lists.linux.dev>; Sun, 02 Feb 2025 08:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738514235; x=1739119035; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CBWlyemdwPgaC+YBkzTyPHD8l2slGEd6uAbpuUvQE1Q=;
        b=CV/lgTTaKvmzXkh6b81/rJ+QeAYZL3jhZDthphzJwhIGecayJqL1chvmPiQYT/bH2I
         SPnEzJAug7NJKnkUFPtdui6Isnm5QfMQwdFhvsGksuefYoYme5/stZQNooy8nX9xYAc6
         K/aKC8Hkz7hmSSJKMapPGOCP4E0bRiRWnw3puILyeJoNFCYHOi3wfe1ErDYOIYimxHqx
         sMbrzQ1TDA6jV5gaiYPTACERiNnDirBKHFq8BZZX9tmAt1X+j1hqqEYvfyOJI9Dviys5
         lo37lGaH/BISYE5t9uaQ/8atX12dPWPmvyso9VkvSaBx+iR7gtSdo9v8dM5Pzi2Ib8gH
         H9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738514235; x=1739119035;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CBWlyemdwPgaC+YBkzTyPHD8l2slGEd6uAbpuUvQE1Q=;
        b=LuA3gwHGM+dn8EOP3vQybeZj/dxcnJL0pylZ7DcASgwT9+NCSrEQY66U8QNOL6Wv9h
         Fp7rIBBHpH4mUDwYRIiG09wx9Bl9ntmjJDjOJCYqVfShM8krAbRZMtRp3LCDZZGC5H6w
         sFH3vtV1hcg1FqQ9z9D5LnjuHP3ZB/k7i5MktvzYXcpyM65cl3OwHJYR5XGYxWwTmq1Q
         r9ZXDJU69Tk0rZPhQLZ/SKRyx2BOXcUP/I4ZWSc/UouXPU8yT/HIlBRJN/vQXdALkatq
         Cwanqj57mz9n9OQga4TRujCbCKpGIVbfHUryokcBzet1ZwHI62QwmYrbBmb8+Sa7kOC1
         PkWw==
X-Gm-Message-State: AOJu0YzlJHHSRu35RAkDysttTBc2qqCVv5pmt0G5U72ugEzkX2NO64Yo
	QjXCzLxyhwngDXWl8Yt46mpWk7yKXg0DokKLkiwK3iCbutSCQJTNGk8eBWJLr8GJovJWr38ENVZ
	a
X-Gm-Gg: ASbGncsMji7vuxvu2M6T9exLMJPN6dJjI6wKH2C1f8W4R+kzGIlNGABOI8WRUcw1QUi
	5/2dHGxCwx2bl0joe33uysd0x9x50zaszn/d8telw62IsdJOdEQfz+lvjmZysdJTQl/5wyvDpqz
	mvcdgh6JVL9i/gaEc5hLGNcv/+fy1m2XuhMDK5sJn3U3AZ0Y/KIvAWRv5DIrMa4Vs5Qpm6f2Pxb
	EZOrOAnmoq2WQd9anM0E0hrG5tmXuuu231hDH4fvOVsc/3lpfhFruboectuT/nhZ1rE1YQk6t5w
	EzbqexaWxvb4bsZ5cROr
X-Google-Smtp-Source: AGHT+IGuBjGwVOPU6+tME45kmJSnYYMMbOMr8+kiXx1JopFuZmaiZ2lyYW3NrXBUZr3BaYEo+CRQIQ==
X-Received: by 2002:a05:6000:1565:b0:386:366d:5d03 with SMTP id ffacd0b85a97d-38c5195ff67mr18272464f8f.16.1738514235219;
        Sun, 02 Feb 2025 08:37:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c5c0ec7f1sm10196662f8f.9.2025.02.02.08.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 08:37:14 -0800 (PST)
Date: Sun, 2 Feb 2025 19:37:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Frank Rowand <frowand.list@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: drivers/of/unittest.c:1195 of_unittest_reg() error: uninitialized
 symbol 'addr'.
Message-ID: <f2f5df88-a4bd-4460-bea3-0e1717e7e1bb@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a86bf2283d2c9769205407e2b54777c03d012939
commit: 7b937cc243e5b1df8780a0aa743ce800df6c68d1 of: Create of_root if no dtb provided by firmware
config: sparc64-randconfig-r073-20250202 (https://download.01.org/0day-ci/archive/20250202/202502022102.D4ESrh5e-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502022102.D4ESrh5e-lkp@intel.com/

New smatch warnings:
drivers/of/unittest.c:1195 of_unittest_reg() error: uninitialized symbol 'addr'.

vim +/addr +1195 drivers/of/unittest.c

ff61bacd77f258 Rob Herring 2023-03-28  1180  static void __init of_unittest_reg(void)
ff61bacd77f258 Rob Herring 2023-03-28  1181  {
ff61bacd77f258 Rob Herring 2023-03-28  1182  	struct device_node *np;
ff61bacd77f258 Rob Herring 2023-03-28  1183  	int ret;
ff61bacd77f258 Rob Herring 2023-03-28  1184  	u64 addr, size;
ff61bacd77f258 Rob Herring 2023-03-28  1185  
ff61bacd77f258 Rob Herring 2023-03-28  1186  	np = of_find_node_by_path("/testcase-data/address-tests/bus@80000000/device@1000");
ff61bacd77f258 Rob Herring 2023-03-28  1187  	if (!np) {
ff61bacd77f258 Rob Herring 2023-03-28  1188  		pr_err("missing testcase data\n");
ff61bacd77f258 Rob Herring 2023-03-28  1189  		return;
ff61bacd77f258 Rob Herring 2023-03-28  1190  	}
ff61bacd77f258 Rob Herring 2023-03-28  1191  
ff61bacd77f258 Rob Herring 2023-03-28  1192  	ret = of_property_read_reg(np, 0, &addr, &size);
ff61bacd77f258 Rob Herring 2023-03-28  1193  	unittest(!ret, "of_property_read_reg(%pOF) returned error %d\n",
ff61bacd77f258 Rob Herring 2023-03-28  1194  		np, ret);

unittest() just prints pass/fail.

ff61bacd77f258 Rob Herring 2023-03-28 @1195  	unittest(addr == 0x1000, "of_property_read_reg(%pOF) untranslated address (%llx) incorrect\n",
                                                         ^^^^^^^^^^^^^^
uninitialized but harmless

ff61bacd77f258 Rob Herring 2023-03-28  1196  		np, addr);
ff61bacd77f258 Rob Herring 2023-03-28  1197  
ff61bacd77f258 Rob Herring 2023-03-28  1198  	of_node_put(np);
ff61bacd77f258 Rob Herring 2023-03-28  1199  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

