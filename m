Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2FD1851
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Mar 2024 01:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710985507; cv=fail; b=FkRQQC4ciNkeNTdNI8xZF/ApA/qVyvl+qcg9HGZfckQXFJTmIIxnb54aothfCScnRftHW8fwA3VudvGxXYVz+Z9H8Qfm0R0ycByurQqrTq2OmupAsjajl2xe9ASYe7Fhfg8ei0v1AjylnkyfBhjKpeM0f3OQpz6i9CBgPBMn3/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710985507; c=relaxed/simple;
	bh=X7DOBy4QmdUhlZOODCX4rZm5JZfNYo/tFk1tQUTEyVc=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QRmOXGe08MZjYyzNhGnEkEmeiTvcw7rm2uNTLZNm4x4Wo+C2h95sQ7O8TVfln9uQnnHeep+vzcZu7cEkI4jucw/EnTfa0hMcdWCWuLAZ5SSk6G0DR8nFJf4GPCA0XV5Bhi6Wjc3ql6GYHevw2tz3aYu0fN7Ct5FQUTK7fZJvGOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=htVv0aQM; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htVv0aQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710985505; x=1742521505;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=X7DOBy4QmdUhlZOODCX4rZm5JZfNYo/tFk1tQUTEyVc=;
  b=htVv0aQMtO1CaFOABWmgDixs4I0SLgNbekGXgq1+eTHVAr4NorzGKsOS
   C3X9IEQUyWtv/+klFc+Ew/NG4iw7uTBi5lHOuKG3Rz4ltmRkMnfUdJ3eP
   ZgLC9rohMhS+V3SlCx1I03vgMpNCPn7BaEtF2hYiN27ssSErTV1rddXxs
   /paHl39ed2iJdb1XXqBShA+7V/IdG/+c/7Z0pnublL4Z2XsgQ3KLEeHM9
   myVQAV4HwMYmHI2TCVNTfs/y16B+JrBKdsOFzfy5N50y9fo/rZIB6b5py
   dXlle113Rg8QR4YUyFmO8vFbmpXE2t17WjfzkNxGzAOB2/pB+Uc8K9PJx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="17401044"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="17401044"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 18:45:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="19049293"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Mar 2024 18:45:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 18:45:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 18:45:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 18:45:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 18:45:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHo1KqEJSAws92VOjuzV7smVlxy76Qp6s4fL8TlgUOHGs7WS/Qj5BPnAYWYOH3qYoDp4aBeW0nqQRMMFaF8JPOcpVN0gvN64dHQQZz8dX7dbxyhHNtac8YEZ4rTOTO0AROVk1qRXd9q2thlxFdzFt/3juUt/GdFej3gfZYJ2QFfiHDqQXgPjk5Xx2g5Uq5LCLw9TekPb9Bp+PttGdq+YR1JiAvshfQbwthtbV85vRymbxV6SpQ7MQDz5LaCJLB/Bxnl6ceaxc8De9z0zolWyL2c2JiZ+oWgh1kHQnNsyZOvebFrN5VCr8FomnMG7/+NKTTQPP4qWguPVFBjsO6hSbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRO1e8PREbMhSxSj7Fr2pgFQK9dYIxhr3r/omtNtuMo=;
 b=LhMQsgE0Mf3eR+jTasW9bHKCXx52wbNDrV34fWcvpKtue0iVfvjVzp3FwRR7KhrcYUyU0nab1lV0bahXDjKL0Xj9Zc34lY/Pe7elYSNf6hC2oVhhHELHv+1X3uh4W1FC2ecVywT2uKVjB04igDh1XhUXU5RY5uSfz1NKL87QmrMbft5n9HG0gHeoxrw3qyxKn8d75MliGmwTwhdrw3ZNq2oM+673ZSZzYOe+hkQ5hL2ezlw7s5LSiofiA90fjHepXOGOVjozsP+4+OZn6YjnzJZxT0BYuvSdZar8gxsUFYhBcpcq0rK95IcTxO1dEgkoio2YBuZazuFxoAnJlewG0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by MW4PR11MB7006.namprd11.prod.outlook.com (2603:10b6:303:22f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.21; Thu, 21 Mar
 2024 01:45:01 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d%6]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 01:45:01 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [linux-next:master 13710/13866] WARNING: modpost:
 lib/test_user_copy: section mismatch in reference: (unknown)+0x4 (section:
 .text.fixup) -> (unknown) (section: .init.text)
