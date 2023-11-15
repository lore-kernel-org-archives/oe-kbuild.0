Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989417E
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 09:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8w9MXg4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700039196; x=1731575196;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=X4DwmkBJh1mEoj9Ft98fTqume5nN/Ir224dZ7jD4Zkg=;
  b=O8w9MXg4swRa3oZrqGY0P9vfhSKc4nLdtgB5jF1evxkUb1HSYmNaBbVD
   5bcB6qWVTPdPfArpBolGBbik4cNZewBSN5EYgXLHO5/znvg60e4zVGiN9
   DFACOrSXxK1LzL0aD1jtGRcN5pohDvwPrfSGDCCdDXCEy8IAHKuYtqH+C
   uGvQXFkeaKWLr5gY64ukUe4GntqFczztPOuRjGqECjNmcocp4J1Mko3ub
   +4+QZUHCHnNCE17FFrn6U1xyApxROdMcoyOtnUJWc2tANk5rQ1ZQzzcLw
   j6Eh1OdkTmld/0YQi+84KLtmrrHV75qrVLmYGj3u8g15+8BWx8dYc/SqU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="421938342"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="421938342"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 01:06:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="1096398151"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="1096398151"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Nov 2023 01:06:35 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 01:06:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 01:06:34 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 01:06:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Do4e1Be9dw1zM+wPJbhvrnsoBuNi2JPmysM+/Y/NZVvigL3gjU5fS8xyn4LUK22gjYrDGwy6CEl3oJSmPokkySmixJFeLi0yGBer+UpV8NkZFXdnfhb6IAGU2dVt/E5kzssH/XQUtSvMF/TC4o0qCOPFjX8rc28tkciUyARtGJRl1eEFKV2B/OERBslQSoIwT/8vJHmPbyqgvvqxVxD4NDJj6JfYg9HVTmaf9hMfsKbVMcZUKOTNkZL87+j1/HfuBZqNNwiOsxk9E8kwRE0lEc/35PyZFeO0n9vIjJnUZZHAWLtlD1NJgt8tbSYG5GAjh3FgGy9TdQ85LRk5oiP0Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwnqKH//Owbamcf3HUUJVPItw1hiiQB3l2DGH0t463k=;
 b=FQdefpAztdGaQcJ2vkLjvoA5C1bRO7IJWBo/DoA7uxekTWKSHTPOH9oLaln5m3YcwhxN6wrBXhf+44Swrjr9kk4DVKPvIDj7XPK4hc0vB9gzJPP6XvmkpsjTACm14MRudywIpyzfCfboEkEph+E6nYf35SgM6SFn78X+mNFTVsV4bglDG1xzx9HiOUoK6G1uUZYTIgiowCtsDEiOzCMjk6gtyR2+tPcCK88CKu7DwLiRyODRUV+gIq0VpscxnEippAYVygzxgh8htHfra/9ukpEYC1h2YFhWHLUvZi3gsqA4YZxBDuKHn82Dytk+fHoL+Wl0latJhiKfHk2i+AZYpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CY5PR11MB6511.namprd11.prod.outlook.com (2603:10b6:930:41::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 09:06:32 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Wed, 15 Nov 2023
 09:06:32 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Thread-Topic: drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Thread-Index: AQHaF0390fDmda4twU6hhkQuQYq4nLB7FV2w
Date: Wed, 15 Nov 2023 09:06:32 +0000
Message-ID: <CY5PR11MB639224275AB5063B5CE8B0C7FBB1A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311150658.bxA1xL20-lkp@intel.com>
In-Reply-To: <202311150658.bxA1xL20-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CY5PR11MB6511:EE_
x-ms-office365-filtering-correlation-id: 813b794a-5c9d-41cd-1be0-08dbe5ba2980
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4sONs2mt6MyOokzDtLW5UY+37sM2BnFzg9V7Dxd0Du+g81n3f8T2gU/LijLQZYk97do+doCUPBQr+NokfBofhQR7EOljybLTcVOy7s4dUNVeby41tBpty01fAGOJFtNUHT/6/CszjVnE0kqnT8aes28IEgrnHnoEEHHHjpCXsKMsFuGRv3UzlqDGiIfLMOFZtv+leXZQ2/pSHM2yOzRmc0BqC4ETj7BJFunbOV20cbihsmkTjOPy9m+OXYCKy0BfPqG+h/MFV2lnzQm/jL6DtKK3K22l4i5UJwuYFVdCiA5o1fG31dWO2bW/CNV7wyvfbHLNZaES5smPaocWHfosFgmjbH91I034w091x7n+o0cp0vGG4BQICQyAZEScmCAyH97Cvv6xG8bJYGiCNuZxo9a2/U9Qt5xNLfZmlYipGrDt7ROkZLSsJa9Xl6N6uL6NS1t1TbzsKmUtnUj2wPfhWXSmyEYlQbZ2vYxo0dRhqwEVmajzz8JCLPXIPSf91kNxjUA+BQScmwLdW/BwDXduvCTo/LvkAPg++QSBGOof+KF3VMcQPxgb9beJ27wKR7VFiS5+/Q7r0mdWpwsqZJyh/FDVbltWFvNc5OvmbrwNyswf9rWD67ybm0sEWfDz1RESrMYr7syCCDEMiy3y7CqT5lDQv+5+r/PP+ukfpdDx9YvugfDtFxQaq7FBZPYqKCMJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(39860400002)(346002)(230922051799003)(230273577357003)(230173577357003)(451199024)(1800799009)(186009)(64100799003)(9686003)(53546011)(71200400001)(6506007)(7696005)(4001150100001)(38070700009)(26005)(316002)(64756008)(66946007)(110136005)(66476007)(66556008)(8676002)(8936002)(76116006)(66446008)(52536014)(478600001)(83380400001)(966005)(2906002)(5660300002)(55016003)(122000001)(33656002)(82960400001)(86362001)(41300700001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XU/jEiAf+cw5nDADcuU9GQSsqfqeyYOv18wpUDj8DJ5PwRrl/bCEYTtcdIMz?=
 =?us-ascii?Q?pUpCc/fZAsqo9R+UwU1P9gwHw/L2fd4lkov1fcPv/W0eHc5y+r3nNRQg9t7w?=
 =?us-ascii?Q?oj5VxssRLVOkj1xFFV97EQ1Q6C7MmGlABtBIRJLElEVrvcEQyfRoLtBWQypP?=
 =?us-ascii?Q?nttig8GQyNCC+gGwVc8lBKra3SCigG14wfW2xbsLM4s9XMG1R9GNkPz2raIS?=
 =?us-ascii?Q?UQ/dhxbPBqksTItvebVcD3XR5qTttuPxQoA7EreEUMzCJO1F2v6m6mMY+JHf?=
 =?us-ascii?Q?zgtaKxCQTbZ6wpZ23uBf3YVmdBfhRzL76OqMHaR3I2zwGSfZ/gOl7GI+weHT?=
 =?us-ascii?Q?g+WKEJp2cmL0pLk6rzE3OlKIOUzIQJrNww/Hv+vt7vvG86eWgyy75kF09RJd?=
 =?us-ascii?Q?IIx5TBGh2CIX9VcHxN2WmS9Axxo+mBloiaD9KlpkVkz1bXqC9YF7zZD6PGD4?=
 =?us-ascii?Q?H7LfJHBWcjKZFFfs9GLG3p7nzmj7xRj4WIa6fconKEF5iF34xqsROTOnpw7F?=
 =?us-ascii?Q?FaQ/O7ItzBN7FhsL3/a9GBkFn5c1FUlnNSrPBxAogWhV/pDbjhi/KS182wva?=
 =?us-ascii?Q?m/dL/qWAB1+aQ0nW28BX/VQwJhKriUQt0rhsM4tRgMZtb7JpCfYmT5a6OgqI?=
 =?us-ascii?Q?fta8PFL12fTFf9Zmgd+Srm7pDS5Ckd1goVregIQ7Q1ruNTq6lsDF/ro2DYy1?=
 =?us-ascii?Q?13d67KerSEhedNQn2DctcP2t7lHcx/UF9NZj9rMLBkqkc1y/0LIfPN1G121q?=
 =?us-ascii?Q?iOyP64LNwLlaj3VzXsxq5sqmtgP09NcbKMumONO2gXGsj5+EFl39/BPXpT7m?=
 =?us-ascii?Q?/rowXRjcja7eTUuRmwj0Z8YaOChF3ff3ot+CmPawkrbcVrvJ2OwuO4LczZCR?=
 =?us-ascii?Q?e6GZk9fsx6tbJ66GEDuqAaEfYa787Wuu2fPiBIKB3MynTzOvh+aZW0fKTMXv?=
 =?us-ascii?Q?8bTZqShV6hiK+StGN8ca7twl3eC808pFcscJpyocQAhQC4t6Oc4mrnE0eIQ5?=
 =?us-ascii?Q?JtjPqeLnMm2WR+wicpudyBX/0xT0rDxTshdtu7R3gbfyCHOBpEnQ6qfo5rJb?=
 =?us-ascii?Q?L4MiVZOwR7/pi0TdE1ZPRj460Ivyio2bOsAQT6yFQLuW1bBvqucAex6ydbmr?=
 =?us-ascii?Q?1AHJaHClAde0tgeg7ky7J3sOqiZymnX11GxvvmhfWsbN6SKLgoTLGY/E7rmU?=
 =?us-ascii?Q?UGmZ3bodDXXUI8gLS6qpzkf9VUynslaBij9v6y0XvirBTHMERuHIUadBp5oW?=
 =?us-ascii?Q?mPZPgRkH+BrO3hDPyeNk+rwfHKNEV/RjbMQfxVB/A9s8oUgCbYo6yQChPdIh?=
 =?us-ascii?Q?nEsUHainu/i+BPFfd19Drs2C7j3yvl/6FKbfPdMa1/ODd0WFfZatQgfEpkmM?=
 =?us-ascii?Q?6rs4/yBRUqI2ryZo/qTsKPAxihAim9YvPe23fqkhfx3iyusmYEG1RYYG5vdE?=
 =?us-ascii?Q?EoKwfkCOZ4XQrA9nRvWFhU00OGIIy58cEphFT2NY7f/zfcPzKpMT+crbbgZ+?=
 =?us-ascii?Q?aB4d+JsoInDWunlHql3rexV9yisR5HNiZiw1N570fVOAACfT5QU9zcJUBdC9?=
 =?us-ascii?Q?rkm4OtVfvtip5gTEYa+c8WHSE2dXQJqOI3DTrnc+?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 813b794a-5c9d-41cd-1be0-08dbe5ba2980
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 09:06:32.5659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qv5Cq3+bBdj8gLBu14QssNfmf3WWPt2zllzWmTWpOOfVhcvfueQkAr9mHgli4i1dtSmxOBCFu1O+0B9dr0YN6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6511
X-OriginatorOrg: intel.com

not_report

parent and FBC has one config diff that exactly controls the build of relat=
ed files:

$diff -u .config.old .config
--- .config.old 2023-11-15 06:56:24.000000000 +0800
+++ .config     2023-11-15 16:57:55.009696453 +0800
@@ -5291,7 +5291,6 @@
 CONFIG_ALIBABA_UNCORE_DRW_PMU=3Dy
 CONFIG_HNS3_PMU=3Dy
 CONFIG_MARVELL_CN10K_DDR_PMU=3Dy
-CONFIG_ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU=3Dy
 CONFIG_MESON_DDR_PMU=3Dy
 # end of Performance monitor support

obj-$(CONFIG_ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU) +=3D arm_cspmu_module.o
arm_cspmu_module-y :=3D arm_cspmu.o nvidia_cspmu.o

On parent, there is a build error:

$make CROSS_COMPILE=3Dloongarch64-linux- C=3D1 CF=3D'-fdiagnostic-prefix -D=
__CHECK_ENDIAN__' ARCH=3Dloongarch drivers/perf/arm_cspmu/arm_cspmu.o
  SYNC    include/config/auto.conf
  CALL    scripts/checksyscalls.sh
  CC      drivers/perf/arm_cspmu/arm_cspmu.o
drivers/perf/arm_cspmu/arm_cspmu.c: In function 'arm_cspmu_get_cpus':
drivers/perf/arm_cspmu/arm_cspmu.c:1116:29: error: implicit declaration of =
function 'get_acpi_id_for_cpu' [-Werror=3Dimplicit-function-declaration]
 1116 |                             get_acpi_id_for_cpu(cpu)) {
      |                             ^~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[3]: *** [scripts/Makefile.build:252: drivers/perf/arm_cspmu/arm_cspmu.=
o] Error 1
make[2]: *** [scripts/Makefile.build:494: drivers/perf] Error 2
make[1]: *** [scripts/Makefile.build:494: drivers] Error 2
make: *** [Makefile:2026: .] Error 2

On FBC, the build error is gone, and exposes the sparse warnings:

  CC      drivers/perf/arm_cspmu/arm_cspmu.o
  CHECK   drivers/perf/arm_cspmu/arm_cspmu.c
drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@     expected void *ptr @@     got=
 unsigned int [noderef] __percpu * @@
drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     expected void *ptr
drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     got unsigned int [nod=
eref] __percpu *
drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@     expected void *ptr @@     got=
 unsigned int [noderef] __percpu * @@

So these sparse warnings are not caused by this commit.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Wednesday, November 15, 2023 06:56
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse: sparse: incorrec=
t type in argument 1 (different address spaces)

::::::=20
:::::: Manual check reason: "has kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Robin Murphy <robin.murphy@arm.com>
CC: Will Deacon <will@kernel.org>
CC: Ilkka Koskinen <ilkka@os.amperecomputing.com>

Hi Robin,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9bacdd8996c77c42ca004440be610692275ff9d0
commit: f9bd34e3753ea8f1433a3ba70f03a165a1416f98 perf/arm_cspmu: Clean up A=
CPI dependency
date:   5 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r133-20231107 (https://download.01.org/0day-ci=
/archive/20231115/202311150658.bxA1xL20-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231115/202311150658.b=
xA1xL20-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311150658.bxA1xL20-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse: sparse: incorrect type=
 in argument 1 (different address spaces) @@     expected void *ptr @@     =
got unsigned int [noderef] __percpu * @@
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     expected void *ptr
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     got unsigned int [=
noderef] __percpu *
>> drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse: sparse: incorrect type=
 in argument 1 (different address spaces) @@     expected void *ptr @@     =
got unsigned int [noderef] __percpu * @@
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     expected void *ptr
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     got unsigned int [=
noderef] __percpu *
>> drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse: sparse: incorrect type=
 in argument 1 (different address spaces) @@     expected void *ptr @@     =
got unsigned int [noderef] __percpu * @@
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     expected void *ptr
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     got unsigned int [=
noderef] __percpu *
>> drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse: sparse: incorrect type=
 in argument 1 (different address spaces) @@     expected void *ptr @@     =
got unsigned int [noderef] __percpu * @@
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     expected void *ptr
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     got unsigned int [=
noderef] __percpu *
>> drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse: sparse: incorrect type=
 in argument 1 (different address spaces) @@     expected void *ptr @@     =
got int [noderef] __percpu * @@
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     expected void *ptr
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     got int [noderef] =
__percpu *
>> drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse: sparse: incorrect type=
 in argument 1 (different address spaces) @@     expected void *ptr @@     =
got int [noderef] __percpu * @@
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     expected void *ptr
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     got int [noderef] =
__percpu *
>> drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse: sparse: incorrect type=
 in argument 1 (different address spaces) @@     expected void *ptr @@     =
got int [noderef] __percpu * @@
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     expected void *ptr
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     got int [noderef] =
__percpu *
>> drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse: sparse: incorrect type=
 in argument 1 (different address spaces) @@     expected void *ptr @@     =
got int [noderef] __percpu * @@
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     expected void *ptr
   drivers/perf/arm_cspmu/arm_cspmu.c:627:9: sparse:     got int [noderef] =
__percpu *

vim +627 drivers/perf/arm_cspmu/arm_cspmu.c

e37dfd65731dc4 Besar Wicaksono 2022-11-11  609 =20
e37dfd65731dc4 Besar Wicaksono 2022-11-11  610  /*
e37dfd65731dc4 Besar Wicaksono 2022-11-11  611   * Make sure the group of e=
vents can be scheduled at once
e37dfd65731dc4 Besar Wicaksono 2022-11-11  612   * on the PMU.
e37dfd65731dc4 Besar Wicaksono 2022-11-11  613   */
e37dfd65731dc4 Besar Wicaksono 2022-11-11  614  static bool arm_cspmu_valid=
ate_group(struct perf_event *event)
e37dfd65731dc4 Besar Wicaksono 2022-11-11  615  {
e37dfd65731dc4 Besar Wicaksono 2022-11-11  616  	struct perf_event *sibling=
, *leader =3D event->group_leader;
e37dfd65731dc4 Besar Wicaksono 2022-11-11  617  	struct arm_cspmu_hw_events=
 fake_hw_events;
e37dfd65731dc4 Besar Wicaksono 2022-11-11  618 =20
e37dfd65731dc4 Besar Wicaksono 2022-11-11  619  	if (event->group_leader =
=3D=3D event)
e37dfd65731dc4 Besar Wicaksono 2022-11-11  620  		return true;
e37dfd65731dc4 Besar Wicaksono 2022-11-11  621 =20
e37dfd65731dc4 Besar Wicaksono 2022-11-11  622  	memset(&fake_hw_events, 0,=
 sizeof(fake_hw_events));
e37dfd65731dc4 Besar Wicaksono 2022-11-11  623 =20
e37dfd65731dc4 Besar Wicaksono 2022-11-11  624  	if (!arm_cspmu_validate_ev=
ent(event->pmu, &fake_hw_events, leader))
e37dfd65731dc4 Besar Wicaksono 2022-11-11  625  		return false;
e37dfd65731dc4 Besar Wicaksono 2022-11-11  626 =20
e37dfd65731dc4 Besar Wicaksono 2022-11-11 @627  	for_each_sibling_event(sib=
ling, leader) {
e37dfd65731dc4 Besar Wicaksono 2022-11-11  628  		if (!arm_cspmu_validate_e=
vent(event->pmu, &fake_hw_events,
e37dfd65731dc4 Besar Wicaksono 2022-11-11  629  						  sibling))
e37dfd65731dc4 Besar Wicaksono 2022-11-11  630  			return false;
e37dfd65731dc4 Besar Wicaksono 2022-11-11  631  	}
e37dfd65731dc4 Besar Wicaksono 2022-11-11  632 =20
e37dfd65731dc4 Besar Wicaksono 2022-11-11  633  	return arm_cspmu_validate_=
event(event->pmu, &fake_hw_events, event);
e37dfd65731dc4 Besar Wicaksono 2022-11-11  634  }
e37dfd65731dc4 Besar Wicaksono 2022-11-11  635 =20

:::::: The code at line 627 was first introduced by commit
:::::: e37dfd65731dc4f001fa7dfa7f705e6840017d5a perf: arm_cspmu: Add suppor=
t for ARM CoreSight PMU driver

:::::: TO: Besar Wicaksono <bwicaksono@nvidia.com>
:::::: CC: Will Deacon <will@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

