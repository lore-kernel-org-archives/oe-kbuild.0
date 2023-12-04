Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0216B139D
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 02:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DrgdeWPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701656673; x=1733192673;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=GjD1mlRLlF52PNVdYMa5qlENTmifHlu66yAuQyKS1pM=;
  b=DrgdeWPb5YyVwOAnz8ku3DX+xyYN1FLftXaMSgJgFjyjGiShke539p+t
   WFaK445NeFdJTY41qVgnAIwgOOQMmkKKzeA4rQKgItp6TRt5Q43SZWBV3
   uQHlkrDhY2RYlMqgOPU5Rj+wCOSmp3aznLt6roMBFUAidEa2bxYznuWtm
   upiLpndCeG/C2zjzWgca6dyNhyOP7u1qCClyXdsD5bqjzKVtdGA5zBNDQ
   03HcY6Kqrq/O/9pJdO1zuRotzuOSEpRT7KA7nej8SmNo43vLsZHPc1W5i
   p3x1wY6Fr2G6WU2UiSu2d7zsPFiUaO0W81TMRlx8c0tQRVDVl6Y2lOlYW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="384078455"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="384078455"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 18:24:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="943736004"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="943736004"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2023 18:24:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:24:31 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:24:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 3 Dec 2023 18:24:31 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 3 Dec 2023 18:24:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EiFajpVlks1CUesOfKpMbH6S0Tqrug0yyxOV2OlureoRP9Nsi3Rt+O63du0yWtF6DTL1zlIIL13FCruhcB4GsfohEEAgD9wemG66Evpz2rWHR3xyNyox8iWNR0ZYT95j9qaetM5eMmKeZDi6YQ3baRMBgIuELRxD5wGoufl9jCXEgR8IbvHPsPTv9TJwMknKVtGjzWav4Rwu2IaSpfXOT1N3nHzUxhaovWKJhGzMFQrTVwlFp7/jYMo0pIa9buRZjckwx1CndY2Uib/J7wv+NwDTYFFYVX5qXFQj83LrZDfYfjTsP8xttx4Rkz6y7evr3WoxFluATknWNgd1Gh4Dzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjtWnsRB8TYwNqu5NPfq2rVz8Na3iPEMfeOKY8WF3Lg=;
 b=ZgAbMqE2EONBQD9E9qp527aWi/RqncZEOqd2zEHYTFyyePt9g/U1OmZuOa3LN4cI635YtmT1xp/ABsrmmqG2XbdJgWuRN98qOpaz7oafVNysK8e0/WvRZLoEqCU/vVhi3u5S/4EJfCXACcOQfkvViCK+Qq/UY2vJ7FNbFguHlu0CXvU9W6w+ZXxw34wytJKz5n02Rj5sDErFkShqPQIP+Oz8kt+SAryrSXZFIBsmrm4DFHjuXt3QVUlNbMwrEDzji/53uST+gj5Ak8DPdq+dGu0kUefiK6Qxwt0Tbx7O3rvVIlqEXjEOb0b9z5YH5TEr4aRhGt0NQmK4DF+ABXLruA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 02:24:29 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Mon, 4 Dec 2023
 02:24:29 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [PATCH 13/35] btrfs: adapt readdir for encrypted and nokey names
