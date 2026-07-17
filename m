Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A613D3F825E
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jul 2026 11:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286576; cv=none; b=bsvvFIazfdvTsuF0p6i0l/dlak8Jabd/j0bvDQvORw6XZUNwkT5frLRQvT4q0QkaUtmczvont8oW08Shft1La/FeY1vNyO8zQJowvke1SES2TIVhcWSbc5a8i9VS8wNYQCe7d+7uR8DrYTK+HpJGB9wBTKK93NklRa6azNjya4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286576; c=relaxed/simple;
	bh=jQ5ZUL9WhLTH9hL4WfrP9eVKcZvT4gHIKKvIrPgBcJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Pf6fq7MS4of5ZOLduxMYJaeaEzVg3VKzJGlefZt5jX4EWvG1jO8oSUe/usM5gou/9vEAF8hbF/sr30niMUUb2NUxLimkjrHYDJBb0yvV0z4fuhNLM+RACmP4PkP1Iw+QgzKjl33wrcCadjYJ/SYCjJ8h0kk5rRt9C/Li9PCWGeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FFYi4s38; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFYi4s38"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784286570; x=1815822570;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jQ5ZUL9WhLTH9hL4WfrP9eVKcZvT4gHIKKvIrPgBcJM=;
  b=FFYi4s38X7m7vL//vcfsaEcqdzd8iXtzf2wVkSzxYLIQWYgvOLInb2OR
   QNc+TFLoO937vc03STkEsH5iI0L3Mz3A3NZu8dNPGsVwpIbw2Irjj9eDA
   L3QHkbAvOoQqsom17pr00FfWIHoiXK7F/Z15Z7AKEwUndFReleY4JjEfj
   RVqsq9wRiEV/ULwmxAGZ7MXgQveTJUtn98ljr10VHJQpqWGfGwUhAUaz2
   vsIhx9vUJMRgZUcrpp7xvMLJXrZ33LOelWm/El1Xyrdmsyo3TbEQejC1R
   QcMDM4SJXlH6BbJ9RjYUzyoI2B39/VFH5azCbJ9KzjdZmAq6Z7pMgvSzE
   Q==;
X-CSE-ConnectionGUID: TCywmmR4QoiwTqHAHn3xMA==
X-CSE-MsgGUID: 2YlJDYJNRgioB0dLgvru3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="110507564"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="110507564"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 04:09:26 -0700
X-CSE-ConnectionGUID: D5nIb/amTaWPKIbxiCPqzw==
X-CSE-MsgGUID: VMXF4bZfT4C9AAMlmtGHIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="252356265"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jul 2026 04:09:24 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkgRW-00000000SfU-0NEq;
	Fri, 17 Jul 2026 11:09:22 +0000
Date: Fri, 17 Jul 2026 19:09:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/kernel/rtas.c:378:46: sparse: sparse: obsolete
 array initializer, use C99 syntax
Message-ID: <202607171803.hNMum0E7-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: arch/powe=
rpc/kernel/rtas.c:378:46: sparse: sparse: obsolete array initializer, use C=
99 syntax"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Haren Myneni <haren@linux.ibm.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
CC: Mahesh Salgaonkar <mahesh@linux.ibm.com>
CC: Tyrel Datwyler <tyreld@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fce2dfa773ced15f27dd27cd0b482a7473cdcf2a
commit: 26b4fcecea05b8927b17c9ace132914ffcb4d97e powerpc/pseries: Define HV=
PIPE specific macros
date:   10 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 10 months ago
config: powerpc-randconfig-r113-20260717 (https://download.01.org/0day-ci/a=
rchive/20260717/202607171803.hNMum0E7-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd7080=
29e0b2869e80abe31ddb175f7c35361f90)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260717/202607171803.hNMum0E7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 26b4fcecea05 ("powerpc/pseries: Define HVPIPE specific macros")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607171803.hNMum0E7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/kernel/rtas.c:378:46: sparse: sparse: obsolete array initia=
lizer, use C99 syntax
   arch/powerpc/kernel/rtas.c:407:43: sparse: sparse: obsolete array initia=
lizer, use C99 syntax
>> arch/powerpc/kernel/rtas.c:101:1: sparse: sparse: symbol 'rtas_ibm_recei=
ve_hvpipe_msg_lock' was not declared. Should it be static?

vim +378 arch/powerpc/kernel/rtas.c

adf7a019e5f826 Nathan Lynch 2023-12-12  103 =20
8252b88294d2a7 Nathan Lynch 2023-02-10  104  static struct rtas_function rt=
as_function_table[] __ro_after_init =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  105  	[RTAS_FNIDX__CHECK_EXCEPTION]=
 =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  106  		.name =3D "check-exception",
