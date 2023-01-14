Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918F17C;
	Sat, 14 Jan 2023 07:58:06 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id k8so8450810wrc.9;
        Fri, 13 Jan 2023 23:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qQA/jgCksOZddh0t+6XHMKOBpW3pPFDdE2DouCM2c2E=;
        b=EZ1spF+g9tj6JZ9obKA2f15ldiLo7ImLG5vcNvOKxCI7g1jH7XwfnYg+/TPjYLPwYw
         dY+mlOjDuh8PfSp+dJPtGQQXwzMRwTA+bI78bvWBJKyOD2N3k3i2/EOc/FTfv0BCiENg
         gz6DkCu9lxP7li91CBICIVM/KTo4ymo08vjjekqYRLcsvxhftIUHF4rLlrtnv1f1bnBz
         tpKP97A469zDgIgKAXqppor8SbmqauqWrlENC3e/qY/o5k2bFow4SUKXBbG7ZuCNWjnf
         pqK6UMuhul99NpBJ+/w3LdvhYwWip2AHtV4EfTXMde4iT1uj0FMcMlnixLnCnRKpco9M
         Zc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQA/jgCksOZddh0t+6XHMKOBpW3pPFDdE2DouCM2c2E=;
        b=opEgA/F94spVbzsZ1koMc1/sxyqpd0vuxYKBST5+ewdTWwZDrTmSqQio+patbkym0E
         sFBMoyJSMMPtAkgdIMGmTsJZome1oFVjiIWYHwKt27uHJZt9aRRTqLBwGFLRxtxtJv5O
         azBnHF0OfJKpgkoHsIh+TXWp4PcHN3GOo/e1H3HBGfBlCGeHa1fNnObinekAoEGZGR/1
         IQ5wcRhpgdiBvQAVejk4sMRvBFD1dfj7jn6YI9X92CA6WAATFXe90eEiFPlTY97lm+bF
         GYfRW9BZMK1DhFqGTJOjaN/v9FFt70j57h007UEhLBvCpAHz1h6q82Rs6rLcNTG0yjdr
         lLHg==
X-Gm-Message-State: AFqh2koXBW1RAk6O3sX8Yy8xcHFGL4Ta95miW22bjsqE/paSRb6X084K
	ZziPztEJrzUjTcYLthkHgDGxkeYfANWaZA==
X-Google-Smtp-Source: AMrXdXvCPoBFIbLaSJkx19HGU3lDcez+oZCo3Ap1z0m3e1nMLOEGXaXMSkGzFGIoW9/7X5QkRnu2fg==
X-Received: by 2002:adf:de0e:0:b0:242:63e5:2449 with SMTP id b14-20020adfde0e000000b0024263e52449mr54048043wrm.69.1673683084436;
        Fri, 13 Jan 2023 23:58:04 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c8-20020a5d4cc8000000b002bdeb0cf706sm1540112wrt.65.2023.01.13.23.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 23:58:03 -0800 (PST)
Date: Sat, 14 Jan 2023 10:57:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Baoquan He <bhe@redhat.com>,
	linux-mm@kvack.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, urezki@gmail.com, lstoakes@gmail.com,
	stephen.s.brennan@oracle.com, willy@infradead.org,
	akpm@linux-foundation.org, hch@infradead.org,
	Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v3 3/7] mm/vmalloc.c: allow vread() to read out
 vm_map_ram areas
Message-ID: <202301132345.KVjvHMFq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113031921.64716-4-bhe@redhat.com>
Message-ID: <20230114075759.WaHdF-IU6h7ItqPlHMON1Zb6Tx6GeVyMfcEcLM2OXuk@z>

Hi Baoquan,

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/mm-vmalloc-c-add-used_map-into-vmap_block-to-track-space-of-vmap_block/20230113-112149
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230113031921.64716-4-bhe%40redhat.com
patch subject: [PATCH v3 3/7] mm/vmalloc.c: allow vread() to read out vm_map_ram areas
config: i386-randconfig-m021
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
mm/vmalloc.c:3682 vread() error: we previously assumed 'vm' could be null (see line 3664)

