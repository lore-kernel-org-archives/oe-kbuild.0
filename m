Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF1A1C8630
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Oct 2025 22:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759962753; cv=none; b=cdUVAoUa9AC2X6AUwlhlj3SWZ2Fxx716EuFsfRNkJwpuUFLSpKXUBW06TcQZfI3wX2e27kHDidB6DPLJTN//HXXzrqoGzHx0gEwbMyk/rhozvc1TFihDkbnQthD9qFIB8y9NocHUhzpP4OQJkG9GuD57aQ3lbcBB6TVAdepsTdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759962753; c=relaxed/simple;
	bh=QLJvDD80Ts+jq/Te/fByXHFw2lX7qriJtxUTxcdfGYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lNYWT9v957j7DvSkLlrVeZVHAY1+ws17y1dPafqUVGk56TGtscC8a751TIfeuu/lvqWlkweaqeOCX1ey076J8jAb37+6oJyK/b34uTGxQr8Ls0QmYaJ0+pbrYgBvl8eU/lcLpy7tbIKusIn05Czh81mIBk0jGqfkS9lvhckbxp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BCo1ahlk; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BCo1ahlk"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-71d6083cc69so3614057b3.2
        for <oe-kbuild@lists.linux.dev>; Wed, 08 Oct 2025 15:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759962750; x=1760567550; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQg/oGPX3QlPO44vwiPmFn7QHJjEMDGpRp1ZFhGCDj0=;
        b=BCo1ahlkmDFOAuh31L0qDjpjXuyhQKT6iUvvnC0KfmE3i7Jsm8WxxOCNSaA/kE++3l
         m2ByAGGSxJlK0VueC8iqFTSuyGTj53cpzSQg0TNU8dEms1qLJJDEVEZFysn0puKrXwAi
         AMOZci35qy0Ywl1oC5y//mdzn9cBcANqWf+n0PnupVW6iuf4jgDhnaCmNqo/6jNYoozb
         YGdcZ6l8JjtSxBhJrAKDZslTqdXKanUWh30md9O1+I69CGzpFp3AGsoIGCdz8xSc0DJ6
         fqCzOnbopZ4nVTyokwHp7imb+Q8Z8baTZpBZW3WaacSj+PR2wSYGUUJ433eTgsT79sxa
         i2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759962750; x=1760567550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQg/oGPX3QlPO44vwiPmFn7QHJjEMDGpRp1ZFhGCDj0=;
        b=cgzUyrf5ldBdhDsG8cRfdfGqH1I8ZCXHmgycSIG2vMv8IIVkjlexZ2AT9Rm704lYeo
         6E3+not0850oktQPahzPdbblpzmv7bwVVM59E1/BrAWCBWalboc265pr2pcAbX1PkzZ7
         NBSbDHRTPz1FeRPsgDO29/Q03pTDa0hKZqCn11CZncPuD/7ebK9azCASjsYS8G6Mbvuq
         QjIuOkT4UvzKUQnEtqhz6BdMqa9NC0T63WEA7APjuWApi6cokkBN5E7z3vlGYVR+x4zf
         Q1WfSzCtULJ7XYcZdgEEhcwEVGvXBELkGykfHohi3Tw6Q5JFDPDr7UgkuL3xlqNBmNvv
         ZrdA==
X-Gm-Message-State: AOJu0YxKArs1aJNpfPT2/wE0ky7hYoihGNlORBmOG4TQv5+9nRNjAI0F
	txpNvf8OzeFn3UrgphhHAB0u79mlpcnFkNpGcL7qGTkgc6eHE8U3B3jLxTsqq0jyh54ozKiYJp6
	HhfeN27xzgvPxLWa03ZNMNKzUwaD/Qwg+FPxNZoK/
X-Gm-Gg: ASbGncv7xmo/ggcjv2NXnO1kf274Eo8qmtcozahumXdYPDPrvBRk9RWXk/7z37DhpUl
	Ie9soC1S4RgPaqV63pJvIu1yo/JoOOww5IJOTKGkg/pqjZnSn3LmhGq5B9X7xyeBU2hdJwbce8P
	fNEYyxmHCsMamBZv3AzC6T7W+oUCQnj20DhPX29FGU9Zb6AxAi7+qRbQgqyG4KLc5OtCjbjv25y
	t/4wJ8sigbvm00+Z6CyKIhldVDaeOdGy19057/s6kDRHfSmfJT5UNElXBoIriqkaEvqfEwHsfo+
	DmY=