8252b88294d2a7 Nathan Lynch 2023-02-10  107  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  108  	[RTAS_FNIDX__DISPLAY_CHARACTE=
R] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  109  		.name =3D "display-character=
",
8252b88294d2a7 Nathan Lynch 2023-02-10  110  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  111  			.buf_idx1 =3D -1, .size_idx=
1 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  112  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  113  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  114  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  115  	[RTAS_FNIDX__EVENT_SCAN] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  116  		.name =3D "event-scan",
8252b88294d2a7 Nathan Lynch 2023-02-10  117  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  118  	[RTAS_FNIDX__FREEZE_TIME_BASE=
] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  119  		.name =3D "freeze-time-base",
8252b88294d2a7 Nathan Lynch 2023-02-10  120  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  121  	[RTAS_FNIDX__GET_POWER_LEVEL]=
 =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  122  		.name =3D "get-power-level",
8252b88294d2a7 Nathan Lynch 2023-02-10  123  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  124  			.buf_idx1 =3D -1, .size_idx=
1 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  125  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  126  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  127  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  128  	[RTAS_FNIDX__GET_SENSOR_STATE=
] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  129  		.name =3D "get-sensor-state",
8252b88294d2a7 Nathan Lynch 2023-02-10  130  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  131  			.buf_idx1 =3D -1, .size_idx=
1 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  132  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  133  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  134  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  135  	[RTAS_FNIDX__GET_TERM_CHAR] =
=3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  136  		.name =3D "get-term-char",
8252b88294d2a7 Nathan Lynch 2023-02-10  137  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  138  	[RTAS_FNIDX__GET_TIME_OF_DAY]=
 =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  139  		.name =3D "get-time-of-day",
8252b88294d2a7 Nathan Lynch 2023-02-10  140  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  141  			.buf_idx1 =3D -1, .size_idx=
1 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  142  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  143  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  144  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  145  	[RTAS_FNIDX__IBM_ACTIVATE_FIR=
MWARE] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  146  		.name =3D "ibm,activate-firm=
ware",
8252b88294d2a7 Nathan Lynch 2023-02-10  147  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  148  			.buf_idx1 =3D -1, .size_idx=
1 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  149  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  150  		},
adf7a019e5f826 Nathan Lynch 2023-12-12  151  		/*
adf7a019e5f826 Nathan Lynch 2023-12-12  152  		 * PAPR+ as of v2.13 doesn't=
 explicitly impose any
adf7a019e5f826 Nathan Lynch 2023-12-12  153  		 * restriction, but this typ=
ically requires multiple
adf7a019e5f826 Nathan Lynch 2023-12-12  154  		 * calls before success, and=
 there's no reason to
adf7a019e5f826 Nathan Lynch 2023-12-12  155  		 * allow sequences to interl=
eave.
adf7a019e5f826 Nathan Lynch 2023-12-12  156  		 */
adf7a019e5f826 Nathan Lynch 2023-12-12  157  		.lock =3D &rtas_ibm_activate=
_firmware_lock,
8252b88294d2a7 Nathan Lynch 2023-02-10  158  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  159  	[RTAS_FNIDX__IBM_CBE_START_PT=
CAL] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  160  		.name =3D "ibm,cbe-start-ptc=
al",
8252b88294d2a7 Nathan Lynch 2023-02-10  161  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  162  	[RTAS_FNIDX__IBM_CBE_STOP_PTC=
AL] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  163  		.name =3D "ibm,cbe-stop-ptca=
l",
8252b88294d2a7 Nathan Lynch 2023-02-10  164  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  165  	[RTAS_FNIDX__IBM_CHANGE_MSI] =
=3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  166  		.name =3D "ibm,change-msi",
8252b88294d2a7 Nathan Lynch 2023-02-10  167  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  168  	[RTAS_FNIDX__IBM_CLOSE_ERRINJ=
CT] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  169  		.name =3D "ibm,close-errinjc=
t",
8252b88294d2a7 Nathan Lynch 2023-02-10  170  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  171  			.buf_idx1 =3D -1, .size_idx=
1 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  172  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  173  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  174  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  175  	[RTAS_FNIDX__IBM_CONFIGURE_BR=
IDGE] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  176  		.name =3D "ibm,configure-bri=
dge",
8252b88294d2a7 Nathan Lynch 2023-02-10  177  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  178  	[RTAS_FNIDX__IBM_CONFIGURE_CO=
NNECTOR] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  179  		.name =3D "ibm,configure-con=
nector",
8252b88294d2a7 Nathan Lynch 2023-02-10  180  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  181  			.buf_idx1 =3D 0, .size_idx1=
 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  182  			.buf_idx2 =3D 1, .size_idx2=
 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  183  			.fixed_size =3D 4096,
