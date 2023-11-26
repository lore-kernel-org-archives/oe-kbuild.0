Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27916846C
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Nov 2023 15:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTYgrWsB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701014180; x=1732550180;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=lkIEvYxvVbe7H0dUi6rd1jFFnXAkYMjmWNnLza4xoqQ=;
  b=DTYgrWsBvZc+xawCYdpZy+4NEKMzZ/PD3tsdbkN9o4OtFhcwcuSPTuXZ
   N/P7ohAjm/tsqlTJfXyCf6OieNC4PBITjNCniG7WXUwn+R3BRMNiSZ9gf
   FYnNDVTmWzBr2DGItBufPfeUhackDX3THvSuHTqUV95NUhW9aXdNb6FpO
   ZxY1wL0au6VOH+XsfXf3V8BA+bOE07Kzfq8tLsSWYnbFC1nWuhj4r5HIH
   owszhNVTfft7AKbju/dzvlYa0HzcYvq6G14ZBQ5nK/8sRU7kDHOuI5z5p
   jP0Qb0MOvK9tJh/RJfRGH/ElZaI6hdZ/ZFNWkKzE6JWij5PzLPrbd1MNG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="5827804"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="5827804"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 07:56:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="1099541172"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="1099541172"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Nov 2023 07:56:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 26 Nov 2023 07:56:18 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 26 Nov 2023 07:56:18 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 26 Nov 2023 07:56:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csSOk5vURZvRvvx1xdKxA2v6XvvaqsR6RBlcITWL8PD6CQ18PeXBVxlnqtIveoe+FgW99ZyR7WjqY6eibI+vCSrNNP4j28EA1XANEzdDz24RbDXy/VPfyj77/CLuzoeRnQK+88hpvpcpdCU7Y+WUuVMiVMNTYBH3GaxBpW2mtXPTWUqYXephByAXUvHgnuYOJwFtZekpLXhLIiNk/QSTzeD1FjO8a3uy8H7ou3ZYkRlX5PUpCGVW3pbQ4wImdFbJWhoACIc1qcXM7ZxzDjZx82kdj2tp7fHPqSJCfG9Czd0TT/kWdhTMMElbjgIxCr+PYtiRojoe5lXYjrmxe9+DrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2aOGRFPLVcVznkyaeDDWb5UAIsXJhhVBOjaMsJfzcjw=;
 b=LnB9ciAE8As+yjd6BR04D5VlBOxfP1sLrQVP21xoZ8Aw1Dh2EdGwjS1H7N0/2ty4vbfiSOGz2hbKoxBVdXJxfQLDZ9zvYgQF0SYxF0auyGRY2d/aDQwVO7KsgM9TtHx4Ypv+y23nP68gUWulV5kqTML7/+B5tve+3WwN+VaoN0hrkKfrQF+kJThjo2AGa9WGm7ynZa3bzbMpsdrNlMBdLmHMQHU8e8oZTZkEn7Ip6kj5W5COpxWpCAq5P/IZgkqGHZ1E+tkTw9QkHWUVFRC/md9398SnywQ/FumZPASk9Hnxb2WbegUX5MYFsoE6wx+WK5q+y1iEe708rJZ0RK+EBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6397.namprd11.prod.outlook.com (2603:10b6:8:ca::12) by
 MW4PR11MB6738.namprd11.prod.outlook.com (2603:10b6:303:20c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.26; Sun, 26 Nov
 2023 15:56:16 +0000
Received: from DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::e486:f8af:ca6c:7219]) by DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::e486:f8af:ca6c:7219%7]) with mapi id 15.20.7025.019; Sun, 26 Nov 2023
 15:56:16 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [dhowells-fs:netfs-lib 1/56] fs/netfs/fscache_io.c: linux/uio.h
 is included more than once.
Thread-Topic: [dhowells-fs:netfs-lib 1/56] fs/netfs/fscache_io.c: linux/uio.h
 is included more than once.
