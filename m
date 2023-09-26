Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F9446A8
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Sep 2023 06:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695708726; x=1727244726;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=rnHpwaB+sDEgg2GxrG5a48EGFsRte6NuEm24Cgtcf8Q=;
  b=ep2IREAbYg59/bcOjbS3R+sJK7t7yerIzzkan2wqdoND78BeNqkK40Jl
   /knaksve20U0R1Tf9PAh0maUzhni8RTqmvmudkQMMIIgWoxSlXSe+tle5
   wZGUeKV7IcIarIMHqk2KUH4G4nfBXjOlgCU5FduPeZgKEn6wC5/QS8uvX
   L8N5/lKgE4xdy6ALlkzGDmijiA/+zQf7gf+Zls91iZ+n/usu5HoC2/PKi
   zVerJmGHXq2fWSkBF4IL+8Z9t8PywW8YRhSoOhAPMc04NnQgdfMaXE+CR
   COgF7GdDrDTzZ/2cK3HrAD4tjGHrSb5xaGjd4sDScwLUJ/CJJAx9u+8R/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="447991918"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="447991918"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 23:12:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="777999237"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="777999237"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Sep 2023 23:12:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 23:12:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 23:12:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 23:12:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoVd4ePd1HKUGHLqjY5eImgxIkWYEQeaSTZL6RS0MyGD83DuGbmtRrHNNsrmKU0Id1sgmQPzxXuSQ32U1dwPFsv7IJ+zKe9UC6Ipi9DyY4tmypRSZE62PEKYYtOPtmZEVyb8jFONFlk3ZtNJUHzU1Nm7MEWkQoAmkDFQVhwJZMbr4Gn71/U+0i0ra/Qdn1aW0aXjaHTicMMZtG1vUUG8yDCJ6NOVq31IMO73Z0/gAWzvjUrc/x6aBkrXbb4CSb1VJfSG6OcGe7FMRRZgGnuvs+efnnCJo4ZT0VoX5nCMs3TFRq34i08V3dXW9YUMkenQB1FyLicn5zkGEY757QP+8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlD2OoiAh+yEupA2aq4rbacdBPOWDTxgKbqMY5H0Stc=;
 b=m79xD0vlMBi2yx0OGW005EJTuoLLvBg1p0Y7VvEnbJSCjBKUYfzowUl/erV8Pyt2vDOFKqgGQ4XrXsvYxDGV/dOgw7Vo+cut4v5C6RFVwCFkbPbAp6vb6E+ZKAlD5ctAdpyacOv3EYSyoxtg4wBV53hJeKXozQHryLLjuSORsHOZAwp3hcVz7rM8yuCIx0GhBbxBWnDBiFPKELdKZwvIV/egBjHdNx65yYhysoyNJJI8wQyA7sCop6lIhCAjPzggdfqfH1EdERPpJLHRpBVq19YlFF/psZeOwLJwNvMNl0DerlNfCKscIWUbAztSN80NlcsqCipUTwcm2Dxh3++USg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SA0PR11MB4767.namprd11.prod.outlook.com (2603:10b6:806:97::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:12:03 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5%7]) with mapi id 15.20.6792.026; Tue, 26 Sep 2023
 06:12:02 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [PATCH v4 05/18] EDAC/synopsys: Add DDRC basic parameters
 infrastructure
Thread-Topic: [PATCH v4 05/18] EDAC/synopsys: Add DDRC basic parameters
 infrastructure
