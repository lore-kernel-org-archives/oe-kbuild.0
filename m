Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EB112CDAE
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jul 2024 12:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721393724; cv=none; b=Y0ja2MfuhkaaEzecQucT5Wl7VsTvgs8SGnU1/yqAwr6pZ6FSo9YCTU9HNoiBmMElvNF14TGWaSekbafOv19W3tF5fZVD6W7TP84VrwHvxITPH/YwIH7ADAQKWV8HBRZ7oJa8X5NZwQivkuzWbiY9aW8v3X2bHQF/gHQbFPkoIJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721393724; c=relaxed/simple;
	bh=mO++w20QAlWUR2w6TkMKiBEi+aacLKs7JWgl80r/Ihw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qx5R++hFtKY/uVG4Bjvwy10lv16yBY/u/YNBxt1vlsxZjVkzRD7804jdW7OnFBb6f+FIm/WfGzIq3JK0qFXAt175G597kEiVqkNuk0dqpUojmDpfCvZbo4SB7rLk+E9qHFONU7gAgJd/4fUY+Na0XGLg1nCEmVmjd44XwlRPTJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cXlL646+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXlL646+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721393721; x=1752929721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mO++w20QAlWUR2w6TkMKiBEi+aacLKs7JWgl80r/Ihw=;
  b=cXlL646+yMGnYufaPpjqVs/9e3KTp+0k7njGnHnAt6G+PjLToBmYDn10
   k6DrMXBBnodnV4pRVAerkzxXy5ozQC2bLY2XFVDGRasO3SaG92+WnBlHL
   /uxJPLVSsIO0tw+bTMdoSmoffJfTALDeQ2UEreqLQVyaw+5+64GRoqIe6
   1Yd2/yl4fqJjv951sQArPEi/7ehwCgkn+GBT6Fa9nyZLAZk21fRUq2VW/
   iLLbPxdVuGvJrYnNZU2bHxynXYlDLKeuCpIJTL3GcxGU+IyB4ITPhAjL/
   8qc900GqcePn5MExlbc7dRhX36DN8Xu6c6UTPN0zHkt1IAPx/R8Kwjcjm
   g==;
X-CSE-ConnectionGUID: 7qv4/Wj3Qn6VGmnzzFSVvw==
X-CSE-MsgGUID: ntZj3jDTTJqoBauHyqCLqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="21904395"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="21904395"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 05:55:20 -0700
X-CSE-ConnectionGUID: rdt1tTjuQsmdgB61fJq+jQ==
X-CSE-MsgGUID: cQwR1/0rS9+/j5bJHPkBwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="50794702"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Jul 2024 05:55:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUn8n-000iB8-0M;
	Fri, 19 Jul 2024 12:55:17 +0000
Date: Fri, 19 Jul 2024 20:55:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/gup.c:1317 __get_user_pages() error: we previously assumed 'page'
 could be null (see line 1253)
