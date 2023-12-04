Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0E210EA
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 02:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/Tx1017"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701656461; x=1733192461;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=MDmtjweCWlJv+9PqLTRomz4Oqo2lAgavYLqab4w8PQc=;
  b=C/Tx10174T+APlwXK0vPj8qIDweTGjC5XsK4S8G64HPrNsI73shqvox3
   KB358zf2pgLCjRBg2GIBUkUpeZCoqV5TCzaKzX/I3Zy6RCRFfrScwQFPA
   dYngzNwAPn4iGkBwpvxxumuzHEGxw6+VKKEwMw9y5vVnJh36kxqAxzS3m
   e1/jL76GES1kiZMtasuA1yHdNGW53N8TLvHPTeyDMDCr6dPqfVG7G3lDS
   VR0+hivKJKikKgFAcxFHDtdgzq0PHydxxCLpwyElxRZnwKBDG/SRbgx4m
   yj0zUIo60kL1JztxfnzV9LK105KGgpq8lsKPrFJLht8un9f8xCpUMSjx0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="373108107"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="373108107"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 18:21:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="1017684687"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="1017684687"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2023 18:21:00 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:21:00 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:20:59 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 3 Dec 2023 18:20:59 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 3 Dec 2023 18:20:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xhjzy+tdEcCymmRB4l0a+a9obCCltQlkZBSO6T6z9dwwgI9DmNgKxu/R0Odui8DH+ufViX4nMyyreJGY+S81etUa2jrp5Vu/zhhNQVebBEtllLCeQD5k1nViwNErUcTJ+Zgnbue3rzwrERlBFXJ38xtoob/NGStf3NCe6boZMI+I/rATEMPSqLYfm+sokq8sCj4VUyDGJaimHxE9LHxwAQNvYPZGjDY9M6N4ygRx45DmaZCCkKzfxrB1GQUeukq0EdXq9PUnBTIgEQODY6mDSww8CowMFHbTLcrKX8t0V7hTbFi/mkurroxiiv0sRhRl5N5Q+jMFtLiACk7rl+0n8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJ8hT+jSLB/xaOfeuwaOFddQ2CtVovwKEboye/EWlY0=;
 b=kiynS1KJWC5AtC8IS6vtM83os5VkECI9ZtAmtoQ7FtwgVEbZ0ebv59827wEcTVobNv0hm9xx63X0G26UzCc2Acm4HTK8RQ1fBp01qQbPJ1c2Ju0AGnG97MgXZleRP1d2FCjtALi7eVaTSMb6K16YoK2wtijlv0rWnkeh8jIzG3CVA9HTIZdkzmyDjyPo2rDuBpf4LI53uoqERqZCbKQmZjsGX+14uyZZA2PYFXfegidWhP9pdMyyKG9FKgU2IM/WW8VDaGmjUuyvccU31l5QbMhfasLCGz/bjtFb6QImfv9YNhdJsSYfnKNIrMyAT3HM3/knjD/NVruB79lsbaYLxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 02:20:36 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Mon, 4 Dec 2023
 02:20:36 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: include/linux/phy.h:177:20: warning: '%02x' directive output may
 be truncated writing between 2 and 8 bytes into a region of size between 0
 and 60
Thread-Topic: include/linux/phy.h:177:20: warning: '%02x' directive output may
 be truncated writing between 2 and 8 bytes into a region of size between 0
 and 60
