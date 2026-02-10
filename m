Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950682D372D
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 19:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770750397; cv=none; b=Th7Fd1+vzMPMtAV0hDIBOpBSgKkWqeQyTvlSVM8vZgms/5fT9XOZVCCblL/vLf3tST/jlSJMa0YVc54TPg1NA9QSNH52ImdtTLU8B+xpSYq0GGgPRgNyov7FxJmZpYxqVeqMKHZu7i47rYzwfcfH4FgjqmI/u/T2OCBRqRNduA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770750397; c=relaxed/simple;
	bh=FpNxwj2Ove9qq8y9dneb4UAY3WhuIrfGjKFnfTjoEng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FeOkoO//V8dzc/YzvlYrPxvr5JE4lFtVxrpqLL/qa1jZ0Ddsxy3yXF1hTE2KmY2D4odIQRqbGhU2pQH6f6FbzHr5jHH/O4xK9BJNdtFGbx+QZacJFGgW+9fMxyToC+FDRrBKyTztF/fGsEL7MRq3cIIqTdYGppfAGq8THAIEkJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yie9dUuX; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yie9dUuX"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso60362185e9.2
        for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 11:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770750394; x=1771355194; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oidvJvSGv96EIuxfwG6/8JSOZzaFXHw/hXwcZ5qdD3s=;
        b=yie9dUuXn5/7sgijgFs+qsuS1Ddk9zma6borHNwEbsqT5J0Eb08qRHDG1MxwpUcuTI
         Jrc68m3kAhvGHwyyqXlX+aXxTAk4cFMBSZRmw1Ogz+jIaNq9uR6BBmzpcW5u0EcRbF7C
         w4r4pUS1GeCBb2M4BKnUoSP3/jSOW+cjsuojeW0UjEdP9e+qnJPkB8jx6lELMnyCV/co
         duBNHtgPr5Okq/ZlDpCl7qsZrtyFbDs2ZsPQD+NMNdM/E6m+Bnl4S/X81vPKA6So4WJd
         bIsen3AOOBzXy1nQDkFuv8a4rO8UY4dFQqE583uS7IvW5Qn1RRLPozZx1IeL9+ATrAEA
         barw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770750394; x=1771355194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oidvJvSGv96EIuxfwG6/8JSOZzaFXHw/hXwcZ5qdD3s=;
        b=lz5RmcOPXCq/bKoKOB8l+gSH0rN275Jo/xZ0FSEF7faEz5Nxj7qSpTAa0+NKGqKFMi
         W2tCNUsZ7/2+Rwdd58MBp14/6pniWtPgx4v26SIWwB+kjzj4A4E77NX28ePgtBFBpUH1
         A6XVIe7xTyPsCRUSKupIbMqhBltHSiosr71gxf4SAg10gD5YfpvobdPJngmGuYtdt5bF
         u/J28ziZJB1Eu901fcMEjtIuEA25TwrQHw5spl/KEhqVJ6J43D1Rg3G++FP1dBeU2jGX
         8DNW9u5pn3OB4M55YI6N6p6j0U+eIETghxYqRfLTvf3Kn7maGq0VlkOZlHFBm1kaul3U
         NA5w==
X-Forwarded-Encrypted: i=1; AJvYcCW0yXYQn8Rz+DhrOW06uaBvbE19ZEQbOjjB5yYt8DZw1cvUd0URF85xI/cdjWTsT2sXy5IN9N+Q2cw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+XDQltqEqFzpOsDyOMNzQTIp1FBe5u+sAvkJiJqTJnsaI4EB/
	FuFtZwiIoXDmCB3eQ3t++90fXs1a+XayLM+KrLz7Iojl2tKE0RN8V2zqiD6NzzbMH+A=
X-Gm-Gg: AZuq6aIbR6wmwo7Hg8tTr3MsxZQZejtM9Kjeg9wONXj0R6tYoXU75vb856YtZI05cGK
	hmPCIpTPZYyLJa/EvW/L1X6CwjpaCFfkzrHnVSQJn3jGvwBN6kbWET0Nzp+LVGHGt6QQOI4+rLN
	HqDDrYpWrFkKe4clV9DzaDVxE/TcJa10ZwAxLk34qVWjzwZccF0L8nQFSGjhH44LnbtwlOOwSvi
	8sEfFi3tne8IXsG09HV9pIHonEnpuGfc/NdX0nvB07LctX8swqt/JrfD66sICDG3BFgNORx4xMa
	41dvOwjk8qHzqdhnVtnP36XGjAWH1zmaNYtzfK53MuIuUsu8IcHrSgw/bCuduIhJOoipvBba0bY
	cL2L2UrGUZomluJ4UJhFv8jUR7uQ0kNIh9txyKYv6zWIMLAfTxwjvVhgY3Edtv/7XBTUt2qcI6o
	6TljP+MmZoXRKP4mjDiTZkvgc6Fn87QZYqOL4txV4=
