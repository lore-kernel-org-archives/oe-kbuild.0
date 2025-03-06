Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B7B1A0BCF
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Mar 2025 06:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741242482; cv=none; b=U0oww+aXnRSKWvgbeTQDTMdIP7EUluEaZgeyJU3jsXE0PNhkdKNsO75DuzTtRz5All+uqJGRwFMq56AhvchLF/PtkDCYAx3+bsXT6xRdl42aTIqR15s+sOEW2VAgQhqUSmIwC6YglvzPBWQh/dj7x7nasornQG56hBGhOoB424A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741242482; c=relaxed/simple;
	bh=jZu8yImZngJ8tnAK518etQ6TouuyjxwU5ELF924/vGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mwGkFJSiio+l5//019pzUerPqUSK3sUNVvCPzNA2VLqeN79uClLrm7egkOvzOXLfSlbKHErVC3A0193AlFM1annrfRwETm028bWPqNy8sa98FrvlZHjfKDqAbRf9TTYmE/+neg3epTOqKfpD7AdK3uM/VMUo5y/4JtySAFJ6ihU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IQssqMX4; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IQssqMX4"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-390edaee0cfso201489f8f.2
        for <oe-kbuild@lists.linux.dev>; Wed, 05 Mar 2025 22:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741242478; x=1741847278; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WoQpuhcBzQQEyEpQ6i53kxx1+G+OOyDqER89NtwPqvM=;
        b=IQssqMX4hnrDwhUx525Ezl5GGoo24YSLhYi55yyx+WD8Naen1bZJPSZ1Nx74CN3mgB
         KkwZ26fTQlv0/S2gPiLfIOPuSWo5aWwgrq1CvGwpiXDEqPkWH3r86LuDhEF5WTRcMLgy
         PTrKc4Q3KKRQONHXi63qoW90ypNLbLopJC8tAWy1BpwhB9ZfjVmLtcntSnLOPE0GhRRp
         T7TqHgxZaiwFVxRh73viiuzxIgRarmng5mhCToO8xnNENtBpCZGQSSfTkike2JatIO3V
         Xh2YMheZS9cHr2F9e3+m55597YyESpRfgdLbfWpwef9wlyTwjdzWiB8/Y4gMSbnBN8SR
         qBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741242478; x=1741847278;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WoQpuhcBzQQEyEpQ6i53kxx1+G+OOyDqER89NtwPqvM=;
        b=Ndu+s5WJprDBLahvu+oL5KjZSGWkBD4JQ5umJKMi0c84ZQUztGwy94krQVMnaEzalU
         MqiRuEr6x/3Jb9JLmFj+hduADX0u3TdDejiVUrQo4PMysm3+HYyzN+s2YPUB6cwFL2KO
         THehz2hbUk3aQMp1gfCtisoeR+Sq4Du3pHGHPr8hGsRwKpmkN8jmdrh9BUpWPWAqL7EL
         gbGJy4UsUdm7CiM43LGlRuuuVzZbUOvlYPy+ZYZCl1XSxKA55of98/RZeO6SuemJPKvi
         5nM1+Xr87JZLe9F8x8iGXWC0VCymDhdeoOQdozo2Yh+TLuDyYXv/5ia/PMR8mjpfv8gn
         rFzg==
X-Gm-Message-State: AOJu0YwvWNqk2TaTkE5QYmsbK1catDekQMfIEUnOEJwRxuMkM7HY7Y9W
	z/R2MKzLnBA6R6YW3O5xlG6FX2JUcGEhXLnPQixZi3Sf6FcHzSm63Ia6W5OfJ4fe5bXE6EmyjSZ
	l
X-Gm-Gg: ASbGncvmt5ekS5WYk8TZdEaY1T8/NvoWfkIyybKtLENTpRnPgWHZxwcH8OebijwVFtO
	KCw1h08vJiqCPJ2NsHDZWgdQcWLs1/8kw9fwpcp6bYDQNs0VETuQlZegtGYvHT9r2BsHfLMdAaj
	9lSLZC0mAtawv4eVZCubjkmOwj3g0du+9jTCgI6YKy+DwpVApFPUMHcgyJb3p/XqVh1PLewy06d
	9ig4I8WqjXBsEkcXpdQmX9YY4e7oStKMgY7qZ0WhynCrG5Xvt3LWx/pLcdbjsW/D2wha34WIxrg
	mmSTuqZm6SFBet5NYK5oALsbZBpeGoeJQvcZ2EDMFp01ZEH5QA==
X-Google-Smtp-Source: AGHT+IHfZerEp23Ioiss8qqEitU1gvzVPrnKA6NDUPcuTiOHaNhgxXRhgRuAYy61EP5QfKzHItQFAQ==
X-Received: by 2002:a05:6000:2184:b0:391:2ba9:4c51 with SMTP id ffacd0b85a97d-3912ba959c9mr535213f8f.44.1741242478119;
        Wed, 05 Mar 2025 22:27:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bd435c6ffsm38812005e9.33.2025.03.05.22.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 22:27:57 -0800 (PST)
