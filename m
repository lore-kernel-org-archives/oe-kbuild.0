Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC125A21
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 02:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xql2CkAn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701657289; x=1733193289;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=XgTdTvRcAyHrvFxWbDuNLEIPXYlKlOW1h6rWp1vcUCM=;
  b=Xql2CkAnMvZLjd+ahtMyj6gMpe/vcA4bcj7IcD/1I+r6fQFpxt8EHz7u
   +wd5Y04PMilaOrRhA7KjexBQTOLv6psMqsTvC4CvjfD2U0YM3sO1fg0/I
   Xr0we8Kvj2NpVRfU6mufSMiwpBSxBsKCxZd0NKMm0Xw0oMXvQvoReqVi2
   88ab4tlM5KxN1nnjUekSOF+nwQdl7ZFMoQwoi8QVu1ZcFsKQ89Grqyee5
   E5xHk23Qsi/FZ4yKYoLKVenBeQga6DTCNlAR0ocE2M/WTh75e1PMIYOGb
   ByRefP9DzJgAKjVBg6/IRMW74Re3SlulnOabr7r73GqA6Tau06bQmkEhK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="378707952"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="378707952"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 18:34:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="763794764"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="763794764"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2023 18:34:49 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:34:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:34:48 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 3 Dec 2023 18:34:48 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 3 Dec 2023 18:34:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B61fUDz7M2AKHDsCS+LeOo8Cs33GdP9FUbb+jYPLfyJ00dj9vMYF68HDhnThQKvkfAA8o1SivXCbyC6tnrcDcpfmM50pry7j08Kw8hocIhjUl+KkH8gVNTrbzN4A17w2mHGHRBDqPTNJsppSr0mlPwfkK2cQSEFbs5syCQJ4aR8SybXvQp99HdsAkPq6mIegbenghThHrM2hGmxqVD4tw8REP6fjfliGYdzJPoBLiMHkUx4XKHZCHwLJ+4LOIlQQVj+Q+qLK6cSY9F1Rny++qadNHxB9Dez+efQIBRHdcaO3II3dr6bH0u7chbTZ3YFwJ6JDZJGDshFSOm6EYyNtTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46tOyYP6q/9gz9pM/fz+Jstv8qq8aO/6zWQxqU+0p84=;
 b=MAAouI90TzpM+CXO6WiFv9cFxj1DGeqXKs49G0BSAp1evwnMVJQHIXBKznQK4YK1XQKkNuJi+cMglNr+S0vItOHozxx6mBW5hWinn+dL7yrO3RAFcsFZHOiLvCq68zOOaWeT6dGX76a2nFQhmPtq4T+wl6K8g8Is5D/JgCZGCk7yEskFTc3f32B02z5Pb4ummSHePrc71nyedDtoVkJz1xB64278+rqglTtp88PQvGXAlNQT7NjvIQsgs8pKeR72/VrHUfRkooZcaRbucHwrhANDk4VgrXlYt0rEXavE6MFKirrASc2pfZxIQH6l/ZuI3me8Yzkr2uzwGNqOonqrRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CY5PR11MB6259.namprd11.prod.outlook.com (2603:10b6:930:24::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 02:34:43 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Mon, 4 Dec 2023
 02:34:43 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [drm-xe:oak/drm-evictable-lru 2911/3055]
 drivers/gpu/drm/i915/display/intel_display_power.h: linux/mutex.h is included
 more than once.
Thread-Topic: [drm-xe:oak/drm-evictable-lru 2911/3055]
 drivers/gpu/drm/i915/display/intel_display_power.h: linux/mutex.h is included
 more than once.
Thread-Index: AQHaJJJ6m1tlRSQaA0KB8DVLC36XIrCYa69w
Date: Mon, 4 Dec 2023 02:34:43 +0000
Message-ID: <CY5PR11MB6392C278BA7076BA1F6C1989FB86A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312020446.Ej5Bl61f-lkp@intel.com>
In-Reply-To: <202312020446.Ej5Bl61f-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CY5PR11MB6259:EE_
x-ms-office365-filtering-correlation-id: ffb4cd4c-c38e-43f8-49ae-08dbf47192c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6yBUnOvhUmlT4bBrHd2Yf0i/QHxUrgmoI7m+Sn+gHMlLE5LXdxoHUpJvN//AvBg2XrTBwgIEh2aNLH66sf/AtoUBuvDAWS0SSf9QYv2MozruhYIRJd0BsGcvnWjCt1m4LKXwiRau0vo/oeun88OXUSEm1j7T7BTzFy7SfOEkYIisnDjVGeqxaS1PGlBT1MPeJpSjU1H6oZ6Y+f4K90wMTYwURcS/dSHpDgogB7V8Q0aJxmCyPYqnSo5I/6G/tsUBCb1SGZ8efOMkQEyARQhacJ1I/QW3x9mNBEb5rV9o7luwu3Mh2jL6oIkq9ks7C7ngvdDnciLX+0zBuJqyhcYQ1InR3ZJtLnMXcgzNbPx7wXKwmjMaWFJ/i0BZHVKoktCBptKPxM4kqv7SQ6H+zDT1Bvhg2XKP+9QwBGebjrkf9EJ6NSasgPiiWgrTGd4LRm+pdHMMcI+siXn5HEia1JYZM1Pz1psAuj/+nXzL2VdYqI2HIYNloeUE3IAi7/3Fzj2iXOGE0Y9PiDT+OSIQgQMGkioVt/nAhIbe0vyPpCtCea5JBOyc256zPrzb4Bh2BGl9ATt8P0drln9abYJ+YNpaIiAfLMQQ/tjuWyDeIwyEUHey1ywQff5Md18JHxVWXN0lPVYzCsf2KuCXoFePTLyggPCCsr6PV7q/m+tHKG+oBhAZbfHs5hBTkmeUx2y/ZDE7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(136003)(39860400002)(346002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66446008)(64756008)(316002)(66476007)(8936002)(86362001)(8676002)(52536014)(66556008)(966005)(478600001)(110136005)(76116006)(66946007)(41300700001)(2906002)(5660300002)(33656002)(38070700009)(122000001)(26005)(9686003)(7696005)(6506007)(71200400001)(53546011)(83380400001)(82960400001)(38100700002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E/R7gyTziZIcJuwRMn+qnwgq8FmslqItSB3ZPwKprNyMZuDYfxtXt3jXLmBN?=
 =?us-ascii?Q?GA9nZtt1W8HNI75x0QPo4XOnzivXa4M/FOZVh+jwGZQ8br/mf5JG2q/mrpoj?=
 =?us-ascii?Q?tL81Yigt69Ww47kp4jo8yrHWAkXyzpYHHb/wSy42NY7wc8/7kwU8C5flUnS+?=
 =?us-ascii?Q?GpyTcAihavpM2guqAbxlPj5nzX9O6GiTC9kwEEk3AxA73xhs80jJWODGKec/?=
 =?us-ascii?Q?sBpyE1msD5aHMHdaYrBkyJMDLpEMTgLjb8MTnDlwQjuAC7W5YPrIdnQQjxHs?=
 =?us-ascii?Q?kR5FMULOAiHRKyvyvAge27uyf1vwb56h0MezuHA3jJh0iv7D6tvjodzWTSin?=
 =?us-ascii?Q?AhfcQxPuJ858hsJbLWmcSww+84jg5ZZF/8SPQVK1kJxrHUn0ovxlUS0AumOa?=
 =?us-ascii?Q?xLluf0SPn/VUquiHYm9r8VtKrdOVbhta6kxX7JzS/aFhSgz0th1yHgSGLTGR?=
 =?us-ascii?Q?scJfvNcz0rCmAbwGydZ629SToPVreL9STCt5AE8OBwGMMo0xhyt1uz+bgMFQ?=
 =?us-ascii?Q?hSuZ/JMg6akTtOSp4t+7DaXY3iA3a+jCD5K2tQAjnYNTC8MOpVZliI+a3Sx+?=
 =?us-ascii?Q?Ipar6vqraLaB1HIGYle4B4J0yL31TmqjH1ebkwLb69/LVcKzHAtGUD4vf1OJ?=
 =?us-ascii?Q?onncqNSJWXqY7XZK0YacsoDj83kqNhlu7NXdMhujXe5XxYpqOyxYpMvIUvJe?=
 =?us-ascii?Q?Ccnvj1utp1Xn/A45afbcg2X1ntM3uTZkjR1ZvDgkIPV/me4kBU0hwkIus877?=
 =?us-ascii?Q?ZVsuT4y8FvvPTLYYBBZ0968yNt0gM0aUEwqDPoRslm2/FtE4KAzB3N+DpBK2?=
 =?us-ascii?Q?FjdAznwftdbkszhB68O3lJoKtEnUm+W2rJsbDcvH54zNiVJ3hnvMfZq3Y4/A?=
 =?us-ascii?Q?tttSDo8Zmj8wqf1iq2rB3j8vnpg2xvT+YQe1eVwgura3/m53PDxl84kuI/9c?=
 =?us-ascii?Q?cOnP82crceU1Qv1zOw6FetQBP+CG+/uWE3MM9ZtM2XOEsqy7MjHsjXqaBBgW?=
 =?us-ascii?Q?bwBcSRu1Jd2gXXkinX2UQagWch2u6RWrFXcRF6SJfGzYwfB77xsuSJkIcgkS?=
 =?us-ascii?Q?zIJYuVuT7jXsKmDFL3r05pj9u78lzFDacDisjx1KWOB2zOm07bh7xnn3sxB3?=
 =?us-ascii?Q?asOmF4GmrWV6VTUyx6QrruxIzJg0RDb2Gt2OJo75emZVvj5U85pt1Ap++z00?=
 =?us-ascii?Q?m3C4f2n2VKU+tg6hSEF5FnDHjL/OzRqLWFdKCt1qUsJuppV82pUmdqY+vsYH?=
 =?us-ascii?Q?kTM2BavXgeEx/pCrK7G73FEjk+P6Rja3BRANknLyj425fq2mukY1YaazR2Lq?=
 =?us-ascii?Q?DMebh8vVnmDrZM7EqtsjMmmlbyIf2YRrGwy5moyIk8TZMRkiYdONSka65yzk?=
 =?us-ascii?Q?GLySS0m7RPop1tpqkwNZCAOE67nk/qxySK3Su3L499xTKS25Y+okCTzxC5Mr?=
 =?us-ascii?Q?BqB3d4wfd9SAb2mqkj2ocwzBwpDAXLYDaYOKW2oJ5O+KR2IqSgaJn3H3OXVJ?=
 =?us-ascii?Q?JmnPn6zoALpSi02E7GHGNZBT4algxl3wrSA/QY3adYn64cBLDwuOQVp91Xro?=
 =?us-ascii?Q?8drCzPmRlOkfjoIg7i0J5VspcfwFckfadP/mXEfF?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb4cd4c-c38e-43f8-49ae-08dbf47192c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 02:34:43.3800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NDuSa6gJ46sUR2yuNylSy68JU2Oi0HvveychQB3Gtx0yzo6pAPtWIIJfmDD/le+IY3+vI5Hk3PBTL8waRibpNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6259
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/all/202311070416.8nPv4n6G-lkp@intel.co=
m/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, December 2, 2023 04:09
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [drm-xe:oak/drm-evictable-lru 2911/3055] drivers/gpu/drm/i915/disp=
lay/intel_display_power.h: linux/mutex.h is included more than once.

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: intel-xe@lists.freedesktop.org
TO: Jani Nikula <jani.nikula@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git oak/drm-evictable-=
lru
head:   d1f59526925ae851c6abf77af8ae6f8c3cffeebd
commit: 304baa8c20cfad330a6c7cad47d86043e968642c [2911/3055] FIXME: drm/i91=
5: add a lot of includes in intel_display_power.h
:::::: branch date: 4 weeks ago
:::::: commit date: 3 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312020446.E=
j5Bl61f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312020446.Ej5Bl61f-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_display_power.h: linux/mutex.h is inc=
luded more than once.
>> drivers/gpu/drm/i915/display/intel_display_power.h: linux/workqueue.h is=
 included more than once.

vim +9 drivers/gpu/drm/i915/display/intel_display_power.h

     8=09
   > 9	#include <linux/mutex.h>
    10	#include <linux/workqueue.h>
    11=09
    12	#include "intel_wakeref.h"
    13	#include <linux/types.h>
    14	#include <linux/bitops.h>
  > 15	#include <linux/mutex.h>
    16	#include <linux/workqueue.h>
    17	#include "intel_runtime_pm.h"
    18=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

