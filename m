Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7EA7493
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jan 2024 01:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+UxG27L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704677005; x=1736213005;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=fWFXUdZNE0B2cda6aK6Uqf2YCAajsPS1o8Xb42jGVjI=;
  b=V+UxG27L7N+S7SxihQpptN3ukjDELJhZv0Hrz6/zW2VmSRqbP4dW/hFZ
   gSKfYqV37UTVBWRQVAVcNAQMiQThkZ9U8cRmdgJAxGUfvL4GF7Z9yc0Ea
   uoPDZizYMVII7ZGsh2uQgsRSkGbnCPrl+W09lQ6Q2ZfLyp69AvAmdcK68
   NZ/2uAbImxhNhD7+XyJiiFbAMl9c1HIwVegYLBl1DxlLbdVdlAgqe/u78
   RuMAgZnjGFmKi7ODNL9+kG3mhhv+MXtFhOwxcOmG3ZcwgPPfHOdTUP0g6
   ofEYNFcawTawcNtosJRSwKJZH2uGXKYAKbJjOvATbtrdcWZk+5dCF9SSS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="400528807"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="400528807"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 17:23:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="815459387"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="815459387"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jan 2024 17:23:24 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 7 Jan 2024 17:23:23 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 7 Jan 2024 17:23:22 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 7 Jan 2024 17:23:22 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 7 Jan 2024 17:23:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcLe1KAYiDLLR6Sp7rnZHXSzGOgte4e3aqlG7xiI5tJaQAFvWTPhbYo2e39j0Aiv9Bn9IDQ021L4ggT+I5pH1psyOYyKbdO83Oc1EBXFxdqV+LSQ9DWqPdgfLzPbdXCe9CRNsAFbYZeg/al8JD8ORwKAg3ZvC15Kg1ohzp6NaOrAQAB1IdcP13sAvNVFkrkEt3bL95dloFfW75Eqqq1IMXEexuINbLC1/WMXeofenJPEUUl5cBN+3zaQpt3w9n9cZUOi0Zi9hFkTj0aZgbBwKmkdZizuhyVsGBnK0Vm7y16hbNVQ1tckGFpJqPEMOTmjHGt56x2lPW0vpokTo4c9NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yybDgEw0kxaYdZBUZ32B8aSHqeE21S6zvFh+yRcTmo=;
 b=kWooJGURkLgLOWZn3xQ5VwTsLpDBuOgKc7/KxcSmHdO1E2630DAphxE+wcFNDyJtmQAyiah2QBx7sGrigF5NoK+upmZdpA/ExHzKm23GU+7kNyyFigsGkWrR3Zbnl4voR1RgvHUfA7+QC5ACDDaxHx6LLJNCzaOu3Q/QG7D/58qMIEHlYF+rBMofSjSXVpTVV4NNj+pGxV4xbEuVQAPffQc4mdYCPIMfR07ZAL1H/WFih2EgQ9Skdk3Am1YkrudKMEKrPzoeX1gkBzelxj+cXC7kRv37n8CGpNc5Cv4G3+Ev/2PzbFn1DaQofca7ZcCx/ep5iElVZml/Tg1sgCuOQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CY8PR11MB7059.namprd11.prod.outlook.com (2603:10b6:930:51::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 01:23:20 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%5]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 01:23:20 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: fs/orangefs/super.c:403:9: warning: 'strncpy' output may be
 truncated copying 255 bytes from a string of length 255
Thread-Topic: fs/orangefs/super.c:403:9: warning: 'strncpy' output may be
 truncated copying 255 bytes from a string of length 255