X-Google-Smtp-Source: AGHT+IHIwhJ1jTa6pSoNA6/xh10XCnJ12TGkOcCTYPDGo29d1Uylhw3j/X7DZaX30WkFO3YvYercS8T1QZ1hYdEvctA=
X-Received: by 2002:a05:690e:1551:20b0:635:4ecf:bdcc with SMTP id
 956f58d0204a3-63ccb964b4bmr4231044d50.46.1759962749615; Wed, 08 Oct 2025
 15:32:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250930172850.598938-1-jthoughton@google.com> <202510041919.LaZWBcDN-lkp@intel.com>
In-Reply-To: <202510041919.LaZWBcDN-lkp@intel.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 8 Oct 2025 15:31:53 -0700
X-Gm-Features: AS18NWACWefjyXnJ3mzO_5c1LrSHUfnzIGfip6tiGf7K_b7r41zRxk-Vv_BIoCI
Message-ID: <CADrL8HXOPOhWXa9o36m5wh-YJyVoMOXyj4R0_7EdUQ6nhJ-avQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: For manual-protect GET_DIRTY_LOG, do not hold
 slots lock
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 12:33=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Hi James,
>
> kernel test robot noticed the following build warnings:
>
> url:    https://github.com/intel-lab-lkp/linux/commits/James-Houghton/KVM=
-selftests-Add-parallel-KVM_GET_DIRTY_LOG-to-dirty_log_perf_test/20251001-0=
13306
> base:   a6ad54137af92535cfe32e19e5f3bc1bb7dbd383
> patch link:    https://lore.kernel.org/r/20250930172850.598938-1-jthought=
on%40google.com
> patch subject: [PATCH 1/2] KVM: For manual-protect GET_DIRTY_LOG, do not =
hold slots lock
> config: x86_64-randconfig-161-20251004 (https://download.01.org/0day-ci/a=
rchive/20251004/202510041919.LaZWBcDN-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202510041919.LaZWBcDN-lkp@intel.com/
>
> New smatch warnings:
> arch/x86/kvm/../../../virt/kvm/kvm_main.c:2290 kvm_get_dirty_log_protect(=
) error: uninitialized symbol 'flush'.
>
> vim +/flush +2290 arch/x86/kvm/../../../virt/kvm/kvm_main.c
>
> ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  22=
55     n =3D kvm_dirty_bitmap_bytes(memslot);
> 82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  22=
56     if (!protect) {
> 2a31b9db153530d virt/kvm/kvm_main.c    Paolo Bonzini       2018-10-23  22=
57             /*
> 82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  22=
58              * Unlike kvm_get_dirty_log, we never flush, because no flus=
h is
> 82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  22=
59              * needed until KVM_CLEAR_DIRTY_LOG.  There is some code
> 82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  22=
60              * duplication between this function and kvm_get_dirty_log, =
but
> 82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  22=
61              * hopefully all architecture transition to
> 82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  22=
62              * kvm_get_dirty_log_protect and kvm_get_dirty_log can be
> 82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  22=
63              * eliminated.
> 2a31b9db153530d virt/kvm/kvm_main.c    Paolo Bonzini       2018-10-23  22=
64              */
> 2a31b9db153530d virt/kvm/kvm_main.c    Paolo Bonzini       2018-10-23  22=
65             dirty_bitmap_buffer =3D dirty_bitmap;
> 2a31b9db153530d virt/kvm/kvm_main.c    Paolo Bonzini       2018-10-23  22=
66     } else {
> 82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  22=
67             bool flush;
>
> flush needs to be initialized to false.

I'll fix this and the other bug about not documenting the new
parameter, my mistake. :(

I think in a v2 I'll also merge kvm_get_dirty_log() into
kvm_get_dirty_log_protect(); might as well.
