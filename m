Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBECD4A7CBC
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Oct 2026 13:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791381395; cv=none; b=qA2gMz6BT8vjqaQM0sqnU1U6qLjg8rrupu2eZoCt86nQ7jd4qkCPggaPJQgtQNjQlBhYql3pbJG8KuSwnb+RfYkJSnhmTzjSo0SsSkj8YLjmtraBPw4d1FM8hAXP1z4d3M1wqkcUm2Jtb3yE+oysJYjGPSm61QMlKIzG7OOJdPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791381395; c=relaxed/simple;
	bh=BeYsoe37J1gvpY7LD4shwmvluIP4P/+vDLQnqAkHZPI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JJahzRB5FRa7TfgheVVSv9hWvVu/sh6YTdnX+zr1oSZhid/PjSXGmWhubCbBbozmUHOv44ds4XjKYTtQ97khlmVfF8KdDRK/oYYbfJFy/zG1A0d1UZ2vI4dKYtlTJjH/ByRuaotEifP7Q2jx+LCaoTdGCVGcCWXq6oVco9m+G3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HIszjWPi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HIszjWPi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791381384; x=1822917384;
  h=date:from:to:cc:subject:message-id;
  bh=BeYsoe37J1gvpY7LD4shwmvluIP4P/+vDLQnqAkHZPI=;
  b=HIszjWPi5Qrv5ODIPrlZptxAnmHbBdB3FNDJCt0I3C+f/8gTludv7iTH
   poq+i8Pie5Jfb9lZ6PTAtVrvJsj0BRc9EaZXX06bg8H6EIbxYuMxDIFoI
   6UfM/d7qne7gpXu7/XAJfdG/C0yF5z87I6ktf8pZDcadtP0DrJsQLn+JB
   cmK7dGpr7UIUH7WX7dhGrcXbZb16LBFjFWS75cBT8GE6TDF50TgnzmCJ+
   rvcrKrJFDgi5WKEheObgzwV+csmxzsL97oS5CNaRO5+skSdUdApLwkxZw
   U/10/gdDV/9LyVMWeB8LT12WXiDq5+5YGfE8vNkIGEZxvmt8nDNQu/XmD
   w==;
X-CSE-ConnectionGUID: +pu4CBwES0ua48HQ4PKGkA==
X-CSE-MsgGUID: R1P2Mw7bSJqLxNOtyddO/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="38546"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="38546"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 06:56:23 -0700
X-CSE-ConnectionGUID: Q3BQKHNlSku5iHlIEbQfdw==
X-CSE-MsgGUID: Abqt3y/8QN+kbFRjQSSwkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="303739915"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 07 Oct 2026 06:56:21 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xES83-000000003MJ-2dHr;
	Wed, 07 Oct 2026 13:56:19 +0000
Date: Wed, 07 Oct 2026 15:56:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android17-6.18 15/15] mm/mmap.c:1141
 __do_sys_remap_file_pages() warn: bitwise AND condition is false here
