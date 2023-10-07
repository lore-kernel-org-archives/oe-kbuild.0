Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E02EA8
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Oct 2023 01:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GEmkTkoX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696640985; x=1728176985;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=BEGefDBvh/mMMP133XguDVypL3Ham+sZLkF5xpSHnKM=;
  b=GEmkTkoX5RkZUto4kZRy4HwP8m9dd8yGOrOJsBIN2APS6cFWO8VISswF
   c8jApwv1Mzz/Ewa2OnssH2rVyAI4XnNikOYIvZi+HNpNJbL4LDQKatBkc
   IlgdlLBdAl/vMdVgSng388zRyIYmTyGIHQHWVWGC05DxoK/+kSrYhj1cN
   m+QLl3Y9ojpHtTfj5wzbYJMznK07nnd/1dCGaLDyvgzzUldgjvtld9eP1
   bnmIKZHxCfNzhiVvJpn0pL8iRxmiQmiusLdTMsiwc+XDEFAYPhIUM0FdG
   QFXVCmMy68kDbvCdywAz5LoG5flueUvLAhf10RsKD0MuXPU9MROS+EOr0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="364151961"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="364151961"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 18:08:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="746040262"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="746040262"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Oct 2023 18:08:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 18:08:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 18:08:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 18:08:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 18:07:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6vOAYleRbU2e1sOc2mHr6MzDrnRdtxZkZNgvGl9fWY3vGHE+a2rLElo8rv56Nd+P+ixLpvbrMD+K7uNPBRFLGT/Kny0yA8jQD335hotWxu5s5IjSUYpj32wqUAU7xLbCjfB20cSCy/adbHAAzjqfY/MfmlawUu48ytOps4hd70woLEDAGSAA3rgi4zx27Lvy6phbEG2MJz1O2+oMKiCSeFFvxsRISeV+O9xDv8xK0pSRIwF5C6XmLPg3SPco2lHuyuVolewbunyUPh1iwBTYpEhZQ45TJxtJZitfFz9EmjR1l6+FITAFWDcn0WTF9txzQepwKp9YRyxZFzZ8mXYnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFaal9+9MAqhhFe3ex056SiDiQG7oBmtvw4t0l8yMPU=;
 b=D2b4Aubd09xmfQFaXdgJvQJFxvtP9wdzqbYe/5kM2W1VKpHR2NmP7o3wkALhexp7AK+bvs86NZfkzXX17q9VrfRQou1hYA+2bZp3bac3+HRJ6aPlMX6TZwIoHpJ6DMiaCm/XwELBos8iEV0w+lpmbE3vWYWoS5f9jZzIeNvzmU6ZnijtJBBX6DU42WuFCnaBe84vq/dpNBTR+GGXYxHksr5efUI2azPbt0QIEpRc9tp5utfUweyxzcNaM1m3yLGj1/M6ywx3aXu5JcnZxdwEhqaWBiI6sFC/iXpTmzrCWr9QcbNFmRQZTefhKkub02fk10eYvttcNI/S7YsuTT+4Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CH3PR11MB7940.namprd11.prod.outlook.com (2603:10b6:610:130::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.41; Sat, 7 Oct
 2023 01:07:53 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5%7]) with mapi id 15.20.6838.030; Sat, 7 Oct 2023
 01:07:53 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [jirislaby:devel 59/60] arch/x86/kernel/cpu/common.c: asm/ia32.h
 is included more than once.
Thread-Topic: [jirislaby:devel 59/60] arch/x86/kernel/cpu/common.c: asm/ia32.h
 is included more than once.
