Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8614D191F98
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Mar 2025 07:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741333339; cv=none; b=Ztbnoly8rzdFetWLumGHayFF9qcxLmadyDmMhvKCicWquSUpYF9XPvAtECqqBRZP1U5F5+SYS3+PFKmr69GSDYyxP83i0aRxXPxFNJlwhXfzsIf4DCGCT1S+ubCHhEtUMRgDCCc4V6j5YtQN2nJ0m5arf94yEgMibQFqVgYwS2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741333339; c=relaxed/simple;
	bh=rcJ1lmO/IX1zD43I1E6cNy0D8ecjrHhn+vqY2kZqKao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MYnAQysOAhc7G4VPHKtxTyb8Jh5+m+6BHfS7D2EqSU38Ghy9hb24z4LMKd5gUh1k31o7xC1C/2fKSOkEfXAJfz61oXuX017aqItEFiY6TK71GSIkgjnY1eX1GRLYOrMMFm+0Mm6TpFNGnl7QfPfS8TnuYVhtAtzpRFkuSIfmEv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zzg0V2hf; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zzg0V2hf"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-390f5f48eafso855295f8f.0
        for <oe-kbuild@lists.linux.dev>; Thu, 06 Mar 2025 23:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741333335; x=1741938135; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T3D+fMvGVb3mMpPYsm6B35F+EmsCAhR76/cxNumM6ZE=;
        b=Zzg0V2hfFh5I6A1QpUO6+yHhX4M/lNKjMVm8ZypEOsFuGtYiSWAipq3d8ZUg4Yu5MQ
         uMA4npWQgQE0tRIX7ij0o8rqcWB4M0edlrRDDF+0E39htSbKO5ahadtq4v3sL9MbCuNz
         7BEwc+kugT+UlquRdNjNIMSu+j5I4Lu5Levk/BHZFkSw+cGwZqYTyMSQ0LLgw0oFEjbJ
         CJMMyDhk5v8XmhwQhFM9Lljfup6pmu29EnNGrOXEFR3xJcIhI1Euepgiidm/HMPWv91E
         Wr9nKskFvIAiEO3Ia0qqR5i0rIsltqmlVRzt1r1Myx+JVbX2+NMgXjpaY8KfuyYOj8gL
         1Fng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741333335; x=1741938135;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T3D+fMvGVb3mMpPYsm6B35F+EmsCAhR76/cxNumM6ZE=;
        b=fpeMFtnSF/Dhspu+m2b9Lcd2KK06vdjnaxRPpdlVpJSpyMdXS10HCE65skRld7Qw8p
         O3mj69tfiSL9R4DZLFNsLha1RtdgxzScGqGTcWV0KLX+idArdiRpBUd18Rl3J/rWr5ho
         wxWtZPDaBYGh6bA0+WPFIDEbwskmbmB/y78FoMkC1fcyPmAsBNFUOfoUYoLZQqVNgMT7
         5kDKQx0pv7SEcJLA0urs/WFAE8s9bFFrcwPah6AktY3Bq4o0I/PYMT/L9D79AG+Ya8wN
         2CJDRsKEWEfa4BKxIYeHQIgtzkkPZwVw1VxJY+3b+aacMpTJ2pELuFhsh3Q+ZUM3gq1S
         GC7g==
X-Gm-Message-State: AOJu0YwiBU34aSMXa/N0unsnKReSIgQ1cLd3zdxOJJMyBocNJQsPuJO/
	nYaXEQdhEfEDacrnGnVbdiwXrge3tbdvlWX1Mjx64AaWvhOVf8s1SSb1KHQT8HZWzbwXQ0g8WjC
	w
X-Gm-Gg: ASbGnctTBGYv3hEYh8FRALK3vaqqk+6FhurPsCgX+njXXCklKy2YmnMC6un6ZN/huNQ
	i1ID3cNbgt7HD4z3IZ40XIIu6kL/JdrwZrG+MWbf/La9cIPHFiBtbNB2mAgnXof4kh2cLiEJLlr
	y+L5eF6NQLXFmWsIw+A8lO6NZa+4PkYU/HI/2WhZbnIFWDlJaQ1G6aTLwiaXhCXr8JZRPAmudbu
	kZ/f9Ts0gm4qK+9AZaditveW0h1FFXrog/yjF5LWwlfkGtZTr8jRICbWdfL3DQacevKaKJexHGD
	18INozB2A4MEAw9M4mp5ESHlSlNLRvUUnw6LtHddLCBmNCai8Q==
X-Google-Smtp-Source: AGHT+IHfnwA04H+Aec+4skHp4NDTpM4b0Nh6+dTOkvb//KqgU9tCJJRPmho7Xn5RwJWkyFqnJJ8R9w==
X-Received: by 2002:a05:6000:186b:b0:391:231b:8e0d with SMTP id ffacd0b85a97d-39132dc5632mr1464220f8f.39.1741333335635;
        Thu, 06 Mar 2025 23:42:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c106a1asm4493649f8f.100.2025.03.06.23.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 23:42:15 -0800 (PST)
Date: Fri, 7 Mar 2025 10:42:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jeff Layton <jlayton@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [cel:nfsd-testing 35/53] fs/nfsd/state.h:788 nfsd4_try_run_cb()
 warn: test_and_set_bit() takes a bit number
Message-ID: <e223e751-072a-43b7-ab21-485f94fe3f2f@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   312e8dc9f5f591a4927b4786a25840ef381c97d9
commit: f94ac2bc823ffbabc5c88c38e63a1e6635f8a6cd [35/53] nfsd: prevent callback tasks running concurrently
config: x86_64-randconfig-161-20250306 (https://download.01.org/0day-ci/archive/20250307/202503071428.Y4kljIky-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503071428.Y4kljIky-lkp@intel.com/

New smatch warnings:
fs/nfsd/state.h:788 nfsd4_try_run_cb() warn: test_and_set_bit() takes a bit number
fs/nfsd/nfs4state.c:3235 nfs4_cb_getattr() warn: test_and_set_bit() takes a bit number
fs/nfsd/nfs4state.c:5428 nfsd_break_one_deleg() warn: test_and_set_bit() takes a bit number
fs/nfsd/state.h:788 nfsd4_try_run_cb() warn: test_and_set_bit() takes a bit number
fs/nfsd/nfs4callback.c:1315 nfsd41_destroy_cb() warn: clear_bit() takes a bit number
fs/nfsd/nfs4layouts.c:347 nfsd4_recall_file_layout() warn: test_and_set_bit() takes a bit number

vim +788 fs/nfsd/state.h

f94ac2bc823ffb Jeff Layton 2025-02-20  786  static inline void nfsd4_try_run_cb(struct nfsd4_callback *cb)
f94ac2bc823ffb Jeff Layton 2025-02-20  787  {
f94ac2bc823ffb Jeff Layton 2025-02-20 @788  	if (!test_and_set_bit(NFSD4_CALLBACK_RUNNING, &cb->cb_flags))


NFSD4_CALLBACK_RUNNING is BIT(0) so this actually tests BIT(1).  It's
a double shift bug.  Which works out fine so long as it's done
consistently and the BITs never go above 5.

f94ac2bc823ffb Jeff Layton 2025-02-20  789  		WARN_ON_ONCE(!nfsd4_run_cb(cb));
f94ac2bc823ffb Jeff Layton 2025-02-20  790  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

