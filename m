Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29F217CD;
	Fri, 23 Dec 2022 10:53:41 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so3277098wms.2;
        Fri, 23 Dec 2022 02:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X2/KBeOm5WvTRrZMcgOXpdegb3AFX1I4OlQWMmak0Hw=;
        b=lG6cuL5FI/ZSBZ4WwnoRPM8Y2GCZSpH/7ly5QCJjmrLdFafkFJFiDc1y/rYGoEC2G5
         hfCmbMMjpav4C57wio+QMecbiLYwUQfQJGv2n+HzSWo1cNZGx0K04NwZV9YBgrbol4/q
         x68K06KUOjvnRCCNV9AUBicVI2OviOVfK8MI9dg7yauO49kU7Xl4xjJsRrB9eFe4OEKd
         H2g563za4Tn6qXIObjAXmCfiZfR9EYUVqq6Fvp03ugeOu4GIGf5D3nE5QYhBeMx+ot/W
         g5zQC6psCtxJ+95ESCsB+v4XtQU1J0u90c2+v/oykf9P/mvYUOs8hNbpGk2s55klvAxI
         AhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X2/KBeOm5WvTRrZMcgOXpdegb3AFX1I4OlQWMmak0Hw=;
        b=hGP6lDW3Fa3YsIaKscvGyhhNn0BDBpV4U+r6dTCwE5rYzmCWPBlKm53ClP1nLmWAZU
         tCd+kyZBUEU3CE7lTjYUQJ0aApkMW8yil5pMmoPjOmFJhePHd0dClY4f/kjwPxX2Lhvd
         voX6xK9fOuDQoLLl85mVx7v63NsId+NTkJraNd0wCKs80u3xz3/d0c23qlOzpFA9m/8f
         g/JwHLkKv+mcUl4wN1w7e6cbNVIad3McN9HYOpK0OBGDYWenG6vCZpcl2Oo/rYhAUAxf
         Hmg+YU5zBr9gUlLKtabrZx6hkjzdE7WnzNXk0zeIIIXvkXQnnArbENdm/WKYBBngJYbC
         Oiyw==
X-Gm-Message-State: AFqh2krUuzlP+PE/xpOrUvct9mAzPjdNjTuBQTohzlbsmf0or5nAdt8F
	+vB3eCgkH9W5g2PsviUu0XKg18QTgUpvnw==
X-Google-Smtp-Source: AMrXdXuAj5867ALnN79KMy8nBqV5bAl323GGJlfhZ6eMH+F5ie5gBbtr8PniGhgPu7K7+hIGy792lw==
X-Received: by 2002:a05:600c:34c4:b0:3d1:bf7c:391c with SMTP id d4-20020a05600c34c400b003d1bf7c391cmr9696299wmq.4.1671792819768;
        Fri, 23 Dec 2022 02:53:39 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t6-20020a05600c198600b003d07de1698asm9596250wmq.46.2022.12.23.02.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 02:53:39 -0800 (PST)
Date: Fri, 23 Dec 2022 13:53:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, steven@liquorix.net
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [zen:6.1/ksm 3/5] mm/madvise.c:1598 __do_sys_pmadv_ksm() error:
 uninitialized symbol 'ret'.
Message-ID: <202212180655.CtZfq7S6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221223105331._c7qnLWZQRRDqApZYixLjhA5kTG4_5LsDWpihanRYF0@z>

tree:   https://github.com/zen-kernel/zen-kernel 6.1/ksm
head:   0631dfe8ed582b8e764ae7ec123ecea913b5cd2f
commit: 4cebef89a624559aeb3037128995ba2eab545757 [3/5] mm: introduce pmadv_ksm system call
config: x86_64-randconfig-m001
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
mm/madvise.c:1598 __do_sys_pmadv_ksm() error: uninitialized symbol 'ret'.
mm/madvise.c:1598 __do_sys_pmadv_ksm() error: uninitialized symbol 'ret'.

vim +/ret +1598 mm/madvise.c

4cebef89a62455 Oleksandr Natalenko 2021-10-04  1516  SYSCALL_DEFINE3(pmadv_ksm, int, pidfd, int, behaviour, unsigned int, flags)
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1517  {
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1518  #ifdef CONFIG_KSM
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1519  	ssize_t ret;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1520  	struct pid *pid;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1521  	struct task_struct *task;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1522  	struct mm_struct *mm;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1523  	unsigned int f_flags;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1524  	struct vm_area_struct *vma;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1525  	struct vma_iterator vmi;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1526  
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1527  	if (flags != 0) {
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1528  		ret = -EINVAL;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1529  		goto out;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1530  	}
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1531  
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1532  	switch (behaviour) {
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1533  		case MADV_MERGEABLE:
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1534  		case MADV_UNMERGEABLE:
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1535  			break;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1536  		default:
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1537  			ret = -EINVAL;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1538  			goto out;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1539  			break;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1540  	}
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1541  
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1542  	pid = pidfd_get_pid(pidfd, &f_flags);
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1543  	if (IS_ERR(pid)) {
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1544  		ret = PTR_ERR(pid);
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1545  		goto out;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1546  	}
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1547  
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1548  	task = get_pid_task(pid, PIDTYPE_PID);
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1549  	if (!task) {
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1550  		ret = -ESRCH;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1551  		goto put_pid;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1552  	}
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1553  
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1554  	/* Require PTRACE_MODE_READ to avoid leaking ASLR metadata. */
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1555  	mm = mm_access(task, PTRACE_MODE_READ_FSCREDS);
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1556  	if (IS_ERR_OR_NULL(mm)) {
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1557  		ret = IS_ERR(mm) ? PTR_ERR(mm) : -ESRCH;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1558  		goto release_task;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1559  	}
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1560  
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1561  	/* Require CAP_SYS_NICE for influencing process performance. */
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1562  	if (!capable(CAP_SYS_NICE)) {
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1563  		ret = -EPERM;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1564  		goto release_mm;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1565  	}
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1566  
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1567  	if (mmap_write_lock_killable(mm)) {
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1568  		ret = -EINTR;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1569  		goto release_mm;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1570  	}
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1571  
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1572  	vma_iter_init(&vmi, mm, 0);
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1573  	for_each_vma(vmi, vma) {
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1574  		switch (behaviour) {
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1575  			case MADV_MERGEABLE:
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1576  				ret = ksm_madvise_merge(vma->vm_mm, vma, &vma->vm_flags);
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1577  				break;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1578  			case MADV_UNMERGEABLE:
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1579  				ret = ksm_madvise_unmerge(vma, vma->vm_start, vma->vm_end, &vma->vm_flags);
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1580  				break;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1581  			default:
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1582  				/* look, ma, no brain */

no error code.

4cebef89a62455 Oleksandr Natalenko 2021-10-04  1583  				break;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1584  		}
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1585  		if (ret)
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1586  			break;
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1587  	}
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1588  
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1589  	mmap_write_unlock(mm);
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1590  
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1591  release_mm:
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1592  	mmput(mm);
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1593  release_task:
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1594  	put_task_struct(task);
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1595  put_pid:
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1596  	put_pid(pid);
4cebef89a62455 Oleksandr Natalenko 2021-10-04  1597  out:
4cebef89a62455 Oleksandr Natalenko 2021-10-04 @1598  	return ret;

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

