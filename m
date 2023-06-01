Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F416ADF
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Jun 2023 07:47:43 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f60804faf4so5058445e9.3
        for <oe-kbuild@lists.linux.dev>; Thu, 01 Jun 2023 00:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685605660; x=1688197660;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uJZu58SZ+P+nkI3BQxTXa3ICtR8svA2Uo/wonuCVw/E=;
        b=RVqDtmBqThzym8jSxqLaU+ypcazPTNBzygGpPem+yuenYCgQY91396ZG+dT+HlT8hH
         IiwjnY99RxB9U5DUJf3rmnjdCWYT5EZ3Y6KzoPRBKrM89MCn0vzKHpgluE5Jd7Ng9AdR
         w+4aj0X/bNlMO080dmaV9XFolyiyfzaX9PxI5jFsvraSpmx3KxCBdARpzR/prZOEQ7DJ
         Fd4KrUPnV8TRZMipR+rx6W3Ldyo8daaPp5wS4kSOEgoTIGf4giLjdPTURxu1OFFQDGVK
         aud69Df5O8efG5ogeSrU59iCOut8qtin3vHhRu9a9g6AvTWtpv9oILQ2mWLDO8ZyS6uh
         dD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685605660; x=1688197660;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uJZu58SZ+P+nkI3BQxTXa3ICtR8svA2Uo/wonuCVw/E=;
        b=WKcypNSBoz4qIRu/KTKgwjRgL/1CyM1j4eAmIL+uJf8Om2KuCsRuVCk2PW2N5iI5dt
         GdbM3B7kW3wDoDu3fSRffPU82/fnZv4j/b+FeT5fK1ulh762vlalV9J5iLd4FnA1Kk09
         a2uAWZX28Hqo8rZJgdI2/t5TdKQhpv1PI2rueIKPM4XI1AKFBt1PoyhHYcJFkwtThwD6
         7wgRv0Jqknui1QXqfV95+iJkQaTXa/KUuryVyBq14W30/sgbpB3J/mJsLl77j+4JRFSx
         jrMGG79W88iGVnKAy/IMbrDZIOJxlzSIccibM70+pzasR/89af/gGll3m+10oEmu3NNr
         d8Yw==
X-Gm-Message-State: AC+VfDzb/UbIIKURH6eNBB5Q8x4kFcSXrU3Q7KTKGFYGzWMXDyIMqLQM
	FEOZJa39PuI2+bv3/U26gfMOm8YVKp4H0Vh5i7s=
X-Google-Smtp-Source: ACHHUZ6NV94rjwv5l+kNIlPg34bLFG/I0qt8UT0AgBu1IfspUCk4h2B0DS2muvyVnX/8cNKvE2B9CA==
X-Received: by 2002:a5d:66c3:0:b0:306:28fa:16a7 with SMTP id k3-20020a5d66c3000000b0030628fa16a7mr1252994wrw.43.1685605660538;
        Thu, 01 Jun 2023 00:47:40 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i16-20020a05600011d000b0030aefa3a957sm9404306wrx.28.2023.06.01.00.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 00:47:38 -0700 (PDT)
Date: Thu, 1 Jun 2023 10:47:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:jitalloc/v0.1 3/15] mm/jitalloc.c:68 jit_alloc_init() warn:
 variable dereferenced before check 'p' (see line 65)
Message-ID: <3602c9c4-6d8e-4e16-85fc-3e34c1dc72da@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git jitalloc/v0.1
head:   ee9292c97c0c221b03b6a12402596b1829dd2bd0
commit: 35563a849dd19012dc61857c76d4ec617e6f6096 [3/15] mm/jitalloc, arch: convert simple overrides of module_alloc to jitalloc
config: i386-randconfig-m021-20230531 (https://download.01.org/0day-ci/archive/20230601/202306011556.s47JJtQ2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306011556.s47JJtQ2-lkp@intel.com/

smatch warnings:
mm/jitalloc.c:68 jit_alloc_init() warn: variable dereferenced before check 'p' (see line 65)

vim +/p +68 mm/jitalloc.c

35563a849dd190 Mike Rapoport (IBM  2023-05-28  61) void jit_alloc_init(void)
35563a849dd190 Mike Rapoport (IBM  2023-05-28  62) {
35563a849dd190 Mike Rapoport (IBM  2023-05-28  63) 	struct jit_alloc_params *p = jit_alloc_arch_params();
35563a849dd190 Mike Rapoport (IBM  2023-05-28  64) 
35563a849dd190 Mike Rapoport (IBM  2023-05-28 @65) 	if (!jit_alloc_validate_params(p))
                                                                                       ^
Presumably this is dereferenced inside the function.

35563a849dd190 Mike Rapoport (IBM  2023-05-28  66) 		return;
35563a849dd190 Mike Rapoport (IBM  2023-05-28  67) 
35563a849dd190 Mike Rapoport (IBM  2023-05-28 @68) 	if (p)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