8252b88294d2a7 Nathan Lynch 2023-02-10  184  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  185  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  186  	[RTAS_FNIDX__IBM_CONFIGURE_KE=
RNEL_DUMP] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  187  		.name =3D "ibm,configure-ker=
nel-dump",
8252b88294d2a7 Nathan Lynch 2023-02-10  188  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  189  	[RTAS_FNIDX__IBM_CONFIGURE_PE=
] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  190  		.name =3D "ibm,configure-pe",
8252b88294d2a7 Nathan Lynch 2023-02-10  191  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  192  	[RTAS_FNIDX__IBM_CREATE_PE_DM=
A_WINDOW] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  193  		.name =3D "ibm,create-pe-dma=
-window",
8252b88294d2a7 Nathan Lynch 2023-02-10  194  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  195  	[RTAS_FNIDX__IBM_DISPLAY_MESS=
AGE] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  196  		.name =3D "ibm,display-messa=
ge",
8252b88294d2a7 Nathan Lynch 2023-02-10  197  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  198  			.buf_idx1 =3D 0, .size_idx1=
 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  199  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  200  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  201  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  202  	[RTAS_FNIDX__IBM_ERRINJCT] =
=3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  203  		.name =3D "ibm,errinjct",
8252b88294d2a7 Nathan Lynch 2023-02-10  204  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  205  			.buf_idx1 =3D 2, .size_idx1=
 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  206  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  207  			.fixed_size =3D 1024,
8252b88294d2a7 Nathan Lynch 2023-02-10  208  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  209  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  210  	[RTAS_FNIDX__IBM_EXTI2C] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  211  		.name =3D "ibm,exti2c",
8252b88294d2a7 Nathan Lynch 2023-02-10  212  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  213  	[RTAS_FNIDX__IBM_GET_CONFIG_A=
DDR_INFO] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  214  		.name =3D "ibm,get-config-ad=
dr-info",
8252b88294d2a7 Nathan Lynch 2023-02-10  215  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  216  	[RTAS_FNIDX__IBM_GET_CONFIG_A=
DDR_INFO2] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  217  		.name =3D "ibm,get-config-ad=
dr-info2",
8252b88294d2a7 Nathan Lynch 2023-02-10  218  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  219  			.buf_idx1 =3D -1, .size_idx=
1 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  220  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  221  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  222  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  223  	[RTAS_FNIDX__IBM_GET_DYNAMIC_=
SENSOR_STATE] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  224  		.name =3D "ibm,get-dynamic-s=
ensor-state",
8252b88294d2a7 Nathan Lynch 2023-02-10  225  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  226  			.buf_idx1 =3D 1, .size_idx1=
 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  227  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  228  		},
adf7a019e5f826 Nathan Lynch 2023-12-12  229  		/*
adf7a019e5f826 Nathan Lynch 2023-12-12  230  		 * PAPR+ v2.13 R1=E2=80=937.=
3.19=E2=80=933 is explicit that the OS
adf7a019e5f826 Nathan Lynch 2023-12-12  231  		 * must not call ibm,get-dyn=
amic-sensor-state with
adf7a019e5f826 Nathan Lynch 2023-12-12  232  		 * different inputs until a =
non-retry status has been
adf7a019e5f826 Nathan Lynch 2023-12-12  233  		 * returned.
adf7a019e5f826 Nathan Lynch 2023-12-12  234  		 */
adf7a019e5f826 Nathan Lynch 2023-12-12  235  		.lock =3D &rtas_ibm_get_dyna=
mic_sensor_state_lock,
8252b88294d2a7 Nathan Lynch 2023-02-10  236  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  237  	[RTAS_FNIDX__IBM_GET_INDICES]=
 =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  238  		.name =3D "ibm,get-indices",
8252b88294d2a7 Nathan Lynch 2023-02-10  239  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  240  			.buf_idx1 =3D 2, .size_idx1=
 =3D 3,
