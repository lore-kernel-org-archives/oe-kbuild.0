Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06E910949
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Feb 2024 04:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708059261; cv=none; b=eBtE1wgKzhmRBz4UnqYZz8XVHyPatEc492+VL+UaDbYbF0CNTD/RK5a0Ag53ctssV1392CyuZJmA/qAHIIVGK4JIKy8nhSXfE0YRrm/SAFKtxuZUGkYGaB+fAFkFO/68eo2pVCJf3699AAAW0kPys/dDrqVzeZb3RjlJHAoMqHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708059261; c=relaxed/simple;
	bh=uFMuo6yfMq762MyRNcpfWVdfPGWwtHBNxTazz1oSimw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tRT0Ku6POHnLcRggShp13xMWqHr1mejIeOqoaMF/X/aURW2cTC6Ti9iKNHBvB0MabI+GV5gE8/IqGo+/j82XLY4Sh/Nib57RdVC0FFpzQBrlV63I3ejZIwWUfZO15RzzcoerZDz/wFyCS76qEbvTRog7nO+LBPI7d6qk05Gqkq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mf1t2L+3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mf1t2L+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708059258; x=1739595258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uFMuo6yfMq762MyRNcpfWVdfPGWwtHBNxTazz1oSimw=;
  b=Mf1t2L+3IKDh2OdcP+BU95T/duKIwhPrixfirM3OE9+B67hWB8PQMgVH
   ENOw2tzeSBTHOv1rt7EV1h8FYc4qmeUTsmSsXuZFjeHUnDYxh3Tsf54CS
   74oyD8cIyo4oddJrBLM407jS3pol27+/WIKndSwLf1LAB0ZezT2xhdPRv
   gPrjadtXgXep4GwiPQbx5O1UmHVwRnnjd7uIBkSIK5xEYhRKaOEzQYwMI
   uil+zD5vmFbEZbWPVekZdWOrlT16FM0L2b6C+rPSRfrsx7bC8muxKTyTJ
   qpQr+jgdO5W3Obx0or/ER1VVJlo7wWxrdUAvzD2t5LJL8hst8rTkWmQLd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2049619"
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="2049619"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 20:54:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="8413020"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 15 Feb 2024 20:54:16 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raqEn-00010K-0M;
	Fri, 16 Feb 2024 04:54:13 +0000
Date: Fri, 16 Feb 2024 12:53:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6288/6884] mm/mempolicy.c:1336 do_mbind() warn:
 iterator used outside loop: 'page'
