Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFAE210FA
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Feb 2024 08:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708330940; cv=none; b=VLg9+LN63AHX4S/zzlaE28Iged1McpUpuWgxVbUwOo4PtiDHMiazvnOtTQvrbW1y9z6WNCcnxAZwhHDP6+8s9E4SIUScf/bNIB8+vwWGMH6G27VgQUgNvplNWzHOJKzFJ47WGanLcbm9Orkt/M4ONjnO0NtoAVZw/0PyDJixl5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708330940; c=relaxed/simple;
	bh=nGitsSxjPk+gBIGLQ3qxvow1rCE7hQe9MOGZfZ0PH3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=P0XatHxSHvVHJ4dg71SP1KxD93/EyvzjjBK8MtpafiB1+J9KMJfl7B9/AjuF0CQ/OjlwAB5puVwl1GDLdZ7JQgQCcXDE1TU0XCwbqxp+7p0HK64QK5GQN2F8llQG6gT1cLOevcoC+u8RhGPmAKEPD146JpMT6LiYQ4ebwALf7TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TovorWg8; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TovorWg8"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a3e3a09cd79so113525966b.3
        for <oe-kbuild@lists.linux.dev>; Mon, 19 Feb 2024 00:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708330936; x=1708935736; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aJawKhMKgZfK3H+o45cb6KDvj97UBnzXFXRTiTe4vLc=;
        b=TovorWg8er2FldWvG5yeA+uVKat09JLqamMWedhwWaLWPbepP4t21CtEnniFSP+zUc
         2NUNM40RQXtX7ws5wzlN1bfO4UrUF/mAYcXTYJLtFNWREnArfIqSn2sooPjnvx/FWWBN
         uWKXTM7l0ZNMhD1EyRC/8lQGZ1ASVGajq2o6rU+bCS9fowhV1n52w/g95y2UEYkV5Zhq
         DKono4T6HNRroRV6zgRRWrobdOS5cp41EvV23mEiPtRb5dJvBkgdZS9yzkSYxry8zIUl
         L0nGGxR47wO1tKvzJ9JUpACJSsskhjjNFfm5eLsJywkFRE7eKTaehJHxmpBvAfUfZifT
         RB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708330936; x=1708935736;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJawKhMKgZfK3H+o45cb6KDvj97UBnzXFXRTiTe4vLc=;
        b=bidRWRrR1EaAOjvLhpMCbswJ+26WJjpHUKzVu7F2qlljPwo1LXActXkDTncPkkIbF9
         EaGJJJnBwoHZ5ZvZ5zDVLQVkT8SIdvhNMFpSCPiMyHZSLVOS8CT4GPcaODHKMnn/EUeK
         W96C7C+dDqScpTLDbkXr9hCnpxFOuNtIzlFxmPnJgQttRhKbPYLYTWjqhtV5lZSVBXGo
         I3KxxODrnagujHhc3LmO2qmXOHljN1dlBkN1gxtrut85jTolFOAJNlVHx85AAfeA7y3J
         ce1lIq4jMKe51s/bAv8vgIEOcW9FrIBiL1NMw6qXWCRBjJjcpua0vRvVdx+e7LcURvS0
         1JTg==
X-Gm-Message-State: AOJu0YwBUHACFp96Mz7RUvc5QKJmrpcqq1CrYG8Yq1ogi+I3u7ZhhPYF
	+Fmmxc+0AQWcBxoHVWiMkcW4eskz+5+W6ijHP86aKE3O3ZBQSezKNaECRB9KCkawOCUcKT1bcpn
	K
X-Google-Smtp-Source: AGHT+IGl/ITfmjq0RpjNkokRRLvKEhrU7NvfHwqSMU7MFfOC3zR13Xzxi+jsjB0P34SMxHIUAdW/cQ==
X-Received: by 2002:a17:906:1388:b0:a3e:79f7:d218 with SMTP id f8-20020a170906138800b00a3e79f7d218mr2415837ejc.43.1708330936473;
        Mon, 19 Feb 2024 00:22:16 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id y2-20020a170906470200b00a3d0dd84276sm2685297ejq.184.2024.02.19.00.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 00:22:16 -0800 (PST)
Date: Mon, 19 Feb 2024 11:22:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jeremy Kerr <jk@codeconstruct.com.au>,
	netdev@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Matt Johnston <matt@codeconstruct.com.au>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Liang Chen <liangchen.linux@gmail.com>,
	Johannes Berg <johannes.berg@intel.com>
Subject: Re: [PATCH net-next 06/11] net: mctp: provide a more specific tag
 allocation ioctl
Message-ID: <95174361-e247-4792-866b-d77152659fd6@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <424009ba3e320ae93eb6bd44ef5e474aa5c9221f.1708071380.git.jk@codeconstruct.com.au>