8252b88294d2a7 Nathan Lynch 2023-02-10  241  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  242  		},
adf7a019e5f826 Nathan Lynch 2023-12-12  243  		/*
adf7a019e5f826 Nathan Lynch 2023-12-12  244  		 * PAPR+ v2.13 R1=E2=80=937.=
3.17=E2=80=932 says that the OS must not
adf7a019e5f826 Nathan Lynch 2023-12-12  245  		 * interleave ibm,get-indice=
s call sequences with
adf7a019e5f826 Nathan Lynch 2023-12-12  246  		 * different inputs.
adf7a019e5f826 Nathan Lynch 2023-12-12  247  		 */
adf7a019e5f826 Nathan Lynch 2023-12-12  248  		.lock =3D &rtas_ibm_get_indi=
ces_lock,
8252b88294d2a7 Nathan Lynch 2023-02-10  249  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  250  	[RTAS_FNIDX__IBM_GET_RIO_TOPO=
LOGY] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  251  		.name =3D "ibm,get-rio-topol=
ogy",
8252b88294d2a7 Nathan Lynch 2023-02-10  252  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  253  	[RTAS_FNIDX__IBM_GET_SYSTEM_P=
ARAMETER] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  254  		.name =3D "ibm,get-system-pa=
rameter",
8252b88294d2a7 Nathan Lynch 2023-02-10  255  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  256  			.buf_idx1 =3D 1, .size_idx1=
 =3D 2,
8252b88294d2a7 Nathan Lynch 2023-02-10  257  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  258  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  259  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  260  	[RTAS_FNIDX__IBM_GET_VPD] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  261  		.name =3D "ibm,get-vpd",
8252b88294d2a7 Nathan Lynch 2023-02-10  262  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  263  			.buf_idx1 =3D 0, .size_idx1=
 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  264  			.buf_idx2 =3D 1, .size_idx2=
 =3D 2,
8252b88294d2a7 Nathan Lynch 2023-02-10  265  		},
adf7a019e5f826 Nathan Lynch 2023-12-12  266  		/*
adf7a019e5f826 Nathan Lynch 2023-12-12  267  		 * PAPR+ v2.13 R1=E2=80=937.=
3.20=E2=80=934 indicates that sequences
adf7a019e5f826 Nathan Lynch 2023-12-12  268  		 * should not be allowed to =
interleave.
adf7a019e5f826 Nathan Lynch 2023-12-12  269  		 */
adf7a019e5f826 Nathan Lynch 2023-12-12  270  		.lock =3D &rtas_ibm_get_vpd_=
lock,
8252b88294d2a7 Nathan Lynch 2023-02-10  271  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  272  	[RTAS_FNIDX__IBM_GET_XIVE] =
=3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  273  		.name =3D "ibm,get-xive",
8252b88294d2a7 Nathan Lynch 2023-02-10  274  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  275  	[RTAS_FNIDX__IBM_INT_OFF] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  276  		.name =3D "ibm,int-off",
8252b88294d2a7 Nathan Lynch 2023-02-10  277  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  278  	[RTAS_FNIDX__IBM_INT_ON] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  279  		.name =3D "ibm,int-on",
8252b88294d2a7 Nathan Lynch 2023-02-10  280  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  281  	[RTAS_FNIDX__IBM_IO_QUIESCE_A=
CK] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  282  		.name =3D "ibm,io-quiesce-ac=
k",
8252b88294d2a7 Nathan Lynch 2023-02-10  283  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  284  	[RTAS_FNIDX__IBM_LPAR_PERFTOO=
LS] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  285  		.name =3D "ibm,lpar-perftool=
s",
8252b88294d2a7 Nathan Lynch 2023-02-10  286  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  287  			.buf_idx1 =3D 2, .size_idx1=
 =3D 3,
