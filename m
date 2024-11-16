Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F9C1953B0
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Nov 2024 19:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731786298; cv=none; b=rxH1hRupz+dR+ilhh4XAGMZ62sSvveHVouQPb1sh15EjziRZGZclLo9QvB7gzOVhhKmgCLaW8ingcedbkITmVHW1kDuNgvRn2WMQ7KinibmjAbd27YZDJlW5a3TaNbFXqUNnaNvGMfy7xT8MD3vfzaoTyMcVFkuo1uONEnGPhlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731786298; c=relaxed/simple;
	bh=cVvRmHcI5BReFtHCDaLR0x1slgw/yeiRQK6h2DUi7Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZOWsBgwD1YgTt8BO4asMwMU/5JwZ/S/TPCwKxqw7jtefd/NOvEs+oodln+eeUdOfl6W0H6HQb1MtDPiNln1ni3t1Fjhn54KCX5JP8Xmu23lQRPV2imuT2rMVmBd3xy48TL4U7nQNxZceZEAmZRWwlZhnXgRGmFOxXY+/YXIP/O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MxufJ5HK; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MxufJ5HK"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38222245a86so1671043f8f.1
        for <oe-kbuild@lists.linux.dev>; Sat, 16 Nov 2024 11:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731786294; x=1732391094; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yd0Ue5oQVWlCSG+t3RfaiOKPRWG47tjhtlFtgmrf2y8=;
        b=MxufJ5HKL7+xEyA2KE+QeyZs3sIiRIJ6tVPf76dSjJ+0Ow8jhBiRkwIePI9PYHwOM8
         v7tKltLnl1bQTBJxshxs0YbcgMo9MxOaHNA14HFUkbRK5q5vtke8wHQKRMs17ifcurng
         9V57qTVkUBfmyOXQi7xbd7dVAfBMH0d7FpkGZx1OqOXhZd4dWM1N5ecG3szmaVgnnlfZ
         HKpPfWCsMzAdiixx6DS+JAqf0A1JT1a5aaswTSScRiUegNouM1UW5Hmo+22LcH5TYu/F
         LCs/UYoYwCY0axcLGJhLP9fbd6CsFesaCUmjTS0tOgdShM0SaoxTSCKgOBwLdv0P79yV
         cIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731786294; x=1732391094;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yd0Ue5oQVWlCSG+t3RfaiOKPRWG47tjhtlFtgmrf2y8=;
        b=IRYoShUMENeqXZZf/0FoqllyH5Ev05EFC+ta6e+Gt8yDMN/wfIv8rnk/u+kUGfWcXl
         QA/WCjj2Ff9Mx5L/Nubc3l01gWDYCmO2iWhJH3YrgIHZ64au+s+7spmh1NNanlDWDgNd
         vaRajxmXvk6IfgBiJXCz847yJrm1kGtrj//6qLTEZHUzdq3DTtgnWtboq6y1ZJxkQhz1
         IEj9pxv4fgoDFDwNq6OgwkMoLCN+mMLO2imrFz9ryQ6sW4p4J0FipHWL30ilKWojnyV5
         sAjogqnCIsnrACDRjo53l/EI2GhIDC97Fno1RZ+JP8Onz4v9OcdGJCzAFKy0USSHkMft
         cIXg==
X-Gm-Message-State: AOJu0YyLlEySa9T8wqnTrFvRw7VHZVgz+c94RQMEeZXnroevMgOWohz0
	h18dXrV/PwguXsE6UCjgoENHLZXYGLl/I4deTbFhJneM5c143sktPYKLKBRvQnZP0a/xcGTLBKQ
	H
X-Google-Smtp-Source: AGHT+IED3SQWzksMYz+uVeXJC+u8nZB1TMwiLWP80LbsNP2roIBh3HpyveR919wxorKDX8SacvvWVQ==
X-Received: by 2002:a05:6000:4008:b0:382:37b2:87ff with SMTP id ffacd0b85a97d-38237b28b76mr2376092f8f.44.1731786293714;
        Sat, 16 Nov 2024 11:44:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ae16108sm7982328f8f.66.2024.11.16.11.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 11:44:53 -0800 (PST)
Date: Sat, 16 Nov 2024 22:44:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dave Jiang <dave.jiang@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 20/28] drivers/cxl/core/mbox.c:798 cxl_walk_cel()
 error: we previously assumed 'cmd' could be null (see line 783)
