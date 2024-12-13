Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E93190051
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Dec 2024 20:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734120991; cv=none; b=hkSibl6oE5dB4F5gcZENr7LUXoyCGRtZBKE3ic6c0i8mal5/lvk7NvUE5r+0ydUh33d8cbJIXCxjNqXuGFxh/C/twLrzyuN/qjpVFhr64T0w5PyaAs8YOuiXd9uLGA/r1w2yruwBGA4meHj2/6YoC9Q3AqIFd+OpKKKvO/BpiPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734120991; c=relaxed/simple;
	bh=7HcSG7IRG/hmt9iIezKnLBt6vPa1+Hv2Vr9xs0g5wq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qhGlJmta2fCg764DZj6aqWrr357Z/SU9K50vVeb2iu2nU6XOJ6i74YnmVFlmfTmUpYoZtPe4Q4FFEm0YQYNT2U7VeT0W+nBu1Ze6NBnw0AndlVS1ZxS4lP7r8s1v57rGb1HcEw/H81LnsPlRVZdFeJuXjoArn27FUtu9YRC1MWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ufd5MI47; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ufd5MI47"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d3e9f60bf4so3355586a12.3
        for <oe-kbuild@lists.linux.dev>; Fri, 13 Dec 2024 12:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734120984; x=1734725784; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F1v+nI0xs4+xFd2MMiO/vrZujn0PunOtcVXHvp82fyY=;
        b=ufd5MI47tt5e1Ec5EcrRKSogzzdC+KJOqEnASJkLY9md/IoozCYqYoS+eQ9iVBbIng
         18S4bg9Jafs+Fi1FR+B99cLciUJivJLWL8FytXLm02XyBdG5k5UxKQ54haOV0s1Y9VBi
         7GvXOGxdx22srsB33h7Nmrgpm5gOykMS+rlYtvyYdj0SLfccpuRl9O+sAGTO3xWWRM58
         YgymElOVyGfcSd0lQXqOzeLIXPPtIVKQydpDYE/kmvd2IyliRT7s/FY4Boo3g38Xb6/R
         PEzr5fTXvvnF5a8jzqERJyP953l2M31325buN1WL3m0T3I6IBI0KbboDfqRkn/IY1TKX
         2BfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734120984; x=1734725784;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F1v+nI0xs4+xFd2MMiO/vrZujn0PunOtcVXHvp82fyY=;
        b=H8fuCYxaKAYN038m4NZT1zENnA1rnzpkqZaEGQEPy++efbIblt0tBlOzHt8K8/md4X
         8nCIypMoE0So5z46AhTK1UYZvJBfV6FrFqQhZIp2FMDEMPeiDzIaCv9L8nuiaRxpZ11c
         P5FxgLYxbj+EnoAlceVcDtLoddgDXXlOFn/VA8EFptoi/igL2qcB0UkX99AldVJa9uV+
         CFMk/8GYUK+WuzYlOvE/1CFCjeBiKPNAaWuH9KtHe5wb2+GwXEh6FYU7Zp7l9c+TlCD1
         J0gltIDYXapF3qrCF4aEA1r4FmJkwPqplUVYgBIA8hPyOjcicZV1ck7xRE7jzzEEVszb
         wBsg==
X-Gm-Message-State: AOJu0YxXisXYjNMKNpuabYHyAY+NKidbGnoHf9/4g3SO3JNzJtYLYB83
	3FNTKuIKSCxYGjb27/3NiH/3aK0Y/6fctmw7EVf04WnlRDk1f3xDkieHTFI5yYeIFPDB6lvQ8WE
	1
X-Gm-Gg: ASbGncvxkL6EL/lK6SJcWOq6SKepU7/7aqOb6cJgJ+I47xPPVvImVeJyLtVzQBgIBPD
	SaGqasuRJ9or7t/4ujF2iUfMmExu/bi1g0GMNZmz4eYSPt4fWd+FdVIp9/kn1d/4eEu8Dpe4A9L
	X0phcvHnkuFVUTxy/zA57qpVm2mVuVuNs/sEMRiroN9CYbLovjdjXuX5qBWkM23qTNKG3sy8Cwb
	RS/51m64BwABwt7E5nlcnLx8wrppgEt+oBqpkLO4/VwpOEU2bsa9Tpd0X0zvg==
X-Google-Smtp-Source: AGHT+IGikmWeeR0Cp2D1SgPx/O1pfVPezhDc68pK1pGrq1IACEOQA5rmkni+RElEH1l1PWB+aAz0xQ==
X-Received: by 2002:a17:906:c110:b0:aa6:7ec4:8bb3 with SMTP id a640c23a62f3a-aab77909c9amr409379266b.20.1734120984466;
        Fri, 13 Dec 2024 12:16:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab963595f2sm10005966b.104.2024.12.13.12.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 12:16:24 -0800 (PST)
Date: Fri, 13 Dec 2024 23:16:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dave Jiang <dave.jiang@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/features 11/15] drivers/cxl/core/mbox.c:775
 cxl_walk_cel() error: we previously assumed 'cmd' could be null (see line
 767)
