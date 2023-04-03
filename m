Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FFA20E1;
	Mon,  3 Apr 2023 08:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EDBC4339E;
	Mon,  3 Apr 2023 08:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680509008;
	bh=W2/JGBwBJrkyfmyCw51C1GRh8fsdGQMceG8rzgAssuA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ovlbi3cj+0lW2UmAOWix4zqf6OVDW3sKMSODxC6qej3IbIzcoq1f+lEMNIGIpPw/6
	 PWC99dmvZvueNiEzH7Y7OVzNeKEcAyJKJY9c6MDlu5xH+hLtSgVFue6Zw0BKF5T4bc
	 LoDUQ0aFic/2fqjLCMtw8KZZ7Cmr4Ca606h+/yVahp4FuCg3rA6U7iFkJMW9/a8jmR
	 eo9WGFbrHWe8T3KGefhnJZCNWJiZvU9fvAs6NrXnWZlGfOxNtFbHSrALCciYB3CNiS
	 AjEKyuYEiMcnJ4Rh6uDoQ94KCfvzJ5Vfvww+Hjk0QIokOHSksk8V74gUErn2Q60Rwm
	 NP0ub/KyRhhkw==
Received: by mail-lj1-f176.google.com with SMTP id x20so29360200ljq.9;
        Mon, 03 Apr 2023 01:03:28 -0700 (PDT)
X-Gm-Message-State: AAQBX9dVJBforjGfBB1cPh5f0rKRW2Kdn0twk6ONrwDS/lrSkRPCocy/
	HLIsDLEw7d2hHKzwYDfgWgwbLFoEimZwKOH9qxA=
X-Google-Smtp-Source: AKy350aXx5lyi5hVsK5RRdFMjv/v/HpPOisyZtqtmB082po5+/hwztoLHoc/qpbgB8lI4dOAo+NH/Mkmi8Ku3DkR3Ak=
X-Received: by 2002:a2e:9c11:0:b0:298:bddc:dbbf with SMTP id
 s17-20020a2e9c11000000b00298bddcdbbfmr10284206lji.2.1680509006250; Mon, 03
 Apr 2023 01:03:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <be46d0ab-8553-4a5d-af46-6fa909c45213@kili.mountain>
In-Reply-To: <be46d0ab-8553-4a5d-af46-6fa909c45213@kili.mountain>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 3 Apr 2023 10:03:15 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEbaWNNp98GRACR_JUt7JOowU=3BaRKs0ZoOvibnbN_LA@mail.gmail.com>
Message-ID: <CAMj1kXEbaWNNp98GRACR_JUt7JOowU=3BaRKs0ZoOvibnbN_LA@mail.gmail.com>
Subject: Re: arch/arm64/kernel/compat_alignment.c:333 do_compat_alignment_fixup()
 error: uninitialized symbol 'tinst2'.
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Apr 2023 at 08:29, Dan Carpenter <error27@gmail.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   00c7b5f4ddc5b346df62b757ec73f9357bb452af
> commit: 3fc24ef32d3b9368f4c103dcd21d6a3f959b4870 arm64: compat: Implement misalignment fixups for multiword loads
> config: arm64-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230402/202304021214.gekJ8yRc-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 12.1.0
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202304021214.gekJ8yRc-lkp@intel.com/
>
> smatch warnings:
> arch/arm64/kernel/compat_alignment.c:333 do_compat_alignment_fixup() error: uninitialized symbol 'tinst2'.
>
> vim +/tinst2 +333 arch/arm64/kernel/compat_alignment.c
>
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  310  int do_compat_alignment_fixup(unsigned long addr, struct pt_regs *regs)
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  311  {
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  312   union offset_union offset;
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  313   unsigned long instrptr;
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  314   int (*handler)(unsigned long addr, u32 instr, struct pt_regs *regs);
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  315   unsigned int type;
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  316   u32 instr = 0;
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  317   u16 tinstr = 0;
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  318   int isize = 4;
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  319   int thumb2_32b = 0;
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  320   int fault;
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  321
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  322   instrptr = instruction_pointer(regs);
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  323
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  324   if (compat_thumb_mode(regs)) {
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  325           __le16 __user *ptr = (__le16 __user *)(instrptr & ~1);
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  326
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  327           fault = alignment_get_thumb(regs, ptr, &tinstr);
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  328           if (!fault) {
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  329                   if (IS_T32(tinstr)) {
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  330                           /* Thumb-2 32-bit */
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  331                           u16 tinst2;
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  332                           fault = alignment_get_thumb(regs, ptr + 1, &tinst2);
> 3fc24ef32d3b93 Ard Biesheuvel 2022-07-01 @333                           instr = ((u32)tinstr << 16) | tinst2;
>
> Smatch is complaining that there is no error checking to see if the
> copy_from_user() fails in alignment_get_thumb.  Eventually the syzbot
> will learn to detect this as well.
>

That shouldn't matter.

        u16 instr = 0;
        int fault;

        if (user_mode(regs))
                fault = get_user(instr, ip);
        else
                fault = get_kernel_nofault(instr, ip);

        *inst = __mem_to_opcode_thumb16(instr);

So the *inst assignment is never ambiguous here, regardless of whether
get_user() fails. The value could be wrong (i.e., get_user may have
failed after reading only one byte) but the value is never
uninitialized. Then, the fault value is always propagated so the
calling function will not succeed spuriously when this happens.

> Most distro kernels are going to automatically zero out stack variables
> like tinst2 to prevent undefined behavior.
>

instr is already zeroed out.

> Presumably this is a fast path.  So setting "u16 tinst2 = 0;" does not
> affect runtime speed for distro kernels and it might be the best
> solution.
>

Performance is not an issue here - this is a misalignment fixup
handler, which we copied from the 32-bit ARM tree only for compat
reasons, but anyone who cares about performance would not use
misaligned accesses or even run 32-bit code on a 64-bit system.

However, given that this code originates in the arch/arm tree, I am
reluctant make such 'correctness' tweaks while the logic is sound and
unambiguous.