8252b88294d2a7 Nathan Lynch 2023-02-10  288  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  289  		},
adf7a019e5f826 Nathan Lynch 2023-12-12  290  		/*
adf7a019e5f826 Nathan Lynch 2023-12-12  291  		 * PAPR+ v2.13 R1=E2=80=937.=
3.26=E2=80=936 says the OS should allow
adf7a019e5f826 Nathan Lynch 2023-12-12  292  		 * only one call sequence in=
 progress at a time.
adf7a019e5f826 Nathan Lynch 2023-12-12  293  		 */
adf7a019e5f826 Nathan Lynch 2023-12-12  294  		.lock =3D &rtas_ibm_lpar_per=
ftools_lock,
8252b88294d2a7 Nathan Lynch 2023-02-10  295  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  296  	[RTAS_FNIDX__IBM_MANAGE_FLASH=
_IMAGE] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  297  		.name =3D "ibm,manage-flash-=
image",
8252b88294d2a7 Nathan Lynch 2023-02-10  298  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  299  	[RTAS_FNIDX__IBM_MANAGE_STORA=
GE_PRESERVATION] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  300  		.name =3D "ibm,manage-storag=
e-preservation",
8252b88294d2a7 Nathan Lynch 2023-02-10  301  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  302  	[RTAS_FNIDX__IBM_NMI_INTERLOC=
K] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  303  		.name =3D "ibm,nmi-interlock=
",
8252b88294d2a7 Nathan Lynch 2023-02-10  304  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  305  	[RTAS_FNIDX__IBM_NMI_REGISTER=
] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  306  		.name =3D "ibm,nmi-register",
8252b88294d2a7 Nathan Lynch 2023-02-10  307  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  308  	[RTAS_FNIDX__IBM_OPEN_ERRINJC=
T] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  309  		.name =3D "ibm,open-errinjct=
",
8252b88294d2a7 Nathan Lynch 2023-02-10  310  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  311  			.buf_idx1 =3D -1, .size_idx=
1 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  312  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  313  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  314  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  315  	[RTAS_FNIDX__IBM_OPEN_SRIOV_A=
LLOW_UNFREEZE] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  316  		.name =3D "ibm,open-sriov-al=
low-unfreeze",
8252b88294d2a7 Nathan Lynch 2023-02-10  317  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  318  	[RTAS_FNIDX__IBM_OPEN_SRIOV_M=
AP_PE_NUMBER] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  319  		.name =3D "ibm,open-sriov-ma=
p-pe-number",
8252b88294d2a7 Nathan Lynch 2023-02-10  320  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  321  	[RTAS_FNIDX__IBM_OS_TERM] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  322  		.name =3D "ibm,os-term",
8252b88294d2a7 Nathan Lynch 2023-02-10  323  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  324  	[RTAS_FNIDX__IBM_PARTNER_CONT=
ROL] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  325  		.name =3D "ibm,partner-contr=
ol",
8252b88294d2a7 Nathan Lynch 2023-02-10  326  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  327  	[RTAS_FNIDX__IBM_PHYSICAL_ATT=
ESTATION] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  328  		.name =3D "ibm,physical-atte=
station",
8252b88294d2a7 Nathan Lynch 2023-02-10  329  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  330  			.buf_idx1 =3D 0, .size_idx1=
 =3D 1,
8252b88294d2a7 Nathan Lynch 2023-02-10  331  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  332  		},
adf7a019e5f826 Nathan Lynch 2023-12-12  333  		/*
adf7a019e5f826 Nathan Lynch 2023-12-12  334  		 * This follows a sequence-b=
ased pattern similar to
adf7a019e5f826 Nathan Lynch 2023-12-12  335  		 * ibm,get-vpd et al. Since =
PAPR+ restricts
adf7a019e5f826 Nathan Lynch 2023-12-12  336  		 * interleaving call sequenc=
es for other functions of
adf7a019e5f826 Nathan Lynch 2023-12-12  337  		 * this style, assume the re=
striction applies here,
adf7a019e5f826 Nathan Lynch 2023-12-12  338  		 * even though it's not expl=
icit in the spec.
adf7a019e5f826 Nathan Lynch 2023-12-12  339  		 */
adf7a019e5f826 Nathan Lynch 2023-12-12  340  		.lock =3D &rtas_ibm_physical=
_attestation_lock,
8252b88294d2a7 Nathan Lynch 2023-02-10  341  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  342  	[RTAS_FNIDX__IBM_PLATFORM_DUM=
P] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  343  		.name =3D "ibm,platform-dump=
",
8252b88294d2a7 Nathan Lynch 2023-02-10  344  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  345  			.buf_idx1 =3D 4, .size_idx1=
 =3D 5,
