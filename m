Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86BA20F2
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 02:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJx+lNKp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701656777; x=1733192777;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=jOwMX020tzAAxo2G2gaWBR+VhPsXHv6Nb/OCg0jUOF4=;
  b=XJx+lNKpQjfRH3bnGZ35FsDtgmhKkIBSp2Co3Kl9DJBXR/nAcNRMmdU9
   o13Ukqigaf+hvIeZZZu85YYYq2Tb57ekWxGAXXjIgiHX0mZQoGdVjFtMT
   y0nCPKcNCSg8wn+uX2mPzcyMd5jpxmPPYL86OsoSB9IT7cygw0WXil//Q
   ljvaAp4GSRgsNAP3Ub/9NxBvBb4wcw/7t4sXuvtQw3MerXf8b6xn+hQrP
   Ohr8jPEfe9QD18sH6cSGGbgO6Pd3R5tfZtK0tBBqbJpLPL9cuBh51e72n
   uxzyhb5MsYgQmnReLnPjZv6EFgecKrB9a5JT+Q3Ya0Rj/iSkpBrAHvpjm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="384078751"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="384078751"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 18:26:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="943736405"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="943736405"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2023 18:26:16 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:26:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:26:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 3 Dec 2023 18:26:13 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 3 Dec 2023 18:26:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwrWSBOyyvt4428dDOyxPrufzL9Cb+uN6fib4HSkz3tB8hF9/yjcjPG+pByV2UU64uT7vkkKyw7MxQwZTwN1LAZ+kchyFrWWIIokyEsoEHMzCeTf8Aft2JWxnq1ihVTWnL59KtnlKVSfpiZUXtIjNb6JBZiSCL9lqw2K/g4tNfJILF4Ymw+99X2HUcFknlj8pJysO4K4eOx5AUMDps5G85cTINPn79jDnkBJnMAp9yNuH48p+SqFzXGw7b3CIR/4kYzL9YaPi+e3IcKOMAxL4ZWnj2Ab6ztnqXSelSJRdUYrMRxxmlqWdlrpQfUkYhYNqqUZG7hmSSAr1TVORW7vQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okbAsOYa+4cneTkmXufdLIp5gxOZcqE4wFUQ3W8moKA=;
 b=odNCUiHGjcShtN6tEKNdpYm3WcyZuWcBXGHfSlGGS1uS0lycKHEb943tm243pVnFR0UwCUQv+vRah54OwOeb7tkAa8YYUqZuE9IT607iTzuIDZCkSiU8GoQchcd3fdZNkpppeqiFr3egE23g4f5fUU2tBxs9fK99yA085xt4ml098SccBo/idn85F/Rp+hiE4LUlQs3+ZFfGXWWhS4UHIj6CTOtVpuWEDykHHaWTc7tRykMRkG6LsCFNe3zDFKUOJXpMVWyMIFrz0F78NSj4goi0n1sJOFItwhRkDDOFzwYbgqoAGG11FMgGUkV+UNTqpgbLOO6YiUXJdN33z90NGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH0PR11MB5641.namprd11.prod.outlook.com (2603:10b6:510:d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 02:26:04 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Mon, 4 Dec 2023
 02:26:04 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [PATCH 5/9] scsi: bht: include: Add the header files related to
 Bayhub specific struct, enum and macro
Thread-Topic: [PATCH 5/9] scsi: bht: include: Add the header files related to
 Bayhub specific struct, enum and macro
Thread-Index: AQHaJbKmr9xAXa02q0GCwOPZoudTwbCYZvgw
Date: Mon, 4 Dec 2023 02:26:04 +0000
Message-ID: <CY5PR11MB63929951B4DD735F8DFF9A60FB86A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312031127.SIjTpP0B-lkp@intel.com>
In-Reply-To: <202312031127.SIjTpP0B-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|PH0PR11MB5641:EE_
x-ms-office365-filtering-correlation-id: 148f29aa-b5c3-48ba-b063-08dbf4705d85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mz1vz+vYOjayNSbCdoy6CFFNXX+1ZaYei9zldc9AJqx5KD/y6vNectKtAWejDAlSUxWogepoz+c1xQ9fh+zgtq8qg4DZ4e1R8jk32OGG8CdzeeQdRCG9th4RS5t7n4QIUE0Ms7oC3kD+cvHqhWBWMt2uA4SYvQAetiBtj/SF9QDLmkkfCC8IMg07KAVQR7IT6bEmisqwhx36s7g0YtjpoGVzBDoWdD7YoDn4o4U54VXWhJlwpGh18KGtjAMFbEDp8BA7Zh6dpr+pxWd2LqNna9uqBJxFUWPhSK5TBJd3z4raAAIXWBE9kEJSguXKAeZMiyPP1NDtWSAru9pM5CZUqNj5v6wvMC8HkqvdcG/XSsU0Or/6T5WLreEndhrwRTuM9sRClIx22dUZpx/jLzTlnGBeRUdW1uoaIK/ImrbJNXPy+jonN7miEErik8LeyerXUns1xeZAXJaw95BG1hiDNWN6dzp9Kljik65BvBySvHNb4UbVDIN817oOmWbJme4vmVRob9c+pdNvjEFbkx54swpb6x2/mWpicTnsBcqKTX2zuZMbl7npN+RLDF+t+og2NB045CTe/QAkldV//xw9KKvD0fYfjUJiZkdtFrzspqVXMBVkAai/yxfwnzsXFdMRTVqMZsA648F0Ea0q09pjEEMOTuqBWA/VTFbMYS6QISTX8CE0dJEplL8c+soqu17O
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(136003)(396003)(230173577357003)(230922051799003)(230273577357003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(82960400001)(38100700002)(122000001)(41300700001)(26005)(66556008)(66476007)(66946007)(76116006)(64756008)(5660300002)(66446008)(8936002)(8676002)(52536014)(316002)(110136005)(9686003)(53546011)(6506007)(71200400001)(966005)(478600001)(2906002)(7696005)(86362001)(38070700009)(33656002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CdBkG085inb/DrIPEbbzWMABb7um8xm9v4gxIEgom9uo3aOiEz24igWRZncZ?=
 =?us-ascii?Q?UAcZDpVc5mwNc+srZhBUmQLJXOVpPW/xkJPksvJZBxKHPdXVv92wQgRTBrDs?=
 =?us-ascii?Q?VC2VEEdkZKPIRD2Vf8P1lcYByCoZ9RgmlcoyDa6YTloU21vNDW3rAwxeUabr?=
 =?us-ascii?Q?lrvhOLLb8Mhpwi/617oCbC4gY3XTch/SG9sAvzESLyO499XZVlMXwYtLcmqW?=
 =?us-ascii?Q?Gy5s4Iqb0ddiOzRA+SREN36F+UEqrepvsWSr7b1KDieGNW8RBzWmYvoPyQ/j?=
 =?us-ascii?Q?mX0GKEBMYfcf7RwV7aL42uinVdkYf02IGHbjQj7mMr+Bx2lJbQXJ1oTjSWW+?=
 =?us-ascii?Q?yYIL8E2ldprSHYat883Ef8TgL9ZdDfhSl795WvPQHTYm7Zz5Dzwf7OmIBfA2?=
 =?us-ascii?Q?wPct5CMVWqenP9qKE+OVlQ67ov+EnVUrA3K5Ydss3F8HG/Pq48qKkOBMSWqG?=
 =?us-ascii?Q?0vcPtJoe/Hf1i/+joqTEKyYebfhvFiK8o5rP1bEp6B93Tl9TC0IG1gACypg2?=
 =?us-ascii?Q?87ebYsCCSVBwv7jfq+5wUBKVg7mrnMFNu+LesPILljwuEFMc6mLoQ5SBYbsG?=
 =?us-ascii?Q?vAG6J6hIGKIaKMr7y3Z0SP4C+qdMSLBFZkq49YfeNYv9FsFkUZ34nn3HQLl7?=
 =?us-ascii?Q?0oo1N/f6/U3b/gWV7nhn5RaxTN2GNPPQEpbbepKTKgWqHJPToccD/oA+byRu?=
 =?us-ascii?Q?48uAOsI4Uo33MNDEG3IeQ4Zm1VfJBoC+1Va4LbmUDFg0n4b25X7v8Wk+7FVY?=
 =?us-ascii?Q?mTyZe6L6r8+xLN/Mjd+ffMwPE8FvMKsoQPA+K/n4f0sqjvRYJHgEjSEjOX8c?=
 =?us-ascii?Q?sXhy3m6ycAnvio5XgZzAA9/taOElMCwVcnsIFIghiBl7Uxv6AHd673gmukvs?=
 =?us-ascii?Q?fGkgAEIadWXHaDn6bJG6ZguDCloet3fohILeOBzTpTFAMWAK90bFMopRW8QN?=
 =?us-ascii?Q?UMPgUPm97X8U7dSbTWZQC3VHb92pdz2M3HIvVtKCQEI5Y9S5bcGmjmoyY3jj?=
 =?us-ascii?Q?nL4YDfmsKazMFnR7yV0UVF9yWWhLVjzUucAi6ePFNnVZ3dt8PjJUdH0EhZBS?=
 =?us-ascii?Q?axyBXr3DnDhtLMmgNgD0VwTyIE0WIG4hhRKt3WW8Ta9enDe/xr+cxBSAuv5O?=
 =?us-ascii?Q?Msr905sOd59piaoCJf5CmEs/KWtwf8p0B9Mu5OT/AXz3X3sxmintADuZqut6?=
 =?us-ascii?Q?rLaNi3RHqUUgHgFT9YlNjRQ5FpwLOSFlrM2bFSYRAOOUe5j22SvVmNRsRznC?=
 =?us-ascii?Q?XmvShR7J0iMJexa3sE4RyBMaw05kPHyLmKqk5mLgqyB8Cj2fExVItPrHwlwo?=
 =?us-ascii?Q?FtOUTitx/QXZsrYEyDlv1X6liXseJrRdA2GAVtDEKpbEdjiEqT5tlyhAA0yZ?=
 =?us-ascii?Q?8hy1EfvUIEAvNudZFn8td5Oytb6Uwecet1aUG4W7zR+Tz83nxhgk+NO3LAS9?=
 =?us-ascii?Q?0FgmZu1zIotJHTF2XsANBOtLm+KBe0YCh0FkCf76z9wGz8vYUg3jL0cFV6Oy?=
 =?us-ascii?Q?CQaOReDIv/9iB+azYCgw6SaCdvUQsF82IzgkQ6+nAxnlSu7REf9h9XRHzQi8?=
 =?us-ascii?Q?f68tqvdJhPU/huu/+aOuBJuYdLCi4GGhIMmFaly8?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 148f29aa-b5c3-48ba-b063-08dbf4705d85
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 02:26:04.5238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wLkfRVvqjzePNQXUiW1q8W60YgR6ckm18pMkvjHEzfYvCdoIlBIUeWUvXt8qNjp6ljqsQRRFnaW7Cxm7403vmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5641
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/all/202310230123.kYU8vEt2-lkp@intel.co=
m/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, December 3, 2023 14:32
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [PATCH 5/9] scsi: bht: include: Add the header files related t=
o Bayhub specific struct, enum and macro

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231013083358.10313-1-liuchang_125125@163.com>
References: <20231013083358.10313-1-liuchang_125125@163.com>
TO: liuchang_125125@163.com
TO: jejb@linux.ibm.com
TO: martin.petersen@oracle.com
TO: linux-scsi@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: mark.tao@bayhubtech.com
CC: shaper.liu@bayhubtech.com
CC: thomas.hu@bayhubtech.com
CC: chevron.li@bayhubtech.com
CC: charl.liu@bayhubtech.com
CC: Charl Liu <liuchang_125125@163.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 401644852d0b2a278811de38081be23f74b5bb04]

url:    https://github.com/intel-lab-lkp/linux/commits/liuchang_125125-163-=
com/scsi-Update-Kconfig-and-Makefile-for-supporting-Bayhub-s-SD-MMC-Card-in=
terface-driver/20231017-123349
base:   401644852d0b2a278811de38081be23f74b5bb04
patch link:    https://lore.kernel.org/r/20231013083358.10313-1-liuchang_12=
5125%40163.com
patch subject: [PATCH 5/9] scsi: bht: include: Add the header files related=
 to Bayhub specific struct, enum and macro
:::::: branch date: 7 weeks ago
:::::: commit date: 7 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312031127.S=
IjTpP0B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312031127.SIjTpP0B-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/scsi/bht/include/basic.h: linux/delay.h is included more than on=
ce.

vim +35 drivers/scsi/bht/include/basic.h

    24=09
    25	#include <asm/io.h>
    26	#include <asm/uaccess.h>
    27	#include <asm/page.h>
    28	#include <asm/byteorder.h>
    29	#include <linux/stddef.h>
    30	#include <linux/string.h>
    31	#include <linux/errno.h>
    32	#include <linux/kernel.h>
    33	#include <linux/ioport.h>
    34	#include <linux/slab.h>
  > 35	#include <linux/delay.h>
    36	#include <linux/pci.h>
    37	#include <linux/proc_fs.h>
    38	#include <linux/reboot.h>
    39	#include <linux/interrupt.h>
    40	#include <linux/types.h>
    41	#include <scsi/sg.h>
    42	#include <linux/stat.h>
    43	#include <linux/spinlock.h>
    44	#include <linux/sched.h>
    45	#include <linux/spinlock_types.h>
    46	#include <linux/semaphore.h>
    47	#include <linux/completion.h>
  > 48	#include <linux/delay.h>
    49	#include <linux/kdev_t.h>
    50	#include <linux/highmem.h>
    51	#include <linux/export.h>
    52	#include <linux/wait.h>
    53	#include <scsi/scsi_host.h>
    54	#include <scsi/scsi_cmnd.h>
    55	#include <scsi/scsi_device.h>
    56	#include <scsi/scsi.h>
    57=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

