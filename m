Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A101C7E
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Nov 2023 01:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZIBlaYjw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700098487; x=1731634487;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=1XsfO2onIaJ5FAa91g3CesjTQKPQTU6xjTAkQqWXQ3w=;
  b=ZIBlaYjwPSlbNcBr4EWDAx6kSAvMpMmKmaugSGBAwgLoAwDbdhLFhi79
   QQh/LKQCIZoBdx+bpYQyP9R+Ortzbxv2EbwWIDS4w2f0yNAnmuzhYAHei
   DR27byfoWSKfFphsefXGo6Lq0Z4Iy+khAXidAYI/LbmbtT9UI6dZ8bgtx
   DE3FwjAPZ/rYDd1IOLOgYa4BRcq54/h3U0+wJ0fI2MELMZ1gcyqwxnw+A
   wPeMsNGLRqmrJ8u27fXA8+aIcM4XQXbw/RDoFAL3ysRvQBaBybXWElVZN
   tYFMq4Q3REYgk4JjgZT3MO+A1va+tK8paX+b3GrbLbsnXmQPv2Nc1jdXH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="393841478"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="393841478"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:34:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="1012450566"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="1012450566"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Nov 2023 17:34:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 17:34:45 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 17:34:45 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 17:34:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXxYNTHDCcP4pUUba3b1cujdH2chYJqSOdTAcGyw/0nHZWIqBMGQY27HoRFW+ZSOUg5X6gpYCUK0P30Sv2vjUL7PR/w9kO3ONoj0/UBXYwH8Zs270PRh+MkhlADDRHeVWREfACSHsBbhtiNQ3R1SCKwz7qLTyK1jbV3QPJPWsiSd2bNHZpR3T87nOkPExAL2JSTW3/Yg+4fIj5xmjiPBmuHZzbiob0Ja9HFSyp9JZsfHufeyH6itRhPIWeSopv9cFNU0CevZJKxxMB1mXtjtGzv8pYOOXY8iQU3hROkiCiHrDaFTHo1C/fv1F6VDIA2C41ygbczG0PHoFdt5FUJrsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HVDIT4qINEKy7Hz8vOC+6aV63UPRQjeys9XFt4hcgmE=;
 b=iWYlPJ0ADDJSk2fuoY7quG3GIaeS4z1+nQIN2JIhGYa51/fZA2Ybyj6pTeaZsRoIbT+DsiQ8GbEtjSzZD2L7NQZlURXjcxTiUwKjs+lfwFPCY0wQelK3Vzks8ynVlaFMqQyjHugHT8roJr0aEiw/uxncasS5fUGCeiItjTQ+jZSk5gYZpe06zwMPiNk2aq49X0Ttcn6cf7E2qWpJfccXoteS2Ia8gy0jnPWraEcwbqh9FWvSrvoV0I4kFMduA1KDfBqFx/3ROUuutrIP01BcploKoHBNaZzO7Os0deeM5IgIgWd1FBjgcacdMPzHYDXNSU35QA6irr1tB+qknZfdNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CY8PR11MB7012.namprd11.prod.outlook.com (2603:10b6:930:54::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Thu, 16 Nov
 2023 01:34:21 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 01:34:20 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [PATCH 1/1] tty/serial: RISC-V SBI earlycon via DBCN extension
Thread-Topic: [PATCH 1/1] tty/serial: RISC-V SBI earlycon via DBCN extension
Thread-Index: AQHaF/M+f62Kf/xklk2ikEIasfx2ebB8KeEQ
Date: Thu, 16 Nov 2023 01:34:20 +0000
Message-ID: <CY5PR11MB6392DA9BCB0A56B8B85C2255FBB0A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311160224.50mmKrMV-lkp@intel.com>
In-Reply-To: <202311160224.50mmKrMV-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CY8PR11MB7012:EE_
x-ms-office365-filtering-correlation-id: 7dfaf8e3-c818-4a4c-fe53-08dbe6442801
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FZuLY+GjL3j9K1/HLRRr461VFBbGwfb1ofr0l6v/cUo9Pagy85wphwx1cm5ynV4PBb83Ehe6APaMtPvzFIGpxNGaxd1LX21peURBpZ4fMCgafoM+5AQIK7QfXCCubgGk6bY/CLIED1YL1MRIXepGDa8GgHui0NyzDuMRuD0IdbzQbQ0R1qhOHQkNsU0T6u4JUYs7zufx5ESGBf1gZRu0eD/yb7Mn/Dx018HR4BsniUmhw4Zo76eBJ8LonYzObVYioq3xGjqksTlelMnrTiRn0zsq+UJj9/v3NbydWmfzKv3RBHOO+jSFTqpd+3YJ2sMZtPJacBJxoQ5uLMGDqihYLrngtlv9iyTyNN2BUzNWUIHitO5xWK4U7LHIAHj0s7lx0kB4tgP+tmmGD1yMAh7CFpTha8LDE/pUqwpdNk23u/swWTMMt78PBgKGKnarBUP7JVE4DAwiFgXYP0jBU+MQshsGsgoSU5Arg/VPWPEVN849Hfg5f9u6mOwTt1VNPA9UXWZCoGkVcTyKcNsiR91zeuyJlWhTX/VNMcjDzL0yqqBR9oIDlWbMQdtHpe/YzvcnjLpi9EDTQIdCv2Jr5CxvaHCrApRWoU4IIrbO+5PtI957GnzMFX3F+JiG1wMVKOXQkmqhrUAqiXdM/VbkWqPd3w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(376002)(136003)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(6506007)(316002)(7696005)(52536014)(5660300002)(53546011)(38100700002)(478600001)(71200400001)(86362001)(83380400001)(966005)(2906002)(76116006)(9686003)(66476007)(33656002)(66946007)(66446008)(110136005)(66556008)(64756008)(55016003)(8676002)(8936002)(26005)(4001150100001)(82960400001)(122000001)(41300700001)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QxrvxFix9/uCYxnXPXqv9XwPIueMts97zztxVN3GwSAb99G8hIUvbFXtaPyy?=
 =?us-ascii?Q?ApuAGAWuThbeS36vQ+8IMoGDFhZOrRIdxCm8+L89pDnzpsZzFxtMLenjV7cU?=
 =?us-ascii?Q?gSZyrpBwEG/2AMPMTVfvrLXxEFJ/0jywoUNMXC0xE/Xl19rlu4dUuYJlMEYg?=
 =?us-ascii?Q?tJcQGGQifSpCXCBn4tznDRT2pezqOS/IwzINyXEwx+KXMAzc1J/47b/j7BnC?=
 =?us-ascii?Q?cc+YTT3JEweZtG+VgSRyOFMiQafQTI8vBD13olWcyl7x8XaHXSLpbPjkKOnt?=
 =?us-ascii?Q?r7seMWhkyg2rfD2ygffA+f/+d3rXllHIOl6H239OoYtJ4rri0+8RKYvCT8qf?=
 =?us-ascii?Q?snNAEU544AJLWXmpVcG3zzPkIhJmVFQcd7HLUcKzztZptqD/6G1u9PDdH/bq?=
 =?us-ascii?Q?8Y4S++614zzfH4mQWCdRfCqnLetFg3v2p7xOnK8EqRuw2imca9kZHsCXx6b2?=
 =?us-ascii?Q?kRas7NHUg1NLhNKZhQDtSB+eg5sUb8iImPshvJrr576fIX8prT65XmG4oscQ?=
 =?us-ascii?Q?1rSSZLjSTHxmlfFTly3mGuY9aKuEK1R4m5OS3JTvfcktmItpVOJQvWgavGIT?=
 =?us-ascii?Q?lIIVioQAaOm/ZjvAO4/EN4uQfCTXtCA+ap7Y8LcWJkLiujVMew/nvmZT8vw2?=
 =?us-ascii?Q?bvFyMI8RQijIY0NuYGvZlcHZhPkkFzKMYt1Pzb3BtDOi0Eqk+uNyG/uAUe5Y?=
 =?us-ascii?Q?djR2z+pzezHAxWN/SXaZeUsfQx7xq6aCLCNM19Uou+NOeN9axsu/EqWMwcSd?=
 =?us-ascii?Q?6XbfyfFmxwlYHVIzAjlHrY2UoUx2U0nbETipY57/FPZTVzfEKvY6MHKijgcI?=
 =?us-ascii?Q?p7gdH8J0xsGiQWAYzFTrJzrndRcG2PIdXykE0TRdcWgOAxdeqI8QkPYHdFDx?=
 =?us-ascii?Q?R878KtNsSY+NJ9NFF0K7m7c3FeCeyiG0mgr0XJ9GEh3QSiowq9JFttXdLyP9?=
 =?us-ascii?Q?1CEa+nevNrnbpLhBTtFsVIGp44jrCMEpKN+ZZpSldIV/AJKGTcpchzXXElLH?=
 =?us-ascii?Q?HJrm9d/JyKTA2Xpa3ReB1Pil61nnmk4oPXh8LNjan6TC3Oc6uyWCcGCA7S9m?=
 =?us-ascii?Q?S395SKkFZpTYNVrbg5Lef8C44Fx8v4GJjx6BF85i9asOf4a+Mr1J4xl1ZWF0?=
 =?us-ascii?Q?LyuiByFiNHu38KGLMzggf3hIfmdqilg7dQyN1xlcX9gxShCKLek/ewQ8zORI?=
 =?us-ascii?Q?tcU8rVcmKxxu32TqL+869EXJaBQNGwH839cU4fgLU+A5FPffOhTBdC/S5RZ2?=
 =?us-ascii?Q?I35lbIcoYQVzoRGM1rMNRzfixBX8srb86swZcbTTdlaIop4Qhh/km+oVJlve?=
 =?us-ascii?Q?U318MYhvUo7AdeXNsVghhPGGoEnfk7i2Rop/wrGk+gGyUyOpz5q/j54nsE6u?=
 =?us-ascii?Q?5QZ6M4aoOmAwl2QETyeqm6Zze3qbQakXEA7SvPWFHDf65UMHxHcT+TUaoSIv?=
 =?us-ascii?Q?V1JfzQBmYihYpqKplKTDBOyWXSQOulvgeBAEF9tM3bus4/bm/f2P0C3YPou8?=
 =?us-ascii?Q?kDBlEZPMW/Vp1sa68uaiCTbUpjKM4tcRN4lWGpB6WObkSHZyXHBLa4t/0wMW?=
 =?us-ascii?Q?/VhmogTEybuX6uoKsZBh8SHLsS821rPqz/wW+4gb?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dfaf8e3-c818-4a4c-fe53-08dbe6442801
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 01:34:20.5936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cFm3ISMnZYk1Y5kww+PydbF2WgOFWv+YsXOW62ps3/gVDg507NYEQ8prSPWSiDgXM09XeA+II5k4Uh5L+lXPlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7012
X-OriginatorOrg: intel.com

not_report

In this randconfig build, parent commit doesn't set SERIAL_EARLYCON_RISCV_S=
BI, so drivers/tty/serial/earlycon-riscv-sbi.c is not compiled on parent.

$ diff -u b85ea95d086471afb4ad062012a4d73cd328fa86/.config 18de17edb09f3b79=
853cda40d1a659832e8040ee/.config
--- b85ea95d086471afb4ad062012a4d73cd328fa86/.config    2023-11-16 01:46:46=
.193157134 +0800
+++ 18de17edb09f3b79853cda40d1a659832e8040ee/.config    2023-11-16 01:51:01=
.996525364 +0800
@@ -4340,6 +4340,7 @@
 # Non-8250 serial port support
 #
 CONFIG_SERIAL_AMBA_PL010=3Dm
+CONFIG_SERIAL_EARLYCON_RISCV_SBI=3Dy
 CONFIG_SERIAL_ATMEL=3Dy
 CONFIG_SERIAL_ATMEL_CONSOLE=3Dy
 CONFIG_SERIAL_ATMEL_PDC=3Dy

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Thursday, November 16, 2023 02:39
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [PATCH 1/1] tty/serial: RISC-V SBI earlycon via DBCN extension

::::::=20
:::::: Manual check reason: "fbc 18de17edb09f3b79853cda40d1a659832e8040ee a=
nd parent b85ea95d086471afb4ad062012a4d73cd328fa86 have different kconfig"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231115133127.107575-1-heinrich.schuchardt@canonical.com>
References: <20231115133127.107575-1-heinrich.schuchardt@canonical.com>
TO: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
TO: Paul Walmsley <paul.walmsley@sifive.com>
TO: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Anup Patel <apatel@ventanamicro.com>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: Mayuresh Chitale <mchitale@ventanamicro.com>
CC: Samuel Holland <samuel.holland@sifive.com>
CC: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Hi Heinrich,

kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on tty/tty-next tty/tty-linus linus/master v6.7-rc1 =
next-20231115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heinrich-Schuchardt/=
tty-serial-RISC-V-SBI-earlycon-via-DBCN-extension/20231115-213355
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-=
testing
patch link:    https://lore.kernel.org/r/20231115133127.107575-1-heinrich.s=
chuchardt%40canonical.com
patch subject: [PATCH 1/1] tty/serial: RISC-V SBI earlycon via DBCN extensi=
on
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20231116/=
202311160224.50mmKrMV-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231116/202311160224.50mmKrMV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160224.50mmKrMV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/earlycon-riscv-sbi.c:11:10: fatal error: asm/sbi.h: N=
o such file or directory
      11 | #include <asm/sbi.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +11 drivers/tty/serial/earlycon-riscv-sbi.c

27de1f541f1f91 Anup Patel 2018-12-04 @11  #include <asm/sbi.h>
27de1f541f1f91 Anup Patel 2018-12-04  12 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