Thread-Topic: [PATCH 13/35] btrfs: adapt readdir for encrypted and nokey names
Thread-Index: AQHaJbKr3zF8V6Ya70KXQ5nPUmrLrLCYZlqQ
Date: Mon, 4 Dec 2023 02:24:29 +0000
Message-ID: <CY5PR11MB63926EAD3B9BD12CEEF45ACCFB86A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312030254.wsyY4tCz-lkp@intel.com>
In-Reply-To: <202312030254.wsyY4tCz-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|PH7PR11MB6932:EE_
x-ms-office365-filtering-correlation-id: f064811f-01bf-4bfa-f780-08dbf47024c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kWjPbkMeW+yFrWq4q29jqW2idmTz5eNDs5SKYwf2eULfze4ZSufbIECiv/1I/T3zPHbSYpYjtPslltKzUBPKYDqM2jPS37/ai+apXZ9Dm+dRmtU0w339gSWHOp/3gMkoEFDHWlA768CZAUaoVuZgrhjnFMMMjweNBful0nyWKSZ5MQEwC6MBomJbOIdsLqtcsl2SpeiCb7ty3vKvD/zESLg4X9CQ4f7sEGyfNBwtLq34Gosm0nGUn4Yob2Vnb375KRxehHL2ifp2RzZSbxUx55DvR6KXAl9x0XZOkJ6SEdfLC89tdUL8R6VvbtVHaccx6ASkECZlZEt9B1dL5PfZGAZ5z1M8CpBGiwD20y/z7yyXDDDulzIiZT3M8AHQZCN5ANJrCLTrQMt4FA9/z+lUe+N9+ic/BvF6/0SZdorCtaf6420nvVffcOelpqOD8XE9LsQHppXJSxKijYkU8m14zxKDSV6Wg8dRaKksqG8qY3rDmYOwGOdNI79fDEWyGMlvyeFiHNLv+6tB3Tog3LS3ONWW8GopWkm6LKQlK2biDcO74aJ5ylP9IdgWmo8ZAut4bonf8D1laL93mhq+qgvSa/mKji6lNi8mBkN/IlFUyeMWjiWWyj181l+45W7Ku2lHTY8k1TKI6uNekNAIadggsRnwnlH6dWmw/Icc/W3cTm2E7obWdg/s1Zt8q89QgEgW
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(346002)(396003)(136003)(230173577357003)(230273577357003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(66476007)(66946007)(66556008)(66446008)(64756008)(76116006)(316002)(110136005)(83380400001)(38100700002)(8936002)(8676002)(52536014)(33656002)(5660300002)(86362001)(122000001)(2906002)(38070700009)(41300700001)(55016003)(82960400001)(478600001)(26005)(53546011)(6506007)(71200400001)(9686003)(7696005)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CNsj7qDgxSiqg3o0v0SxUJqmc7/zxSATa87xQloqGjCo5GOBMXRt2XJXj2vI?=
 =?us-ascii?Q?f/P69s4A3UrUwGnF9JDHBcZ0exlrKkLBg5YKSRUlexTZccTTInqvAlH18FzQ?=
 =?us-ascii?Q?Vh7pqRWDLpgF55Y7enrvGC0vZR88VrRIYcNCDcgQvsZcBdEKbioPQ/KwaG0g?=
 =?us-ascii?Q?8qUhGQbbCxBMalHIYKLuSl9gO35QBWgbhpG4YMuE2fgbDNcB5esSCxIuhTx+?=
 =?us-ascii?Q?GInt6xlD8hwBQyHMtaKI1JBYfaLZqHzVxISExd0IRLJo/FAeKLAq25JxO927?=
 =?us-ascii?Q?pzUms3rv7kEmw0h600KL9BZpNoGfBmoOsgpPBVF6YG4lYFe8SuZtzxvcHXfK?=
 =?us-ascii?Q?xbBUk0KQ5JvKGLKZCkvcXgqnOHhtVI/n/+ROGVT7k9T9MWNrcHjPueBNFVEy?=
 =?us-ascii?Q?hpjl1MMRji04kd21vWhjPbmhGAfMPzGoTp0hFfUI2V6TYAo0FXa5dkkKY7gT?=
 =?us-ascii?Q?Rub1DJKSSdwAs7ZG1yjSuv1V4o0NVF4v/f3M5zu5pP58ouMJCRTujRDWJzXJ?=
 =?us-ascii?Q?/vHL4q6CMjegBxDAMFo9oZVr2LyQZO9xo7bzldWxR4lPbuSBCjv+SVO/Bz8R?=
 =?us-ascii?Q?aEp2Re2up2TZW1V1unbA36Kn6fs7T28ZaO7ElzaczspyhoX+8Yq01cts7Duj?=
 =?us-ascii?Q?3ZxbhfZUcf9d0C4K1McgY8lWnwybTgmjaymRDNytHmlNS7pOK+J+tGRdwUzz?=
 =?us-ascii?Q?PaPqsoGLjk4yxzbiPv2Rh091NTp4oL1nrPoG+6L48XhLhspsGDAAWjetc8qA?=
 =?us-ascii?Q?UwhoPOG5GtmWJHC5ZJe9TjhChvTEpnxCez/9rTsjhi/lJZzxdu1nZ4ClZQeB?=
 =?us-ascii?Q?LaGA06036vdT3UT2GxdgI997T2BVqmyn/6l7wDR1Q8ZiRq/9IJnwNY6Xe+3+?=
 =?us-ascii?Q?j7zfXGLi8gWVwp2quUN72sDbOjFxxZRT8/dbyyVmCFa4dT/A9pvCDYbfrEpZ?=
 =?us-ascii?Q?YT2opGTGT3/n//6b0CR/4dvH8pvsiGlGI9weBh610eI+EkmaHY9J/TQP21KI?=
 =?us-ascii?Q?Ka0JHTm9q3ICCTrLzBqxmXbadtRZ6PglG5h3uqjFTNf+d+jaoP+6BdCQvB0M?=
 =?us-ascii?Q?LZr0wVqCMIoluKNfrkNxG0INv75P9S3Szxd5sus2Svpv1hb/oqIa69YjWyQe?=
 =?us-ascii?Q?e3OIpt5JAc6mu8DRvlzLrgAuejz/i3ebzn/E45qJu/G5EF77o8y+cyli7tZM?=
 =?us-ascii?Q?wIQNayzZga/DBgWpu5IYb9T9FVnBeiZWsXcZSK9EHxm7s9DqYKxQe3ceNfQv?=
 =?us-ascii?Q?sPnWh/G0mit5d8vbY15QJuZraBtuhj5MXdWn9xGGezvdm5JXBiJDGAlKNxKH?=
 =?us-ascii?Q?m5hCSApaSJ2+LpDURwIclH4do4yxM/bsLgIkwSajwywvA/Ix2KjUwIiyJYJi?=
 =?us-ascii?Q?NWCzHmMOJbMsr5ten1MDjPhZl6omoyX430RsQWcWTvWmoT3r9Irs181i7pkt?=
 =?us-ascii?Q?icuMudIL7Bm2buHhbE9Jkr3AbomnTVI262sVsP1+VD49FUN5oJIgcphom6fm?=
 =?us-ascii?Q?n08PK14SBFiZPhau+3H6VLuiMqBenKaT1LRPnLp18rVxlBBY/Ao747DWUz9P?=
 =?us-ascii?Q?Fy4S1v1FCG8k150IjuZA8q6CGRdlmCHoCOeHMe/r?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f064811f-01bf-4bfa-f780-08dbf47024c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 02:24:29.2724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wf8lg50wYtGNwqmNNwSaYsl//y/1w/z4vwQBMTE+3/7DHcLkaX354wPDZluKcS8kSQVpI7jtnaEGr7HbVS7N3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
X-OriginatorOrg: intel.com

not_report

10 weeks ago patch.

Date: Tue, 26 Sep 2023 14:01:39 -0400

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, December 3, 2023 14:32
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [PATCH 13/35] btrfs: adapt readdir for encrypted and nokey nam=
es

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <e405fffae735ea6a250c58bd7ad199281f111f9a.1695750478.git.josef=
@toxicpanda.com>
References: <e405fffae735ea6a250c58bd7ad199281f111f9a.1695750478.git.josef@=
toxicpanda.com>
TO: Josef Bacik <josef@toxicpanda.com>
TO: linux-btrfs@vger.kernel.org
TO: kernel-team@fb.com
TO: ebiggers@kernel.org
TO: linux-fscrypt@vger.kernel.org
TO: ngompa13@gmail.com
CC: Omar Sandoval <osandov@osandov.com>
CC: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>

Hi Josef,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[cannot apply to axboe-block/for-next linus/master v6.7-rc3 next-20231201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josef-Bacik/fscrypt-=
rename-fscrypt_info-fscrypt_inode_info/20230927-020531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for=
-next
patch link:    https://lore.kernel.org/r/e405fffae735ea6a250c58bd7ad199281f=
111f9a.1695750478.git.josef%40toxicpanda.com
patch subject: [PATCH 13/35] btrfs: adapt readdir for encrypted and nokey n=
ames
:::::: branch date: 10 weeks ago
:::::: commit date: 10 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312030254.w=
syY4tCz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312030254.wsyY4tCz-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/btrfs/fscrypt.c: ioctl.h is included more than once.

vim +8 fs/btrfs/fscrypt.c

     2=09
     3	#include <linux/iversion.h>
     4	#include "ctree.h"
     5	#include "accessors.h"
     6	#include "btrfs_inode.h"
     7	#include "disk-io.h"
   > 8	#include "ioctl.h"
     9	#include "fs.h"
    10	#include "fscrypt.h"
  > 11	#include "ioctl.h"
    12	#include "messages.h"
    13	#include "root-tree.h"
    14	#include "transaction.h"
    15	#include "xattr.h"
    16=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