8252b88294d2a7 Nathan Lynch 2023-02-10  346  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  347  		},
adf7a019e5f826 Nathan Lynch 2023-12-12  348  		/*
adf7a019e5f826 Nathan Lynch 2023-12-12  349  		 * PAPR+ v2.13 7.3.3.4.1 ind=
icates that concurrent
adf7a019e5f826 Nathan Lynch 2023-12-12  350  		 * sequences of ibm,platform=
-dump are allowed if they
adf7a019e5f826 Nathan Lynch 2023-12-12  351  		 * are operating on differen=
t dump tags. So leave the
adf7a019e5f826 Nathan Lynch 2023-12-12  352  		 * lock pointer unset for no=
w. This may need
adf7a019e5f826 Nathan Lynch 2023-12-12  353  		 * reconsideration if kernel=
-internal users appear.
adf7a019e5f826 Nathan Lynch 2023-12-12  354  		 */
8252b88294d2a7 Nathan Lynch 2023-02-10  355  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  356  	[RTAS_FNIDX__IBM_POWER_OFF_UP=
S] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  357  		.name =3D "ibm,power-off-ups=
",
8252b88294d2a7 Nathan Lynch 2023-02-10  358  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  359  	[RTAS_FNIDX__IBM_QUERY_INTERR=
UPT_SOURCE_NUMBER] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  360  		.name =3D "ibm,query-interru=
pt-source-number",
8252b88294d2a7 Nathan Lynch 2023-02-10  361  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  362  	[RTAS_FNIDX__IBM_QUERY_PE_DMA=
_WINDOW] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  363  		.name =3D "ibm,query-pe-dma-=
window",
8252b88294d2a7 Nathan Lynch 2023-02-10  364  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  365  	[RTAS_FNIDX__IBM_READ_PCI_CON=
FIG] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  366  		.name =3D "ibm,read-pci-conf=
ig",
8252b88294d2a7 Nathan Lynch 2023-02-10  367  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  368  	[RTAS_FNIDX__IBM_READ_SLOT_RE=
SET_STATE] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  369  		.name =3D "ibm,read-slot-res=
et-state",
8252b88294d2a7 Nathan Lynch 2023-02-10  370  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  371  			.buf_idx1 =3D -1, .size_idx=
1 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  372  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  373  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  374  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  375  	[RTAS_FNIDX__IBM_READ_SLOT_RE=
SET_STATE2] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  376  		.name =3D "ibm,read-slot-res=
et-state2",
8252b88294d2a7 Nathan Lynch 2023-02-10  377  	},
26b4fcecea05b8 Haren Myneni 2025-09-09 @378  	[RTAS_FNIDX__IBM_RECEIVE_HVPI=
PE_MSG] {
26b4fcecea05b8 Haren Myneni 2025-09-09  379  		.name =3D "ibm,receive-hvpip=
e-msg",
26b4fcecea05b8 Haren Myneni 2025-09-09  380  		.filter =3D &(const struct r=
tas_filter) {
26b4fcecea05b8 Haren Myneni 2025-09-09  381  			.buf_idx1 =3D 0, .size_idx1=
 =3D 1,
26b4fcecea05b8 Haren Myneni 2025-09-09  382  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
26b4fcecea05b8 Haren Myneni 2025-09-09  383  		},
26b4fcecea05b8 Haren Myneni 2025-09-09  384  		/*
26b4fcecea05b8 Haren Myneni 2025-09-09  385  		 * PAPR+ v2.13 R1=E2=80=937.=
3.32.1
26b4fcecea05b8 Haren Myneni 2025-09-09  386  		 */
26b4fcecea05b8 Haren Myneni 2025-09-09  387  		.lock =3D &rtas_ibm_receive_=
hvpipe_msg_lock,
26b4fcecea05b8 Haren Myneni 2025-09-09  388  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  389  	[RTAS_FNIDX__IBM_REMOVE_PE_DM=
A_WINDOW] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  390  		.name =3D "ibm,remove-pe-dma=
-window",
8252b88294d2a7 Nathan Lynch 2023-02-10  391  	},
fad87dbd48156a Nathan Lynch 2024-02-22  392  	[RTAS_FNIDX__IBM_RESET_PE_DMA=
_WINDOW] =3D {
fad87dbd48156a Nathan Lynch 2024-02-22  393  		/*
fad87dbd48156a Nathan Lynch 2024-02-22  394  		 * Note: PAPR+ v2.13 7.3.31.=
4.1 spells this as
fad87dbd48156a Nathan Lynch 2024-02-22  395  		 * "ibm,reset-pe-dma-windows=
" (plural), but RTAS
fad87dbd48156a Nathan Lynch 2024-02-22  396  		 * implementations use the s=
ingular form in practice.
fad87dbd48156a Nathan Lynch 2024-02-22  397  		 */
fad87dbd48156a Nathan Lynch 2024-02-22  398  		.name =3D "ibm,reset-pe-dma-=
window",
8252b88294d2a7 Nathan Lynch 2023-02-10  399  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  400  	[RTAS_FNIDX__IBM_SCAN_LOG_DUM=
P] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  401  		.name =3D "ibm,scan-log-dump=
",
8252b88294d2a7 Nathan Lynch 2023-02-10  402  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  403  			.buf_idx1 =3D 0, .size_idx1=
 =3D 1,
8252b88294d2a7 Nathan Lynch 2023-02-10  404  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  405  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  406  	},
26b4fcecea05b8 Haren Myneni 2025-09-09  407  	[RTAS_FNIDX__IBM_SEND_HVPIPE_=
MSG] {
26b4fcecea05b8 Haren Myneni 2025-09-09  408  		.name =3D "ibm,send-hvpipe-m=
sg",
26b4fcecea05b8 Haren Myneni 2025-09-09  409  		.filter =3D &(const struct r=
tas_filter) {
26b4fcecea05b8 Haren Myneni 2025-09-09  410  			.buf_idx1 =3D 1, .size_idx1=
 =3D -1,
26b4fcecea05b8 Haren Myneni 2025-09-09  411  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
26b4fcecea05b8 Haren Myneni 2025-09-09  412  		},
26b4fcecea05b8 Haren Myneni 2025-09-09  413  		/*
26b4fcecea05b8 Haren Myneni 2025-09-09  414  		 * PAPR+ v2.13 R1=E2=80=937.=
3.32.2
26b4fcecea05b8 Haren Myneni 2025-09-09  415  		 */
26b4fcecea05b8 Haren Myneni 2025-09-09  416  		.lock =3D &rtas_ibm_send_hvp=
ipe_msg_lock,
26b4fcecea05b8 Haren Myneni 2025-09-09  417  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  418  	[RTAS_FNIDX__IBM_SET_DYNAMIC_=
INDICATOR] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  419  		.name =3D "ibm,set-dynamic-i=
ndicator",
8252b88294d2a7 Nathan Lynch 2023-02-10  420  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  421  			.buf_idx1 =3D 2, .size_idx1=
 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  422  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  423  		},
