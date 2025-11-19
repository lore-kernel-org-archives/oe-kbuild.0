Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8C6352FB1
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 12:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763556284; cv=none; b=XyTZBAEwzFZseCxzT3poB+hyUGLRvCkJkqKxSeoLam12Da06zWp1zdj7nHi9vuPdCJXGVi7hBngCDjcizPz8DGm1yI1p1D0yPrphvIp70oH+yOJTlXdPcMlXABHfIOrG1/wQUFjsC2uttCks6yRkCG6919Aulbd/ZO2RoqN+R9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763556284; c=relaxed/simple;
	bh=znvLF7equBBCsQNo3Wvx+9eMsLHSab8JSQ/D1BcsOZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=T25Pji1JdXFkl8y7K5UH1pz08Lu8tBGf2rNAuKZcTvQrIauyKlSTsY5WWa5Ur3uqIfBqscHrmCd1GLTe9/gZTbyBpXfWFlff141xKORR3k9hLxqCll8KyvI0F0MxDPN60/RbyJMN4szTJUHcsbtDLEMWtSzC8ACpSpDCcnaVaZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AINbB9xJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AINbB9xJ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so44905445e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 04:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763556281; x=1764161081; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vb/WHH6MVNHpgD8HWp2QmtT5QxY0dMuZGyv+c8piIz4=;
        b=AINbB9xJKTELXf8K4RIXoS+uC0S+gRD3a0PkaF77ajt7KVXTW1r6nZejZZxwQ5YnwQ
         gpYb16o08R9mrL7ul62czbJtCLqAbe+BRbNrxELV2J+pfWpxq7Xp/pKaZMlO3s8E/vBQ
         ep6Bz5MwVeVdzmDS1+19NpkXfXq5CDItmhxLDW3Jv6kbw1mEP5JKdxJFoxBici2rYRWZ
         dQZ9iN/ysEPT4B6oP8M8taFDSAJZmGPBG3OrxwigSWrYjVU+ypqX++X4pHYLc1dN6J0f
         VvVkzdfm5x1pbaTtIt/ieRHN1HTzxJWQpIdnX4gWQVljfeCfeuiaO0XV6NEUPX+PV5C6
         C76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763556281; x=1764161081;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vb/WHH6MVNHpgD8HWp2QmtT5QxY0dMuZGyv+c8piIz4=;
        b=H+Xr3WJjXVBjiYcJaMQ4QP64OlJq5JabtzMu7qQn6LT0SaeH+L7a8w7gg58800FFMN
         jgV15JfZ7lBmx+o6J7pXvJ5sBylpX2ESR84kA9QTrk4mqIT2kVqRaHP0ei45nsj+1XmI
         F1sHBnBUspsaTwdDwT4PdKHCjzWvWXhtkpbVBMDNR5LD8Psc4LqpYrcxI3MBXk7FevuM
         +ej+1inNiLS+70HC5JQwCx1GK+OEsS/Ne9Sooxeo0lkdqVfLqKJs/WFUV7G9aEu0P3o9
         Ro6BY/UlOwwf20N+gptsg4BoW76zwvRK0fQCsk+521H5STUkpZmHKJMPRA5oY3gU6Jv3
         LSvw==
X-Gm-Message-State: AOJu0YzbiTjWCgN772RNJL4ZJMDInSiv0HUazzI0K4bvHpa67ENOtp4f
	+FNkvCTheJ5AfhNCAYxU7tLuNn6JrgjugBde0f9Wb5Sd86qr3j/vtisA9639LHqM1CQGmt0dMsF
	dee0t
X-Gm-Gg: ASbGncsxBERv2UCMYAc63ZHkFUJ6gSymo0z2uyila1yvaa8IfcCmUWpBBcJ5iKyhfMT
	A1NHnvl9RFKhS7SkdIVATxHBEvBiW4PuBhdhOlrpUfDTrK/GujQyIHjch4n2B5+iuZ4iPEShs6h
	nhFnyiNlpszBnVvEdeOOEuPyddpSvHMXEgzZ+ikJPLmDgwM9YL+krVNz3XjOabKyyFBnmafZncJ
	OVattJ2D9Iz0ZklCGmeyw47gNXYyPmU0aukKCeefy7v72i5EyoZ8wGQhNSAMs8CD0RXrOQFDiE1
	Q9zc11erceC2+mJkBbGvDjt6fUAkB2H6+/Gq3OuOJk3KzGI2X21fGxpDcmQF282rlnxzOAHS/Or
	pGuYSvmkUKxaDM66g4MITBJpcnvdIn6gIgDVBUzae9jkrdL4+Xjm+a4DRV1s/5PT7s9+3JDxPmV
	Gytw4gx94sQBNY8PkfhtcQZd3ezho=
