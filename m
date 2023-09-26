Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590AA29404
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Sep 2023 13:50:03 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3214cdb4b27so8280365f8f.1
        for <oe-kbuild@lists.linux.dev>; Tue, 26 Sep 2023 06:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695736201; x=1696341001; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cRs3HHfGHaH5W3/uj1x1VaVTGyeeNQR7KwXCiLuCrmM=;
        b=FdBfcmUkaZ32VcQBe2tKL/b1QZ0yDpb/cZvgVjZl1bPWFVk0tAdHsSZ80dkav/fSIu
         lXlxx84KpT4NbJrBD6OYTLu2wq6+zr7MwqR2MC3xTurYAJ5sB+z9/k7pqM25aU3XVdb5
         Ydqsel4Ekpb1x278uimsvbZ+U4IShkPpkpoXhdKGiguECCcO0OpwzzUGG5PHr0jJBWd3
         NiurB1rRfj/HlZbJ6ykdesXyrustgyHshzkpQ4qnHl+1rbR2h6bKBsg/PbohG/8S1fcf
         /Xu/ER60Ay6a2IzwkTYl+G71b2oi9Z63Y7CHR16I+3Hp/FTx/i/HRmKJutZ37f4GyIHP
         wPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695736201; x=1696341001;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cRs3HHfGHaH5W3/uj1x1VaVTGyeeNQR7KwXCiLuCrmM=;
        b=rbM/uwakimh75lInGBwGoLhPI5ej1Sb1FPmRJXUVc56zXmg6nsFXT/skQSPx/6UyUa
         Tx6e5g8RNWykH0MPXOAHvwHWaHSfbtimHRPm8/d64ts617bZIvrs5rcTm8ZZbJuuP5h2
         SeQAX15xBRvq21fjZhnpoOF1k8Ss+ivOtHaFC1NBiHCoAvStt/NPudmieHhYApf91RpG
         XeXbhqNFDH2xMgopLLRFlScIdrVMnzF37nKh9gZEF+aEMHckgoxB6dFqfxYjvNxhNjGq
         upE26iZhiFqPWpPKW+5T7lkyjOlakV2Jtt0HJ5ve0s3d7V4cBF5NOuAOxZVXHR1bQW3L
         VGbA==
X-Gm-Message-State: AOJu0YxrbIDS19AFmZN3QanfclaiJPiSU3VBrKFruCV/QfcVr3XIWPFF
	cJvpr8mJGbaK+rhOGhyECRIbs+7N/hfK3lVSqfE=
X-Google-Smtp-Source: AGHT+IF91hGN1iRDS8YgIh/vPtUJ+zpofgOyE21tn2k4Y0dzzbVuW2uJnDRcsiLSCzeUbXQdNsr/9Q==
X-Received: by 2002:a5d:4fc9:0:b0:31a:dc2e:2db2 with SMTP id h9-20020a5d4fc9000000b0031adc2e2db2mr9310520wrw.49.1695736200924;
        Tue, 26 Sep 2023 06:50:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o11-20020a056000010b00b0031c52e81490sm14821340wrx.72.2023.09.26.06.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 06:50:00 -0700 (PDT)
Date: Tue, 26 Sep 2023 16:49:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Eric W. Biederman" <ebiederm@xmission.com>,
	Sebastian Ott <sebott@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Kees Cook <keescook@chromium.org>, Mark Brown <broonie@kernel.org>,
	Willy Tarreau <w@1wt.eu>, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] binfmt_elf: Support segments with 0 filesz and
 misaligned starts
Message-ID: <60c7fdeb-da32-4d21-9e34-368050224d6c@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzsemmsd.fsf_-_@email.froward.int.ebiederm.org>