adf7a019e5f826 Nathan Lynch 2023-12-12  424  		/*
adf7a019e5f826 Nathan Lynch 2023-12-12  425  		 * PAPR+ v2.13 R1=E2=80=937.=
3.18=E2=80=933 says the OS must not call
adf7a019e5f826 Nathan Lynch 2023-12-12  426  		 * this function with differ=
ent inputs until a
adf7a019e5f826 Nathan Lynch 2023-12-12  427  		 * non-retry status has been=
 returned.
adf7a019e5f826 Nathan Lynch 2023-12-12  428  		 */
adf7a019e5f826 Nathan Lynch 2023-12-12  429  		.lock =3D &rtas_ibm_set_dyna=
mic_indicator_lock,
8252b88294d2a7 Nathan Lynch 2023-02-10  430  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  431  	[RTAS_FNIDX__IBM_SET_EEH_OPTI=
ON] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  432  		.name =3D "ibm,set-eeh-optio=
n",
8252b88294d2a7 Nathan Lynch 2023-02-10  433  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  434  			.buf_idx1 =3D -1, .size_idx=
1 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  435  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  436  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  437  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  438  	[RTAS_FNIDX__IBM_SET_SLOT_RES=
ET] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  439  		.name =3D "ibm,set-slot-rese=
t",
8252b88294d2a7 Nathan Lynch 2023-02-10  440  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  441  	[RTAS_FNIDX__IBM_SET_SYSTEM_P=
ARAMETER] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  442  		.name =3D "ibm,set-system-pa=
rameter",
8252b88294d2a7 Nathan Lynch 2023-02-10  443  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  444  			.buf_idx1 =3D 1, .size_idx1=
 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  445  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  446  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  447  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  448  	[RTAS_FNIDX__IBM_SET_XIVE] =
=3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  449  		.name =3D "ibm,set-xive",
8252b88294d2a7 Nathan Lynch 2023-02-10  450  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  451  	[RTAS_FNIDX__IBM_SLOT_ERROR_D=
ETAIL] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  452  		.name =3D "ibm,slot-error-de=
tail",
8252b88294d2a7 Nathan Lynch 2023-02-10  453  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  454  	[RTAS_FNIDX__IBM_SUSPEND_ME] =
=3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  455  		.name =3D "ibm,suspend-me",
8252b88294d2a7 Nathan Lynch 2023-02-10  456  		.banned_for_syscall_on_le =
=3D true,
8252b88294d2a7 Nathan Lynch 2023-02-10  457  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  458  			.buf_idx1 =3D -1, .size_idx=
1 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  459  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  460  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  461  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  462  	[RTAS_FNIDX__IBM_TUNE_DMA_PAR=
MS] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  463  		.name =3D "ibm,tune-dma-parm=
s",
8252b88294d2a7 Nathan Lynch 2023-02-10  464  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  465  	[RTAS_FNIDX__IBM_UPDATE_FLASH=
_64_AND_REBOOT] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  466  		.name =3D "ibm,update-flash-=
64-and-reboot",
8252b88294d2a7 Nathan Lynch 2023-02-10  467  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  468  	[RTAS_FNIDX__IBM_UPDATE_NODES=
] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  469  		.name =3D "ibm,update-nodes",
8252b88294d2a7 Nathan Lynch 2023-02-10  470  		.banned_for_syscall_on_le =
=3D true,
8252b88294d2a7 Nathan Lynch 2023-02-10  471  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  472  			.buf_idx1 =3D 0, .size_idx1=
 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  473  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  474  			.fixed_size =3D 4096,
8252b88294d2a7 Nathan Lynch 2023-02-10  475  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  476  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  477  	[RTAS_FNIDX__IBM_UPDATE_PROPE=
RTIES] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  478  		.name =3D "ibm,update-proper=
ties",
8252b88294d2a7 Nathan Lynch 2023-02-10  479  		.banned_for_syscall_on_le =
=3D true,
8252b88294d2a7 Nathan Lynch 2023-02-10  480  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  481  			.buf_idx1 =3D 0, .size_idx1=
 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  482  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  483  			.fixed_size =3D 4096,
