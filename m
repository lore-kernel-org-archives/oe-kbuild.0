Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588131CAA4
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Jun 2025 07:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750748567; cv=none; b=SfjIMB5VKwGCH4sXZ6jwLCdEjcMq/6OFGqrJrvRmPeuVYZLLwzhz8N/L8pXMdITZpDslj6Ve+aIUwSvF7WTTzeDlA3A9UOUKxdh6frej1hEK/Y/FvV/TrDcDWjNey2WUfgfYiNcrcjnJeYcCevA7sDv6VE2Cbh2YkX1N12sTxzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750748567; c=relaxed/simple;
	bh=XdCTBakorPNRibioJHXUCqewsx2b7AmNQIKX3bZH6wE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EitfauKrGzMpCQgc5PjRtSxTaziwcD3FELFeElQ5bfJGsCfGPfhtbdx91liC0rAIlNBm1GhNmlPWMZQ9ZwehmkROfhfww4UGKzdQqQC8QJFI5PGiXyFBsaTrAntS/aXjpHZxqTohIpNTn1UfUfXm3MqXZLs/bHLr98bVdPCw1kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lu+HLPr4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lu+HLPr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750748565; x=1782284565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XdCTBakorPNRibioJHXUCqewsx2b7AmNQIKX3bZH6wE=;
  b=Lu+HLPr4FdXRkAZ3+Etbw1d914kPPUMzjArw5wMzD8u9MJpcKI1qytzk
   WYFEYau8TkBu4/vRaLG7BqQOeLlzsLbl3wnYKRMnO+W4UcsDfdA/rXKJB
   5hM8zorsCHjSj76Kv4T4YdlZjt4ume1FPcRcrBXiweuwCHd8CUVtJTMDC
   gi8vyEyToGq3maLieOqbGGSC/Ujy5jOedUktb6MgFrzdNs6LhfAcnNKdn
   cL+viFyFIJvxsgepan7S9a0V5mplSm5IC04kJytKfcE9PTKPKuACHGcrY
   CBA/s1g/1leivB7utVNXutru/N5D0BdJlahbPri6c6omExe1AceLh5/WK
   w==;
X-CSE-ConnectionGUID: KG902kixRfe9Y64DQeYQBA==
X-CSE-MsgGUID: lsQic2UjT52RvPBSgPacDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="70398677"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="70398677"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 00:02:44 -0700
X-CSE-ConnectionGUID: mj5TEs09R8ahYkTPdWEViQ==
X-CSE-MsgGUID: dOT6rllmR+mZYPPSeN+KvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="152534231"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jun 2025 00:02:43 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTxg0-000Rqo-2s;
	Tue, 24 Jun 2025 07:02:40 +0000
Date: Tue, 24 Jun 2025 15:02:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 09/10] drm/xe/xe_late_bind_fw: Extract and print
 version info
Message-ID: <202506241449.WdiucfJp-lkp@intel.com>
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
In-Reply-To: <20250618190007.2932322-10-badal.nilawar@intel.com>
References: <20250618190007.2932322-10-badal.nilawar@intel.com>
TO: Badal Nilawar <badal.nilawar@intel.com>
TO: intel-xe@lists.freedesktop.org
TO: dri-devel@lists.freedesktop.org
TO: linux-kernel@vger.kernel.org
CC: anshuman.gupta@intel.com
CC: rodrigo.vivi@intel.com
CC: alexander.usyskin@intel.com
CC: gregkh@linuxfoundation.org
CC: daniele.ceraolospurio@intel.com
CC: jgg@nvidia.com