Message-ID: <202402161250.VOQuShb8-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Wei Yang <richard.weiyang@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   26d7d52b6253574d5b6fec16a93e1110d1489cef
commit: e2f24b69b984c4196c4f0ceaefe467aedd2f9597 [6288/6884] list: leverage list_is_head() for list_entry_is_head()
:::::: branch date: 25 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20240215 (https://download.01.org/0day-ci/archive/20240216/202402161250.VOQuShb8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402161250.VOQuShb8-lkp@intel.com/

smatch warnings:
mm/mempolicy.c:1336 do_mbind() warn: iterator used outside loop: 'page'

vim +/page +1336 mm/mempolicy.c

b20a35035f983f4 Christoph Lameter 2006-03-22  1217  
dbcb0f19c877df9 Adrian Bunk       2007-10-16  1218  static long do_mbind(unsigned long start, unsigned long len,
028fec414d80311 David Rientjes    2008-04-28  1219  		     unsigned short mode, unsigned short mode_flags,
028fec414d80311 David Rientjes    2008-04-28  1220  		     nodemask_t *nmask, unsigned long flags)
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1221  {
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1222  	struct mm_struct *mm = current->mm;
f4e9e0e69468583 Liam R. Howlett   2023-04-10  1223  	struct vm_area_struct *vma, *prev;
f4e9e0e69468583 Liam R. Howlett   2023-04-10  1224  	struct vma_iterator vmi;
88c91dc58582f1d Hugh Dickins      2023-10-03  1225  	struct migration_mpol mmpol;
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1226  	struct mempolicy *new;
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1227  	unsigned long end;
1cb5d11a370f661 Hugh Dickins      2023-10-03  1228  	long err;
1cb5d11a370f661 Hugh Dickins      2023-10-03  1229  	long nr_failed;
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1230  	LIST_HEAD(pagelist);
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1231  
b24f53a0bea38b2 Lee Schermerhorn  2012-10-25  1232  	if (flags & ~(unsigned long)MPOL_MF_VALID)
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1233  		return -EINVAL;
74c002410548c7c Christoph Lameter 2006-03-14  1234  	if ((flags & MPOL_MF_MOVE_ALL) && !capable(CAP_SYS_NICE))
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1235  		return -EPERM;
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1236  
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1237  	if (start & ~PAGE_MASK)
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1238  		return -EINVAL;
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1239  
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1240  	if (mode == MPOL_DEFAULT)
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1241  		flags &= ~MPOL_MF_STRICT;
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1242  
aaa31e058dd8245 ze zuo            2022-09-13  1243  	len = PAGE_ALIGN(len);
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1244  	end = start + len;
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1245  
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1246  	if (end < start)
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1247  		return -EINVAL;
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1248  	if (end == start)
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1249  		return 0;
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1250  
028fec414d80311 David Rientjes    2008-04-28  1251  	new = mpol_new(mode, mode_flags, nmask);
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1252  	if (IS_ERR(new))
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1253  		return PTR_ERR(new);
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1254  
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1255  	/*
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1256  	 * If we are using the default policy then operation
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1257  	 * on discontinuous address spaces is okay after all
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1258  	 */
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1259  	if (!new)
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1260  		flags |= MPOL_MF_DISCONTIG_OK;
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1261  
1cb5d11a370f661 Hugh Dickins      2023-10-03  1262  	if (flags & (MPOL_MF_MOVE | MPOL_MF_MOVE_ALL))
361a2a229fa31ab Minchan Kim       2021-05-04  1263  		lru_cache_disable();
4bfc44958e499af KAMEZAWA Hiroyuki 2009-08-06  1264  	{
4bfc44958e499af KAMEZAWA Hiroyuki 2009-08-06  1265  		NODEMASK_SCRATCH(scratch);
4bfc44958e499af KAMEZAWA Hiroyuki 2009-08-06  1266  		if (scratch) {
d8ed45c5dcd455f Michel Lespinasse 2020-06-08  1267  			mmap_write_lock(mm);
4bfc44958e499af KAMEZAWA Hiroyuki 2009-08-06  1268  			err = mpol_set_nodemask(new, nmask, scratch);
4bfc44958e499af KAMEZAWA Hiroyuki 2009-08-06  1269  			if (err)
d8ed45c5dcd455f Michel Lespinasse 2020-06-08  1270  				mmap_write_unlock(mm);
4bfc44958e499af KAMEZAWA Hiroyuki 2009-08-06  1271  		} else
4bfc44958e499af KAMEZAWA Hiroyuki 2009-08-06  1272  			err = -ENOMEM;
4bfc44958e499af KAMEZAWA Hiroyuki 2009-08-06  1273  		NODEMASK_SCRATCH_FREE(scratch);
4bfc44958e499af KAMEZAWA Hiroyuki 2009-08-06  1274  	}
b05ca7385a2848a KOSAKI Motohiro   2009-10-26  1275  	if (err)
b05ca7385a2848a KOSAKI Motohiro   2009-10-26  1276  		goto mpol_out;
b05ca7385a2848a KOSAKI Motohiro   2009-10-26  1277  
6c21e066f9256ea Jann Horn         2023-07-28  1278  	/*
1cb5d11a370f661 Hugh Dickins      2023-10-03  1279  	 * Lock the VMAs before scanning for pages to migrate,
1cb5d11a370f661 Hugh Dickins      2023-10-03  1280  	 * to ensure we don't miss a concurrently inserted page.
6c21e066f9256ea Jann Horn         2023-07-28  1281  	 */
1cb5d11a370f661 Hugh Dickins      2023-10-03  1282  	nr_failed = queue_pages_range(mm, start, end, nmask,
1cb5d11a370f661 Hugh Dickins      2023-10-03  1283  			flags | MPOL_MF_INVERT | MPOL_MF_WRLOCK, &pagelist);
d883544515aae54 Yang Shi          2019-08-13  1284  
1cb5d11a370f661 Hugh Dickins      2023-10-03  1285  	if (nr_failed < 0) {
1cb5d11a370f661 Hugh Dickins      2023-10-03  1286  		err = nr_failed;
72e315f7a750281 Hugh Dickins      2023-10-03  1287  		nr_failed = 0;
1cb5d11a370f661 Hugh Dickins      2023-10-03  1288  	} else {
f4e9e0e69468583 Liam R. Howlett   2023-04-10  1289  		vma_iter_init(&vmi, mm, start);
f4e9e0e69468583 Liam R. Howlett   2023-04-10  1290  		prev = vma_prev(&vmi);
f4e9e0e69468583 Liam R. Howlett   2023-04-10  1291  		for_each_vma_range(vmi, vma, end) {
f4e9e0e69468583 Liam R. Howlett   2023-04-10  1292  			err = mbind_range(&vmi, vma, &prev, start, end, new);
f4e9e0e69468583 Liam R. Howlett   2023-04-10  1293  			if (err)
f4e9e0e69468583 Liam R. Howlett   2023-04-10  1294  				break;
f4e9e0e69468583 Liam R. Howlett   2023-04-10  1295  		}
1cb5d11a370f661 Hugh Dickins      2023-10-03  1296  	}
7e2ab150d1b3b28 Christoph Lameter 2006-02-01  1297  
72e315f7a750281 Hugh Dickins      2023-10-03  1298  	if (!err && !list_empty(&pagelist)) {
72e315f7a750281 Hugh Dickins      2023-10-03  1299  		/* Convert MPOL_DEFAULT's NULL to task or default policy */
72e315f7a750281 Hugh Dickins      2023-10-03  1300  		if (!new) {
72e315f7a750281 Hugh Dickins      2023-10-03  1301  			new = get_task_policy(current);
72e315f7a750281 Hugh Dickins      2023-10-03  1302  			mpol_get(new);
cf608ac19c95804 Minchan Kim       2010-10-26  1303  		}
88c91dc58582f1d Hugh Dickins      2023-10-03  1304  		mmpol.pol = new;
88c91dc58582f1d Hugh Dickins      2023-10-03  1305  		mmpol.ilx = 0;
b24f53a0bea38b2 Lee Schermerhorn  2012-10-25  1306  
88c91dc58582f1d Hugh Dickins      2023-10-03  1307  		/*
88c91dc58582f1d Hugh Dickins      2023-10-03  1308  		 * In the interleaved case, attempt to allocate on exactly the
88c91dc58582f1d Hugh Dickins      2023-10-03  1309  		 * targeted nodes, for the first VMA to be migrated; for later
88c91dc58582f1d Hugh Dickins      2023-10-03  1310  		 * VMAs, the nodes will still be interleaved from the targeted
88c91dc58582f1d Hugh Dickins      2023-10-03  1311  		 * nodemask, but one by one may be selected differently.
88c91dc58582f1d Hugh Dickins      2023-10-03  1312  		 */
88c91dc58582f1d Hugh Dickins      2023-10-03  1313  		if (new->mode == MPOL_INTERLEAVE) {
88c91dc58582f1d Hugh Dickins      2023-10-03  1314  			struct page *page;
88c91dc58582f1d Hugh Dickins      2023-10-03  1315  			unsigned int order;
88c91dc58582f1d Hugh Dickins      2023-10-03  1316  			unsigned long addr = -EFAULT;
88c91dc58582f1d Hugh Dickins      2023-10-03  1317  
88c91dc58582f1d Hugh Dickins      2023-10-03  1318  			list_for_each_entry(page, &pagelist, lru) {
88c91dc58582f1d Hugh Dickins      2023-10-03  1319  				if (!PageKsm(page))
88c91dc58582f1d Hugh Dickins      2023-10-03  1320  					break;
88c91dc58582f1d Hugh Dickins      2023-10-03  1321  			}
88c91dc58582f1d Hugh Dickins      2023-10-03  1322  			if (!list_entry_is_head(page, &pagelist, lru)) {
88c91dc58582f1d Hugh Dickins      2023-10-03  1323  				vma_iter_init(&vmi, mm, start);
88c91dc58582f1d Hugh Dickins      2023-10-03  1324  				for_each_vma_range(vmi, vma, end) {
88c91dc58582f1d Hugh Dickins      2023-10-03  1325  					addr = page_address_in_vma(page, vma);
88c91dc58582f1d Hugh Dickins      2023-10-03  1326  					if (addr != -EFAULT)
88c91dc58582f1d Hugh Dickins      2023-10-03  1327  						break;
88c91dc58582f1d Hugh Dickins      2023-10-03  1328  				}
88c91dc58582f1d Hugh Dickins      2023-10-03  1329  			}
88c91dc58582f1d Hugh Dickins      2023-10-03  1330  			if (addr != -EFAULT) {
88c91dc58582f1d Hugh Dickins      2023-10-03  1331  				order = compound_order(page);
88c91dc58582f1d Hugh Dickins      2023-10-03  1332  				/* We already know the pol, but not the ilx */
88c91dc58582f1d Hugh Dickins      2023-10-03  1333  				mpol_cond_put(get_vma_policy(vma, addr, order,
88c91dc58582f1d Hugh Dickins      2023-10-03  1334  							     &mmpol.ilx));
88c91dc58582f1d Hugh Dickins      2023-10-03  1335  				/* Set base from which to increment by index */
88c91dc58582f1d Hugh Dickins      2023-10-03 @1336  				mmpol.ilx -= page->index >> order;
88c91dc58582f1d Hugh Dickins      2023-10-03  1337  			}
88c91dc58582f1d Hugh Dickins      2023-10-03  1338  		}
cf608ac19c95804 Minchan Kim       2010-10-26  1339  	}
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1340  
88c91dc58582f1d Hugh Dickins      2023-10-03  1341  	mmap_write_unlock(mm);
88c91dc58582f1d Hugh Dickins      2023-10-03  1342  
88c91dc58582f1d Hugh Dickins      2023-10-03  1343  	if (!err && !list_empty(&pagelist)) {
72e315f7a750281 Hugh Dickins      2023-10-03  1344  		nr_failed |= migrate_pages(&pagelist,
72e315f7a750281 Hugh Dickins      2023-10-03  1345  				alloc_migration_target_by_mpol, NULL,
88c91dc58582f1d Hugh Dickins      2023-10-03  1346  				(unsigned long)&mmpol, MIGRATE_SYNC,
72e315f7a750281 Hugh Dickins      2023-10-03  1347  				MR_MEMPOLICY_MBIND, NULL);
1cb5d11a370f661 Hugh Dickins      2023-10-03  1348  	}
1cb5d11a370f661 Hugh Dickins      2023-10-03  1349  
72e315f7a750281 Hugh Dickins      2023-10-03  1350  	if (nr_failed && (flags & MPOL_MF_STRICT))
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1351  		err = -EIO;
a85dfc305a21acf Yang Shi          2019-11-15  1352  	if (!list_empty(&pagelist))
b0e5fd7359f1ce8 Joonsoo Kim       2013-12-18  1353  		putback_movable_pages(&pagelist);
b05ca7385a2848a KOSAKI Motohiro   2009-10-26  1354  mpol_out:
f0be3d32b05d3fe Lee Schermerhorn  2008-04-28  1355  	mpol_put(new);
d479960e44f27e0 Minchan Kim       2021-05-04  1356  	if (flags & (MPOL_MF_MOVE | MPOL_MF_MOVE_ALL))
361a2a229fa31ab Minchan Kim       2021-05-04  1357  		lru_cache_enable();
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1358  	return err;
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1359  }
6ce3c4c0ff62ca6 Christoph Lameter 2006-01-08  1360  

:::::: The code at line 1336 was first introduced by commit
:::::: 88c91dc58582f1d0c6f5f501051b0262d06ec4ed mempolicy: migration attempt to match interleave nodes

:::::: TO: Hugh Dickins <hughd@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