8252b88294d2a7 Nathan Lynch 2023-02-10  484  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  485  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  486  	[RTAS_FNIDX__IBM_VALIDATE_FLA=
SH_IMAGE] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  487  		.name =3D "ibm,validate-flas=
h-image",
8252b88294d2a7 Nathan Lynch 2023-02-10  488  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  489  	[RTAS_FNIDX__IBM_WRITE_PCI_CO=
NFIG] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  490  		.name =3D "ibm,write-pci-con=
fig",
8252b88294d2a7 Nathan Lynch 2023-02-10  491  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  492  	[RTAS_FNIDX__NVRAM_FETCH] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  493  		.name =3D "nvram-fetch",
8252b88294d2a7 Nathan Lynch 2023-02-10  494  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  495  	[RTAS_FNIDX__NVRAM_STORE] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  496  		.name =3D "nvram-store",
8252b88294d2a7 Nathan Lynch 2023-02-10  497  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  498  	[RTAS_FNIDX__POWER_OFF] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  499  		.name =3D "power-off",
8252b88294d2a7 Nathan Lynch 2023-02-10  500  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  501  	[RTAS_FNIDX__PUT_TERM_CHAR] =
=3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  502  		.name =3D "put-term-char",
8252b88294d2a7 Nathan Lynch 2023-02-10  503  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  504  	[RTAS_FNIDX__QUERY_CPU_STOPPE=
D_STATE] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  505  		.name =3D "query-cpu-stopped=
-state",
8252b88294d2a7 Nathan Lynch 2023-02-10  506  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  507  	[RTAS_FNIDX__READ_PCI_CONFIG]=
 =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  508  		.name =3D "read-pci-config",
8252b88294d2a7 Nathan Lynch 2023-02-10  509  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  510  	[RTAS_FNIDX__RTAS_LAST_ERROR]=
 =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  511  		.name =3D "rtas-last-error",
8252b88294d2a7 Nathan Lynch 2023-02-10  512  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  513  	[RTAS_FNIDX__SET_INDICATOR] =
=3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  514  		.name =3D "set-indicator",
8252b88294d2a7 Nathan Lynch 2023-02-10  515  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  516  			.buf_idx1 =3D -1, .size_idx=
1 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  517  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  518  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  519  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  520  	[RTAS_FNIDX__SET_POWER_LEVEL]=
 =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  521  		.name =3D "set-power-level",
8252b88294d2a7 Nathan Lynch 2023-02-10  522  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  523  			.buf_idx1 =3D -1, .size_idx=
1 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  524  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  525  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  526  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  527  	[RTAS_FNIDX__SET_TIME_FOR_POW=
ER_ON] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  528  		.name =3D "set-time-for-powe=
r-on",
8252b88294d2a7 Nathan Lynch 2023-02-10  529  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  530  			.buf_idx1 =3D -1, .size_idx=
1 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  531  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  532  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  533  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  534  	[RTAS_FNIDX__SET_TIME_OF_DAY]=
 =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  535  		.name =3D "set-time-of-day",
8252b88294d2a7 Nathan Lynch 2023-02-10  536  		.filter =3D &(const struct r=
tas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  537  			.buf_idx1 =3D -1, .size_idx=
1 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  538  			.buf_idx2 =3D -1, .size_idx=
2 =3D -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  539  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  540  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  541  	[RTAS_FNIDX__START_CPU] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  542  		.name =3D "start-cpu",
8252b88294d2a7 Nathan Lynch 2023-02-10  543  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  544  	[RTAS_FNIDX__STOP_SELF] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  545  		.name =3D "stop-self",
8252b88294d2a7 Nathan Lynch 2023-02-10  546  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  547  	[RTAS_FNIDX__SYSTEM_REBOOT] =
=3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  548  		.name =3D "system-reboot",
8252b88294d2a7 Nathan Lynch 2023-02-10  549  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  550  	[RTAS_FNIDX__THAW_TIME_BASE] =
=3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  551  		.name =3D "thaw-time-base",
8252b88294d2a7 Nathan Lynch 2023-02-10  552  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  553  	[RTAS_FNIDX__WRITE_PCI_CONFIG=
] =3D {
8252b88294d2a7 Nathan Lynch 2023-02-10  554  		.name =3D "write-pci-config",
8252b88294d2a7 Nathan Lynch 2023-02-10  555  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  556  };
8252b88294d2a7 Nathan Lynch 2023-02-10  557 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
