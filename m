Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79DA1E2853
	for <oe-kbuild@lists.linux.dev>; Sat, 10 May 2025 07:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746863032; cv=none; b=jIEyhWBNrqYeS7DCkCARm01Z5RZA9LfIZOalKPdhLtb5DB4sI4GbXYGOwMIYWqqKErdrpxyPuixMTdgnJuYz7Y58f+dveRPqnDcVKK+AEqrk+SkuPmbGaN/UzdHOQxvbQe8jwdrrctwSmXM2a/7SVBnK3VWTQ/BS5r5z4PJ441E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746863032; c=relaxed/simple;
	bh=gVwu5i5dr8Gu8f8RQwH56pS50hW/bWmE75LzhrJPSX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GCutYISS4GUBRaDq9myUvHtaOjr7RW9ECzYkk49X2TQFsaQFq9ewip5kZYk7eHpDK4MepnlaA2+XtcsEWu+Z8AQ1rsPT3YHSV6mWH3C8bA+f5sw6PKMtvNS86bt0/VxXemFcllad3flSk+rse/qIXg988CmXIfmyb86+UU4+Kbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RMo+D7vj; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RMo+D7vj"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a1b8e8b2b2so1256348f8f.2
        for <oe-kbuild@lists.linux.dev>; Sat, 10 May 2025 00:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746863028; x=1747467828; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zgxyHav/FDfAPqF2ubFj/kOjw60kxGTa94/J4F6aQhQ=;
        b=RMo+D7vjgGoPNckz5Mr/Pv89Urgfzw739KKo1eHecN/rHPcLBp1nPNvzCfqA9Gilcg
         0PnD7wGlp2UAXrmkfiRVxcGuJLojpQa8ctYGHlKfEeBcyElqif8lK7nP6Z2fwR3mjqP8
         /uP98f39SjkrOTg12uw5PXSfJy6khcqt6ZOnny025sL9PKSQUSTaDeJWP/AfnUp6xEMo
         epAMFmTph1HeQOQ41k7ELpebwbGqJpZQRXJSzhGTizQskGckQBKVG6Z9GiALp/iwOu+v
         zJvvGem+nzAuoTGK9uTDBIxFnaznQPN8/lssmP1XT2xN7MDAt+rNdhckIT+JQqxRA+85
         rdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746863028; x=1747467828;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgxyHav/FDfAPqF2ubFj/kOjw60kxGTa94/J4F6aQhQ=;
        b=dB6chgvSHvCMnqZfCB25rin9P3vqNaLBNvMHRXhGExiAoTGIa0DbwI/9qSukiGK4HY
         xIsEKG+m3l+S6TK6tGwmpiqlLTREqedj1rMANploqjnOWOBBS5sRZldlXO9kEhah3VF1
         5pIvj/kAMAXkIqF4UhKfH17OjFA3GEZp/ccUgZL4PNlRJyxpHlEoDJIlT/y7hmtilIbW
         TZSiV9Na7KV98gvrndwl5nJsBGdDm1e0VKqPBYsbHAgwCEmmIFESfpBS1hUzY3vGB90u
         mfal3uzyJ85Q6QkA+bdLYCH2mBfSS+hUeN8oyNlBIJDA3fcyxzyj7hOjwOCvNB+BLPvO
         GwQw==
X-Gm-Message-State: AOJu0YymAJrSfKUtscHbBdUZ3TmTyHgSKWxa4z782dIcSU1SeJWCEeXO
	vkHZXRy+k6Zd4Hr+r/mlg+he/PrxQJD7So7lCeT2AeX7rnkDMv9vZ+8pzOxhOGp3X8Utbq9vs8P
	d
X-Gm-Gg: ASbGncsZ97atm7c7xiHCCjb+aX6dx+ax6VYoFnwzBXsItqWw78f6dLnHdLr9sLW/seu
	yP74mNMUzWyN5nepxktuH0jFoQz06RPuJEXHeudQsx8hwCnHRiNZwbLY6pAvmmYhiPJbNI6/1M4
	HdYGzoDdfXIZPCsVqgjU34PgerUWLCFdnXdidMqNFv0mrghW57j2iMF6+dDvS/e0yajJHXWjoT3
	Sv9mbFjjWLUoM5cIJuYJGxpwSv4ZXG3Ul6I+vmoib/vUCmTwr1Y9HqV/oeONNsp02gLkpEsddHQ
	Gkrcj+FR6RYELnMxVOy3LVOXQPr1rzeegD6WZGrX1HgXNHFw4SYSfd3H
X-Google-Smtp-Source: AGHT+IEYxL7W6rw3MZmtN8Hifi8g47H7dZD22sCgXBrSPKpmdOCfDEnqQwAFYZ9z9qgI8K5Jh9yNrQ==
X-Received: by 2002:a05:6000:186e:b0:39d:724f:a8f1 with SMTP id ffacd0b85a97d-3a1f64279e0mr5124295f8f.10.1746863028389;
        Sat, 10 May 2025 00:43:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f57ddd2dsm5596666f8f.9.2025.05.10.00.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 00:43:48 -0700 (PDT)
Date: Sat, 10 May 2025 10:43:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: [tip:x86/boot 10/10] arch/x86/boot/compressed/sev-handle-vc.c:104
 do_boot_stage2_vc() error: we previously assumed 'boot_ghcb' could be null
 (see line 101)
Message-ID: <202505100719.9pE7wDfB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250510074344.PZIj0J37rewxB3i32wzs3z9jgWOKaXBIZER1zgAnKzI@z>

Hi Ard,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/boot
head:   ed4d95d033e359f9445e85bf5a768a5859a5830b
commit: ed4d95d033e359f9445e85bf5a768a5859a5830b [10/10] x86/sev: Disentangle #VC handling code from startup code
config: x86_64-randconfig-161-20250510 (https://download.01.org/0day-ci/archive/20250510/202505100719.9pE7wDfB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505100719.9pE7wDfB-lkp@intel.com/

smatch warnings:
arch/x86/boot/compressed/sev-handle-vc.c:104 do_boot_stage2_vc() error: we previously assumed 'boot_ghcb' could be null (see line 101)

vim +/boot_ghcb +104 arch/x86/boot/compressed/sev-handle-vc.c

ed4d95d033e359 Ard Biesheuvel 2025-05-04   96  void do_boot_stage2_vc(struct pt_regs *regs, unsigned long exit_code)
ed4d95d033e359 Ard Biesheuvel 2025-05-04   97  {
ed4d95d033e359 Ard Biesheuvel 2025-05-04   98  	struct es_em_ctxt ctxt;
ed4d95d033e359 Ard Biesheuvel 2025-05-04   99  	enum es_result result;
ed4d95d033e359 Ard Biesheuvel 2025-05-04  100  
ed4d95d033e359 Ard Biesheuvel 2025-05-04 @101  	if (!boot_ghcb && !early_setup_ghcb())
                                                    ^^^^^^^^^^
Check for NULL.  Should the && be ||?

ed4d95d033e359 Ard Biesheuvel 2025-05-04  102  		sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SEV_ES_GEN_REQ);
ed4d95d033e359 Ard Biesheuvel 2025-05-04  103  
ed4d95d033e359 Ard Biesheuvel 2025-05-04 @104  	vc_ghcb_invalidate(boot_ghcb);
                                                                   ^^^^^^^^^
Unchecked dereference.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

