Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0575015B7
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 06:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EiLIFR23"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585112; x=1733121112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9KtViN+cyFWnYzwz0igAVJazmSML+6p+sneLcxj/SyA=;
  b=EiLIFR2370VU9UgUw+dCs1OVKJs8LS8BjnwhXOVFF6CbogRyrHEXYsFP
   ieIwTrnm0bUZ98wEpCZSdSVlyszOkoHkBGlQ3wZB3htYf/s+OAMuoIgW2
   YCJPU9XWyjK9LVBUv9OJYhfHPzOLm0uSfh37tJLuTf9hv8iRoIOkAytvz
   aBK0W6jDC+sv/c8KsfE8ugV30iJEvq374P+DOAxcKwfCaLpIXrJqC5oE2
   ExaGWoXBOGtAg93XMiV9MvPDZAr2qhuqHlfU/jvP21/kQdpgzFBirTuZs
   23QuIMNM7ZQEhzMO4zhyw+S/ICsbWqFPxGXrpz+7sWo4SKzVUclDP6er5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="15180366"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="15180366"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:31:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="943556083"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="943556083"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 02 Dec 2023 22:31:44 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g10-0006K8-1o;
	Sun, 03 Dec 2023 06:31:42 +0000
Date: Sun, 3 Dec 2023 14:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/misc/altera-stapl/altera.c:2116 altera_execute() warn:
 Function too hairy.  No more merges.