X-Received: by 2002:a05:600c:3b87:b0:47d:4047:f377 with SMTP id 5b1f17b1804b1-48350836495mr56979655e9.36.1770750393811;
        Tue, 10 Feb 2026 11:06:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835a62baa9sm1670715e9.4.2026.02.10.11.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 11:06:33 -0800 (PST)
Date: Tue, 10 Feb 2026 22:06:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev,
	Dan Carpenter <error27@gmail.com>
Subject: Re: include/net/libeth/xdp.h:1315 libeth_xdp_process_buff() error:
 we previously assumed 'xdp->data' could be null (see line 1310)
Message-ID: <aYuBtpTvdsK0R-om@stanley.mountain>
References: <202602101205.Ce7wRn0m-lkp@intel.com>
 <c6f5022e-9dca-4d36-a821-8ff3261b5c0c@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6f5022e-9dca-4d36-a821-8ff3261b5c0c@intel.com>

Yeah.  Intel created the zero day bot before lei was invented.  You
weren't supposed to recieve this email because we filter out the
obvious false postives and resend the others.

The zero day bot can't use the cross function database because it
doesn't scale well enough.

regards,
dan carpenter

On Tue, Feb 10, 2026 at 05:16:04PM +0100, Alexander Lobakin wrote:
> From: Kernel Test Robot <lkp@intel.com>
> Date: Tue, 10 Feb 2026 12:30:48 +0800
> 
> > BCC: lkp@intel.com
> > CC: oe-kbuild-all@lists.linux.dev
> > CC: linux-kernel@vger.kernel.org
> > CC: Tony Nguyen <anthony.l.nguyen@intel.com>
> > CC: Alexander Lobakin <aleksander.lobakin@intel.com>
> > CC: Jacob Keller <jacob.e.keller@intel.com>
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   8a5203c630c67d578975ff237413f5e0b5000af8
> > commit: 93f53db9f9dc4a16b40ecd18e6d338ad57e4b670 ice: switch to Page Pool
> > date:   3 months ago
> > :::::: branch date: 4 hours ago
> > :::::: commit date: 3 months ago
> > config: i386-randconfig-141-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101205.Ce7wRn0m-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > smatch version: v0.5.0-8994-gd50c5a4c
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202602101205.Ce7wRn0m-lkp@intel.com/
> > 
> > smatch warnings:
> > include/net/libeth/xdp.h:1315 libeth_xdp_process_buff() error: we previously assumed 'xdp->data' could be null (see line 1310)
> 
> Sounds like a false positive, see below:
> 
> > 
> > vim +1315 include/net/libeth/xdp.h
> > 
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1288  
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1289  /**
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1290   * libeth_xdp_process_buff - attach Rx buffer to &libeth_xdp_buff
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1291   * @xdp: XDP buffer to attach the Rx buffer to
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1292   * @fqe: Rx buffer to process
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1293   * @len: received data length from the descriptor
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1294   *
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1295   * If the XDP buffer is empty, attaches the Rx buffer as head and initializes
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1296   * the required fields. Otherwise, attaches the buffer as a frag.
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1297   * Already performs DMA sync-for-CPU and frame start prefetch
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1298   * (for head buffers only).
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1299   *
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1300   * Return: true on success, false if the descriptor must be skipped (empty or
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1301   * no space for a new frag).
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1302   */
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1303  static inline bool libeth_xdp_process_buff(struct libeth_xdp_buff *xdp,
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1304  					   const struct libeth_fqe *fqe,
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1305  					   u32 len)
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1306  {
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1307  	if (!libeth_rx_sync_for_cpu(fqe, len))
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1308  		return false;
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1309  
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12 @1310  	if (xdp->data)
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1311  		return libeth_xdp_buff_add_frag(xdp, fqe, len);
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1312  
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1313  	libeth_xdp_prepare_buff(xdp, fqe, len);
> 
> libeth_xdp_prepare_buff() *always* initializes xdp->data, so there's no
> way that prefetch() will get NULL.
> 
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1314  
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12 @1315  	prefetch(xdp->data);
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1316  
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1317  	return true;
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1318  }
> > 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1319  
> > 
> > :::::: The code at line 1315 was first introduced by commit
> > :::::: 3ef2b0192e8ba133f597919632bd9cf196076f0b libeth: xdp: add helpers for preparing/processing &libeth_xdp_buff
> > 
> > :::::: TO: Alexander Lobakin <aleksander.lobakin@intel.com>
> > :::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>
> 
> Thanks,
> Olek