Message-ID: <202407192059.VUTtSJh8-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Peter Xu <peterx@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Lorenzo Stoakes <lstoakes@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   720261cfc7329406a50c2a8536e0039b9dd9a4e5
commit: 57edfcfd3419b4799353d8cbd6ce49da075cfdbd mm/gup: accelerate thp gup even for "pages != NULL"
date:   11 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 11 months ago
config: arc-randconfig-r071-20240719 (https://download.01.org/0day-ci/archive/20240719/202407192059.VUTtSJh8-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407192059.VUTtSJh8-lkp@intel.com/

New smatch warnings:
mm/gup.c:1317 __get_user_pages() error: we previously assumed 'page' could be null (see line 1253)

Old smatch warnings:
arch/arc/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +/page +1317 mm/gup.c

6cd06ab12d1afd Linus Torvalds     2023-07-05  1128  
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1129  /**
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1130   * __get_user_pages() - pin user pages in memory
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1131   * @mm:		mm_struct of target mm
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1132   * @start:	starting user address
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1133   * @nr_pages:	number of pages from start to pin
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1134   * @gup_flags:	flags modifying pin behaviour
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1135   * @pages:	array that receives pointers to the pages pinned.
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1136   *		Should be at least nr_pages long. Or NULL, if caller
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1137   *		only intends to ensure the pages are faulted in.
c1e8d7c6a7a682 Michel Lespinasse  2020-06-08  1138   * @locked:     whether we're still with the mmap_lock held
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1139   *
d2dfbe47fa0e97 Liu Xiang          2019-11-30  1140   * Returns either number of pages pinned (which may be less than the
d2dfbe47fa0e97 Liu Xiang          2019-11-30  1141   * number requested), or an error. Details about the return value:
d2dfbe47fa0e97 Liu Xiang          2019-11-30  1142   *
d2dfbe47fa0e97 Liu Xiang          2019-11-30  1143   * -- If nr_pages is 0, returns 0.
d2dfbe47fa0e97 Liu Xiang          2019-11-30  1144   * -- If nr_pages is >0, but no pages were pinned, returns -errno.
d2dfbe47fa0e97 Liu Xiang          2019-11-30  1145   * -- If nr_pages is >0, and some pages were pinned, returns the number of
d2dfbe47fa0e97 Liu Xiang          2019-11-30  1146   *    pages pinned. Again, this may be less than nr_pages.
2d3a36a4796437 Michal Hocko       2020-06-03  1147   * -- 0 return value is possible when the fault would need to be retried.
d2dfbe47fa0e97 Liu Xiang          2019-11-30  1148   *
d2dfbe47fa0e97 Liu Xiang          2019-11-30  1149   * The caller is responsible for releasing returned @pages, via put_page().
d2dfbe47fa0e97 Liu Xiang          2019-11-30  1150   *
c1e8d7c6a7a682 Michel Lespinasse  2020-06-08  1151   * Must be called with mmap_lock held.  It may be released.  See below.
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1152   *
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1153   * __get_user_pages walks a process's page tables and takes a reference to
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1154   * each struct page that each user address corresponds to at a given
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1155   * instant. That is, it takes the page that would be accessed if a user
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1156   * thread accesses the given user virtual address at that instant.
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1157   *
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1158   * This does not guarantee that the page exists in the user mappings when
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1159   * __get_user_pages returns, and there may even be a completely different
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1160   * page there in some cases (eg. if mmapped pagecache has been invalidated
c5acf1f6f0a11b Jongwoo Han        2023-01-26  1161   * and subsequently re-faulted). However it does guarantee that the page
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1162   * won't be freed completely. And mostly callers simply care that the page
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1163   * contains data that was valid *at some point in time*. Typically, an IO
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1164   * or similar operation cannot guarantee anything stronger anyway because
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1165   * locks can't be held over the syscall boundary.
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1166   *
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1167   * If @gup_flags & FOLL_WRITE == 0, the page must not be written to. If
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1168   * the page is written to, set_page_dirty (or set_page_dirty_lock, as
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1169   * appropriate) must be called after the page is finished with, and
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1170   * before put_page is called.
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1171   *
9a863a6a51394b Jason Gunthorpe    2023-01-24  1172   * If FOLL_UNLOCKABLE is set without FOLL_NOWAIT then the mmap_lock may
9a863a6a51394b Jason Gunthorpe    2023-01-24  1173   * be released. If this happens *@locked will be set to 0 on return.
9a95f3cf7b33d6 Paul Cassella      2014-08-06  1174   *
9a863a6a51394b Jason Gunthorpe    2023-01-24  1175   * A caller using such a combination of @gup_flags must therefore hold the
9a863a6a51394b Jason Gunthorpe    2023-01-24  1176   * mmap_lock for reading only, and recognize when it's been released. Otherwise,
9a863a6a51394b Jason Gunthorpe    2023-01-24  1177   * it must be held for either reading or writing and will not be released.
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1178   *
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1179   * In most cases, get_user_pages or get_user_pages_fast should be used
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1180   * instead of __get_user_pages. __get_user_pages should be used only if
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1181   * you need some special @gup_flags.
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1182   */
64019a2e467a28 Peter Xu           2020-08-11  1183  static long __get_user_pages(struct mm_struct *mm,
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1184  		unsigned long start, unsigned long nr_pages,
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1185  		unsigned int gup_flags, struct page **pages,
b2cac248191b74 Lorenzo Stoakes    2023-05-17  1186  		int *locked)
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1187  {
df06b37ffe5a44 Keith Busch        2018-10-26  1188  	long ret = 0, i = 0;
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1189  	struct vm_area_struct *vma = NULL;
df06b37ffe5a44 Keith Busch        2018-10-26  1190  	struct follow_page_context ctx = { NULL };
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1191  
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1192  	if (!nr_pages)
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1193  		return 0;
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1194  
428e106ae1ad4e Kirill A. Shutemov 2023-03-12  1195  	start = untagged_addr_remote(mm, start);
f9652594195fca Andrey Konovalov   2019-09-25  1196  
eddb1c228f7951 John Hubbard       2020-01-30  1197  	VM_BUG_ON(!!pages != !!(gup_flags & (FOLL_GET | FOLL_PIN)));
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1198  
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1199  	do {
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1200  		struct page *page;
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1201  		unsigned int foll_flags = gup_flags;
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1202  		unsigned int page_increm;
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1203  
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1204  		/* first iteration or cross vma bound */
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1205  		if (!vma || start >= vma->vm_end) {
6cd06ab12d1afd Linus Torvalds     2023-07-05  1206  			vma = gup_vma_lookup(mm, start);
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1207  			if (!vma && in_gate_area(mm, start)) {
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1208  				ret = get_gate_page(mm, start & PAGE_MASK,
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1209  						gup_flags, &vma,
ffe1e7861211aa Peter Xu           2023-06-28  1210  						pages ? &page : NULL);
f2b495ca82e188 Kirill A. Shutemov 2014-06-04  1211  				if (ret)
08be37b798921a John Hubbard       2018-11-30  1212  					goto out;
df06b37ffe5a44 Keith Busch        2018-10-26  1213  				ctx.page_mask = 0;
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1214  				goto next_page;
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1215  			}
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1216  
52650c8b466bac Jason Gunthorpe    2020-12-14  1217  			if (!vma) {
df06b37ffe5a44 Keith Busch        2018-10-26  1218  				ret = -EFAULT;
df06b37ffe5a44 Keith Busch        2018-10-26  1219  				goto out;
df06b37ffe5a44 Keith Busch        2018-10-26  1220  			}
52650c8b466bac Jason Gunthorpe    2020-12-14  1221  			ret = check_vma_flags(vma, gup_flags);
52650c8b466bac Jason Gunthorpe    2020-12-14  1222  			if (ret)
52650c8b466bac Jason Gunthorpe    2020-12-14  1223  				goto out;
52650c8b466bac Jason Gunthorpe    2020-12-14  1224  
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1225  			if (is_vm_hugetlb_page(vma)) {
b2cac248191b74 Lorenzo Stoakes    2023-05-17  1226  				i = follow_hugetlb_page(mm, vma, pages,
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1227  							&start, &nr_pages, i,
a308c71bf1e6e1 Peter Xu           2020-08-21  1228  							gup_flags, locked);
9a863a6a51394b Jason Gunthorpe    2023-01-24  1229  				if (!*locked) {
ad415db817964e Peter Xu           2020-04-01  1230  					/*
ad415db817964e Peter Xu           2020-04-01  1231  					 * We've got a VM_FAULT_RETRY
c1e8d7c6a7a682 Michel Lespinasse  2020-06-08  1232  					 * and we've lost mmap_lock.
ad415db817964e Peter Xu           2020-04-01  1233  					 * We must stop here.
ad415db817964e Peter Xu           2020-04-01  1234  					 */
ad415db817964e Peter Xu           2020-04-01  1235  					BUG_ON(gup_flags & FOLL_NOWAIT);
ad415db817964e Peter Xu           2020-04-01  1236  					goto out;
ad415db817964e Peter Xu           2020-04-01  1237  				}
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1238  				continue;
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1239  			}
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1240  		}
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1241  retry:
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1242  		/*
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1243  		 * If we have a pending SIGKILL, don't keep faulting pages and
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1244  		 * potentially allocating memory.
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1245  		 */
fa45f1162f28cb Davidlohr Bueso    2019-01-03  1246  		if (fatal_signal_pending(current)) {
d180870d83dbb0 Michal Hocko       2020-04-20  1247  			ret = -EINTR;
df06b37ffe5a44 Keith Busch        2018-10-26  1248  			goto out;
df06b37ffe5a44 Keith Busch        2018-10-26  1249  		}
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1250  		cond_resched();
df06b37ffe5a44 Keith Busch        2018-10-26  1251  
df06b37ffe5a44 Keith Busch        2018-10-26  1252  		page = follow_page_mask(vma, start, foll_flags, &ctx);
a7f226604170ac David Hildenbrand  2022-05-09 @1253  		if (!page || PTR_ERR(page) == -EMLINK) {
a7f226604170ac David Hildenbrand  2022-05-09  1254  			ret = faultin_page(vma, start, &foll_flags,
a7f226604170ac David Hildenbrand  2022-05-09  1255  					   PTR_ERR(page) == -EMLINK, locked);
1674448345cdb5 Kirill A. Shutemov 2014-06-04  1256  			switch (ret) {
1674448345cdb5 Kirill A. Shutemov 2014-06-04  1257  			case 0:
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1258  				goto retry;
df06b37ffe5a44 Keith Busch        2018-10-26  1259  			case -EBUSY:
d92725256b4f22 Peter Xu           2022-05-30  1260  			case -EAGAIN:
df06b37ffe5a44 Keith Busch        2018-10-26  1261  				ret = 0;
e4a9bc58969abc Joe Perches        2020-04-06  1262  				fallthrough;
1674448345cdb5 Kirill A. Shutemov 2014-06-04  1263  			case -EFAULT:
1674448345cdb5 Kirill A. Shutemov 2014-06-04  1264  			case -ENOMEM:
1674448345cdb5 Kirill A. Shutemov 2014-06-04  1265  			case -EHWPOISON:
df06b37ffe5a44 Keith Busch        2018-10-26  1266  				goto out;
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1267  			}
fa5bb2093a1d2b Kirill A. Shutemov 2014-06-04  1268  			BUG();
1027e4436b6a5c Kirill A. Shutemov 2015-09-04  1269  		} else if (PTR_ERR(page) == -EEXIST) {
1027e4436b6a5c Kirill A. Shutemov 2015-09-04  1270  			/*
1027e4436b6a5c Kirill A. Shutemov 2015-09-04  1271  			 * Proper page table entry exists, but no corresponding
65462462ffb28f John Hubbard       2022-03-22  1272  			 * struct page. If the caller expects **pages to be
65462462ffb28f John Hubbard       2022-03-22  1273  			 * filled in, bail out now, because that can't be done
65462462ffb28f John Hubbard       2022-03-22  1274  			 * for this page.
1027e4436b6a5c Kirill A. Shutemov 2015-09-04  1275  			 */
65462462ffb28f John Hubbard       2022-03-22  1276  			if (pages) {
65462462ffb28f John Hubbard       2022-03-22  1277  				ret = PTR_ERR(page);
65462462ffb28f John Hubbard       2022-03-22  1278  				goto out;
65462462ffb28f John Hubbard       2022-03-22  1279  			}
1027e4436b6a5c Kirill A. Shutemov 2015-09-04  1280  		} else if (IS_ERR(page)) {
df06b37ffe5a44 Keith Busch        2018-10-26  1281  			ret = PTR_ERR(page);
df06b37ffe5a44 Keith Busch        2018-10-26  1282  			goto out;
1027e4436b6a5c Kirill A. Shutemov 2015-09-04  1283  		}
ffe1e7861211aa Peter Xu           2023-06-28  1284  next_page:
df06b37ffe5a44 Keith Busch        2018-10-26  1285  		page_increm = 1 + (~(start >> PAGE_SHIFT) & ctx.page_mask);
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1286  		if (page_increm > nr_pages)
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1287  			page_increm = nr_pages;
57edfcfd3419b4 Peter Xu           2023-06-28  1288  
57edfcfd3419b4 Peter Xu           2023-06-28  1289  		if (pages) {
57edfcfd3419b4 Peter Xu           2023-06-28  1290  			struct page *subpage;
57edfcfd3419b4 Peter Xu           2023-06-28  1291  			unsigned int j;
57edfcfd3419b4 Peter Xu           2023-06-28  1292  
57edfcfd3419b4 Peter Xu           2023-06-28  1293  			/*
57edfcfd3419b4 Peter Xu           2023-06-28  1294  			 * This must be a large folio (and doesn't need to
57edfcfd3419b4 Peter Xu           2023-06-28  1295  			 * be the whole folio; it can be part of it), do
57edfcfd3419b4 Peter Xu           2023-06-28  1296  			 * the refcount work for all the subpages too.
57edfcfd3419b4 Peter Xu           2023-06-28  1297  			 *
57edfcfd3419b4 Peter Xu           2023-06-28  1298  			 * NOTE: here the page may not be the head page
57edfcfd3419b4 Peter Xu           2023-06-28  1299  			 * e.g. when start addr is not thp-size aligned.
57edfcfd3419b4 Peter Xu           2023-06-28  1300  			 * try_grab_folio() should have taken care of tail
57edfcfd3419b4 Peter Xu           2023-06-28  1301  			 * pages.
57edfcfd3419b4 Peter Xu           2023-06-28  1302  			 */
57edfcfd3419b4 Peter Xu           2023-06-28  1303  			if (page_increm > 1) {
57edfcfd3419b4 Peter Xu           2023-06-28  1304  				struct folio *folio;
57edfcfd3419b4 Peter Xu           2023-06-28  1305  
57edfcfd3419b4 Peter Xu           2023-06-28  1306  				/*
57edfcfd3419b4 Peter Xu           2023-06-28  1307  				 * Since we already hold refcount on the
57edfcfd3419b4 Peter Xu           2023-06-28  1308  				 * large folio, this should never fail.
57edfcfd3419b4 Peter Xu           2023-06-28  1309  				 */
57edfcfd3419b4 Peter Xu           2023-06-28  1310  				folio = try_grab_folio(page, page_increm - 1,
57edfcfd3419b4 Peter Xu           2023-06-28  1311  						       foll_flags);
57edfcfd3419b4 Peter Xu           2023-06-28  1312  				if (WARN_ON_ONCE(!folio)) {
57edfcfd3419b4 Peter Xu           2023-06-28  1313  					/*
57edfcfd3419b4 Peter Xu           2023-06-28  1314  					 * Release the 1st page ref if the
57edfcfd3419b4 Peter Xu           2023-06-28  1315  					 * folio is problematic, fail hard.
57edfcfd3419b4 Peter Xu           2023-06-28  1316  					 */
57edfcfd3419b4 Peter Xu           2023-06-28 @1317  					gup_put_folio(page_folio(page), 1,
57edfcfd3419b4 Peter Xu           2023-06-28  1318  						      foll_flags);
57edfcfd3419b4 Peter Xu           2023-06-28  1319  					ret = -EFAULT;
57edfcfd3419b4 Peter Xu           2023-06-28  1320  					goto out;
57edfcfd3419b4 Peter Xu           2023-06-28  1321  				}
57edfcfd3419b4 Peter Xu           2023-06-28  1322  			}
57edfcfd3419b4 Peter Xu           2023-06-28  1323  
57edfcfd3419b4 Peter Xu           2023-06-28  1324  			for (j = 0; j < page_increm; j++) {
57edfcfd3419b4 Peter Xu           2023-06-28  1325  				subpage = nth_page(page, j);
57edfcfd3419b4 Peter Xu           2023-06-28  1326  				pages[i + j] = subpage;
57edfcfd3419b4 Peter Xu           2023-06-28  1327  				flush_anon_page(vma, subpage, start + j * PAGE_SIZE);
57edfcfd3419b4 Peter Xu           2023-06-28  1328  				flush_dcache_page(subpage);
57edfcfd3419b4 Peter Xu           2023-06-28  1329  			}
57edfcfd3419b4 Peter Xu           2023-06-28  1330  		}
57edfcfd3419b4 Peter Xu           2023-06-28  1331  
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1332  		i += page_increm;
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1333  		start += page_increm * PAGE_SIZE;
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1334  		nr_pages -= page_increm;
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1335  	} while (nr_pages);
df06b37ffe5a44 Keith Busch        2018-10-26  1336  out:
df06b37ffe5a44 Keith Busch        2018-10-26  1337  	if (ctx.pgmap)
df06b37ffe5a44 Keith Busch        2018-10-26  1338  		put_dev_pagemap(ctx.pgmap);
df06b37ffe5a44 Keith Busch        2018-10-26  1339  	return i ? i : ret;
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1340  }
4bbd4c776a63a0 Kirill A. Shutemov 2014-06-04  1341  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
