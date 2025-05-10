Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EE61DED66
	for <oe-kbuild@lists.linux.dev>; Sat, 10 May 2025 23:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746920679; cv=none; b=AnO9UPa60nL/Uf168HxXsc/qwv24pM5S2UZ+DBqXtiCFrsVKASFS0DM4xJIQ/alnJy1SPAUfyGSMtF7eB4mqs0T+0iWRKBg6jHKlR21uppjLf/iozUuQ/sZsudcs4bELazFVGDv6/hKKfdxUE489uNgUcqQiDzWh+Yl9pnqQMI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746920679; c=relaxed/simple;
	bh=Ys8eHZ4vXTFqdvvtiTuwhqNjQOWZ0cprRCuMbnk6yJI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PRoTmHHglfqf2yv4I/BFXUHXnh0Q76DKRDP+GSfc1NGrW6gDbIroLFzaas1Dn9IHWweviA/xZbXb1lSOHODx1z/UmX1AImSWYHMOdouG8ZfE78ClSKDt3ZHErGrSimWWn8CUTWyXanNuCoEsTYRyKxFtaetBwsKngncL/xBHnj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lhkYnHF6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lhkYnHF6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746920677; x=1778456677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ys8eHZ4vXTFqdvvtiTuwhqNjQOWZ0cprRCuMbnk6yJI=;
  b=lhkYnHF6nELxLGS8if4gwQmMIH7fLVZz7eEa4Vt097rbEuDLL5hrrhLR
   t5fblxvZjASqR/kM1PgtMf/mIeHfW9tf+95TeAExxSftsub/82euboAnB
   b0zz4h3sdCFku6JSalFCCddOuID5UyrNV2KD8aw5rC/LaU1aFsKrvSJ7Y
   QD4N2RbwEepWvcTJKM00/aUStAV+d1lZSF3FfG+1Upg2NDuUB1Rm0qSOQ
   mb7MlJ9H80L4BjfXdcqGrP3fPfewWjSM4M9PVs0/y7M1S3K69U5/3MGZU
   ixyx94Sv36ul82ZFx6PG6xAFnDRDpX6zQ8DA5Ing+40EgCNAW0r0UFv3x
   A==;
X-CSE-ConnectionGUID: fxoZBSMJQ4+TwLLUo33CLQ==
X-CSE-MsgGUID: z4VEsz2jTy6gEo5R+6luOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="71247512"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="71247512"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 16:44:36 -0700
X-CSE-ConnectionGUID: zoATJlouT+CcLIzgqZcFIA==
X-CSE-MsgGUID: XAFqRw2BS0a0SeOUzm84hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="160255248"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 May 2025 16:44:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDtrs-000DTg-2A;
	Sat, 10 May 2025 23:44:32 +0000
Date: Sun, 11 May 2025 07:43:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rafael-pm:bleeding-edge 135/136] drivers/acpi/apei/einj-core.c:769
 einj_probe() warn: missing unwind goto?
