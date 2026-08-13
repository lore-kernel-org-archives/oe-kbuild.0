Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57893321A7
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 19:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786647957; cv=none; b=tQPUcXf2vryLBiCR2QdAwbdw3Guisf9fXXidB1Iaa2aEGf3ZEP4u7M1qOtWUpEXqNB6wpVFj46GS9zPTOnADTJKsYjUVGBOoOg6yhaE4XAZTQ2j27EspC0xBMX2VF/hRCkmzC6d3L9yxM3XAphUX5RaMHQzUWIwiYpYAkXocTDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786647957; c=relaxed/simple;
	bh=B2bnMqNqoYYuTkMqtL6g4MAmG3rWQieX91fm8hm4Sf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B2/PtiJxucmRfi/8nkkM+SAyS/Sk7Eu1ft8sepuNAoF4zJvU7ihVFwzVcLOSRJT/HUZzFWSPZ0eNsIaVCdWzexwGrbYd9hDVCfrbmdFgM4Ewu9uf2+F3WeGumeHoTQbBOADAi02RGmhC4AsUDU7uk6xPfKCJd+mUazU1PXecUf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ogxa5U1T; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ogxa5U1T"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f703a9d05so136359f8f.0
        for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 12:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786647954; x=1787252754; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T55vEoBWm7W+mkApMI66CBUWbz2M2GmccHPPbYJGC5s=;
        b=ogxa5U1ThthI1ID8o5uDKJ6IBY9SH4tLC9jf2iDLU5TFGOmoS6RnrVWoSL/yr9vtC9
         O+d8URgdCJJ1/XgROSY4HsxQIgunV7evrJQhoFr6cyZXiSyeaaWToScN+lnOOMal9Mkb
         ZGQO/UH+LX2wU+b0F9WS3Mg6espD1OGEdwB2Bn/gTrhCwt/V/i1wSwqZg6o0oHuaIRTX
         /e6rr8g1ET1RID81zqG/qXhD0R6+KjtBP2bzUyfwPlerLWDFUafHkVkQ+wNNNd60S7ok
         yyDIqIhGvCqytuIgNw7krYnJKul0Bhjpxw2hsbWoB9Refrd5UjEJ91i4iFvpgHOyBt+v
         4I4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786647954; x=1787252754;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T55vEoBWm7W+mkApMI66CBUWbz2M2GmccHPPbYJGC5s=;
        b=A3vZ/0YrahX+aFhjAW8YwsRv1QCZehnt2d8NDonbXiCt6V5QU+emfBDnCnSWJ3+qn/
         dIAnxmCQnMbgYlhK3NwkA0eDql2FYE0qYLwMd/K5Om89oAQO2BWT8noHcNTOEoWwGQRz
         Fbx8w8LuIHlqiF+HQ3RM8SiR7qPHgcShqEQx7dHwk+81huvzcj4fU3i5IxzgAREnosza
         38SEcG8bhpPVSXmDPhYkKLtU7bHxgwNmPZ9L0mFLcSSc/N9tX++G0oSh2kv8etFDVkOs
         QN2zPTLhWPYQReYQqoga64Th/dzoYQpwLliSKNy/toioUYgAf1dFJGPR9AoMw/ZK2h8p
         nG/A==
X-Gm-Message-State: AOJu0Yx2HnChzij1QBcmmA+Logh1+wgWak+PKsNL/qPnG1XqdfP5lgSA
	vqJQDRNmhiJSTGAMePlXqTDhedLM/4FdcBsrGhMWrKbXoLQnxnwq0ffQy/zU1EaD7YF2sZZe
X-Gm-Gg: AR+sD10c6XNGTNI9LCI5/ZXvFBTnm7hxFfC0ny6OgtVGrzaVMRBh9gUFhYqrkdHLSNk
	1+OMvuHJY9jradU2vvpKHUJgvlERgWBt5wyVzzoiS0ZBFBjtCo/O9LVldBWtUNudcBMAu2TULtA
	519+47nxtCg8/htb4leTFdsmLSm53WNRzav5j+znDNReQ16G7uiFW8Qpj4uXFQ49zNXlFus/Wgq
	FEaRuO2Ufgve6WloJHqTEZqs6i/0DLULULGz9mVeskWYgP4lPIWNxXl5Bz4UecMKmlwRhw15PG9
	kpEWZztUhH7NAste/4lTY0gxWvDXUKmph93xL8vHetlsjj/w1Bug8zfwHKMkUZ8kCMHUJFG+ihC
	DKm800PYHW3AjUgokbM+x6LSbjGZqJL8jeaOIE1CXCj0fGjDJpgKtapP6MDX+SnuvHcR2Wlt9rO
	gLnsuf6KtjbS//u1ghSX9Aqcb2Og0zwh0M1u62TidAWVkmtcezx8xxHJ9K
X-Received: by 2002:a5d:588b:0:b0:481:4fe8:696b with SMTP id ffacd0b85a97d-481607ba630mr387086f8f.29.1786647954032;
        Thu, 13 Aug 2026 12:05:54 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2b1d9bsm1382077f8f.24.2026.08.13.12.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 12:05:53 -0700 (PDT)
Date: Thu, 13 Aug 2026 22:05:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Michael Bommarito <michael.bommarito@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Subject: net/sctp/socket.c:7036 sctp_getsockopt_peer_auth_chunks() warn:
 potential user controlled sizeof overflow '8 + num_chunks' '8 +
 0-65531,4294967292-u32max'