X-Google-Smtp-Source: AGHT+IH+SRQgfI4whxa9IoNU0Rarp9jo3DPA5bGSZXLbpbdHgT7D/SNsZlFT/IKmF36TzB+D3qSx9g==
X-Received: by 2002:a05:600c:3b87:b0:477:a0dd:b2af with SMTP id 5b1f17b1804b1-477b19ed467mr21820495e9.33.1763556280815;
        Wed, 19 Nov 2025 04:44:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477a9deeb96sm40177305e9.4.2025.11.19.04.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 04:44:40 -0800 (PST)
Date: Wed, 19 Nov 2025 15:44:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Gregory Price <gourry@gourry.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 04/11] memory-tiers: Introduce SysRAM and Specific
 Purpose Memory Nodes
Message-ID: <202511161706.ZqNHM1XU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112192936.2574429-5-gourry@gourry.net>
Message-ID: <20251119124436.vtS6Di2mo57azrQ304IP765Ve8BvcogYr6WprXRh9L8@z>

Hi Gregory,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-constify-oom_control-scan_control-and-alloc_context-nodemask/20251113-033247
base:   24172e0d79900908cf5ebf366600616d29c9b417
patch link:    https://lore.kernel.org/r/20251112192936.2574429-5-gourry%40gourry.net
patch subject: [RFC PATCH v2 04/11] memory-tiers: Introduce SysRAM and Specific Purpose Memory Nodes
config: x86_64-randconfig-161-20251116 (https://download.01.org/0day-ci/archive/20251116/202511161706.ZqNHM1XU-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511161706.ZqNHM1XU-lkp@intel.com/

smatch warnings:
mm/memory-tiers.c:737 mt_set_node_type() error: uninitialized symbol 'err'.

vim +/err +737 mm/memory-tiers.c

6fee6292300e00 Gregory Price        2025-11-12  728  int mt_set_node_type(int node, int type)
6fee6292300e00 Gregory Price        2025-11-12  729  {
6fee6292300e00 Gregory Price        2025-11-12  730  	int err;
6fee6292300e00 Gregory Price        2025-11-12  731  
6fee6292300e00 Gregory Price        2025-11-12  732  	mutex_lock(&memory_tier_lock);
6fee6292300e00 Gregory Price        2025-11-12  733  	if (type == MT_NODE_TYPE_SYSRAM)
6fee6292300e00 Gregory Price        2025-11-12  734  		err = node_isset(node, mt_spm_nodelist) ? -EBUSY : 0;
6fee6292300e00 Gregory Price        2025-11-12  735  	else if (type == MT_NODE_TYPE_SPM)
6fee6292300e00 Gregory Price        2025-11-12  736  		err = node_isset(node, mt_sysram_nodelist) ? -EBUSY : 0;

err not initialized on else path.

6fee6292300e00 Gregory Price        2025-11-12 @737  	if (err)
                                                            ^^^

6fee6292300e00 Gregory Price        2025-11-12  738  		goto out;
6fee6292300e00 Gregory Price        2025-11-12  739  
6fee6292300e00 Gregory Price        2025-11-12  740  	if (type == MT_NODE_TYPE_SYSRAM)
6fee6292300e00 Gregory Price        2025-11-12  741  		node_set(node, mt_sysram_nodelist);
6fee6292300e00 Gregory Price        2025-11-12  742  	else if (type == MT_NODE_TYPE_SPM)
6fee6292300e00 Gregory Price        2025-11-12  743  		node_set(node, mt_spm_nodelist);
6fee6292300e00 Gregory Price        2025-11-12  744  	else
6fee6292300e00 Gregory Price        2025-11-12  745  		err = -ENODEV;
6fee6292300e00 Gregory Price        2025-11-12  746  out:
6fee6292300e00 Gregory Price        2025-11-12  747  	mutex_unlock(&memory_tier_lock);
6fee6292300e00 Gregory Price        2025-11-12  748  	return err;
6fee6292300e00 Gregory Price        2025-11-12  749  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