Thread-Index: AQHaJbKroz4Pq+eqDkyuvszQ3XgHR7CYZWrg
Date: Mon, 4 Dec 2023 02:20:36 +0000
Message-ID: <CY5PR11MB6392A2A2D7D7472309D281E0FB86A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312030750.8gvEYmTS-lkp@intel.com>
In-Reply-To: <202312030750.8gvEYmTS-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|PH7PR11MB6932:EE_
x-ms-office365-filtering-correlation-id: 47e5f0ef-d6c3-498f-b391-08dbf46f99f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZrrpxsIqMSNyw7MUhheu1DI5WYGA8zZ8Dui1J6cTB/2pcw0BXQOOAlz6He2bE1Zs9sdigmbX3uZpLZomQzXXB2BQXRqEiOEGfszASep8OZc03JRu8MvFLFFuKIsYLySXuqJUm3PGE3t4RFSJCULVsxQXByRO0j23gurg6SkAhBdbIwq+oDvSuiltLH8DuT+5LeCq4hxGDYEXe56qr09p4RcrOJBSuUBeErynzJPFl9ZLukGeHP/w3NOzOjT4/9g0mseAaXqhmsMAaP1rINbXdQZ4a8g/jYqls/cG2j+u7tYPugcA05PixEq3EnXjov4BA1j8fAizuvVto6ImO3ZwgVRG/F6wVaPi1lCPmR53PGPaCePeIufyYdtwBEozGtdzabvPaY+iMq+9g2itld8pnnBgCYZ7GiaGCxDuspQartBHGFEuFQSnTxQQ3SHFumEZnbL1h8bWBFSvjeqqPnvA6BA9nF69OdhZHsF4bUEGXI7wD1Ut+AeaSu7F4ucwLf8HchTvdRFIE/wbY8iCyfRJsjAzduvRSgE4WwiIajCMmU4TumNxsbxptClAfJYBo3WbN44FWt8zaamsPOo1k+BPIsuspe4E/NxETFpPSlPs28eA/+vL7hEGS5YgKTmtIFN3tXQoVdE9WI++8aUeIH+4rO2S22i8vQiCDiAlLubII+mk3Gj09hl0Ge5XJdsltGKd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(346002)(396003)(136003)(230173577357003)(230273577357003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(66476007)(66946007)(66556008)(66446008)(64756008)(76116006)(316002)(110136005)(83380400001)(38100700002)(8936002)(8676002)(52536014)(33656002)(5660300002)(86362001)(122000001)(2906002)(38070700009)(41300700001)(55016003)(82960400001)(478600001)(26005)(53546011)(6506007)(71200400001)(9686003)(7696005)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BKItZLupXpmJlIWG4A32ZQ4F4FWIN55yro4MEHpdKkb+xK7fYmBqrCw0LDd2?=
 =?us-ascii?Q?PVySVlxUFdAnMwmg5dsBQR1Og1fHnJ6BZk7E6IBK20PsvpYUxj8HhqSEaioo?=
 =?us-ascii?Q?nSiUrnkknTgvMIvuN3KenqDhIHYHog5XjIdnWQ7NnvB6cf2+5iEs/tITdLUN?=
 =?us-ascii?Q?T/dcdLeQhspOn1hW8s4ilATlSL11ocY6CBFFDFJW9tdXtrrxBtFVUymTE9PB?=
 =?us-ascii?Q?oHpDZCH2Cm/BYnOGBwqTjdjW7k+gd7TT4RwMesTu+63JefU5+Ylcjd40mVWb?=
 =?us-ascii?Q?2v30MGCevNJ5XFfS+5CwuU2MQng4eo9Z4hVewZKPVxyAnrGo/1ua5FM303MF?=
 =?us-ascii?Q?gyD+aRHOFZbmN2mYQlccSpyJQEImCMJtnBVAN+/5LonxiiJwN/2lvUy1XsrP?=
 =?us-ascii?Q?d79nelcVWbB++amfQoqaIlmv9wQepQOH25WXTmmugTykOKmTosz/V9gwfmE7?=
 =?us-ascii?Q?01Rj/wqkx7LMvf6YuyT6aN8HweXn5rkMEyZqWvThbReK11+M58Yzi0qGGcvk?=
 =?us-ascii?Q?PlDm6SkmxTxeWv5qlYezeAPrXczDlMI7RkDpLwLto71mAMapUI6ABWCsHa8Q?=
 =?us-ascii?Q?8tyL2SuAk4IB8WqfCjTQcuNZcuvpnCIsLMpp59q6I+xM8R3Lqn55aQ+ZRj10?=
 =?us-ascii?Q?FDIdBzBRh3Ac5IsaNrOqweQZg+tUd0LmZJMxhH+XVKaavFHf/TbeJ2uVBU+u?=
 =?us-ascii?Q?IkyjDVPRmW2V60kNxNJEKJcbTNXEx05sXbe6227PBB78ijpP4uyMcNjaVR/r?=
 =?us-ascii?Q?mpWcxoSvWl3tp+hBboNSjC45xEmgC8sUxDGadxRWvGY67vIfW1KXJbKtQF3F?=
 =?us-ascii?Q?izPglAxcGu1slNuCox7uYLX/S9yILEAnmMvvUbVU4HSyFrN2BqiJId7mULPw?=
 =?us-ascii?Q?p9SGcxHjklPJUpG7l5KhhRL6tf0Nn/XhxV+KVe6ordVs/pFunA7xteFnypL+?=
 =?us-ascii?Q?oRLWl1RtOgiKh2g7aGup4oCFOGgjvjfktnSSAb9GeDffX0dFjg9A1XaZVqpR?=
 =?us-ascii?Q?NeAYAqI5XmddRwWfev9ZcShhmUe2oILB6dXgM3iw+qEPH6huCRzfqNrbaFlv?=
 =?us-ascii?Q?o/olodq3grTfGG3KdBirndhsJHs+8IKnw3+eHGwcpqtKI76m/Dw+mT1gh3KW?=
 =?us-ascii?Q?attrD6/So8yyFYw7DyNN37DLiqDlaf0tjYCKSfiW4S7vyE/pPCvujm/swKo3?=
 =?us-ascii?Q?nUfKvWH7vRDEneIAS2yYBFHRqVg1FZpjVtXe9EHr2hKawcWgKMdVujQKhdga?=
 =?us-ascii?Q?hrYC0nFZQpmQJMYd+O6eRvh2h2MZmS3+DDhGeMyHckF+xnR537UYKJZH+Bea?=
 =?us-ascii?Q?k3h7F+Rma7xZb+Mzj2DdDbo3a+VfFiQmULT8bZMVnakUdYvdUVUTWg4yfL/2?=
 =?us-ascii?Q?aJSHGQnl80VqG6fv7fy3rPv1c4m5OXh1S+HBpkCU1Cr7wwVdpDk8AbhttXAL?=
 =?us-ascii?Q?9Cx9sBq8HLFlecpD/Z+GrqgR34FYJH+qUO/iUyaQvSdzcqzpbu7ckMfcYLJq?=
 =?us-ascii?Q?oPiNs57fBf48jH6fDptSryzkL90CJ9i11niI/9JbpzkokGNAyg1f1i3j06D7?=
 =?us-ascii?Q?OScuW6osEXQC5ZY27PgMJfwXk4rjWO3TnYJUSjki?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e5f0ef-d6c3-498f-b391-08dbf46f99f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 02:20:36.4063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HB1My/rgP+nBOuWfpwuoVTSuMDQdozoyuQWfovoNNCkVG2+j0ncnLRt3cJH0NHhFkrUQPUjA6pfnXYpO1MGWbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
X-OriginatorOrg: intel.com

not_report

only kconfig change:

drivers/net/ethernet/broadcom/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, December 3, 2023 14:32
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: include/linux/phy.h:177:20: warning: '%02x' directive output may b=
e truncated writing between 2 and 8 bytes into a region of size between 0 a=
nd 60

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Florian Fainelli <f.fainelli@gmail.com>

Hi Florian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: 7f7b7574555e2189135098885208821d0acd4850 net: ethernet: broadcom: D=
rop dependency on OF
date:   5 years ago
:::::: branch date: 23 hours ago
:::::: commit date: 5 years ago
config: x86_64-randconfig-161-20230927 (https://download.01.org/0day-ci/arc=
hive/20231203/202312030750.8gvEYmTS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231203/202312030750.8gvEYmTS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312030750.8gvEYmTS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/broadcom/genet/bcmmii.c:20:
   drivers/net/ethernet/broadcom/genet/bcmmii.c: In function 'bcmgenet_mii_=
pd_init':
>> include/linux/phy.h:177:20: warning: '%02x' directive output may be trun=
cated writing between 2 and 8 bytes into a region of size between 0 and 60 =
[-Wformat-truncation=3D]
     177 | #define PHY_ID_FMT "%s:%02x"
         |                    ^~~~~~~~~
   drivers/net/ethernet/broadcom/genet/bcmmii.c:495:53: note: in expansion =
of macro 'PHY_ID_FMT'
     495 |                 snprintf(phy_name, MII_BUS_ID_SIZE, PHY_ID_FMT,
         |                                                     ^~~~~~~~~~
   include/linux/phy.h:177:24: note: format string is defined here
     177 | #define PHY_ID_FMT "%s:%02x"
         |                        ^~~~
   include/linux/phy.h:177:20: note: using the range [0, 4294967295] for di=
rective argument
     177 | #define PHY_ID_FMT "%s:%02x"
         |                    ^~~~~~~~~
   drivers/net/ethernet/broadcom/genet/bcmmii.c:495:53: note: in expansion =
of macro 'PHY_ID_FMT'
     495 |                 snprintf(phy_name, MII_BUS_ID_SIZE, PHY_ID_FMT,
         |                                                     ^~~~~~~~~~
   drivers/net/ethernet/broadcom/genet/bcmmii.c:495:17: note: 'snprintf' ou=
tput between 4 and 70 bytes into a destination of size 61
     495 |                 snprintf(phy_name, MII_BUS_ID_SIZE, PHY_ID_FMT,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     496 |                          mdio_bus_id, pd->phy_address);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/genet/bcmmii.o: warning: objtool: bcmgenet=
_mii_register()+0x3f9: sibling call from callable instruction with modified=
 stack frame
   drivers/net/ethernet/broadcom/genet/bcmmii.o: warning: objtool: bcmgenet=
_mii_pd_init()+0x1b3: sibling call from callable instruction with modified =
stack frame
   drivers/net/ethernet/broadcom/genet/bcmmii.o: warning: objtool: bcmgenet=
_mii_config()+0xca: sibling call from callable instruction with modified st=
ack frame
   drivers/net/ethernet/broadcom/genet/bcmmii.o: warning: objtool: bcmgenet=
_mii_probe()+0x242: sibling call from callable instruction with modified st=
ack frame

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BACKLIGHT_CLASS_DEVICE
   Depends on [n]: HAS_IOMEM [=3Dy] && BACKLIGHT_LCD_SUPPORT [=3Dn]
   Selected by [y]:
   - SAMSUNG_Q10 [=3Dy] && X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy] && ACP=
I [=3Dy]
   Selected by [m]:
   - ACPI_CMPC [=3Dm] && X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy] && ACPI =
[=3Dy] && INPUT [=3Dy] && (RFKILL [=3Dy] || RFKILL [=3Dy]=3Dn)


vim +177 include/linux/phy.h

00db8189d984d6 Andy Fleming 2005-07-30  175 =20
a4d00f179fcec7 Kumar Gala   2006-01-11  176  /* Used when trying to connect=
 to a specific phy (mii bus id:phy device id) */
9d9326d3bc0ea9 Andy Fleming 2008-04-09 @177  #define PHY_ID_FMT "%s:%02x"
9d9326d3bc0ea9 Andy Fleming 2008-04-09  178 =20

:::::: The code at line 177 was first introduced by commit
:::::: 9d9326d3bc0ea9a8bbe40bf3e5e66c7b9858caa0 phy: Change mii_bus id fiel=
d to a string

:::::: TO: Andy Fleming <afleming@freescale.com>
:::::: CC: Jeff Garzik <jgarzik@redhat.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