Hi Badal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on drm-i915/for-linux-next next-20250623]
[cannot apply to char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus drm-i915/for-linux-next-fixes linus/master v6.16-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Badal-Nilawar/mei-bus-add-mei_cldev_mtu-interface/20250619-025825
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250618190007.2932322-10-badal.nilawar%40intel.com
patch subject: [PATCH v3 09/10] drm/xe/xe_late_bind_fw: Extract and print version info
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20250623 (https://download.01.org/0day-ci/archive/20250624/202506241449.WdiucfJp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506241449.WdiucfJp-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_late_bind_fw.c:90 parse_cpd_header() error: uninitialized symbol 'offset'.
drivers/gpu/drm/xe/xe_late_bind_fw.c:155 parse_lb_layout() error: uninitialized symbol 'offset'.

Old smatch warnings:
drivers/gpu/drm/xe/xe_late_bind_fw.c:195 xe_late_bind_wait_for_worker_completion() warn: inconsistent indenting

vim +/offset +90 drivers/gpu/drm/xe/xe_late_bind_fw.c

6b9a6463429b8ee Badal Nilawar 2025-06-19   47  
f9ea24fb9528adc Badal Nilawar 2025-06-19   48  /* Refer to the "Late Bind based Firmware Layout" documentation entry for details */
f9ea24fb9528adc Badal Nilawar 2025-06-19   49  static int parse_cpd_header(struct xe_late_bind *late_bind, u32 fw_id,
f9ea24fb9528adc Badal Nilawar 2025-06-19   50  			    const void *data, size_t size, const char *manifest_entry)
f9ea24fb9528adc Badal Nilawar 2025-06-19   51  {
f9ea24fb9528adc Badal Nilawar 2025-06-19   52  	struct xe_device *xe = late_bind_to_xe(late_bind);
f9ea24fb9528adc Badal Nilawar 2025-06-19   53  	const struct gsc_cpd_header_v2 *header = data;
f9ea24fb9528adc Badal Nilawar 2025-06-19   54  	const struct gsc_manifest_header *manifest;
f9ea24fb9528adc Badal Nilawar 2025-06-19   55  	const struct gsc_cpd_entry *entry;
f9ea24fb9528adc Badal Nilawar 2025-06-19   56  	size_t min_size = sizeof(*header);
f9ea24fb9528adc Badal Nilawar 2025-06-19   57  	struct xe_late_bind_fw *lb_fw;
f9ea24fb9528adc Badal Nilawar 2025-06-19   58  	u32 offset;
f9ea24fb9528adc Badal Nilawar 2025-06-19   59  	int i;
f9ea24fb9528adc Badal Nilawar 2025-06-19   60  
f9ea24fb9528adc Badal Nilawar 2025-06-19   61  	if (fw_id >= MAX_FW_ID)
f9ea24fb9528adc Badal Nilawar 2025-06-19   62  		return -EINVAL;
f9ea24fb9528adc Badal Nilawar 2025-06-19   63  	lb_fw = &late_bind->late_bind_fw[fw_id];
f9ea24fb9528adc Badal Nilawar 2025-06-19   64  
f9ea24fb9528adc Badal Nilawar 2025-06-19   65  	/* manifest_entry is mandatory */
f9ea24fb9528adc Badal Nilawar 2025-06-19   66  	xe_assert(xe, manifest_entry);
f9ea24fb9528adc Badal Nilawar 2025-06-19   67  
f9ea24fb9528adc Badal Nilawar 2025-06-19   68  	if (size < min_size || header->header_marker != GSC_CPD_HEADER_MARKER)
f9ea24fb9528adc Badal Nilawar 2025-06-19   69  		return -ENOENT;
f9ea24fb9528adc Badal Nilawar 2025-06-19   70  
f9ea24fb9528adc Badal Nilawar 2025-06-19   71  	if (header->header_length < sizeof(struct gsc_cpd_header_v2)) {
f9ea24fb9528adc Badal Nilawar 2025-06-19   72  		drm_err(&xe->drm, "%s late binding fw: Invalid CPD header length %u!\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19   73  			fw_id_to_name[lb_fw->id], header->header_length);
f9ea24fb9528adc Badal Nilawar 2025-06-19   74  		return -EINVAL;
f9ea24fb9528adc Badal Nilawar 2025-06-19   75  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19   76  
f9ea24fb9528adc Badal Nilawar 2025-06-19   77  	min_size = header->header_length + sizeof(struct gsc_cpd_entry) * header->num_of_entries;
f9ea24fb9528adc Badal Nilawar 2025-06-19   78  	if (size < min_size) {
f9ea24fb9528adc Badal Nilawar 2025-06-19   79  		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19   80  			fw_id_to_name[lb_fw->id], size, min_size);
f9ea24fb9528adc Badal Nilawar 2025-06-19   81  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19   82  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19   83  
f9ea24fb9528adc Badal Nilawar 2025-06-19   84  	/* Look for the manifest first */
f9ea24fb9528adc Badal Nilawar 2025-06-19   85  	entry = (void *)header + header->header_length;
f9ea24fb9528adc Badal Nilawar 2025-06-19   86  	for (i = 0; i < header->num_of_entries; i++, entry++)
f9ea24fb9528adc Badal Nilawar 2025-06-19   87  		if (strcmp(entry->name, manifest_entry) == 0)
f9ea24fb9528adc Badal Nilawar 2025-06-19   88  			offset = entry->offset & GSC_CPD_ENTRY_OFFSET_MASK;
f9ea24fb9528adc Badal Nilawar 2025-06-19   89  
f9ea24fb9528adc Badal Nilawar 2025-06-19  @90  	if (!offset) {
f9ea24fb9528adc Badal Nilawar 2025-06-19   91  		drm_err(&xe->drm, "%s late binding fw: Failed to find manifest_entry\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19   92  			fw_id_to_name[lb_fw->id]);
f9ea24fb9528adc Badal Nilawar 2025-06-19   93  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19   94  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19   95  
f9ea24fb9528adc Badal Nilawar 2025-06-19   96  	min_size = offset + sizeof(struct gsc_manifest_header);
f9ea24fb9528adc Badal Nilawar 2025-06-19   97  	if (size < min_size) {
f9ea24fb9528adc Badal Nilawar 2025-06-19   98  		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19   99  			fw_id_to_name[lb_fw->id], size, min_size);
f9ea24fb9528adc Badal Nilawar 2025-06-19  100  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19  101  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19  102  
f9ea24fb9528adc Badal Nilawar 2025-06-19  103  	manifest = data + offset;
f9ea24fb9528adc Badal Nilawar 2025-06-19  104  
f9ea24fb9528adc Badal Nilawar 2025-06-19  105  	lb_fw->version.major = manifest->fw_version.major;
f9ea24fb9528adc Badal Nilawar 2025-06-19  106  	lb_fw->version.minor = manifest->fw_version.minor;
f9ea24fb9528adc Badal Nilawar 2025-06-19  107  	lb_fw->version.hotfix = manifest->fw_version.hotfix;
f9ea24fb9528adc Badal Nilawar 2025-06-19  108  	lb_fw->version.build = manifest->fw_version.build;
f9ea24fb9528adc Badal Nilawar 2025-06-19  109  
f9ea24fb9528adc Badal Nilawar 2025-06-19  110  	return 0;
f9ea24fb9528adc Badal Nilawar 2025-06-19  111  }
f9ea24fb9528adc Badal Nilawar 2025-06-19  112  
f9ea24fb9528adc Badal Nilawar 2025-06-19  113  /* Refer to the "Late Bind based Firmware Layout" documentation entry for details */
f9ea24fb9528adc Badal Nilawar 2025-06-19  114  static int parse_lb_layout(struct xe_late_bind *late_bind, u32 fw_id,
f9ea24fb9528adc Badal Nilawar 2025-06-19  115  			   const void *data, size_t size, const char *fpt_entry)
f9ea24fb9528adc Badal Nilawar 2025-06-19  116  {
f9ea24fb9528adc Badal Nilawar 2025-06-19  117  	struct xe_device *xe = late_bind_to_xe(late_bind);
f9ea24fb9528adc Badal Nilawar 2025-06-19  118  	const struct csc_fpt_header *header = data;
f9ea24fb9528adc Badal Nilawar 2025-06-19  119  	const struct csc_fpt_entry *entry;
f9ea24fb9528adc Badal Nilawar 2025-06-19  120  	size_t min_size = sizeof(*header);
f9ea24fb9528adc Badal Nilawar 2025-06-19  121  	struct xe_late_bind_fw *lb_fw;
f9ea24fb9528adc Badal Nilawar 2025-06-19  122  	u32 offset;
f9ea24fb9528adc Badal Nilawar 2025-06-19  123  	int i;
f9ea24fb9528adc Badal Nilawar 2025-06-19  124  
f9ea24fb9528adc Badal Nilawar 2025-06-19  125  	if (fw_id >= MAX_FW_ID)
f9ea24fb9528adc Badal Nilawar 2025-06-19  126  		return -EINVAL;
f9ea24fb9528adc Badal Nilawar 2025-06-19  127  
f9ea24fb9528adc Badal Nilawar 2025-06-19  128  	lb_fw = &late_bind->late_bind_fw[fw_id];
f9ea24fb9528adc Badal Nilawar 2025-06-19  129  
f9ea24fb9528adc Badal Nilawar 2025-06-19  130  	/* fpt_entry is mandatory */
f9ea24fb9528adc Badal Nilawar 2025-06-19  131  	xe_assert(xe, fpt_entry);
f9ea24fb9528adc Badal Nilawar 2025-06-19  132  
f9ea24fb9528adc Badal Nilawar 2025-06-19  133  	if (size < min_size || header->header_marker != CSC_FPT_HEADER_MARKER)
f9ea24fb9528adc Badal Nilawar 2025-06-19  134  		return -ENOENT;
f9ea24fb9528adc Badal Nilawar 2025-06-19  135  
f9ea24fb9528adc Badal Nilawar 2025-06-19  136  	if (header->header_length < sizeof(struct csc_fpt_header)) {
f9ea24fb9528adc Badal Nilawar 2025-06-19  137  		drm_err(&xe->drm, "%s late binding fw: Invalid FPT header length %u!\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19  138  			fw_id_to_name[lb_fw->id], header->header_length);
f9ea24fb9528adc Badal Nilawar 2025-06-19  139  		return -EINVAL;
f9ea24fb9528adc Badal Nilawar 2025-06-19  140  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19  141  
f9ea24fb9528adc Badal Nilawar 2025-06-19  142  	min_size = header->header_length + sizeof(struct csc_fpt_entry) * header->num_of_entries;
f9ea24fb9528adc Badal Nilawar 2025-06-19  143  	if (size < min_size) {
f9ea24fb9528adc Badal Nilawar 2025-06-19  144  		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19  145  			fw_id_to_name[lb_fw->id], size, min_size);
f9ea24fb9528adc Badal Nilawar 2025-06-19  146  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19  147  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19  148  
f9ea24fb9528adc Badal Nilawar 2025-06-19  149  	/* Look for the manifest first */
f9ea24fb9528adc Badal Nilawar 2025-06-19  150  	entry = (void *)header + header->header_length;
f9ea24fb9528adc Badal Nilawar 2025-06-19  151  	for (i = 0; i < header->num_of_entries; i++, entry++)
f9ea24fb9528adc Badal Nilawar 2025-06-19  152  		if (strcmp(entry->name, fpt_entry) == 0)
f9ea24fb9528adc Badal Nilawar 2025-06-19  153  			offset = entry->offset;
f9ea24fb9528adc Badal Nilawar 2025-06-19  154  
f9ea24fb9528adc Badal Nilawar 2025-06-19 @155  	if (!offset) {
f9ea24fb9528adc Badal Nilawar 2025-06-19  156  		drm_err(&xe->drm, "%s late binding fw: Failed to find fpt_entry\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19  157  			fw_id_to_name[lb_fw->id]);
f9ea24fb9528adc Badal Nilawar 2025-06-19  158  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19  159  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19  160  
f9ea24fb9528adc Badal Nilawar 2025-06-19  161  	min_size = offset + sizeof(struct gsc_cpd_header_v2);
f9ea24fb9528adc Badal Nilawar 2025-06-19  162  	if (size < min_size) {
f9ea24fb9528adc Badal Nilawar 2025-06-19  163  		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19  164  			fw_id_to_name[lb_fw->id], size, min_size);
f9ea24fb9528adc Badal Nilawar 2025-06-19  165  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19  166  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19  167  
f9ea24fb9528adc Badal Nilawar 2025-06-19  168  	return parse_cpd_header(late_bind, fw_id, data + offset, size - offset, "LTES.man");
f9ea24fb9528adc Badal Nilawar 2025-06-19  169  }
f9ea24fb9528adc Badal Nilawar 2025-06-19  170  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
