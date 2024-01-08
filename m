Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EF853E29
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jan 2024 16:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fh6Cq+pl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704733055; x=1736269055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TmiP6Gb9GEJyRaRdfnosfu7pzdZEjZW926zHiLkP7DI=;
  b=fh6Cq+plzpdEX04E0Xo1YHa3SOB8AndYl64tZslFEDg/4mBLFXdxJRA/
   q4sLFta2i88Z0LD80Xcu96ymsmgZZuq2yk0CMBxv2SGz4c9HwXzXaiM7C
   0PpySX6YBqyVRGmGfkCVANGpMkEWLQzj1xiuYlE5Ccncvh3lnW0IBSwvO
   qrBLciL9GKOORWxTrEKNKAffwZJzVkd5BoAGgkDFKfW9fxxgHzRIDdcgO
   1XChWIHmxxYu8ib/OC5g2Erok5dunMJnMvukO1FU/mhFlLeppQZoKLMPb
   JEQa461T0MguZZev4fS550O6QGLxApV2uX65vcvFARocCtXlEfeAi/C2z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5305671"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="5305671"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 08:57:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="851869022"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="851869022"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 08 Jan 2024 08:57:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMsw5-0004vB-15;
	Mon, 08 Jan 2024 16:57:13 +0000
Date: Tue, 9 Jan 2024 00:56:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn:
 Calling kobject_put|get with state->initialized unset from line: 693
