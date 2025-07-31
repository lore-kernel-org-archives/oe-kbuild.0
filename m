Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7471FC7D2
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Jul 2025 15:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753977466; cv=none; b=pvQMszRL3GGm0T69+PKcG08exr8DFDHC1L7DMW5z75nUEYCX6YhsJTjlT14M+uBsw3DYBxdttgIRaWDmxeLVYaSD+AQtj/ciSEGUr/BSLxQPcOp2fdHeq1D53tf9AjkYRoAIBPlw4lgCdz3kthhMK+L0d1QZFvxWjlJm1tQeJ0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753977466; c=relaxed/simple;
	bh=zXqYwYUo5V5xtf38XeLw47tBDZGEMXc9yoHG17JPGAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=IIW3VKygfylp6TJGXX13mzjJykKk5cBY8lZbf64t9xrZE46ph6a2skZxTGhmVZysHKx8b7yyStAMYWC0Cldh3QJlZ/wb/N09vweLx2rYtvDCWCfFFMclNl1fIxbY5wluzNVmk7Ru9RE8hdU/BmXYc1o3AIR0RdHnf1LyU6BpLLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dZgpWGcy; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dZgpWGcy"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b78127c5d1so482690f8f.3
        for <oe-kbuild@lists.linux.dev>; Thu, 31 Jul 2025 08:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753977462; x=1754582262; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mwEehyIvfFZxsxz6xG2f5ye6bcAONjKwPvSd6npT8hI=;
        b=dZgpWGcy5TqOEM3Hv2/aGJIDJUN/+hAA3AoLI/n+85J09XI0pq5g1lRicruhXPEWQs
         2X2/3SFMfjufHUFxqChqxXX6cLWZJydl3jfmGEiLvfqEtmzll5TpEnI5mCv0m1+s7ZZl
         41zfhggJ+UPDB4dVf86ziSzYvedy6iP77IkRs+NipFm7LI3vuADyEFrZNu/Uf5peE53M
         lG97lfEg/jqFh39JPXUo18uefh5NcatD8Jjcui5nJru7VVG+TvKffZGxHrfl1Qz6C/iC
         FDwFSdfs6M96xIKwEHn+8qoQqyHUNw780DV202UqykRZZzUjzgC0GtMIZotPZBloBWIG
         yHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977462; x=1754582262;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mwEehyIvfFZxsxz6xG2f5ye6bcAONjKwPvSd6npT8hI=;
        b=qYPR66XIgV8ymcFKVAqe6bKjS5tmwfNC8ur0xaC5mplvDmOh/zsLyihBxPLK3RtspN
         I3iOCccLjl+QZW9Wb/zINd2bmVG87FeVsexmANVvhDKMevnuqDd7bLiknACeA6FoW4t1
         6iexyKxMB9VYOo7UDKogfaWlJWDKHBIbNLp0/uCydOxjILbrcs9G7V9Q3YfxWbNqrMq9
         QVpQZsRzOyxQXvuSbNUk6cusexbtUTrQcw+K0QjZrS+09tB5AuAaFwQjESUEGha47Vkb
         QuOgg3TmZjwcCjjRruCnrTHis/3jFBuX/fDLwBmlYzKvK4LfSpXCWY4hOHH6rOtsg2+Z
         CnSA==
X-Gm-Message-State: AOJu0Yxk8go2x91wUzefBoxn1TfhXQVTQVBeqvU7DSO6mNqt9O+PHUbC
	tovEBYyrycZ0npKgrsEpRwYphyxPN8AZKkegEwQcgm+KNUWfvmez/aNC9SU+NZtqhbTmFgLwnXT
	lQ4Q5D9RXUg==
X-Gm-Gg: ASbGnct2yRt8PYyvUrRYeyByBBiAdnNSQ4T8NEoWJ4qb5SrcoeTdDWDL41RFwPQ7im9
	4eegsWQvoBqS8/5oerVDODwjkR4ppnkxzNIvFZX7IxJyREeSV68QkgTMCulmlxuWhs/uyBswkFS
	6cjmvBTqpSGCRtQaXWr5aEn9VymKLVu05Nj/0OecuwODHDmWjSESgcyH6MMrzbDWiMOUtBZ6FTg
	Zj5npb9nRlmvP9oCHxklZuzzinhew7tiM1fyUzOybsK6cwUAfu6M3x0Kcjz3dk4yzGuYByPVYH/
	XeM13897cKtkW924uyRgY+LYQ/PbzQl58le5UvzzB3g7iQR/tGUZs/8eGvd49cFbOo1B+WFTXXI
	bGn0KdJqYHDimL27Kk+S4ricdpSo=
