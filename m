Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA7743AB0
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Oct 2023 14:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ojXZdtek"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40566f89f6eso63858235e9.3
        for <oe-kbuild@lists.linux.dev>; Tue, 17 Oct 2023 07:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697552804; x=1698157604; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mJE09Myjwgn14LfWOjq/jShnx1rrUt/BrGt0sKyb+3o=;
        b=ojXZdteksV1hwE+iqSt57O4hrX3xX0ERYXbNl6gVXlEV/6p8/puLvK0Yx8fU78gYte
         /6/hFKhFpjWJj31a4FWJ4w7p691cFvtYdnSxM7WwfjtaBDAe03yrcrexOQfaMLgzxww8
         kwzA76HZc+O7knHZnCJhbvv/1a3YmgzEuZi+3kGd6CdCT5qKViY+oPhKIgrODOkx8Tre
         Av8FJOlS/POhGdD8rfMJcif9Ne1jWi5WIjliZrJdOlZOwlz7BCJw3APKy7zMjA9ORCo3
         fEY35aom69wisBhWPpMj3OUuMrK60SCGnwrGtFAhBxMXj/N4Nn2BYX13f0wyJoQD3Eaz
         vBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697552804; x=1698157604;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJE09Myjwgn14LfWOjq/jShnx1rrUt/BrGt0sKyb+3o=;
        b=vBXJ8cmP6nvz3EVcenfKgOnUfj8UCukYjaeL0laSUMMDYr2qHuyAI+jcC7nrH2dOHb
         r7aZzawlnJFA6ciznzN8u5WlXqbvJUVJW35cYbTKc7dOSWSADfzlmJbS4cNEdFiCsya1
         alABoPWxc4jjxSDGYEYwJM1Um08OcRbnAIVh0X/Rftjcb15SLuR8roz5gP7g7TCOqHR3
         nZIEAYirZOOGjRTtk0lQIMU0jIEvWmvnhg3vLP52cF/Z58pdWJKxiINIlyQd6Pv4OKOj
         +n/xG0pxP1m0cFg2gwx4eOA234hfY377kDBXJF+r3cnFeWISGgmE9QIk91MDJbHprieJ
         7c/w==
X-Gm-Message-State: AOJu0YzDjix27gubCBZ+4qdZKYuVlS+YqnQTEOgmLJas1g7KHlsJ9Bf6
	Dgd9rV96s+XlcMwcmhZKAy9VjfTU5YMh4IMcWus=
X-Google-Smtp-Source: AGHT+IF0GLdjOsGO/vLeu8WUMiLKOKj5CwsCC7dwSj2juz49+jxE5vpaDAlhZS+tkZmC1sBDsI939g==
X-Received: by 2002:a05:600c:4ec7:b0:408:3963:5be7 with SMTP id g7-20020a05600c4ec700b0040839635be7mr2119wmq.29.1697552804118;
        Tue, 17 Oct 2023 07:26:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c488600b00405ee9dc69esm9834754wmp.18.2023.10.17.07.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 07:26:43 -0700 (PDT)
Date: Tue, 17 Oct 2023 17:26:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Lorenzo Stoakes <lstoakes@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Baoquan He <bhe@redhat.com>
Subject: mm/vmalloc.c:3689 vread_iter() error: we previously assumed 'vm'
 could be null (see line 3667)
Message-ID: <f82be227-bfde-439a-b339-1b4ee370d59a@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   213f891525c222e8ed145ce1ce7ae1f47921cb9c
commit: 4c91c07c93bbbdd7f2d9de2beb7ee5c2a48ad8e7 mm: vmalloc: convert vread() to vread_iter()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231017/202310171600.WCrsOwFj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310171600.WCrsOwFj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310171600.WCrsOwFj-lkp@intel.com/

smatch warnings:
mm/vmalloc.c:3689 vread_iter() error: we previously assumed 'vm' could be null (see line 3667)

vim +/vm +3689 mm/vmalloc.c