Thread-Index: AQHaQY6rJFnMInGiBEywiuRr7Lh8MbDPHZJQ
Date: Mon, 8 Jan 2024 01:23:20 +0000
Message-ID: <CY5PR11MB63923CE17C6C5D3E2EB68DB8FB6B2@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202401080141.9S4e21oc-lkp@intel.com>
In-Reply-To: <202401080141.9S4e21oc-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CY8PR11MB7059:EE_
x-ms-office365-filtering-correlation-id: 2a31cc27-3f3f-4e0f-c3ce-08dc0fe8663e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6H71yi3mDkyfOhzcwlkl82/rdOFspTNpbJGNWK+BKgojegWk2G5ZYErpIgmSkBUFus3AQsSAd8CTUzW+6lbEuOEWPYoRk0xJNEogWXLE3Vz1fr6IgcPttRcMjHvg8Se+SOxRovZMUQh3uqWfGSR8xh8/tKrmA6cEPHNLAvLYNN3Ys2UQIMUTOPrYQbuIMimKvv6hfSAd5Xu060zpHZTm5nqnobabrcmO09BrxF7IxBNLDpeCmd5R3PC0zTLc7HGQEYUU7VpOwBNEWDrHZdrgBcNCHQjEZ9UreOcLQ/PqGvvNjyNzs0c3BV21rq5uqgXrkBZkyUA10N+2aUxOdw8sXBSbqeyGlFy1GVofrpXHuiQYb+C9bCqZrsfJJQkJS5K5lZACMVxHCgsVGR4LG5S/HH5kOCJJdqP7RmC6CQNZMchLg8+ahoon/FqJgWZhAWjLXAQxOsteCgu1tMhbj6jcqvigGQiNksNA+04+aVYcz4oYFLLLNi/rnB7WsXNB5E3rbgTsFCKdRUsTuUZVzquA7jfbAs/+H6zl7q913jRNiCAWjrr5IGJiZIY3IEVBzzUoaxEJ7kdwgiS8zwTsojNAVJaCinGG9gngWXRDzKO0PzXPV9rFVLSC6LwjSC3RLyB7Nf+NZOcxi/DSBZ3mf6Mk0s4keOE3BqXT5aEkOpsL2xnmTCrh6uYk2dOoCK8Fubs/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(376002)(346002)(136003)(396003)(230922051799003)(230273577357003)(230173577357003)(451199024)(1800799012)(64100799003)(186009)(71200400001)(478600001)(966005)(26005)(53546011)(6506007)(9686003)(83380400001)(7696005)(38070700009)(55016003)(66556008)(66476007)(66446008)(64756008)(76116006)(66946007)(41300700001)(122000001)(33656002)(2906002)(38100700002)(5660300002)(82960400001)(8936002)(8676002)(316002)(110136005)(52536014)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cz262zEhHWYzFxjQ9lB7YVnNYU30iEeosS4X80eyL+afoYbVV0q0PmgZot58?=
 =?us-ascii?Q?RXg94+RAPW1lz3AUQPovbDKlrH7kV8QSDYFPI8WfVnKbpibcy5PpVnVr9jLY?=
 =?us-ascii?Q?YHTcIjq2cWnzMhwc3MCET/VMguIT9AnH3mayYZF1uEzbLeYUfFKFnppyZw38?=
 =?us-ascii?Q?y+u034TXFIylK+xEOqvvJck9NOr8BE4kf8r/HZl/GLli+L2Zvvqgp+W9Aw06?=
 =?us-ascii?Q?QU4kiqZD0HWxKiBgP/591GLxze2q1YTEzgpeCMd2hFYCvgLklUQ8UoWlZGjU?=
 =?us-ascii?Q?EQhVcYTlzkdRUjShK3FiVUSWmda/Rj6ZZoTn3Z0bo3YKXjnoAI+rKFI3iKEg?=
 =?us-ascii?Q?Bg0essz6rh+4hwpry1tOKeGLxRYVgiQtgl3MMIKl+RNOKTv7q1T9LjhF81KQ?=
 =?us-ascii?Q?sgzKajPoekx9J3DpG4spujN6RVHRxRKxoWsnMc4PpEwa1m7d8mlNEAPzwjD3?=
 =?us-ascii?Q?sKEq0yhePoQDZP1tQAtiQ9e/4ZAac8xzJDgNkTQ1xOejnjHKZ1n1fEeEnaiw?=
 =?us-ascii?Q?LioMAvXBph5eUKQjzaHOs48DQ8dUdWJlybRiQBhK2EsyPvXUJfHtknyiRXjL?=
 =?us-ascii?Q?KzXqBq2Ys3QJnP2FHYB2dJVQM1JB/BLSgj7ykiItcfkjLRq3KIPABvatrs8Z?=
 =?us-ascii?Q?tDjIyeTFvqRn8W/u2DEMYb/l+Vi4Kd+i24Z77dKEjSP0TAmoTLcWmo+f0Brq?=
 =?us-ascii?Q?Kb7w1Bz1WKybQ6tLz0Kn4xRyIZL42QWvj9MZm9Zk0CbQ9MoA5LQvtMbdCifp?=
 =?us-ascii?Q?LbmvM2a+DJJF45vniPhP9w2tmUmCouq6kI/CRVHjjIMjfkbzDbznG0+dq/nS?=
 =?us-ascii?Q?US13iOv/sZq0T0AV+CB0UlbUyfeq2l9buAum9aiG7BXo0uJlEE7HzQJZCuGC?=
 =?us-ascii?Q?dm8Ne8mIT3fBqNwTlDdxsXLdDi9DPCg5sHBpcvsunCMAUqcv1d21pxRLl0nB?=
 =?us-ascii?Q?WEoDOUCJDVfcq548ejteX+NMnbNVUeVp8qMF9wlf9GV85+RtuNmlaCrgtU6D?=
 =?us-ascii?Q?qG11xfKMHqlvF4oS6n3hhK1mXuc5Efie9fBYyVuKt+3cTtrMVIPnseR7WdMV?=
 =?us-ascii?Q?X9pNxRE72ihkctUTP/JFWODpphC+idojHRlweFwghhXAPw7e6MrNRvEh7P22?=
 =?us-ascii?Q?GjgURn1At0D+QpPJGM2M1NKbQsDazp/zLopIKGrv/yAiRtROwLqagBM5edpl?=
 =?us-ascii?Q?VW5LkwOxj5TVcpbPRrgXCU/j9+pUeQBGqDd/cZ06tPH+tEU7xp0OFIpxPHQq?=
 =?us-ascii?Q?mrnilEez3hb69dOryIYcfbaZoHQcIwOnCm3eHebV6g5Zu5kjW6Rqx3rs+FnV?=
 =?us-ascii?Q?+FXaJwG0XBsGSUmuTtqS47DTGKjIGIuUf0jVX3cqf7V2ummJ6bRM+QVidnf/?=
 =?us-ascii?Q?wV0Pm0miRnEZjA6V/fl2aMcyA6T6gKcdNcDaR4gfKjXe0ttPPGLX9qOj77Rg?=
 =?us-ascii?Q?tNU7XluQDtbXCSGkmr22zu05vQzVzd8zRSXmFLK3IFHrzZQkDfO215hz1NLC?=
 =?us-ascii?Q?DoIZFubgIe+VySlIcIsP2VZklPjkzMK/Pb6heJqLFL5x8oGxGLAqGGSgJEXF?=
 =?us-ascii?Q?4VJwA71QROZWw+75l6SVj+5wQ/j5vAw8ic2zihbg?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a31cc27-3f3f-4e0f-c3ce-08dc0fe8663e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2024 01:23:20.1688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LRg/6DJCHENlDqlARlVxYDCuqj9jwXKYA8kb3STLw3xV88CEQOCszDVtl/ClE1fwLX9tMOj0XjdFczwJXYvRGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7059