Message-ID: <202610071520.MmJJTfs2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   4a1ebb4dbbcfe1be0fcf08551de20bba67db04fd
commit: 1b4b3f84dd61b8a073a6eaa3a160acc7755aee9f [15/15] ANDROID: mm: Introduce the VM_NO_REMAP_FILE_PAGES flag
:::::: branch date: 11 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-2200-20261006 (https://download.01.org/0day-ci/archive/20261007/202610071520.MmJJTfs2-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610071520.MmJJTfs2-lkp@intel.com/

smatch warnings:
mm/mmap.c:1141 __do_sys_remap_file_pages() warn: bitwise AND condition is false here
mm/mmap.c:1141 __do_sys_remap_file_pages() warn: bitwise AND condition is false here

vim +1141 mm/mmap.c

c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1108  
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1109  	struct mm_struct *mm = current->mm;
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1110  	struct vm_area_struct *vma;
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1111  	unsigned long populate = 0;
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1112  	unsigned long ret = -EINVAL;
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1113  	struct file *file;
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1114  	vm_flags_t vm_flags;
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1115  
ee65728e103bb7 Mike Rapoport       2022-06-27  1116  	pr_warn_once("%s (%d) uses deprecated remap_file_pages() syscall. See Documentation/mm/remap_file_pages.rst.\n",
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1117  		     current->comm, current->pid);
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1118  
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1119  	if (prot)
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1120  		return ret;
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1121  	start = start & PAGE_MASK;
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1122  	size = size & PAGE_MASK;
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1123  
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1124  	if (start + size <= start)
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1125  		return ret;
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1126  
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1127  	/* Does pgoff wrap? */
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1128  	if (pgoff + (size >> PAGE_SHIFT) < pgoff)
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1129  		return ret;
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1130  
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1131  	if (mmap_read_lock_killable(mm))
dc0ef0df7b6a90 Michal Hocko        2016-05-23  1132  		return -EINTR;
dc0ef0df7b6a90 Michal Hocko        2016-05-23  1133  
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1134  	/*
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1135  	 * Look up VMA under read lock first so we can perform the security
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1136  	 * without holding locks (which can be problematic). We reacquire a
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1137  	 * write lock later and check nothing changed underneath us.
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1138  	 */
9b593cb20283e6 Liam R. Howlett     2021-09-02  1139  	vma = vma_lookup(mm, start);
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1140  
1b4b3f84dd61b8 Isaac J. Manjarres  2026-09-18 @1141  	if (!vma || !(vma->vm_flags & VM_SHARED) || vma->vm_flags & VM_NO_REMAP_FILE_PAGES) {
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1142  		mmap_read_unlock(mm);
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1143  		return -EINVAL;
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1144  	}
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1145  
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1146  	prot |= vma->vm_flags & VM_READ ? PROT_READ : 0;
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1147  	prot |= vma->vm_flags & VM_WRITE ? PROT_WRITE : 0;
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1148  	prot |= vma->vm_flags & VM_EXEC ? PROT_EXEC : 0;
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1149  
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1150  	flags &= MAP_NONBLOCK;
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1151  	flags |= MAP_SHARED | MAP_FIXED | MAP_POPULATE;
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1152  	if (vma->vm_flags & VM_LOCKED)
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1153  		flags |= MAP_LOCKED;
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1154  
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1155  	/* Save vm_flags used to calculate prot and flags, and recheck later. */
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1156  	vm_flags = vma->vm_flags;
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1157  	file = get_file(vma->vm_file);
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1158  
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1159  	mmap_read_unlock(mm);
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1160  
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1161  	/* Call outside mmap_lock to be consistent with other callers. */
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1162  	ret = security_mmap_file(file, prot, flags);
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1163  	if (ret) {
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1164  		fput(file);
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1165  		return ret;
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1166  	}
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1167  
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1168  	ret = -EINVAL;
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1169  
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1170  	/* OK security check passed, take write lock + let it rip. */
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1171  	if (mmap_write_lock_killable(mm)) {
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1172  		fput(file);
dc0ef0df7b6a90 Michal Hocko        2016-05-23  1173  		return -EINTR;
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1174  	}
dc0ef0df7b6a90 Michal Hocko        2016-05-23  1175  
9b593cb20283e6 Liam R. Howlett     2021-09-02  1176  	vma = vma_lookup(mm, start);
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1177  
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1178  	if (!vma)
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1179  		goto out;
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1180  
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1181  	/* Make sure things didn't change under us. */
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1182  	if (vma->vm_flags != vm_flags)
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1183  		goto out;
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1184  	if (vma->vm_file != file)
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1185  		goto out;
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1186  
48f7df329474b4 Kiryl Shutsemau     2016-02-17  1187  	if (start + size > vma->vm_end) {
763ecb035029f5 Liam R. Howlett     2022-09-06  1188  		VMA_ITERATOR(vmi, mm, vma->vm_end);
763ecb035029f5 Liam R. Howlett     2022-09-06  1189  		struct vm_area_struct *next, *prev = vma;
48f7df329474b4 Kiryl Shutsemau     2016-02-17  1190  
763ecb035029f5 Liam R. Howlett     2022-09-06  1191  		for_each_vma_range(vmi, next, start + size) {
48f7df329474b4 Kiryl Shutsemau     2016-02-17  1192  			/* hole between vmas ? */
763ecb035029f5 Liam R. Howlett     2022-09-06  1193  			if (next->vm_start != prev->vm_end)
48f7df329474b4 Kiryl Shutsemau     2016-02-17  1194  				goto out;
48f7df329474b4 Kiryl Shutsemau     2016-02-17  1195  
48f7df329474b4 Kiryl Shutsemau     2016-02-17  1196  			if (next->vm_file != vma->vm_file)
48f7df329474b4 Kiryl Shutsemau     2016-02-17  1197  				goto out;
48f7df329474b4 Kiryl Shutsemau     2016-02-17  1198  
48f7df329474b4 Kiryl Shutsemau     2016-02-17  1199  			if (next->vm_flags != vma->vm_flags)
48f7df329474b4 Kiryl Shutsemau     2016-02-17  1200  				goto out;
48f7df329474b4 Kiryl Shutsemau     2016-02-17  1201  
1db43d3f373335 Liam Howlett        2022-10-25  1202  			if (start + size <= next->vm_end)
1db43d3f373335 Liam Howlett        2022-10-25  1203  				break;
1db43d3f373335 Liam Howlett        2022-10-25  1204  
763ecb035029f5 Liam R. Howlett     2022-09-06  1205  			prev = next;
48f7df329474b4 Kiryl Shutsemau     2016-02-17  1206  		}
48f7df329474b4 Kiryl Shutsemau     2016-02-17  1207  
48f7df329474b4 Kiryl Shutsemau     2016-02-17  1208  		if (!next)
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1209  			goto out;
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1210  	}
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1211  
45e55300f11495 Peter Collingbourne 2020-08-06  1212  	ret = do_mmap(vma->vm_file, start, size,
592b5fad1677aa Yu-cheng Yu         2023-06-12  1213  			prot, flags, 0, pgoff, &populate, NULL);
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1214  out:
d8ed45c5dcd455 Michel Lespinasse   2020-06-08  1215  	mmap_write_unlock(mm);
58a039e679fe72 Kiryl Shutsemau     2024-10-18  1216  	fput(file);
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1217  	if (populate)
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1218  		mm_populate(ret, populate);
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1219  	if (!IS_ERR_VALUE(ret))
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1220  		ret = 0;
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1221  	return ret;
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1222  }
c8d78c1823f465 Kiryl Shutsemau     2015-02-10  1223  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
