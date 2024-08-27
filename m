Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEB41CFEDC
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Aug 2024 19:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724786955; cv=none; b=LsHzmhsdscbMcJAWb2gU/OlRrv5ApWWwzcGWU0ZKFe6itiB/5K76LK+jgqsbSPzCdsa4ew/BxIq5N5T1PuGZrT75MN5rLBrNcoo3Q/c987PYGvRjjCufVyJtMSytL/qOxp7JJvpiHNhVvdu9f2vwxo5TlRsEeX1FfOisZmIceFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724786955; c=relaxed/simple;
	bh=QIw58nSUzhydkpNERDnN+ZaJFIo/L20zl4oTYX1MxG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=skdlwxLS5rU3ySFtSCrljy9N91/BoaATlUT2906xRcIM8CgQnrzDWIS+oWSkwHEhGlhgu9vpgkZ3h+yxDnwQCUJ8a2sCm7OSeeak1d2J/5mQekGtWJVW80t1kApTUnAzcNaW7CXzdo5G/lF0Ls9pJ87cqnVaLJTx9vToQ2NSFCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdKTKbD8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdKTKbD8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724786953; x=1756322953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QIw58nSUzhydkpNERDnN+ZaJFIo/L20zl4oTYX1MxG4=;
  b=gdKTKbD81c8OtsDSrqqqe3LIca1Q01xltd0qMHxGFIibr2AHmYzordKd
   VxeeJ3UMMBQe0nGa3sKVdOIS1HNzawcuDH6+QUWFMiJf631qeS7izbtvv
   63v6sKFmuT8Lw0F8xrPNh8a5uQYnv5B+242fV51Vwuaae2Ahj0FUHzs8U
   6hAVMUpqk6Y+R3S8P+CspN24wf6lXEvn0F6K+Us+cgpbjrM2nLDhamHK0
   7PVhlwfybhe+R7cg/v7eGQ/XO/yy84MDxa7gioyXrUSml6HwAe7AUW1Q+
   OyF3L3mCN4jVbqKFGq80Jv7gijFXVWVr2gu/8/z/yNV3C1UZI5AizdFVM
   g==;
X-CSE-ConnectionGUID: ReBfHCa8Sau3oBzmFoC0pw==
X-CSE-MsgGUID: PwZPVqlgTDCoic20sXfJcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23154668"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="23154668"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 12:29:12 -0700
X-CSE-ConnectionGUID: MmyIcygtQ+moNHQmHDT3IA==
X-CSE-MsgGUID: UbeZgO97TkWDJcGLiCckjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="67669213"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Aug 2024 12:29:11 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj1sL-000K0N-1z;
	Tue, 27 Aug 2024 19:29:09 +0000
Date: Wed, 28 Aug 2024 03:28:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [opencloudos:next 10/14]
 drivers/thirdparty/release-drivers/bnxt/tfc_v3/tfc_global_id.c: tfc.h is
 included more than once.
Message-ID: <202408280334.QApRMuws-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: jasperwang@tencent.com
TO: kaixuxia@tencent.com
TO: frankjpliu@tencent.com
TO: kasong@tencent.com
TO: sagazchen@tencent.com
TO: kernelxing@tencent.com
TO: aurelianliu@tencent.com
TO: deshengwu@tencent.com
TO: flyingpeng@tencent.com
TO: jason.zeng@intel.com
TO: wu.zheng@intel.com
TO: yingbao.jia@intel.com
TO: pei.p.jia@intel.com

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   c99409f7fe0f14dae19af75e7e896e7a17b92946
commit: 3db1e8157ba7d83cb745e12ed27871d83ed045ce [10/14] drivers/thirdparty: put release-drivers in tree
:::::: branch date: 8 hours ago
:::::: commit date: 10 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408280334.QApRMuws-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/thirdparty/release-drivers/bnxt/tfc_v3/tfc_global_id.c: tfc.h is included more than once.
--
>> drivers/thirdparty/release-drivers/bnxt/tf_core/cfa_tcam_mgr_p58.c: cfa_tcam_mgr.h is included more than once.
--
>> drivers/thirdparty/release-drivers/bnxt/bnxt_devlink.c: bnxt_ethtool.h is included more than once.
--
>> drivers/thirdparty/release-drivers/bnxt/tf_ulp/ulp_tc_rte_flow_gen.c: bnxt_ulp_flow.h is included more than once.
--
>> drivers/thirdparty/release-drivers/bnxt/bnxt.c: tfc.h is included more than once.
--
>> drivers/thirdparty/release-drivers/bnxt/tf_ulp/ulp_tc_custom_offload.c: ulp_tc_parser.h is included more than once.
--
>> drivers/thirdparty/release-drivers/bnxt/hcapi/cfa/hcapi_cfa_defs.h: hcapi_cfa_p58.h is included more than once.
>> drivers/thirdparty/release-drivers/bnxt/hcapi/cfa/hcapi_cfa_defs.h: hcapi_cfa_p4.h is included more than once.
--
>> drivers/thirdparty/release-drivers/bnxt/bnxt_auxbus_compat.h: linux/mod_devicetable.h is included more than once.
--
>> drivers/thirdparty/release-drivers/bnxt/tfc_v3/tfc_tcam.c: tfc.h is included more than once.
--
>> drivers/thirdparty/release-drivers/bnxt/tf_core/tf_device_p58.c: tf_identifier.h is included more than once.
>> drivers/thirdparty/release-drivers/bnxt/tf_core/tf_device_p58.c: tf_tbl.h is included more than once.
>> drivers/thirdparty/release-drivers/bnxt/tf_core/tf_device_p58.c: tf_if_tbl.h is included more than once.
>> drivers/thirdparty/release-drivers/bnxt/tf_core/tf_device_p58.c: tf_tcam.h is included more than once.
>> drivers/thirdparty/release-drivers/bnxt/tf_core/tf_device_p58.c: tf_em.h is included more than once.
>> drivers/thirdparty/release-drivers/bnxt/tf_core/tf_device_p58.c: cfa_resource_types.h is included more than once.
>> drivers/thirdparty/release-drivers/bnxt/tf_core/tf_device_p58.c: tf_device.h is included more than once.

vim +7 drivers/thirdparty/release-drivers/bnxt/tfc_v3/tfc_global_id.c

   > 7	#include "tfc.h"
     8	#include "bnxt_compat.h"
     9	#include "bnxt.h"
    10	#include "bnxt_hwrm.h"
  > 11	#include "tfc.h"
    12	#include "tfc_msg.h"
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