Date: Thu, 6 Mar 2025 09:27:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7960/8790] mm/mremap.c:910 prep_move_vma() error:
 uninitialized symbol 'err'.
Message-ID: <701a7c3d-345a-4ed4-84bc-f34c5164f9ea@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7ec162622e66a4ff886f8f28712ea1b13069e1aa
commit: 3129f7896afb86e411c0b59a553fbb4053db4012 [7960/8790] mm/mremap: initial refactor of move_vma()
config: i386-randconfig-141-20250305 (https://download.01.org/0day-ci/archive/20250306/202503060404.ugZVU72k-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503060404.ugZVU72k-lkp@intel.com/

smatch warnings:
mm/mremap.c:910 prep_move_vma() error: uninitialized symbol 'err'.

vim +/err +910 mm/mremap.c

3129f7896afb86 Lorenzo Stoakes 2025-03-03  892  static unsigned long prep_move_vma(struct vma_remap_struct *vrm,
3129f7896afb86 Lorenzo Stoakes 2025-03-03  893  				   unsigned long *vm_flags_ptr)
3129f7896afb86 Lorenzo Stoakes 2025-03-03  894  {
3129f7896afb86 Lorenzo Stoakes 2025-03-03  895  	unsigned long err;
3129f7896afb86 Lorenzo Stoakes 2025-03-03  896  	struct vm_area_struct *vma = vrm->vma;
3129f7896afb86 Lorenzo Stoakes 2025-03-03  897  	unsigned long old_addr = vrm->addr;
3129f7896afb86 Lorenzo Stoakes 2025-03-03  898  	unsigned long old_len = vrm->old_len;
^1da177e4c3f41 Linus Torvalds  2005-04-16  899  
^1da177e4c3f41 Linus Torvalds  2005-04-16  900  	/*
^1da177e4c3f41 Linus Torvalds  2005-04-16  901  	 * We'd prefer to avoid failure later on in do_munmap:
^1da177e4c3f41 Linus Torvalds  2005-04-16  902  	 * which may split one vma into three before unmapping.
^1da177e4c3f41 Linus Torvalds  2005-04-16  903  	 */
3129f7896afb86 Lorenzo Stoakes 2025-03-03  904  	if (current->mm->map_count >= sysctl_max_map_count - 3)
^1da177e4c3f41 Linus Torvalds  2005-04-16  905  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds  2005-04-16  906  
73d5e06299195f Dmitry Safonov  2020-12-14  907  	if (vma->vm_ops && vma->vm_ops->may_split) {
73d5e06299195f Dmitry Safonov  2020-12-14  908  		if (vma->vm_start != old_addr)
73d5e06299195f Dmitry Safonov  2020-12-14  909  			err = vma->vm_ops->may_split(vma, old_addr);

Uninitialized on else path.

73d5e06299195f Dmitry Safonov  2020-12-14 @910  		if (!err && vma->vm_end != old_addr + old_len)
73d5e06299195f Dmitry Safonov  2020-12-14  911  			err = vma->vm_ops->may_split(vma, old_addr + old_len);
73d5e06299195f Dmitry Safonov  2020-12-14  912  		if (err)
73d5e06299195f Dmitry Safonov  2020-12-14  913  			return err;
73d5e06299195f Dmitry Safonov  2020-12-14  914  	}
73d5e06299195f Dmitry Safonov  2020-12-14  915  
1ff82995731667 Hugh Dickins    2009-09-21  916  	/*
1ff82995731667 Hugh Dickins    2009-09-21  917  	 * Advise KSM to break any KSM pages in the area to be moved:
1ff82995731667 Hugh Dickins    2009-09-21  918  	 * it would be confusing if they were to turn up at the new
1ff82995731667 Hugh Dickins    2009-09-21  919  	 * location, where they happen to coincide with different KSM
1ff82995731667 Hugh Dickins    2009-09-21  920  	 * pages recently unmapped.  But leave vma->vm_flags as it was,
1ff82995731667 Hugh Dickins    2009-09-21  921  	 * so KSM can come around to merge on vma and new_vma afterwards.
1ff82995731667 Hugh Dickins    2009-09-21  922  	 */
7103ad323b1ae3 Hugh Dickins    2009-09-21  923  	err = ksm_madvise(vma, old_addr, old_addr + old_len,
3129f7896afb86 Lorenzo Stoakes 2025-03-03  924  			  MADV_UNMERGEABLE, vm_flags_ptr);
7103ad323b1ae3 Hugh Dickins    2009-09-21  925  	if (err)
7103ad323b1ae3 Hugh Dickins    2009-09-21  926  		return err;
1ff82995731667 Hugh Dickins    2009-09-21  927  
3129f7896afb86 Lorenzo Stoakes 2025-03-03  928  	return 0;
ad8ee77ea9db1f Dmitry Safonov  2020-12-14  929  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