Thread-Index: AQHZ8lUKm646mWWuKkSnigYLBVI8dLA9j7vg
Date: Sat, 7 Oct 2023 01:07:52 +0000
Message-ID: <CY5PR11MB63923ED97E427B6B4FFFE498FBC8A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202309290535.d6LqYcCu-lkp@intel.com>
In-Reply-To: <202309290535.d6LqYcCu-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CH3PR11MB7940:EE_
x-ms-office365-filtering-correlation-id: 9faad9d1-b3da-4f9a-89ea-08dbc6d1d51d
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +Baf4sgeGiMpnVy7u8UtJTcmeRC1Vfw7uAxVnMHxnbacYAV+3jyiQkHrVJQO3D8Fu2v2magbZATpo5c6+jZYwvrgmkKJLL9q8zOLPTCfiBFy1mFqOksQLLnB/YhVEjQ2fn8BiDPljdTh97+c/rEfMkJPkEY8Nh8kS5ZU7jJn+gaid0GkICAPAsI6irHqYMHIi4ZZfDgwAhOiOcUmY+AhcH20J5D4G9m0ODwIkaZdws8X7QqOExphCxIfOhAN/Ye1LNssRaPC3XPD5gYvbY5LHfg8h6rU4hNEnU1udH+CR0LaQU7H7FVh7cqWuwNdFKnhui2Qd74/f3ss+fFniKpLEpMm63Z1rKBDms7wltKowsoIMVIxKggWKkLtNQu5ZxZM6tSky/jYGsARcEyuos9B7JYqPyK+7ZK8XL7FRkbgOJOiCRA6zFKsZtVo+8JLqCI5NThnb25wIBaJJKtwz2zFDXb1c/H4BJ6u7CB7362um9tfdIFyycRrA1X92TGVDGPi/dNfhiVpc2kVs9wZso1zlOcFNVArxK4VVYb1sDjOePOtzZUqSQDa8DekfWV/FP9Q2dXafvW4KYbRhGARxMVWfT6dJeJE1KTHp5FM527tqLhDSt+2TdlMc1GdZNo681PlFyuMcCoh/PrOmv/eHPy3nA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(39860400002)(376002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(9686003)(7696005)(6506007)(53546011)(478600001)(966005)(71200400001)(83380400001)(2906002)(5660300002)(64756008)(76116006)(66556008)(66476007)(66446008)(66946007)(110136005)(8936002)(52536014)(8676002)(316002)(41300700001)(55016003)(26005)(33656002)(82960400001)(38070700005)(38100700002)(122000001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gbCmC4M+Wi2g2sfHmTBY92PrbZ33xGkes2Zys3DsMgp9SOnhJcZrFsveaROm?=
 =?us-ascii?Q?2CBJgWmrcVCvEwhyIuQsoqMNJWI+2CF1rXf7Zr/h5UDjhmKDWli4iZFUHMdo?=
 =?us-ascii?Q?9p4mElefAxbVmgEGWdOmppBeIM3cIDNUkwkcVSLmCUa+x5jusc8jva0GQ8gZ?=
 =?us-ascii?Q?0AWHww4S633Im1NLWYevucraMbGMPk92GI30lGxRSHgI6cz7D/Mv8cKR8KYM?=
 =?us-ascii?Q?JdPBy37/gBtXPQcjQ8Ncuau1p8emfwfXqTBAz8MEXSAbJC8uwN2qwxJi1zk/?=
 =?us-ascii?Q?VWptx57HhvVhMcnvMtDgmSaEk+Hs/Ugl59pmoJwR99jvcGaNv+HkYC04GFPk?=
 =?us-ascii?Q?CpEMlcCFfLhYstFghXHR3i+ObblarQvJjflsUSgB/IzQxBW7EHN6mXbV6s+G?=
 =?us-ascii?Q?J3Vu68+qMqHNWGhIc5bn1ktmRnpDNpnLf7v6iLqyxv5/pyE9PwV3URNvGExs?=
 =?us-ascii?Q?EB628jBAlmf9SJxK3qhjrTpqppcqKQZt0uzW2YbNHECzS1FC+UOqEz792EOM?=
 =?us-ascii?Q?IgnrYpNEZpqPHQffc//zkQMbRa99EIX2qsL/h348/O7KLV+ZB3m0Liu9cfbN?=
 =?us-ascii?Q?xMwjjNXPd6VQOdgscPML48l6R0xwkO9GBAXXk65iqn9V7tzp7xXyPCskDjKe?=
 =?us-ascii?Q?p94edR79WZbi5ETxAPHqz4nlgvXgStsaRE1UbzL1bcbCK5Mbnxch/7sEaK7L?=
 =?us-ascii?Q?2OyQ74+JT07Jzdf9ebtLfGvSkJWdisD93bC97YNz40pI7xJrr3rJNQUBMgaI?=
 =?us-ascii?Q?doVBQTPgBxOHIZljvBAElLsUKiX8sOJEcMW6nWQ3MqQdCAuAs4mk7p/eJMDD?=
 =?us-ascii?Q?Hg9HJWQgnzXDdlinv+33jV8hT1HHZArAgzJ2K1fZli1XKXb1EMITjpfh9A5n?=
 =?us-ascii?Q?MT1DFv4pGrdjHyePR+KwmPkwB7oatDDyFwS1A9eOLsBSHxbAz471iJu1Laqr?=
 =?us-ascii?Q?z2aOw1DNFMMYFFvvJMCw2crMLjhFX0ZsGXdLwyDWlsae32Tr45yo9/H4xpqV?=
 =?us-ascii?Q?S9t1FqkJI3V8QVuZ36ytnoDZKc5lk1SFETi8H1x0vBl4LhDQupkPAYOEfRfO?=
 =?us-ascii?Q?AsyAkhxSSLetq3ZXlcfDlb/K625P+1BXA+8UfREVEuJUs9s+UBxawVUAEp5y?=
 =?us-ascii?Q?VXuVmzzYyh9G0gyfsSCLBgugL3aYFDI+JbKJ9/eSQa5kOWn4Nr28qh7c8vpC?=
 =?us-ascii?Q?QPNLayKLJw8ldwT7DhL+HZ5pp8VXb+vZ5YMc4UzQcd1nmlgMtwTztFXJ0Tt0?=
 =?us-ascii?Q?RfCuUFiC7CYBKQghsMWDbw/VKxuV+lvHYhbwgVhbElgl+YL90SMv9URDcuNH?=
 =?us-ascii?Q?kGUU/3z9jen1HafzwOC3GATMd/1l35XAhMTSynTY2UwyH4f4n3zi/aVGgqG9?=
 =?us-ascii?Q?8aYgeJn/7dawLiya1udz0oUrP+iCjXjFIqg/GsSA0kEvvBsTyiKciUuvqm9V?=
 =?us-ascii?Q?JGvSHJ7cpnOYhHl/Edl0fWh0GewAfpEdWwP9aZKEtyh0dzw2apuaNpmTx2OR?=
 =?us-ascii?Q?BFRegaQJ16tFL+S6DWWpYkcjPEZ5HVv/nwavqmJUQ+19VqWIeKk+03iUnsf1?=
 =?us-ascii?Q?eckX8nSpHgXlHrVlEEG7e1jNk5AeEe0wHYsAVyCB?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9faad9d1-b3da-4f9a-89ea-08dbc6d1d51d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2023 01:07:52.8674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R3jgM+bGiGBu7EaZUUbzKH4Bgv3haw/fBVqQ0tWk5zm5sUOBLjyz+Iud9ZRMvgLPkcdEaF9ewb9lRIR5XDIgSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7940
X-OriginatorOrg: intel.com

not_report "intentional duplicate include"

This commit only has one line of code change, which is adding a duplicate l=
ine of header file. Looks like it was done on purpose.

commit 708eb744b1edaa9c5fca8f9a2d59293b8959e9dd
Author: Nikolay Borisov <nik.borisov@suse.com>
Date:   Tue Jun 20 14:53:26 2023 +0300

    x86/entry: Make IA32 syscalls' availability depend on ia32_enabled()

    Another major aspect of supporting running of 32bit processes is the
    ability to access 32bit syscalls. Such syscalls can be invoked by
    using the legacy int 0x80 handler and  sysenter/syscall instructions.

    If IA32 emulation is disabled ensure that each of those 3 distinct
    mechanisms are also disabled. For int 0x80 a #GP exception would be
    generated since the respective descriptor is not going to be loaded at
    all. Invoking sysenter will also result in a #GP since IA32_SYSENTER_CS
    contains an invalid segment. Finally, syscall instruction cannot really
    be disabled so it's configured to execute a minimal handler.

    Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
    Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index afa755e06ae96..3f1b3e000a8dc 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -64,6 +64,7 @@
 #include <asm/uv/uv.h>
 #include <asm/ia32.h>
 #include <asm/set_memory.h>
+#include <asm/ia32.h>
 #include <asm/traps.h>
 #include <asm/sev.h>

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Friday, September 29, 2023 05:43
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [jirislaby:devel 59/60] arch/x86/kernel/cpu/common.c: asm/ia32.h i=
s included more than once.

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nikolay Borisov <nik.borisov@suse.com>
CC: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git=
 devel
head:   f0b9af5cd227a9275843be23ecfed63be10a7abb
commit: 708eb744b1edaa9c5fca8f9a2d59293b8959e9dd [59/60] x86/entry: Make IA=
32 syscalls' availability depend on ia32_enabled()
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230929/202309290535.d=
6LqYcCu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309290535.d6LqYcCu-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/common.c: asm/ia32.h is included more than once.

vim +65 arch/x86/kernel/cpu/common.c

    29=09
    30	#include <asm/alternative.h>
    31	#include <asm/cmdline.h>
    32	#include <asm/perf_event.h>
    33	#include <asm/mmu_context.h>
    34	#include <asm/doublefault.h>
    35	#include <asm/archrandom.h>
    36	#include <asm/hypervisor.h>
    37	#include <asm/processor.h>
    38	#include <asm/tlbflush.h>
    39	#include <asm/debugreg.h>
    40	#include <asm/sections.h>
    41	#include <asm/vsyscall.h>
    42	#include <linux/topology.h>
    43	#include <linux/cpumask.h>
    44	#include <linux/atomic.h>
    45	#include <asm/proto.h>
    46	#include <asm/setup.h>
    47	#include <asm/apic.h>
    48	#include <asm/desc.h>
    49	#include <asm/fpu/api.h>
    50	#include <asm/mtrr.h>
    51	#include <asm/hwcap2.h>
    52	#include <linux/numa.h>
    53	#include <asm/numa.h>
    54	#include <asm/asm.h>
    55	#include <asm/bugs.h>
    56	#include <asm/cpu.h>
    57	#include <asm/mce.h>
    58	#include <asm/msr.h>
    59	#include <asm/cacheinfo.h>
    60	#include <asm/memtype.h>
    61	#include <asm/microcode.h>
    62	#include <asm/intel-family.h>
    63	#include <asm/cpu_device_id.h>
    64	#include <asm/uv/uv.h>
  > 65	#include <asm/ia32.h>
    66	#include <asm/set_memory.h>
  > 67	#include <asm/ia32.h>
    68	#include <asm/traps.h>
    69	#include <asm/sev.h>
    70=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