Message-ID: <202401090033.hnpqRNzG-lkp@intel.com>
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
TO: Dave Airlie <airlied@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0dd3ee31125508cd67f7e7172247f05b7fd1753a
commit: eacabb5462717a52fccbbbba458365a4f5e61f35 nouveau: push event block/allowing out of the fence context
date:   4 days ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20240108 (https://download.01.org/0day-ci/archive/20240109/202401090033.hnpqRNzG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401090033.hnpqRNzG-lkp@intel.com/

smatch warnings:
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/acpi/cppc_acpi.c:879 acpi_cppc_processor_probe() warn: Calling kobject_put|get with state->initialized unset from line: 693
drivers/gpu/drm/nouveau/nouveau_fence.c:549 nouveau_fence_enable_signaling() error: uninitialized symbol 'do_work'.

vim +879 drivers/acpi/cppc_acpi.c

41ea667227bad5 Nathan Fontenot     2020-11-12  657  
337aadff8e4567 Ashwin Chaugule     2015-10-02  658  /**
337aadff8e4567 Ashwin Chaugule     2015-10-02  659   * acpi_cppc_processor_probe - Search for per CPU _CPC objects.
603fadf33604a2 Bjorn Helgaas       2019-03-25  660   * @pr: Ptr to acpi_processor containing this CPU's logical ID.
337aadff8e4567 Ashwin Chaugule     2015-10-02  661   *
337aadff8e4567 Ashwin Chaugule     2015-10-02  662   *	Return: 0 for success or negative value for err.
337aadff8e4567 Ashwin Chaugule     2015-10-02  663   */
337aadff8e4567 Ashwin Chaugule     2015-10-02  664  int acpi_cppc_processor_probe(struct acpi_processor *pr)
337aadff8e4567 Ashwin Chaugule     2015-10-02  665  {
337aadff8e4567 Ashwin Chaugule     2015-10-02  666  	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
337aadff8e4567 Ashwin Chaugule     2015-10-02  667  	union acpi_object *out_obj, *cpc_obj;
337aadff8e4567 Ashwin Chaugule     2015-10-02  668  	struct cpc_desc *cpc_ptr;
337aadff8e4567 Ashwin Chaugule     2015-10-02  669  	struct cpc_reg *gas_t;
158c998ea44ba3 Ashwin Chaugule     2016-08-16  670  	struct device *cpu_dev;
337aadff8e4567 Ashwin Chaugule     2015-10-02  671  	acpi_handle handle = pr->handle;
337aadff8e4567 Ashwin Chaugule     2015-10-02  672  	unsigned int num_ent, i, cpc_rev;
85b1407bf6d2f4 George Cherian      2017-10-11  673  	int pcc_subspace_id = -1;
337aadff8e4567 Ashwin Chaugule     2015-10-02  674  	acpi_status status;
f21a3509842294 Rafael J. Wysocki   2022-03-22  675  	int ret = -ENODATA;
337aadff8e4567 Ashwin Chaugule     2015-10-02  676  
7feec7430edddb Mario Limonciello   2022-07-05  677  	if (!osc_sb_cppc2_support_acked) {
7feec7430edddb Mario Limonciello   2022-07-05  678  		pr_debug("CPPC v2 _OSC not acked\n");
8b356e536e69f3 Mario Limonciello   2022-07-05  679  		if (!cpc_supported_by_cpu())
c42fa24b44751c Rafael J. Wysocki   2022-03-16  680  			return -ENODEV;
7feec7430edddb Mario Limonciello   2022-07-05  681  	}
c42fa24b44751c Rafael J. Wysocki   2022-03-16  682  
603fadf33604a2 Bjorn Helgaas       2019-03-25  683  	/* Parse the ACPI _CPC table for this CPU. */
337aadff8e4567 Ashwin Chaugule     2015-10-02  684  	status = acpi_evaluate_object_typed(handle, "_CPC", NULL, &output,
337aadff8e4567 Ashwin Chaugule     2015-10-02  685  			ACPI_TYPE_PACKAGE);
337aadff8e4567 Ashwin Chaugule     2015-10-02  686  	if (ACPI_FAILURE(status)) {
337aadff8e4567 Ashwin Chaugule     2015-10-02  687  		ret = -ENODEV;
337aadff8e4567 Ashwin Chaugule     2015-10-02  688  		goto out_buf_free;
337aadff8e4567 Ashwin Chaugule     2015-10-02  689  	}
337aadff8e4567 Ashwin Chaugule     2015-10-02  690  
337aadff8e4567 Ashwin Chaugule     2015-10-02  691  	out_obj = (union acpi_object *) output.pointer;
337aadff8e4567 Ashwin Chaugule     2015-10-02  692  
337aadff8e4567 Ashwin Chaugule     2015-10-02  693  	cpc_ptr = kzalloc(sizeof(struct cpc_desc), GFP_KERNEL);
337aadff8e4567 Ashwin Chaugule     2015-10-02  694  	if (!cpc_ptr) {
337aadff8e4567 Ashwin Chaugule     2015-10-02  695  		ret = -ENOMEM;
337aadff8e4567 Ashwin Chaugule     2015-10-02  696  		goto out_buf_free;
337aadff8e4567 Ashwin Chaugule     2015-10-02  697  	}
337aadff8e4567 Ashwin Chaugule     2015-10-02  698  
337aadff8e4567 Ashwin Chaugule     2015-10-02  699  	/* First entry is NumEntries. */
337aadff8e4567 Ashwin Chaugule     2015-10-02  700  	cpc_obj = &out_obj->package.elements[0];
337aadff8e4567 Ashwin Chaugule     2015-10-02  701  	if (cpc_obj->type == ACPI_TYPE_INTEGER)	{
337aadff8e4567 Ashwin Chaugule     2015-10-02  702  		num_ent = cpc_obj->integer.value;
40d8abf364bcab Rafael J. Wysocki   2022-03-22  703  		if (num_ent <= 1) {
40d8abf364bcab Rafael J. Wysocki   2022-03-22  704  			pr_debug("Unexpected _CPC NumEntries value (%d) for CPU:%d\n",
40d8abf364bcab Rafael J. Wysocki   2022-03-22  705  				 num_ent, pr->id);
40d8abf364bcab Rafael J. Wysocki   2022-03-22  706  			goto out_free;
40d8abf364bcab Rafael J. Wysocki   2022-03-22  707  		}
337aadff8e4567 Ashwin Chaugule     2015-10-02  708  	} else {
f21a3509842294 Rafael J. Wysocki   2022-03-22  709  		pr_debug("Unexpected _CPC NumEntries entry type (%d) for CPU:%d\n",
f21a3509842294 Rafael J. Wysocki   2022-03-22  710  			 cpc_obj->type, pr->id);
337aadff8e4567 Ashwin Chaugule     2015-10-02  711  		goto out_free;
337aadff8e4567 Ashwin Chaugule     2015-10-02  712  	}
5bbb86aa4b8d84 Ashwin Chaugule     2016-08-16  713  
337aadff8e4567 Ashwin Chaugule     2015-10-02  714  	/* Second entry should be revision. */
337aadff8e4567 Ashwin Chaugule     2015-10-02  715  	cpc_obj = &out_obj->package.elements[1];
337aadff8e4567 Ashwin Chaugule     2015-10-02  716  	if (cpc_obj->type == ACPI_TYPE_INTEGER)	{
337aadff8e4567 Ashwin Chaugule     2015-10-02  717  		cpc_rev = cpc_obj->integer.value;
337aadff8e4567 Ashwin Chaugule     2015-10-02  718  	} else {
f21a3509842294 Rafael J. Wysocki   2022-03-22  719  		pr_debug("Unexpected _CPC Revision entry type (%d) for CPU:%d\n",
f21a3509842294 Rafael J. Wysocki   2022-03-22  720  			 cpc_obj->type, pr->id);
337aadff8e4567 Ashwin Chaugule     2015-10-02  721  		goto out_free;
337aadff8e4567 Ashwin Chaugule     2015-10-02  722  	}
337aadff8e4567 Ashwin Chaugule     2015-10-02  723  
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  724  	if (cpc_rev < CPPC_V2_REV) {
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  725  		pr_debug("Unsupported _CPC Revision (%d) for CPU:%d\n", cpc_rev,
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  726  			 pr->id);
337aadff8e4567 Ashwin Chaugule     2015-10-02  727  		goto out_free;
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  728  	}
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  729  
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  730  	/*
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  731  	 * Disregard _CPC if the number of entries in the return pachage is not
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  732  	 * as expected, but support future revisions being proper supersets of
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  733  	 * the v3 and only causing more entries to be returned by _CPC.
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  734  	 */
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  735  	if ((cpc_rev == CPPC_V2_REV && num_ent != CPPC_V2_NUM_ENT) ||
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  736  	    (cpc_rev == CPPC_V3_REV && num_ent != CPPC_V3_NUM_ENT) ||
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  737  	    (cpc_rev > CPPC_V3_REV && num_ent <= CPPC_V3_NUM_ENT)) {
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  738  		pr_debug("Unexpected number of _CPC return package entries (%d) for CPU:%d\n",
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  739  			 num_ent, pr->id);
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  740  		goto out_free;
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  741  	}
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  742  	if (cpc_rev > CPPC_V3_REV) {
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  743  		num_ent = CPPC_V3_NUM_ENT;
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  744  		cpc_rev = CPPC_V3_REV;
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  745  	}
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  746  
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  747  	cpc_ptr->num_entries = num_ent;
4f4179fcf42087 Rafael J. Wysocki   2022-07-21  748  	cpc_ptr->version = cpc_rev;
337aadff8e4567 Ashwin Chaugule     2015-10-02  749  
337aadff8e4567 Ashwin Chaugule     2015-10-02  750  	/* Iterate through remaining entries in _CPC */
337aadff8e4567 Ashwin Chaugule     2015-10-02  751  	for (i = 2; i < num_ent; i++) {
337aadff8e4567 Ashwin Chaugule     2015-10-02  752  		cpc_obj = &out_obj->package.elements[i];
337aadff8e4567 Ashwin Chaugule     2015-10-02  753  
337aadff8e4567 Ashwin Chaugule     2015-10-02  754  		if (cpc_obj->type == ACPI_TYPE_INTEGER)	{
337aadff8e4567 Ashwin Chaugule     2015-10-02  755  			cpc_ptr->cpc_regs[i-2].type = ACPI_TYPE_INTEGER;
337aadff8e4567 Ashwin Chaugule     2015-10-02  756  			cpc_ptr->cpc_regs[i-2].cpc_entry.int_value = cpc_obj->integer.value;
337aadff8e4567 Ashwin Chaugule     2015-10-02  757  		} else if (cpc_obj->type == ACPI_TYPE_BUFFER) {
337aadff8e4567 Ashwin Chaugule     2015-10-02  758  			gas_t = (struct cpc_reg *)
337aadff8e4567 Ashwin Chaugule     2015-10-02  759  				cpc_obj->buffer.pointer;
337aadff8e4567 Ashwin Chaugule     2015-10-02  760  
337aadff8e4567 Ashwin Chaugule     2015-10-02  761  			/*
337aadff8e4567 Ashwin Chaugule     2015-10-02  762  			 * The PCC Subspace index is encoded inside
337aadff8e4567 Ashwin Chaugule     2015-10-02  763  			 * the CPC table entries. The same PCC index
337aadff8e4567 Ashwin Chaugule     2015-10-02  764  			 * will be used for all the PCC entries,
337aadff8e4567 Ashwin Chaugule     2015-10-02  765  			 * so extract it only once.
337aadff8e4567 Ashwin Chaugule     2015-10-02  766  			 */
337aadff8e4567 Ashwin Chaugule     2015-10-02  767  			if (gas_t->space_id == ACPI_ADR_SPACE_PLATFORM_COMM) {
85b1407bf6d2f4 George Cherian      2017-10-11  768  				if (pcc_subspace_id < 0) {
85b1407bf6d2f4 George Cherian      2017-10-11  769  					pcc_subspace_id = gas_t->access_width;
85b1407bf6d2f4 George Cherian      2017-10-11  770  					if (pcc_data_alloc(pcc_subspace_id))
85b1407bf6d2f4 George Cherian      2017-10-11  771  						goto out_free;
85b1407bf6d2f4 George Cherian      2017-10-11  772  				} else if (pcc_subspace_id != gas_t->access_width) {
f21a3509842294 Rafael J. Wysocki   2022-03-22  773  					pr_debug("Mismatched PCC ids in _CPC for CPU:%d\n",
f21a3509842294 Rafael J. Wysocki   2022-03-22  774  						 pr->id);
337aadff8e4567 Ashwin Chaugule     2015-10-02  775  					goto out_free;
337aadff8e4567 Ashwin Chaugule     2015-10-02  776  				}
5bbb86aa4b8d84 Ashwin Chaugule     2016-08-16  777  			} else if (gas_t->space_id == ACPI_ADR_SPACE_SYSTEM_MEMORY) {
5bbb86aa4b8d84 Ashwin Chaugule     2016-08-16  778  				if (gas_t->address) {
5bbb86aa4b8d84 Ashwin Chaugule     2016-08-16  779  					void __iomem *addr;
5bbb86aa4b8d84 Ashwin Chaugule     2016-08-16  780  
0651ab90e4ade1 Pierre Gondois      2022-05-18  781  					if (!osc_cpc_flexible_adr_space_confirmed) {
0651ab90e4ade1 Pierre Gondois      2022-05-18  782  						pr_debug("Flexible address space capability not supported\n");
09073396ea62d0 Mario Limonciello   2022-07-15  783  						if (!cpc_supported_by_cpu())
0651ab90e4ade1 Pierre Gondois      2022-05-18  784  							goto out_free;
0651ab90e4ade1 Pierre Gondois      2022-05-18  785  					}
0651ab90e4ade1 Pierre Gondois      2022-05-18  786  
5bbb86aa4b8d84 Ashwin Chaugule     2016-08-16  787  					addr = ioremap(gas_t->address, gas_t->bit_width/8);
5bbb86aa4b8d84 Ashwin Chaugule     2016-08-16  788  					if (!addr)
5bbb86aa4b8d84 Ashwin Chaugule     2016-08-16  789  						goto out_free;
5bbb86aa4b8d84 Ashwin Chaugule     2016-08-16  790  					cpc_ptr->cpc_regs[i-2].sys_mem_vaddr = addr;
5bbb86aa4b8d84 Ashwin Chaugule     2016-08-16  791  				}
a2c8f92bea5f8f Steven Noonan       2021-12-24  792  			} else if (gas_t->space_id == ACPI_ADR_SPACE_SYSTEM_IO) {
a2c8f92bea5f8f Steven Noonan       2021-12-24  793  				if (gas_t->access_width < 1 || gas_t->access_width > 3) {
a2c8f92bea5f8f Steven Noonan       2021-12-24  794  					/*
a2c8f92bea5f8f Steven Noonan       2021-12-24  795  					 * 1 = 8-bit, 2 = 16-bit, and 3 = 32-bit.
a2c8f92bea5f8f Steven Noonan       2021-12-24  796  					 * SystemIO doesn't implement 64-bit
a2c8f92bea5f8f Steven Noonan       2021-12-24  797  					 * registers.
a2c8f92bea5f8f Steven Noonan       2021-12-24  798  					 */
f21a3509842294 Rafael J. Wysocki   2022-03-22  799  					pr_debug("Invalid access width %d for SystemIO register in _CPC\n",
a2c8f92bea5f8f Steven Noonan       2021-12-24  800  						 gas_t->access_width);
a2c8f92bea5f8f Steven Noonan       2021-12-24  801  					goto out_free;
a2c8f92bea5f8f Steven Noonan       2021-12-24  802  				}
a2c8f92bea5f8f Steven Noonan       2021-12-24  803  				if (gas_t->address & OVER_16BTS_MASK) {
a2c8f92bea5f8f Steven Noonan       2021-12-24  804  					/* SystemIO registers use 16-bit integer addresses */
f21a3509842294 Rafael J. Wysocki   2022-03-22  805  					pr_debug("Invalid IO port %llu for SystemIO register in _CPC\n",
a2c8f92bea5f8f Steven Noonan       2021-12-24  806  						 gas_t->address);
a2c8f92bea5f8f Steven Noonan       2021-12-24  807  					goto out_free;
a2c8f92bea5f8f Steven Noonan       2021-12-24  808  				}
0651ab90e4ade1 Pierre Gondois      2022-05-18  809  				if (!osc_cpc_flexible_adr_space_confirmed) {
0651ab90e4ade1 Pierre Gondois      2022-05-18  810  					pr_debug("Flexible address space capability not supported\n");
09073396ea62d0 Mario Limonciello   2022-07-15  811  					if (!cpc_supported_by_cpu())
0651ab90e4ade1 Pierre Gondois      2022-05-18  812  						goto out_free;
0651ab90e4ade1 Pierre Gondois      2022-05-18  813  				}
5bbb86aa4b8d84 Ashwin Chaugule     2016-08-16  814  			} else {
a6cbcdd5ab5f24 Srinivas Pandruvada 2016-09-01  815  				if (gas_t->space_id != ACPI_ADR_SPACE_FIXED_HARDWARE || !cpc_ffh_supported()) {
a2c8f92bea5f8f Steven Noonan       2021-12-24  816  					/* Support only PCC, SystemMemory, SystemIO, and FFH type regs. */
f21a3509842294 Rafael J. Wysocki   2022-03-22  817  					pr_debug("Unsupported register type (%d) in _CPC\n",
f21a3509842294 Rafael J. Wysocki   2022-03-22  818  						 gas_t->space_id);
337aadff8e4567 Ashwin Chaugule     2015-10-02  819  					goto out_free;
337aadff8e4567 Ashwin Chaugule     2015-10-02  820  				}
a6cbcdd5ab5f24 Srinivas Pandruvada 2016-09-01  821  			}
337aadff8e4567 Ashwin Chaugule     2015-10-02  822  
337aadff8e4567 Ashwin Chaugule     2015-10-02  823  			cpc_ptr->cpc_regs[i-2].type = ACPI_TYPE_BUFFER;
337aadff8e4567 Ashwin Chaugule     2015-10-02  824  			memcpy(&cpc_ptr->cpc_regs[i-2].cpc_entry.reg, gas_t, sizeof(*gas_t));
337aadff8e4567 Ashwin Chaugule     2015-10-02  825  		} else {
f21a3509842294 Rafael J. Wysocki   2022-03-22  826  			pr_debug("Invalid entry type (%d) in _CPC for CPU:%d\n",
f21a3509842294 Rafael J. Wysocki   2022-03-22  827  				 i, pr->id);
337aadff8e4567 Ashwin Chaugule     2015-10-02  828  			goto out_free;
337aadff8e4567 Ashwin Chaugule     2015-10-02  829  		}
337aadff8e4567 Ashwin Chaugule     2015-10-02  830  	}
85b1407bf6d2f4 George Cherian      2017-10-11  831  	per_cpu(cpu_pcc_subspace_idx, pr->id) = pcc_subspace_id;
4773e77cdc9b3a Prashanth Prakash   2018-04-04  832  
4773e77cdc9b3a Prashanth Prakash   2018-04-04  833  	/*
4773e77cdc9b3a Prashanth Prakash   2018-04-04  834  	 * Initialize the remaining cpc_regs as unsupported.
4773e77cdc9b3a Prashanth Prakash   2018-04-04  835  	 * Example: In case FW exposes CPPC v2, the below loop will initialize
4773e77cdc9b3a Prashanth Prakash   2018-04-04  836  	 * LOWEST_FREQ and NOMINAL_FREQ regs as unsupported
4773e77cdc9b3a Prashanth Prakash   2018-04-04  837  	 */
4773e77cdc9b3a Prashanth Prakash   2018-04-04  838  	for (i = num_ent - 2; i < MAX_CPC_REG_ENT; i++) {
4773e77cdc9b3a Prashanth Prakash   2018-04-04  839  		cpc_ptr->cpc_regs[i].type = ACPI_TYPE_INTEGER;
4773e77cdc9b3a Prashanth Prakash   2018-04-04  840  		cpc_ptr->cpc_regs[i].cpc_entry.int_value = 0;
4773e77cdc9b3a Prashanth Prakash   2018-04-04  841  	}
4773e77cdc9b3a Prashanth Prakash   2018-04-04  842  
4773e77cdc9b3a Prashanth Prakash   2018-04-04  843  
337aadff8e4567 Ashwin Chaugule     2015-10-02  844  	/* Store CPU Logical ID */
337aadff8e4567 Ashwin Chaugule     2015-10-02  845  	cpc_ptr->cpu_id = pr->id;
337aadff8e4567 Ashwin Chaugule     2015-10-02  846  
337aadff8e4567 Ashwin Chaugule     2015-10-02  847  	/* Parse PSD data for this CPU */
337aadff8e4567 Ashwin Chaugule     2015-10-02  848  	ret = acpi_get_psd(cpc_ptr, handle);
337aadff8e4567 Ashwin Chaugule     2015-10-02  849  	if (ret)
337aadff8e4567 Ashwin Chaugule     2015-10-02  850  		goto out_free;
337aadff8e4567 Ashwin Chaugule     2015-10-02  851  
603fadf33604a2 Bjorn Helgaas       2019-03-25  852  	/* Register PCC channel once for all PCC subspace ID. */
85b1407bf6d2f4 George Cherian      2017-10-11  853  	if (pcc_subspace_id >= 0 && !pcc_data[pcc_subspace_id]->pcc_channel_acquired) {
85b1407bf6d2f4 George Cherian      2017-10-11  854  		ret = register_pcc_channel(pcc_subspace_id);
337aadff8e4567 Ashwin Chaugule     2015-10-02  855  		if (ret)
337aadff8e4567 Ashwin Chaugule     2015-10-02  856  			goto out_free;
8482ef8c6e684a Prakash, Prashanth  2016-08-16  857  
85b1407bf6d2f4 George Cherian      2017-10-11  858  		init_rwsem(&pcc_data[pcc_subspace_id]->pcc_lock);
85b1407bf6d2f4 George Cherian      2017-10-11  859  		init_waitqueue_head(&pcc_data[pcc_subspace_id]->pcc_write_wait_q);
337aadff8e4567 Ashwin Chaugule     2015-10-02  860  	}
337aadff8e4567 Ashwin Chaugule     2015-10-02  861  
337aadff8e4567 Ashwin Chaugule     2015-10-02  862  	/* Everything looks okay */
337aadff8e4567 Ashwin Chaugule     2015-10-02  863  	pr_debug("Parsed CPC struct for CPU: %d\n", pr->id);
337aadff8e4567 Ashwin Chaugule     2015-10-02  864  
158c998ea44ba3 Ashwin Chaugule     2016-08-16  865  	/* Add per logical CPU nodes for reading its feedback counters. */
158c998ea44ba3 Ashwin Chaugule     2016-08-16  866  	cpu_dev = get_cpu_device(pr->id);
501634759d55a5 Dan Carpenter       2016-11-30  867  	if (!cpu_dev) {
501634759d55a5 Dan Carpenter       2016-11-30  868  		ret = -EINVAL;
158c998ea44ba3 Ashwin Chaugule     2016-08-16  869  		goto out_free;
501634759d55a5 Dan Carpenter       2016-11-30  870  	}
158c998ea44ba3 Ashwin Chaugule     2016-08-16  871  
603fadf33604a2 Bjorn Helgaas       2019-03-25  872  	/* Plug PSD data into this CPU's CPC descriptor. */
28076483afac9d Rafael J. Wysocki   2016-12-10  873  	per_cpu(cpc_desc_ptr, pr->id) = cpc_ptr;
28076483afac9d Rafael J. Wysocki   2016-12-10  874  
158c998ea44ba3 Ashwin Chaugule     2016-08-16  875  	ret = kobject_init_and_add(&cpc_ptr->kobj, &cppc_ktype, &cpu_dev->kobj,
158c998ea44ba3 Ashwin Chaugule     2016-08-16  876  			"acpi_cppc");
28076483afac9d Rafael J. Wysocki   2016-12-10  877  	if (ret) {
28076483afac9d Rafael J. Wysocki   2016-12-10  878  		per_cpu(cpc_desc_ptr, pr->id) = NULL;
4d8be4bc94f74b Qiushi Wu           2020-05-27 @879  		kobject_put(&cpc_ptr->kobj);
158c998ea44ba3 Ashwin Chaugule     2016-08-16  880  		goto out_free;
28076483afac9d Rafael J. Wysocki   2016-12-10  881  	}
158c998ea44ba3 Ashwin Chaugule     2016-08-16  882  
1132e6de11cfc3 Ionela Voinescu     2022-03-10  883  	arch_init_invariance_cppc();
41ea667227bad5 Nathan Fontenot     2020-11-12  884  
337aadff8e4567 Ashwin Chaugule     2015-10-02  885  	kfree(output.pointer);
337aadff8e4567 Ashwin Chaugule     2015-10-02  886  	return 0;
337aadff8e4567 Ashwin Chaugule     2015-10-02  887  
337aadff8e4567 Ashwin Chaugule     2015-10-02  888  out_free:
5bbb86aa4b8d84 Ashwin Chaugule     2016-08-16  889  	/* Free all the mapped sys mem areas for this CPU */
5bbb86aa4b8d84 Ashwin Chaugule     2016-08-16  890  	for (i = 2; i < cpc_ptr->num_entries; i++) {
5bbb86aa4b8d84 Ashwin Chaugule     2016-08-16  891  		void __iomem *addr = cpc_ptr->cpc_regs[i-2].sys_mem_vaddr;
5bbb86aa4b8d84 Ashwin Chaugule     2016-08-16  892  
5bbb86aa4b8d84 Ashwin Chaugule     2016-08-16  893  		if (addr)
5bbb86aa4b8d84 Ashwin Chaugule     2016-08-16  894  			iounmap(addr);
5bbb86aa4b8d84 Ashwin Chaugule     2016-08-16  895  	}
337aadff8e4567 Ashwin Chaugule     2015-10-02  896  	kfree(cpc_ptr);
337aadff8e4567 Ashwin Chaugule     2015-10-02  897  
337aadff8e4567 Ashwin Chaugule     2015-10-02  898  out_buf_free:
337aadff8e4567 Ashwin Chaugule     2015-10-02  899  	kfree(output.pointer);
337aadff8e4567 Ashwin Chaugule     2015-10-02  900  	return ret;
337aadff8e4567 Ashwin Chaugule     2015-10-02  901  }
337aadff8e4567 Ashwin Chaugule     2015-10-02  902  EXPORT_SYMBOL_GPL(acpi_cppc_processor_probe);
337aadff8e4567 Ashwin Chaugule     2015-10-02  903  

:::::: The code at line 879 was first introduced by commit
:::::: 4d8be4bc94f74bb7d096e1c2e44457b530d5a170 ACPI: CPPC: Fix reference count leak in acpi_cppc_processor_probe()

:::::: TO: Qiushi Wu <wu000273@umn.edu>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
