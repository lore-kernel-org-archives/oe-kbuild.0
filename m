Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BCF2E2852
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Sep 2026 03:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790738661; cv=none; b=HdcYsuBv6Iq+LBhPSQiHpwdFKsZ5It5EHYBSdrzS0LdZ1X9Jdsd91OSyzq/DnwWMlUR+rm9MxnRUJLGzkmZ8jzNt4jolWt3Z35BS/Ae5y2CfN64SW3gCronOmuBcc3ckN+rxcD9+MI8tDD8TBTKD7Hk97GL+uHkaBS6e8zI9mGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790738661; c=relaxed/simple;
	bh=MNvfNwCOubJatOK3jyi6kS70FpnFafmo3dVjQldpZ8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OonGTec5NpbpNjd8ba0rrOrVI1JR337MDozVJarLXEoUPODczuzrtRwmHm66Ufs2yt8ZE3inTWOFCVtLWdCb9eRakqaNfyYHlQzWUCOa7wLY72uIBx3jzn2I4Hhcy3yhA4n0oemziF5lutVX0cEJMvL9jTaqLcnfYBflaiTeR+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrYlXGno; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrYlXGno"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790738659; x=1822274659;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MNvfNwCOubJatOK3jyi6kS70FpnFafmo3dVjQldpZ8k=;
  b=jrYlXGnoS+26kdRcc8xq1gLBNILTiTSKZELwUZqgCfnfMTO6hCJVWU3G
   K3Kz8mYIphJ9VI7oAwaRzGVeuXm6uL4liandUeegGn/2IC9Ov2cij/Z62
   BjeolH+lKj27x2H4o1s5InkafzRNx5ZkCLUcb9QUjsBie22uA05bA29An
   1tAYgoppCCy1EVwNzcVQUCzkd7xVIKz5B9q3d91UeTeL2/av2SnTuI1gA
   a26VEO6ZjNtDwA/AAdfTx2BdOBIw6t11+qKUDBwKYVnUqZHDZOSj5kGIt
   vVGjv4FXQkdIjAm9xuVt1JvavpPfyBkta14Curv4fBevWHX7AQa9dByS5
   A==;
X-CSE-ConnectionGUID: 9wDjLtpdQNGYMWXWdH4mSQ==
X-CSE-MsgGUID: F/svtVg/SoGP453oPfzQDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91566907"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="91566907"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 20:24:18 -0700
X-CSE-ConnectionGUID: 68tD+Cy9SgmZUO9f0Q8W5w==
X-CSE-MsgGUID: iHV6FwIsR5uTsiw97OmpeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="274675509"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 29 Sep 2026 20:24:18 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBkvW-000000001iv-1OKs;
	Wed, 30 Sep 2026 03:24:14 +0000
Date: Wed, 30 Sep 2026 05:23:13 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: robust_list.c:56:9: error: redeclaration of enumerator
 'FUTEX_ROBUST_LIST_CMD_CREATE_64'
Message-ID: <202609300504.0bT0J7II-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Andr=C3=A9 Almeida" <andrealmeid@igalia.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/futex-S=
kip-test_futex_robust_unlock-if-not-supported/20260925-145324
head:   0a151b703cae864a3bab66cc7fb5b8dc983658d3
commit: 9de641d609712eb8fe8f8a4b2f246e431c2c6da1 selftests/futex: Expand fo=
r set_robust_list2()
date:   4 days ago
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/=
20260930/202609300504.0bT0J7II-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260930/202609300504.0bT0J7II-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609300504.0bT0J7II-lkp@intel.com/

All errors (new ones prefixed by >>):

>> robust_list.c:56:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIS=
T_CMD_CREATE_64'
      56 |         FUTEX_ROBUST_LIST_CMD_CREATE_64,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from ../include/futextest.h:23,
                    from robust_list.c:27:
   usr/include/linux/futex.h:196:9: note: previous definition of 'FUTEX_ROB=
UST_LIST_CMD_CREATE_64' with type 'enum robust_list2_cmd'
     196 |         FUTEX_ROBUST_LIST_CMD_CREATE_64,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:57:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIS=
T_CMD_CREATE_32'
      57 |         FUTEX_ROBUST_LIST_CMD_CREATE_32,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:197:9: note: previous definition of 'FUTEX_ROB=
UST_LIST_CMD_CREATE_32' with type 'enum robust_list2_cmd'
     197 |         FUTEX_ROBUST_LIST_CMD_CREATE_32,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:58:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIS=
T_CMD_MODIFY_64'
      58 |         FUTEX_ROBUST_LIST_CMD_MODIFY_64,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:198:9: note: previous definition of 'FUTEX_ROB=
UST_LIST_CMD_MODIFY_64' with type 'enum robust_list2_cmd'
     198 |         FUTEX_ROBUST_LIST_CMD_MODIFY_64,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:59:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIS=
T_CMD_MODIFY_32'
      59 |         FUTEX_ROBUST_LIST_CMD_MODIFY_32,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:199:9: note: previous definition of 'FUTEX_ROB=
UST_LIST_CMD_MODIFY_32' with type 'enum robust_list2_cmd'
     199 |         FUTEX_ROBUST_LIST_CMD_MODIFY_32,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:60:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIS=
T_CMD_LIST_LIMIT'
      60 |         FUTEX_ROBUST_LIST_CMD_LIST_LIMIT,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:200:9: note: previous definition of 'FUTEX_ROB=
UST_LIST_CMD_LIST_LIMIT' with type 'enum robust_list2_cmd'
     200 |         FUTEX_ROBUST_LIST_CMD_LIST_LIMIT,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:61:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIS=
T_CMD_USER_MAX'
      61 |         FUTEX_ROBUST_LIST_CMD_USER_MAX,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:201:9: note: previous definition of 'FUTEX_ROB=
UST_LIST_CMD_USER_MAX' with type 'enum robust_list2_cmd'
     201 |         FUTEX_ROBUST_LIST_CMD_USER_MAX,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:66:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIS=
T_SET_NATIVE'
      66 |         FUTEX_ROBUST_LIST_SET_NATIVE =3D 128,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:206:9: note: previous definition of 'FUTEX_ROB=
UST_LIST_SET_NATIVE' with type 'enum robust_list2_cmd'
     206 |         FUTEX_ROBUST_LIST_SET_NATIVE =3D 128,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:67:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIS=
T_SET_COMPAT'
      67 |         FUTEX_ROBUST_LIST_SET_COMPAT,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:207:9: note: previous definition of 'FUTEX_ROB=
UST_LIST_SET_COMPAT' with type 'enum robust_list2_cmd'
     207 |         FUTEX_ROBUST_LIST_SET_COMPAT,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:70:8: error: redefinition of 'struct robust_list32'
      70 | struct robust_list32 {
         |        ^~~~~~~~~~~~~
   usr/include/linux/futex.h:182:8: note: originally defined here
     182 | struct robust_list32 {
         |        ^~~~~~~~~~~~~
>> robust_list.c:74:8: error: redefinition of 'struct robust_list_head32'
      74 | struct robust_list_head32 {
         |        ^~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:186:8: note: originally defined here
     186 | struct robust_list_head32 {
         |        ^~~~~~~~~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