X-Google-Smtp-Source: AGHT+IEJypDs3Srfs5Ta2SryXW3PqrPZ2bjD8Bn1TfOmElhJKEUhoyptNdeCt1IpSC2bX7kUHiSQGg==
X-Received: by 2002:a05:6000:2f85:b0:3a6:d93e:5282 with SMTP id ffacd0b85a97d-3b79501dd3fmr7085161f8f.59.1753977461645;
        Thu, 31 Jul 2025 08:57:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589edfcdf4sm32052495e9.11.2025.07.31.08.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 08:57:41 -0700 (PDT)
Date: Thu, 31 Jul 2025 18:57:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, KP Singh <kpsingh@kernel.org>,
	bpf@vger.kernel.org, linux-security-module@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	bboscaccy@linux.microsoft.com, paul@paul-moore.com,
	kys@microsoft.com, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, KP Singh <kpsingh@kernel.org>
Subject: Re: [PATCH v2 08/13] bpf: Implement signature verification for BPF
 programs
Message-ID: <0b060832-4f55-486a-8994-f52d84c39e38@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721211958.1881379-9-kpsingh@kernel.org>

Hi KP,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/KP-Singh/bpf-Update-the-bpf_prog_calc_tag-to-use-SHA256/20250722-052316
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250721211958.1881379-9-kpsingh%40kernel.org
patch subject: [PATCH v2 08/13] bpf: Implement signature verification for BPF programs
config: m68k-randconfig-r073-20250723 (https://download.01.org/0day-ci/archive/20250723/202507231202.8rYZJ8D1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507231202.8rYZJ8D1-lkp@intel.com/

smatch warnings:
kernel/bpf/syscall.c:2797 bpf_prog_verify_signature() warn: 'sig' is an error pointer or valid

vim +/sig +2797 kernel/bpf/syscall.c

c83b0ba795b625 KP Singh           2025-07-21  2782  static noinline int bpf_prog_verify_signature(struct bpf_prog *prog,
c83b0ba795b625 KP Singh           2025-07-21  2783  					      union bpf_attr *attr,
c83b0ba795b625 KP Singh           2025-07-21  2784  					      bool is_kernel)
c83b0ba795b625 KP Singh           2025-07-21  2785  {
c83b0ba795b625 KP Singh           2025-07-21  2786  	bpfptr_t usig = make_bpfptr(attr->signature, is_kernel);
c83b0ba795b625 KP Singh           2025-07-21  2787  	struct bpf_dynptr_kern sig_ptr, insns_ptr;
c83b0ba795b625 KP Singh           2025-07-21  2788  	struct bpf_key *key = NULL;
c83b0ba795b625 KP Singh           2025-07-21  2789  	void *sig;
c83b0ba795b625 KP Singh           2025-07-21  2790  	int err = 0;
c83b0ba795b625 KP Singh           2025-07-21  2791  
c83b0ba795b625 KP Singh           2025-07-21  2792  	key = bpf_lookup_user_key(attr->keyring_id, 0);
c83b0ba795b625 KP Singh           2025-07-21  2793  	if (!key)
c83b0ba795b625 KP Singh           2025-07-21  2794  		return -ENOKEY;
c83b0ba795b625 KP Singh           2025-07-21  2795  
c83b0ba795b625 KP Singh           2025-07-21  2796  	sig = kvmemdup_bpfptr(usig, attr->signature_size);
c83b0ba795b625 KP Singh           2025-07-21 @2797  	if (!sig) {

This should be an if (!IS_ERR(sig)) { check.

c83b0ba795b625 KP Singh           2025-07-21  2798  		bpf_key_put(key);
c83b0ba795b625 KP Singh           2025-07-21  2799  		return -ENOMEM;
c83b0ba795b625 KP Singh           2025-07-21  2800  	}
c83b0ba795b625 KP Singh           2025-07-21  2801  
c83b0ba795b625 KP Singh           2025-07-21  2802  	bpf_dynptr_init(&sig_ptr, sig, BPF_DYNPTR_TYPE_LOCAL, 0,
c83b0ba795b625 KP Singh           2025-07-21  2803  			attr->signature_size);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

