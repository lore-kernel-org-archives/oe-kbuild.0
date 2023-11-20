Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FFC156DB
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 11:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hvL1rShS"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2c876e44157so20194961fa.2
        for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 03:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700480260; x=1701085060; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MZIed20myqRdbcMeT3thn6ww1DDx5LCF3uR7K7QRtfc=;
        b=hvL1rShSbeLThwCwKdvdW8E2UZ5zgfziDDUdn2Wlaa1z4jtGImwwCjNRV4cIJQAWbn
         SQ0abwi51h7lUoqgDl8pTr8rC2m5koIO9bs+xJ242fbd5UHgQoGwX/stylYOp7CGOW1T
         E2OLbFcSJtn3NWAzblR20lEkFW2liiChoDyj7yqhbjKoxM8Uziy5/j4UflPe6wrQaTcr
         XVzdclwD/koJ9ACbtLzndROE7ofb5KEQuqGsIRWTYqW6T2cr1bH1W8/sgFnDoJKly6oj
         hEjuXcMweC/HQ2SvwlwvniwjQDbc9B/yKarNtvTJRU9prqwCLRxqJkPqCEiqXZ5+jVLV
         gGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700480260; x=1701085060;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MZIed20myqRdbcMeT3thn6ww1DDx5LCF3uR7K7QRtfc=;
        b=vndvHDaf/ZMDGK/vwxy3XgAFAkjKl8neYdXxX9ohkCjwMkDhqibrCTyJIrR3ukVJ3d
         S9bVEoiuTbO4uTWro/KWfdFplMVvJHCiBpPWkkzrXBNEdtpa7U+lHFOWRWBRqRCYxQyR
         7pNsf2QSwZb+COV9rA4v3nRKM5d0CEgogrZJRbftjjUGAq6R+2Rzr5goDRMTGSUaCm5D
         DujA/bfFmne4a7MXz/WDryPL566D0TcUGCD7rdBNllb9JkFIRTPD83nXY1w+nWrEVNkY
         hXcZjvDLkfCHvyGdKWybKWF2u3uaXkLhL+J/L/zHcYQH5O8qGKSJ5vPZQ6bBB+QwN9gO
         WusQ==
X-Gm-Message-State: AOJu0YwdhGcnhT9ctU/F++IUbxrskMmcOtG2w0+zocnYg6TC4N2w6Rfr
	uPp9r9M2Qo6YZAPMhjVu5M3NkXQCPrXg6W69YGE=
X-Google-Smtp-Source: AGHT+IGGTItXrf3sK7N75TOeyUnjHHjJo7LIflALIyE6dnLWdAqSo24P8hznKdL1CMQlTjJjofNQsA==
X-Received: by 2002:a2e:9101:0:b0:2c5:32b:28fa with SMTP id m1-20020a2e9101000000b002c5032b28famr6236910ljg.30.1700480260583;
        Mon, 20 Nov 2023 03:37:40 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m7-20020a7bcb87000000b004063d8b43e7sm17026277wmi.48.2023.11.20.03.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 03:37:40 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Nov 2023 06:37:37 -0500
To: oe-kbuild@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [amir73il:sb_write_barrier 22/27] fs/super.c:432
 activate_sb_write_barrier() warn: sleeping in atomic context
Message-ID: <3bdea3f2-83d6-4aca-967c-534b81dd2c62@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux sb_write_barrier
head:   cd86c0c62d0c78b5d3d58e234474d52c3d264ec0
commit: 42ddf79eeaed36d5d2cdcc608e1056b2fc28faf6 [22/27] fs: implement 'vfs write barriers'
config: i386-randconfig-141-20231111 (https://download.01.org/0day-ci/archive/20231111/202311111958.Lz6WWFnX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311111958.Lz6WWFnX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311111958.Lz6WWFnX-lkp@intel.com/

smatch warnings:
fs/super.c:432 activate_sb_write_barrier() warn: sleeping in atomic context

vim +432 fs/super.c

42ddf79eeaed36d Amir Goldstein 2022-11-20  421  int activate_sb_write_barrier(struct super_block *s)
42ddf79eeaed36d Amir Goldstein 2022-11-20  422  {
42ddf79eeaed36d Amir Goldstein 2022-11-20  423  	struct srcu_struct *write_srcu = sb_write_srcu(s);
42ddf79eeaed36d Amir Goldstein 2022-11-20  424  
42ddf79eeaed36d Amir Goldstein 2022-11-20  425  	/* Already activated? */
42ddf79eeaed36d Amir Goldstein 2022-11-20  426  	if (sb_write_srcu(s))
42ddf79eeaed36d Amir Goldstein 2022-11-20  427  		return 0;
42ddf79eeaed36d Amir Goldstein 2022-11-20  428  
42ddf79eeaed36d Amir Goldstein 2022-11-20  429  	spin_lock(&sb_lock);
                                                        ^^^^^^^^^
spin lock

42ddf79eeaed36d Amir Goldstein 2022-11-20  430  	write_srcu = sb_write_srcu(s);
42ddf79eeaed36d Amir Goldstein 2022-11-20  431  	if (!write_srcu) {
42ddf79eeaed36d Amir Goldstein 2022-11-20 @432  		write_srcu = kzalloc(sizeof(struct srcu_struct),  GFP_USER);
                                                                                                                  ^^^^^^^^
Sleeping allocation.

42ddf79eeaed36d Amir Goldstein 2022-11-20  433  		if (write_srcu) {
42ddf79eeaed36d Amir Goldstein 2022-11-20  434  			init_srcu_struct(write_srcu);
42ddf79eeaed36d Amir Goldstein 2022-11-20  435  			/*
42ddf79eeaed36d Amir Goldstein 2022-11-20  436  			 * cmpxchg() provides the barrier so that callers of
42ddf79eeaed36d Amir Goldstein 2022-11-20  437  			 * sb_write_srcu() can see only initialized structure.
42ddf79eeaed36d Amir Goldstein 2022-11-20  438  			 */
42ddf79eeaed36d Amir Goldstein 2022-11-20  439  			if (cmpxchg(&s->s_write_srcu, NULL, write_srcu)) {
42ddf79eeaed36d Amir Goldstein 2022-11-20  440  				WARN_ON_ONCE(1);
42ddf79eeaed36d Amir Goldstein 2022-11-20  441  				cleanup_srcu_struct(write_srcu);
42ddf79eeaed36d Amir Goldstein 2022-11-20  442  				kfree(write_srcu);
42ddf79eeaed36d Amir Goldstein 2022-11-20  443  			}
42ddf79eeaed36d Amir Goldstein 2022-11-20  444  		}
42ddf79eeaed36d Amir Goldstein 2022-11-20  445  	}
42ddf79eeaed36d Amir Goldstein 2022-11-20  446  	spin_unlock(&sb_lock);
42ddf79eeaed36d Amir Goldstein 2022-11-20  447  
42ddf79eeaed36d Amir Goldstein 2022-11-20  448  	return write_srcu ? 0 : -ENOMEM;
42ddf79eeaed36d Amir Goldstein 2022-11-20  449  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