X-OriginatorOrg: intel.com

not_report

The patch changes the cflags for memcpy/memmove/memset under loongarch. It =
seems no relation with the -Wstringop-truncation and -Wformat-overflow warn=
ings in some filesystem and driver code.

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index b1e5db51b61ca..ef87bab46754e 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -83,8 +83,8 @@ KBUILD_CFLAGS_KERNEL          +=3D -fPIE
 LDFLAGS_vmlinux                        +=3D -static -pie --no-dynamic-link=
er -z notext
 endif

-cflags-y +=3D -ffreestanding
 cflags-y +=3D $(call cc-option, -mno-check-zero-division)
+cflags-y +=3D -fno-builtin-memcpy -fno-builtin-memmove -fno-builtin-memset

 load-y         =3D 0x9000000000200000
 bootvars-y     =3D VMLINUX_LOAD_ADDRESS=3D$(load-y)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Monday, January 8, 2024 01:23
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: fs/orangefs/super.c:403:9: warning: 'strncpy' output may be trunca=
ted copying 255 bytes from a string of length 255

::::::=20
:::::: Manual check reason: "low confidence static check first_new_problem:=
 fs/orangefs/super.c:403:9: warning: 'strncpy' output may be truncated copy=
ing 255 bytes from a string of length 255 [-Wstringop-truncation]"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: WANG Xuerui <git@xen0n.name>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   52b1853b080a082ec3749c3a9577f6c71b1d4a90
commit: 3f301dc292eb122eff61b8b2906e519154b0327f LoongArch: Replace -ffrees=
tanding with finer-grained -fno-builtin's
date:   5 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r064-20240107 (https://download.01.org/0day-ci=
/archive/20240108/202401080141.9S4e21oc-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240108/202401080141.9S4e21oc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401080141.9S4e21oc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/orangefs/protocol.h:287,
                    from fs/orangefs/super.c:8:
   fs/orangefs/orangefs-debug.h:86:18: warning: 'num_kmod_keyword_mask_map'=
 defined but not used [-Wunused-const-variable=3D]
      86 | static const int num_kmod_keyword_mask_map =3D (int)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'orangefs_unmount',
       inlined from 'orangefs_kill_sb' at fs/orangefs/super.c:616:6:
>> fs/orangefs/super.c:403:9: warning: 'strncpy' output may be truncated co=
pying 255 bytes from a string of length 255 [-Wstringop-truncation]
     403 |         strncpy(op->upcall.req.fs_umount.orangefs_config_server,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     404 |             devname, ORANGEFS_MAX_SERVER_ADDR_LEN - 1);
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/acpi/acpica/tbfind.c: In function 'acpi_tb_find_table':
>> drivers/acpi/acpica/tbfind.c:60:9: warning: 'strncpy' specified bound 6 =
equals destination size [-Wstringop-truncation]
      60 |         strncpy(header.oem_id, oem_id, ACPI_OEM_ID_SIZE);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/tbfind.c:61:9: warning: 'strncpy' specified bound 8 =
equals destination size [-Wstringop-truncation]
      61 |         strncpy(header.oem_table_id, oem_table_id, ACPI_OEM_TABL=
E_ID_SIZE);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
--
   drivers/pci/controller/pcie-mt7621.c: In function 'mt7621_pcie_parse_dt'=
:
>> drivers/pci/controller/pcie-mt7621.c:228:49: warning: 'snprintf' output =
may be truncated before the last format character [-Wformat-truncation=3D]
     228 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
         |                                                 ^
   In function 'mt7621_pcie_parse_port',
       inlined from 'mt7621_pcie_parse_dt' at drivers/pci/controller/pcie-m=
t7621.c:280:9:
   drivers/pci/controller/pcie-mt7621.c:228:9: note: 'snprintf' output betw=
een 10 and 11 bytes into a destination of size 10
     228 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/imx/ipuv3/imx-ldb.c: In function 'imx_ldb_probe':
>> drivers/gpu/drm/imx/ipuv3/imx-ldb.c:659:39: warning: '_sel' directive wr=
iting 4 bytes into a region of size between 3 and 13 [-Wformat-overflow=3D]
     659 |                 sprintf(clkname, "di%d_sel", i);
         |                                       ^~~~
   drivers/gpu/drm/imx/ipuv3/imx-ldb.c:659:17: note: 'sprintf' output betwe=
en 8 and 18 bytes into a destination of size 16
     659 |                 sprintf(clkname, "di%d_sel", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +403 fs/orangefs/super.c

1182fca3bc0044 Mike Marshall      2015-07-17  393 =20
9d286b0d8207a7 Martin Brandenburg 2017-04-25  394  static int orangefs_unmo=
unt(int id, __s32 fs_id, const char *devname)
9d286b0d8207a7 Martin Brandenburg 2017-04-25  395  {
9d286b0d8207a7 Martin Brandenburg 2017-04-25  396  	struct orangefs_kernel_=
op_s *op;
9d286b0d8207a7 Martin Brandenburg 2017-04-25  397  	int r;
9d286b0d8207a7 Martin Brandenburg 2017-04-25  398  	op =3D op_alloc(ORANGEF=
S_VFS_OP_FS_UMOUNT);
9d286b0d8207a7 Martin Brandenburg 2017-04-25  399  	if (!op)
9d286b0d8207a7 Martin Brandenburg 2017-04-25  400  		return -ENOMEM;
9d286b0d8207a7 Martin Brandenburg 2017-04-25  401  	op->upcall.req.fs_umoun=
t.id =3D id;
9d286b0d8207a7 Martin Brandenburg 2017-04-25  402  	op->upcall.req.fs_umoun=
t.fs_id =3D fs_id;
9d286b0d8207a7 Martin Brandenburg 2017-04-25 @403  	strncpy(op->upcall.req.=
fs_umount.orangefs_config_server,
6bdfb48dae8e1b Xiongfeng Wang     2018-01-08  404  	    devname, ORANGEFS_M=
AX_SERVER_ADDR_LEN - 1);
9d286b0d8207a7 Martin Brandenburg 2017-04-25  405  	r =3D service_operation=
(op, "orangefs_fs_umount", 0);
9d286b0d8207a7 Martin Brandenburg 2017-04-25  406  	/* Not much to do about=
 an error here. */
9d286b0d8207a7 Martin Brandenburg 2017-04-25  407  	if (r)
9d286b0d8207a7 Martin Brandenburg 2017-04-25  408  		gossip_err("orangefs_u=
nmount: service_operation %d\n", r);
9d286b0d8207a7 Martin Brandenburg 2017-04-25  409  	op_release(op);
9d286b0d8207a7 Martin Brandenburg 2017-04-25  410  	return r;
9d286b0d8207a7 Martin Brandenburg 2017-04-25  411  }
9d286b0d8207a7 Martin Brandenburg 2017-04-25  412 =20

:::::: The code at line 403 was first introduced by commit
:::::: 9d286b0d8207a70d7e0ffbd5be864ff7a62de05a orangefs: ensure the usersp=
ace component is unmounted if mount fails

:::::: TO: Martin Brandenburg <martin@omnibond.com>
:::::: CC: Mike Marshall <hubcap@omnibond.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

