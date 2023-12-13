Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C79C14C
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 06:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oEji3gup"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702449068; x=1733985068;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=3Ez3TDbWbmV9bkN55bxUMGX0RiXwslEJtBxSFs1ObJo=;
  b=oEji3gupkx4R/8+3LZ6FYBA1ZrjLy2E+rzL+Eul4My2FZHe5YCIKX3xL
   5dzFDdv8TvSCc6yerWSBiLQd4uU8LUeIpesqqXfgQ/xibuSD5hgszYPcx
   Ev8ooWJjpanDUOOS2tFbrCqBrGrVAqLFl8vlmmRAD5W5g5W25TjoEvQdj
   LoK2llwyNgi0szgw2tmeXl82oYBg1czsTLps/kEoO5f2ud8X6CowAUO4t
   ILl2vJve0DPVtrdIPQWacEM7zNMq+L7AXoRKfuMrGJ/s23jIaG9i+RC33
   KmuQdVmCklLk0kXf/vcF0B0Fy/kbmsl8qsKAdS6lEym/h2z8xy+cYQgqZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="374425687"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="374425687"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 22:31:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="808050706"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="808050706"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Dec 2023 22:31:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 22:31:05 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 22:31:05 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 22:31:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5qHZ0amPqVdEuC5yWUqZ7Ja0+Ho4UsTTTgNgWYAS+n9mSBVOTm4Y+Um/1quSMusxPu2lDqRfBhtA40k1dNlAMpWAhzjCWVN8anpoaY3WxNNHO30C13wOT9EI2QOrfXYyfzuUnO80MvNmtIShP+LhILJRB+zAAn45rgcNhiRPLeAahkLj5xz1+770x91Ii3r2GX7h5zxgeKpSFZlfaKoOrRcy2+WY8fMrEXxkAwrkEnlMEhrO6aUCmSlhWIdMF2iD/KCB/e6fwa7vKOoebIch582t7AtlrLo2Lf9/5paNBa5gkqIbv6CZQjH3iMzoOcrexYMhgRi6r7kb68GboBuZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaDhqriL1PuOaINxIRTVDLe619J6y6AGrx8Lq+WqS64=;
 b=d5/oJeKoF4uNFccL85C8lgTp+81MwBaR8I6e6vTqqHUKSusjgoSa7sPl8opM+lDrVpnByHK32qlzBxv4DEAfvIYDFsWeGDBvMBXxnylC6g5z+8gM3A1garhhkI5wwnHXdbnmnwIPZenKyJwZQ9U4X+uzrnb3FcpmkGkNzEzVW1UHKRdl8T3lqjirSmXR/m6+nkiNxY/iw6boBOtq0cC8dtVJk0tqUI/XKgmscmDaVQ7OPqm1MUIUvOjn1ySwdTOAf/H0uTvUUXGvEeSF37QHTYO/K24NcIWyJHc82Qc1O3+UVnPbeMZZzVKmkGGTgr6qPGmKEt3+VwYBBKkZ2jyDoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DM4PR11MB6429.namprd11.prod.outlook.com (2603:10b6:8:b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Wed, 13 Dec
 2023 06:31:01 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7068.033; Wed, 13 Dec 2023
 06:31:01 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/watchdog/ath79_wdt.c:161:37: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Thread-Topic: drivers/watchdog/ath79_wdt.c:161:37: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Thread-Index: AQHaKo+muIxNhWOQ3ES7iMVuaJVEBrCmxnLQ
Date: Wed, 13 Dec 2023 06:31:01 +0000
Message-ID: <CY5PR11MB639260B09E151FF49ED7C419FB8DA@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312091851.OVvu4Nax-lkp@intel.com>
In-Reply-To: <202312091851.OVvu4Nax-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|DM4PR11MB6429:EE_
x-ms-office365-filtering-correlation-id: 2d84723f-bdf9-4982-b1a7-08dbfba51380
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fum9wHywkCRJVmIXVEhSpuEnCJdgPkdPtc3gCqn+9fPuyfim7ar5tSHHjYwcY95dFO45OZDnk0/ZXIob+Ac+/ae0Cf+kP5bCSMIbKRsMYHn5ldGr7u/3G2QYjcRVHvHu8iMvyWhbKZ2UhET6NgAMwK7U6/GuEVLF6gbNePybJzDvAVhT2JMBqbnx7BWNfdg6vabqaY24VPaqBZ288ZRY8VSzmr/AOoqJ/9xTXHX1QKS7YT9J+7AqL4OiF78Ibg3ua5IORaLdD5GnIUDn8nkXVbQo9fVi8vmALE+xme7a0WEaQ+B/D7H4Idi516G43fS0CwLyr1VDuEuVL2GDUMPfrh7jSj59+SjKAeGayt28AWcm6Slxi9GoKMJD39mjGUuso70VyI+uFaJyHHIUt2S25LjoN2fUiG25mFqT2Cz7Mwl3VQhymMN/bILtaaZEHPrKJtfAmkabGGTiL/ypRKLcKkeTZ3z6hhA/iRLk9cADEtFEL3fgZxNkj5Gra6aFVSWxVV8SRTMtnPFwnO/0LOS+PfTsUpSgrlPC3K9FicO47SxvrUcBAWBxAs8oeqy96dbrANeKpJWcrworwReFQTTyKVVkaYjDbq0rVVAK5Jt3/I3mAXf3rp8o+k7l2vvZ88U1sCXyxGQjkZiuS/pCr6GLbbcZUsSFIMeJb2nOOvdWCdGCZo4KlzxrvHSTlry5/JCd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(136003)(396003)(376002)(230922051799003)(230273577357003)(230173577357003)(451199024)(186009)(64100799003)(1800799012)(71200400001)(8936002)(8676002)(86362001)(478600001)(38100700002)(316002)(122000001)(41300700001)(966005)(82960400001)(83380400001)(38070700009)(5660300002)(53546011)(26005)(7696005)(6506007)(2906002)(110136005)(66446008)(66476007)(66946007)(64756008)(66556008)(76116006)(9686003)(55016003)(52536014)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pgoHGcV5uj7+lt/1lCbPk4fePX/rtW9q3Y5yUvjNRBDEzojKlLoFa5dzv+9M?=
 =?us-ascii?Q?FYL1goG36KwltBDM9XYI2gE9wJDSWnSwcmnI3OHdjXE8pAWQUMl4R0ipCcAS?=
 =?us-ascii?Q?muwqlEA0mRueG234mD6jXYA3q8nEauafcYqj2TF8+Zk/ssTEXyWNz7nLgG/c?=
 =?us-ascii?Q?LbFcU/jP2tIlnoVBx+nfCjnNO+BzLcHfWrBUIKQNnu5kYYcLKHXezwuMVrwG?=
 =?us-ascii?Q?KPQ4bqQxVPGMfu7uDe3wIBZoIgzzMENa4s4aXsmnnicZokdvzrn8mM6Jrsxh?=
 =?us-ascii?Q?OxuFIdwYUIz2H3DU4suMWfjBb9bv2IRh5iDxbeZn6sdtQNdRON6DgOfKPSph?=
 =?us-ascii?Q?YxrsxPQS1jd+Z7LLGu1qW/SEovc2wwi5UbiuBtiRkNQ7UN2a/Q6ylaY1Zl/u?=
 =?us-ascii?Q?bjJ6/o+hPp7su5njMzpgGNIZ0/9T0LNsz75nV9v7f0ChJBg0F7mr6Ha0G7wb?=
 =?us-ascii?Q?5uWaM9Q8hi4CNUyt+Yl4X7xXgk138ywp0iK6h4+0389JVJU9ZLYr6IhCntWJ?=
 =?us-ascii?Q?dQJCMQnwzAhsaHtWr8DTzd1gBAby2/RNkh1xLF05TR3GPEEksT16tKX7zFdX?=
 =?us-ascii?Q?1Y8/qlwlcDGmIVxxdIcaQS00EgUplb7lgoCN/0J2soWd7yy+KcAhBotEKatE?=
 =?us-ascii?Q?3K72PdEDqHDfOCW0gnUSwu6wCnSakaNCWlT9wia/eLf5IsRXY+Ixz7/21xDa?=
 =?us-ascii?Q?kgggFn0WJ6eW1pPLNLIWc/ztZDUENgsE9ggg3BU9eLstRsJxeOxFwIXK/V7T?=
 =?us-ascii?Q?PsHcvVGtn6T8czpPpfE0v3/NMCuPm/4Yd0Gbj33dwU2roiFmB+gr5sL9YK12?=
 =?us-ascii?Q?Y+UZD82IHtCmL4gsdk/RKzJD8IBL7/vj9cwmM5FiMvGNcXupdJ4HfRZoYe/5?=
 =?us-ascii?Q?cULJVmPLrZwCYMVQNUhoVdfP3BTITs7vS0+n+hQTxloaNAsYFBNkaHAfI+Jh?=
 =?us-ascii?Q?WH1OLEpfw7UJZQ42/Wg8AqDRL366H0qwgWSt9v6q5+yNtaGDb8EJl0YS3Vd6?=
 =?us-ascii?Q?SCXp+aJFhC+YuJZ1UDJsY0pT+xuAbqhYL5n0QCSGJyzg370NaCJtfKj3IS/1?=
 =?us-ascii?Q?m5Zsdrm0SPuaD8g7NSxXCCBrxDq09qCWUQbQSFG7xc/YkDVgdEa1xfIIdtxq?=
 =?us-ascii?Q?lSmnP60sldOScK5UtYKwBCiJXRV0Xq1s0+BqZKw61OhMd9X6VZ2Y2D7prNII?=
 =?us-ascii?Q?UYveH+EK7r4T6S5yZ2KxdaBTcy+fnJbknHkXDG9lPhVLQoyGYlHFP8zSW+DT?=
 =?us-ascii?Q?20/wecEpRrctn7s0LQdeFkzOxtCMDGdhFxurE8CaJWztc6Xug7kLhe14zHkf?=
 =?us-ascii?Q?y77QW3FgWfDJpCA0QYLaaxeezT5C5kf7z4o5seDLpaFS/mt592Ighj5CrGNv?=
 =?us-ascii?Q?vcslXkoOgxJIzYkjRVNAnXDu5VgO3bik5EOTOeEntjXKf4Q0ZnwZzzW3eiWy?=
 =?us-ascii?Q?Q3raZWbjN5eGQga6swiIXlvJk1VqYYmfO+YijXKMsgYwRp5+5jHHKZWh4v6U?=
 =?us-ascii?Q?Vm5FJm+F7s4qjQCOlOebjN7sKd5qbblYpGPEgudPv+heIdvqzVtZ5hQovvVF?=
 =?us-ascii?Q?YPN8rTHqibf/N/5I/wcoakOiZhIL/BELW8xusOQV?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d84723f-bdf9-4982-b1a7-08dbfba51380
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 06:31:01.8159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IL1vlkXiHPE++/GTkcY7/WruLmfEZkTPPsR58uvjtjqOfhjPaQAVsr5k+KvaI4y6pW85zK32i+X1y7uWNH2cBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6429
X-OriginatorOrg: intel.com

not_report

This is a sparse patch, not the root cause of the warning in watchdog drive=
r.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, December 9, 2023 19:03
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/watchdog/ath79_wdt.c:161:37: sparse: sparse: incorrect typ=
e in argument 1 (different address spaces)

::::::=20
:::::: Manual check reason: "only include/linux/compiler_types.h file chang=
ed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f2e8a57ee9036c7d5443382b6c3c09b51a92ec7e
commit: 25fd529c34d063d1bef23742f2e8f8341c639dc3 sparse: group the defines =
by functionality
date:   3 years, 4 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 3 years, 4 months ago
config: arm-randconfig-r123-20231107 (https://download.01.org/0day-ci/archi=
ve/20231209/202312091851.OVvu4Nax-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312091851.O=
Vvu4Nax-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312091851.OVvu4Nax-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/watchdog/ath79_wdt.c:161:37: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void const volatile [n=
oderef] __user *ptr @@     got char const * @@
   drivers/watchdog/ath79_wdt.c:161:37: sparse:     expected void const vol=
atile [noderef] __user *ptr
   drivers/watchdog/ath79_wdt.c:161:37: sparse:     got char const *
   drivers/watchdog/ath79_wdt.c:235:27: sparse: sparse: incorrect type in i=
nitializer (incompatible argument 2 (different address spaces)) @@     expe=
cted int ( *write )( ... ) @@     got int ( * )( ... ) @@
   drivers/watchdog/ath79_wdt.c:235:27: sparse:     expected int ( *write )=
( ... )
   drivers/watchdog/ath79_wdt.c:235:27: sparse:     got int ( * )( ... )

vim +161 drivers/watchdog/ath79_wdt.c

f8394f61c66f48 Gabor Juhos 2011-01-04  148 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  149  static ssize_t ath79_wdt_write(=
struct file *file, const char *data,
f8394f61c66f48 Gabor Juhos 2011-01-04  150  				size_t len, loff_t *ppos)
f8394f61c66f48 Gabor Juhos 2011-01-04  151  {
f8394f61c66f48 Gabor Juhos 2011-01-04  152  	if (len) {
f8394f61c66f48 Gabor Juhos 2011-01-04  153  		if (!nowayout) {
f8394f61c66f48 Gabor Juhos 2011-01-04  154  			size_t i;
f8394f61c66f48 Gabor Juhos 2011-01-04  155 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  156  			clear_bit(WDT_FLAGS_EXPECT_C=
LOSE, &wdt_flags);
f8394f61c66f48 Gabor Juhos 2011-01-04  157 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  158  			for (i =3D 0; i !=3D len; i+=
+) {
f8394f61c66f48 Gabor Juhos 2011-01-04  159  				char c;
f8394f61c66f48 Gabor Juhos 2011-01-04  160 =20
f8394f61c66f48 Gabor Juhos 2011-01-04 @161  				if (get_user(c, data + i))
f8394f61c66f48 Gabor Juhos 2011-01-04  162  					return -EFAULT;
f8394f61c66f48 Gabor Juhos 2011-01-04  163 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  164  				if (c =3D=3D 'V')
f8394f61c66f48 Gabor Juhos 2011-01-04  165  					set_bit(WDT_FLAGS_EXPECT_C=
LOSE,
f8394f61c66f48 Gabor Juhos 2011-01-04  166  						&wdt_flags);
f8394f61c66f48 Gabor Juhos 2011-01-04  167  			}
f8394f61c66f48 Gabor Juhos 2011-01-04  168  		}
f8394f61c66f48 Gabor Juhos 2011-01-04  169 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  170  		ath79_wdt_keepalive();
f8394f61c66f48 Gabor Juhos 2011-01-04  171  	}
f8394f61c66f48 Gabor Juhos 2011-01-04  172 =20
f8394f61c66f48 Gabor Juhos 2011-01-04  173  	return len;
f8394f61c66f48 Gabor Juhos 2011-01-04  174  }
f8394f61c66f48 Gabor Juhos 2011-01-04  175 =20

:::::: The code at line 161 was first introduced by commit
:::::: f8394f61c66f48b1fe9d6964ddce492d7f9a4cd9 watchdog: add driver for th=
e Atheros AR71XX/AR724X/AR913X SoCs

:::::: TO: Gabor Juhos <juhosg@openwrt.org>
:::::: CC: Wim Van Sebroeck <wim@iguana.be>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