Thread-Topic: [linux-next:master 13710/13866] WARNING: modpost:
 lib/test_user_copy: section mismatch in reference: (unknown)+0x4 (section:
 .text.fixup) -> (unknown) (section: .init.text)
Thread-Index: AQHaeh3S8oN4OX9ixECvPiMJs4bG67FBbfYg
Date: Thu, 21 Mar 2024 01:45:01 +0000
Message-ID: <CY5PR11MB639290391A63C6D2163AF46CFB322@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202403200042.khgIljOG-lkp@intel.com>
In-Reply-To: <202403200042.khgIljOG-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|MW4PR11MB7006:EE_
x-ms-office365-filtering-correlation-id: d82d9918-7702-4db3-c2b4-08dc494885dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nKcZ/DCjunRxr/fqqUn1UclgjRiN2I5bZreIBdD1cWbsN0DdbJmIAofOfDMAX8PDn5F/itQLVfvqWJgryiwmW0etwrrZu2+QCeReSMUezfXoohZPDb/G6shLM+69CArzxqQny92UyRgt/vcKC9C5CwoxACMTWs5HtTFU/5mkQd2EZsfUBB9WgYec4JmYErCkaQStQVW3YfTUyPHPn3GY2j3OyTzo20XOqpUOCjwaLVMOpZJWe25nPRjLtxOUzAJW2ow3BCBu4ddi2B8T1iMvauF0yrGUhopCyrPlFIk2AB+NqFhtNbs5tv2nH+pj/R8YV3jDFslIw9Y+qPfEUN0XYdYi69Q+ohAAIXqqUWruGPn0ZvAJWB98X+0/AfAsVqlG7rzBNm/ZAACW+E4rRSWGb5Ez9/4EcwTo1dMFMMvLhPIoLgH09rTe3M+XLmn2MQ/mTjRMahgeL5VjVCMlMk0Zj0bU5Vq7hm5VTUF5fY4ES4GOETnihW6GtqsOEGdxmrCOrINcBc3ltKvLvWFPdZ2DJQ/lwB+AoQgarwZoHDoRWB3xDJ9yJ/vH5r4H6nLvw7NAri82yElMraPKUCvAxiaWgUW4E3R9ux9nu4fqYdVhuA42CbfWj+B2iboQBlk+LcKON0CQxr9rCaOTYQMmGZnoidujzT/CQapTHhSiqIvBovhAHABs6d2KsZ0oUv1zKo3c
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8KFCpjEuAMSm1XsPkVnJL4ptgGMm2JvJiozwCfuedgTvoW5ps5G1MmejnX+A?=
 =?us-ascii?Q?XuV5sYIpw/JbNIiPSz3MDjf7ZkGmvUfR3xqV5YBtxeTqCkVhUOyrLjqJk5Lj?=
 =?us-ascii?Q?URwXdiayp7+NQwXz9pvw6kznNBiWnkNlSnardIy6MezFScM2j7Cj+vDnrw6F?=
 =?us-ascii?Q?+uSxXrW+kC5sGWEUmnRUYzjdTAL7BSkw07I3bCGP57E5Lr+T69EztUsgNHls?=
 =?us-ascii?Q?IBoE04J+f8Y7QR7CKTcOnqSV+jB4n6NI61QvLxIXlHzKXexdFEGxb526SuyS?=
 =?us-ascii?Q?MHXbAKtMvHw2ICpAh9tvNC9gnf5t+6vH8iR37/H7iDZOcB3cdVHgis8zO5lM?=
 =?us-ascii?Q?BrlY8+pR/jsO8Ay43h0Vr7ab1a0YRZ2/1qdW/SFoIo17/FGbWUf9SYhi6vs+?=
 =?us-ascii?Q?cbSci24sK7jlWV4uDbvp+3iTcY94E1mWHluMd4y3H2XWlAxuzXXjtRF9yd99?=
 =?us-ascii?Q?tlz8K6KnMTRn4nIJrVnX6ldF0XQeQ5XbUTl4GLayI66OssRMczovQLbWKf6G?=
 =?us-ascii?Q?aHElrxRvPyZfCZnr3VVF6ZW4bCdPFAlGt+wtVW5NC49MDUu7BA2cdmA3++yW?=
 =?us-ascii?Q?BSZ43+4UyoQE6Zp1jHLxr0+gcuMqpbDrCjAPmzpzRdQaHCNtAUznz73tVIhj?=
 =?us-ascii?Q?HEmF2onKaZXoHkw8GhVbV7HJYOjwyf5f2+FbzsWp0vvuSmImLR+SPppah9HH?=
 =?us-ascii?Q?btxHArBRma6giFy7aeejasc9v8kFUjhoqucvS95F66OIR4tHCBv7SzNEu7qf?=
 =?us-ascii?Q?8AusIZoUWfNLeF+vcz+1kFgUvZTBzdKb7chIMUkt5dGfuEv+KdEd8/AEe+cx?=
 =?us-ascii?Q?doKJMSV92QgnDnv52ff5Y43YdFPpUnu+z9Xqq5isW9xRvdt0JoGlXGRt4kBK?=
 =?us-ascii?Q?mq5cBDOiMvgqjHgr5zs6f2fiSdpb/LZsOjFzpTIQpDqxboS+DXK2te7YeGCi?=
 =?us-ascii?Q?vBWcEEaM+nEMbzL17+j7nKINUeeS/KYWzFKYddA8kzzjPNijH/RN8Fyw1Gnm?=
 =?us-ascii?Q?y57NvjZG1MF1vyJLWyQusDg0NUIySplc+kSnxij5qFTjphokILxlsh0TNEy0?=
 =?us-ascii?Q?wZplhSLP2adxiuc6Cuq3CSwN4iU+xnVUcRo6JL8ekB5vkbsmIb+LUOMqrwNR?=
 =?us-ascii?Q?CWNS6qPihjqlyHwUyeZHucOfpGSysUyqU4S7PV71PpZJtY17KLtTgQBNMo40?=
 =?us-ascii?Q?WIoIwDylo2+cD1HgV9SUzb/WS+nZBX7yKiA848j4NDHAZmzQxS32MmfqW02i?=
 =?us-ascii?Q?rRQBd7nAjsMVqBWw8zs/OQITlhEDuRZUWN2qS35c28GwdLEOEm+A3FfUoamJ?=
 =?us-ascii?Q?e4S2gl2+itYEagjDNgBQJtHTeQaq657LV94gjgUelBzRpVEsv/hbek+k4hEv?=
 =?us-ascii?Q?VSEYhw3k15d8rpcYlq9DzqUUCzc4SX6+NyZ8fM4qj5aDwjITDFfCYDJIlRlo?=
 =?us-ascii?Q?in4cbWg+8DNJZ8CCDgg/RpKiXzb8pXvIlqZbr2A24ZFJLOOKc2JXyJD2Qegr?=
 =?us-ascii?Q?nbPE8PPh6hsZVCfC9SZHQrtYbrFMbES92TZiCV9aFckGhS7ritpW7WUGojZb?=
 =?us-ascii?Q?8llmebsFju2pUCR/89s=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d82d9918-7702-4db3-c2b4-08dc494885dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2024 01:45:01.1836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LQbDYOCMZVYLDpta0kn6CmIYD68SqeDG1tJW10RlLOy0RzlJk3USzjD9oKrPfLkQl27+bO5K/W0RQvJDmoIRPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7006