Hi Eric,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-W-Biederman/binfmt_elf-Support-segments-with-0-filesz-and-misaligned-starts/20230925-210022
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/execve
patch link:    https://lore.kernel.org/r/87jzsemmsd.fsf_-_%40email.froward.int.ebiederm.org
patch subject: [PATCH] binfmt_elf: Support segments with 0 filesz and misaligned starts
config: i386-randconfig-141-20230926 (https://download.01.org/0day-ci/archive/20230926/202309261925.QvgPAYL7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230926/202309261925.QvgPAYL7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309261925.QvgPAYL7-lkp@intel.com/

smatch warnings:
fs/binfmt_elf.c:431 elf_load() error: uninitialized symbol 'map_addr'.

vim +/map_addr +431 fs/binfmt_elf.c

a6409120b31666 Eric W. Biederman 2023-09-25  390  static unsigned long elf_load(struct file *filep, unsigned long addr,
a6409120b31666 Eric W. Biederman 2023-09-25  391  		const struct elf_phdr *eppnt, int prot, int type,
a6409120b31666 Eric W. Biederman 2023-09-25  392  		unsigned long total_size)
a6409120b31666 Eric W. Biederman 2023-09-25  393  {
a6409120b31666 Eric W. Biederman 2023-09-25  394  	unsigned long zero_start, zero_end;
a6409120b31666 Eric W. Biederman 2023-09-25  395  	unsigned long map_addr;
a6409120b31666 Eric W. Biederman 2023-09-25  396  
a6409120b31666 Eric W. Biederman 2023-09-25  397  	if (eppnt->p_filesz) {
a6409120b31666 Eric W. Biederman 2023-09-25  398  		map_addr = elf_map(filep, addr, eppnt, prot, type, total_size);
a6409120b31666 Eric W. Biederman 2023-09-25  399  		if (BAD_ADDR(map_addr))
a6409120b31666 Eric W. Biederman 2023-09-25  400  			return map_addr;
a6409120b31666 Eric W. Biederman 2023-09-25  401  		if (eppnt->p_memsz > eppnt->p_filesz) {
a6409120b31666 Eric W. Biederman 2023-09-25  402  			zero_start = map_addr + ELF_PAGEOFFSET(eppnt->p_vaddr) +
a6409120b31666 Eric W. Biederman 2023-09-25  403  				eppnt->p_filesz;
a6409120b31666 Eric W. Biederman 2023-09-25  404  			zero_end = map_addr + ELF_PAGEOFFSET(eppnt->p_vaddr) +
a6409120b31666 Eric W. Biederman 2023-09-25  405  				eppnt->p_memsz;
a6409120b31666 Eric W. Biederman 2023-09-25  406  
a6409120b31666 Eric W. Biederman 2023-09-25  407  			/* Zero the end of the last mapped page */
a6409120b31666 Eric W. Biederman 2023-09-25  408  			padzero(zero_start);
a6409120b31666 Eric W. Biederman 2023-09-25  409  		}
a6409120b31666 Eric W. Biederman 2023-09-25  410  	} else {
a6409120b31666 Eric W. Biederman 2023-09-25  411  		zero_start = ELF_PAGESTART(addr);
a6409120b31666 Eric W. Biederman 2023-09-25  412  		zero_end = zero_start + ELF_PAGEOFFSET(eppnt->p_vaddr) +
a6409120b31666 Eric W. Biederman 2023-09-25  413  			eppnt->p_memsz;

For this else path, map_addr is only set if there is an error.

a6409120b31666 Eric W. Biederman 2023-09-25  414  	}
a6409120b31666 Eric W. Biederman 2023-09-25  415  	if (eppnt->p_memsz > eppnt->p_filesz) {
a6409120b31666 Eric W. Biederman 2023-09-25  416  		/*
a6409120b31666 Eric W. Biederman 2023-09-25  417  		 * Map the last of the segment.
a6409120b31666 Eric W. Biederman 2023-09-25  418  		 * If the header is requesting these pages to be
a6409120b31666 Eric W. Biederman 2023-09-25  419  		 * executable, honour that (ppc32 needs this).
a6409120b31666 Eric W. Biederman 2023-09-25  420  		 */
a6409120b31666 Eric W. Biederman 2023-09-25  421  		int error;
a6409120b31666 Eric W. Biederman 2023-09-25  422  
a6409120b31666 Eric W. Biederman 2023-09-25  423  		zero_start = ELF_PAGEALIGN(zero_start);
a6409120b31666 Eric W. Biederman 2023-09-25  424  		zero_end = ELF_PAGEALIGN(zero_end);
a6409120b31666 Eric W. Biederman 2023-09-25  425  
a6409120b31666 Eric W. Biederman 2023-09-25  426  		error = vm_brk_flags(zero_start, zero_end - zero_start,
a6409120b31666 Eric W. Biederman 2023-09-25  427  				     prot & PROT_EXEC ? VM_EXEC : 0);
a6409120b31666 Eric W. Biederman 2023-09-25  428  		if (error)
a6409120b31666 Eric W. Biederman 2023-09-25  429  			map_addr = error;
a6409120b31666 Eric W. Biederman 2023-09-25  430  	}
a6409120b31666 Eric W. Biederman 2023-09-25 @431  	return map_addr;
a6409120b31666 Eric W. Biederman 2023-09-25  432  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

