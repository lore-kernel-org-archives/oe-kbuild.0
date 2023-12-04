Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8637010EA
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 02:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SiHG1iGT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701656200; x=1733192200;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ZTSuaAubfE+kFFOpReEMl14RACCIxiihz2nnW4PWVFM=;
  b=SiHG1iGT7Ff8AykvYOhe4ValcY/TFvF7QGjXLUFzR4jzT9KKX51LNHYj
   1T7KBQRgQ/7g/cfsb6LN7cs9C8wMIMyp8e74O4LdyumzZBc7DhrabVhvY
   4xfKtf0puJHgVUoGRFaTH3zq1SRNn3HNuuwZMLAhrNVCiBgyZriF4ytlN
   V56qAbMemvXZMtwSyifWwihshsc60O857PSFLOV1Qux6YJydMGkOQhPPS
   GAyySGmYj2bctZMdEPmpNlXICtrVJeozF7x3Ojlm/fTf6LvjNHwEX/L21
   vLoXmVfZVHq4tFA17uA6VQRAqTwqm3qdMs0YYRy6ODQR28pO0lcAuK3WD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="373107863"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="373107863"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 18:16:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="1017683775"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="1017683775"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2023 18:16:39 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:16:38 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 3 Dec 2023 18:16:38 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 3 Dec 2023 18:16:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jgw7wR2GmUWDro030mNyQFvlB39UOHnA2X07ykdtA5gVjr66EXvBuMrs7CnBLbvyVhapSE+mux9l4HWBvwzwdHRyzd0KfDjcNDtL7yZWFqF43saK5oAP9zQhpxF4VEzctsuhhQL6ba//ZDVzzCDX4onp16rOs906GJgXnrcwo6sAQc4kNGFtf0iEE+2jgxxPdGa0k1lZAzwhvY64UABB2r8sfrdP+/oobnTvRff8TAuf/2+CmCV2jFRYFJvJxSWI64wrKc5NHv/EEKPjTALKkdKRwCNHWliOKUiOhatZAUzZK8G+oER6pOiB5TRgmCl1Z0dM+0UmjiYQVpj5n6DuYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvVicFSxQjkmVBEjgVh7MujJhsSv27w2nxIZd/lDr1w=;
 b=KJLAWTLrrYUi52TYykUv/EDt90xBWfdlqdFJG5jOxBTjO14b51YM57VXB7e2sS3hUZaCTqroi4GgUZuXp7ID6geKmbVA8DD7u6Bs5isvaGj89+BOFYzK8HZWxsQnEZ0NrB0bJM7RPbQHIGYtqymNlTih1gvPjjXeaq3yjJjQYB164bLlP9bNFN8pPSe2edgmMFuZJfSzLz+cTVSGmYCJOkgeFTJq+aWBiuV8DpBSgfSN4cS8VGFHKWGkQatl6ONT3Ti5VF+qN6eyrizy5uzFJA8ZS/qufqGsXp1tLa74SfzZTPL5oxxmOmWsJx2bL3LbmxH9c3f11e1BcUIZyRmVcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DM6PR11MB4513.namprd11.prod.outlook.com (2603:10b6:5:2a2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 02:16:30 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Mon, 4 Dec 2023
 02:16:30 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: arch/mips/loongson2ef/lemote-2f/pm.c:32:undefined reference to
 `i8042_command'
Thread-Topic: arch/mips/loongson2ef/lemote-2f/pm.c:32:undefined reference to
 `i8042_command'
Thread-Index: AQHaJcPZRxObaWjmSEmoy5Aut9gKQrCYZDKg
Date: Mon, 4 Dec 2023 02:16:30 +0000
Message-ID: <CY5PR11MB6392ECE5B314013AE705414CFB86A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312031528.uWlbRPTK-lkp@intel.com>
In-Reply-To: <202312031528.uWlbRPTK-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|DM6PR11MB4513:EE_
x-ms-office365-filtering-correlation-id: c511ce35-387a-4d99-f7ac-08dbf46f074d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bOnayVzHg/vsbzQdigR41pOcY00hROLrsALTrSLPiQ8s4hssKrbOJ0p4c6odTw5jw8kZINedv4aFQbbynzHJIAh4lmncoMXCdRELUMcuGhvtOdeqW26SJVGnN3RQU5KsDNyL3DYC8Jy5X8jFk/mq/xVHLs+E7+Lzm2UGC8CYdiJTDpOh/SY1OowqZOyYjQerLghBrpY0w+MTYaehfqwNjtBiKokibwPEM62enAUiLnXOFpNVbKoIMbpSHASo+ozke1y950IcL1Y45puYG4ZDKTqLzkTTMXaJe5+IM9/juB6rDpLNzDZKacyvIs2p6bIjH7AP9TiRAStOH3wtl9ywqzz/iFETYVsyKzSP3iBJNg+ue8dsXkNBtpvFod8MkCXIIH3FtHIOPkRiJ6ROgegvKXs5GR+H6B2gOw/QRRvuJDl4HFL3jS1FMPHKrDHSfkajSnaFj4tgikrP502opa3nQZTMGS2OFaFmaA7O6Ay02019Hu2GINYNtVV4gvMv0zUYTpfxsD6qsrt+nFEr4+B+lWSqhHJhHPUdjvrb9vBqBrB1sNTm3sT3mgdTmpqy+cCSIUJD4eWwaZBGRq5CUbj9MlwrKnxYR2E4BWId/ZfWAx7u9urU+VZoPMTwdNaIrzLOYDGhh1U9ZLrwDQbMJC7RbUoc3Ix+NlRbNe5Ax6fzNv0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(346002)(396003)(39860400002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(5660300002)(2906002)(86362001)(52536014)(41300700001)(33656002)(38070700009)(122000001)(53546011)(6506007)(7696005)(71200400001)(55016003)(26005)(9686003)(83380400001)(966005)(82960400001)(478600001)(8936002)(8676002)(38100700002)(316002)(76116006)(64756008)(110136005)(66446008)(66476007)(66556008)(66946007)(81973001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Wdn/0IFQTO51R96ZbkM/S/FSdSKMdw0HGX/x5yiZP2rLrkyDZMvNHOzjDVw3?=
 =?us-ascii?Q?uGmmvyA3iswggsxZEgooQrCEmNINqCbSauaNRbb3eBu8w9cGlyKrBCmjs89k?=
 =?us-ascii?Q?7Pv8AY1CIEX+MCl4mO+nCOKdcqjgTXzQdd2yjIdaSzenPPBomh/YtzFogSDK?=
 =?us-ascii?Q?q7+r9WP6JkEAi5e3qwJoLXCQO7djr0BT9qzvY1BsbNA23dG1rpDBzCQpeoIt?=
 =?us-ascii?Q?uH1gn2ye/4vmyl2SXFIxadr9rZfDVw3LB4Hbm2atoJWBNnev6mbfVZnUYGO+?=
 =?us-ascii?Q?b2RVH/b/OSgYdJnbVEn93CyDpoQpkNqS//aDfk4PelkHVSibgK5YiSj6h3cE?=
 =?us-ascii?Q?pbov2FHJdTNw8RU3Jwl/nfHDPmn2omj8S7g4Sit+XOw+gQ9B4QVrGl8p1dh+?=
 =?us-ascii?Q?BCFBD+StNqq1hj0YA2fWzZW9o4CyTuKgGqor44e2DAoCf2ppgrnfHpw548D9?=
 =?us-ascii?Q?Neu2L6lKjtwhbZv88L7dSh2tUl0EAInvexcZysC5YF8iinEsLaitnt84bMZ2?=
 =?us-ascii?Q?mmOHn3nT/8yWm6sv3lr1hZvNh6Up/io5SRD12sTPwnoK7cBvemaHNRS+ZRHK?=
 =?us-ascii?Q?0jNveVmy29B7hXEAbMEGjkfg/TfEXkgUqtmhcy1McHKPtV5NeZCtalsjZ7tX?=
 =?us-ascii?Q?tMUi5ngS64jcdhJUdEkOWN2mJQS1tJcOOMcrcA3YCUBxMELwLSxKCnXduA5Q?=
 =?us-ascii?Q?HyidNuGvU4ppby5uNa+3ZYjl0c148/8zZRdo38ryr9shm92b8jr4uPG0UlEB?=
 =?us-ascii?Q?uuiBMlub6forrWGckYr2JOvU03kvjjNcMBTgZss3F+HZvNA6uaS9BpiFdsrD?=
 =?us-ascii?Q?DR98IyL+G7F0BQiDeDaUMD2De1Fquir5JNnvwX+EbRuoe/LmhjIMZfykZk6D?=
 =?us-ascii?Q?rVeYth86I19jJKq0xZH3+ZcJaGUqdP9GKQsCs1udMU6xcQhTVNFt0P44GsiF?=
 =?us-ascii?Q?cxFzeSjcofZcRETVWTVl7Lxf0l68qllnTpco0M19ik2WYt05DDE4UiAvQt5/?=
 =?us-ascii?Q?KjOCy4VpbbFxE6avzMMwfTRniULQZx015HaeBdrvVIwsbLb/kXxT70n+w3KQ?=
 =?us-ascii?Q?KAOIAUC6NAtARWp0/vTq7m41KuGWyhbUAXs0mBdOWcD5GD+zOAqp5u9yKHlD?=
 =?us-ascii?Q?CJhFcVqoVzFaxUbCDklLgdio28TpLsFBL/SvMe0/ZpH7lp45cNH7Iq7oU6F4?=
 =?us-ascii?Q?vF3ukNoFtCI5NAhuOzmU/rYRRKQHvBWfgPUWebWy/l7QFIdNtgS9Jp17AIvh?=
 =?us-ascii?Q?FOVlrg/SDdi+1YV9P5WmrigzgWjvDI3h3hzF48IWBqKZIU2/38BY+IaB83EA?=
 =?us-ascii?Q?YzHy/oo5yhafHyBWnEDppTYvdfanU6s7g6iCOcQ3hQ88P5LxL7VRt0y8ZINZ?=
 =?us-ascii?Q?FzjxOYmOjn3kKD9HSq8kkoTIhQG4HFCIcNf49mB5MOXah6cxHY3+90Az1FoK?=
 =?us-ascii?Q?yZQbOqki/DUjVUOuaAONHhwL+US1ZA3Fgb2/8jw+/Oe0doslxONxHtwxa63w?=
 =?us-ascii?Q?zZxMm3fnO266Px2mwUGjeis6XYoqWxjUGnC1ZeTIiWxjGJ5GcGvpEA3PSNQN?=
 =?us-ascii?Q?GK7UIHcTqW48cr0qXvTTYOpi0QUTrwreEpXVaDle?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c511ce35-387a-4d99-f7ac-08dbf46f074d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 02:16:30.3633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Yhq4akLKBFIZV8JdKjZa5Kfld1aSBBSghAvXoVpWVLbU5c4xNZbIWkV4UDb3if3cJY0rOQcN4QVQqoLu11cCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4513
X-OriginatorOrg: intel.com

not_report

only kconfig change:

lib/Kconfig.debug | 139 +++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++-------------------------------------------------------=
-------
 1 file changed, 74 insertions(+), 65 deletions(-)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, December 3, 2023 16:35
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: arch/mips/loongson2ef/lemote-2f/pm.c:32:undefined reference to `i8=
042_command'

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   968f35f4ab1c0966ceb39af3c89f2e24afedf878
commit: f9b3cd24578401e7a392974b3353277286e49cee Kconfig.debug: make DEBUG_=
INFO selectable from a choice
date:   1 year, 8 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 1 year, 8 months ago
config: mips-randconfig-r021-20220102 (https://download.01.org/0day-ci/arch=
ive/20231203/202312031528.uWlbRPTK-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231203/202312031528.uWlbRPTK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312031528.uWlbRPTK-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips64el-linux-ld: arch/mips/loongson2ef/lemote-2f/pm.o: in function `i8=
042_enable_kbd_port':
>> arch/mips/loongson2ef/lemote-2f/pm.c:32:(.text+0xe0): undefined referenc=
e to `i8042_command'
>> mips64el-linux-ld: arch/mips/loongson2ef/lemote-2f/pm.c:41:(.text+0x100)=
: undefined reference to `i8042_command'


vim +32 arch/mips/loongson2ef/lemote-2f/pm.c

a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  29=
 =20
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  30=
  static int i8042_enable_kbd_port(void)
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  31=
  {
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11 @32=
  	if (i8042_command(&i8042_ctr, I8042_CMD_CTL_RCTR)) {
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  33=
  		pr_err("i8042.c: Can't read CTR while enabling i8042 kbd port."
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  34=
  		       "\n");
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  35=
  		return -EIO;
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  36=
  	}
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  37=
 =20
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  38=
  	i8042_ctr &=3D ~I8042_CTR_KBDDIS;
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  39=
  	i8042_ctr |=3D I8042_CTR_KBDINT;
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  40=
 =20
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11 @41=
  	if (i8042_command(&i8042_ctr, I8042_CMD_CTL_WCTR)) {
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  42=
  		i8042_ctr &=3D ~I8042_CTR_KBDINT;
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  43=
  		i8042_ctr |=3D I8042_CTR_KBDDIS;
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  44=
  		pr_err("i8042.c: Failed to enable KBD port.\n");
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  45=
 =20
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  46=
  		return -EIO;
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  47=
  	}
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  48=
 =20
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  49=
  	return 0;
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  50=
  }
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  51=
 =20

:::::: The code at line 32 was first introduced by commit
:::::: a9e8641f4c252f93875cf30cb28c0f333539f0bf MIPS: Yeeloong 2F: Add boar=
d specific suspend support

:::::: TO: Wu Zhangjin <wuzhangjin@gmail.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