Message-ID: <202505110745.UJtyemor-lkp@intel.com>
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
CC: linux-acpi@vger.kernel.org
CC: devel@acpica.org
CC: linux-pm@vger.kernel.org
TO: Zaid Alali <zaidal@os.amperecomputing.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Ira Weiny <ira.weiny@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   9148437b5790361af63c5ffb89112c380fda2472
commit: e54b1dc1c4f083cb66a70d8ccc866de47fc36d7a [135/136] ACPI: APEI: EINJ: Remove redundant calls to einj_get_available_error_type()
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: x86_64-randconfig-161-20250510 (https://download.01.org/0day-ci/archive/20250511/202505110745.UJtyemor-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505110745.UJtyemor-lkp@intel.com/

smatch warnings:
drivers/acpi/apei/einj-core.c:769 einj_probe() warn: missing unwind goto?

vim +769 drivers/acpi/apei/einj-core.c

e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  743  
6cb9441bfe8dd7f drivers/acpi/apei/einj-core.c Sudeep Holla       2025-03-17  744  static int __init einj_probe(struct faux_device *fdev)
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  745  {
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  746  	int rc;
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  747  	acpi_status status;
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  748  	struct apei_exec_context ctx;
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  749  
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  750  	status = acpi_get_table(ACPI_SIG_EINJ, 0,
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  751  				(struct acpi_table_header **)&einj_tab);
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  752  	if (status == AE_NOT_FOUND) {
5621fafaac0031e drivers/acpi/apei/einj.c      Ben Cheatham       2024-03-11  753  		pr_debug("EINJ table not found.\n");
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  754  		return -ENODEV;
37ea9693869627d drivers/acpi/apei/einj.c      Jay Lu             2022-12-06  755  	} else if (ACPI_FAILURE(status)) {
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  756  		pr_err("Failed to get EINJ table: %s\n",
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  757  				acpi_format_exception(status));
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  758  		return -EINVAL;
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  759  	}
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  760  
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  761  	rc = einj_check_table(einj_tab);
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  762  	if (rc) {
d222678426faa5b drivers/acpi/apei/einj.c      Colin Ian King     2017-01-17  763  		pr_warn(FW_BUG "Invalid EINJ table.\n");
541156a38fd01d9 drivers/acpi/apei/einj.c      Hanjun Guo         2020-05-07  764  		goto err_put_table;
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  765  	}
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  766  
e54b1dc1c4f083c drivers/acpi/apei/einj-core.c Zaid Alali         2025-05-06  767  	rc = einj_get_available_error_type(&available_error_type);
e54b1dc1c4f083c drivers/acpi/apei/einj-core.c Zaid Alali         2025-05-06  768  	if (rc)
e54b1dc1c4f083c drivers/acpi/apei/einj-core.c Zaid Alali         2025-05-06 @769  		return rc;
e54b1dc1c4f083c drivers/acpi/apei/einj-core.c Zaid Alali         2025-05-06  770  
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  771  	rc = -ENOMEM;
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  772  	einj_debug_dir = debugfs_create_dir("einj", apei_get_debugfs_dir());
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  773  
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  774  	debugfs_create_file("available_error_type", S_IRUSR, einj_debug_dir,
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  775  			    NULL, &available_error_type_fops);
dcaed592b2fc9ca drivers/acpi/apei/einj.c      Rafael J. Wysocki  2019-03-04  776  	debugfs_create_file_unsafe("error_type", 0600, einj_debug_dir,
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  777  				   NULL, &error_type_fops);
dcaed592b2fc9ca drivers/acpi/apei/einj.c      Rafael J. Wysocki  2019-03-04  778  	debugfs_create_file_unsafe("error_inject", 0200, einj_debug_dir,
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  779  				   NULL, &error_inject_fops);
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  780  
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  781  	apei_resources_init(&einj_resources);
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  782  	einj_exec_ctx_init(&ctx);
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  783  	rc = apei_exec_collect_resources(&ctx, &einj_resources);
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  784  	if (rc) {
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  785  		pr_err("Error collecting EINJ resources.\n");
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  786  		goto err_fini;
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  787  	}
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  788  
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  789  	rc = apei_resources_request(&einj_resources, "APEI EINJ");
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  790  	if (rc) {
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  791  		pr_err("Error requesting memory/port resources.\n");
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  792  		goto err_fini;
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  793  	}
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  794  
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  795  	rc = apei_exec_pre_map_gars(&ctx);
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  796  	if (rc) {
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  797  		pr_err("Error pre-mapping GARs.\n");
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  798  		goto err_release;
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  799  	}
c130bd6f82e5dda drivers/acpi/apei/einj.c      Tony Luck          2012-01-17  800  
c130bd6f82e5dda drivers/acpi/apei/einj.c      Tony Luck          2012-01-17  801  	einj_param = einj_get_parameter_address();
c130bd6f82e5dda drivers/acpi/apei/einj.c      Tony Luck          2012-01-17  802  	if ((param_extension || acpi5) && einj_param) {
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  803  		debugfs_create_x32("flags", S_IRUSR | S_IWUSR, einj_debug_dir,
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  804  				   &error_flags);
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  805  		debugfs_create_x64("param1", S_IRUSR | S_IWUSR, einj_debug_dir,
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  806  				   &error_param1);
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  807  		debugfs_create_x64("param2", S_IRUSR | S_IWUSR, einj_debug_dir,
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  808  				   &error_param2);
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  809  		debugfs_create_x64("param3", S_IRUSR | S_IWUSR, einj_debug_dir,
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  810  				   &error_param3);
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  811  		debugfs_create_x64("param4", S_IRUSR | S_IWUSR, einj_debug_dir,
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  812  				   &error_param4);
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  813  		debugfs_create_x32("notrigger", S_IRUSR | S_IWUSR,
ee49089dc7d9fc7 drivers/acpi/apei/einj.c      Chen Gong          2012-03-15  814  				   einj_debug_dir, &notrigger);
c130bd6f82e5dda drivers/acpi/apei/einj.c      Tony Luck          2012-01-17  815  	}
c130bd6f82e5dda drivers/acpi/apei/einj.c      Tony Luck          2012-01-17  816  
c130bd6f82e5dda drivers/acpi/apei/einj.c      Tony Luck          2012-01-17  817  	if (vendor_dev[0]) {
c130bd6f82e5dda drivers/acpi/apei/einj.c      Tony Luck          2012-01-17  818  		vendor_blob.data = vendor_dev;
c130bd6f82e5dda drivers/acpi/apei/einj.c      Tony Luck          2012-01-17  819  		vendor_blob.size = strlen(vendor_dev);
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  820  		debugfs_create_blob("vendor", S_IRUSR, einj_debug_dir,
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  821  				    &vendor_blob);
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  822  		debugfs_create_x32("vendor_flags", S_IRUSR | S_IWUSR,
c130bd6f82e5dda drivers/acpi/apei/einj.c      Tony Luck          2012-01-17  823  				   einj_debug_dir, &vendor_flags);
6e320ec1d98f9eb drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  824  	}
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  825  
22fca621bd1bbc5 drivers/acpi/apei/einj.c      Avadhut Naik       2023-11-16  826  	if (vendor_errors.size)
22fca621bd1bbc5 drivers/acpi/apei/einj.c      Avadhut Naik       2023-11-16  827  		debugfs_create_blob("oem_error", 0600, einj_debug_dir,
22fca621bd1bbc5 drivers/acpi/apei/einj.c      Avadhut Naik       2023-11-16  828  				    &vendor_errors);
22fca621bd1bbc5 drivers/acpi/apei/einj.c      Avadhut Naik       2023-11-16  829  
b2f740baa421525 drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  830  	pr_info("Error INJection is initialized.\n");
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  831  
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  832  	return 0;
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  833  
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  834  err_release:
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  835  	apei_resources_release(&einj_resources);
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  836  err_fini:
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  837  	apei_resources_fini(&einj_resources);
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  838  	debugfs_remove_recursive(einj_debug_dir);
541156a38fd01d9 drivers/acpi/apei/einj.c      Hanjun Guo         2020-05-07  839  err_put_table:
541156a38fd01d9 drivers/acpi/apei/einj.c      Hanjun Guo         2020-05-07  840  	acpi_put_table((struct acpi_table_header *)einj_tab);
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  841  
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  842  	return rc;
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  843  }
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  844  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