X-OriginatorOrg: intel.com

not_report

The commit message says:

    With this fix, it prints lots of warnings like this:

     WARNING: modpost: lib/test_user_copy: section mismatch in reference: (=
unknown)+0x4 (section: .text.fixup) -> (unknown) (section: .init.text)

This exactly matches the new warnings in the report, so it is an expected b=
ehavior.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Wednesday, March 20, 2024 00:50
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [linux-next:master 13710/13866] WARNING: modpost: lib/test_user_co=
py: section mismatch in reference: (unknown)+0x4 (section: .text.fixup) -> =
(unknown) (section: .init.text)

::::::=20
:::::: Manual check reason: "only scripts/mod/modpost.c file changed"
::::::=20

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Max Kellermann <max.kellermann@ionos.com>
CC: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   226d3c72fcde130a99d760895ebdd20e78e02cb5
commit: 23dfd914d2bfc4c9938b0084dffd7105de231d98 [13710/13866] modpost: fix=
 null pointer dereference
:::::: branch date: 15 hours ago
:::::: commit date: 23 hours ago
config: arm-randconfig-004-20240319 (https://download.01.org/0day-ci/archiv=
e/20240320/202403200042.khgIljOG-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f6=
8022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240320/202403200042.khgIljOG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202403200042.khgIljOG-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcutorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcuscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/refscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/time/test_udelay.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/backtracetest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/resource_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/sysctl-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/fat/fat_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp437.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp855.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp857.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp861.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp862.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp866.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ascii.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1255.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-9.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-r.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-u.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-ru.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-centeuro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-cyrillic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-iceland.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-romanian.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-roman.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/bcachefs/mean_and_vari=
ance_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_script.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/ext4/ext4-inode-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/jbd2/jbd2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/cramfs/cramfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/hfs/hfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/sysv/sysv.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/ufs/ufs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/efs/efs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/qnx6/qnx6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/autofs/autofs4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/adfs/adfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/btrfs/btrfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/algif_hash.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit-example-t=
est.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/math/rational-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/find_bit_benchmark.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bpf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_hash.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ubsan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_list_sort.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_rhashtable.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_sort.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_user_copy.o
>> WARNING: modpost: lib/test_user_copy: section mismatch in reference: (un=
known)+0x4 (section: .text.fixup) -> (unknown) (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unkno=
wn)+0x10 (section: .text.fixup) -> (unknown) (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unkno=
wn)+0x18 (section: .text.fixup) -> (unknown) (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unkno=
wn)+0x24 (section: .text.fixup) -> (unknown) (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unkno=
wn)+0x2c (section: .text.fixup) -> (unknown) (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unkno=
wn)+0x38 (section: .text.fixup) -> (unknown) (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unkno=
wn)+0x44 (section: .text.fixup) -> (unknown) (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unkno=
wn)+0x4c (section: .text.fixup) -> (unknown) (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unkno=
wn)+0x58 (section: .text.fixup) -> (unknown) (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unkno=
wn)+0x60 (section: .text.fixup) -> (unknown) (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unkno=
wn)+0x6c (section: .text.fixup) -> (unknown) (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unkno=
wn)+0x74 (section: .text.fixup) -> (unknown) (section: .init.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_base.=
o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_uuid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_blackhole_dev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_free_pages.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ref_tracker.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/atomic64_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/bitfield_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/checksum_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/list-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_linear_ranges.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bits.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/memcpy_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/is_signed_type_kunit.=
o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/stackinit_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/fortify_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/strscpy_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/siphash_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/bus/vexpress-conf=
ig.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/phy/broadcom/phy-=
bcm-ns-usb3.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/meson/pin=
ctrl-meson.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/meson/pin=
ctrl-meson8-pmx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-gw-pld.=
o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/backlight/p=
latform_lcd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/goldf=
ishfb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/vfb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/clk-imxrt=
1050.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt6779.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt6779-ipe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt6779-vdec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt6779-venc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt6779-mfg.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt6779-aud.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt6797-img.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt6797-vdec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt2712-apmixedsys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt2712.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt2712-jpgdec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt2712-vdec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt7622-eth.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt7622-hif.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt7986-apmixed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt7986-topckgen.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt8167-img.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt8167-mfgcfg.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt8167-vdec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt8188-imp_iic_wrap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt8195-img.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt8195-imp_iic_wrap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt8195-ipe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt8195-vpp0.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt8195-vpp1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt8195-wpe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt8365-apmixedsys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt8365.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt8365-apu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt8365-cam.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt8365-mm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-=
mt8365-venc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun2=
0i-d1-r-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun5=
0i-a100-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun5=
0i-h6-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun5=
0i-h6-r-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun4=
i-a10-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8=
i-a23-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8=
i-a83t-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8=
i-h3-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8=
i-de2-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/clk-gate_test=
.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/qcom/clk-qcom=
.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/qcom/lpass-gf=
m-sm8250.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/qcom/gcc-msm8=
976.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/qcom/hdma.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/imx/soc-imx8m=
.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4xx=
-npe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/virtio/virtio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/virtio/virtio_rin=
g.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/reset/hisilicon/h=
i6220_reset.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/hw_random/om=
ap-rng.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/pan=
el-auo-a030jtn01.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/pan=
el-orisetech-ota5601a.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/lo=
ntium-lt9611.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/lo=
ntium-lt9611uxc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/si=
l-sii8620.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/si=
i9234.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_panel=
_orientation_quirks.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_mipi_=
dbi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regma=
p-kunit.o

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

