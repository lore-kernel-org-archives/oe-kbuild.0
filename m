Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DBD189F3B
	for <oe-kbuild@lists.linux.dev>; Sat, 10 May 2025 10:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746871911; cv=none; b=c5uMD2i3xQ1NyF11eG5vQUlTSscQpyxHqgTd0/XgViBHwism/KFCyKAlRPPi6XGrjtgcr9mPZnsinviEx2RrxSeKNCkOuSoq5pjRbhIyzPZF4eLymIFmL7tOFki6qkLb8c7O1FSeyvMep2gmU2hu7z3x1NJJ+JbJ2gxP/IkVW8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746871911; c=relaxed/simple;
	bh=TAdkEWmft0UsuHt29v3Eue/35LhyOeiZPHuU7JfGkcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCR3/ovuRMAcg6X4WfkBHJHOZEW0gNs8SQswN9nKIQGk/SWwS0RMCaOO/CnYaCYZdATeHEKz5523tl0ZxejzSdmlmklZgu2Ze1gAjE8hI6Igw1bRMJBWgL69UAie+nniT3N8WEovQvCfF1c/z0y5Z5tuI5HGoZ8Haev1vzDNwbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RO/4TSfF; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RO/4TSfF"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a1f9791a4dso758859f8f.0
        for <oe-kbuild@lists.linux.dev>; Sat, 10 May 2025 03:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746871907; x=1747476707; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bEGLI17Sg6m1LZBmMFTStRe876DURecVpE92sDlyUxQ=;
        b=RO/4TSfFdKZZ057GnrHqO0FvhZjhy288FThmd27fQHc6U6Hbc4dfL8ffb+i+Anchfp
         HGff2YXSELvWe0ZQAYJSuf0FIFICT7GwK+sS5M19ijbB0/6pwcj05qSI3rTcArOKVs0A
         jSHrUL1fsDX1oqIvl2qIf9a6TpJmzxqJCYwoPRpJwjxpWRV/R/pg2AwE0OTB0yabjlSH
         sLULbvMIV1o8m1VYmYzeXkG16FDj0dmH4GO0ngfAHoOsBDpsMY8FfAGQNZ646Q55JMO+
         vDv+AcwpBr1tyjMIUQBqTcqKXXfQ99ecifLywTjoBuDCrKkY5zF6CT1Xn2QyqgcMSNdd
         uzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746871907; x=1747476707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEGLI17Sg6m1LZBmMFTStRe876DURecVpE92sDlyUxQ=;
        b=vU+jIvwsICJlX4JE/iMibcNo94kUL8UCFzsn5A1Bk8/yI0gyL1FD36ssjSFVHKeHM/
         KYLKu32fwqtSFpUlAbsV0jbexTyXqlV5XN3Dc2w+zqckzncdvF6Jwqb6T8wsgxzhOflJ
         EEatAtbsWbu5y7nfrWv/bQuN78QqxsJfaZey9vquPTpf0fZ48XXuL+kDRO8tI2gs7ybn
         bxKY5yrvN3yebPzuKcgnMwfSf0DYfGb/U0iIPgrw40jU/NgpUU36pdQNF29HEkO+odQl
         1qvL58XLQ6dhIub45nIgIUXh7dlVCPCfLHkt1VeKs35B2dXybgD91eo42yo1KAhJF97K
         my1g==
X-Gm-Message-State: AOJu0Yx1lUKjNf4ZoWstBbPY+4kpJDsBi2pxruBDuU6wu8R0xKagTjRd
	yM8WGJNh8aYSea2EnisH/16feVQID29CovJXS3d5227v0+YPav5425uLJD+nIAU=