Hi Jeremy,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Kerr/net-mctp-avoid-confusion-over-local-peer-dest-source-addresses/20240216-163203
base:   net-next/main
patch link:    https://lore.kernel.org/r/424009ba3e320ae93eb6bd44ef5e474aa5c9221f.1708071380.git.jk%40codeconstruct.com.au
patch subject: [PATCH net-next 06/11] net: mctp: provide a more specific tag allocation ioctl
config: parisc-randconfig-r081-20240218 (https://download.01.org/0day-ci/archive/20240218/202402181713.OQAPBmZC-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402181713.OQAPBmZC-lkp@intel.com/

smatch warnings:
net/mctp/af_mctp.c:389 mctp_ioctl_tag_copy_from_user() warn: was && intended here instead of ||?

vim +389 net/mctp/af_mctp.c

28828bad95a357 Jeremy Kerr 2024-02-16  356  static int mctp_ioctl_tag_copy_from_user(unsigned long arg,
28828bad95a357 Jeremy Kerr 2024-02-16  357  					 struct mctp_ioc_tag_ctl2 *ctl,
28828bad95a357 Jeremy Kerr 2024-02-16  358  					 bool tagv2)
28828bad95a357 Jeremy Kerr 2024-02-16  359  {
28828bad95a357 Jeremy Kerr 2024-02-16  360  	struct mctp_ioc_tag_ctl ctl_compat;
28828bad95a357 Jeremy Kerr 2024-02-16  361  	unsigned long size;
28828bad95a357 Jeremy Kerr 2024-02-16  362  	void *ptr;
28828bad95a357 Jeremy Kerr 2024-02-16  363  	int rc;
28828bad95a357 Jeremy Kerr 2024-02-16  364  
28828bad95a357 Jeremy Kerr 2024-02-16  365  	if (tagv2) {
28828bad95a357 Jeremy Kerr 2024-02-16  366  		size = sizeof(*ctl);
28828bad95a357 Jeremy Kerr 2024-02-16  367  		ptr = ctl;
28828bad95a357 Jeremy Kerr 2024-02-16  368  	} else {
28828bad95a357 Jeremy Kerr 2024-02-16  369  		size = sizeof(ctl_compat);
28828bad95a357 Jeremy Kerr 2024-02-16  370  		ptr = &ctl_compat;
28828bad95a357 Jeremy Kerr 2024-02-16  371  	}
28828bad95a357 Jeremy Kerr 2024-02-16  372  
28828bad95a357 Jeremy Kerr 2024-02-16  373  	rc = copy_from_user(ptr, (void __user *)arg, size);
28828bad95a357 Jeremy Kerr 2024-02-16  374  	if (rc)
28828bad95a357 Jeremy Kerr 2024-02-16  375  		return -EFAULT;
28828bad95a357 Jeremy Kerr 2024-02-16  376  
28828bad95a357 Jeremy Kerr 2024-02-16  377  	if (!tagv2) {
28828bad95a357 Jeremy Kerr 2024-02-16  378  		/* compat, using defaults for new fields */
28828bad95a357 Jeremy Kerr 2024-02-16  379  		ctl->net = MCTP_INITIAL_DEFAULT_NET;
28828bad95a357 Jeremy Kerr 2024-02-16  380  		ctl->peer_addr = ctl_compat.peer_addr;
28828bad95a357 Jeremy Kerr 2024-02-16  381  		ctl->local_addr = MCTP_ADDR_ANY;
28828bad95a357 Jeremy Kerr 2024-02-16  382  		ctl->flags = ctl_compat.flags;
28828bad95a357 Jeremy Kerr 2024-02-16  383  		ctl->tag = ctl_compat.tag;
28828bad95a357 Jeremy Kerr 2024-02-16  384  	}
28828bad95a357 Jeremy Kerr 2024-02-16  385  
28828bad95a357 Jeremy Kerr 2024-02-16  386  	if (ctl->flags)
28828bad95a357 Jeremy Kerr 2024-02-16  387  		return -EINVAL;
28828bad95a357 Jeremy Kerr 2024-02-16  388  
28828bad95a357 Jeremy Kerr 2024-02-16 @389  	if (!(ctl->local_addr != MCTP_ADDR_ANY ||
28828bad95a357 Jeremy Kerr 2024-02-16  390  	      ctl->local_addr != MCTP_ADDR_NULL))
28828bad95a357 Jeremy Kerr 2024-02-16  391  		return -EINVAL;

Should be &&.  This function will always return -EINVAL.  I haven't
looked at the context outside of this automatically generated email but
it suggests a failure in our test process.

28828bad95a357 Jeremy Kerr 2024-02-16  392  
28828bad95a357 Jeremy Kerr 2024-02-16  393  	return 0;
28828bad95a357 Jeremy Kerr 2024-02-16  394  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