Message-ID: <5cad1d59-b95b-4100-9276-097a755eafc9@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   81cb57f64be6af29f39bde3b3ca4203975a84377
commit: 044c18e2de67a0bebddea14ec307777a5a1df048 [20/28] cxl: Save Command Effects Log (CEL) effects for enabled commands
config: x86_64-randconfig-161-20241116 (https://download.01.org/0day-ci/archive/20241117/202411170357.DFRoqGt8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411170357.DFRoqGt8-lkp@intel.com/

smatch warnings:
drivers/cxl/core/mbox.c:798 cxl_walk_cel() error: we previously assumed 'cmd' could be null (see line 783)

vim +/cmd +798 drivers/cxl/core/mbox.c

59f8d1510739e9 Dan Williams     2023-06-14  768  static void cxl_walk_cel(struct cxl_memdev_state *mds, size_t size, u8 *cel)
4faf31b43468c5 Dan Williams     2021-09-08  769  {
744cd0e20b0ed8 Dave Jiang       2024-06-17  770  	struct cxl_mailbox *cxl_mbox = &mds->cxlds.cxl_mbox;
49be6dd807511d Dan Williams     2021-09-08  771  	struct cxl_cel_entry *cel_entry;
4faf31b43468c5 Dan Williams     2021-09-08  772  	const int cel_entries = size / sizeof(*cel_entry);
59f8d1510739e9 Dan Williams     2023-06-14  773  	struct device *dev = mds->cxlds.dev;
4faf31b43468c5 Dan Williams     2021-09-08  774  	int i;
4faf31b43468c5 Dan Williams     2021-09-08  775  
49be6dd807511d Dan Williams     2021-09-08  776  	cel_entry = (struct cxl_cel_entry *) cel;
4faf31b43468c5 Dan Williams     2021-09-08  777  
4faf31b43468c5 Dan Williams     2021-09-08  778  	for (i = 0; i < cel_entries; i++) {
4faf31b43468c5 Dan Williams     2021-09-08  779  		u16 opcode = le16_to_cpu(cel_entry[i].opcode);
4faf31b43468c5 Dan Williams     2021-09-08  780  		struct cxl_mem_command *cmd = cxl_mem_find_command(opcode);
d2f706058826b8 Ira Weiny        2023-09-03  781  		int enabled = 0;
4faf31b43468c5 Dan Williams     2021-09-08  782  
d2f706058826b8 Ira Weiny        2023-09-03 @783  		if (cmd) {
                                                                    ^^^
Apparently cmd can be NULL

744cd0e20b0ed8 Dave Jiang       2024-06-17  784  			set_bit(cmd->info.id, cxl_mbox->enabled_cmds);
d2f706058826b8 Ira Weiny        2023-09-03  785  			enabled++;
d2f706058826b8 Ira Weiny        2023-09-03  786  		}
d0abf5787adc03 Alison Schofield 2023-04-18  787  
d2f706058826b8 Ira Weiny        2023-09-03  788  		if (cxl_is_poison_command(opcode)) {
59f8d1510739e9 Dan Williams     2023-06-14  789  			cxl_set_poison_cmd_enabled(&mds->poison, opcode);
d2f706058826b8 Ira Weiny        2023-09-03  790  			enabled++;
d2f706058826b8 Ira Weiny        2023-09-03  791  		}
d0abf5787adc03 Alison Schofield 2023-04-18  792  
d2f706058826b8 Ira Weiny        2023-09-03  793  		if (cxl_is_security_command(opcode)) {
ad64f5952ce3ea Davidlohr Bueso  2023-07-25  794  			cxl_set_security_cmd_enabled(&mds->security, opcode);
d2f706058826b8 Ira Weiny        2023-09-03  795  			enabled++;
d2f706058826b8 Ira Weiny        2023-09-03  796  		}
ad64f5952ce3ea Davidlohr Bueso  2023-07-25  797  
044c18e2de67a0 Dave Jiang       2024-11-06 @798  		cmd->info.effects = le16_to_cpu(cel_entry[i].effect);
                                                                ^^^^^
Unchecked dereference

044c18e2de67a0 Dave Jiang       2024-11-06  799  
d2f706058826b8 Ira Weiny        2023-09-03  800  		dev_dbg(dev, "Opcode 0x%04x %s\n", opcode,
d2f706058826b8 Ira Weiny        2023-09-03  801  			enabled ? "enabled" : "unsupported by driver");
4faf31b43468c5 Dan Williams     2021-09-08  802  	}
4faf31b43468c5 Dan Williams     2021-09-08  803  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