Message-ID: <af36af30-76ef-48b7-8a1f-e670ba3bf7aa@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/features
head:   f0a6d114e94c15c348733978c4dad4ecdae16d16
commit: 96d766b4e53edf0c9ef84fa447b7afe6fbeeb743 [11/15] cxl: Enumerate feature commands
config: i386-randconfig-141-20241213 (https://download.01.org/0day-ci/archive/20241214/202412140111.UkB1YSO2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412140111.UkB1YSO2-lkp@intel.com/

smatch warnings:
drivers/cxl/core/mbox.c:775 cxl_walk_cel() error: we previously assumed 'cmd' could be null (see line 767)

vim +/cmd +775 drivers/cxl/core/mbox.c

59f8d1510739e92 Dan Williams     2023-06-14  752  static void cxl_walk_cel(struct cxl_memdev_state *mds, size_t size, u8 *cel)
4faf31b43468c58 Dan Williams     2021-09-08  753  {
e624d105c460e56 Dave Jiang       2024-06-17  754  	struct cxl_mailbox *cxl_mbox = &mds->cxlds.cxl_mbox;
49be6dd807511db Dan Williams     2021-09-08  755  	struct cxl_cel_entry *cel_entry;
4faf31b43468c58 Dan Williams     2021-09-08  756  	const int cel_entries = size / sizeof(*cel_entry);
59f8d1510739e92 Dan Williams     2023-06-14  757  	struct device *dev = mds->cxlds.dev;
4faf31b43468c58 Dan Williams     2021-09-08  758  	int i;
4faf31b43468c58 Dan Williams     2021-09-08  759  
49be6dd807511db Dan Williams     2021-09-08  760  	cel_entry = (struct cxl_cel_entry *) cel;
4faf31b43468c58 Dan Williams     2021-09-08  761  
4faf31b43468c58 Dan Williams     2021-09-08  762  	for (i = 0; i < cel_entries; i++) {
4faf31b43468c58 Dan Williams     2021-09-08  763  		u16 opcode = le16_to_cpu(cel_entry[i].opcode);
4faf31b43468c58 Dan Williams     2021-09-08  764  		struct cxl_mem_command *cmd = cxl_mem_find_command(opcode);
d2f706058826b80 Ira Weiny        2023-09-03  765  		int enabled = 0;
4faf31b43468c58 Dan Williams     2021-09-08  766  
d2f706058826b80 Ira Weiny        2023-09-03 @767  		if (cmd) {
                                                                    ^^^
NULL check

e624d105c460e56 Dave Jiang       2024-06-17  768  			set_bit(cmd->info.id, cxl_mbox->enabled_cmds);
d2f706058826b80 Ira Weiny        2023-09-03  769  			enabled++;
96d766b4e53edf0 Dave Jiang       2024-12-11  770  		} else {
96d766b4e53edf0 Dave Jiang       2024-12-11  771  			struct cxl_mem_command *fcmd =
96d766b4e53edf0 Dave Jiang       2024-12-11  772  				cxl_find_feature_command(opcode);
96d766b4e53edf0 Dave Jiang       2024-12-11  773  
96d766b4e53edf0 Dave Jiang       2024-12-11  774  			if (fcmd) {
96d766b4e53edf0 Dave Jiang       2024-12-11 @775  				set_bit(cmd->info.id, cxl_mbox->feature_cmds);
                                                                                        ^^^^^
was fcmd, intended here?

96d766b4e53edf0 Dave Jiang       2024-12-11  776  				enabled++;
96d766b4e53edf0 Dave Jiang       2024-12-11  777  			}
d2f706058826b80 Ira Weiny        2023-09-03  778  		}
d0abf5787adc034 Alison Schofield 2023-04-18  779  
d2f706058826b80 Ira Weiny        2023-09-03  780  		if (cxl_is_poison_command(opcode)) {
59f8d1510739e92 Dan Williams     2023-06-14  781  			cxl_set_poison_cmd_enabled(&mds->poison, opcode);
d2f706058826b80 Ira Weiny        2023-09-03  782  			enabled++;
d2f706058826b80 Ira Weiny        2023-09-03  783  		}
d0abf5787adc034 Alison Schofield 2023-04-18  784  
d2f706058826b80 Ira Weiny        2023-09-03  785  		if (cxl_is_security_command(opcode)) {
ad64f5952ce3ea5 Davidlohr Bueso  2023-07-25  786  			cxl_set_security_cmd_enabled(&mds->security, opcode);
d2f706058826b80 Ira Weiny        2023-09-03  787  			enabled++;
d2f706058826b80 Ira Weiny        2023-09-03  788  		}
ad64f5952ce3ea5 Davidlohr Bueso  2023-07-25  789  
d2f706058826b80 Ira Weiny        2023-09-03  790  		dev_dbg(dev, "Opcode 0x%04x %s\n", opcode,
d2f706058826b80 Ira Weiny        2023-09-03  791  			enabled ? "enabled" : "unsupported by driver");
4faf31b43468c58 Dan Williams     2021-09-08  792  	}
4faf31b43468c58 Dan Williams     2021-09-08  793  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

