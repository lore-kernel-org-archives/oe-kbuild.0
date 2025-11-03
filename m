Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E982EF66E
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Nov 2025 09:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762163479; cv=none; b=pTMH5BwzJqpqjoJLhXKqDbPBz9PEpplL8vRilzizHEebKkqVWgHLBYQSjSRiZvHft6/eXuNYpgRPDv069MFDX1jqIpC9mRo20wMjFVBBdgGWUTDsG+t71riPEpdanSpgy9c6DcPvICiS7pfS30dCiTd30+DZpNJR7pC5aw4Jtgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762163479; c=relaxed/simple;
	bh=5c8rXyvb8yPnMeYfKSpxSslTcyEDel8zwyoDrGalNQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RXR5/Wpwkkw73YQpNR9iwDYLPGH778deNebiBXEPCZpB+zRpe7RPfmtpHABMh38rN6e0lwVb8+kvUwoZqej5bRcHrbcPp6NXfaJ9jWG0FDYyylgePfykgZveVgyXUjUhh1QFMw4w+l20RczMt9PZJYvtMRy1RJCM8ks17WAGiRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+NYzio/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+NYzio/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762163476; x=1793699476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5c8rXyvb8yPnMeYfKSpxSslTcyEDel8zwyoDrGalNQ0=;
  b=Z+NYzio/Ilne9zIIfFHCck+bsXfdZZMt6jWk3Wj49x8eaaoDVsdAhShS
   it9PM8a08CAQLSIqYUOt5N3d2Hg+twwDRtHyAnEnHICV7oeYhwgk5VLSP
   zuNIpbp8Kh7Y/+hweSLR+prDin1sFTVtX0u0hSKqn9VydmysRGop538Ua
   8ZEcj2A4+HUlXgVJOnYFV4FGetj2DkcEpPn+4pFH32H6dVbI57gRnmadF
   E7hJSLczt89NVjBilJ2Y0rmV2wbt8c4Kk2bPua5Zd0ThxBsZyaKl/CZpZ
   Y6B91ltwK7qtAv1cflP74bqrJvgNADlfkZDGNLIGz8zsaSEn70tboKiBT
   Q==;
X-CSE-ConnectionGUID: 0uMuR1z+R8Wz2Fyzc0Mztg==
X-CSE-MsgGUID: cUS9ZjaoTYmma+DD5mrWRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68072921"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68072921"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 01:51:16 -0800
X-CSE-ConnectionGUID: Zdv1AeeBSrOMpwtCMjVZxA==
X-CSE-MsgGUID: md40dDDCSgu9LMYCxI68iQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 03 Nov 2025 01:51:14 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFrDU-000Q18-0j;
	Mon, 03 Nov 2025 09:51:12 +0000
Date: Mon, 3 Nov 2025 17:51:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/acpi/acpica/nsaccess.c:589 acpi_ns_lookup() error:
 uninitialized symbol 'simple_name'.
