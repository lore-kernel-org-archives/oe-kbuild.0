Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AF1643
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Apr 2023 14:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682866228; x=1714402228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LOnN7PQx5t6Lo7ZuwzTW2hzMAWi0iqBTJpXkcn53Qd0=;
  b=NnEvzWa0/ZXw35+VKuNEaQlNJWF84ICWVpihQ3yPPR4cohNRI570j8Ws
   lXpAGkbgfWFndOnoXqfP383w2bRHsXyxwlBdjeI0IhFEkVdTVDGFE39eY
   w0uh/t8v8UfE1DtIiQcyL6eJA3TtrEa+NcjEceQp1okwLQ2ZCoUoRJAc7
   wgCcz1J+Bvrbtjtu2Bh/vVY6cogwZLczeQcKw6mKR+sqR8Y03EAmLot/P
   9ZrZ+OJmEt8RDLCWBtt7iWAc3MZ+GcDbQTHx5UzD8iC9DSQRjPbXYDeew
   /VKfSpHfypg5n5SGLUbq5fPINT4Cjgm20SYgODGh4aaNWv+egsOsBAKH1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="328378676"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="328378676"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 07:50:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="672926130"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="672926130"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 Apr 2023 07:50:26 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pt8Nd-0001fx-2z;
	Sun, 30 Apr 2023 14:50:25 +0000
Date: Sun, 30 Apr 2023 22:49:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [zen:6.3/ksm 3/5] mm/madvise.c:1612 __do_sys_pmadv_ksm() error:
 uninitialized symbol 'ret'.
Message-ID: <202304302228.Qtio1Utw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: steven@liquorix.net

tree:   https://github.com/zen-kernel/zen-kernel 6.3/ksm
head:   6857193f0d3255d28bf5f240be377190b38b6c4c
commit: 85ca109db9d147ac5fda381842e6c98fe2e3e814 [3/5] mm: introduce pmadv_ksm system call
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230430/202304302228.Qtio1Utw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304302228.Qtio1Utw-lkp@intel.com/

smatch warnings:
mm/madvise.c:1612 __do_sys_pmadv_ksm() error: uninitialized symbol 'ret'.
mm/madvise.c:1612 __do_sys_pmadv_ksm() error: uninitialized symbol 'ret'.

vim +/ret +1612 mm/madvise.c

85ca109db9d147 Oleksandr Natalenko 2023-03-06  1525  
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1526  SYSCALL_DEFINE3(pmadv_ksm, int, pidfd, int, behaviour, unsigned int, flags)
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1527  {
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1528  #ifdef CONFIG_KSM
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1529  	ssize_t ret;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1530  	struct pid *pid;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1531  	struct task_struct *task;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1532  	struct mm_struct *mm;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1533  	unsigned int f_flags;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1534  	struct vm_area_struct *vma;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1535  	struct vma_iterator vmi;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1536  
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1537  	if (flags != 0) {
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1538  		ret = -EINVAL;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1539  		goto out;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1540  	}
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1541  
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1542  	switch (behaviour) {
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1543  		case MADV_MERGEABLE:
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1544  		case MADV_UNMERGEABLE:
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1545  			break;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1546  		default:
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1547  			ret = -EINVAL;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1548  			goto out;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1549  			break;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1550  	}
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1551  
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1552  	pid = pidfd_get_pid(pidfd, &f_flags);
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1553  	if (IS_ERR(pid)) {
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1554  		ret = PTR_ERR(pid);
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1555  		goto out;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1556  	}
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1557  
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1558  	task = get_pid_task(pid, PIDTYPE_PID);
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1559  	if (!task) {
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1560  		ret = -ESRCH;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1561  		goto put_pid;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1562  	}
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1563  
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1564  	/* Require PTRACE_MODE_READ to avoid leaking ASLR metadata. */
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1565  	mm = mm_access(task, PTRACE_MODE_READ_FSCREDS);
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1566  	if (IS_ERR_OR_NULL(mm)) {
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1567  		ret = IS_ERR(mm) ? PTR_ERR(mm) : -ESRCH;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1568  		goto release_task;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1569  	}
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1570  
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1571  	/* Require CAP_SYS_NICE for influencing process performance. */
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1572  	if (!capable(CAP_SYS_NICE)) {
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1573  		ret = -EPERM;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1574  		goto release_mm;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1575  	}
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1576  
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1577  	if (mmap_write_lock_killable(mm)) {
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1578  		ret = -EINTR;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1579  		goto release_mm;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1580  	}
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1581  
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1582  	vma_iter_init(&vmi, mm, 0);
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1583  	for_each_vma(vmi, vma) {
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1584  		switch (behaviour) {
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1585  			case MADV_MERGEABLE:
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1586  				ret = ksm_madvise_merge(vma->vm_mm, vma, &vma->vm_flags);
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1587  				if (!ret)
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1588  					vm_flags_set(vma, VM_MERGEABLE);
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1589  				break;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1590  			case MADV_UNMERGEABLE:
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1591  				ret = ksm_madvise_unmerge(vma, vma->vm_start, vma->vm_end, &vma->vm_flags);
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1592  				if (!ret)
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1593  					vm_flags_clear(vma, VM_MERGEABLE);
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1594  				break;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1595  			default:
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1596  				/* look, ma, no brain */
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1597  				break;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1598  		}
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1599  		if (ret)
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1600  			break;
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1601  	}
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1602  
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1603  	mmap_write_unlock(mm);
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1604  
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1605  release_mm:
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1606  	mmput(mm);
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1607  release_task:
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1608  	put_task_struct(task);
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1609  put_pid:
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1610  	put_pid(pid);
85ca109db9d147 Oleksandr Natalenko 2023-03-06  1611  out:
85ca109db9d147 Oleksandr Natalenko 2023-03-06 @1612  	return ret;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