vim +/vm +3682 mm/vmalloc.c

^1da177e4c3f415 Linus Torvalds          2005-04-16  3630  long vread(char *buf, char *addr, unsigned long count)
^1da177e4c3f415 Linus Torvalds          2005-04-16  3631  {
e81ce85f960c2e2 Joonsoo Kim             2013-04-29  3632  	struct vmap_area *va;
e81ce85f960c2e2 Joonsoo Kim             2013-04-29  3633  	struct vm_struct *vm;
^1da177e4c3f415 Linus Torvalds          2005-04-16  3634  	char *vaddr, *buf_start = buf;
d0107eb07320b5d KAMEZAWA Hiroyuki       2009-09-21  3635  	unsigned long buflen = count;
129dbdf298d7383 Baoquan He              2023-01-13  3636  	unsigned long n, size, flags;
^1da177e4c3f415 Linus Torvalds          2005-04-16  3637  
4aff1dc4fb3a5a3 Andrey Konovalov        2022-03-24  3638  	addr = kasan_reset_tag(addr);
4aff1dc4fb3a5a3 Andrey Konovalov        2022-03-24  3639  
^1da177e4c3f415 Linus Torvalds          2005-04-16  3640  	/* Don't allow overflow */
^1da177e4c3f415 Linus Torvalds          2005-04-16  3641  	if ((unsigned long) addr + count < count)
^1da177e4c3f415 Linus Torvalds          2005-04-16  3642  		count = -(unsigned long) addr;
^1da177e4c3f415 Linus Torvalds          2005-04-16  3643  
e81ce85f960c2e2 Joonsoo Kim             2013-04-29  3644  	spin_lock(&vmap_area_lock);
f181234a5a21fd0 Chen Wandun             2021-09-02  3645  	va = find_vmap_area_exceed_addr((unsigned long)addr);
f608788cd2d6cae Serapheim Dimitropoulos 2021-04-29  3646  	if (!va)
f608788cd2d6cae Serapheim Dimitropoulos 2021-04-29  3647  		goto finished;
f181234a5a21fd0 Chen Wandun             2021-09-02  3648  
f181234a5a21fd0 Chen Wandun             2021-09-02  3649  	/* no intersects with alive vmap_area */
f181234a5a21fd0 Chen Wandun             2021-09-02  3650  	if ((unsigned long)addr + count <= va->va_start)
f181234a5a21fd0 Chen Wandun             2021-09-02  3651  		goto finished;
f181234a5a21fd0 Chen Wandun             2021-09-02  3652  
f608788cd2d6cae Serapheim Dimitropoulos 2021-04-29  3653  	list_for_each_entry_from(va, &vmap_area_list, list) {
e81ce85f960c2e2 Joonsoo Kim             2013-04-29  3654  		if (!count)
e81ce85f960c2e2 Joonsoo Kim             2013-04-29  3655  			break;
e81ce85f960c2e2 Joonsoo Kim             2013-04-29  3656  
129dbdf298d7383 Baoquan He              2023-01-13  3657  		vm = va->vm;
129dbdf298d7383 Baoquan He              2023-01-13  3658  		flags = va->flags & VMAP_FLAGS_MASK;
129dbdf298d7383 Baoquan He              2023-01-13  3659  
129dbdf298d7383 Baoquan He              2023-01-13  3660  		if (!vm && !flags)
                                                                            ^^^
vm can be NULL if a flag in VMAP_FLAGS_MASK is set.

e81ce85f960c2e2 Joonsoo Kim             2013-04-29  3661  			continue;
e81ce85f960c2e2 Joonsoo Kim             2013-04-29  3662  
129dbdf298d7383 Baoquan He              2023-01-13  3663  		vaddr = (char *) va->va_start;
129dbdf298d7383 Baoquan He              2023-01-13 @3664  		size = vm ? get_vm_area_size(vm) : va_size(va);
                                                                               ^^

129dbdf298d7383 Baoquan He              2023-01-13  3665  
129dbdf298d7383 Baoquan He              2023-01-13  3666  		if (addr >= vaddr + size)
^1da177e4c3f415 Linus Torvalds          2005-04-16  3667  			continue;
^1da177e4c3f415 Linus Torvalds          2005-04-16  3668  		while (addr < vaddr) {
^1da177e4c3f415 Linus Torvalds          2005-04-16  3669  			if (count == 0)
^1da177e4c3f415 Linus Torvalds          2005-04-16  3670  				goto finished;
^1da177e4c3f415 Linus Torvalds          2005-04-16  3671  			*buf = '\0';
^1da177e4c3f415 Linus Torvalds          2005-04-16  3672  			buf++;
^1da177e4c3f415 Linus Torvalds          2005-04-16  3673  			addr++;
^1da177e4c3f415 Linus Torvalds          2005-04-16  3674  			count--;
^1da177e4c3f415 Linus Torvalds          2005-04-16  3675  		}
129dbdf298d7383 Baoquan He              2023-01-13  3676  		n = vaddr + size - addr;
d0107eb07320b5d KAMEZAWA Hiroyuki       2009-09-21  3677  		if (n > count)
d0107eb07320b5d KAMEZAWA Hiroyuki       2009-09-21  3678  			n = count;
129dbdf298d7383 Baoquan He              2023-01-13  3679  
129dbdf298d7383 Baoquan He              2023-01-13  3680  		if (flags & VMAP_RAM)

assume VMAP_RAM is not set

129dbdf298d7383 Baoquan He              2023-01-13  3681  			vmap_ram_vread(buf, addr, n, flags);
129dbdf298d7383 Baoquan He              2023-01-13 @3682  		else if (!(vm->flags & VM_IOREMAP))
                                                                                   ^^^^^^^^^
Unchecked dereference.  Should this be "flags" instead of "vm->flags"?

d0107eb07320b5d KAMEZAWA Hiroyuki       2009-09-21  3683  			aligned_vread(buf, addr, n);
d0107eb07320b5d KAMEZAWA Hiroyuki       2009-09-21  3684  		else /* IOREMAP area is treated as memory hole */
d0107eb07320b5d KAMEZAWA Hiroyuki       2009-09-21  3685  			memset(buf, 0, n);
d0107eb07320b5d KAMEZAWA Hiroyuki       2009-09-21  3686  		buf += n;
d0107eb07320b5d KAMEZAWA Hiroyuki       2009-09-21  3687  		addr += n;
d0107eb07320b5d KAMEZAWA Hiroyuki       2009-09-21  3688  		count -= n;
^1da177e4c3f415 Linus Torvalds          2005-04-16  3689  	}
^1da177e4c3f415 Linus Torvalds          2005-04-16  3690  finished:
e81ce85f960c2e2 Joonsoo Kim             2013-04-29  3691  	spin_unlock(&vmap_area_lock);
d0107eb07320b5d KAMEZAWA Hiroyuki       2009-09-21  3692  
d0107eb07320b5d KAMEZAWA Hiroyuki       2009-09-21  3693  	if (buf == buf_start)
d0107eb07320b5d KAMEZAWA Hiroyuki       2009-09-21  3694  		return 0;
d0107eb07320b5d KAMEZAWA Hiroyuki       2009-09-21  3695  	/* zero-fill memory holes */
d0107eb07320b5d KAMEZAWA Hiroyuki       2009-09-21  3696  	if (buf != buf_start + buflen)
d0107eb07320b5d KAMEZAWA Hiroyuki       2009-09-21  3697  		memset(buf, 0, buflen - (buf - buf_start));
d0107eb07320b5d KAMEZAWA Hiroyuki       2009-09-21  3698  
d0107eb07320b5d KAMEZAWA Hiroyuki       2009-09-21  3699  	return buflen;
^1da177e4c3f415 Linus Torvalds          2005-04-16  3700  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