Thread-Index: AQHZ7p9uajy0zy4UY028drdhEShgfbAsoyKQ
Date: Tue, 26 Sep 2023 06:12:02 +0000
Message-ID: <CY5PR11MB63929B64448E617B7D60890DFBC3A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202309241117.1QIu7Ipb-lkp@intel.com>
In-Reply-To: <202309241117.1QIu7Ipb-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SA0PR11MB4767:EE_
x-ms-office365-filtering-correlation-id: a3369a98-4149-4c33-1a32-08dbbe578070
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zrOUeftkooYzKVCTxiH6BDARLkQDMFA+fEmaA7FPkoJEXWkaIU5AMCGBaMbkE6BTMg/BSSJZcLbAPIN33uQAfr21litvqHqJm0ohp+oVHqxet1d29ifbl5DMbRFNW8CeUxZHX8n3J+aoKl56H2IKANMdpC4VFuE+zEvUv4cQelgGH0mcFqWbshFEqGVYSUKF9n7T70sI8m2pJJSYgqzmZcGGz3IhvlUL7tKGEShdVX+1QM1R2h7NFPPtcqCZGs/FzpF1g+7b+len1ofIQ1hEY1GKGCTt0nUpOiUdKEOrBhkjDLLy5Vxkd6iCi6sve7EEQgTEkonmJTVXKqC0JhgjVWVJJipjZjEoYUZHhF+KD4UO1EEseUTwos2ghA35MnkS1zW5g/ARjR1PHb2iqPwkdILUyNgck9t7l9bibCCRF9FOKtsHQQdoJbd7TlnPFPH+rHj9c3zSuDHfffbnifdmdBXVzv3LtjxYX+wq2AYjfxinVER4nTGehvWIAtUnv2msAk+qOXEjqYJ3lRHV7MuRbwYXBeJETODlqwKvdUNVo6kCql+ZBkrjGcD+hG3uo7XMNVX6xgT9PQs3PIVqaaHkVSz3jc0KP/yNiZ/2ootNZm+vlBVhquckXRoSGh4QvwHapLCsqjDyIVkqquh5M78A1A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(230922051799003)(451199024)(1800799009)(186009)(8936002)(8676002)(55016003)(26005)(110136005)(52536014)(2906002)(478600001)(966005)(66476007)(41300700001)(76116006)(316002)(66556008)(66446008)(66946007)(5660300002)(64756008)(6506007)(7696005)(71200400001)(53546011)(9686003)(83380400001)(38100700002)(122000001)(38070700005)(82960400001)(86362001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w3Ub6/WDl6k+svJONqO+yzrh7akNCU/9SHZ7+WsRX/nM9T33Stf14SdUOJZd?=
 =?us-ascii?Q?uUS38w4xfcDhP0RU66/8HUzFc0obYu//bgcTeC4fbJGCBF24oF+tc9hx7fjH?=
 =?us-ascii?Q?UjkycFMcl4Rjga7GZKiPAMWj4BpME7ZxlMyJyUP6J2BthNYK0eZVjk+FFXyT?=
 =?us-ascii?Q?WeoWd5vc9vcz+g5dkg746cXgPEYQLbBTqNfoMofTqb4OAyS2vefsE5AEbIPB?=
 =?us-ascii?Q?NGlwo3zxOCoxZvQG/gAnqTA7j5wT/1/BX+IXQzjoNbKCCeKvENTORMOs8yAc?=
 =?us-ascii?Q?Rq6Lt68gGpxGhF9r+lFXQ8RdiIzdsskuuP2ZSlHPQnxs31dwzSym1KhV2vV7?=
 =?us-ascii?Q?zZFmppsM9DAVOQP34cW/fduPCUb1qXW1L8pEY0x12Vks8wf/Q8j+IW/iihrl?=
 =?us-ascii?Q?rUTY+e7/5eiCzr9WIMvcte2ylidHj6YkM2frIig8G3ZuCN51ZDwAQgttBCA1?=
 =?us-ascii?Q?Mg55Jf+vmCKmihcZqyOxg1Ba3PuIH8qRTpDBez5DXJzihl2VXcqMMKEep8yS?=
 =?us-ascii?Q?KGj6n4xh9ePEs9SvOSfL0aS0cUlyT3me4vb90Nlbb9Xn+HkjUF51X6tFRrqD?=
 =?us-ascii?Q?Nn009YwhxnL/cDJOl2/qfkMWHzZVctxSNGBKSClhqlufCC7nKVaKoU4FNe/N?=
 =?us-ascii?Q?Uf/3RNtPNFCFczOTXpFm9vom25GH0YxWOJ0rFnRkJKZCOtEFLw7DhU4TyrIj?=
 =?us-ascii?Q?5nmErsnoMSUcHHS62hOmSt0RpDADfMC79qsFE7t0Q3zZTiIHnF2T5YM4BwPo?=
 =?us-ascii?Q?BOsvppJvRAWvIffyjdfAncooWW7fw17tejKAcjSRVBN5d7ZRS1I10F+OZhs4?=
 =?us-ascii?Q?pwc88E/AaXSBOwewACgACRbpbVEqoOdOqVnfuYMejv40JYUHob3iaEGDSl7E?=
 =?us-ascii?Q?NAkp/AvyknXeYT3Q+XrxcPoAov/ZVDrAIEwH/jMoH4gk4i/hqA/fAZG9tB+C?=
 =?us-ascii?Q?5Om41EX21aJZ3bKlZWgNBzHHWcudjLRhO4+lJKwrfLmAp6PsOQfM4hgTty9l?=
 =?us-ascii?Q?OdW6E/iyj87uDQ9pLVSxnqpsyElDZEe+NtQ913UiKDrq2HwJqKSyEcB6KM5X?=
 =?us-ascii?Q?eDGcW08CgwFDge2khWGb9pxmjp0OIRiVJaMzBbdb74VaHI8usXJbdkBDXZQ7?=
 =?us-ascii?Q?VkPbi0XGUrFqqJvKgE/hO3baz1ZvucwzKL4X6tSaIqqcnxZxwClNOjYEtd7h?=
 =?us-ascii?Q?G36WVqA8kddHoPV/0cwFlmddMaA99eeu+8t12z8OWSeDMYbS4lI7jCKgDK6v?=
 =?us-ascii?Q?s/uJOXJ7d1fzpFU3eA8pYFdm0rpr5hYQUQHcbec35XHiwvH1BIK31HiftYS5?=
 =?us-ascii?Q?n8C2d6+8uLJFeKuEQcGn6mCm86saiNYaclXInpyQQRUad5/gAkLZkiGdaCON?=
 =?us-ascii?Q?gMADOssw3PngS2eTVylUoAuP1RmQBKANVwYJhNFM6+SFp/CvoxblYlWW0ysO?=
 =?us-ascii?Q?dRfFfP1AdJuctEaAYMQfhh/j9pReWlV6I8UAy/WlDL+XClzfgCmrR0r3Rey8?=
 =?us-ascii?Q?rXcThxJL77ZxqIFWlq1brPS6LnyQmQNW3oYZM30uCdJRNkFBI/c5lVC9Zno/?=
 =?us-ascii?Q?SEgSFcrJeLEh2xzuhmNNv8D5kBD5OPBXtuqr2960?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a3369a98-4149-4c33-1a32-08dbbe578070
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 06:12:02.9310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JYJAo6H0RtcmDL7ADqzeBZ/qIAxbtK3bnt1LtRjzFySue/efmXm5e8qsm7liQY3ByGjWqC88fywWbaaUJEOz8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4767
X-OriginatorOrg: intel.com

not_report

Cannot understand. The code clearly shows that enum 'SNPS_DQ_32' and 'SNPS_=
DQ_64' are defined.

237 /**
 238  * enum snps_dq_width - SDRAM DQ bus width (ECC capable).
 239  * SNPS_DQ_32:  32-bit memory data width.
 240  * SNPS_DQ_64:  64-bit memory data width.
 241  */
 242 enum snps_dq_width {
 243         SNPS_DQ_32 =3D 2,
 244         SNPS_DQ_64 =3D 3,
 245 };

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, September 24, 2023 11:56
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [PATCH v4 05/18] EDAC/synopsys: Add DDRC basic parameters infr=
astructure

::::::=20
:::::: Manual check reason: "git am base is a link in commit message"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230920192806.29960-6-fancer.lancer@gmail.com>
References: <20230920192806.29960-6-fancer.lancer@gmail.com>
TO: Serge Semin <fancer.lancer@gmail.com>
TO: Michal Simek <monstr@monstr.eu>
TO: Alexander Stein <alexander.stein@ew.tq-group.com>
TO: Borislav Petkov <bp@alien8.de>
TO: Tony Luck <tony.luck@intel.com>
TO: James Morse <james.morse@arm.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Robert Richter <rric@kernel.org>
CC: Serge Semin <fancer.lancer@gmail.com>
CC: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
CC: Dinh Nguyen <dinguyen@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-edac@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Serge,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ras/edac-for-next]
[also build test WARNING on linus/master v6.6-rc2 next-20230921]
[cannot apply to xilinx-xlnx/master bp/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Serge-Semin/EDAC-syn=
opsys-Convert-sysfs-nodes-to-debugfs-ones/20230921-035302
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git edac-fo=
r-next
patch link:    https://lore.kernel.org/r/20230920192806.29960-6-fancer.lanc=
er%40gmail.com
patch subject: [PATCH v4 05/18] EDAC/synopsys: Add DDRC basic parameters in=
frastructure
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-003-20230924 (https://download.01.org/0day-ci/arch=
ive/20230924/202309241117.1QIu7Ipb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20230924/202309241117.1QIu7Ipb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309241117.1QIu7Ipb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/edac/synopsys_edac.c:224: warning: Enum value 'SNPS_DQ_32' not d=
escribed in enum 'snps_dq_width'
>> drivers/edac/synopsys_edac.c:224: warning: Enum value 'SNPS_DQ_64' not d=
escribed in enum 'snps_dq_width'


vim +224 drivers/edac/synopsys_edac.c

c85ef1323d2330 Serge Semin 2023-09-20  215 =20
9e617225f1d8ba Serge Semin 2023-09-20  216  /**
9e617225f1d8ba Serge Semin 2023-09-20  217   * enum snps_dq_width - SDRAM D=
Q bus width (ECC capable).
9e617225f1d8ba Serge Semin 2023-09-20  218   * SNPS_DQ_32:	32-bit memory da=
ta width.
9e617225f1d8ba Serge Semin 2023-09-20  219   * SNPS_DQ_64:	64-bit memory da=
ta width.
9e617225f1d8ba Serge Semin 2023-09-20  220   */
9e617225f1d8ba Serge Semin 2023-09-20  221  enum snps_dq_width {
9e617225f1d8ba Serge Semin 2023-09-20  222  	SNPS_DQ_32 =3D 2,
9e617225f1d8ba Serge Semin 2023-09-20  223  	SNPS_DQ_64 =3D 3,
9e617225f1d8ba Serge Semin 2023-09-20 @224  };
9e617225f1d8ba Serge Semin 2023-09-20  225 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

