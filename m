Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6996EA1
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Aug 2023 01:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693360044; x=1724896044;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=vgFhcrpaY8bD9b250bBGvlEl08Sh/EdUIYHK5ZqtVn8=;
  b=DDibpfqwrpDGEK6njsnIRXy8smE39+ydc57022pLzt0Nlh3zQlw/78hA
   Qgwhz5dp2jyvtsG/Qx/yfR7OEMjTBIbkYY+aLZtLRyV+y6EnehAEHfQjz
   dRodzedW2WAR0Jw4+cbyqi8+YnWmnopgqedUdW8oD3shQro0rPkxprsAA
   aLU0LUcrIWiFlU/6e5tkzLoFdhstTi2rm3fdpi8m5F72awXbHx5G7apfP
   PIePjxepDfsWCbyfb7QmVqemo40qOdCYAUVBeLA9GifvLEGudPJ26JldN
   wQzlgH3m3dTh2Rx37/ofnU8VLKOFNNHgvhc8JXVOWJefJQWDx2hCBBAoa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="406521026"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="406521026"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 18:47:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688712406"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="688712406"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 18:47:23 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 18:47:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 18:47:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 18:47:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLKTzbWxyc70kNYAJzp4UHmFb4xUDuB7JkgzDq/MJiVkPjuzqTL7X+BNdighbyAXIW9UjuuAeMW3w9BXQBpV681bM1e0xOXSMGHkdSSC3i4n/imyqy50tLkbQqoqIHPRNpYxGVhCr0YHJYdTFRbVSOaNWUI6BWKXEwpZAP9ypzhuXgz0x+3zj7vuc299QI6YIAwEHTRorDwy8/W5eWXkvRT8U0G+4pANDZM0TxwchGRX3nMg7vhVRbShG5QMadcW4ZGL0c7yCRjqqevPvE+lpFWPIw9W1tdo17ZYZhYOSn4kWixJbjpK+4NRQlK3Vys/4V7pKFScAU/URwTRRqmG3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFjA7Tl7NGStNGmKTMImEu0SixedaQK9SWmx6/Ru47o=;
 b=f2ObT6xORmkjyIcC+1ldlt2QfHQ4cf2xgZ9RsgkhWBTmf+U4mEjRdk65S4JMwQqykNcPdq4c36UkbCv1bBCDZ4g6GM+Y4KWy9u1ezp9xBCA5SVVM6w3Nax8RN0bSXm38RJDEE2XAO7p9Vq9U2uU0EHH7POB+iVr36cf07+KkZcuxHYEnw+Kkd9eGOsq6G4nCloGGFtWwD34oa848LffB0L+cUjreiV3Qge8k3O9lKLLlfQzhFNtuLrJyBYar29H62RUqODJ4/33Xn/lshpf694EFsBXFgRm6GvXlCVd+yxaXgDaQN8+gEsKErG1LZ91gTRb/oWW38FW0oV+p/qOhbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.36; Wed, 30 Aug
 2023 01:47:16 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5%7]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 01:47:15 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [RFC PATCH 3/3] coresight: Support exclude_guest with Feat_TRF
 and nVHE
Thread-Topic: [RFC PATCH 3/3] coresight: Support exclude_guest with Feat_TRF
 and nVHE