4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3619  long vread_iter(struct iov_iter *iter, const char *addr, size_t count)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3620  {
e81ce85f960c2e Joonsoo Kim             2013-04-29  3621  	struct vmap_area *va;
e81ce85f960c2e Joonsoo Kim             2013-04-29  3622  	struct vm_struct *vm;
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3623  	char *vaddr;
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3624  	size_t n, size, flags, remains;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3625  
4aff1dc4fb3a5a Andrey Konovalov        2022-03-24  3626  	addr = kasan_reset_tag(addr);
4aff1dc4fb3a5a Andrey Konovalov        2022-03-24  3627  
^1da177e4c3f41 Linus Torvalds          2005-04-16  3628  	/* Don't allow overflow */
^1da177e4c3f41 Linus Torvalds          2005-04-16  3629  	if ((unsigned long) addr + count < count)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3630  		count = -(unsigned long) addr;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3631  
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3632  	remains = count;
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3633  
e81ce85f960c2e Joonsoo Kim             2013-04-29  3634  	spin_lock(&vmap_area_lock);
f181234a5a21fd Chen Wandun             2021-09-02  3635  	va = find_vmap_area_exceed_addr((unsigned long)addr);
f608788cd2d6ca Serapheim Dimitropoulos 2021-04-29  3636  	if (!va)
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3637  		goto finished_zero;
f181234a5a21fd Chen Wandun             2021-09-02  3638  
f181234a5a21fd Chen Wandun             2021-09-02  3639  	/* no intersects with alive vmap_area */
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3640  	if ((unsigned long)addr + remains <= va->va_start)
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3641  		goto finished_zero;
f181234a5a21fd Chen Wandun             2021-09-02  3642  
f608788cd2d6ca Serapheim Dimitropoulos 2021-04-29  3643  	list_for_each_entry_from(va, &vmap_area_list, list) {
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3644  		size_t copied;
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3645  
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3646  		if (remains == 0)
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3647  			goto finished;
e81ce85f960c2e Joonsoo Kim             2013-04-29  3648  
06c8994626d1b7 Baoquan He              2023-02-06  3649  		vm = va->vm;
06c8994626d1b7 Baoquan He              2023-02-06  3650  		flags = va->flags & VMAP_FLAGS_MASK;
06c8994626d1b7 Baoquan He              2023-02-06  3651  		/*
06c8994626d1b7 Baoquan He              2023-02-06  3652  		 * VMAP_BLOCK indicates a sub-type of vm_map_ram area, need
06c8994626d1b7 Baoquan He              2023-02-06  3653  		 * be set together with VMAP_RAM.
06c8994626d1b7 Baoquan He              2023-02-06  3654  		 */
06c8994626d1b7 Baoquan He              2023-02-06  3655  		WARN_ON(flags == VMAP_BLOCK);
06c8994626d1b7 Baoquan He              2023-02-06  3656  
06c8994626d1b7 Baoquan He              2023-02-06  3657  		if (!vm && !flags)

NULL check

e81ce85f960c2e Joonsoo Kim             2013-04-29  3658  			continue;
e81ce85f960c2e Joonsoo Kim             2013-04-29  3659  
30a7a9b17c4b03 Baoquan He              2023-02-06  3660  		if (vm && (vm->flags & VM_UNINITIALIZED))
30a7a9b17c4b03 Baoquan He              2023-02-06  3661  			continue;
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3662  
30a7a9b17c4b03 Baoquan He              2023-02-06  3663  		/* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
30a7a9b17c4b03 Baoquan He              2023-02-06  3664  		smp_rmb();
30a7a9b17c4b03 Baoquan He              2023-02-06  3665  
06c8994626d1b7 Baoquan He              2023-02-06  3666  		vaddr = (char *) va->va_start;
06c8994626d1b7 Baoquan He              2023-02-06 @3667  		size = vm ? get_vm_area_size(vm) : va_size(va);
06c8994626d1b7 Baoquan He              2023-02-06  3668  
06c8994626d1b7 Baoquan He              2023-02-06  3669  		if (addr >= vaddr + size)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3670  			continue;
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3671  
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3672  		if (addr < vaddr) {
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3673  			size_t to_zero = min_t(size_t, vaddr - addr, remains);
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3674  			size_t zeroed = zero_iter(iter, to_zero);
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3675  
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3676  			addr += zeroed;
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3677  			remains -= zeroed;
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3678  
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3679  			if (remains == 0 || zeroed != to_zero)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3680  				goto finished;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3681  		}
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3682  
06c8994626d1b7 Baoquan He              2023-02-06  3683  		n = vaddr + size - addr;
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3684  		if (n > remains)
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3685  			n = remains;
06c8994626d1b7 Baoquan He              2023-02-06  3686  
06c8994626d1b7 Baoquan He              2023-02-06  3687  		if (flags & VMAP_RAM)
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3688  			copied = vmap_ram_vread_iter(iter, addr, n, flags);
06c8994626d1b7 Baoquan He              2023-02-06 @3689  		else if (!(vm->flags & VM_IOREMAP))
                                                                                   ^^^^^^^^^
Unchecked dereference

4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3690  			copied = aligned_vread_iter(iter, addr, n);
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3691  		else /* IOREMAP area is treated as memory hole */
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3692  			copied = zero_iter(iter, n);
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3693  
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3694  		addr += copied;
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3695  		remains -= copied;
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3696  
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3697  		if (copied != n)
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3698  			goto finished;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3699  	}
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3700  
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3701  finished_zero:
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3702  	spin_unlock(&vmap_area_lock);
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3703  	/* zero-fill memory holes */
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3704  	return count - remains + zero_iter(iter, remains);
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3705  finished:
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3706  	/* Nothing remains, or We couldn't copy/zero everything. */
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3707  	spin_unlock(&vmap_area_lock);
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3708  
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3709  	return count - remains;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3710  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

