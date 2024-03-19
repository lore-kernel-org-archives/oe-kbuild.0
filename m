Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7708D80B
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Mar 2024 01:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710811103; cv=none; b=mUofq4IVGUTHNDu+wjhzVdJ6GuesAWrxX6BcIZD7jRF/W8RxoFQfdH6WNctFy+mfUmdqPXgPVEbxvye1wpBHRXKkrXkRD65IdMBzQqO2rMvZBvL8fVbEuTgp/eeisTutOaj0meWBJ6DLetqbP9OZPeGPNS0NOeE9VHnunySK1D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710811103; c=relaxed/simple;
	bh=nfOAzFdXf0/adNQDrXrx+6alYIZsbx6ZKdnsE4AQpLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oMlL9HfAsQcCvYQ8D9kXXL9jD5Dk6Rk/bWnIoEqCfgufx3x8ngSTZpTsAm71b+3qtGAenz0ZMBugxtDj+kthDk+C6SIlFR6vJQh1mKEsmR67JPQ/v3xzBG2uP6WtCa/01X5rn4cVsJVS3FJ8ijYVn9blAY/OJDk/oiqFdc9LlVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RhmD2APc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RhmD2APc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710811101; x=1742347101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nfOAzFdXf0/adNQDrXrx+6alYIZsbx6ZKdnsE4AQpLU=;
  b=RhmD2APc7Co0v3Zyqd/gBijfWDGncVzjtOOT0BukZMSiKTyGtZkTpmpl
   nk+c80OU4FZFVnxv8NSLNLXmRiS+HAa8WKQCjYNkHCeJqu1hiJ50m+31q
   fDESwa5uhDHuQJ/CtfJAbfE05IGoSeIylG6Y5TTWu1oIaczqbarUrswSJ
   3TdW1B5uN2TfO1VHZf7tD9Ld9lh90hxGpf/Wy3AP2+MNSCoo/Ej4M3NcJ
   7rcOt+2678HV5g6CsmcxgIbHCxNjS+3hvRykQDjV8HwkD4+bGE/Apa8jM
   YYuDtoZSi4rbauejAh5d0b3zF4+YCLzXEPdbzJkJ7IIMX3uvLf4+F2peB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5774585"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5774585"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 18:18:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="13536503"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Mar 2024 18:18:18 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmO7L-000HM5-2x;
	Tue, 19 Mar 2024 01:18:15 +0000
Date: Tue, 19 Mar 2024 09:17:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/s390/mm/extmem.c:172 query_segment_type() warn: Please consider
 using kzalloc instead of kmalloc