Message-ID: <202511031752.f8ID6sH8-lkp@intel.com>
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
TO: Huacai Chen <chenhuacai@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6146a0f1dfae5d37442a9ddcba012add260bceb0
commit: a9d13433fe17be0e867e51e71a1acd2731fbef8d LoongArch: Align ACPI structures if ARCH_STRICT_ALIGN enabled
date:   7 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 7 weeks ago
config: loongarch-randconfig-r072-20251103 (https://download.01.org/0day-ci/archive/20251103/202511031752.f8ID6sH8-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511031752.f8ID6sH8-lkp@intel.com/

New smatch warnings:
drivers/acpi/acpica/nsaccess.c:589 acpi_ns_lookup() error: uninitialized symbol 'simple_name'.
drivers/acpi/acpica/psargs.c:526 acpi_ps_get_next_field() error: uninitialized symbol 'name'.
drivers/acpi/acpica/rscalc.c:510 acpi_rs_get_list_length() error: uninitialized symbol 'temp16'.
drivers/acpi/acpica/tbutils.c:174 acpi_tb_get_root_table_entry() error: uninitialized symbol 'address32'.
drivers/acpi/acpica/tbutils.c:194 acpi_tb_get_root_table_entry() error: uninitialized symbol 'address64'.
drivers/acpi/acpica/utbuffer.c:93 acpi_ut_dump_buffer() error: uninitialized symbol 'temp32'.
drivers/acpi/acpica/utresrc.c:479 acpi_ut_get_resource_length() error: uninitialized symbol 'resource_length'.

Old smatch warnings:
drivers/acpi/acpica/utbuffer.c:100 acpi_ut_dump_buffer() error: uninitialized symbol 'temp32'.

vim +/simple_name +589 drivers/acpi/acpica/nsaccess.c

^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  255  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  256  /*******************************************************************************
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  257   *
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  258   * FUNCTION:    acpi_ns_lookup
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  259   *
44f6c01242da4e1 drivers/acpi/namespace/nsaccess.c Robert Moore        2005-04-18  260   * PARAMETERS:  scope_info      - Current scope info block
ba494beeaa69bc0 drivers/acpi/acpica/nsaccess.c    Bob Moore           2012-07-12  261   *              pathname        - Search pathname, in internal format
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  262   *                                (as represented in the AML stream)
ba494beeaa69bc0 drivers/acpi/acpica/nsaccess.c    Bob Moore           2012-07-12  263   *              type            - Type associated with name
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  264   *              interpreter_mode - IMODE_LOAD_PASS2 => add name if not found
ba494beeaa69bc0 drivers/acpi/acpica/nsaccess.c    Bob Moore           2012-07-12  265   *              flags           - Flags describing the search restrictions
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  266   *              walk_state      - Current state of the walk
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  267   *              return_node     - Where the Node is placed (if found
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  268   *                                or created successfully)
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  269   *
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  270   * RETURN:      Status
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  271   *
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  272   * DESCRIPTION: Find or enter the passed name in the name space.
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  273   *              Log an error if name not found in Exec mode.
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  274   *
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  275   * MUTEX:       Assumes namespace is locked.
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  276   *
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  277   ******************************************************************************/
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  278  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  279  acpi_status
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  280  acpi_ns_lookup(union acpi_generic_state *scope_info,
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  281  	       char *pathname,
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  282  	       acpi_object_type type,
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  283  	       acpi_interpreter_mode interpreter_mode,
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  284  	       u32 flags,
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  285  	       struct acpi_walk_state *walk_state,
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  286  	       struct acpi_namespace_node **return_node)
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  287  {
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  288  	acpi_status status;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  289  	char *path = pathname;
6d9229d67df35f9 drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  290  	char *external_path;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  291  	struct acpi_namespace_node *prefix_node;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  292  	struct acpi_namespace_node *current_node = NULL;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  293  	struct acpi_namespace_node *this_node = NULL;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  294  	u32 num_segments;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  295  	u32 num_carats;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  296  	acpi_name simple_name;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  297  	acpi_object_type type_to_check_for;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  298  	acpi_object_type this_search_type;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  299  	u32 search_parent_flag = ACPI_NS_SEARCH_PARENT;
958dd242b691f64 drivers/acpi/namespace/nsaccess.c Bob Moore           2006-05-12  300  	u32 local_flags;
927a6abf023b1a8 drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  301  	acpi_interpreter_mode local_interpreter_mode;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  302  
b229cf92eee616c drivers/acpi/namespace/nsaccess.c Bob Moore           2006-04-21  303  	ACPI_FUNCTION_TRACE(ns_lookup);
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  304  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  305  	if (!return_node) {
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  306  		return_ACPI_STATUS(AE_BAD_PARAMETER);
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  307  	}
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  308  
8f6f03610483962 drivers/acpi/acpica/nsaccess.c    Lv Zheng            2015-07-01  309  	local_flags = flags &
8f6f03610483962 drivers/acpi/acpica/nsaccess.c    Lv Zheng            2015-07-01  310  	    ~(ACPI_NS_ERROR_IF_FOUND | ACPI_NS_OVERRIDE_IF_FOUND |
8f6f03610483962 drivers/acpi/acpica/nsaccess.c    Lv Zheng            2015-07-01  311  	      ACPI_NS_SEARCH_PARENT);
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  312  	*return_node = ACPI_ENTRY_NOT_FOUND;
958dd242b691f64 drivers/acpi/namespace/nsaccess.c Bob Moore           2006-05-12  313  	acpi_gbl_ns_lookup_count++;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  314  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  315  	if (!acpi_gbl_root_node) {
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  316  		return_ACPI_STATUS(AE_NO_NAMESPACE);
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  317  	}
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  318  
d4913dc6d0c680a drivers/acpi/acpica/nsaccess.c    Bob Moore           2009-03-06  319  	/* Get the prefix scope. A null scope means use the root scope */
d4913dc6d0c680a drivers/acpi/acpica/nsaccess.c    Bob Moore           2009-03-06  320  
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  321  	if ((!scope_info) || (!scope_info->scope.node)) {
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  322  		ACPI_DEBUG_PRINT((ACPI_DB_NAMES,
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  323  				  "Null scope prefix, using root node (%p)\n",
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  324  				  acpi_gbl_root_node));
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  325  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  326  		prefix_node = acpi_gbl_root_node;
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  327  	} else {
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  328  		prefix_node = scope_info->scope.node;
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  329  		if (ACPI_GET_DESCRIPTOR_TYPE(prefix_node) !=
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  330  		    ACPI_DESC_TYPE_NAMED) {
b8e4d89357fc434 drivers/acpi/namespace/nsaccess.c Bob Moore           2006-01-27  331  			ACPI_ERROR((AE_INFO, "%p is not a namespace node [%s]",
4a90c7e86202f46 drivers/acpi/namespace/nsaccess.c Bob Moore           2006-01-13  332  				    prefix_node,
b8e4d89357fc434 drivers/acpi/namespace/nsaccess.c Bob Moore           2006-01-27  333  				    acpi_ut_get_descriptor_name(prefix_node)));
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  334  			return_ACPI_STATUS(AE_AML_INTERNAL);
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  335  		}
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  336  
8313524a0d466f4 drivers/acpi/namespace/nsaccess.c Bob Moore           2006-10-03  337  		if (!(flags & ACPI_NS_PREFIX_IS_SCOPE)) {
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  338  			/*
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  339  			 * This node might not be a actual "scope" node (such as a
d4913dc6d0c680a drivers/acpi/acpica/nsaccess.c    Bob Moore           2009-03-06  340  			 * Device/Method, etc.)  It could be a Package or other object
d4913dc6d0c680a drivers/acpi/acpica/nsaccess.c    Bob Moore           2009-03-06  341  			 * node. Backup up the tree to find the containing scope node.
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  342  			 */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  343  			while (!acpi_ns_opens_scope(prefix_node->type) &&
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  344  			       prefix_node->type != ACPI_TYPE_ANY) {
c45b5c097001480 drivers/acpi/acpica/nsaccess.c    Alexey Starikovskiy 2010-05-26  345  				prefix_node = prefix_node->parent;
8313524a0d466f4 drivers/acpi/namespace/nsaccess.c Bob Moore           2006-10-03  346  			}
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  347  		}
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  348  	}
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  349  
d4913dc6d0c680a drivers/acpi/acpica/nsaccess.c    Bob Moore           2009-03-06  350  	/* Save type. TBD: may be no longer necessary */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  351  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  352  	type_to_check_for = type;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  353  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  354  	/*
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  355  	 * Begin examination of the actual pathname
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  356  	 */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  357  	if (!pathname) {
52fc0b026e99b5d drivers/acpi/namespace/nsaccess.c Bob Moore           2006-10-02  358  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  359  		/* A Null name_path is allowed and refers to the root */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  360  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  361  		num_segments = 0;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  362  		this_node = acpi_gbl_root_node;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  363  		path = "";
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  364  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  365  		ACPI_DEBUG_PRINT((ACPI_DB_NAMES,
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  366  				  "Null Pathname (Zero segments), Flags=%X\n",
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  367  				  flags));
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  368  	} else {
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  369  		/*
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  370  		 * Name pointer is valid (and must be in internal name format)
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  371  		 *
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  372  		 * Check for scope prefixes:
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  373  		 *
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  374  		 * As represented in the AML stream, a namepath consists of an
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  375  		 * optional scope prefix followed by a name segment part.
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  376  		 *
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  377  		 * If present, the scope prefix is either a Root Prefix (in
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  378  		 * which case the name is fully qualified), or one or more
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  379  		 * Parent Prefixes (in which case the name's scope is relative
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  380  		 * to the current scope).
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  381  		 */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  382  		if (*path == (u8) AML_ROOT_PREFIX) {
52fc0b026e99b5d drivers/acpi/namespace/nsaccess.c Bob Moore           2006-10-02  383  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  384  			/* Pathname is fully qualified, start from the root */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  385  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  386  			this_node = acpi_gbl_root_node;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  387  			search_parent_flag = ACPI_NS_NO_UPSEARCH;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  388  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  389  			/* Point to name segment part */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  390  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  391  			path++;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  392  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  393  			ACPI_DEBUG_PRINT((ACPI_DB_NAMES,
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  394  					  "Path is absolute from root [%p]\n",
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  395  					  this_node));
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  396  		} else {
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  397  			/* Pathname is relative to current scope, start there */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  398  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  399  			ACPI_DEBUG_PRINT((ACPI_DB_NAMES,
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  400  					  "Searching relative to prefix scope [%4.4s] (%p)\n",
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  401  					  acpi_ut_get_node_name(prefix_node),
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  402  					  prefix_node));
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  403  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  404  			/*
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  405  			 * Handle multiple Parent Prefixes (carat) by just getting
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  406  			 * the parent node for each prefix instance.
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  407  			 */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  408  			this_node = prefix_node;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  409  			num_carats = 0;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  410  			while (*path == (u8) AML_PARENT_PREFIX) {
52fc0b026e99b5d drivers/acpi/namespace/nsaccess.c Bob Moore           2006-10-02  411  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  412  				/* Name is fully qualified, no search rules apply */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  413  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  414  				search_parent_flag = ACPI_NS_NO_UPSEARCH;
d4913dc6d0c680a drivers/acpi/acpica/nsaccess.c    Bob Moore           2009-03-06  415  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  416  				/*
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  417  				 * Point past this prefix to the name segment
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  418  				 * part or the next Parent Prefix
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  419  				 */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  420  				path++;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  421  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  422  				/* Backup to the parent node */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  423  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  424  				num_carats++;
c45b5c097001480 drivers/acpi/acpica/nsaccess.c    Alexey Starikovskiy 2010-05-26  425  				this_node = this_node->parent;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  426  				if (!this_node) {
6d9229d67df35f9 drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  427  					/*
6d9229d67df35f9 drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  428  					 * Current scope has no parent scope. Externalize
6d9229d67df35f9 drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  429  					 * the internal path for error message.
6d9229d67df35f9 drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  430  					 */
6d9229d67df35f9 drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  431  					status =
6d9229d67df35f9 drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  432  					    acpi_ns_externalize_name
6d9229d67df35f9 drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  433  					    (ACPI_UINT32_MAX, pathname, NULL,
6d9229d67df35f9 drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  434  					     &external_path);
6d9229d67df35f9 drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  435  					if (ACPI_SUCCESS(status)) {
6d9229d67df35f9 drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  436  						ACPI_ERROR((AE_INFO,
6d9229d67df35f9 drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  437  							    "%s: Path has too many parent prefixes (^)",
6d9229d67df35f9 drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  438  							    external_path));
52fc0b026e99b5d drivers/acpi/namespace/nsaccess.c Bob Moore           2006-10-02  439  
6d9229d67df35f9 drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  440  						ACPI_FREE(external_path);
6d9229d67df35f9 drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  441  					}
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  442  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  443  					return_ACPI_STATUS(AE_NOT_FOUND);
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  444  				}
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  445  			}
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  446  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  447  			if (search_parent_flag == ACPI_NS_NO_UPSEARCH) {
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  448  				ACPI_DEBUG_PRINT((ACPI_DB_NAMES,
b27d65975c252ff drivers/acpi/acpica/nsaccess.c    Bob Moore           2010-05-26  449  						  "Search scope is [%4.4s], path has %u carat(s)\n",
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  450  						  acpi_ut_get_node_name
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  451  						  (this_node), num_carats));
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  452  			}
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  453  		}
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  454  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  455  		/*
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  456  		 * Determine the number of ACPI name segments in this pathname.
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  457  		 *
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  458  		 * The segment part consists of either:
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  459  		 *  - A Null name segment (0)
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  460  		 *  - A dual_name_prefix followed by two 4-byte name segments
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  461  		 *  - A multi_name_prefix followed by a byte indicating the
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  462  		 *      number of segments and the segments themselves.
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  463  		 *  - A single 4-byte name segment
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  464  		 *
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  465  		 * Examine the name prefix opcode, if any, to determine the number of
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  466  		 * segments.
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  467  		 */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  468  		switch (*path) {
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  469  		case 0:
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  470  			/*
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  471  			 * Null name after a root or parent prefixes. We already
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  472  			 * have the correct target node and there are no name segments.
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  473  			 */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  474  			num_segments = 0;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  475  			type = this_node->type;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  476  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  477  			ACPI_DEBUG_PRINT((ACPI_DB_NAMES,
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  478  					  "Prefix-only Pathname (Zero name segments), Flags=%X\n",
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  479  					  flags));
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  480  			break;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  481  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  482  		case AML_DUAL_NAME_PREFIX:
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  483  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  484  			/* More than one name_seg, search rules do not apply */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  485  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  486  			search_parent_flag = ACPI_NS_NO_UPSEARCH;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  487  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  488  			/* Two segments, point to first name segment */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  489  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  490  			num_segments = 2;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  491  			path++;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  492  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  493  			ACPI_DEBUG_PRINT((ACPI_DB_NAMES,
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  494  					  "Dual Pathname (2 segments, Flags=%X)\n",
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  495  					  flags));
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  496  			break;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  497  
9ff5a21a50301ef drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-04-26  498  		case AML_MULTI_NAME_PREFIX:
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  499  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  500  			/* More than one name_seg, search rules do not apply */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  501  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  502  			search_parent_flag = ACPI_NS_NO_UPSEARCH;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  503  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  504  			/* Extract segment count, point to first name segment */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  505  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  506  			path++;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  507  			num_segments = (u32) (u8) * path;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  508  			path++;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  509  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  510  			ACPI_DEBUG_PRINT((ACPI_DB_NAMES,
b27d65975c252ff drivers/acpi/acpica/nsaccess.c    Bob Moore           2010-05-26  511  					  "Multi Pathname (%u Segments, Flags=%X)\n",
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  512  					  num_segments, flags));
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  513  			break;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  514  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  515  		default:
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  516  			/*
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  517  			 * Not a Null name, no Dual or Multi prefix, hence there is
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  518  			 * only one name segment and Pathname is already pointing to it.
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  519  			 */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  520  			num_segments = 1;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  521  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  522  			ACPI_DEBUG_PRINT((ACPI_DB_NAMES,
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  523  					  "Simple Pathname (1 segment, Flags=%X)\n",
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  524  					  flags));
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  525  			break;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  526  		}
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  527  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  528  		ACPI_DEBUG_EXEC(acpi_ns_print_pathname(num_segments, path));
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  529  	}
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  530  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  531  	/*
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  532  	 * Search namespace for each segment of the name. Loop through and
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  533  	 * verify (or add to the namespace) each name segment.
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  534  	 *
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  535  	 * The object type is significant only at the last name
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  536  	 * segment. (We don't care about the types along the path, only
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  537  	 * the type of the final target object.)
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  538  	 */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  539  	this_search_type = ACPI_TYPE_ANY;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  540  	current_node = this_node;
927a6abf023b1a8 drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  541  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  542  	while (num_segments && current_node) {
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  543  		num_segments--;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  544  		if (!num_segments) {
d4913dc6d0c680a drivers/acpi/acpica/nsaccess.c    Bob Moore           2009-03-06  545  
d4913dc6d0c680a drivers/acpi/acpica/nsaccess.c    Bob Moore           2009-03-06  546  			/* This is the last segment, enable typechecking */
d4913dc6d0c680a drivers/acpi/acpica/nsaccess.c    Bob Moore           2009-03-06  547  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  548  			this_search_type = type;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  549  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  550  			/*
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  551  			 * Only allow automatic parent search (search rules) if the caller
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  552  			 * requested it AND we have a single, non-fully-qualified name_seg
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  553  			 */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  554  			if ((search_parent_flag != ACPI_NS_NO_UPSEARCH) &&
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  555  			    (flags & ACPI_NS_SEARCH_PARENT)) {
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  556  				local_flags |= ACPI_NS_SEARCH_PARENT;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  557  			}
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  558  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  559  			/* Set error flag according to caller */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  560  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  561  			if (flags & ACPI_NS_ERROR_IF_FOUND) {
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  562  				local_flags |= ACPI_NS_ERROR_IF_FOUND;
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  563  			}
8f6f03610483962 drivers/acpi/acpica/nsaccess.c    Lv Zheng            2015-07-01  564  
8f6f03610483962 drivers/acpi/acpica/nsaccess.c    Lv Zheng            2015-07-01  565  			/* Set override flag according to caller */
8f6f03610483962 drivers/acpi/acpica/nsaccess.c    Lv Zheng            2015-07-01  566  
8f6f03610483962 drivers/acpi/acpica/nsaccess.c    Lv Zheng            2015-07-01  567  			if (flags & ACPI_NS_OVERRIDE_IF_FOUND) {
8f6f03610483962 drivers/acpi/acpica/nsaccess.c    Lv Zheng            2015-07-01  568  				local_flags |= ACPI_NS_OVERRIDE_IF_FOUND;
8f6f03610483962 drivers/acpi/acpica/nsaccess.c    Lv Zheng            2015-07-01  569  			}
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  570  		}
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  571  
927a6abf023b1a8 drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  572  		/* Handle opcodes that create a new name_seg via a full name_path */
927a6abf023b1a8 drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  573  
927a6abf023b1a8 drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  574  		local_interpreter_mode = interpreter_mode;
927a6abf023b1a8 drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  575  		if ((flags & ACPI_NS_PREFIX_MUST_EXIST) && (num_segments > 0)) {
927a6abf023b1a8 drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  576  
927a6abf023b1a8 drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  577  			/* Every element of the path must exist (except for the final name_seg) */
927a6abf023b1a8 drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  578  
927a6abf023b1a8 drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  579  			local_interpreter_mode = ACPI_IMODE_EXECUTE;
927a6abf023b1a8 drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  580  		}
927a6abf023b1a8 drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  581  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  582  		/* Extract one ACPI name from the front of the pathname */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  583  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  584  		ACPI_MOVE_32_TO_32(&simple_name, path);
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  585  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  586  		/* Try to find the single (4 character) ACPI name */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  587  
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  588  		status =
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05 @589  		    acpi_ns_search_and_enter(simple_name, walk_state,
927a6abf023b1a8 drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  590  					     current_node,
927a6abf023b1a8 drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  591  					     local_interpreter_mode,
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  592  					     this_search_type, local_flags,
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  593  					     &this_node);
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  594  		if (ACPI_FAILURE(status)) {
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  595  			if (status == AE_NOT_FOUND) {
927a6abf023b1a8 drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  596  #if !defined ACPI_ASL_COMPILER	/* Note: iASL reports this error by itself, not needed here */
927a6abf023b1a8 drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  597  				if (flags & ACPI_NS_PREFIX_MUST_EXIST) {
927a6abf023b1a8 drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  598  					acpi_os_printf(ACPI_MSG_BIOS_ERROR
927a6abf023b1a8 drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  599  						       "Object does not exist: %4.4s\n",
36056d0cd677bbd drivers/acpi/acpica/nsaccess.c    Bob Moore           2019-08-16  600  						       (char *)&simple_name);
927a6abf023b1a8 drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  601  				}
927a6abf023b1a8 drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  602  #endif
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  603  				/* Name not found in ACPI namespace */
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  604  
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  605  				ACPI_DEBUG_PRINT((ACPI_DB_NAMES,
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  606  						  "Name [%4.4s] not found in scope [%4.4s] %p\n",
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  607  						  (char *)&simple_name,
4be44fcd3bf648b drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  608  						  (char *)&current_node->name,
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  609  						  current_node));
^1da177e4c3f415 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  610  			}
77d4e0966a8a6f8 drivers/acpi/acpica/nsaccess.c    Erik Kaneda         2018-08-10  611  #ifdef ACPI_EXEC_APP
77d4e0966a8a6f8 drivers/acpi/acpica/nsaccess.c    Erik Kaneda         2018-08-10  612  			if ((status == AE_ALREADY_EXISTS) &&
77d4e0966a8a6f8 drivers/acpi/acpica/nsaccess.c    Erik Kaneda         2018-08-10  613  			    (this_node->flags & ANOBJ_NODE_EARLY_INIT)) {
77d4e0966a8a6f8 drivers/acpi/acpica/nsaccess.c    Erik Kaneda         2018-08-10  614  				this_node->flags &= ~ANOBJ_NODE_EARLY_INIT;
77d4e0966a8a6f8 drivers/acpi/acpica/nsaccess.c    Erik Kaneda         2018-08-10  615  				status = AE_OK;
77d4e0966a8a6f8 drivers/acpi/acpica/nsaccess.c    Erik Kaneda         2018-08-10  616  			}
77d4e0966a8a6f8 drivers/acpi/acpica/nsaccess.c    Erik Kaneda         2018-08-10  617  #endif
77d4e0966a8a6f8 drivers/acpi/acpica/nsaccess.c    Erik Kaneda         2018-08-10  618  

:::::: The code at line 589 was first introduced by commit
:::::: 4be44fcd3bf648b782f4460fd06dfae6c42ded4b [ACPI] Lindent all ACPI files

:::::: TO: Len Brown <len.brown@intel.com>
:::::: CC: Len Brown <len.brown@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