X-Gm-Gg: ASbGncupJpkz0JsYMyw0s/UUktLIjtuSmlXRpd/cUxYeoxCLIrjTAz9XFkuzBUIjID4
	sLVmSd71oUKbw33WMU+qDI0s0AVc49gKv9xgOAFsyjjiyANI/YH23Wjdur/sk9E9Ls6uOXLZr/+
	4DVLQeF/bTj3AUiEsqRzO/1vukSbSLoyXir9KvTwElsMVz+h4hNTEFsdUlQYhzFikPHR+q7VJuC
	YYYLGtjapOYZ5dOdsMElPzOBh+FKPAal5A+lFqKEEBV3jyrKBnKRYSgDP/+BEIJAK1a4J7m8Uvz
	lctcBCR5wrAhZPzNKtREne7nLGzKdsJ3oCJrRReCDLOH0k2oJNcyX1l/
X-Google-Smtp-Source: AGHT+IFPRV3WrM4qUPjKyQq2cTWDQTQifuNlkOsms5GePA9Os7cAR7/IKQemogvl9WbUSLD3uLc2Xg==
X-Received: by 2002:a05:6000:2506:b0:391:22a9:4408 with SMTP id ffacd0b85a97d-3a1f64386eemr5180967f8f.16.1746871907101;
        Sat, 10 May 2025 03:11:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442d780ffb7sm31422365e9.1.2025.05.10.03.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 03:11:46 -0700 (PDT)
Date: Sat, 10 May 2025 13:11:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [tip:x86/boot 10/10]
 arch/x86/boot/compressed/sev-handle-vc.c:104 do_boot_stage2_vc() error: we
 previously assumed 'boot_ghcb' could be null (see line 101)
Message-ID: <aB8mXZ_TxDuLa7Jr@stanley.mountain>
References: <202505100719.9pE7wDfB-lkp@intel.com>
 <CAMj1kXHyVh7KwNyekd8ZAATufnMHyzyMismVf2xW8F=LfBJviQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHyVh7KwNyekd8ZAATufnMHyzyMismVf2xW8F=LfBJviQ@mail.gmail.com>

On Sat, May 10, 2025 at 09:57:23AM +0200, Ard Biesheuvel wrote:
> Hi Dan,
> 
> On Sat, 10 May 2025 at 09:43, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > Hi Ard,
> >
> > FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/boot
> > head:   ed4d95d033e359f9445e85bf5a768a5859a5830b
> > commit: ed4d95d033e359f9445e85bf5a768a5859a5830b [10/10] x86/sev: Disentangle #VC handling code from startup code
> > config: x86_64-randconfig-161-20250510 (https://download.01.org/0day-ci/archive/20250510/202505100719.9pE7wDfB-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202505100719.9pE7wDfB-lkp@intel.com/
> >
> > smatch warnings:
> > arch/x86/boot/compressed/sev-handle-vc.c:104 do_boot_stage2_vc() error: we previously assumed 'boot_ghcb' could be null (see line 101)
> >
> > vim +/boot_ghcb +104 arch/x86/boot/compressed/sev-handle-vc.c
> >
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04   96  void do_boot_stage2_vc(struct pt_regs *regs, unsigned long exit_code)
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04   97  {
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04   98   struct es_em_ctxt ctxt;
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04   99   enum es_result result;
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04  100
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04 @101   if (!boot_ghcb && !early_setup_ghcb())
> >                                                     ^^^^^^^^^^
> > Check for NULL.  Should the && be ||?
> >
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04  102           sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SEV_ES_GEN_REQ);
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04  103
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04 @104   vc_ghcb_invalidate(boot_ghcb);
> >                                                                    ^^^^^^^^^
> > Unchecked dereference.
> >
> 
> On success, early_setup_ghcb() will assign boot_ghcb, and so it is
> only called if it was unset.
> 
> The logic is a bit clunky here: for clarity, it could be rewritten as
> 
> if (!boot_ghcb) {
>   early_setup_ghcb();
>   if (!boot_ghcb)
>     sev_es_terminate(...);
> }

Ah.  Thanks.  I didn't even think that early_setup_ghcb() might
set boot_ghcb().

regards,
dan carpenter