Message-ID: <202403190921.pQksXYOM-lkp@intel.com>
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
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Kees Cook <keescook@chromium.org>
CC: Pasha Tatashin <pasha.tatashin@soleen.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b3603fcb79b1036acae10602bffc4855a4b9af80
commit: 772dd0342727cc3c3b676b5d97c99708e75730a2 mm: enumerate all gfp flags
date:   2 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
config: s390-randconfig-r081-20240318 (https://download.01.org/0day-ci/archive/20240319/202403190921.pQksXYOM-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403190921.pQksXYOM-lkp@intel.com/

New smatch warnings:
arch/s390/mm/extmem.c:172 query_segment_type() warn: Please consider using kzalloc instead of kmalloc
arch/s390/mm/extmem.c:303 __segment_load() warn: Please consider using kzalloc instead of kmalloc
arch/s390/include/asm/idals.h:137 idal_buffer_alloc() warn: Please consider using kzalloc instead of kmalloc
drivers/s390/char/tape_core.c:486 tape_alloc_device() warn: Please consider using kzalloc instead of kmalloc
drivers/s390/char/tape_3590.c:210 tape_3592_kekl_query() warn: Please consider using kzalloc instead of kmalloc
drivers/s390/char/tape_3590.c:1531 tape_3590_setup_device() warn: Please consider using kzalloc instead of kmalloc

Old smatch warnings:
arch/s390/mm/extmem.c:173 query_segment_type() warn: Please consider using kzalloc instead of kmalloc
drivers/s390/char/tape_core.c:197 tape_state_set() warn: always true condition '(device->tape_state >= 0) => (0-u32max >= 0)'
drivers/s390/char/tape_core.c:203 tape_state_set() warn: always true condition '(newstate >= 0) => (0-u32max >= 0)'
drivers/s390/char/tape_core.c:1170 __tape_do_irq() error: we previously assumed 'request' could be null (see line 1144)

vim +172 arch/s390/mm/extmem.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  159  
^1da177e4c3f41 Linus Torvalds    2005-04-16  160  
^1da177e4c3f41 Linus Torvalds    2005-04-16  161  /* do a diag to get info about a segment.
^1da177e4c3f41 Linus Torvalds    2005-04-16  162   * fills start_address, end and vm_segtype fields
^1da177e4c3f41 Linus Torvalds    2005-04-16  163   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  164  static int
^1da177e4c3f41 Linus Torvalds    2005-04-16  165  query_segment_type (struct dcss_segment *seg)
^1da177e4c3f41 Linus Torvalds    2005-04-16  166  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  167  	unsigned long dummy, vmrc;
c2f0e8c803ceba Heiko Carstens    2010-06-08  168  	int diag_cc, rc, i;
c2f0e8c803ceba Heiko Carstens    2010-06-08  169  	struct qout64 *qout;
c2f0e8c803ceba Heiko Carstens    2010-06-08  170  	struct qin64 *qin;
^1da177e4c3f41 Linus Torvalds    2005-04-16  171  
c2f0e8c803ceba Heiko Carstens    2010-06-08 @172  	qin = kmalloc(sizeof(*qin), GFP_KERNEL | GFP_DMA);
c2f0e8c803ceba Heiko Carstens    2010-06-08  173  	qout = kmalloc(sizeof(*qout), GFP_KERNEL | GFP_DMA);
^1da177e4c3f41 Linus Torvalds    2005-04-16  174  	if ((qin == NULL) || (qout == NULL)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  175  		rc = -ENOMEM;
^1da177e4c3f41 Linus Torvalds    2005-04-16  176  		goto out_free;
^1da177e4c3f41 Linus Torvalds    2005-04-16  177  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  178  
^1da177e4c3f41 Linus Torvalds    2005-04-16  179  	/* initialize diag input parameters */
^1da177e4c3f41 Linus Torvalds    2005-04-16  180  	qin->qopcode = DCSS_FINDSEGA;
^1da177e4c3f41 Linus Torvalds    2005-04-16  181  	qin->qoutptr = (unsigned long) qout;
^1da177e4c3f41 Linus Torvalds    2005-04-16  182  	qin->qoutlen = sizeof(struct qout64);
^1da177e4c3f41 Linus Torvalds    2005-04-16  183  	memcpy (qin->qname, seg->dcss_name, 8);
^1da177e4c3f41 Linus Torvalds    2005-04-16  184  
b2300b9efe1b81 Hongjie Yang      2008-10-10  185  	diag_cc = dcss_diag(&segext_scode, qin, &dummy, &vmrc);
^1da177e4c3f41 Linus Torvalds    2005-04-16  186  
b2300b9efe1b81 Hongjie Yang      2008-10-10  187  	if (diag_cc < 0) {
b2300b9efe1b81 Hongjie Yang      2008-10-10  188  		rc = diag_cc;
b2300b9efe1b81 Hongjie Yang      2008-10-10  189  		goto out_free;
b2300b9efe1b81 Hongjie Yang      2008-10-10  190  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  191  	if (diag_cc > 1) {
baebc70a4db865 Joe Perches       2016-03-03  192  		pr_warn("Querying a DCSS type failed with rc=%ld\n", vmrc);
^1da177e4c3f41 Linus Torvalds    2005-04-16  193  		rc = dcss_diag_translate_rc (vmrc);
^1da177e4c3f41 Linus Torvalds    2005-04-16  194  		goto out_free;
^1da177e4c3f41 Linus Torvalds    2005-04-16  195  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  196  
^1da177e4c3f41 Linus Torvalds    2005-04-16  197  	if (qout->segcnt > 6) {
b8e660b83d5051 Heiko Carstens    2010-02-26  198  		rc = -EOPNOTSUPP;
^1da177e4c3f41 Linus Torvalds    2005-04-16  199  		goto out_free;
^1da177e4c3f41 Linus Torvalds    2005-04-16  200  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  201  
^1da177e4c3f41 Linus Torvalds    2005-04-16  202  	if (qout->segcnt == 1) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  203  		seg->vm_segtype = qout->range[0].start & 0xff;
^1da177e4c3f41 Linus Torvalds    2005-04-16  204  	} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  205  		/* multi-part segment. only one type supported here:
^1da177e4c3f41 Linus Torvalds    2005-04-16  206  		    - all parts are contiguous
^1da177e4c3f41 Linus Torvalds    2005-04-16  207  		    - all parts are either EW or EN type
^1da177e4c3f41 Linus Torvalds    2005-04-16  208  		    - maximum 6 parts allowed */
^1da177e4c3f41 Linus Torvalds    2005-04-16  209  		unsigned long start = qout->segstart >> PAGE_SHIFT;
^1da177e4c3f41 Linus Torvalds    2005-04-16  210  		for (i=0; i<qout->segcnt; i++) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  211  			if (((qout->range[i].start & 0xff) != SEG_TYPE_EW) &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  212  			    ((qout->range[i].start & 0xff) != SEG_TYPE_EN)) {
b8e660b83d5051 Heiko Carstens    2010-02-26  213  				rc = -EOPNOTSUPP;
^1da177e4c3f41 Linus Torvalds    2005-04-16  214  				goto out_free;
^1da177e4c3f41 Linus Torvalds    2005-04-16  215  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  216  			if (start != qout->range[i].start >> PAGE_SHIFT) {
b8e660b83d5051 Heiko Carstens    2010-02-26  217  				rc = -EOPNOTSUPP;
^1da177e4c3f41 Linus Torvalds    2005-04-16  218  				goto out_free;
^1da177e4c3f41 Linus Torvalds    2005-04-16  219  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  220  			start = (qout->range[i].end >> PAGE_SHIFT) + 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  221  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  222  		seg->vm_segtype = SEG_TYPE_EWEN;
^1da177e4c3f41 Linus Torvalds    2005-04-16  223  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  224  
^1da177e4c3f41 Linus Torvalds    2005-04-16  225  	/* analyze diag output and update seg */
^1da177e4c3f41 Linus Torvalds    2005-04-16  226  	seg->start_addr = qout->segstart;
^1da177e4c3f41 Linus Torvalds    2005-04-16  227  	seg->end = qout->segend;
^1da177e4c3f41 Linus Torvalds    2005-04-16  228  
^1da177e4c3f41 Linus Torvalds    2005-04-16  229  	memcpy (seg->range, qout->range, 6*sizeof(struct qrange));
^1da177e4c3f41 Linus Torvalds    2005-04-16  230  	seg->segcnt = qout->segcnt;
^1da177e4c3f41 Linus Torvalds    2005-04-16  231  
^1da177e4c3f41 Linus Torvalds    2005-04-16  232  	rc = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  233  
^1da177e4c3f41 Linus Torvalds    2005-04-16  234   out_free:
b2325fe1b7e565 Jesper Juhl       2005-11-07  235  	kfree(qin);
b2325fe1b7e565 Jesper Juhl       2005-11-07  236  	kfree(qout);
^1da177e4c3f41 Linus Torvalds    2005-04-16  237  	return rc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  238  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  239  
^1da177e4c3f41 Linus Torvalds    2005-04-16  240  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  241   * get info about a segment
^1da177e4c3f41 Linus Torvalds    2005-04-16  242   * possible return values:
^1da177e4c3f41 Linus Torvalds    2005-04-16  243   * -ENOSYS  : we are not running on VM
^1da177e4c3f41 Linus Torvalds    2005-04-16  244   * -EIO     : could not perform query diagnose
^1da177e4c3f41 Linus Torvalds    2005-04-16  245   * -ENOENT  : no such segment
b8e660b83d5051 Heiko Carstens    2010-02-26  246   * -EOPNOTSUPP: multi-part segment cannot be used with linux
^1da177e4c3f41 Linus Torvalds    2005-04-16  247   * -ENOMEM  : out of memory
^1da177e4c3f41 Linus Torvalds    2005-04-16  248   * 0 .. 6   : type of segment as defined in include/asm-s390/extmem.h
^1da177e4c3f41 Linus Torvalds    2005-04-16  249   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  250  int
^1da177e4c3f41 Linus Torvalds    2005-04-16  251  segment_type (char* name)
^1da177e4c3f41 Linus Torvalds    2005-04-16  252  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  253  	int rc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  254  	struct dcss_segment seg;
^1da177e4c3f41 Linus Torvalds    2005-04-16  255  
^1da177e4c3f41 Linus Torvalds    2005-04-16  256  	if (!MACHINE_IS_VM)
^1da177e4c3f41 Linus Torvalds    2005-04-16  257  		return -ENOSYS;
^1da177e4c3f41 Linus Torvalds    2005-04-16  258  
^1da177e4c3f41 Linus Torvalds    2005-04-16  259  	dcss_mkname(name, seg.dcss_name);
^1da177e4c3f41 Linus Torvalds    2005-04-16  260  	rc = query_segment_type (&seg);
^1da177e4c3f41 Linus Torvalds    2005-04-16  261  	if (rc < 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  262  		return rc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  263  	return seg.vm_segtype;
^1da177e4c3f41 Linus Torvalds    2005-04-16  264  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  265  
b2300b9efe1b81 Hongjie Yang      2008-10-10  266  /*
b2300b9efe1b81 Hongjie Yang      2008-10-10  267   * check if segment collides with other segments that are currently loaded
b2300b9efe1b81 Hongjie Yang      2008-10-10  268   * returns 1 if this is the case, 0 if no collision was found
b2300b9efe1b81 Hongjie Yang      2008-10-10  269   */
b2300b9efe1b81 Hongjie Yang      2008-10-10  270  static int
b2300b9efe1b81 Hongjie Yang      2008-10-10  271  segment_overlaps_others (struct dcss_segment *seg)
b2300b9efe1b81 Hongjie Yang      2008-10-10  272  {
b2300b9efe1b81 Hongjie Yang      2008-10-10  273  	struct list_head *l;
b2300b9efe1b81 Hongjie Yang      2008-10-10  274  	struct dcss_segment *tmp;
b2300b9efe1b81 Hongjie Yang      2008-10-10  275  
b2300b9efe1b81 Hongjie Yang      2008-10-10  276  	BUG_ON(!mutex_is_locked(&dcss_lock));
b2300b9efe1b81 Hongjie Yang      2008-10-10  277  	list_for_each(l, &dcss_list) {
b2300b9efe1b81 Hongjie Yang      2008-10-10  278  		tmp = list_entry(l, struct dcss_segment, list);
b2300b9efe1b81 Hongjie Yang      2008-10-10  279  		if ((tmp->start_addr >> 20) > (seg->end >> 20))
b2300b9efe1b81 Hongjie Yang      2008-10-10  280  			continue;
b2300b9efe1b81 Hongjie Yang      2008-10-10  281  		if ((tmp->end >> 20) < (seg->start_addr >> 20))
b2300b9efe1b81 Hongjie Yang      2008-10-10  282  			continue;
b2300b9efe1b81 Hongjie Yang      2008-10-10  283  		if (seg == tmp)
b2300b9efe1b81 Hongjie Yang      2008-10-10  284  			continue;
b2300b9efe1b81 Hongjie Yang      2008-10-10  285  		return 1;
b2300b9efe1b81 Hongjie Yang      2008-10-10  286  	}
b2300b9efe1b81 Hongjie Yang      2008-10-10  287  	return 0;
b2300b9efe1b81 Hongjie Yang      2008-10-10  288  }
b2300b9efe1b81 Hongjie Yang      2008-10-10  289  
^1da177e4c3f41 Linus Torvalds    2005-04-16  290  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  291   * real segment loading function, called from segment_load
8c42dd78df148c Gerald Schaefer   2023-02-27  292   * Must return either an error code < 0, or the segment type code >= 0
^1da177e4c3f41 Linus Torvalds    2005-04-16  293   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  294  static int
^1da177e4c3f41 Linus Torvalds    2005-04-16  295  __segment_load (char *name, int do_nonshared, unsigned long *addr, unsigned long *end)
^1da177e4c3f41 Linus Torvalds    2005-04-16  296  {
b2300b9efe1b81 Hongjie Yang      2008-10-10  297  	unsigned long start_addr, end_addr, dummy;
c2f0e8c803ceba Heiko Carstens    2010-06-08  298  	struct dcss_segment *seg;
8c42dd78df148c Gerald Schaefer   2023-02-27  299  	int rc, diag_cc, segtype;
^1da177e4c3f41 Linus Torvalds    2005-04-16  300  
89db4df160948d Heiko Carstens    2011-05-23  301  	start_addr = end_addr = 0;
8c42dd78df148c Gerald Schaefer   2023-02-27  302  	segtype = -1;
c2f0e8c803ceba Heiko Carstens    2010-06-08 @303  	seg = kmalloc(sizeof(*seg), GFP_KERNEL | GFP_DMA);
^1da177e4c3f41 Linus Torvalds    2005-04-16  304  	if (seg == NULL) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  305  		rc = -ENOMEM;
^1da177e4c3f41 Linus Torvalds    2005-04-16  306  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  307  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  308  	dcss_mkname (name, seg->dcss_name);
^1da177e4c3f41 Linus Torvalds    2005-04-16  309  	rc = query_segment_type (seg);
^1da177e4c3f41 Linus Torvalds    2005-04-16  310  	if (rc < 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  311  		goto out_free;
f4eb07c17df2e6 Heiko Carstens    2006-12-08  312  
b2300b9efe1b81 Hongjie Yang      2008-10-10  313  	if (segment_overlaps_others(seg)) {
b2300b9efe1b81 Hongjie Yang      2008-10-10  314  		rc = -EBUSY;
b2300b9efe1b81 Hongjie Yang      2008-10-10  315  		goto out_free;
b2300b9efe1b81 Hongjie Yang      2008-10-10  316  	}
b2300b9efe1b81 Hongjie Yang      2008-10-10  317  
444f0e5489e7ac Gerald Schaefer   2007-02-05  318  	seg->res = kzalloc(sizeof(struct resource), GFP_KERNEL);
444f0e5489e7ac Gerald Schaefer   2007-02-05  319  	if (seg->res == NULL) {
444f0e5489e7ac Gerald Schaefer   2007-02-05  320  		rc = -ENOMEM;
f05f62d04271fa David Hildenbrand 2020-06-25  321  		goto out_free;
444f0e5489e7ac Gerald Schaefer   2007-02-05  322  	}
444f0e5489e7ac Gerald Schaefer   2007-02-05  323  	seg->res->flags = IORESOURCE_BUSY | IORESOURCE_MEM;
444f0e5489e7ac Gerald Schaefer   2007-02-05  324  	seg->res->start = seg->start_addr;
444f0e5489e7ac Gerald Schaefer   2007-02-05  325  	seg->res->end = seg->end;
444f0e5489e7ac Gerald Schaefer   2007-02-05  326  	memcpy(&seg->res_name, seg->dcss_name, 8);
444f0e5489e7ac Gerald Schaefer   2007-02-05  327  	EBCASC(seg->res_name, 8);
444f0e5489e7ac Gerald Schaefer   2007-02-05  328  	seg->res_name[8] = '\0';
6b2ddf33baec23 Vasily Gorbik     2018-06-17  329  	strlcat(seg->res_name, " (DCSS)", sizeof(seg->res_name));
444f0e5489e7ac Gerald Schaefer   2007-02-05  330  	seg->res->name = seg->res_name;
8c42dd78df148c Gerald Schaefer   2023-02-27  331  	segtype = seg->vm_segtype;
8c42dd78df148c Gerald Schaefer   2023-02-27  332  	if (segtype == SEG_TYPE_SC ||
8c42dd78df148c Gerald Schaefer   2023-02-27  333  	    ((segtype == SEG_TYPE_SR || segtype == SEG_TYPE_ER) && !do_nonshared))
444f0e5489e7ac Gerald Schaefer   2007-02-05  334  		seg->res->flags |= IORESOURCE_READONLY;
f05f62d04271fa David Hildenbrand 2020-06-25  335  
f05f62d04271fa David Hildenbrand 2020-06-25  336  	/* Check for overlapping resources before adding the mapping. */
444f0e5489e7ac Gerald Schaefer   2007-02-05  337  	if (request_resource(&iomem_resource, seg->res)) {
444f0e5489e7ac Gerald Schaefer   2007-02-05  338  		rc = -EBUSY;
f05f62d04271fa David Hildenbrand 2020-06-25  339  		goto out_free_resource;
444f0e5489e7ac Gerald Schaefer   2007-02-05  340  	}
444f0e5489e7ac Gerald Schaefer   2007-02-05  341  
f05f62d04271fa David Hildenbrand 2020-06-25  342  	rc = vmem_add_mapping(seg->start_addr, seg->end - seg->start_addr + 1);
f05f62d04271fa David Hildenbrand 2020-06-25  343  	if (rc)
f05f62d04271fa David Hildenbrand 2020-06-25  344  		goto out_resource;
f05f62d04271fa David Hildenbrand 2020-06-25  345  
^1da177e4c3f41 Linus Torvalds    2005-04-16  346  	if (do_nonshared)
b2300b9efe1b81 Hongjie Yang      2008-10-10  347  		diag_cc = dcss_diag(&loadnsr_scode, seg->dcss_name,
b2300b9efe1b81 Hongjie Yang      2008-10-10  348  				&start_addr, &end_addr);
^1da177e4c3f41 Linus Torvalds    2005-04-16  349  	else
b2300b9efe1b81 Hongjie Yang      2008-10-10  350  		diag_cc = dcss_diag(&loadshr_scode, seg->dcss_name,
b2300b9efe1b81 Hongjie Yang      2008-10-10  351  				&start_addr, &end_addr);
b2300b9efe1b81 Hongjie Yang      2008-10-10  352  	if (diag_cc < 0) {
b2300b9efe1b81 Hongjie Yang      2008-10-10  353  		dcss_diag(&purgeseg_scode, seg->dcss_name,
b2300b9efe1b81 Hongjie Yang      2008-10-10  354  				&dummy, &dummy);
b2300b9efe1b81 Hongjie Yang      2008-10-10  355  		rc = diag_cc;
f05f62d04271fa David Hildenbrand 2020-06-25  356  		goto out_mapping;
b2300b9efe1b81 Hongjie Yang      2008-10-10  357  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  358  	if (diag_cc > 1) {
baebc70a4db865 Joe Perches       2016-03-03  359  		pr_warn("Loading DCSS %s failed with rc=%ld\n", name, end_addr);
b2300b9efe1b81 Hongjie Yang      2008-10-10  360  		rc = dcss_diag_translate_rc(end_addr);
b2300b9efe1b81 Hongjie Yang      2008-10-10  361  		dcss_diag(&purgeseg_scode, seg->dcss_name,
b2300b9efe1b81 Hongjie Yang      2008-10-10  362  				&dummy, &dummy);
f05f62d04271fa David Hildenbrand 2020-06-25  363  		goto out_mapping;
^1da177e4c3f41 Linus Torvalds    2005-04-16  364  	}
b2300b9efe1b81 Hongjie Yang      2008-10-10  365  	seg->start_addr = start_addr;
b2300b9efe1b81 Hongjie Yang      2008-10-10  366  	seg->end = end_addr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  367  	seg->do_nonshared = do_nonshared;
3434caec5b7051 Chuhong Yuan      2019-08-08  368  	refcount_set(&seg->ref_count, 1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  369  	list_add(&seg->list, &dcss_list);
^1da177e4c3f41 Linus Torvalds    2005-04-16  370  	*addr = seg->start_addr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  371  	*end  = seg->end;
^1da177e4c3f41 Linus Torvalds    2005-04-16  372  	if (do_nonshared)
f1777625c5aa5c Gerald Schaefer   2019-02-21  373  		pr_info("DCSS %s of range %px to %px and type %s loaded as "
93098bf0157876 Hongjie Yang      2008-12-25  374  			"exclusive-writable\n", name, (void*) seg->start_addr,
93098bf0157876 Hongjie Yang      2008-12-25  375  			(void*) seg->end, segtype_string[seg->vm_segtype]);
444f0e5489e7ac Gerald Schaefer   2007-02-05  376  	else {
f1777625c5aa5c Gerald Schaefer   2019-02-21  377  		pr_info("DCSS %s of range %px to %px and type %s loaded in "
93098bf0157876 Hongjie Yang      2008-12-25  378  			"shared access mode\n", name, (void*) seg->start_addr,
93098bf0157876 Hongjie Yang      2008-12-25  379  			(void*) seg->end, segtype_string[seg->vm_segtype]);
444f0e5489e7ac Gerald Schaefer   2007-02-05  380  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  381  	goto out;
f05f62d04271fa David Hildenbrand 2020-06-25  382   out_mapping:
f05f62d04271fa David Hildenbrand 2020-06-25  383  	vmem_remove_mapping(seg->start_addr, seg->end - seg->start_addr + 1);
444f0e5489e7ac Gerald Schaefer   2007-02-05  384   out_resource:
444f0e5489e7ac Gerald Schaefer   2007-02-05  385  	release_resource(seg->res);
f05f62d04271fa David Hildenbrand 2020-06-25  386   out_free_resource:
444f0e5489e7ac Gerald Schaefer   2007-02-05  387  	kfree(seg->res);
^1da177e4c3f41 Linus Torvalds    2005-04-16  388   out_free:
^1da177e4c3f41 Linus Torvalds    2005-04-16  389  	kfree(seg);
^1da177e4c3f41 Linus Torvalds    2005-04-16  390   out:
8c42dd78df148c Gerald Schaefer   2023-02-27  391  	return rc < 0 ? rc : segtype;
^1da177e4c3f41 Linus Torvalds    2005-04-16  392  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  393  

:::::: The code at line 172 was first introduced by commit
:::::: c2f0e8c803ceba530060ec9bb9c74a06c2c3d833 [S390] appldata/extmem/kvm: add missing GFP_KERNEL flag

:::::: TO: Heiko Carstens <heiko.carstens@de.ibm.com>
:::::: CC: Martin Schwidefsky <sky@mschwide.boeblingen.de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
