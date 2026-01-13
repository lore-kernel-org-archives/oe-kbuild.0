Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D243081DF
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 05:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768280915; cv=none; b=c6YZAG4eHPYgazb4+oSbZZBqho0YhZe+EXVcQLXWDA+bN7aJGEGCgsxrM1jd7ot1yqTB2H6jlzNhs/AM+izJV3snGjORW8w0UHRLGDwNIxLFBdb9QfcX+e0R1AaX2KoYwtO3/LxvoCOFwwbr29NF09OJ2dRLP0hV0VkGS5A01EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768280915; c=relaxed/simple;
	bh=ACXn6lg4kNs0437TL3rioVH/aK6nRi3iqZ8iIBF4Zb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rwgt/TPgWUWrO8p4sPpqx6C5wL6sWs/mVeRsmY8uAzahflioIYE1ky2eIDNE/+I+rUJXphIYFzdI0D/Om5GUqjE5jvkjsnVISqpjpJ0WKjHP///0RyMTRhxTFuSlZPiGN718BHWYbXnl/TAqHg3POcxsF5OBZmRPG1UDiN3eOQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WllaJcaP; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WllaJcaP"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43246af170aso3363331f8f.0
        for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 21:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768280912; x=1768885712; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6uaCRSVVblKm0CtUPOOTW0A3gKySgQBjYunwSnP/E4=;
        b=WllaJcaPOvx56q2hwkn4SbYa/hO/2uBb7t4YGXm9vBHG9k3e1JX6AjSCxdk2r+jQPQ
         7m21JFOQw/LLKeGka5CEHKKCFT7Ukwz+DsH3u7wvRpMOZOYGwQMw7JqCSeVvdt0KaV9J
         g0bN0EF+SKUHz2PBNc4hD8Huj1Bi/ZXC33Ldfv5+P4mvZ/DJBgBb9Xifaos17ZFD4LeB
         HY+ucHgUaa9O3JrhmjI65fMzA5Nhw4ATMjyZqSaCFIKBQYpCbJu8ekOSGEVpjILvrY4m
         r9Pgz0jXUU8jvwQXDlCtBRWYwbixom5nHb2PThCSE/mdS0obH8BeT0wG2eDdPvfY+qgT
         ap5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768280912; x=1768885712;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D6uaCRSVVblKm0CtUPOOTW0A3gKySgQBjYunwSnP/E4=;
        b=m8tj114XDdD/u9e4KAWqcGVy5WRJ3iw9az86Nust6XCDxm2s2wd3QDJVjCqb6rIyLS
         V4RYTl71YXE42WC8/6Ofc8ErpLSQUrw9E6xD3zn9aaPxjG40AqD4YX4UOJGFzGWIVcLF
         M8igucoA7l94AhiT8axsdhW5M1wij3kSMCgfy0ItmYzw1BcY1ujjR/5NRpdP+wNTm35x
         9p23YxpmzCDaFJ0EFt//ot0aCloWE6HU5nZtlvw4OXt/q+M3CSwJwWbUsQRFdTNykgC2
         AQCYuHqeKLtJBX7muv8zVLQVmg9M7SnILtSFtSBW0xpGULopxhHC5+qIcGm8btrPAFJB
         ri1w==
X-Gm-Message-State: AOJu0YxDjSQIpS13k+bzd0uMalnpTxnLDsb1xlZTwFMlSm2Q1zRdXCph
	gtt7SO+IG/9A7wgFOLuAYT4bBBt3JzrpTIei9JAe0D4xgg9QWiXoks3QoJVJRRmFzG0NF4IxX3b
	CkFoz
X-Gm-Gg: AY/fxX5LE/P+HOzC1Ca8M7nSXrAxDvILA+1UQiofxEegmh0fdYGN+TG9i26N0dzOktg
	YPQcxgviSUUJXJmVbiuadc+9ZVwSU6/h5pdJQWVgN70V6xHthVIFtjXxonBY5RAE8oJgj9sE3av
	UQbP3LeDsoTzgjAyfBNGg9XixisevDpWlx6dxic4iuSkDEeZdLZQWjJtqGAcKhsxrTNbsdQKJmH
	qeXbzbiPaOqTdYNbaIEp3ESM4O9BZWGUCnSEjSmwpVPM2ZjMqwen49GqoSVZ56C6Y45LUX2U7uz
	hZkrDwnnmsvMdHNXWEmLtaI1NVKumD7qJzApPa4V5kz1s73Je8x1/X4/qlMWgdd6rhbP4+eJth8
	JkmbjgUDjIQ3MEXMJfGyA7qm8cDOuxp+ucBZNqsKbDDDjKrIvYt7+5q/rbjikJo7GLnD/A0v11u
	Up8Ie3vbBrH6aDJMbW