Message-ID: <202312030113.WuV1a0C2-lkp@intel.com>
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
TO: Joerg Roedel <jroedel@suse.de>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: f59dbe9ca6707eb7ffd0e24359085651c2d7df48 x86/pgtable/pae: Use separate kernel PMDs for user page-table
date:   5 years ago
:::::: branch date: 18 hours ago
:::::: commit date: 5 years ago
config: x86_64-randconfig-x006-20230817 (https://download.01.org/0day-ci/archive/20231203/202312030113.WuV1a0C2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312030113.WuV1a0C2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312030113.WuV1a0C2-lkp@intel.com/

New smatch warnings:
drivers/misc/altera-stapl/altera.c:2116 altera_execute() warn: Function too hairy.  No more merges.
arch/x86/mm/pgtable.c:338 pgd_prepopulate_user_pmd() warn: we never enter this loop

Old smatch warnings:
drivers/misc/altera-stapl/altera.c:197 altera_export_bool_array() error: buffer overflow 'string' 73 <= u32max
drivers/misc/altera-stapl/altera.c:2104 altera_execute() error: testing array offset 'stack_ptr' after use.
arch/x86/mm/pgtable.c:284 pgd_mop_up_pmds() warn: we never enter this loop
arch/x86/mm/pgtable.c:294 pgd_mop_up_pmds() warn: we never enter this loop

vim +2116 drivers/misc/altera-stapl/altera.c

fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   217  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   218  static int altera_execute(struct altera_state *astate,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   219  				u8 *p,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   220  				s32 program_size,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   221  				s32 *error_address,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   222  				int *exit_code,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   223  				int *format_version)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   224  {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   225  	struct altera_config *aconf = astate->config;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   226  	char *msg_buff = astate->msg_buff;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   227  	long *stack = astate->stack;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   228  	int status = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   229  	u32 first_word = 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   230  	u32 action_table = 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   231  	u32 proc_table = 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   232  	u32 str_table = 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   233  	u32 sym_table = 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   234  	u32 data_sect = 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   235  	u32 code_sect = 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   236  	u32 debug_sect = 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   237  	u32 action_count = 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   238  	u32 proc_count = 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   239  	u32 sym_count = 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   240  	long *vars = NULL;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   241  	s32 *var_size = NULL;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   242  	char *attrs = NULL;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   243  	u8 *proc_attributes = NULL;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   244  	u32 pc;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   245  	u32 opcode_address;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   246  	u32 args[3];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   247  	u32 opcode;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   248  	u32 name_id;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   249  	u8 charbuf[4];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   250  	long long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   251  	u32 variable_id;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   252  	u8 *charptr_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   253  	u8 *charptr_tmp2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   254  	long *longptr_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   255  	int version = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   256  	int delta = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   257  	int stack_ptr = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   258  	u32 arg_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   259  	int done = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   260  	int bad_opcode = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   261  	u32 count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   262  	u32 index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   263  	u32 index2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   264  	s32 long_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   265  	s32 long_idx;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   266  	s32 long_idx2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   267  	u32 i;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   268  	u32 j;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   269  	u32 uncomp_size;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   270  	u32 offset;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   271  	u32 value;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   272  	int current_proc = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   273  	int reverse;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   274  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   275  	char *name;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   276  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   277  	dprintk("%s\n", __func__);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   278  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   279  	/* Read header information */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   280  	if (program_size > 52L) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   281  		first_word    = get_unaligned_be32(&p[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   282  		version = (first_word & 1L);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   283  		*format_version = version + 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   284  		delta = version * 8;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   285  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   286  		action_table  = get_unaligned_be32(&p[4]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   287  		proc_table    = get_unaligned_be32(&p[8]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   288  		str_table  = get_unaligned_be32(&p[4 + delta]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   289  		sym_table  = get_unaligned_be32(&p[16 + delta]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   290  		data_sect  = get_unaligned_be32(&p[20 + delta]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   291  		code_sect  = get_unaligned_be32(&p[24 + delta]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   292  		debug_sect = get_unaligned_be32(&p[28 + delta]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   293  		action_count  = get_unaligned_be32(&p[40 + delta]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   294  		proc_count    = get_unaligned_be32(&p[44 + delta]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   295  		sym_count  = get_unaligned_be32(&p[48 + (2 * delta)]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   296  	}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   297  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   298  	if ((first_word != 0x4A414D00L) && (first_word != 0x4A414D01L)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   299  		done = 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   300  		status = -EIO;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   301  		goto exit_done;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   302  	}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   303  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   304  	if (sym_count <= 0)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   305  		goto exit_done;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   306  
6396bb221514d2 drivers/misc/altera-stapl/altera.c    Kees Cook         2018-06-12   307  	vars = kcalloc(sym_count, sizeof(long), GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   308  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   309  	if (vars == NULL)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   310  		status = -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   311  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   312  	if (status == 0) {
6396bb221514d2 drivers/misc/altera-stapl/altera.c    Kees Cook         2018-06-12   313  		var_size = kcalloc(sym_count, sizeof(s32), GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   314  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   315  		if (var_size == NULL)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   316  			status = -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   317  	}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   318  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   319  	if (status == 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   320  		attrs = kzalloc(sym_count, GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   321  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   322  		if (attrs == NULL)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   323  			status = -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   324  	}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   325  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   326  	if ((status == 0) && (version > 0)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   327  		proc_attributes = kzalloc(proc_count, GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   328  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   329  		if (proc_attributes == NULL)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   330  			status = -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   331  	}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   332  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   333  	if (status != 0)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   334  		goto exit_done;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   335  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   336  	delta = version * 2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   337  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   338  	for (i = 0; i < sym_count; ++i) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   339  		offset = (sym_table + ((11 + delta) * i));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   340  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   341  		value = get_unaligned_be32(&p[offset + 3 + delta]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   342  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   343  		attrs[i] = p[offset];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   344  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   345  		/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   346  		 * use bit 7 of attribute byte to indicate that
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   347  		 * this buffer was dynamically allocated
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   348  		 * and should be freed later
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   349  		 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   350  		attrs[i] &= 0x7f;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   351  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   352  		var_size[i] = get_unaligned_be32(&p[offset + 7 + delta]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   353  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   354  		/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   355  		 * Attribute bits:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   356  		 * bit 0: 0 = read-only, 1 = read-write
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   357  		 * bit 1: 0 = not compressed, 1 = compressed
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   358  		 * bit 2: 0 = not initialized, 1 = initialized
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   359  		 * bit 3: 0 = scalar, 1 = array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   360  		 * bit 4: 0 = Boolean, 1 = integer
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   361  		 * bit 5: 0 = declared variable,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   362  		 *	1 = compiler created temporary variable
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   363  		 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   364  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   365  		if ((attrs[i] & 0x0c) == 0x04)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   366  			/* initialized scalar variable */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   367  			vars[i] = value;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   368  		else if ((attrs[i] & 0x1e) == 0x0e) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   369  			/* initialized compressed Boolean array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   370  			uncomp_size = get_unaligned_le32(&p[data_sect + value]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   371  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   372  			/* allocate a buffer for the uncompressed data */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   373  			vars[i] = (long)kzalloc(uncomp_size, GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   374  			if (vars[i] == 0L)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   375  				status = -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   376  			else {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   377  				/* set flag so buffer will be freed later */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   378  				attrs[i] |= 0x80;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   379  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   380  				/* uncompress the data */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   381  				if (altera_shrink(&p[data_sect + value],
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   382  						var_size[i],
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   383  						(u8 *)vars[i],
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   384  						uncomp_size,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   385  						version) != uncomp_size)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   386  					/* decompression failed */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   387  					status = -EIO;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   388  				else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   389  					var_size[i] = uncomp_size * 8L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   390  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   391  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   392  		} else if ((attrs[i] & 0x1e) == 0x0c) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   393  			/* initialized Boolean array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   394  			vars[i] = value + data_sect + (long)p;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   395  		} else if ((attrs[i] & 0x1c) == 0x1c) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   396  			/* initialized integer array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   397  			vars[i] = value + data_sect;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   398  		} else if ((attrs[i] & 0x0c) == 0x08) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   399  			/* uninitialized array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   400  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   401  			/* flag attrs so that memory is freed */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   402  			attrs[i] |= 0x80;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   403  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   404  			if (var_size[i] > 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   405  				u32 size;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   406  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   407  				if (attrs[i] & 0x10)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   408  					/* integer array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   409  					size = (var_size[i] * sizeof(s32));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   410  				else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   411  					/* Boolean array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   412  					size = ((var_size[i] + 7L) / 8L);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   413  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   414  				vars[i] = (long)kzalloc(size, GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   415  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   416  				if (vars[i] == 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   417  					status = -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   418  				} else {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   419  					/* zero out memory */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   420  					for (j = 0; j < size; ++j)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   421  						((u8 *)(vars[i]))[j] = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   422  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   423  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   424  			} else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   425  				vars[i] = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   426  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   427  		} else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   428  			vars[i] = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   429  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   430  	}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   431  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   432  exit_done:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   433  	if (status != 0)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   434  		done = 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   435  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   436  	altera_jinit(astate);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   437  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   438  	pc = code_sect;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   439  	msg_buff[0] = '\0';
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   440  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   441  	/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   442  	 * For JBC version 2, we will execute the procedures corresponding to
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   443  	 * the selected ACTION
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   444  	 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   445  	if (version > 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   446  		if (aconf->action == NULL) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   447  			status = -EINVAL;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   448  			done = 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   449  		} else {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   450  			int action_found = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   451  			for (i = 0; (i < action_count) && !action_found; ++i) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   452  				name_id = get_unaligned_be32(&p[action_table +
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   453  								(12 * i)]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   454  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   455  				name = &p[str_table + name_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   456  
30614cf34105c5 drivers/misc/altera-stapl/altera.c    Rasmus Villemoes  2014-10-13   457  				if (strncasecmp(aconf->action, name, strlen(name)) == 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   458  					action_found = 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   459  					current_proc =
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   460  						get_unaligned_be32(&p[action_table +
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   461  								(12 * i) + 8]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   462  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   463  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   464  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   465  			if (!action_found) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   466  				status = -EINVAL;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   467  				done = 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   468  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   469  		}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   470  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   471  		if (status == 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   472  			int first_time = 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   473  			i = current_proc;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   474  			while ((i != 0) || first_time) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   475  				first_time = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   476  				/* check procedure attribute byte */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   477  				proc_attributes[i] =
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   478  						(p[proc_table +
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   479  								(13 * i) + 8] &
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   480  									0x03);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   481  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   482  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   483  				 * BIT0 - OPTIONAL
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   484  				 * BIT1 - RECOMMENDED
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   485  				 * BIT6 - FORCED OFF
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   486  				 * BIT7 - FORCED ON
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   487  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   488  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   489  				i = get_unaligned_be32(&p[proc_table +
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   490  							(13 * i) + 4]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   491  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   492  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   493  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   494  			 * Set current_proc to the first procedure
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   495  			 * to be executed
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   496  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   497  			i = current_proc;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   498  			while ((i != 0) &&
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   499  				((proc_attributes[i] == 1) ||
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   500  				((proc_attributes[i] & 0xc0) == 0x40))) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   501  				i = get_unaligned_be32(&p[proc_table +
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   502  							(13 * i) + 4]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   503  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   504  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   505  			if ((i != 0) || ((i == 0) && (current_proc == 0) &&
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   506  				((proc_attributes[0] != 1) &&
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   507  				((proc_attributes[0] & 0xc0) != 0x40)))) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   508  				current_proc = i;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   509  				pc = code_sect +
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   510  					get_unaligned_be32(&p[proc_table +
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   511  								(13 * i) + 9]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   512  				if ((pc < code_sect) || (pc >= debug_sect))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   513  					status = -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   514  			} else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   515  				/* there are no procedures to execute! */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   516  				done = 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   517  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   518  		}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   519  	}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   520  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   521  	msg_buff[0] = '\0';
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   522  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   523  	while (!done) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   524  		opcode = (p[pc] & 0xff);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   525  		opcode_address = pc;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   526  		++pc;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   527  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   528  		if (debug > 1)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   529  			printk("opcode: %02x\n", opcode);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   530  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   531  		arg_count = (opcode >> 6) & 3;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   532  		for (i = 0; i < arg_count; ++i) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   533  			args[i] = get_unaligned_be32(&p[pc]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   534  			pc += 4;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   535  		}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   536  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   537  		switch (opcode) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   538  		case OP_NOP:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   539  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   540  		case OP_DUP:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   541  			if (altera_check_stack(stack_ptr, 1, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   542  				stack[stack_ptr] = stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   543  				++stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   544  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   545  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   546  		case OP_SWP:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   547  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   548  				long_tmp = stack[stack_ptr - 2];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   549  				stack[stack_ptr - 2] = stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   550  				stack[stack_ptr - 1] = long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   551  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   552  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   553  		case OP_ADD:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   554  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   555  				--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   556  				stack[stack_ptr - 1] += stack[stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   557  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   558  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   559  		case OP_SUB:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   560  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   561  				--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   562  				stack[stack_ptr - 1] -= stack[stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   563  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   564  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   565  		case OP_MULT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   566  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   567  				--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   568  				stack[stack_ptr - 1] *= stack[stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   569  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   570  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   571  		case OP_DIV:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   572  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   573  				--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   574  				stack[stack_ptr - 1] /= stack[stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   575  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   576  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   577  		case OP_MOD:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   578  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   579  				--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   580  				stack[stack_ptr - 1] %= stack[stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   581  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   582  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   583  		case OP_SHL:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   584  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   585  				--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   586  				stack[stack_ptr - 1] <<= stack[stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   587  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   588  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   589  		case OP_SHR:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   590  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   591  				--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   592  				stack[stack_ptr - 1] >>= stack[stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   593  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   594  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   595  		case OP_NOT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   596  			if (altera_check_stack(stack_ptr, 1, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   597  				stack[stack_ptr - 1] ^= (-1L);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   598  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   599  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   600  		case OP_AND:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   601  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   602  				--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   603  				stack[stack_ptr - 1] &= stack[stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   604  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   605  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   606  		case OP_OR:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   607  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   608  				--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   609  				stack[stack_ptr - 1] |= stack[stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   610  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   611  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   612  		case OP_XOR:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   613  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   614  				--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   615  				stack[stack_ptr - 1] ^= stack[stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   616  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   617  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   618  		case OP_INV:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   619  			if (!altera_check_stack(stack_ptr, 1, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   620  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   621  			stack[stack_ptr - 1] = stack[stack_ptr - 1] ? 0L : 1L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   622  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   623  		case OP_GT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   624  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   625  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   626  			--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   627  			stack[stack_ptr - 1] =
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   628  				(stack[stack_ptr - 1] > stack[stack_ptr]) ?
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   629  									1L : 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   630  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   631  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   632  		case OP_LT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   633  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   634  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   635  			--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   636  			stack[stack_ptr - 1] =
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   637  				(stack[stack_ptr - 1] < stack[stack_ptr]) ?
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   638  									1L : 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   639  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   640  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   641  		case OP_RET:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   642  			if ((version > 0) && (stack_ptr == 0)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   643  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   644  				 * We completed one of the main procedures
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   645  				 * of an ACTION.
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   646  				 * Find the next procedure
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   647  				 * to be executed and jump to it.
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   648  				 * If there are no more procedures, then EXIT.
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   649  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   650  				i = get_unaligned_be32(&p[proc_table +
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   651  						(13 * current_proc) + 4]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   652  				while ((i != 0) &&
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   653  					((proc_attributes[i] == 1) ||
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   654  					((proc_attributes[i] & 0xc0) == 0x40)))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   655  					i = get_unaligned_be32(&p[proc_table +
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   656  								(13 * i) + 4]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   657  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   658  				if (i == 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   659  					/* no procedures to execute! */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   660  					done = 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   661  					*exit_code = 0;	/* success */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   662  				} else {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   663  					current_proc = i;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   664  					pc = code_sect + get_unaligned_be32(
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   665  								&p[proc_table +
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   666  								(13 * i) + 9]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   667  					if ((pc < code_sect) ||
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   668  					    (pc >= debug_sect))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   669  						status = -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   670  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   671  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   672  			} else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   673  				if (altera_check_stack(stack_ptr, 1, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   674  					pc = stack[--stack_ptr] + code_sect;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   675  					if ((pc <= code_sect) ||
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   676  					    (pc >= debug_sect))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   677  						status = -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   678  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   679  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   680  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   681  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   682  		case OP_CMPS:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   683  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   684  			 * Array short compare
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   685  			 * ...stack 0 is source 1 value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   686  			 * ...stack 1 is source 2 value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   687  			 * ...stack 2 is mask value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   688  			 * ...stack 3 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   689  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   690  			if (altera_check_stack(stack_ptr, 4, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   691  				s32 a = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   692  				s32 b = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   693  				long_tmp = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   694  				count = stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   695  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   696  				if ((count < 1) || (count > 32))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   697  					status = -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   698  				else {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   699  					long_tmp &= ((-1L) >> (32 - count));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   700  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   701  					stack[stack_ptr - 1] =
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   702  					((a & long_tmp) == (b & long_tmp))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   703  								? 1L : 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   704  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   705  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   706  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   707  		case OP_PINT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   708  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   709  			 * PRINT add integer
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   710  			 * ...stack 0 is integer value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   711  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   712  			if (!altera_check_stack(stack_ptr, 1, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   713  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   714  			sprintf(&msg_buff[strlen(msg_buff)],
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   715  					"%ld", stack[--stack_ptr]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   716  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   717  		case OP_PRNT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   718  			/* PRINT finish */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   719  			if (debug)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   720  				printk(msg_buff, "\n");
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   721  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   722  			msg_buff[0] = '\0';
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   723  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   724  		case OP_DSS:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   725  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   726  			 * DRSCAN short
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   727  			 * ...stack 0 is scan data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   728  			 * ...stack 1 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   729  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   730  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   731  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   732  			long_tmp = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   733  			count = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   734  			put_unaligned_le32(long_tmp, &charbuf[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   735  			status = altera_drscan(astate, count, charbuf, 0);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   736  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   737  		case OP_DSSC:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   738  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   739  			 * DRSCAN short with capture
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   740  			 * ...stack 0 is scan data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   741  			 * ...stack 1 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   742  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   743  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   744  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   745  			long_tmp = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   746  			count = stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   747  			put_unaligned_le32(long_tmp, &charbuf[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   748  			status = altera_swap_dr(astate, count, charbuf,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   749  							0, charbuf, 0);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   750  			stack[stack_ptr - 1] = get_unaligned_le32(&charbuf[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   751  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   752  		case OP_ISS:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   753  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   754  			 * IRSCAN short
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   755  			 * ...stack 0 is scan data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   756  			 * ...stack 1 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   757  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   758  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   759  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   760  			long_tmp = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   761  			count = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   762  			put_unaligned_le32(long_tmp, &charbuf[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   763  			status = altera_irscan(astate, count, charbuf, 0);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   764  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   765  		case OP_ISSC:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   766  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   767  			 * IRSCAN short with capture
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   768  			 * ...stack 0 is scan data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   769  			 * ...stack 1 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   770  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   771  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   772  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   773  			long_tmp = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   774  			count = stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   775  			put_unaligned_le32(long_tmp, &charbuf[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   776  			status = altera_swap_ir(astate, count, charbuf,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   777  							0, charbuf, 0);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   778  			stack[stack_ptr - 1] = get_unaligned_le32(&charbuf[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   779  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   780  		case OP_DPR:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   781  			if (!altera_check_stack(stack_ptr, 1, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   782  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   783  			count = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   784  			status = altera_set_dr_pre(&astate->js, count, 0, NULL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   785  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   786  		case OP_DPRL:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   787  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   788  			 * DRPRE with literal data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   789  			 * ...stack 0 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   790  			 * ...stack 1 is literal data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   791  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   792  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   793  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   794  			count = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   795  			long_tmp = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   796  			put_unaligned_le32(long_tmp, &charbuf[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   797  			status = altera_set_dr_pre(&astate->js, count, 0,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   798  						charbuf);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   799  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   800  		case OP_DPO:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   801  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   802  			 * DRPOST
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   803  			 * ...stack 0 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   804  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   805  			if (altera_check_stack(stack_ptr, 1, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   806  				count = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   807  				status = altera_set_dr_post(&astate->js, count,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   808  								0, NULL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   809  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   810  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   811  		case OP_DPOL:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   812  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   813  			 * DRPOST with literal data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   814  			 * ...stack 0 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   815  			 * ...stack 1 is literal data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   816  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   817  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   818  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   819  			count = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   820  			long_tmp = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   821  			put_unaligned_le32(long_tmp, &charbuf[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   822  			status = altera_set_dr_post(&astate->js, count, 0,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   823  							charbuf);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   824  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   825  		case OP_IPR:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   826  			if (altera_check_stack(stack_ptr, 1, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   827  				count = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   828  				status = altera_set_ir_pre(&astate->js, count,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   829  								0, NULL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   830  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   831  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   832  		case OP_IPRL:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   833  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   834  			 * IRPRE with literal data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   835  			 * ...stack 0 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   836  			 * ...stack 1 is literal data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   837  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   838  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   839  				count = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   840  				long_tmp = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   841  				put_unaligned_le32(long_tmp, &charbuf[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   842  				status = altera_set_ir_pre(&astate->js, count,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   843  							0, charbuf);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   844  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   845  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   846  		case OP_IPO:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   847  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   848  			 * IRPOST
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   849  			 * ...stack 0 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   850  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   851  			if (altera_check_stack(stack_ptr, 1, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   852  				count = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   853  				status = altera_set_ir_post(&astate->js, count,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   854  							0, NULL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   855  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   856  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   857  		case OP_IPOL:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   858  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   859  			 * IRPOST with literal data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   860  			 * ...stack 0 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   861  			 * ...stack 1 is literal data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   862  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   863  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   864  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   865  			count = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   866  			long_tmp = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   867  			put_unaligned_le32(long_tmp, &charbuf[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   868  			status = altera_set_ir_post(&astate->js, count, 0,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   869  							charbuf);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   870  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   871  		case OP_PCHR:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   872  			if (altera_check_stack(stack_ptr, 1, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   873  				u8 ch;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   874  				count = strlen(msg_buff);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   875  				ch = (char) stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   876  				if ((ch < 1) || (ch > 127)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   877  					/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   878  					 * character code out of range
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   879  					 * instead of flagging an error,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   880  					 * force the value to 127
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   881  					 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   882  					ch = 127;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   883  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   884  				msg_buff[count] = ch;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   885  				msg_buff[count + 1] = '\0';
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   886  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   887  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   888  		case OP_EXIT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   889  			if (altera_check_stack(stack_ptr, 1, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   890  				*exit_code = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   891  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   892  			done = 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   893  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   894  		case OP_EQU:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   895  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   896  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   897  			--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   898  			stack[stack_ptr - 1] =
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   899  				(stack[stack_ptr - 1] == stack[stack_ptr]) ?
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   900  									1L : 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   901  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   902  		case OP_POPT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   903  			if (altera_check_stack(stack_ptr, 1, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   904  				--stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   905  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   906  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   907  		case OP_ABS:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   908  			if (!altera_check_stack(stack_ptr, 1, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   909  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   910  			if (stack[stack_ptr - 1] < 0)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   911  				stack[stack_ptr - 1] = 0 - stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   912  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   913  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   914  		case OP_BCH0:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   915  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   916  			 * Batch operation 0
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   917  			 * SWP
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   918  			 * SWPN 7
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   919  			 * SWP
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   920  			 * SWPN 6
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   921  			 * DUPN 8
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   922  			 * SWPN 2
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   923  			 * SWP
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   924  			 * DUPN 6
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   925  			 * DUPN 6
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   926  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   927  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   928  			/* SWP  */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   929  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   930  				long_tmp = stack[stack_ptr - 2];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   931  				stack[stack_ptr - 2] = stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   932  				stack[stack_ptr - 1] = long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   933  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   934  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   935  			/* SWPN 7 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   936  			index = 7 + 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   937  			if (altera_check_stack(stack_ptr, index, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   938  				long_tmp = stack[stack_ptr - index];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   939  				stack[stack_ptr - index] = stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   940  				stack[stack_ptr - 1] = long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   941  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   942  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   943  			/* SWP  */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   944  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   945  				long_tmp = stack[stack_ptr - 2];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   946  				stack[stack_ptr - 2] = stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   947  				stack[stack_ptr - 1] = long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   948  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   949  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   950  			/* SWPN 6 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   951  			index = 6 + 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   952  			if (altera_check_stack(stack_ptr, index, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   953  				long_tmp = stack[stack_ptr - index];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   954  				stack[stack_ptr - index] = stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   955  				stack[stack_ptr - 1] = long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   956  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   957  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   958  			/* DUPN 8 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   959  			index = 8 + 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   960  			if (altera_check_stack(stack_ptr, index, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   961  				stack[stack_ptr] = stack[stack_ptr - index];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   962  				++stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   963  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   964  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   965  			/* SWPN 2 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   966  			index = 2 + 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   967  			if (altera_check_stack(stack_ptr, index, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   968  				long_tmp = stack[stack_ptr - index];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   969  				stack[stack_ptr - index] = stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   970  				stack[stack_ptr - 1] = long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   971  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   972  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   973  			/* SWP  */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   974  			if (altera_check_stack(stack_ptr, 2, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   975  				long_tmp = stack[stack_ptr - 2];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   976  				stack[stack_ptr - 2] = stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   977  				stack[stack_ptr - 1] = long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   978  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   979  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   980  			/* DUPN 6 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   981  			index = 6 + 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   982  			if (altera_check_stack(stack_ptr, index, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   983  				stack[stack_ptr] = stack[stack_ptr - index];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   984  				++stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   985  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   986  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   987  			/* DUPN 6 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   988  			index = 6 + 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   989  			if (altera_check_stack(stack_ptr, index, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   990  				stack[stack_ptr] = stack[stack_ptr - index];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   991  				++stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   992  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   993  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   994  		case OP_PSH0:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   995  			stack[stack_ptr++] = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   996  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   997  		case OP_PSHL:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   998  			stack[stack_ptr++] = (s32) args[0];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25   999  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1000  		case OP_PSHV:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1001  			stack[stack_ptr++] = vars[args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1002  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1003  		case OP_JMP:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1004  			pc = args[0] + code_sect;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1005  			if ((pc < code_sect) || (pc >= debug_sect))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1006  				status = -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1007  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1008  		case OP_CALL:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1009  			stack[stack_ptr++] = pc;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1010  			pc = args[0] + code_sect;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1011  			if ((pc < code_sect) || (pc >= debug_sect))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1012  				status = -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1013  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1014  		case OP_NEXT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1015  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1016  			 * Process FOR / NEXT loop
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1017  			 * ...argument 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1018  			 * ...stack 0 is step value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1019  			 * ...stack 1 is end value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1020  			 * ...stack 2 is top address
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1021  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1022  			if (altera_check_stack(stack_ptr, 3, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1023  				s32 step = stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1024  				s32 end = stack[stack_ptr - 2];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1025  				s32 top = stack[stack_ptr - 3];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1026  				s32 iterator = vars[args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1027  				int break_out = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1028  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1029  				if (step < 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1030  					if (iterator <= end)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1031  						break_out = 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1032  				} else if (iterator >= end)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1033  					break_out = 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1034  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1035  				if (break_out) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1036  					stack_ptr -= 3;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1037  				} else {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1038  					vars[args[0]] = iterator + step;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1039  					pc = top + code_sect;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1040  					if ((pc < code_sect) ||
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1041  					    (pc >= debug_sect))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1042  						status = -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1043  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1044  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1045  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1046  		case OP_PSTR:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1047  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1048  			 * PRINT add string
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1049  			 * ...argument 0 is string ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1050  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1051  			count = strlen(msg_buff);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1052  			strlcpy(&msg_buff[count],
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1053  				&p[str_table + args[0]],
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1054  				ALTERA_MESSAGE_LENGTH - count);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1055  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1056  		case OP_SINT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1057  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1058  			 * STATE intermediate state
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1059  			 * ...argument 0 is state code
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1060  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1061  			status = altera_goto_jstate(astate, args[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1062  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1063  		case OP_ST:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1064  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1065  			 * STATE final state
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1066  			 * ...argument 0 is state code
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1067  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1068  			status = altera_goto_jstate(astate, args[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1069  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1070  		case OP_ISTP:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1071  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1072  			 * IRSTOP state
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1073  			 * ...argument 0 is state code
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1074  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1075  			status = altera_set_irstop(&astate->js, args[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1076  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1077  		case OP_DSTP:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1078  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1079  			 * DRSTOP state
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1080  			 * ...argument 0 is state code
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1081  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1082  			status = altera_set_drstop(&astate->js, args[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1083  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1084  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1085  		case OP_SWPN:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1086  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1087  			 * Exchange top with Nth stack value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1088  			 * ...argument 0 is 0-based stack entry
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1089  			 * to swap with top element
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1090  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1091  			index = (args[0]) + 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1092  			if (altera_check_stack(stack_ptr, index, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1093  				long_tmp = stack[stack_ptr - index];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1094  				stack[stack_ptr - index] = stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1095  				stack[stack_ptr - 1] = long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1096  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1097  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1098  		case OP_DUPN:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1099  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1100  			 * Duplicate Nth stack value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1101  			 * ...argument 0 is 0-based stack entry to duplicate
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1102  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1103  			index = (args[0]) + 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1104  			if (altera_check_stack(stack_ptr, index, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1105  				stack[stack_ptr] = stack[stack_ptr - index];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1106  				++stack_ptr;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1107  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1108  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1109  		case OP_POPV:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1110  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1111  			 * Pop stack into scalar variable
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1112  			 * ...argument 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1113  			 * ...stack 0 is value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1114  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1115  			if (altera_check_stack(stack_ptr, 1, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1116  				vars[args[0]] = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1117  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1118  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1119  		case OP_POPE:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1120  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1121  			 * Pop stack into integer array element
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1122  			 * ...argument 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1123  			 * ...stack 0 is array index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1124  			 * ...stack 1 is value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1125  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1126  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1127  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1128  			variable_id = args[0];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1129  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1130  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1131  			 * If variable is read-only,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1132  			 * convert to writable array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1133  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1134  			if ((version > 0) &&
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1135  				((attrs[variable_id] & 0x9c) == 0x1c)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1136  				/* Allocate a writable buffer for this array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1137  				count = var_size[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1138  				long_tmp = vars[variable_id];
6396bb221514d2 drivers/misc/altera-stapl/altera.c    Kees Cook         2018-06-12  1139  				longptr_tmp = kcalloc(count, sizeof(long),
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1140  								GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1141  				vars[variable_id] = (long)longptr_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1142  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1143  				if (vars[variable_id] == 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1144  					status = -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1145  					break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1146  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1147  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1148  				/* copy previous contents into buffer */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1149  				for (i = 0; i < count; ++i) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1150  					longptr_tmp[i] =
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1151  						get_unaligned_be32(&p[long_tmp]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1152  					long_tmp += sizeof(long);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1153  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1154  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1155  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1156  				 * set bit 7 - buffer was
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1157  				 * dynamically allocated
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1158  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1159  				attrs[variable_id] |= 0x80;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1160  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1161  				/* clear bit 2 - variable is writable */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1162  				attrs[variable_id] &= ~0x04;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1163  				attrs[variable_id] |= 0x01;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1164  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1165  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1166  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1167  			/* check that variable is a writable integer array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1168  			if ((attrs[variable_id] & 0x1c) != 0x18)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1169  				status = -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1170  			else {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1171  				longptr_tmp = (long *)vars[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1172  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1173  				/* pop the array index */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1174  				index = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1175  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1176  				/* pop the value and store it into the array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1177  				longptr_tmp[index] = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1178  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1179  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1180  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1181  		case OP_POPA:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1182  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1183  			 * Pop stack into Boolean array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1184  			 * ...argument 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1185  			 * ...stack 0 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1186  			 * ...stack 1 is array index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1187  			 * ...stack 2 is value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1188  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1189  			if (!altera_check_stack(stack_ptr, 3, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1190  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1191  			variable_id = args[0];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1192  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1193  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1194  			 * If variable is read-only,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1195  			 * convert to writable array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1196  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1197  			if ((version > 0) &&
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1198  				((attrs[variable_id] & 0x9c) == 0x0c)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1199  				/* Allocate a writable buffer for this array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1200  				long_tmp =
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1201  					(var_size[variable_id] + 7L) >> 3L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1202  				charptr_tmp2 = (u8 *)vars[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1203  				charptr_tmp =
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1204  					kzalloc(long_tmp, GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1205  				vars[variable_id] = (long)charptr_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1206  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1207  				if (vars[variable_id] == 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1208  					status = -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1209  					break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1210  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1211  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1212  				/* zero the buffer */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1213  				for (long_idx = 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1214  					long_idx < long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1215  					++long_idx) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1216  					charptr_tmp[long_idx] = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1217  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1218  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1219  				/* copy previous contents into buffer */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1220  				for (long_idx = 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1221  					long_idx < var_size[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1222  					++long_idx) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1223  					long_idx2 = long_idx;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1224  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1225  					if (charptr_tmp2[long_idx2 >> 3] &
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1226  						(1 << (long_idx2 & 7))) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1227  						charptr_tmp[long_idx >> 3] |=
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1228  							(1 << (long_idx & 7));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1229  					}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1230  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1231  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1232  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1233  				 * set bit 7 - buffer was
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1234  				 * dynamically allocated
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1235  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1236  				attrs[variable_id] |= 0x80;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1237  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1238  				/* clear bit 2 - variable is writable */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1239  				attrs[variable_id] &= ~0x04;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1240  				attrs[variable_id] |= 0x01;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1241  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1242  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1243  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1244  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1245  			 * check that variable is
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1246  			 * a writable Boolean array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1247  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1248  			if ((attrs[variable_id] & 0x1c) != 0x08) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1249  				status = -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1250  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1251  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1252  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1253  			charptr_tmp = (u8 *)vars[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1254  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1255  			/* pop the count (number of bits to copy) */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1256  			long_count = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1257  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1258  			/* pop the array index */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1259  			long_idx = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1260  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1261  			reverse = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1262  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1263  			if (version > 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1264  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1265  				 * stack 0 = array right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1266  				 * stack 1 = array left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1267  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1268  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1269  				if (long_idx > long_count) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1270  					reverse = 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1271  					long_tmp = long_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1272  					long_count = 1 + long_idx -
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1273  								long_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1274  					long_idx = long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1275  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1276  					/* reverse POPA is not supported */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1277  					status = -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1278  					break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1279  				} else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1280  					long_count = 1 + long_count -
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1281  								long_idx;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1282  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1283  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1284  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1285  			/* pop the data */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1286  			long_tmp = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1287  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1288  			if (long_count < 1) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1289  				status = -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1290  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1291  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1292  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1293  			for (i = 0; i < long_count; ++i) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1294  				if (long_tmp & (1L << (s32) i))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1295  					charptr_tmp[long_idx >> 3L] |=
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1296  						(1L << (long_idx & 7L));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1297  				else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1298  					charptr_tmp[long_idx >> 3L] &=
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1299  						~(1L << (long_idx & 7L));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1300  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1301  				++long_idx;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1302  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1303  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1304  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1305  		case OP_JMPZ:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1306  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1307  			 * Pop stack and branch if zero
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1308  			 * ...argument 0 is address
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1309  			 * ...stack 0 is condition value
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1310  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1311  			if (altera_check_stack(stack_ptr, 1, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1312  				if (stack[--stack_ptr] == 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1313  					pc = args[0] + code_sect;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1314  					if ((pc < code_sect) ||
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1315  					    (pc >= debug_sect))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1316  						status = -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1317  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1318  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1319  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1320  		case OP_DS:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1321  		case OP_IS:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1322  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1323  			 * DRSCAN
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1324  			 * IRSCAN
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1325  			 * ...argument 0 is scan data variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1326  			 * ...stack 0 is array index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1327  			 * ...stack 1 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1328  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1329  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1330  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1331  			long_idx = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1332  			long_count = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1333  			reverse = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1334  			if (version > 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1335  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1336  				 * stack 0 = array right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1337  				 * stack 1 = array left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1338  				 * stack 2 = count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1339  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1340  				long_tmp = long_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1341  				long_count = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1342  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1343  				if (long_idx > long_tmp) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1344  					reverse = 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1345  					long_idx = long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1346  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1347  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1348  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1349  			charptr_tmp = (u8 *)vars[args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1350  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1351  			if (reverse) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1352  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1353  				 * allocate a buffer
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1354  				 * and reverse the data order
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1355  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1356  				charptr_tmp2 = charptr_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1357  				charptr_tmp = kzalloc((long_count >> 3) + 1,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1358  								GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1359  				if (charptr_tmp == NULL) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1360  					status = -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1361  					break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1362  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1363  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1364  				long_tmp = long_idx + long_count - 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1365  				long_idx2 = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1366  				while (long_idx2 < long_count) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1367  					if (charptr_tmp2[long_tmp >> 3] &
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1368  							(1 << (long_tmp & 7)))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1369  						charptr_tmp[long_idx2 >> 3] |=
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1370  							(1 << (long_idx2 & 7));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1371  					else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1372  						charptr_tmp[long_idx2 >> 3] &=
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1373  							~(1 << (long_idx2 & 7));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1374  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1375  					--long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1376  					++long_idx2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1377  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1378  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1379  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1380  			if (opcode == 0x51) /* DS */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1381  				status = altera_drscan(astate, long_count,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1382  						charptr_tmp, long_idx);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1383  			else /* IS */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1384  				status = altera_irscan(astate, long_count,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1385  						charptr_tmp, long_idx);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1386  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1387  			if (reverse)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1388  				kfree(charptr_tmp);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1389  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1390  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1391  		case OP_DPRA:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1392  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1393  			 * DRPRE with array data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1394  			 * ...argument 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1395  			 * ...stack 0 is array index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1396  			 * ...stack 1 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1397  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1398  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1399  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1400  			index = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1401  			count = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1402  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1403  			if (version > 0)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1404  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1405  				 * stack 0 = array right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1406  				 * stack 1 = array left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1407  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1408  				count = 1 + count - index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1409  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1410  			charptr_tmp = (u8 *)vars[args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1411  			status = altera_set_dr_pre(&astate->js, count, index,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1412  							charptr_tmp);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1413  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1414  		case OP_DPOA:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1415  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1416  			 * DRPOST with array data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1417  			 * ...argument 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1418  			 * ...stack 0 is array index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1419  			 * ...stack 1 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1420  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1421  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1422  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1423  			index = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1424  			count = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1425  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1426  			if (version > 0)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1427  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1428  				 * stack 0 = array right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1429  				 * stack 1 = array left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1430  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1431  				count = 1 + count - index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1432  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1433  			charptr_tmp = (u8 *)vars[args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1434  			status = altera_set_dr_post(&astate->js, count, index,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1435  							charptr_tmp);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1436  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1437  		case OP_IPRA:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1438  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1439  			 * IRPRE with array data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1440  			 * ...argument 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1441  			 * ...stack 0 is array index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1442  			 * ...stack 1 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1443  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1444  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1445  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1446  			index = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1447  			count = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1448  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1449  			if (version > 0)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1450  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1451  				 * stack 0 = array right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1452  				 * stack 1 = array left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1453  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1454  				count = 1 + count - index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1455  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1456  			charptr_tmp = (u8 *)vars[args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1457  			status = altera_set_ir_pre(&astate->js, count, index,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1458  							charptr_tmp);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1459  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1460  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1461  		case OP_IPOA:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1462  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1463  			 * IRPOST with array data
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1464  			 * ...argument 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1465  			 * ...stack 0 is array index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1466  			 * ...stack 1 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1467  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1468  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1469  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1470  			index = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1471  			count = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1472  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1473  			if (version > 0)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1474  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1475  				 * stack 0 = array right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1476  				 * stack 1 = array left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1477  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1478  				count = 1 + count - index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1479  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1480  			charptr_tmp = (u8 *)vars[args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1481  			status = altera_set_ir_post(&astate->js, count, index,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1482  							charptr_tmp);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1483  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1484  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1485  		case OP_EXPT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1486  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1487  			 * EXPORT
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1488  			 * ...argument 0 is string ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1489  			 * ...stack 0 is integer expression
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1490  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1491  			if (altera_check_stack(stack_ptr, 1, &status)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1492  				name = &p[str_table + args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1493  				long_tmp = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1494  				altera_export_int(name, long_tmp);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1495  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1496  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1497  		case OP_PSHE:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1498  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1499  			 * Push integer array element
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1500  			 * ...argument 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1501  			 * ...stack 0 is array index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1502  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1503  			if (!altera_check_stack(stack_ptr, 1, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1504  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1505  			variable_id = args[0];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1506  			index = stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1507  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1508  			/* check variable type */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1509  			if ((attrs[variable_id] & 0x1f) == 0x19) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1510  				/* writable integer array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1511  				longptr_tmp = (long *)vars[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1512  				stack[stack_ptr - 1] = longptr_tmp[index];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1513  			} else if ((attrs[variable_id] & 0x1f) == 0x1c) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1514  				/* read-only integer array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1515  				long_tmp = vars[variable_id] +
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1516  						(index * sizeof(long));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1517  				stack[stack_ptr - 1] =
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1518  					get_unaligned_be32(&p[long_tmp]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1519  			} else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1520  				status = -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1521  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1522  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1523  		case OP_PSHA:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1524  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1525  			 * Push Boolean array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1526  			 * ...argument 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1527  			 * ...stack 0 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1528  			 * ...stack 1 is array index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1529  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1530  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1531  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1532  			variable_id = args[0];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1533  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1534  			/* check that variable is a Boolean array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1535  			if ((attrs[variable_id] & 0x18) != 0x08) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1536  				status = -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1537  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1538  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1539  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1540  			charptr_tmp = (u8 *)vars[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1541  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1542  			/* pop the count (number of bits to copy) */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1543  			count = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1544  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1545  			/* pop the array index */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1546  			index = stack[stack_ptr - 1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1547  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1548  			if (version > 0)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1549  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1550  				 * stack 0 = array right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1551  				 * stack 1 = array left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1552  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1553  				count = 1 + count - index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1554  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1555  			if ((count < 1) || (count > 32)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1556  				status = -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1557  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1558  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1559  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1560  			long_tmp = 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1561  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1562  			for (i = 0; i < count; ++i)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1563  				if (charptr_tmp[(i + index) >> 3] &
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1564  						(1 << ((i + index) & 7)))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1565  					long_tmp |= (1L << i);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1566  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1567  			stack[stack_ptr - 1] = long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1568  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1569  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1570  		case OP_DYNA:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1571  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1572  			 * Dynamically change size of array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1573  			 * ...argument 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1574  			 * ...stack 0 is new size
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1575  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1576  			if (!altera_check_stack(stack_ptr, 1, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1577  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1578  			variable_id = args[0];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1579  			long_tmp = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1580  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1581  			if (long_tmp > var_size[variable_id]) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1582  				var_size[variable_id] = long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1583  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1584  				if (attrs[variable_id] & 0x10)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1585  					/* allocate integer array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1586  					long_tmp *= sizeof(long);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1587  				else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1588  					/* allocate Boolean array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1589  					long_tmp = (long_tmp + 7) >> 3;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1590  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1591  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1592  				 * If the buffer was previously allocated,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1593  				 * free it
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1594  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1595  				if (attrs[variable_id] & 0x80) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1596  					kfree((void *)vars[variable_id]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1597  					vars[variable_id] = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1598  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1599  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1600  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1601  				 * Allocate a new buffer
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1602  				 * of the requested size
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1603  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1604  				vars[variable_id] = (long)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1605  					kzalloc(long_tmp, GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1606  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1607  				if (vars[variable_id] == 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1608  					status = -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1609  					break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1610  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1611  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1612  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1613  				 * Set the attribute bit to indicate that
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1614  				 * this buffer was dynamically allocated and
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1615  				 * should be freed later
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1616  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1617  				attrs[variable_id] |= 0x80;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1618  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1619  				/* zero out memory */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1620  				count = ((var_size[variable_id] + 7L) /
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1621  									8L);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1622  				charptr_tmp = (u8 *)(vars[variable_id]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1623  				for (index = 0; index < count; ++index)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1624  					charptr_tmp[index] = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1625  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1626  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1627  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1628  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1629  		case OP_EXPV:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1630  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1631  			 * Export Boolean array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1632  			 * ...argument 0 is string ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1633  			 * ...stack 0 is variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1634  			 * ...stack 1 is array right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1635  			 * ...stack 2 is array left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1636  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1637  			if (!altera_check_stack(stack_ptr, 3, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1638  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1639  			if (version == 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1640  				/* EXPV is not supported in JBC 1.0 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1641  				bad_opcode = 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1642  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1643  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1644  			name = &p[str_table + args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1645  			variable_id = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1646  			long_idx = stack[--stack_ptr];/* right indx */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1647  			long_idx2 = stack[--stack_ptr];/* left indx */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1648  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1649  			if (long_idx > long_idx2) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1650  				/* reverse indices not supported */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1651  				status = -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1652  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1653  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1654  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1655  			long_count = 1 + long_idx2 - long_idx;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1656  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1657  			charptr_tmp = (u8 *)vars[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1658  			charptr_tmp2 = NULL;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1659  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1660  			if ((long_idx & 7L) != 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1661  				s32 k = long_idx;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1662  				charptr_tmp2 =
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1663  					kzalloc(((long_count + 7L) / 8L),
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1664  							GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1665  				if (charptr_tmp2 == NULL) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1666  					status = -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1667  					break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1668  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1669  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1670  				for (i = 0; i < long_count; ++i) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1671  					if (charptr_tmp[k >> 3] &
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1672  							(1 << (k & 7)))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1673  						charptr_tmp2[i >> 3] |=
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1674  								(1 << (i & 7));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1675  					else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1676  						charptr_tmp2[i >> 3] &=
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1677  								~(1 << (i & 7));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1678  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1679  					++k;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1680  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1681  				charptr_tmp = charptr_tmp2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1682  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1683  			} else if (long_idx != 0)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1684  				charptr_tmp = &charptr_tmp[long_idx >> 3];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1685  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1686  			altera_export_bool_array(name, charptr_tmp,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1687  							long_count);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1688  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1689  			/* free allocated buffer */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1690  			if ((long_idx & 7L) != 0)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1691  				kfree(charptr_tmp2);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1692  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1693  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1694  		case OP_COPY: {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1695  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1696  			 * Array copy
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1697  			 * ...argument 0 is dest ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1698  			 * ...argument 1 is source ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1699  			 * ...stack 0 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1700  			 * ...stack 1 is dest index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1701  			 * ...stack 2 is source index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1702  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1703  			s32 copy_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1704  			s32 copy_index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1705  			s32 copy_index2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1706  			s32 destleft;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1707  			s32 src_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1708  			s32 dest_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1709  			int src_reverse = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1710  			int dest_reverse = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1711  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1712  			if (!altera_check_stack(stack_ptr, 3, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1713  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1714  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1715  			copy_count = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1716  			copy_index = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1717  			copy_index2 = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1718  			reverse = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1719  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1720  			if (version > 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1721  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1722  				 * stack 0 = source right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1723  				 * stack 1 = source left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1724  				 * stack 2 = destination right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1725  				 * stack 3 = destination left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1726  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1727  				destleft = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1728  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1729  				if (copy_count > copy_index) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1730  					src_reverse = 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1731  					reverse = 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1732  					src_count = 1 + copy_count - copy_index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1733  					/* copy_index = source start index */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1734  				} else {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1735  					src_count = 1 + copy_index - copy_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1736  					/* source start index */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1737  					copy_index = copy_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1738  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1739  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1740  				if (copy_index2 > destleft) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1741  					dest_reverse = 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1742  					reverse = !reverse;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1743  					dest_count = 1 + copy_index2 - destleft;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1744  					/* destination start index */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1745  					copy_index2 = destleft;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1746  				} else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1747  					dest_count = 1 + destleft - copy_index2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1748  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1749  				copy_count = (src_count < dest_count) ?
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1750  							src_count : dest_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1751  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1752  				if ((src_reverse || dest_reverse) &&
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1753  					(src_count != dest_count))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1754  					/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1755  					 * If either the source or destination
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1756  					 * is reversed, we can't tolerate
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1757  					 * a length mismatch, because we
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1758  					 * "left justify" arrays when copying.
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1759  					 * This won't work correctly
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1760  					 * with reversed arrays.
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1761  					 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1762  					status = -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1763  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1764  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1765  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1766  			count = copy_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1767  			index = copy_index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1768  			index2 = copy_index2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1769  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1770  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1771  			 * If destination is a read-only array,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1772  			 * allocate a buffer and convert it to a writable array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1773  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1774  			variable_id = args[1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1775  			if ((version > 0) &&
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1776  				((attrs[variable_id] & 0x9c) == 0x0c)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1777  				/* Allocate a writable buffer for this array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1778  				long_tmp =
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1779  					(var_size[variable_id] + 7L) >> 3L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1780  				charptr_tmp2 = (u8 *)vars[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1781  				charptr_tmp =
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1782  					kzalloc(long_tmp, GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1783  				vars[variable_id] = (long)charptr_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1784  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1785  				if (vars[variable_id] == 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1786  					status = -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1787  					break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1788  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1789  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1790  				/* zero the buffer */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1791  				for (long_idx = 0L; long_idx < long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1792  								++long_idx)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1793  					charptr_tmp[long_idx] = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1794  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1795  				/* copy previous contents into buffer */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1796  				for (long_idx = 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1797  					long_idx < var_size[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1798  								++long_idx) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1799  					long_idx2 = long_idx;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1800  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1801  					if (charptr_tmp2[long_idx2 >> 3] &
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1802  						(1 << (long_idx2 & 7)))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1803  						charptr_tmp[long_idx >> 3] |=
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1804  							(1 << (long_idx & 7));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1805  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1806  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1807  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1808  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1809  				set bit 7 - buffer was dynamically allocated */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1810  				attrs[variable_id] |= 0x80;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1811  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1812  				/* clear bit 2 - variable is writable */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1813  				attrs[variable_id] &= ~0x04;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1814  				attrs[variable_id] |= 0x01;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1815  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1816  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1817  			charptr_tmp = (u8 *)vars[args[1]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1818  			charptr_tmp2 = (u8 *)vars[args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1819  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1820  			/* check if destination is a writable Boolean array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1821  			if ((attrs[args[1]] & 0x1c) != 0x08) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1822  				status = -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1823  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1824  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1825  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1826  			if (count < 1) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1827  				status = -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1828  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1829  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1830  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1831  			if (reverse)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1832  				index2 += (count - 1);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1833  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1834  			for (i = 0; i < count; ++i) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1835  				if (charptr_tmp2[index >> 3] &
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1836  							(1 << (index & 7)))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1837  					charptr_tmp[index2 >> 3] |=
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1838  							(1 << (index2 & 7));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1839  				else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1840  					charptr_tmp[index2 >> 3] &=
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1841  						~(1 << (index2 & 7));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1842  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1843  				++index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1844  				if (reverse)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1845  					--index2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1846  				else
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1847  					++index2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1848  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1849  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1850  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1851  		}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1852  		case OP_DSC:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1853  		case OP_ISC: {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1854  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1855  			 * DRSCAN with capture
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1856  			 * IRSCAN with capture
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1857  			 * ...argument 0 is scan data variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1858  			 * ...argument 1 is capture variable ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1859  			 * ...stack 0 is capture index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1860  			 * ...stack 1 is scan data index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1861  			 * ...stack 2 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1862  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1863  			s32 scan_right, scan_left;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1864  			s32 capture_count = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1865  			s32 scan_count = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1866  			s32 capture_index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1867  			s32 scan_index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1868  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1869  			if (!altera_check_stack(stack_ptr, 3, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1870  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1871  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1872  			capture_index = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1873  			scan_index = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1874  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1875  			if (version > 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1876  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1877  				 * stack 0 = capture right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1878  				 * stack 1 = capture left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1879  				 * stack 2 = scan right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1880  				 * stack 3 = scan left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1881  				 * stack 4 = count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1882  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1883  				scan_right = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1884  				scan_left = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1885  				capture_count = 1 + scan_index - capture_index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1886  				scan_count = 1 + scan_left - scan_right;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1887  				scan_index = scan_right;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1888  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1889  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1890  			long_count = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1891  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1892  			 * If capture array is read-only, allocate a buffer
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1893  			 * and convert it to a writable array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1894  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1895  			variable_id = args[1];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1896  			if ((version > 0) &&
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1897  				((attrs[variable_id] & 0x9c) == 0x0c)) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1898  				/* Allocate a writable buffer for this array */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1899  				long_tmp =
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1900  					(var_size[variable_id] + 7L) >> 3L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1901  				charptr_tmp2 = (u8 *)vars[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1902  				charptr_tmp =
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1903  					kzalloc(long_tmp, GFP_KERNEL);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1904  				vars[variable_id] = (long)charptr_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1905  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1906  				if (vars[variable_id] == 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1907  					status = -ENOMEM;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1908  					break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1909  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1910  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1911  				/* zero the buffer */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1912  				for (long_idx = 0L; long_idx < long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1913  								++long_idx)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1914  					charptr_tmp[long_idx] = 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1915  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1916  				/* copy previous contents into buffer */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1917  				for (long_idx = 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1918  					long_idx < var_size[variable_id];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1919  								++long_idx) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1920  					long_idx2 = long_idx;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1921  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1922  					if (charptr_tmp2[long_idx2 >> 3] &
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1923  						(1 << (long_idx2 & 7)))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1924  						charptr_tmp[long_idx >> 3] |=
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1925  							(1 << (long_idx & 7));
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1926  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1927  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1928  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1929  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1930  				 * set bit 7 - buffer was
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1931  				 * dynamically allocated
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1932  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1933  				attrs[variable_id] |= 0x80;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1934  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1935  				/* clear bit 2 - variable is writable */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1936  				attrs[variable_id] &= ~0x04;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1937  				attrs[variable_id] |= 0x01;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1938  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1939  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1940  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1941  			charptr_tmp = (u8 *)vars[args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1942  			charptr_tmp2 = (u8 *)vars[args[1]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1943  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1944  			if ((version > 0) &&
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1945  					((long_count > capture_count) ||
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1946  					(long_count > scan_count))) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1947  				status = -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1948  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1949  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1950  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1951  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1952  			 * check that capture array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1953  			 * is a writable Boolean array
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1954  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1955  			if ((attrs[args[1]] & 0x1c) != 0x08) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1956  				status = -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1957  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1958  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1959  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1960  			if (status == 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1961  				if (opcode == 0x82) /* DSC */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1962  					status = altera_swap_dr(astate,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1963  							long_count,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1964  							charptr_tmp,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1965  							scan_index,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1966  							charptr_tmp2,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1967  							capture_index);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1968  				else /* ISC */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1969  					status = altera_swap_ir(astate,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1970  							long_count,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1971  							charptr_tmp,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1972  							scan_index,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1973  							charptr_tmp2,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1974  							capture_index);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1975  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1976  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1977  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1978  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1979  		}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1980  		case OP_WAIT:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1981  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1982  			 * WAIT
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1983  			 * ...argument 0 is wait state
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1984  			 * ...argument 1 is end state
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1985  			 * ...stack 0 is cycles
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1986  			 * ...stack 1 is microseconds
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1987  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1988  			if (!altera_check_stack(stack_ptr, 2, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1989  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1990  			long_tmp = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1991  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1992  			if (long_tmp != 0L)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1993  				status = altera_wait_cycles(astate, long_tmp,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1994  								args[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1995  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1996  			long_tmp = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1997  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1998  			if ((status == 0) && (long_tmp != 0L))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  1999  				status = altera_wait_msecs(astate,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2000  								long_tmp,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2001  								args[0]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2002  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2003  			if ((status == 0) && (args[1] != args[0]))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2004  				status = altera_goto_jstate(astate,
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2005  								args[1]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2006  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2007  			if (version > 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2008  				--stack_ptr; /* throw away MAX cycles */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2009  				--stack_ptr; /* throw away MAX microseconds */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2010  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2011  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2012  		case OP_CMPA: {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2013  			/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2014  			 * Array compare
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2015  			 * ...argument 0 is source 1 ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2016  			 * ...argument 1 is source 2 ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2017  			 * ...argument 2 is mask ID
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2018  			 * ...stack 0 is source 1 index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2019  			 * ...stack 1 is source 2 index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2020  			 * ...stack 2 is mask index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2021  			 * ...stack 3 is count
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2022  			 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2023  			s32 a, b;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2024  			u8 *source1 = (u8 *)vars[args[0]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2025  			u8 *source2 = (u8 *)vars[args[1]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2026  			u8 *mask = (u8 *)vars[args[2]];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2027  			u32 index1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2028  			u32 index2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2029  			u32 mask_index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2030  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2031  			if (!altera_check_stack(stack_ptr, 4, &status))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2032  				break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2033  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2034  			index1 = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2035  			index2 = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2036  			mask_index = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2037  			long_count = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2038  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2039  			if (version > 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2040  				/*
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2041  				 * stack 0 = source 1 right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2042  				 * stack 1 = source 1 left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2043  				 * stack 2 = source 2 right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2044  				 * stack 3 = source 2 left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2045  				 * stack 4 = mask right index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2046  				 * stack 5 = mask left index
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2047  				 */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2048  				s32 mask_right = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2049  				s32 mask_left = stack[--stack_ptr];
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2050  				/* source 1 count */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2051  				a = 1 + index2 - index1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2052  				/* source 2 count */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2053  				b = 1 + long_count - mask_index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2054  				a = (a < b) ? a : b;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2055  				/* mask count */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2056  				b = 1 + mask_left - mask_right;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2057  				a = (a < b) ? a : b;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2058  				/* source 2 start index */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2059  				index2 = mask_index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2060  				/* mask start index */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2061  				mask_index = mask_right;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2062  				long_count = a;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2063  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2064  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2065  			long_tmp = 1L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2066  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2067  			if (long_count < 1)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2068  				status = -ERANGE;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2069  			else {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2070  				count = long_count;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2071  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2072  				for (i = 0; i < count; ++i) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2073  					if (mask[mask_index >> 3] &
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2074  						(1 << (mask_index & 7))) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2075  						a = source1[index1 >> 3] &
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2076  							(1 << (index1 & 7))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2077  								? 1 : 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2078  						b = source2[index2 >> 3] &
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2079  							(1 << (index2 & 7))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2080  								? 1 : 0;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2081  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2082  						if (a != b) /* failure */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2083  							long_tmp = 0L;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2084  					}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2085  					++index1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2086  					++index2;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2087  					++mask_index;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2088  				}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2089  			}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2090  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2091  			stack[stack_ptr++] = long_tmp;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2092  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2093  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2094  		}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2095  		default:
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2096  			/* Unrecognized opcode -- ERROR! */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2097  			bad_opcode = 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2098  			break;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2099  		}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2100  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2101  		if (bad_opcode)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2102  			status = -ENOSYS;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2103  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2104  		if ((stack_ptr < 0) || (stack_ptr >= ALTERA_STACK_SIZE))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2105  			status = -EOVERFLOW;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2106  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2107  		if (status != 0) {
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2108  			done = 1;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2109  			*error_address = (s32)(opcode_address - code_sect);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2110  		}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2111  	}
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2112  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2113  	altera_free_buffers(astate);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2114  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2115  	/* Free all dynamically allocated arrays */
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25 @2116  	if ((attrs != NULL) && (vars != NULL))
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2117  		for (i = 0; i < sym_count; ++i)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2118  			if (attrs[i] & 0x80)
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2119  				kfree((void *)vars[i]);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2120  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2121  	kfree(vars);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2122  	kfree(var_size);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2123  	kfree(attrs);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2124  	kfree(proc_attributes);
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2125  
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2126  	return status;
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2127  }
fa766c9be58bd8 drivers/staging/altera-stapl/altera.c Igor M. Liplianin 2011-01-25  2128  

:::::: The code at line 2116 was first introduced by commit
:::::: fa766c9be58bd872784b081074a7d15a3ce61c5f [media] Altera FPGA firmware download module

:::::: TO: Igor M. Liplianin <liplianin@me.by>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