Message-ID: <202608140244.f2Omwf4y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260813190549.GaFwNDghxDEGfxYnhRYjV2HybD92-3uvAnWvxKrEpO8@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d6d817622b0a9721e3cc404df3469171582be13
commit: 0cf004ffb61cd32d140531c3a84afe975f9fc7ea sctp: fix OOB write to userspace in sctp_getsockopt_peer_auth_chunks
config: m68k-randconfig-r071-20260813 (https://download.01.org/0day-ci/archive/20260814/202608140244.f2Omwf4y-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0cf004ffb61c ("sctp: fix OOB write to userspace in sctp_getsockopt_peer_auth_chunks")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608140244.f2Omwf4y-lkp@intel.com/

New smatch warnings:
net/sctp/socket.c:7036 sctp_getsockopt_peer_auth_chunks() warn: potential user controlled sizeof overflow '8 + num_chunks' '8 + 0-65531,4294967292-u32max'

Old smatch warnings:
net/sctp/socket.c:7042 sctp_getsockopt_peer_auth_chunks() warn: potential user controlled sizeof overflow '8 + num_chunks' '8 + 0-65531,4294967292-u32max'
net/sctp/socket.c:7086 sctp_getsockopt_local_auth_chunks() warn: potential user controlled sizeof overflow '8 + num_chunks' '8 + 0-65531,4294967292-u32max'
net/sctp/socket.c:7092 sctp_getsockopt_local_auth_chunks() warn: potential user controlled sizeof overflow '8 + num_chunks' '8 + 0-65531,4294967292-u32max'
net/sctp/socket.c:9018 sctp_wait_for_packet() warn: missing error code 'error'

vim +7036 net/sctp/socket.c

65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7006  static int sctp_getsockopt_peer_auth_chunks(struct sock *sk, int len,
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7007  				    char __user *optval, int __user *optlen)
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7008  {
411223c01a5116 Al Viro                 2007-10-14  7009  	struct sctp_authchunks __user *p = (void __user *)optval;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7010  	struct sctp_authchunks val;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7011  	struct sctp_association *asoc;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7012  	struct sctp_chunks_param *ch;
5e739d1752aca4 Vlad Yasevich           2008-08-21  7013  	u32    num_chunks = 0;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7014  	char __user *to;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7015  
5e739d1752aca4 Vlad Yasevich           2008-08-21  7016  	if (len < sizeof(struct sctp_authchunks))
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7017  		return -EINVAL;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7018  
c76f97c99ae6d2 Marcelo Ricardo Leitner 2018-01-08  7019  	if (copy_from_user(&val, optval, sizeof(val)))
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7020  		return -EFAULT;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7021  
411223c01a5116 Al Viro                 2007-10-14  7022  	to = p->gauth_chunks;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7023  	asoc = sctp_id2assoc(sk, val.gauth_assoc_id);
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7024  	if (!asoc)
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7025  		return -EINVAL;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7026  
219f9ea4d3b797 Xin Long                2019-08-19  7027  	if (!asoc->peer.auth_capable)
219f9ea4d3b797 Xin Long                2019-08-19  7028  		return -EACCES;
219f9ea4d3b797 Xin Long                2019-08-19  7029  
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7030  	ch = asoc->peer.peer_chunks;
5e739d1752aca4 Vlad Yasevich           2008-08-21  7031  	if (!ch)
5e739d1752aca4 Vlad Yasevich           2008-08-21  7032  		goto num;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7033  
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7034  	/* See if the user provided enough room for all the data */
3c918704921412 Xin Long                2017-06-30  7035  	num_chunks = ntohs(ch->param_hdr.length) - sizeof(struct sctp_paramhdr);
0cf004ffb61cd3 Michael Bommarito       2026-04-15 @7036  	if (len < sizeof(struct sctp_authchunks) + num_chunks)

This is a m68k-linux-gcc build (32 bits).  sizeof(struct sctp_paramhdr)
is 4 and sizeof(struct sctp_authchunks) is 8 so on a 32bit system if
num_chunks U32_MAX - 4 then the "sizeof(struct sctp_authchunks) +
num_chunks" math could overflow.

65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7037  		return -EINVAL;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7038  
5e739d1752aca4 Vlad Yasevich           2008-08-21  7039  	if (copy_to_user(to, ch->chunks, num_chunks))

It doesn't really cause a problem these days because copy_to_user()
doesn't accept sizes more than INT_MAX but it would trigger a warning.

65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7040  		return -EFAULT;
5e739d1752aca4 Vlad Yasevich           2008-08-21  7041  num:
5e739d1752aca4 Vlad Yasevich           2008-08-21  7042  	len = sizeof(struct sctp_authchunks) + num_chunks;
8d72651d86e9c7 wangweidong             2013-12-23  7043  	if (put_user(len, optlen))
8d72651d86e9c7 wangweidong             2013-12-23  7044  		return -EFAULT;
7e8616d8e7731b Vlad Yasevich           2008-02-27  7045  	if (put_user(num_chunks, &p->gauth_number_of_chunks))
7e8616d8e7731b Vlad Yasevich           2008-02-27  7046  		return -EFAULT;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7047  	return 0;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7048  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