X-Google-Smtp-Source: AGHT+IEo3MWAv0DINHWH4fppsupPn8mvAgN6FCpQDKGP93pSZdWq3FVXdAxAaYTiQrLt3stCUn3Xfw==
X-Received: by 2002:a05:6000:4012:b0:429:b8c7:1848 with SMTP id ffacd0b85a97d-43423e8dc1amr1907005f8f.19.1768280912051;
        Mon, 12 Jan 2026 21:08:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432dfa6dc4esm20212225f8f.23.2026.01.12.21.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 21:08:31 -0800 (PST)
Date: Tue, 13 Jan 2026 08:08:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 14/17]
 lib/kunit/kunit-uapi.c:120 kunit_uapi_open_standard_streams() warn: double
 fget(): 'stdin_fd'
Message-ID: <202601130843.zWY00hxH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20260113050828.59LbsR0QUU1kVAHSR2BNN5mbFUj8ueVcqwCzaSaWfOU@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   80b91cbf311bb07ffba6c87d77096cd91772b1b3
commit: 309f754f627839d741bd67285095729bd41ae32c [14/17] kunit: Introduce UAPI testing framework
config: i386-randconfig-141-20260113 (https://download.01.org/0day-ci/archive/20260113/202601130843.zWY00hxH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601130843.zWY00hxH-lkp@intel.com/

smatch warnings:
lib/kunit/kunit-uapi.c:120 kunit_uapi_open_standard_streams() warn: double fget(): 'stdin_fd'

vim +/stdin_fd +120 lib/kunit/kunit-uapi.c

309f754f627839d Thomas Weiﬂschuh 2024-10-16   96  static int kunit_uapi_open_standard_streams(void)
309f754f627839d Thomas Weiﬂschuh 2024-10-16   97  {
309f754f627839d Thomas Weiﬂschuh 2024-10-16   98  	struct vfsmount *devtmpfs __free(kern_unmount) = kunit_uapi_mount_fs("devtmpfs");
309f754f627839d Thomas Weiﬂschuh 2024-10-16   99  	if (IS_ERR(devtmpfs))
309f754f627839d Thomas Weiﬂschuh 2024-10-16  100  		return PTR_ERR(devtmpfs);
309f754f627839d Thomas Weiﬂschuh 2024-10-16  101  
309f754f627839d Thomas Weiﬂschuh 2024-10-16  102  	CLASS(get_unused_fd, stdin_fd)(O_RDONLY);
309f754f627839d Thomas Weiﬂschuh 2024-10-16  103  	if (stdin_fd < 0)
309f754f627839d Thomas Weiﬂschuh 2024-10-16  104  		return stdin_fd;
309f754f627839d Thomas Weiﬂschuh 2024-10-16  105  
309f754f627839d Thomas Weiﬂschuh 2024-10-16  106  	CLASS(get_unused_fd, stdout_fd)(O_WRONLY);
309f754f627839d Thomas Weiﬂschuh 2024-10-16  107  	if (stdout_fd < 0)
309f754f627839d Thomas Weiﬂschuh 2024-10-16  108  		return stdout_fd;
309f754f627839d Thomas Weiﬂschuh 2024-10-16  109  
309f754f627839d Thomas Weiﬂschuh 2024-10-16  110  	CLASS(get_unused_fd, stderr_fd)(O_WRONLY);
309f754f627839d Thomas Weiﬂschuh 2024-10-16  111  	if (stderr_fd < 0)
309f754f627839d Thomas Weiﬂschuh 2024-10-16  112  		return stderr_fd;
309f754f627839d Thomas Weiﬂschuh 2024-10-16  113  
309f754f627839d Thomas Weiﬂschuh 2024-10-16  114  	struct file *logfile __free(fput) = file_open_root_mnt(devtmpfs, "kunit-log", O_RDWR, 0);
309f754f627839d Thomas Weiﬂschuh 2024-10-16  115  	if (IS_ERR(logfile))
309f754f627839d Thomas Weiﬂschuh 2024-10-16  116  		return PTR_ERR(logfile);
309f754f627839d Thomas Weiﬂschuh 2024-10-16  117  
309f754f627839d Thomas Weiﬂschuh 2024-10-16  118  	fd_install(stdin_fd, no_free_ptr(logfile));
309f754f627839d Thomas Weiﬂschuh 2024-10-16  119  	fd_install(stdout_fd, fget(stdin_fd));
309f754f627839d Thomas Weiﬂschuh 2024-10-16 @120  	fd_install(stderr_fd, fget(stdin_fd));

The static checker is correct but this is kunit so presumably
peole aren't going to run this in production...

309f754f627839d Thomas Weiﬂschuh 2024-10-16  121  
309f754f627839d Thomas Weiﬂschuh 2024-10-16  122  	take_fd(stdin_fd);
309f754f627839d Thomas Weiﬂschuh 2024-10-16  123  	take_fd(stdout_fd);
309f754f627839d Thomas Weiﬂschuh 2024-10-16  124  	take_fd(stderr_fd);
309f754f627839d Thomas Weiﬂschuh 2024-10-16  125  
309f754f627839d Thomas Weiﬂschuh 2024-10-16  126  	return 0;
309f754f627839d Thomas Weiﬂschuh 2024-10-16  127  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

