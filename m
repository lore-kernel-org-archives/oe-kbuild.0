Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAA91BDA9C
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Oct 2024 17:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729618142; cv=none; b=pHWNlFYVki9ACzyG1o8jAWhHPdMcRUAq+lrWZGpueRIVFcB4ydYvdMvxwOmZtdhClCeL9/MRqG8s/13JcVRgjFv3e1J2cjcxOwjpbyl03bp6TknrXiLWmTDIJ8h4+ZZ7kgdpUWHSPXTLZ2XWnVfsCCPS6/KOYv4hApawvtfRXB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729618142; c=relaxed/simple;
	bh=VV6QKVF0gjjf8hHfaPPcTEmbDgUc5yY0WnBeyT5UWGA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=stxdTw/Mant8fKvSG/maCe/cS0ZfXxhQhD6ggyn+k+s8Ns6ExdmFeHCZup9TAYbeWS7x41ctGApzKBB8i9ovSU57+Y3NRpIg3XeMGXS1SZu/Kv1EAG1muQbU18aZDXmIUKoLFQFV0NKHXglCIQxqBZsR4aIQsw65UHX54uiLlME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NJtCalYr; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NJtCalYr"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e35a643200so119733927b3.0
        for <oe-kbuild@lists.linux.dev>; Tue, 22 Oct 2024 10:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729618139; x=1730222939; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=88wx3+4q+1K9X5I+DhSnOFWj6qOcMcVFHAzwKhzigV8=;
        b=NJtCalYrEzaVUyAm/iP/cVGjTlvX4FAyOfjrHF4s0pwnx6qLHFhpW1bjbPREbMJ4pR
         QydL+m4rEfOdimNne/7XB5OWfULI+/Puqe8MrUZbLpb2Tk9Y8jmPxSPbd7Z/o1DBN1xS
         F0uy++AUjKyFfVoX+sd48/4Kvg2/MF97cZ3jmnXIRAfAv4mBnQ7A1cq/et2VgYhFJt5G
         BfTPCeZyFvCPyTyFZYpM4sILh0Kbky4m5nn1FB7m706Mwz6RxGjhTLpK6MPVFGu7zywd
         rIn1ZVV90mqnEPFqGu+UQRgE7LCxwyuyxApj5z58I+7cOBxI/xc+UZxoqhbLnkZkroZH
         9igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729618139; x=1730222939;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=88wx3+4q+1K9X5I+DhSnOFWj6qOcMcVFHAzwKhzigV8=;
        b=uVYCVAWLYieN/hlkw1GENEjaXwU4q0MvPI8uR6yt/4C4xQUF0zBwcQ2PB4VqM6voJh
         67qdfgFwMtYptvffXdaOJ/fKNkmQ3SN0zFp7/mka0wgidlQCaecFjfM9EAFxMBYCqzOA
         IXxlX8hPfaFRYe5afT+9mAtEQQWr0oUVJwwMJkmrBCeQaFC4VngCR8MXfID6nGCMQHOE
         3+rkXhxjVT4y5zvg/+e4qXDFsCUI25+6W6v6/pHilq7K5B7IDXAXYDGZY9PcqTdZH3Ah
         0duOL9sdiSgUF0iLR0rBzzkOZ3470z3/Rlp6VuIaBmwr4Fxebz6ujUBgoq9mSINqghwc
         I7tA==
X-Gm-Message-State: AOJu0YzOHROqJqkCYDr9Lo0TYUCUU+cDNm3EARz21YINYinIY2dJnVEM
	ef5Ey8leq3gMhXt5mIgX65RIsa9+TLK3mLK5RV7J1UXDtui2CZMW4tF+CE8Bln7U8Ny7nxK4BYg
	BAg==
X-Google-Smtp-Source: AGHT+IFdc0ZQv7mh7e81tsPtMekWG2+yIBem7weGPBwgYcNYPCIjb5/j3ncVZ+x2Nweve08TuyHo7YHd8LQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:23c6:b0:6de:19f:34d7 with SMTP id
 00721157ae682-6e5bfbd6b2cmr1234057b3.2.1729618138968; Tue, 22 Oct 2024
 10:28:58 -0700 (PDT)
Date: Tue, 22 Oct 2024 10:28:57 -0700
In-Reply-To: <148feb5b-cdd8-4065-8570-d0304383cc62@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <148feb5b-cdd8-4065-8570-d0304383cc62@stanley.mountain>
Message-ID: <Zxfg2bTkTgObpexL@google.com>
Subject: Re: arch/x86/kvm/svm/sev.c:454 __sev_guest_init() warn: missing error
 code 'ret'
From: Sean Christopherson <seanjc@google.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Brijesh Singh <brijesh.singh@amd.com>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Alexey Kardashevskiy <aik@amd.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Liam Merwick <liam.merwick@oracle.com>, 
	Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Oct 21, 2024, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   3d5ad2d4eca337e80f38df77de89614aa5aaceb9
> commit: 88caf544c9305313e1c48ac1a437faa5df8fff06 KVM: SEV: Provide support for SNP_GUEST_REQUEST NAE event
> config: x86_64-randconfig-161-20241016 (https://download.01.org/0day-ci/archive/20241019/202410192220.MeTyHPxI-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202410192220.MeTyHPxI-lkp@intel.com/
> 
> New smatch warnings:
> arch/x86/kvm/svm/sev.c:454 __sev_guest_init() warn: missing error code 'ret'
> 
> 88caf544c93053 Brijesh Singh         2024-07-01  452  	/* This needs to happen after SEV/SNP firmware initialization. */
> 88caf544c93053 Brijesh Singh         2024-07-01  453  	if (vm_type == KVM_X86_SNP_VM && snp_guest_req_init(kvm))
> 88caf544c93053 Brijesh Singh         2024-07-01 @454  		goto e_free;
> 
> Hard to tell if this is an error path or not.

It's an error path.  Luckily, the fallout is only that userspace will be confused,
e.g. KVM doesn't continue configuring state thinking that pervious steps succeeded.

I'll send a patch.

Thanks!
