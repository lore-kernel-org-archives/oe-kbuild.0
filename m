Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1A45953E
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 03:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/dAu6ap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701399724; x=1732935724;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=J6kJXPi8bxvmRLgTUkKSv4npxSWQK7kNbkwvtCVMh7k=;
  b=f/dAu6apGIdZ7w8B7NoxnsUBOdTtmjtNCQJ+4Z9Ef4fq1fY9N2E4zvkY
   MzN6kAzP6xDoOSheJIgE8qzvZDCoN5D6rmCh1K1vW0zeZ/fqjFAfVgu0y
   2O3ThzzXjdMK/ML6UGvr/yW298JBgqXkmdbpSVVmhb2/aLZegf5D/3EK2
   MpR9YOhjoXdUnL1hlFFg1QRpztMd+Hy0EJpcGnWakaLxBX0hRja0La704
   ZYvpJgAAStsH1xGy7ZnGlK63QUFTnfCyBD9pZ465iAhmhR33/lukwqQTe
   vGOdz4ZgHkyCih3kS7+ui76xfuAa/XwvF8QZT3DWSrWX3DbNkzNGr5cpm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="372815428"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="372815428"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 19:02:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="840023070"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="840023070"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Nov 2023 19:02:03 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 19:02:03 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 19:02:02 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 19:02:02 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 19:02:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNBUdFh0lux6iX3v5znM+dRh9zm4mrnhZ50N9w9txP1PXljFfvXP/pM9LPQKOX/AenSk66rEaEu+ERqKRZ2h5JKrZCClAECB6pfYfatluDlLDqNoMtwXb/Nnh7peCO+d58srqad9AMhy2hm3aOuKcRQwkxNbz+mr8r8uVuQqREAUEJI9k6gr7DD7o9MWjmbcrQiu0ozaBfcUQBxVy595eC5k1JKcpC05MtD5XNK4o1hdSLiKI1rCe6UmmeZPRORCbjrOK4pFvzkppRGOTaykG77dUwkI1boS4Td4wB9Zig/W82j01DZUyNm0+T9RyFrckaTYzHA7l1nYRU1r8HzIhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6COFJN5gqpX0TVAxU4pbpgpdkFnaH8Jo+AgK2Jvg2D0=;
 b=HFyfqsDlv91oWbs5ntYW45/WIXp3QX+eeVmEhYkLSUvUnX3BjurLwGublunZiHjhhXIek9a2Hyl12YyWnF8XL62Ii0XHzB04mYYll6sXCzBZYhbqXaTXoKGcohOnl3Mwhu/oUxaDePbAKNA1yCB6QEAS1CCAY5swA+h+wxjK2+vEvcC4GhE2gZQ2bsdFCkHx4pe7omc32sk3EKwqEMV2vLO7ZU5FbL8zRV2WvGy24oCYHddoBDkeHAipu7s7z3p4T2qZehj5OAk5L3s+pp8uGGAYGkExQJJ039QdrDRO+9TgQq98PE/WeKapr6HVwbifQkH4Hx8y6ugioVrfh5Qrmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by MN2PR11MB4584.namprd11.prod.outlook.com (2603:10b6:208:264::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Fri, 1 Dec
 2023 03:01:55 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Fri, 1 Dec 2023
 03:01:55 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/watchdog/ath79_wdt.c:239:27: sparse: sparse: incorrect
 type in initializer (incompatible argument 2 (different address spaces))
Thread-Topic: drivers/watchdog/ath79_wdt.c:239:27: sparse: sparse: incorrect
 type in initializer (incompatible argument 2 (different address spaces))
Thread-Index: AQHaI+Ia5dvpXS160ki7i1tRW5p6ArCTvWmA
Date: Fri, 1 Dec 2023 03:01:55 +0000
Message-ID: <CY5PR11MB639245B15EF37B54E6F4446EFB81A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312010633.oPEUSquw-lkp@intel.com>
In-Reply-To: <202312010633.oPEUSquw-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|MN2PR11MB4584:EE_
x-ms-office365-filtering-correlation-id: 75c7c3f3-09a4-4c2b-afea-08dbf219e070
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wT5rvuinp5U9ijAy6nQlvfO/rAomRdNoKBRAoY80RamcQlQaeCfk1LYHB93RdTDTrNxXkRImi7KN7bmxImYI0C191lnJdhpBcPlgKx7DUlp9msFJXiDL+oj2VqAlPjRaMEs1jH+BN5eil1XMW9QOO2hq+PxcFPyeDg+mIDkMfPUKxgQV3qf1siPjYlFKLHpu6Zmb+xTbIwA6yb4JtHox6kFC2fAhoEVUNc2JwJ08z3BZzPBhkG1QeULzpuNj4P8lT6c/560EeJUrzuj+TrfIDRQKDLgfVTnmKHTn9b17VWq/PzUH88QLtuKmDw+7XxaAEm0bKA3q6NdGTfqVv1zaeFcJzph8thvinneQjnGXCyaFUG8jtiyQwAOdwjxL/AhLZaxmRTWQW0VYZJQ7F5whrJRPaJHI41TN5bS0e0Q/zk8CWlY2daGogEBXn1dBJyMrmwk7OVj3msm9hCMKfwwb7gNtLfiaFQ7x7RrfC/VevfOeJBam4S6D0yAvNqf6sxp3oiXp0+sUgttD9c5/4n/yxas8r8R9uCG3CRvUUG34iwsz2my+Pvf2UNuQ5DXdYhodJH9Vu8TM0t/TJ3hNR68W/BJQT5PQ786E5/re27N5YuWXG3efAaUgNuQ2Rbd/YwJBCjAmOia00o6ZTjYiDClElTiZ+kEe2FRPmG6cfScXi9BJdKZakGySS+txjxV7Yjrp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(366004)(39860400002)(136003)(230273577357003)(230173577357003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(55016003)(38070700009)(66946007)(66556008)(64756008)(66476007)(76116006)(66446008)(71200400001)(38100700002)(82960400001)(86362001)(122000001)(33656002)(83380400001)(9686003)(26005)(6506007)(53546011)(7696005)(966005)(478600001)(2906002)(110136005)(316002)(8676002)(41300700001)(5660300002)(52536014)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qLDZUX4W1w8uxwwfJ4gbK8BLzs8x40Gpi7HF491naXGTWXiWAIAju9+Hd8Ug?=
 =?us-ascii?Q?4DrFzii/d1194aW5jbZ/5TPvZf23pd1I9zRE/ckazS1KaAGYoWcmnpLelzoC?=
 =?us-ascii?Q?d1nq6HPejFQ6mWu0MJIO5Cqwu1vgDKbz5BTFDc9y1V1Yr8f2m/cd9OhBa+Pj?=
 =?us-ascii?Q?+ya5aPgbm5uTzWV6dfu99Yq38sUgbIqK2Gcv8U41mLvPE60HsJdutb4h8x4c?=
 =?us-ascii?Q?rcdbKTu1naArDZxsWZrDCa8fSc1D6y83NOaTPutEtJW1HLAW0yr36sgYc6/u?=
 =?us-ascii?Q?Yx3ttZSzBlxALV4YUJIfVVNB6vwgCG71zP7Om/CeWjydNb/1fTI71Zc9BOdd?=
 =?us-ascii?Q?IyKQULuP/SyoTmpXARPnryVh5OTR1Cv85L7ug8nepA7UfNWhhDmGsLfYhUwc?=
 =?us-ascii?Q?oGDLniT2fSOmH3nmf832AyAp0kdvKz/RPJmdhq8z+gmM7wMB5Me68L3lxUeI?=
 =?us-ascii?Q?ge84JeWLccMT01Uc4snru4wT3mUoWYsTB8vOfqI4yAN8nuA2CBg5RdOrb+ee?=
 =?us-ascii?Q?t6HKQWBEq2JbsctNFQ77bESrGef9DQW0/+EGAT9q1GLHiEaNMC2igM6+HBpB?=
 =?us-ascii?Q?DxsUNb3OsDYeeevquQRyAvHYojaqVzT9zrgrxO2aTBGeanNPXLDfzkdcZrSV?=
 =?us-ascii?Q?adiyFh52oLgxViG8jppIX6f9/DBAe+92diB2o2JZEGOdJx2IT7AMWPVuYFqH?=
 =?us-ascii?Q?fDEYcvT41xgCkfCZmIIbn1Zk1VJpTcZ3eOCwWBVQWKEihBip0dS1ILM9jMhv?=
 =?us-ascii?Q?XRabhdi250oq7EIuepRj+4b52BbzodD1Fkmc+RaWYCMaZDNYpcjq7PibCyMC?=
 =?us-ascii?Q?Gz4ajrsyE4EZruMSmZHUXiVYqhLjUpcDkCBXIDNTZ3VpaXMJ0oiSBc+hLsCc?=
 =?us-ascii?Q?Pr2CZ8KXvn99otqN31/mkbzgaqmM4RVi727vPUbQ3Ek+Ls4y6HYPMqWFfqd2?=
 =?us-ascii?Q?UamAlWfiup1VujUdIqNdpbsSCPiwUBxFBO+leWJIHhIyiFkUzOcz/KR/mocn?=
 =?us-ascii?Q?BnAto/rHz/2NiRe6HzsejJJ3KGQc5Qa+tMqwKJBASV1cZe1vfOKGXMPlXRf0?=
 =?us-ascii?Q?qYRvDde+cEFswZCMgBlnDBHWI3EzSD4n+lCnkV8VV8+A1Z/86LSYdWj/l0im?=
 =?us-ascii?Q?Uuv/Zc+WBOhsHEs1uhALiJUVjIe9stkJJgd2O+P5yB4AlKJkKbSPybear4/7?=
 =?us-ascii?Q?5Q8ec8D9EAOl0u7pfCqJCkHeBP54AGKVWR6xKim6vNqZePE1SMlnlEpi3jWw?=
 =?us-ascii?Q?lJhHpZQ63SydVAJCyb9/SaJv6wdEUQwD2bYHCJeKXg6Gs5XZ9jZGmaOgSzh/?=
 =?us-ascii?Q?MhjqmTeAyFTogaV7dwag7DRIP27US+QIpzvqBYXrbj32VJfkrxgyzuesDjfL?=
 =?us-ascii?Q?J8o6e4gnJ1oGyEaucPx6l9kd5yHxqrnmmeVXRASq1+EqUTJvD5LUdP/ur4Dd?=
 =?us-ascii?Q?1J2dtI+k+69Dt38sk+Wy/wXxBZG0Amms7yuQX2DAivcq3vv4p6KG88toda4Q?=
 =?us-ascii?Q?/gdxmOSXQHAN+6Fa+jPOst3OtCjEBH9TsQ61tj0thjHu9yuBFlgch60AgPzJ?=
 =?us-ascii?Q?8JeIb9OZvD8tpTsttJJLVrXzGkTV+u+RQHqnTmZr?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c7c3f3-09a4-4c2b-afea-08dbf219e070
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 03:01:55.6457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: igf4kFZVizqE9mkuEZu3wvmlK9v6+Y02TGZw9nb+O0rjoTiNin5/NTT2ka4h8krTTWrjed0eonBYLCIpN7JM/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4584
X-OriginatorOrg: intel.com

not_report

Only kconfig change.

drivers/watchdog/Kconfig | 118 ++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++-----------------------------------------------------------
 1 file changed, 59 insertions(+), 59 deletions(-)

7 years ago commit.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Friday, December 1, 2023 07:00
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/watchdog/ath79_wdt.c:239:27: sparse: sparse: incorrect typ=
e in initializer (incompatible argument 2 (different address spaces))

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
commit: da2a68b3eb47b9fb071def3f374258b2ce454096 watchdog: Enable COMPILE_T=
EST where possible
date:   7 years ago
:::::: branch date: 32 hours ago
:::::: commit date: 7 years ago
config: arm-randconfig-r123-20231107 (https://download.01.org/0day-ci/archi=
ve/20231201/202312010633.oPEUSquw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312010633.o=
PEUSquw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312010633.oPEUSquw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/watchdog/ath79_wdt.c:165:37: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void const volatile [n=
oderef] <asn:1> * @@     got char const * @@
   drivers/watchdog/ath79_wdt.c:165:37: sparse:     expected void const vol=
atile [noderef] <asn:1> *
   drivers/watchdog/ath79_wdt.c:165:37: sparse:     got char const *
>> drivers/watchdog/ath79_wdt.c:239:27: sparse: sparse: incorrect type in i=
nitializer (incompatible argument 2 (different address spaces)) @@     expe=
cted int ( *write )( ... ) @@     got int ( * )( ... ) @@
   drivers/watchdog/ath79_wdt.c:239:27: sparse:     expected int ( *write )=
( ... )
   drivers/watchdog/ath79_wdt.c:239:27: sparse:     got int ( * )( ... )

vim +239 drivers/watchdog/ath79_wdt.c

f8394f61c66f48 Gabor Juhos 2011-01-04  152 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  153  static ssize_t ath79_wdt_write(=
struct file *file, const char *data,
f8394f61c66f48 Gabor Juhos 2011-01-04  154  				size_t len, loff_t *ppos)
f8394f61c66f48 Gabor Juhos 2011-01-04  155  {
f8394f61c66f48 Gabor Juhos 2011-01-04  156  	if (len) {
f8394f61c66f48 Gabor Juhos 2011-01-04  157  		if (!nowayout) {
f8394f61c66f48 Gabor Juhos 2011-01-04  158  			size_t i;
f8394f61c66f48 Gabor Juhos 2011-01-04  159 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  160  			clear_bit(WDT_FLAGS_EXPECT_C=
LOSE, &wdt_flags);
f8394f61c66f48 Gabor Juhos 2011-01-04  161 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  162  			for (i =3D 0; i !=3D len; i+=
+) {
f8394f61c66f48 Gabor Juhos 2011-01-04  163  				char c;
f8394f61c66f48 Gabor Juhos 2011-01-04  164 =20
f8394f61c66f48 Gabor Juhos 2011-01-04 @165  				if (get_user(c, data + i))
f8394f61c66f48 Gabor Juhos 2011-01-04  166  					return -EFAULT;
f8394f61c66f48 Gabor Juhos 2011-01-04  167 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  168  				if (c =3D=3D 'V')
f8394f61c66f48 Gabor Juhos 2011-01-04  169  					set_bit(WDT_FLAGS_EXPECT_C=
LOSE,
f8394f61c66f48 Gabor Juhos 2011-01-04  170  						&wdt_flags);
f8394f61c66f48 Gabor Juhos 2011-01-04  171  			}
f8394f61c66f48 Gabor Juhos 2011-01-04  172  		}
f8394f61c66f48 Gabor Juhos 2011-01-04  173 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  174  		ath79_wdt_keepalive();
f8394f61c66f48 Gabor Juhos 2011-01-04  175  	}
f8394f61c66f48 Gabor Juhos 2011-01-04  176 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  177  	return len;
f8394f61c66f48 Gabor Juhos 2011-01-04  178  }
f8394f61c66f48 Gabor Juhos 2011-01-04  179 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  180  static const struct watchdog_in=
fo ath79_wdt_info =3D {
f8394f61c66f48 Gabor Juhos 2011-01-04  181  	.options		=3D WDIOF_SETTIMEOUT=
 | WDIOF_KEEPALIVEPING |
f8394f61c66f48 Gabor Juhos 2011-01-04  182  				  WDIOF_MAGICCLOSE | WDIOF_=
CARDRESET,
f8394f61c66f48 Gabor Juhos 2011-01-04  183  	.firmware_version	=3D 0,
f8394f61c66f48 Gabor Juhos 2011-01-04  184  	.identity		=3D "ATH79 watchdog=
",
f8394f61c66f48 Gabor Juhos 2011-01-04  185  };
f8394f61c66f48 Gabor Juhos 2011-01-04  186 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  187  static long ath79_wdt_ioctl(str=
uct file *file, unsigned int cmd,
f8394f61c66f48 Gabor Juhos 2011-01-04  188  			    unsigned long arg)
f8394f61c66f48 Gabor Juhos 2011-01-04  189  {
f8394f61c66f48 Gabor Juhos 2011-01-04  190  	void __user *argp =3D (void __=
user *)arg;
f8394f61c66f48 Gabor Juhos 2011-01-04  191  	int __user *p =3D argp;
f8394f61c66f48 Gabor Juhos 2011-01-04  192  	int err;
f8394f61c66f48 Gabor Juhos 2011-01-04  193  	int t;
f8394f61c66f48 Gabor Juhos 2011-01-04  194 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  195  	switch (cmd) {
f8394f61c66f48 Gabor Juhos 2011-01-04  196  	case WDIOC_GETSUPPORT:
f8394f61c66f48 Gabor Juhos 2011-01-04  197  		err =3D copy_to_user(argp, &a=
th79_wdt_info,
f8394f61c66f48 Gabor Juhos 2011-01-04  198  				   sizeof(ath79_wdt_info)) =
? -EFAULT : 0;
f8394f61c66f48 Gabor Juhos 2011-01-04  199  		break;
f8394f61c66f48 Gabor Juhos 2011-01-04  200 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  201  	case WDIOC_GETSTATUS:
f8394f61c66f48 Gabor Juhos 2011-01-04  202  		err =3D put_user(0, p);
f8394f61c66f48 Gabor Juhos 2011-01-04  203  		break;
f8394f61c66f48 Gabor Juhos 2011-01-04  204 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  205  	case WDIOC_GETBOOTSTATUS:
f8394f61c66f48 Gabor Juhos 2011-01-04  206  		err =3D put_user(boot_status,=
 p);
f8394f61c66f48 Gabor Juhos 2011-01-04  207  		break;
f8394f61c66f48 Gabor Juhos 2011-01-04  208 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  209  	case WDIOC_KEEPALIVE:
f8394f61c66f48 Gabor Juhos 2011-01-04  210  		ath79_wdt_keepalive();
f8394f61c66f48 Gabor Juhos 2011-01-04  211  		err =3D 0;
f8394f61c66f48 Gabor Juhos 2011-01-04  212  		break;
f8394f61c66f48 Gabor Juhos 2011-01-04  213 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  214  	case WDIOC_SETTIMEOUT:
f8394f61c66f48 Gabor Juhos 2011-01-04  215  		err =3D get_user(t, p);
f8394f61c66f48 Gabor Juhos 2011-01-04  216  		if (err)
f8394f61c66f48 Gabor Juhos 2011-01-04  217  			break;
f8394f61c66f48 Gabor Juhos 2011-01-04  218 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  219  		err =3D ath79_wdt_set_timeout=
(t);
f8394f61c66f48 Gabor Juhos 2011-01-04  220  		if (err)
f8394f61c66f48 Gabor Juhos 2011-01-04  221  			break;
f8394f61c66f48 Gabor Juhos 2011-01-04  222 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  223  		/* fallthrough */
f8394f61c66f48 Gabor Juhos 2011-01-04  224  	case WDIOC_GETTIMEOUT:
f8394f61c66f48 Gabor Juhos 2011-01-04  225  		err =3D put_user(timeout, p);
f8394f61c66f48 Gabor Juhos 2011-01-04  226  		break;
f8394f61c66f48 Gabor Juhos 2011-01-04  227 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  228  	default:
f8394f61c66f48 Gabor Juhos 2011-01-04  229  		err =3D -ENOTTY;
f8394f61c66f48 Gabor Juhos 2011-01-04  230  		break;
f8394f61c66f48 Gabor Juhos 2011-01-04  231  	}
f8394f61c66f48 Gabor Juhos 2011-01-04  232 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  233  	return err;
f8394f61c66f48 Gabor Juhos 2011-01-04  234  }
f8394f61c66f48 Gabor Juhos 2011-01-04  235 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  236  static const struct file_operat=
ions ath79_wdt_fops =3D {
f8394f61c66f48 Gabor Juhos 2011-01-04  237  	.owner		=3D THIS_MODULE,
f8394f61c66f48 Gabor Juhos 2011-01-04  238  	.llseek		=3D no_llseek,
f8394f61c66f48 Gabor Juhos 2011-01-04 @239  	.write		=3D ath79_wdt_write,
f8394f61c66f48 Gabor Juhos 2011-01-04  240  	.unlocked_ioctl	=3D ath79_wdt_=
ioctl,
f8394f61c66f48 Gabor Juhos 2011-01-04  241  	.open		=3D ath79_wdt_open,
f8394f61c66f48 Gabor Juhos 2011-01-04  242  	.release	=3D ath79_wdt_release=
,
f8394f61c66f48 Gabor Juhos 2011-01-04  243  };
f8394f61c66f48 Gabor Juhos 2011-01-04  244 =20

:::::: The code at line 239 was first introduced by commit
:::::: f8394f61c66f48b1fe9d6964ddce492d7f9a4cd9 watchdog: add driver for th=
e Atheros AR71XX/AR724X/AR913X SoCs

:::::: TO: Gabor Juhos <juhosg@openwrt.org>
:::::: CC: Wim Van Sebroeck <wim@iguana.be>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