Thread-Index: AQHZxuAPqxQvmidYh0+wsg4DNmOVxLACOXfA
Date: Wed, 30 Aug 2023 01:47:15 +0000
Message-ID: <CY5PR11MB63921B0721C449B477B954EAFBE6A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202308042234.Hf2qD7O9-lkp@intel.com>
In-Reply-To: <202308042234.Hf2qD7O9-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SA2PR11MB4875:EE_
x-ms-office365-filtering-correlation-id: cf3a2b44-1013-4b6e-1633-08dba8fb09d7
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mvn79Lo0AKpzoqDTGZTaR2U8nYBfbBi3xQqWdiCGnZneTpkoLcaWdSSbvck0KY39nmng153/iE4HjuwKj9BvNk9OvMsuAV7jO1argmN5MKBCsJZrRSoP5+MYtxDIcqqWckmBEfe3hCTR64LO3jD4XpvYieom8PxBSTPYO0IHPX5cVjPezpH/+0IjTuShBs8bgbj6yxf9NjpsBVECz3+vTDgZ1SEiG+n/eON/4ya07D4gXEluzWUtxH4Vn8Y3albgBjCe5WhT0ucsnNzxvm5QBY75JIU+cY+q1e7lhPL5RME5jmSNP3j0s2xTI1fOPRlZJvNZeY4zYQbpVvUu8dnFCZgDhgvBFgsnmgjo3y2UNzyWUS1er+CT06DndhOc7Ri6x5elcqmZ5aKCnGUEzCqpSWZBo7Q+sTUXd8TRERbFeaakSvAV8DkXXF83xBD3zsTyhl5eeLnDk5M7SACMVFEEEE6SHBlM2gB+UqHGAhHDs7qCx97blEP1I1jkO7HgWXxGcTllakzQz/SVabCYX/vcah84X3L9MwDWIkeliwZ6Gsq41PQhCPrbpNiHMZnasKkWgX8ezF4AgBEg7W+NgQlDXAUubxYxKVNbayAWVLBKPP4KGoTg4jNMGAvnwog0JyP38way0nacK9fyNbAqoIyt6A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199024)(1800799009)(186009)(9686003)(38100700002)(38070700005)(316002)(41300700001)(82960400001)(33656002)(2906002)(83380400001)(86362001)(52536014)(55016003)(26005)(8676002)(5660300002)(8936002)(71200400001)(66946007)(6506007)(7696005)(66556008)(966005)(66446008)(64756008)(66476007)(53546011)(110136005)(76116006)(478600001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OQrUr45Tx2GIAzQkdGqvX8icORvDbOLrMKXilHGCVxaSLdlFcGKaUNnhoFeE?=
 =?us-ascii?Q?uw25zfJODNdSNFPmZ9rmBvPlGn4L4Vncat4LqbkHg4yroc4nxm4Zkq2dpFfb?=
 =?us-ascii?Q?2yIeEE8oCVuDiMBo3HPNyycCz3eQ3kUtDidhIVNgYG4nAojHQ5NZfSsB3d4a?=
 =?us-ascii?Q?6FyKCDSxfA+13VCeojw+eqXdgwBEB5KjaSHR1oNvHe888EThwpjuXaXssCB7?=
 =?us-ascii?Q?Yz/uvpCbloLXFs+CvamL+GWXP6GklNhsvDAxmqB9i2/cSIQT430D8H3hGXZH?=
 =?us-ascii?Q?4dFJ4qGdNG+h9HRNFiW5CzBZFdk+v7ej+w59kk3wEX6tp2K2cxm0xOhm42XU?=
 =?us-ascii?Q?gpnXPwKeUPhxsVFzXrjPbYTY6cCzEb7234RYNGCCl/3MFoBnKJrO0QtJLO1K?=
 =?us-ascii?Q?DvMtGJ2MmNrKCzDInB5EySfGfil7ppCSYNKJFQJaxKOnFdIg/OOBT2m8jdaG?=
 =?us-ascii?Q?gDTi8hTL3LcCYnZ8pad2li7K1otjdv6sZlD+rFScaK6YeM954Uf53s25Ck++?=
 =?us-ascii?Q?b0y6LSVYgBVxWOC5gVVyMl8cosJAsBdbmD2CkIHLiqiGhKHRN8tmP9b+hIoR?=
 =?us-ascii?Q?dYYh1APrk+Pz4GHrS5kW8D7uEH2EifpaR/yFd6Kfbz882A4wsjbFwXCzIJga?=
 =?us-ascii?Q?v6NBKu+dqydot8XZWYy0mmXwc/m/nKK/tmKqGKEmqRVe0oZNPGutzJeu/lDf?=
 =?us-ascii?Q?OWerO1TdmXQ4Ppyoa79Mfor/XpelPc/LYYcKWfFpHI8dDqDQ+0M2w5qc3+ww?=
 =?us-ascii?Q?3syRLJoWIUxeSctboSkaAGGbot2pTm6790Po4gCRtHJ3tr2sDtybvCtmONnm?=
 =?us-ascii?Q?XbtmgKRAMWocGV7F3TEg4nubqQ/Y2nU/y73KoYCej6xhjz6o3bR6h8GYA0+6?=
 =?us-ascii?Q?dkmuCX5VI/46mWKhqrqVsAfHLBBxXrHfUzvTBCtibFtq0AR55RMs5QSbe8/p?=
 =?us-ascii?Q?JcQ4aHFwmczTOXob2zrf3LBKaX2BueKw43fkGy5lTjdYfzDWoMq7dBntUwFM?=
 =?us-ascii?Q?CFfkjk3MpzbK1rKG96V8JhtheBZrVgNzVMfkE0+T8VU9D8Ck3xbzhIlH+lGb?=
 =?us-ascii?Q?yE8MHTXhAl8n815lOj0wQV7bFTb9DpNVhoeOtmZD2EbCD2E0FOb0woxnQQie?=
 =?us-ascii?Q?7qScN/ZryZ57fahLifDvA+8vUbrgy9vJTPfD7b9bcDTWH3vlj+zW9Qdul1GW?=
 =?us-ascii?Q?9A/TqocPyRIcz/N/r/9wRiwIwM4sgz+VvzZhjwiW05znAIiqjro9y8LtOCd/?=
 =?us-ascii?Q?8UQRvo5/sXXWnRu/ZpFl8LM0bIkKIYkaGhYjpcDZ+3F2QDMpR/HzA75/4F3S?=
 =?us-ascii?Q?Q0ooL0FOQEgcclbBNVBEXx8G0Z/m14gAqBe8xo6TCKEPnsJPi1LqTr52dHsX?=
 =?us-ascii?Q?JLyjeag5HER4j50gt4TrAitQx+dNMI2+USlPlTjiB25xrjoQvQ6czG/sn5f4?=
 =?us-ascii?Q?CAgWSDh1JJ77YJPaYthI7m7Z4VUbsxK4vX9Urt4OL3Mk7NhK3KFDeBEAmXIB?=
 =?us-ascii?Q?c6KZHycYyFbxXnYD0jexwb5sVnZE/XpFVERY5zdIs66KamocZtUkw7/EnI0X?=
 =?us-ascii?Q?Gtqn0RL/7DabWLBVqnp4h0R7WlEJCgffhqQS5DhA?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3a2b44-1013-4b6e-1633-08dba8fb09d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2023 01:47:15.8088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BiwdKNV+1/TI3RgrEslgnBQ/jCkEY6NZFMXXudYMl6fg0oO2OjUnNkbaNXuClQp9a4DqoE8t5kUaGlDKH4Rs1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4875
X-OriginatorOrg: intel.com

not_report 'the patchset in the link is not a prerequisite patch'

Currently with nVHE you would always get trace from guests, and
filtering out isn't possible without this patchset. In comparison, with
VHE guests, they never generate guest trace without [1]. I think the
existence of trace rather than lack of could suggest that this change is
less useful than [1]. Also the restricted set of hardware that it works
on supports that too.

[1]: https://lore.kernel.org/linux-arm-kernel/20230804085219.260790-3-james=
.clark@arm.com/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Friday, August 4, 2023 22:27
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [RFC PATCH 3/3] coresight: Support exclude_guest with Feat_TRF=
 and nVHE

::::::=20
:::::: Manual check reason: "git am base is a link in commit message"
::::::=20

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230804101317.460697-4-james.clark@arm.com>
References: <20230804101317.460697-4-james.clark@arm.com>
TO: James Clark <james.clark@arm.com>

Hi James,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on kvmarm/next]
[also build test ERROR on arm64/for-next/core soc/for-next linus/master v6.=
5-rc4 next-20230804]
[cannot apply to arm/for-next arm/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Clark/arm64-KV=
M-Add-support-for-exclude_guest-and-exclude_host-for-ETM/20230804-181613
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git n=
ext
patch link:    https://lore.kernel.org/r/20230804101317.460697-4-james.clar=
k%40arm.com
patch subject: [RFC PATCH 3/3] coresight: Support exclude_guest with Feat_T=
RF and nVHE
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: arm-randconfig-r004-20230731 (https://download.01.org/0day-ci/archi=
ve/20230804/202308042234.Hf2qD7O9-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8d=
fdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308042234.H=
f2qD7O9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308042234.Hf2qD7O9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwtracing/coresight/coresight-etm-perf.c:1=
2:
   In file included from include/linux/kvm_host.h:40:
>> include/uapi/linux/kvm.h:15:10: fatal error: 'asm/kvm.h' file not found
   #include <asm/kvm.h>
            ^~~~~~~~~~~
   1 error generated.


vim +15 include/uapi/linux/kvm.h

6aa8b732ca01c3d include/linux/kvm.h      Avi Kivity             2006-12-10 =
  4 =20
6aa8b732ca01c3d include/linux/kvm.h      Avi Kivity             2006-12-10 =
  5  /*
6aa8b732ca01c3d include/linux/kvm.h      Avi Kivity             2006-12-10 =
  6   * Userspace interface for /dev/kvm - kernel based virtual machine
6aa8b732ca01c3d include/linux/kvm.h      Avi Kivity             2006-12-10 =
  7   *
dea8caee7b6971a include/linux/kvm.h      Rusty Russell          2007-07-17 =
  8   * Note: you must update KVM_API_VERSION if you change this interface.
6aa8b732ca01c3d include/linux/kvm.h      Avi Kivity             2006-12-10 =
  9   */
6aa8b732ca01c3d include/linux/kvm.h      Avi Kivity             2006-12-10 =
 10 =20
fb1070d18edb37d include/uapi/linux/kvm.h Joe Richey             2021-05-21 =
 11  #include <linux/const.h>
00bfddaf7f68a65 include/linux/kvm.h      Jaswinder Singh Rajput 2009-01-15 =
 12  #include <linux/types.h>
97646202bc3f190 include/linux/kvm.h      Christian Borntraeger  2008-03-12 =
 13  #include <linux/compiler.h>
6aa8b732ca01c3d include/linux/kvm.h      Avi Kivity             2006-12-10 =
 14  #include <linux/ioctl.h>
f6a40e3bdf5fe0a include/linux/kvm.h      Jerone Young           2007-11-19 =
@15  #include <asm/kvm.h>
6aa8b732ca01c3d include/linux/kvm.h      Avi Kivity             2006-12-10 =
 16 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