Thread-Index: AQHaH392OfyQDEoQrkKOXEL5148AwLCMwwDA
Date: Sun, 26 Nov 2023 15:56:15 +0000
Message-ID: <DS0PR11MB6397BB498A8284BA76DAA1A6FBBEA@DS0PR11MB6397.namprd11.prod.outlook.com>
References: <202311251612.fhxgKB5U-lkp@intel.com>
In-Reply-To: <202311251612.fhxgKB5U-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6397:EE_|MW4PR11MB6738:EE_
x-ms-office365-filtering-correlation-id: 1bf23860-103e-4933-3d79-08dbee9838e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cd8E47whLj/GQ1TLmOm0Bm+gjvs/ERdOw+3yP37oX6PovZ/AKdfm9JJBl+j5VTQaO2SAQMT4hdph8GINas91cd1LbHveqCF99ooOWPrmYjn6ACUq7fAVpEXojezgIH8kBuy6WjTfD0QAdqP2QgaO8H7eC+9VYXAv3lomeLQomaZy+EUN8jR+RXhnvbGmzyB/RsLc2XFJv6VGr0Ep5OfToGLcXeDAQ4QIid548VjUHrtA8Sc98g22LYYUD46cEWFWc8Eij2wUXZlZeJq6IyWDZZ2ou9NWQshX7lELY98ixt/gCPmggac5RXpVUh+zHhKSXGCJmpNd9e+4rKjCpq/hQuNtJP5963z4iW4p5As+JKaIS0q+xndw3a6WMN6sh2e1aGFRtkZ+nS+95Q/D4n6VQfPG29AwFYmpJGW3gcQa3SbnoSMgzl++XoJ8Sf2ppntnPMhGtETQT1c3Oe5jUMGEpxF5sYHoVifubkZJ8ys+1Fup/uzYciFvaw9vzSO0jGR5e+vN5akO5LMey+54vBl/sRDG4iGnx+EqCjeETz1ow2tefiABwUurSfc4jy+p9GHjGMFe33DCfMFd9ieuBbLHK2w6FDNwEKBzcx1QoLk7ucMaPJ4y0qvLlVDbTLxp/B90lQfCNL0U/Ue4pGUR76SjzIjaQi0fBR/q3+lS2stkIGNDEvuzukM1stKcZprdi3Nl
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(136003)(396003)(346002)(366004)(230273577357003)(230922051799003)(230173577357003)(186009)(451199024)(64100799003)(1800799012)(55016003)(38070700009)(76116006)(110136005)(66946007)(66556008)(66476007)(66446008)(64756008)(38100700002)(122000001)(86362001)(33656002)(82960400001)(71200400001)(26005)(9686003)(53546011)(83380400001)(7696005)(6506007)(966005)(2906002)(316002)(478600001)(5660300002)(8936002)(8676002)(41300700001)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?k1tvzqAo/h8Vpl58rvixdVW6kQ1xOARuSc62yUbWjW9rTzzVUmm7Bnpo1H2y?=
 =?us-ascii?Q?zxdjvTwD0z73fLrUutuIMe3CYuoKT7Y6I0b0PbEySfNHNLwlpDEiIrZTzIza?=
 =?us-ascii?Q?Zt3WIjlOcZEVFyARDwIzIgDBweSG8i3u+HWhwpw+aukR8BkbNEAaU30CfGpZ?=
 =?us-ascii?Q?vYGXh6JhZh127FGtxUiy9Oz7DjjGexhNOdsxxWHpGvy3LfCoD1uSDS318lYH?=
 =?us-ascii?Q?5SGhZD51VZKhaip6sItSAaU/rC/y3I5I2aUxWi4xIJcVIFmoe3MT/natRt34?=
 =?us-ascii?Q?U+jpP7lOLYkrFWQ6+c4w7mKaO98WSoFUQ2pVjlqRAMxF6WKW9JSRQI7Ler9i?=
 =?us-ascii?Q?39BFkvWANLbnrA/jWZAZBMHbsdLOsGJFQyl6SCTpB4x93wzSRV81G+GuJH5c?=
 =?us-ascii?Q?oxzYCCMxm7h/qnePayrbU9IYb8Lbht0Nkfa/L730/M74QeVhYLQ4cNw0UrFy?=
 =?us-ascii?Q?reReKvz+p+iZw4DtXKfE8S7QKgR/ASMeyVhjt9dtB6RgHQW4I58BADckCjfg?=
 =?us-ascii?Q?GXcm+hTOZ3BC3BeBGdC1ZxtQj6d55fPA7AcXlw2+Kt9Nra7oTmie/FN0Ahta?=
 =?us-ascii?Q?pDMH/psLMX684ksJtaNaaDzaBS+zwOFGC9wf1ZQkYomA1kO81rcuVU6iwTEz?=
 =?us-ascii?Q?CrR5a8cuY8QutXaeoQpOeLubZKs+kx/iCoXvHWYmyi+7dVRf1/hHA+CPukWx?=
 =?us-ascii?Q?FudQCWiaQjBAUubkFBhhtse/Fr5RCWwAJMaj9DPgQzHcV5H4QvUzAsZVVCnb?=
 =?us-ascii?Q?B9JGdzgrJvJDJS32g7GAnS/pCBMloCmyB2HUuph0HJE4L97Ob9v39VPMVrJs?=
 =?us-ascii?Q?wmtFkAEDVh0ozeG4s1zcnwxLAk57bPkcBedq+hs8YlPEasLew/RHo39oTX1K?=
 =?us-ascii?Q?EsxpxFUMJGooqKyQPfFurLMZn+7d+AARQWxojMD4epdaA9m0WxaCx5w6MNWP?=
 =?us-ascii?Q?dIhjiLlXspZVMNd2zuSU4AggrxtwNgQPlwwOHvFP2Kjgr/s/pdfGbJJ1kli6?=
 =?us-ascii?Q?9DqZnxkNXbqhRUMmvDV+gZxaJ1NyPHT6V5HGSOLEJl5/WqHwX9+vvv0Wp6es?=
 =?us-ascii?Q?npV9rGWQJVpxDOixEERCHGBDxux12bZNYZyU9bNEsEsrePxp17TnPuvDwZp4?=
 =?us-ascii?Q?du4WjLeEIw/AHCJeQKUL3j/zUDaOvEO2G4GkEC6kfJejZBByAWfz2YAGobVH?=
 =?us-ascii?Q?1zm9IbrFFoso/FkMHqj6U2RJ13wCE2UqCFqieNsRu7zJ7oatryy4AZ2e+t4L?=
 =?us-ascii?Q?VE53Pa/5iTx7dQmY0ZnA2Sm5EyClt22mMbXp+AW/DI1iOlgIkmDt6zRNCUqe?=
 =?us-ascii?Q?fz87n3JmhRxvlffn6agD7mxUgByM/hxF/Vn+ahuZoZyon5pgb0W3mdePh/Te?=
 =?us-ascii?Q?vZ2xzKBEYblantdkfaiiqZ/Mxicorutauvy4LAr7KI/IOkkDEBoHOMr8/CQu?=
 =?us-ascii?Q?lflqxyPV2iAp8JCODtFDTcf+gsStDzqjscf2mExzuDHMSShzwEJnmVYnsalE?=
 =?us-ascii?Q?uwRjm6UNzwKcs+GIypugwdTltD2JHtZiJn4VoCly7dpL3MCw9wk8vB9WWwmu?=
 =?us-ascii?Q?6Z27Y+QOlAwvxpj6sR4J1i+LUjy544oLt/xz/g8D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf23860-103e-4933-3d79-08dbee9838e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2023 15:56:15.9443
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UO84G6N5zvmKwiWXP/mg9yNjlWGmIgXuVtjxiBT0PvzeKMR5ABJ4Gb64fir5ibn4GcmfZPc8YSzCNL/kB8iyOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6738
X-OriginatorOrg: intel.com

not_report

This is a "move files around" commit

diff --git a/fs/fscache/io.c b/fs/netfs/fscache_io.c
similarity index 100%
rename from fs/fscache/io.c
rename to fs/netfs/fscache_io.c

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, November 25, 2023 17:10
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [dhowells-fs:netfs-lib 1/56] fs/netfs/fscache_io.c: linux/uio.h is=
 included more than once.

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.g=
it netfs-lib
head:   69448342f13a737a392c45f17205bc3eaf242e9d
commit: 8baff6a0534a09984aeaa6f70069cfc68ad12a1e [1/56] netfs, fscache: Mov=
e fs/fscache/* into fs/netfs/
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311251612.f=
hxgKB5U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311251612.fhxgKB5U-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/netfs/fscache_io.c: linux/uio.h is included more than once.

vim +9 fs/netfs/fscache_io.c

   > 9	#include <linux/uio.h>
    10	#include <linux/bvec.h>
    11	#include <linux/slab.h>
  > 12	#include <linux/uio.h>
    13	#include "internal.h"
    14=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

